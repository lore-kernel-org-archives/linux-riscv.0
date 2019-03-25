Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E973C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 14:59:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACC112082C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 14:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ao3IvYTJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACC112082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vCjoLnuettUKAzhEusYEI10axcnTxQL2gn9MpkPTMuQ=; b=ao3IvYTJoJZ/WX
	BeK3mse2IWEvgcz9KFEbChkAujui0m7/lJTRhGhoqHyiJknuNXOieV/aR1ZIR0HWQB5QZiMBNK+Ec
	tYRS7zdQrirdmTik9qqJJ4k1FDpmTU9rKJc13scTSzZcKu6/oeXhORjtYWZhtGpOuSrOgUFYiBCLy
	+hnmQbduNdyfHvvCutgD3xoN5BcoU7SVYIMzAvYwUjl82KJ7QFFBDJkh76Dv4yLIb3SDOPLCwaEYd
	m9mwlyLmd697szzQnj77wmmxoGQDe6EBRNSbmFs1+m3cDGoJeV0vUic7PSWlHWsyTwdiMbzpuv8ho
	uVBMtqO/9Ji/D0VSDAcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8R4O-0005sy-En; Mon, 25 Mar 2019 14:59:24 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h8R4J-0005rt-V1; Mon, 25 Mar 2019 14:59:19 +0000
Date: Mon, 25 Mar 2019 07:59:19 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v3 4/4] RISC-V: Allow booting kernel from any 4KB aligned
 address
Message-ID: <20190325145919.GB14826@infradead.org>
References: <20190325092234.5451-1-anup.patel@wdc.com>
 <20190325092234.5451-5-anup.patel@wdc.com>
 <20190325113935.GD27843@infradead.org>
 <CAAhSdy2dds7pp8=XX+zbKbMoWbgjPxP6r4aMZJeHyqHV2MP4CQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2dds7pp8=XX+zbKbMoWbgjPxP6r4aMZJeHyqHV2MP4CQ@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 06:18:45PM +0530, Anup Patel wrote:
> We trying to addresses following issues in current code:
> 1. The current setup_vm() maps all possible kernel virtual addresses (128GB
> on 64bit system and 1GB on 32bit system). The amount RAM present on
> real systems might be much less so we should not have kernel mappings for
> non-existent RAM. Of course, we don't know amount of RAM available in
> setup_vm() so we have to split page table setup in two parts and do minimal
> required mapping in setup_vm().

Why do you even care about kernel mappings for non-existant ram.

> 2. NOMMU kernel requires a swapper_pg_dir with identity mapping (VA == PA)

Bullshit.  nommu per defintion does not have page tables, and thus

> 3. For both NOMMU with tiny memory and MMU with tiny memory, the current
> setup_vm() is not allowing us to place kernel on non-2M (or non-4M) aligned
> addressed there by causing memory below kernel to be wasted.

As mentioned a few times - nommu per defintion does not have page
tables, and in my uptodate nommu port none of this code is even compiled
in.  If someone still compiles that code in some codebase that is just
a bug that needs to be fixed.

For MMU with tiny memory is is a theoretical case, but I still haven't
seen a good rationale why we'd care for that case.

> 4. For MMU based kernel, the current setup_vm() is hard-wired for fixed 2M
> mapping size. It will require more changes if we want to do 1G mappings.

And why do we care?  Even if we come up with a good reason for 1G
mappings we'd better find a way to select it at run time and not require
a gazillion of options to select how to map the kernel.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
