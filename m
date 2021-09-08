Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BEDC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 03:53:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D950E61152
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 03:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D950E61152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=N4y+k08BJLHUsrir2SsFqoKIM2TYEtNtpfRnywoes70=; b=O8uv/4KunluDfeD54snzDYneZZ
	yM9OJVaXGfy6H5JS0oAIIWODbjMpCO6zIcPI1luywAy1V2fYgmBC18yVr+JY7E90dL5gCzXAUyuF3
	xS8y8/hPFk86Z4sJFnymQkT1m5QEbAUmxYAlssjxCBwX7Og7H0sDrsQU3hcxCQdkEKfikMKF2dPNV
	K7uU0v9EYzMnCBLygXqSl4iS67MYbYe16KHVAfYdbbaj5lTqaLHhuzDKFUmFsmnmmpWmd6w5chm3A
	XfEPloJa/tsjwj/XB9DN66D/VZP4Z7j0OE1WOGnW/UvQV5WJQrf1CgIADGuXVD9bqrtybpa5cg/+V
	P0qSwtrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNodt-005K1V-Hq; Wed, 08 Sep 2021 03:52:57 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNodg-005K09-FE; Wed, 08 Sep 2021 03:52:46 +0000
Received: by mail-pf1-x42f.google.com with SMTP id y17so775866pfl.13;
 Tue, 07 Sep 2021 20:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WSt+UMhq7R7h5hSLb95oV8jytbQKlUJH1lEwRLVcxwc=;
 b=GLJfR0NMco+oS1HHyphViWc/H8Wf/bLjCDcmbtta6hyb801Md0ubjqPMWp6WdPvWq/
 /NuGfVD1j9+XuSUMOGQz/eTCVbohXJ+Qkv9I2QMqTdEHfklDHNcvxpVFOWfbJPymvNFD
 btC1KFw4ADbCa7XAeGte2pPkaEU5kZ7GcfmYZBMz4nJuY9zvGtKXL5+PeF7cVlAHFI2G
 +TP44OHlZU2UYl/1A7zxdCsPyN+6gq/V8DFaKk1ZAfOPXKPdX2/k8aXmhsfoLio/obd/
 fRBEBNg4S22eyDDVR3hvYvwYI6y0QYJteRexx8hn81tf7J0GoryM+zimw3uyq3VlSa06
 cc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WSt+UMhq7R7h5hSLb95oV8jytbQKlUJH1lEwRLVcxwc=;
 b=nJIHG0ppBHYhcwdf3xpKf826f8bOAmkTIW5MNJjA3gRyWov7t+0HQ46SvA+YC95BlH
 PDwhwQ6i0BHfkIT6PYr0yWesCnGUtLA6ohu9YPmASyrqOaD/ECOkP3qdbwq1CyNpbol8
 akRIlSzQ2V73pMYnZ/Af1EjVKORS6vrcisIKcNQomZt6l1K/a2IvGTZFt8p9enLquooX
 p4BkS2xGfbTCgdf2XvB5KYBDMVfhgdITqCgJ2Hag5bOhv/RDQJ7oosQrNxU1ZBcLuUZs
 AXwxQU3A1mAzBP5HzUF6kL4tOc4zXBFjBsdFAX6ra9xSHLP13zHbF/XD6lhSQ+TmRIZb
 4bMg==
X-Gm-Message-State: AOAM533JRA3+wOAm16COk1nBbiSlUcEvkmJrcqUWAESjiHaSkg2CiaKp
 2lVLUpEGuJ6WqdptEyD7d1k=
X-Google-Smtp-Source: ABdhPJzsF7/ZmS0a3POWsiDv6cT4l+YoAuvMs8kxVeVkGFJVzJ1fBZkDxrQQPMspQMKZVPXO7C92+Q==
X-Received: by 2002:a63:30d:: with SMTP id 13mr1668901pgd.289.1631073162944;
 Tue, 07 Sep 2021 20:52:42 -0700 (PDT)
Received: from [192.168.30.11] ([173.248.225.217])
 by smtp.gmail.com with ESMTPSA id p4sm647725pgc.15.2021.09.07.20.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 20:52:42 -0700 (PDT)
Subject: Re: [PATCH v3] ftrace: Cleanup ftrace_dyn_arch_init()
To: LEROY Christophe <christophe.leroy@csgroup.eu>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 "x86@kernel.org" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Nick Hu <nickhu@andestech.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
References: <20210907100524.1454928-1-o451686892@gmail.com>
 <MRZP264MB298824D80E6C0ADCB5EA1D9AEDD39@MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM>
From: Weizhao Ouyang <o451686892@gmail.com>
Message-ID: <f33570e2-a67d-b0cf-f127-040ccd9e5da9@gmail.com>
Date: Wed, 8 Sep 2021 11:52:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <MRZP264MB298824D80E6C0ADCB5EA1D9AEDD39@MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_205244_592032_84A11EBB 
X-CRM114-Status: GOOD (  26.22  )
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

Thanks for reply.

On 2021/9/7 23:55, LEROY Christophe wrote:
>
>> -----Message d'origine-----
>> De : Linuxppc-dev <linuxppc-dev-
>> bounces+christophe.leroy=csgroup.eu@lists.ozlabs.org> De la part de Weizhao
>> Ouyang
>>
>> Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
>> ftrace_dyn_arch_init() to cleanup them.
>>
>> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
>> Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
>> Acked-by: Helge Deller <deller@gmx.de> (parisc)
>>
>> ---
>> Changes in v3:
>> -- fix unrecognized opcode on PowerPC
>>
>> Changes in v2:
>> -- correct CONFIG_DYNAMIC_FTRACE on PowerPC
>> -- add Acked-by tag
>>
>> ---
>>  arch/arm/kernel/ftrace.c          | 5 -----
>>  arch/arm64/kernel/ftrace.c        | 5 -----
>>  arch/csky/kernel/ftrace.c         | 5 -----
>>  arch/ia64/kernel/ftrace.c         | 6 ------
>>  arch/microblaze/kernel/ftrace.c   | 5 -----
>>  arch/mips/include/asm/ftrace.h    | 2 ++
>>  arch/nds32/kernel/ftrace.c        | 5 -----
>>  arch/parisc/kernel/ftrace.c       | 5 -----
>>  arch/powerpc/include/asm/ftrace.h | 4 ++++
>>  arch/riscv/kernel/ftrace.c        | 5 -----
>>  arch/s390/kernel/ftrace.c         | 5 -----
>>  arch/sh/kernel/ftrace.c           | 5 -----
>>  arch/sparc/kernel/ftrace.c        | 5 -----
>>  arch/x86/kernel/ftrace.c          | 5 -----
>>  include/linux/ftrace.h            | 1 -
>>  kernel/trace/ftrace.c             | 5 +++++
>>  16 files changed, 11 insertions(+), 62 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/ftrace.h b/arch/mips/include/asm/ftrace.h
>> index b463f2aa5a61..ed013e767390 100644
>> --- a/arch/mips/include/asm/ftrace.h
>> +++ b/arch/mips/include/asm/ftrace.h
>> @@ -76,6 +76,8 @@ do {                                                \
>>
>>
>>  #ifdef CONFIG_DYNAMIC_FTRACE
>> +int __init ftrace_dyn_arch_init(void);
>> +
> Why ?
>
>
>>  static inline unsigned long ftrace_call_adjust(unsigned long addr)
>>  {
>>       return addr;
>> diff --git a/arch/powerpc/include/asm/ftrace.h
>> b/arch/powerpc/include/asm/ftrace.h
>> index debe8c4f7062..b05c43f13a4d 100644
>> --- a/arch/powerpc/include/asm/ftrace.h
>> +++ b/arch/powerpc/include/asm/ftrace.h
>> @@ -126,6 +126,10 @@ static inline void this_cpu_enable_ftrace(void) { }
>>  static inline void this_cpu_set_ftrace_enabled(u8 ftrace_enabled) { }
>>  static inline u8 this_cpu_get_ftrace_enabled(void) { return 1; }
>>  #endif /* CONFIG_PPC64 */
>> +
>> +#ifdef CONFIG_DYNAMIC_FTRACE
>> +int __init ftrace_dyn_arch_init(void);
>> +#endif /* CONFIG_DYNAMIC_FTRACE */
> Why ?
>
>>  #endif /* !__ASSEMBLY__ */
>>
>>  #endif /* _ASM_POWERPC_FTRACE */
>> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
>> index 832e65f06754..f1eca123d89d 100644
>> --- a/include/linux/ftrace.h
>> +++ b/include/linux/ftrace.h
>> @@ -573,7 +573,6 @@ ftrace_set_early_filter(struct ftrace_ops *ops, char
>> *buf, int enable);
>>
>>  /* defined in arch */
>>  extern int ftrace_ip_converted(unsigned long ip);
>> -extern int ftrace_dyn_arch_init(void);
> Why removing that ?
>
> Have you tried to build kernel/trace/ftrace.o with C=2 ? It will likely tell you that the function is not declared and that it should be static

Yes I missed this check. Under the situation, the function should be static.

> We could eventually consider that in the past, this generic declaration was unrelevant because the definitions where in the arch specific sections.
> Now that you are implementing a generic weak version of this function, it would make sense to have a generic declaration as well.
>
> I really don't see the point in duplicating the declaration of the function in the arch specific headers.

I use declaration in arch specific headers in tend to clarify the arch has implement ftrace_dyn_arch_init().
Anyway, it maybe pointless, a generic declaration is enough. Will update it later.

>>  extern void ftrace_replace_code(int enable);
>>  extern int ftrace_update_ftrace_func(ftrace_func_t func);
>>  extern void ftrace_caller(void);
> Christophe
>
> CS Group - Document Interne

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
