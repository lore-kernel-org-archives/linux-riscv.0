Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F916C2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 12:36:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2191661409
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 12:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2191661409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bjzY/UvIXbRwyzhscZqSbjhm75yq6iY4IGr/1zHLtE=; b=RaEtWPJVxSDoHP
	WJvN8nJo7VqxDPZQ0DemZGV0FUs01HgbVcPKF6k/I2QrprjLCNatfWqE94kd22J7ErHlboNb+9lcs
	izIn0DDAW8ApOXcUz9pMsH0IaWoLZbXmIey057t7WBTNE578wkbkFk1mbpKiT2pV8OZ0kPTu8Sb/Y
	17X9guHzRv3BbyMIHzttF91Bj6Kl2Ky0PyNGlOrTtkTqraZ5YWUOCWDIHEl8jeUGW4vy0mxoFCm4L
	GT9DtwLQiNEvw29/Zy3lWCEyXvfKxNkCM//fdigeij6n5EstP1sAWs3hfh7WIeX+RleZBMKsmzZTX
	u0sktc3Ey/7tkb4NBxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llWHx-0054nn-UG; Tue, 25 May 2021 12:36:01 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llWHv-0054mA-5E
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 12:36:00 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 647BA6736F; Tue, 25 May 2021 14:35:56 +0200 (CEST)
Date: Tue, 25 May 2021 14:35:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, palmerdabbelt@google.com, arnd@arndb.de, hch@lst.de,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V3 2/2] riscv: Use use_asid_allocator flush TLB
Message-ID: <20210525123556.GB4842@lst.de>
References: <1621945447-38820-1-git-send-email-guoren@kernel.org>
 <1621945447-38820-3-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621945447-38820-3-git-send-email-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_053559_405884_CB638C0B 
X-CRM114-Status: GOOD (  15.58  )
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

On Tue, May 25, 2021 at 12:24:07PM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Use static_branch_unlikely(&use_asid_allocator) to keep the origin
> tlb flush style, so it's no effect on the existing machine. Here
> are the optimized functions:
>  - flush_tlb_mm
>  - flush_tlb_page
>  - flush_tlb_range
> 
> All above are based on the below new implement functions:
>  - __sbi_tlb_flush_range_asid
>  - local_flush_tlb_range_asid


This mentiones what functions you're changing, but not what the
substantial change is, and more importantly why you change it.

> +static inline void local_flush_tlb_range_asid(unsigned long start, unsigned long size,
> +					      unsigned long asid)

Crazy long line.  Should be:

static inline void local_flush_tlb_range_asid(unsigned long start,
		unsigned long size, unsigned long asid)

> +{
> +	unsigned long tmp = start & PAGE_MASK;
> +	unsigned long end = ALIGN(start + size, PAGE_SIZE);
> +
> +	if (size == -1) {
> +		__asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (asid) : "memory");
> +		return;

Please split the global (size == -1) case into separate helpers.

> +	while(tmp < end) {

Missing whitespace befre the (.

Also I think this would read nicer as:

	for (tmp = start & PAGE_MASK; tmp < end; tmp += PAGE_SIZE)

> +static void __sbi_tlb_flush_range_asid(struct cpumask *cmask, unsigned long start,
> +				       unsigned long size, unsigned long asid)

Another overly long line.

Also for all thee __sbi_* functions, why the __ prefix?

> +	if (cpumask_any_but(cmask, cpuid) >= nr_cpu_ids) {
> +		local_flush_tlb_range_asid(start, size, asid);
> +	} else {
> +		riscv_cpuid_to_hartid_mask(cmask, &hmask);
> +		sbi_remote_sfence_vma_asid(cpumask_bits(&hmask), start, size, asid);

Another long line (and a few more later).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
