Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6305BC433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 09:28:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0E8461407
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 09:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0E8461407
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xD5tnLqZxu8EBPPIJMIPw9IKnqCKluFhZHQyRx8jAwY=; b=TwOEcEd1hHNFK0xGUgO56J/4C
	qysx/KeFtE8cNxcfcW84dbCEYvnS5NVqkV5sWKPTL4VxjVR0VL7msIT9wZyBwF27/oURVVOZdkx7E
	0R122CwpVoIuAQDLsZUdn+kGXg4wc9O37mrF1pAmrUT6+/nD7QAIbSCIfZ8KRQC5N2K+8nOP2hpTy
	OWUsOHQ4KPaWvi5itj9yf6hCEmTz1Jq5LPgFBad3Y77udDjYnDHdcRyt4EMOZUQCi5YAZR0cN21Dt
	iFb9rPQCAwflummREe+GiCQZKIvCgaFQ1UHx37MRn+VjrivYlhQ/crGn4GsI63f7z3hGDrO+dw4HC
	z+ZpXQwpg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhU7F-007dD8-09; Fri, 14 May 2021 09:28:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhU6w-007d8x-Q2
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 09:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=lCFOeXXuHqZj/3n5W4PkDf5UJ0V8NO/Y5/poalLCeQU=; b=pxozzTckAVlhxaj2nyMZKO7tvS
 9BrO+u6TJ/7mV3qRXEz+FNu6WwLvFySCvOzid4H3knNiT0uAIFoPANWuHVMWGDB5Dqj9nUOyE0Mt3
 KIDSVmDJwqtrsFH6q0V7lE1bCNexJK89bXYByS+9B3p57MGyQAWfcLPi1FmDEyJWO/1J+CIgLJtUD
 pTtqVCpQsUgGUIWtU52cHyPLaZFOmMyasnEGrz1ilgTiTwugpu3xFe+1A9Z2G3XfRqhwdmNPbwT3p
 r5oRfQyGYwJwj77ACZgSTb96yp0oipeElmV4IBTWCjSdfdFsyhRIyCT6O5UXOe64SeDuBofrlh4uh
 aazrxj2g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhU6s-00BrKC-Oi
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 09:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620984473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCFOeXXuHqZj/3n5W4PkDf5UJ0V8NO/Y5/poalLCeQU=;
 b=doEV/osVmgQ4E2qonk1MwbTRonAvztAxV0UpO6phcTOAXqfbH1NKOqZfCEHk9x2lVnOk2o
 csEOklxirAkGqsic5gcu/kDbCb5LToyo6pIxnlri6tuqCqPr/HC7oMpdZUdKA6QS0g9mMF
 u8gUE53evgj+umwiX02/idBTe9U3534=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-uMxfUvmCNlKdhBTnflifHA-1; Fri, 14 May 2021 05:27:51 -0400
X-MC-Unique: uMxfUvmCNlKdhBTnflifHA-1
Received: by mail-ed1-f71.google.com with SMTP id
 i19-20020a05640242d3b0290388cea34ed3so16052812edc.15
 for <linux-riscv@lists.infradead.org>; Fri, 14 May 2021 02:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lCFOeXXuHqZj/3n5W4PkDf5UJ0V8NO/Y5/poalLCeQU=;
 b=mcUIl7Ul95JlhP98CVaGuxkjEQZ0oiXblOzpW6JtlHL8qbxnvClxHXj3uGAn9leFlk
 cDfbHQacVutGHVM8OF8RVJQ+dHowEepUXWphsaPdiljsXRlGsHmtLc+hxr7cN67n2jga
 3X+7xU79DyCBTkLZqq7yqeGTgXmuEd8kDbsCEMMYk4cS6kYTXwoqJQzO4aL+i3fOa1Ts
 8G4EtsGXvzLMHobbIXfWrMaJvez4Amw9W+8ZZ/vxCEdCtD1C/dRS91RJYsIRoTEOU3dD
 FXN4oC50TSza44h6Tbtc0sBQfJdqcUd2WjV1zmH9poM9Z6pj194EZ/+lL4bL3VUq6PNG
 kJdg==
X-Gm-Message-State: AOAM530Qhn9FWPvaHdm23mGStPVZQVwJXUm4Jl4OaR7MIqZrozcNeYF/
 Lkg2Lu02wxDD2qKawNZCz8QOpmnA6ewGorxZlEifiqRtRzSgRrS+orNHC+lqc4ZlJwlyx8Bi+hE
 jEsUrCZRgsKRCa4akp0rpS7SOVyHP
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr11073783edu.286.1620984470700; 
 Fri, 14 May 2021 02:27:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfJBqZFBKWj/4MZ8aMrds7gZKR5l1ZQNZ/fzLhEZqsf7ePvhUBKvxtTbsw6S08p7GvU/DmLA==
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr11073750edu.286.1620984470525; 
 Fri, 14 May 2021 02:27:50 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6501.dip0.t-ipconnect.de. [91.12.101.1])
 by smtp.gmail.com with ESMTPSA id
 t20sm3351530ejc.61.2021.05.14.02.27.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 02:27:50 -0700 (PDT)
Subject: Re: [PATCH v19 7/8] arch, mm: wire up memfd_secret system call where
 relevant
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Ingo Molnar <mingo@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Kees Cook <keescook@chromium.org>, "Kirill A. Shutemov"
 <kirill@shutemov.name>, Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-8-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <227cabb7-17a4-9b39-5893-df825fd2e29b@redhat.com>
Date: Fri, 14 May 2021 11:27:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513184734.29317-8-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_022754_891053_5BE9CCFE 
X-CRM114-Status: GOOD (  23.27  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 13.05.21 20:47, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Wire up memfd_secret system call on architectures that define
> ARCH_HAS_SET_DIRECT_MAP, namely arm64, risc-v and x86.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Christopher Lameter <cl@linux.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Elena Reshetova <elena.reshetova@intel.com>
> Cc: Hagen Paul Pfeifer <hagen@jauu.net>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: James Bottomley <jejb@linux.ibm.com>
> Cc: "Kirill A. Shutemov" <kirill@shutemov.name>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Cc: Roman Gushchin <guro@fb.com>
> Cc: Shakeel Butt <shakeelb@google.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Tycho Andersen <tycho@tycho.ws>
> Cc: Will Deacon <will@kernel.org>
> ---
>   arch/arm64/include/uapi/asm/unistd.h   | 1 +
>   arch/riscv/include/asm/unistd.h        | 1 +
>   arch/x86/entry/syscalls/syscall_32.tbl | 1 +
>   arch/x86/entry/syscalls/syscall_64.tbl | 1 +
>   include/linux/syscalls.h               | 1 +
>   include/uapi/asm-generic/unistd.h      | 7 ++++++-
>   scripts/checksyscalls.sh               | 4 ++++
>   7 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/uapi/asm/unistd.h b/arch/arm64/include/uapi/asm/unistd.h
> index f83a70e07df8..ce2ee8f1e361 100644
> --- a/arch/arm64/include/uapi/asm/unistd.h
> +++ b/arch/arm64/include/uapi/asm/unistd.h
> @@ -20,5 +20,6 @@
>   #define __ARCH_WANT_SET_GET_RLIMIT
>   #define __ARCH_WANT_TIME32_SYSCALLS
>   #define __ARCH_WANT_SYS_CLONE3
> +#define __ARCH_WANT_MEMFD_SECRET
>   
>   #include <asm-generic/unistd.h>
> diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
> index 977ee6181dab..6c316093a1e5 100644
> --- a/arch/riscv/include/asm/unistd.h
> +++ b/arch/riscv/include/asm/unistd.h
> @@ -9,6 +9,7 @@
>    */
>   
>   #define __ARCH_WANT_SYS_CLONE
> +#define __ARCH_WANT_MEMFD_SECRET
>   
>   #include <uapi/asm/unistd.h>
>   
> diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
> index 28a1423ce32e..e44519020a43 100644
> --- a/arch/x86/entry/syscalls/syscall_32.tbl
> +++ b/arch/x86/entry/syscalls/syscall_32.tbl
> @@ -451,3 +451,4 @@
>   444	i386	landlock_create_ruleset	sys_landlock_create_ruleset
>   445	i386	landlock_add_rule	sys_landlock_add_rule
>   446	i386	landlock_restrict_self	sys_landlock_restrict_self
> +447	i386	memfd_secret		sys_memfd_secret
> diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
> index ecd551b08d05..a06f16106f24 100644
> --- a/arch/x86/entry/syscalls/syscall_64.tbl
> +++ b/arch/x86/entry/syscalls/syscall_64.tbl
> @@ -368,6 +368,7 @@
>   444	common	landlock_create_ruleset	sys_landlock_create_ruleset
>   445	common	landlock_add_rule	sys_landlock_add_rule
>   446	common	landlock_restrict_self	sys_landlock_restrict_self
> +447	common	memfd_secret		sys_memfd_secret
>   
>   #
>   # Due to a historical design error, certain syscalls are numbered differently
> diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
> index 050511e8f1f8..1a1b5d724497 100644
> --- a/include/linux/syscalls.h
> +++ b/include/linux/syscalls.h
> @@ -1050,6 +1050,7 @@ asmlinkage long sys_landlock_create_ruleset(const struct landlock_ruleset_attr _
>   asmlinkage long sys_landlock_add_rule(int ruleset_fd, enum landlock_rule_type rule_type,
>   		const void __user *rule_attr, __u32 flags);
>   asmlinkage long sys_landlock_restrict_self(int ruleset_fd, __u32 flags);
> +asmlinkage long sys_memfd_secret(unsigned int flags);
>   
>   /*
>    * Architecture-specific system calls
> diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
> index 6de5a7fc066b..28b388368cf6 100644
> --- a/include/uapi/asm-generic/unistd.h
> +++ b/include/uapi/asm-generic/unistd.h
> @@ -873,8 +873,13 @@ __SYSCALL(__NR_landlock_add_rule, sys_landlock_add_rule)
>   #define __NR_landlock_restrict_self 446
>   __SYSCALL(__NR_landlock_restrict_self, sys_landlock_restrict_self)
>   
> +#ifdef __ARCH_WANT_MEMFD_SECRET
> +#define __NR_memfd_secret 447
> +__SYSCALL(__NR_memfd_secret, sys_memfd_secret)
> +#endif
> +
>   #undef __NR_syscalls
> -#define __NR_syscalls 447
> +#define __NR_syscalls 448
>   
>   /*
>    * 32 bit systems traditionally used different
> diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
> index a18b47695f55..b7609958ee36 100755
> --- a/scripts/checksyscalls.sh
> +++ b/scripts/checksyscalls.sh
> @@ -40,6 +40,10 @@ cat << EOF
>   #define __IGNORE_setrlimit	/* setrlimit */
>   #endif
>   
> +#ifndef __ARCH_WANT_MEMFD_SECRET
> +#define __IGNORE_memfd_secret
> +#endif
> +
>   /* Missing flags argument */
>   #define __IGNORE_renameat	/* renameat2 */
>   
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
