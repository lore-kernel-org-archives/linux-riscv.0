Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCB5CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 13:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IRuQvHxEQsLoKeER58j5ty+4hLGta5Rn6TpaeCXR9q4=; b=OaImo5eYFvYAgt
	wEoX5aQz+AXI75vhzaxMJ5SOeK78l0b5Nd05Ens5v9eFeTk19hMHscY3rgTpFkjjBQymkDvn8ILdL
	rJFqN6ePQUgBNR9DfwC9QQYMo4Gi9anZYjwgQsjT09nlEUh3uu4H3jagCCeeuljBJtJQ5sLpvK8Uo
	s2zX3YZjZzAhQ+tqI8nPmtmFy4soV/+l9VdmvxgZzKW5pA9dqq5353mtMue+NSfbmBPQO6k3Gb7Qr
	7jDB6WmB2C/9jbQvorbJ9xHTEUAHgtj6ry9vFp5f8FrTJ2PjB0k2pEqdkDj+L4VZXRFYsiwtGqb3j
	PyAb2zWgFytRhJMYYPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSmb-00HUSA-32;
	Thu, 19 Oct 2023 13:09:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSmY-00HUR5-34
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 13:09:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 57C8FB82887;
	Thu, 19 Oct 2023 13:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA301C433C8;
	Thu, 19 Oct 2023 13:09:40 +0000 (UTC)
Message-ID: <280c1e25-1848-4369-9d1b-7641d3e954b0@linux-m68k.org>
Date: Thu, 19 Oct 2023 23:09:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: fix the non-coherent coldfire dma_alloc_coherent v2
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Jim Quinlan <james.quinlan@broadcom.com>
References: <20231016054755.915155-1-hch@lst.de>
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20231016054755.915155-1-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_060947_142903_6B77A870 
X-CRM114-Status: GOOD (  16.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Christoph,

On 16/10/23 15:47, Christoph Hellwig wrote:
> Hi all,
> 
> this is the next attempt to not return memory that is not DMA coherent
> on coldfire/m68knommu.  The last one needed more fixups in the fec
> driver, which this versions includes.  On top of that I've also added
> a few more cleanups to the core DMA allocation code.
> 
> Jim: any work to support the set_uncached and remap method for arm32
> should probably be based on this, and patch 3 should make that
> selection a little easier.
> 
> Changes since v1:
>   - sort out the dependency mess in RISCV
>   - don't even built non-coherent DMA support for coldfire cores without
>     data caches
>   - apply the fec workarounds to all coldfire platforms with data caches
>   - add a trivial cleanup for m68k dma.c

This looks good to me for the ColdFire changes. I tested it on a 5208
(version 2 core) with all combinations of cache (instruction only,
data only and both) and it worked good in all cases - with the one
configuration fix to patch 9 I sent earlier. So for ColdFire:

Tested-by: Greg Ungerer <gerg@linux-m68k.org>
Reviewed-by: Greg Ungerer <gerg@linux-m68k.org>

I don't have a 532x ColdFire board, so I can't directly test the case
of a version 3 core with the FEC hardware block.

Regards
Greg


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
