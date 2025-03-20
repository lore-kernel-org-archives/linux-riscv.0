Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9837C36000
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 21:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHgsPyl/SqZ1ffBP+tlLp/3vCK5Zl4iBHjqkC2Lqtqo=; b=tS4KigHk1HzRYo
	8zhqjsSy/mFRwkcrCgaMkpfp+At14MWTkBhDZAkfyKR9RqhX7itu/N7adbfBGGjxIEdmjflpLATbR
	vvpD0/mSQGIyjg2v2zXdBjCrfyjLRKWrB4/jK2i5JttHS0dRxF0BwHTYXeHMeGJ7wdl0ulL/LoxzF
	7Nwj8/IYsHNR+rvSvMWHvYO3IZEeLgi9wx3KUqQvLl0wPNPKijdQ29Ja5YW0O5Wk9UugzhpstZZqV
	Fw+lgi6hm8RBVCwpHWUbcXKHiJZenLf5HkKRHcJJCZK+GMBdrln0AfgAKkO3rXgPezKfdUYYC8spY
	/vojp5bRciQm3cH9+CAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvNOS-0000000DEwH-2FCS;
	Thu, 20 Mar 2025 21:25:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvNOQ-0000000DEvB-0ozT
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 21:25:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43ba8bbeae2so1476565e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742505932; x=1743110732; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BM8p6OTMwPELuLuoM3O1JzZA7D2mDcWqh6aQhebe2w=;
        b=cE3MzaHwS7vBfE9+KSzuhDzQgRBfn7l9SIDVBApYVyBBBhHHeT7FbWEE84Yzo/byEm
         hKB5xnW0Q3PUgwjTaMdMDFo4LsG6H8a6eYYd/eOfUr0Ilh58tu8WH51gDyhQKnKy5KSD
         n6zJr5gTQ8gqQeFHJt6GiRRa46DXL+BhZ6PLsqotqsbA4KN9cy/n5hBr0MIugg/3rQ2x
         mSBWcDH5FUeHzYCx7uRJdXOuuSSX/myUXkGYwJZkXlnMdGVwdX8GGtvoCPKMAEgN0QOK
         knC9J6pQr+ojLboewC1GakkfPg/e6UYnYy+iHZ5x21ZsvBRD1UMQS94u7SsbFHjW0Z61
         4kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742505932; x=1743110732;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/BM8p6OTMwPELuLuoM3O1JzZA7D2mDcWqh6aQhebe2w=;
        b=Iy4kFrnQLQOck7Mx6hCi9bi2jdB5qcwkx7tP+Q/w4FCLf1Qgtx4bneyhYHrt2HUFA3
         PBPp0RdwBonlcxHfGuhoAURm1zSRWG5KSvneijIVi6CAwczgdc6G2t4V3dSbmIffGzV/
         jRmgk577tFQauii4Y/yheGfdSolPznjWOtfSnHKstSUg8WJvlmG79nOu7VU8KCXEYoi8
         7/Tc1rV7UTA2ljxcc5AYBjiJSA8d0VQOD2dfrn9wg04yPyoqaHaKo+FRAkfwGr9GQPgH
         rsVVookTBIXS9CWzYlf3gYbNXv5OeOoWkhFD+j5N12EtM1k5gTLKeuAEWDUR7zMIBvUR
         4SYg==
X-Forwarded-Encrypted: i=1; AJvYcCUNSnSYR5PnJE9B8p8WlnZDNV9fY2wvjn4l535xWkD+GEtKohMIvxMI3Y+YiMwAB6FHFC59HFLc9LYKrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuHhNWwK36qWXOZOM4TovotlWZ8IGzpRncM6xWlgqQ8BchqjxY
	8Baj0t7rM5wSF0wvhAyK7SQbJhq8jqhANg0DAbB26GFXT+GUnKmO8DWS/29Am0M=
X-Gm-Gg: ASbGnctrIQSdf8kYiKQdBjie5MTc1SkcsM0JGsXTZYBtUxqI2VioBY5YOuEohHOR7+o
	yhQ5IUG4T1bMYo9zNWqt9Sz76aGojlOV54zC1yzLqQSNeK/S8kSjPOBCNJCBAYTQE8YpnltWFnN
	TEmWCN+GJNnfKKWw1/6SpgxBO5cjEilsuKQzmZLoFcU/NzWU4gYkXsxkQiTO8JDphUkSnV80zgH
	bGu77hSJPVt6msaWuU9raUfuyQS7KS4RIuwKGgPo4wMBc//nUOdH+x9n4JRMIZYuz+nN6rWUQN5
	jRw0puL56P7MFCtIArymYi97NYXfQUVcOHP6A0KN87k9Ou5o2qQ80Vfv0Boe11hn4fYX7qMfNWE
	zKYC4
X-Google-Smtp-Source: AGHT+IENUyr/tuJjthynG7pDAFWYzf7OBnXUo8NpuhgchW3KTo0PDxUCxZfCqwEA5Mqzg2/ebVjxow==
X-Received: by 2002:a05:600c:46c3:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-43d50a53d12mr2494095e9.8.1742505931793;
        Thu, 20 Mar 2025 14:25:31 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efe55sm579763f8f.88.2025.03.20.14.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 14:25:31 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 20 Mar 2025 22:25:30 +0100
Message-Id: <D8LESTM58PV0.7F6M6XYSL4BU@ventanamicro.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "Zong Li"
 <zong.li@sifive.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov"
 <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>, "Eric Biederman"
 <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann Horn"
 <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v12 25/28] riscv: create a config for shadow stack and
 landing pad instr support
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-25-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-25-e51202b53138@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_142534_230847_C8297E00 
X-CRM114-Status: GOOD (  12.11  )
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

2025-03-14T14:39:44-07:00, Deepak Gupta <debug@rivosinc.com>:
> This patch creates a config for shadow stack support and landing pad instr
> support. Shadow stack support and landing instr support can be enabled by
> selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires
> up path to enumerate CPU support and if cpu support exists, kernel will
> support cpu assisted user mode cfi.
>
> If CONFIG_RISCV_USER_CFI is selected, select `ARCH_USES_HIGH_VMA_FLAGS`,
> `ARCH_HAS_USER_SHADOW_STACK` and DYNAMIC_SIGFRAME for riscv.
>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> @@ -250,6 +250,26 @@ config ARCH_HAS_BROKEN_DWARF5
> +config RISCV_USER_CFI
> +	def_bool y
> +	bool "riscv userspace control flow integrity"
> +	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
> +	depends on RISCV_ALTERNATIVE
> +	select ARCH_HAS_USER_SHADOW_STACK
> +	select ARCH_USES_HIGH_VMA_FLAGS
> +	select DYNAMIC_SIGFRAME
> +	help
> +	  Provides CPU assisted control flow integrity to userspace tasks.
> +	  Control flow integrity is provided by implementing shadow stack for
> +	  backward edge and indirect branch tracking for forward edge in program.
> +	  Shadow stack protection is a hardware feature that detects function
> +	  return address corruption. This helps mitigate ROP attacks.
> +	  Indirect branch tracking enforces that all indirect branches must land
> +	  on a landing pad instruction else CPU will fault. This mitigates against
> +	  JOP / COP attacks. Applications must be enabled to use it, and old user-
> +	  space does not get protection "for free".
> +	  default y

A high level question to kick off my review:

Why are landing pads and shadow stacks merged together?

Apart from adding build flexibility, we could also split the patches
into two isolated series, because the features are independent.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
