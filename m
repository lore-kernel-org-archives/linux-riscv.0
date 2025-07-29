Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218EFC83F17
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 00:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jtj4U5Svf5Il6fNkLWrRZE8Snw9KpOcDkP4db2uZKNY=; b=xtkUxS/sVP5xzZRmDXQHPTEEh7
	7+4mQy7MsiUUvhj1Xk29bWTbJRISYB4WsjIDYvJT1EjWlRzdosPrfpwZbAlOOw9rUvOAmzvTwKwih
	836nSPcY3dqxNW5PNlXSJF2aB7clCXCbLVie9xO1VxckcyGcN8yd4SYCGNBDTJvt5SB5O7dGhtr3+
	/kYbSwML7bd3f3O9y5bZhIjnpuawtdu0XRZ0sN41wNLrtp+Ub4KlArdIA5/gp1nXFV04vtgogI74M
	5VDV/QBBsa09X1g67NQSkXSWkEOfOgYc6BQ278vEcQyKvuqFne6yZouEIsWPtGISgTOlZaLyO8381
	ab+1aJFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugYKH-0000000FeLN-2Pn2;
	Tue, 29 Jul 2025 00:36:17 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugYKE-0000000FeL1-1aRB
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 00:36:15 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b170c99aa49so3691206a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 17:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753749373; x=1754354173; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ETbDJbyMnJcJth9NSQ1EqJE54cIcDMP4wIxlGlnYcw=;
        b=OqJpUpuZ8hbhVYvVd4LfFNmwnLTSL5eX+63eoQgoVA1qiARj7m/HH0J/NdCSC+AjH0
         O78pLPTKtyqNN6QIln+6KIH8wTFssMD0zgmOtOpo++3t7y9vs/lsYYRfONJeFv6GT1DI
         xJT8aSHuOOqA9aiHj0x083kGfOBSu5DD/1BHi1YNufiBzJa3VzOo3XkjyIDfUPx4dOv8
         gN2bKCT0OwjzUSPNQL+Eex2KJVqkDuM5qGLyqW66zjNTj53xUxauDCdLxCBrWxgSwgZM
         DvHwLg1pln/PmZyCmYbsgrTd7yLZI0dwXwVxqh67jDzS0iRY1sIRBSNuFt50cCVVanmJ
         RI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753749373; x=1754354173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ETbDJbyMnJcJth9NSQ1EqJE54cIcDMP4wIxlGlnYcw=;
        b=rV2dHWcTbDO5vm57C24tiJZs37gahwBv8GlcuTTGOyyOKDb/yUPFebZ7D4CkGQZwle
         TuaxtsB+3uG0CKaT2wWL8E0uZz8UF/aSSc/oTDJ1H7e5UnCt/98b6FAZirioSOWPpK9J
         x48WHJKV6jUFG7yc93AsVjCPW/Fl8igGltsyHJ4URlQLxbpDcZARCaj2AAro3086o96M
         TrXn1iJABvSbXbDtjQngGytouRrHT53BU2f5+GcTUOLp7xrkUfLmFC32ndjJow6eYkJ6
         pu1USLNRhok5OtsfW4DEgEleEQZe7Z0dN/jRW/xv9YYw3YIY38Mq3Dfp3bKC3J7sGUwr
         OWGg==
X-Forwarded-Encrypted: i=1; AJvYcCWjPsl/TNK9UbwLX8+Uroz59F3qxu5yspXXJAQj5IgX5XyoGJ3XKb1Ru4GsXZXIQPstrLGQxDLrX1uC3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIxF/TL4Ou6WO5duiW1Fe6Ib4ulQK3pzZSFCadEwOhwlKt3Fi0
	RQKk3bb34/We7ip+Iq3gk0qh8zHeyyLxlbN5HNwlD52OieSUgtKCI3M8b23pcJMbSd0=
X-Gm-Gg: ASbGncvAPGbJrNSAoBfUGlyCARiFzzVBLH36jzY9m0N1gpw7HOJD+LFfc7ld3foKAka
	LFeHICcvg3BUYwFwem8QgM4AIxNjM1s74kn/P1Zt/rTptEYY/gLCdOV9QBM6SEVPZsHEotPmhP0
	+u9cx6filtl1aVBxKckVS/j7h0RAgH0KWWYiX5iS7k1Niheky9g9kE7nSUXKxv/+cg2gJHIpxtd
	SrK/daahcP8Jsq0ayLAwDXI4j6/gnv387WN9ApKCxuy2LJw5fl0B2jU53eHyDbicSml/c12a5/h
	c8T03WoMPtGKohB+6HF89WROVpExcd3ij9AQjU2dbmCnEGjNl7Z6EPOaHDUd+0EAWkPy32vWTR0
	A5e/GAhCtL83lkptdWooTfBtp3XgqcR7K
X-Google-Smtp-Source: AGHT+IEDJXqhf7DRrajAJZBJ8vJ6pYcfACWj1AXTIy+3dQeFkQYCW4S8o7ad1lMROev+GL8TvcTWBw==
X-Received: by 2002:a17:90b:1b45:b0:311:f30b:c18 with SMTP id 98e67ed59e1d1-31e7785ee72mr17793124a91.4.1753749373373;
        Mon, 28 Jul 2025 17:36:13 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31ecd1f0e80sm4264442a91.18.2025.07.28.17.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 17:36:12 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:36:09 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, samitolvanen@google.com,
	apatel@ventanamicro.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com,
	samuel.holland@sifive.com, bjorn@rivosinc.com, fweimer@redhat.com,
	jeffreyalaw@gmail.com, heinrich.schuchardt@canonical.com,
	andrew@sifive.com, ved@rivosinc.com
Subject: Re: [PATCH 06/11] mm: Introduce ARCH_HAS_KERNEL_SHADOW_STACK
Message-ID: <aIgXeRDXNmOozRWp@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-6-04b8fa44c98c@rivosinc.com>
 <aISGypOAaDGaUZgd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aISGypOAaDGaUZgd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_173614_667992_62BC08C8 
X-CRM114-Status: GOOD (  14.76  )
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

On Sat, Jul 26, 2025 at 10:42:02AM +0300, Mike Rapoport wrote:
>On Thu, Jul 24, 2025 at 04:36:59PM -0700, Deepak Gupta wrote:
>> commit bcc9d04e74 ("mm: Introduce ARCH_HAS_USER_SHADOW_STACK") introduced
>> `ARCH_HAS_USER_SHADOW_STACK`. Introducing `ARCH_HAS_KERNEL_SHADOW_STACK`
>> so that arches can enable hardware assistance for kernel shadow stack.
>>
>> If `CONFIG_DYNAMIC_SCS` or `CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK` are
>> selected, skip compiler flag `-fsanitizer=shadow-call-stack`.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  Makefile   | 2 +-
>>  mm/Kconfig | 6 ++++++
>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 35e6e5240c61..7e3ecca9353d 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -987,7 +987,7 @@ LDFLAGS_vmlinux += --gc-sections
>>  endif
>>
>>  ifdef CONFIG_SHADOW_CALL_STACK
>> -ifndef CONFIG_DYNAMIC_SCS
>> +ifeq ($(or $(CONFIG_DYNAMIC_SCS),$(CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK)),false)
>>  CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
>>  KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
>>  KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index 781be3240e21..f295ea611cdb 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -1367,6 +1367,12 @@ config ARCH_HAS_USER_SHADOW_STACK
>>  	  The architecture has hardware support for userspace shadow call
>>            stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>>
>> +config ARCH_HAS_KERNEL_SHADOW_STACK
>> +	bool
>> +	help
>> +	  The architecture has hardware support for kernel shadow call
>> +          stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>
>nit: tab and two space for indentation of the help text

Will fix it.

>
>> +
>
>I think both ARCH_HAS_USER_SHADOW_STACK and ARCH_HAS_KERNEL_SHADOW_STACK
>belong to arch/Kconfig rather than mm/Kconfig

Do you want me to move it?
This basically means that hardware shadow stack is supported or not.
It needs mm support. I think thats why user one landed here. I followed.

If it impacts mm, it should be here, right?

>
>>  config ARCH_SUPPORTS_PT_RECLAIM
>>  	def_bool n
>>
>>
>> --
>> 2.43.0
>>
>
>-- 
>Sincerely yours,
>Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
