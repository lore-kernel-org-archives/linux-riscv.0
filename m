Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF65BC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 18:52:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD75E20656
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 18:52:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uIHzPhei";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jXt4UcbZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD75E20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HGFAcDqoey4gQW5lR4wp8ueDgBh+bjuLe0hpOgJse2s=; b=uIHzPheibZxFOePHRSf40hriA
	ZvkTbnsupWu9U/8FDYSVRdNhwGVo1OX2mZfBWfV/xsIjoe1R9QjjB86ctDXha2LxD8opk0ELfbZhx
	Eio8N9wrr/WsKT8WoOm9Dm2WIPFlWt4ro+y0UwdGYmMOyKh4zZDeqNxQis0k1Dik3yomFrS3GgsM5
	Dx2oqHZDh5EIhi+lJsouilP0GjtDb1Itxd2hRSLH/gUGOS/5MF6PgcWKxj91/bG72E+1Qduh+kUTH
	RNGqDFWxqNwJveAqbHmG1u1bGrRfaxburLzHRwS0BQoYdjSkVfMFtmw4UN+jhaKTgFKKuO/y/NlyF
	jyFsN+1Pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjTpQ-0001N1-8W; Tue, 15 Jan 2019 18:52:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjTpP-0001Fr-5f
 for linux-riscv@bombadil.infradead.org; Tue, 15 Jan 2019 18:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hS8S/GLLI+psb9CzV5LqVcCkJbbDf1aGj+6OxIqNQUE=; b=jXt4UcbZcN098tpZ2ZHhMKLKP/
 NIZdFsJBAOuafnwnoyg1afyIjOCwlM1xQxkgsnAGEBKSgMGZYNtAGFS/kP0wLI91pOzJ/D6J3V66u
 gRQQT1S1zGjDbrumqC7A9sW2vV4FuEWKeKTpnVj2ViBhwXJJ1n5IqbhBxPlo+oVb8hYuILk2uvRac
 es1f20rXDvmuEqA1uJnWE8JG3XO+5mw9V865fsXBhjJeAndHOIhJxLVJVflaRUJgZoLa5i3HiQyUo
 uQlH0yvOxTYz/S0Qt4Bl0lh1DMkxY3SxyqYsLKzn/XHVjpsCEjf2hSa2DO3w8adsktzSZ037wWbaw
 fzb9gQag==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjTpL-0002ZT-VG
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 18:52:45 +0000
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A911AE0002;
 Tue, 15 Jan 2019 18:52:09 +0000 (UTC)
Subject: Re: [PATCH 1/3] riscv: Introduce huge page support for 32/64bit kernel
To: Christoph Hellwig <hch@infradead.org>, Alexandre Ghiti <aghiti@upmem.com>
References: <20181210062146.24951-1-aghiti@upmem.com>
 <20181210062146.24951-2-aghiti@upmem.com>
 <20190115161101.GA12222@infradead.org>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <5c76aaca-9c9c-0b5f-28cd-d77dfd020763@ghiti.fr>
Date: Tue, 15 Jan 2019 18:52:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190115161101.GA12222@infradead.org>
Content-Language: en-PH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_185244_035069_17FAD2F6 
X-CRM114-Status: GOOD (  16.89  )
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
Cc: aou@eecs.berkeley.edu, akpm@linux-foundation.org, catalin.marinas@arm.com,
 palmer@sifive.com, ndesaulniers@google.com, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, mingo@kernel.org, mike.kravetz@oracle.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/15/19 4:11 PM, Christoph Hellwig wrote:
>> +#ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
>> +static inline bool gigantic_page_supported(void) { return true; }
> Can you move each brace and the return statement to an line of its
> own?  Just to keep the code a little easier to read.
>
>> +int pud_huge(pud_t pud)
>> +{
>> +	return pud_present(pud)
>> +		&& (pud_val(pud) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC));
>> +}
>> +
>> +int pmd_huge(pmd_t pmd)
>> +{
>> +	return pmd_present(pmd)
>> +		&& (pmd_val(pmd) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC));
>> +}
> Kinda sad that we can't easily have these as inline functions, but not
> really your fault.  Note that the && should move to the first line
> of the multi-line statement.
>
>> +#if defined(CONFIG_64BIT)
>> +	} else if (ps == PUD_SIZE) {
>> +		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
>> +#endif
> I think this could be:
>
> 	} else if (IS_ENABLED(CONFIG_64BIT) && ps == PUD_SIZE) {
> 		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
>
Thanks Christoph, I will send a new version with your modifications.


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
