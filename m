Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5863AC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 16:11:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2607020645
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 16:11:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ciQRacF2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2607020645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mtar4V9wTashOgJg++6NA2+1Ex8qNkhSD33z6uE2iw=; b=ciQRacF26PRR2b
	BbefjH1tN9vnwye35qXoKq6I4jr4cMMCsHASkWgU9KHzbVMzKK3lnlL28BVMhDJbHwiNx56tk0r3m
	iSG+HUZLb37SN3xhhIV0aqRyY4Vk/5zPcUwbyCU0IVDPrA3jewyTYpGg6XR56FoQvgT5pUeWv3Fyv
	XA1N8jFdu2lNwfqonTI9Mh9Wr08rzozfOID3A5I3HKm8M3uwm60nkSlLvW7cWY4sdBRuWmZJ2Eu67
	64/DrrswnIrrNN54KH/N43ndld67lJ6+8YYxL/Rh8COvfTHsADHTLmFxr0VL3Enhhr1R9rUjson3I
	UvlzchuopucJx1c+rzBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRIs-0004xm-Vj; Tue, 15 Jan 2019 16:11:02 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjRIr-0004xa-GP; Tue, 15 Jan 2019 16:11:01 +0000
Date: Tue, 15 Jan 2019 08:11:01 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Alexandre Ghiti <aghiti@upmem.com>
Subject: Re: [PATCH 1/3] riscv: Introduce huge page support for 32/64bit kernel
Message-ID: <20190115161101.GA12222@infradead.org>
References: <20181210062146.24951-1-aghiti@upmem.com>
 <20181210062146.24951-2-aghiti@upmem.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181210062146.24951-2-aghiti@upmem.com>
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
Cc: aou@eecs.berkeley.edu, catalin.marinas@arm.com, palmer@sifive.com,
 ndesaulniers@google.com, mingo@kernel.org, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 mike.kravetz@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> +#ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
> +static inline bool gigantic_page_supported(void) { return true; }

Can you move each brace and the return statement to an line of its
own?  Just to keep the code a little easier to read.

> +int pud_huge(pud_t pud)
> +{
> +	return pud_present(pud)
> +		&& (pud_val(pud) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC));
> +}
> +
> +int pmd_huge(pmd_t pmd)
> +{
> +	return pmd_present(pmd)
> +		&& (pmd_val(pmd) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC));
> +}

Kinda sad that we can't easily have these as inline functions, but not
really your fault.  Note that the && should move to the first line
of the multi-line statement.

> +#if defined(CONFIG_64BIT)
> +	} else if (ps == PUD_SIZE) {
> +		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
> +#endif

I think this could be:

	} else if (IS_ENABLED(CONFIG_64BIT) && ps == PUD_SIZE) {
		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
