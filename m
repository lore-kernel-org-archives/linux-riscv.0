Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CA5E784BE
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Phl38KmsrZ8aIv9S4/zigUKm+NgDbck1CW6dYMmPzhI=; b=PoqzI7aj0y7+RL
	wZ7SJjXQlEaD3eWEnxpgP0fPu5YqY2wEI/6jao6OUP9QmWiuZUy5cRrYteAI+bmmvzrLwo+rV3lYQ
	8r7t01VSlXsgIrHVMougtZQmFwYI8jokEwBfzZzLB5bPcZEjFyZivakcRC8T7ptSro+HlagzCxiZt
	uYMO0N92aHasNAzbp1t6m63XT96K6WcA+cCZcX54HaEim51RakLRBXI4Rv7Kcqtw8RzU/F340qdwM
	8uJBmiLpOY/3Jz/U59JMaQpL0hyMBWZKcSnDj+rVpe8+7/84cLovEP8j8YJhyRhzUroNBtMo9HO1y
	mw1Rzo8rj6MgRHH5NosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZqqR-00000002mMc-27Ly;
	Sun, 28 Dec 2025 13:30:03 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZqqO-00000002mKf-1ilA
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 13:30:02 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-594330147efso10221827e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 05:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766928597; x=1767533397; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lWyQqsYJqWc7lm9cTjRQLwXSVE/IuAz3ei2okz3340=;
        b=QPDgTZsutGviVonp/6FU/JsAA/9QKxAI/C/UENbEiv9cRMO1VVmGHWMRJlopHK4Eii
         10jGkkidUQW4biTHBSH1Uh5W8xLqMvOsdX8AXkMfY2qX0Hi+0tMTz++s+8XQ90eIYlJj
         qx238U1uGNcu2FDGmaqlhSr5ZTsEBmQJ5RK8ioNacSU0c39vfBFRpYr8ojvN/Zosnoio
         meTWDOeDlNp67WRHQdwjDg5eed2jMNVGhnL9+AlhLDHEfr1SBDJ0p3YnQwcJwykpGc9e
         nA6PChYWrwN3vrDS/afBhxdxnbGeFa4kg4INq81HXv0dkYj+cuziFB2HFXgCi2ZGC7UF
         AldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766928597; x=1767533397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lWyQqsYJqWc7lm9cTjRQLwXSVE/IuAz3ei2okz3340=;
        b=MbBlIOsk8f/0oMGblwop+WwIpCxeOsY3lNPsL1S+mdbgvCkf1aoEaOYAzuCMSIzHRv
         zoBFH/pRQY0cU5YVCNiK5w2+or65P1fFnTgBeTwC7idc25KIACFcMrf1T5IvoLY0/WBs
         VxNx5wTDH+ihDb94gt6ZJoaBQba3n8p+x3quTyKR4W1G5yXGeyT8hr8EDV8IthqonN/r
         z4pxPFcJ/ceoyiLcr6OjKSZfmW06dfwXwSaefxtnd7hBIaPI+TBFSld5jF3xAxGoJeeQ
         ZyNnf+Pg0IKygMvlq0Vsv9P9j1GeCjJd3ES/wtBFB8KFzz31mwlAJ5GkYNKIwHfA9Aph
         2dsA==
X-Forwarded-Encrypted: i=1; AJvYcCVV9fZlOlsEqPrqfcyvGS45bsNNNaQQxv//vAZJujjrkCGxtV3kJp1cE8vJgxHfzeC+EFTiWnqfD99now==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmGyEXSgTkIyQFRoAQM+Ks4AufAyTfB4Dq3jDB5MkAotjgZ9KW
	mOAvdMUwKtrJ6Xb4Y5Zwul78hjhIYIrcomLLV+vW9+njroB9Gjp66fN/
X-Gm-Gg: AY/fxX6sO7QCaH3Bn+/PbQUpWQYdYIFRza+4hrYjM8Vrz9hfgU2ZBT+ct9Ad38X2B34
	unXH+HypOhMcEh75aNX3ksqIlxY/VjgTanfLCZtPokMacfXJKQp5Mv+k8Uk706mCgyg9KMSx1/8
	LgreptCoID0OYOjdYbfzKNuhvieQopkUCHWdwUb6IpTEh9eAxv5zIFv1Tt3U9g/mrOCFdHTyx/4
	6jJlcXlia2em69UPO7iHDZRYsEP8LYFjekvgjFpwvgDjs9wVs8ytXxvI0bR+JeBMTv5gG4cwa7m
	7NWuL1u3FP2ZPJr1aBIWJd0yYbIvFkXak5OOru5b3a8kzmiGFMTeoU4ox2JYnG/uaSGVEi1r+sD
	6QLU69HxDm5MQafdbbW4U05qmqEYJM4VOVGd6sb4kQKgO4kL8Xz8FLeDKHA1tdqr9k5pc/QOmyX
	ml94r/kUm4FkiGDBW6ekfpieH6eVxR0Ub7tKJLSPYYxWUmg0oSjGjMGInXjR9AWKcu4OrU441MG
	0Xelmha
X-Google-Smtp-Source: AGHT+IGo/pr+AQ2VNaaG2TyhewLh2BG0nsRAoXdF/d33J1EZZvYOr8FxE2Re2WZCgj4kGCoIAYrr8g==
X-Received: by 2002:a05:6512:3b0c:b0:59a:11b2:2c08 with SMTP id 2adb3069b0e04-59a17dd5fb7mr9312428e87.43.1766928596662;
        Sun, 28 Dec 2025 05:29:56 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:425c:b771:d34f:d055:3147:bcd9? ([2a00:1fa0:425c:b771:d34f:d055:3147:bcd9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d602fsm8238417e87.11.2025.12.28.05.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 05:29:55 -0800 (PST)
Message-ID: <d58d6cfa-d9d1-47fd-91e4-533756f3b3bd@gmail.com>
Date: Sun, 28 Dec 2025 16:29:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/28] x86: don't reserve hugetlb memory in setup_arch()
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20251228124001.3624742-1-rppt@kernel.org>
 <20251228124001.3624742-26-rppt@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20251228124001.3624742-26-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_053000_540089_F4A1F2CC 
X-CRM114-Status: GOOD (  15.29  )
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

On 12/28/25 3:39 PM, Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Commit 665eaf313314 ("x86/setup: call hugetlb_bootmem_alloc early")
> added an early call to hugetlb_bootmem_alloc() to setup_arch() to allow
> HVO style pre-initialization of vmemmap on x86.
> 
> With the ordering of hugetlb reservation vs memory map initiaization
> sorted out in core MM this no longer needs to be an architecture specific
> quirk.
> 
> Drop the call to hugetlb_bootmem_alloc() from x86::setup_arch().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/kernel/setup.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 1b2edd07a3e1..e2318fa9b1bb 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -1191,7 +1191,6 @@ void __init setup_arch(char **cmdline_p)
>  
>  	if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
>  		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
> -		hugetlb_bootmem_alloc();
>  	}

   You need to drop {} now, no? But seeing that this *if* gets dropped
altogether in the next patch, you may as well ignore me... :-)

[...]

MBR, Sergey


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
