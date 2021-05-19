Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A399AC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:54:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D1756135B
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D1756135B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7FlwaPgDuaJR8RMmqZ4VXpcvMAs67bEI9Do9WUeQamY=; b=Y4iT3PbvkrxtOpoDeIA2KY4ao
	gTsLpq8qoolzLQdiulXvPaRLw+yBQHAHvsBNOoDQfzWLnqHkUArXDBsBjpxTIGLDAObfj+ePJ1yoo
	2XWj9butpuHnnSMBJPDrXy4aKkqEhc4bWwDQxXXTqjVT45nJhZnZ1LWHLts3RfPATD3RiPjj9YrfQ
	U/Hy9/80xhTCZnchPw/JCu+DNFCaH3zH/MSmI+d7eGtd/T1JZhT+KmXuKJvF0fhuCrwwHlDG8PXZv
	6Az6nJc5QQDA1ip0lXHF2kQsHodlF0eaCivWamzPYoawNK2EQON7/1PhX9qf2hQN80tjFSjTxAQ15
	r48RyLKXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljG5n-0033vW-P2; Wed, 19 May 2021 06:54:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljG5k-0033ua-Ok
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 06:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mY+vRMeF8lkRaTxvv68JZ8qH/tT60qVcaqdlP8y9OIQ=; b=b5VbUYbYdhh/3eCH7w3EiR4cSC
 VO4W4PLOZdeXDImVRdqO/gtsHoG7ftJXpHJyeWGyh2qpS1Fij87lC9J+Y7GDYf+SIdBuvQv3wGWmm
 nm3nm3wHzGOzGlid0Gsyl7aDy6tTRi/rNJMHLEm19EfS+u/dMUGBeorUYrFZrvIaDRGBQGVBmwStc
 LAKdOdZPM6wsGJSmNMTql8aMtS4qRCfR31d+ZKpZqmXsmnnsY1xTMM+ZB9M7Q1i43sI05gMqG2xvj
 pDFgkcW7G8+rgM9PhX5UMXXG7B1xTOKHgZxyTknQEOxkyyvSK8v1rafrN40VBjtSC8nZERjQRD+C8
 zDZGlHiA==;
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljG5i-00FCFq-18
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 06:54:03 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id C1D4B67373; Wed, 19 May 2021 08:53:52 +0200 (CEST)
Date: Wed, 19 May 2021 08:53:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Drew Fustini <drew@beagleboard.org>
Cc: Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com,
 lazyparser@gmail.com, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
 paul.walmsley@sifive.com, Nick Kossifidis <mick@ics.forth.gr>,
 Benjamin Koch <snowball@c3pb.de>,
 Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210519065352.GA31590@lst.de>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519064435.GA3076809@x1>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_235402_260889_A9790DAA 
X-CRM114-Status: GOOD (  18.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, May 18, 2021 at 11:44:35PM -0700, Drew Fustini wrote:
> This patch series looks like it might be useful for the StarFive JH7100
> [1] [2] too as it has peripherals on a non-coherent interconnect. GMAC,
> USB and SDIO require that the L2 cache must be manually flushed after
> DMA operations if the data is intended to be shared with U74 cores [2].

Not too much, given that the SiFive lineage CPUs have an uncached
window, that is a totally different way to allocate uncached memory.

> There is the RISC-V Cache Management Operation, or CMO, task group [3]
> but I am not sure if that can help the SoC's that have already been
> fabbed like the the D1 and the JH7100.

It does, because unimplemented instructions trap into M-mode, where they
can be emulated.

Or to summarize things.  Non-coherent DMA (and not coherent as title in
this series) requires two things:

 1) allocating chunks of memory that is marked as not cachable
 2) instructions to invalidate and/or writeback cache lines

none of which currently exists in RISV-V.  Hacking vendor specific
cruft into the kernel doesn't scale, as shown perfectly by this
series which requires to hard code vendor specific non-standardized
extensions in a kernel that makes it specific to that implementation.

What we need to do is to standardize a way to do this properly, and then
after that figure out a way to quirk in non-compliant implementations
in a way that does not harm the general kernel.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
