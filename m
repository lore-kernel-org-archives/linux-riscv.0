Return-Path: <SRS0=2iVI=VW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50647C7618B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2019 05:49:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2969B20657
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2019 05:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jNZAeM5x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2969B20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KVaXQ7biIhK3nU80lOF3mcpJiB2pAiYb9kyKrtBbxGY=; b=jNZAeM5xr/z/6cGMTU5ayTiQn
	0G+3UikWFSRRy8baFtEP6v0kbCidSjuCRqAI+l2pCiRz0ZGEBigE/wVuCBCtswQM2POcLtKc/c+Tl
	BWxR/zqWVspXxXn1pwvhA/ls4rWPTvGYPbXAxRLmtPPcETNhwnnmumvm31ZQDj6HShmJ1UgsZ1i8k
	APE3G1grLaBeUelkP+PPEdFRl86ZUcEhLtYDo2RPOjqY9kjN1qWipGC/Sh7ZDqxGTwdsMr+MN+aQv
	wMiLGx/84IQvYD4XgklkIf9RK8Wjz3y+EmI4jLCSiY6qwXxGmu7/fH/kdUaNUhlNgNVFL3dWQ+ush
	qrNSfpcfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqWd6-0006oM-Bd; Thu, 25 Jul 2019 05:49:28 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqWca-0006bS-Le; Thu, 25 Jul 2019 05:48:58 +0000
X-Originating-IP: 81.250.144.103
Received: from [10.30.1.20] (lneuilly-657-1-5-103.w81-250.abo.wanadoo.fr
 [81.250.144.103]) (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 83A0560002;
 Thu, 25 Jul 2019 05:48:44 +0000 (UTC)
Subject: Re: [PATCH REBASE v4 05/14] arm64, mm: Make randomization selected by
 generic topdown mmap layout
To: Luis Chamberlain <mcgrof@kernel.org>
References: <20190724055850.6232-1-alex@ghiti.fr>
 <20190724055850.6232-6-alex@ghiti.fr>
 <20190724171123.GV19023@42.do-not-panic.com>
From: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <8dd7b018-7f17-0018-0fcf-d0257976d275@ghiti.fr>
Date: Thu, 25 Jul 2019 07:48:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190724171123.GV19023@42.do-not-panic.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190724_224856_869201_E5116EBD 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Burton <paul.burton@mips.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, James Hogan <jhogan@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/24/19 7:11 PM, Luis Chamberlain wrote:
> On Wed, Jul 24, 2019 at 01:58:41AM -0400, Alexandre Ghiti wrote:
>> diff --git a/mm/util.c b/mm/util.c
>> index 0781e5575cb3..16f1e56e2996 100644
>> --- a/mm/util.c
>> +++ b/mm/util.c
>> @@ -321,7 +321,15 @@ unsigned long randomize_stack_top(unsigned long stack_top)
>>   }
>>   
>>   #ifdef CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
>> -#ifdef CONFIG_ARCH_HAS_ELF_RANDOMIZE
>> +unsigned long arch_randomize_brk(struct mm_struct *mm)
>> +{
>> +	/* Is the current task 32bit ? */
>> +	if (!IS_ENABLED(CONFIG_64BIT) || is_compat_task())
>> +		return randomize_page(mm->brk, SZ_32M);
>> +
>> +	return randomize_page(mm->brk, SZ_1G);
>> +}
>> +
>>   unsigned long arch_mmap_rnd(void)
>>   {
>>   	unsigned long rnd;
>> @@ -335,7 +343,6 @@ unsigned long arch_mmap_rnd(void)
>>   
>>   	return rnd << PAGE_SHIFT;
>>   }
> So arch_randomize_brk is no longer ifdef'd around
> CONFIG_ARCH_HAS_ELF_RANDOMIZE either and yet the header
> still has it. Is that intentional?
>

Yes, CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT selects 
CONFIG_ARCH_HAS_ELF_RANDOMIZE, that's what's new about v4: the generic
functions proposed in this series come with elf randomization.


Alex


>    Luis
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
