Return-Path: <SRS0=HRsY=UM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D24C31E49
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2019 23:38:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7E7021721
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2019 23:38:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T3E6dp9v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7E7021721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bn988yR4lnWvXBQ8QhQ+ImyBOB5CbH5JKPf9x4mJ+vQ=; b=T3E6dp9vkGP76FAPN9hR5OyTA
	ecv85fPQfyj+UgvjwUwxPL9L2vb35AdMF2ZZ9WR66CFmg7i8PLdUIqh3kMlS3WTma+/zMedyWITMU
	PF90AQN21uchUJwvh+FX8ryf+SeMUtHq5W90IXW7XmVInJJoUJA8lQXKLx0DTgwGwAj9fdgBcICRi
	orc/hVi3tuq7PQrRsbkO1//CdBUydovangMpkgVKQ43hxVDiZpMOvuqP9UJF5F7Kf6yVEahbnBHjk
	o/yVvNVGRLniZbg1LC2HZuHc2xRsGpyUTp6PmQF2Rak+BzBkk5dHauco/B126eiQVoHlHgYHfGvmV
	NvC7Oam7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbZIS-0003AO-2W; Thu, 13 Jun 2019 23:38:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbZIJ-00033I-E1; Thu, 13 Jun 2019 23:38:12 +0000
Received: from [10.44.0.22] (unknown [103.48.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32C802133D;
 Thu, 13 Jun 2019 23:38:08 +0000 (UTC)
Subject: Re: binfmt_flat cleanups and RISC-V support v2
To: Christoph Hellwig <hch@lst.de>
References: <20190613070903.17214-1-hch@lst.de>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <9a7c0892-21f3-23fb-590d-011d66f97320@linux-m68k.org>
Date: Fri, 14 Jun 2019 09:38:06 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613070903.17214-1-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_163811_491439_3E74CAE2 
X-CRM114-Status: GOOD (  11.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Christoph,

On 13/6/19 5:08 pm, Christoph Hellwig wrote:
> below is a larger stash of cleanups for the binfmt_misc code,
> preparing for the last patch that now trivially adds RISC-V
> support, which will be used for the RISC-V nommu series I am
> about to post.
> 
> Changes since v2:
>   - fix the handling of old format flags
>   - don't pass arguments on stack for RISC-V
>   - small cleanups for flat_v2_reloc_t

Thanks for doing this work. Tested and works for me on
m68k/Coldfire too.

I have pushed these onto the for-next branch of the
m68knommu git tree.

Regards
Greg



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
