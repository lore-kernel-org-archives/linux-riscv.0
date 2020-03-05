Return-Path: <SRS0=aH+X=4W=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FA4C3F2D1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2020 06:23:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47F4C207FD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2020 06:23:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pHSZvtAr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47F4C207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hifOESStoVrYxgw8b8q+V8UyPOETFN66KQAIneDcu5s=; b=pHSZvtArWa3/IX
	sIEZIwnbbkcCjFeRXde4JBc9uIkHyYUjjr4/eZnZae+e/oYEffeaieDWPiVOdDc/xI+yL0CRvxtL3
	zzPvHHXWf0Wp9EvQSePFxUxK3eh75Rir6wM9NCgYetPFte0BKW7iZhqaUqj0LGsvbmHo8aB4ZBaOU
	fltea16O/23rtXXKtphUcsqCs22+ey9HHPReRbD+K7e0fee5RuygFdZ2XJTT/3fbr+Fi7pxffZw9Q
	UvlvUPWPZAjw9aVD5//xCN66xwtXcfRapQYZXO7y23N8TqyJRNHelf+dR9S6bmzM0Nd0VY9RWC2r1
	U9QIAejtulq0Dgmc3taQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9juw-0006iz-UY; Thu, 05 Mar 2020 06:23:34 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9jup-0006cO-JV; Thu, 05 Mar 2020 06:23:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17EB71FB;
 Wed,  4 Mar 2020 22:23:23 -0800 (PST)
Received: from [10.163.1.88] (unknown [10.163.1.88])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D1843F534;
 Wed,  4 Mar 2020 22:27:09 -0800 (PST)
Subject: Re: [PATCH V14] mm/debug: Add tests validating architecture page
 table helpers
To: Christophe Leroy <christophe.leroy@c-s.fr>, Qian Cai <cai@lca.pw>
References: <c022e863-0807-fab1-cd41-3c320381f448@c-s.fr>
 <11F41980-97CF-411F-8120-41287DC1A382@lca.pw>
 <57a3bc61-bbd5-e251-9621-7bc28f7901a1@arm.com>
 <bcba7b7f-f351-4ee7-d74e-004a0bfbee47@c-s.fr>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <d198fc5a-5337-c346-a21c-1ff133202e68@arm.com>
Date: Thu, 5 Mar 2020 11:53:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <bcba7b7f-f351-4ee7-d74e-004a0bfbee47@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_222327_688084_C37DEE1F 
X-CRM114-Status: GOOD (  15.27  )
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 03/05/2020 11:13 AM, Christophe Leroy wrote:
> 
> 
> Le 05/03/2020 à 01:54, Anshuman Khandual a écrit :
>>
>>
>> On 03/04/2020 04:59 PM, Qian Cai wrote:
>>>
>>>
>>>> On Mar 4, 2020, at 1:49 AM, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>>>
>>>> AFAIU, you are not taking an interrupt here. You are stuck in the pte_update(), most likely due to nested locks. Try with LOCKDEP ?
>>>
>>> Not exactly sure what did you mean here, but the kernel has all lockdep enabled and did not flag anything here.
>>
>> As the patch has been dropped from Linux next (next-20200304) perhaps in
>> order to fold back the __pa_symbol() fix [1], so I am planning to respin
>> the original patch once more as V15 while adding Qian's signed off by for
>> the powerpc part. For now lets enable radix MMU ppc64 along with existing
>> ppc32. As PPC_RADIX_MMU depends on PPC_BOOK3S_64, the following change
>> should be good enough ?
> 
> I don't think so, even if you have the Radix MMU compiled in, hash MMU is used when Radix is not available or disabled. So until the Hash MMU problem is fixed, you cannot enable it by default.

So this implies, that with DEBUG_VM given kernel compiled with Radix MMU will
get stuck in soft lock up when forced to use hash MMU in cases where Radix MMU
is either not available or is disabled. Hence, we cannot enable that.

I will still fold the changes from Qian without enabling ppc64 Radix MMU and
respin V15. These new changes dont hurt, build every where and works good
on arm64 and x86 platforms. More over we know that they also fix a problem
for ppc64 Radix MMU platforms. Hence unless there are some other concerns we
should fold them in.

> 
> Christophe
> 

