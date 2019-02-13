Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878C1C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 19:23:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E18420835
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 19:23:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HsvVuovL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Xv+XOoTI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E18420835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nkdldEPuBMTWdQ8i6073MIMLa2gjsILdZH/LR+8mEPs=; b=HsvVuovLD9K6Z27IoNw1ncVEr
	1xcobLUBOo1Fr4aWsHv9v4zdNqFwuPwIb8Jsu0X86Goso8Aiu+P/tYMBUp9+G9pxDiu3fkJpcutnB
	wzrxrMea6u/QlP3Bex5Frj6obrhwBhrnqUMfXLho+BVoUuZ3RHmsf1IgZr0b/jQUKBpEsT8D8WXs+
	aXrXcp1sxsBVSGVFfAtZiD5Y82pisv2CNhgggd7eg8eQQJlIcIBRYvO3ooxdCUexSOF/QZNcz6YgM
	x5llzGf+oerNCb1OgvYAYCmFkuyHRqVEiV3cYI2UWZToIKtOq5qdUGaJCFXDdCfi3uFgCMlH8RXuX
	YDCnihbZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu07s-0005AT-O8; Wed, 13 Feb 2019 19:23:20 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu07k-00052o-11; Wed, 13 Feb 2019 19:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q6vEWTW35opmCQKNqyHy4VQAtcYCXhbRYGzBwGpyjhY=; b=Xv+XOoTIfVhpOU6+dvh++a+xJE
 cEp/0QrymBY8/fC11i1mOdZhimAqLMDNPgnOjxGEZN8Szbe/qHPznHMfnqC2mpHJz21g+azty7Q04
 hz8eKzd8qtdnc1RZWBMvrpVZa7Fkx7JfCEVB87e4QfuDPTHJJtynNxX9b52xr390+bx0TkApc8mq0
 DkKZnllpaHDrszUa/ILSoP5PqJSl19cNBKT1s7w1aCxP0iGCnTe51D54rJYY+QjrXjavhSE9MCA5M
 joj2D9N2YTYDS2vuqO58Nz2L/e5n8UFzlovrQchpHM9Eh0uhIMAebsBveWSeaSsiWHI+04sIAeWM7
 vEgwhIDQ==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu07g-0005kF-Sp; Wed, 13 Feb 2019 19:23:10 +0000
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0F08B100005;
 Wed, 13 Feb 2019 19:22:21 +0000 (UTC)
Subject: Re: [PATCH] hugetlb: allow to free gigantic pages regardless of the
 configuration
To: Vlastimil Babka <vbabka@suse.cz>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will.deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20190117183953.5990-1-aghiti@upmem.com>
 <16a6209c-868b-8fd5-a70a-6e0e1ecb62d4@suse.cz>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <7801de9c-9a8c-fb56-442a-6e530e52e0d8@ghiti.fr>
Date: Wed, 13 Feb 2019 14:22:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <16a6209c-868b-8fd5-a70a-6e0e1ecb62d4@suse.cz>
Content-Language: sv-FI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_142309_171150_A2C5C1F8 
X-CRM114-Status: GOOD (  23.99  )
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
Cc: hch@infradead.org, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


On 2/13/19 6:27 AM, Vlastimil Babka wrote:
> On 1/17/19 7:39 PM, Alexandre Ghiti wrote:
>> From: Alexandre Ghiti <alex@ghiti.fr>
>>
>> On systems without CMA or (MEMORY_ISOLATION && COMPACTION) activated but
>> that support gigantic pages, boottime reserved gigantic pages can not be
>> freed at all. This patchs simply enables the possibility to hand back
>> those pages to memory allocator.
>>
>> This commit then renames gigantic_page_supported and
>> ARCH_HAS_GIGANTIC_PAGE to make them more accurate. Indeed, those values
>> being false does not mean that the system cannot use gigantic pages: it
>> just means that runtime allocation of gigantic pages is not supported,
>> one can still allocate boottime gigantic pages if the architecture supports
>> it.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> I'm fine with the change, but wonder if this can be structured better in a way
> which would remove the duplicated "if (MEMORY_ISOLATION && COMPACTION) || CMA"
> from all arches, as well as the duplicated
> gigantic_page_runtime_allocation_supported()


Yeah, totally, we can factorize more than what I did. I prepared a v2 of 
this
patch that does exactly that: remove the triplet from arch specific code
and the duplicated gigantic_page_runtime_allocation_supported.


> something like:
>
> - "select ARCH_HAS_GIGANTIC_PAGE" has no conditions, it just says the arch can
> support them either at boottime or runtime (but runtime is usable only if other
> conditions are met)


And the v2 gets rid of ARCH_HAS_GIGANTIC_PAGE totally since it
is not needed by arch to advertise the fact they support gigantic page,
actually, when selected, it really just means that an arch has the means
to allocate runtime gigantic page: it is equivalent to
(MEMORY_ISOLATION && COMPACTION) || CMA.


> - gigantic_page_runtime_allocation_supported() is a function that returns true
> if ARCH_HAS_GIGANTIC_PAGE && ((MEMORY_ISOLATION && COMPACTION) || CMA) and
> there's a single instance, not per-arch.
> - code for freeing gigantic pages can probably still be conditional on
> ARCH_HAS_GIGANTIC_PAGE
>
> BTW I wanted also to do something about the "(MEMORY_ISOLATION && COMPACTION) ||
> CMA" ugliness itself, i.e. put the common parts behind some new kconfig
> (COMPACTION_CORE ?) and expose it better to users, but I can take a stab on that
> once the above part is settled.
> Vlastimil


I send the v2 right away, if you can take a look Vlastimil, that would 
be great.
Note that Andrew already picked this patch in its tree, I'm not sure how to
proceed.


Thanks for your remarks !


Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
