Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB33C28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 22:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOAw2gvnv3pFjjrWj9Bn6uNEjgXuEQDtcRcT9LQPoS4=; b=KrfahQFzI90iwt
	U+fBPjoCYX7+4yieIBK3REMsqPONA+GbWUNUJpXxolilsxKvjoKgBaDUd61jiglwxd8ginE1DoLXi
	xWITDKJptnzWkvPECKeMf2jUMlLsasUPa9qQ11b5M8uontmHPvRym7CLj0Tkl8qRS8nXcAdbqvaE5
	embAOG/zhnIxiVKah4jo9DU8EKghaycaAqH1qR3x4Ixm0R1anL3hLCxSYvbCn9nFKMsk7wOz6Op5e
	UJ/X/IpXGOhup3moU61wg3OOh3YqV8fv5FU59EGlfm4awrrTOEFA5pVa+Q2aGg2pxi+D8B/GxXKqU
	Z4yNzEXfHnNEhF3XPZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvO7a-0000000DKT1-3xaf;
	Thu, 20 Mar 2025 22:12:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvO5d-0000000DJy0-1HEp
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 22:10:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf7c2c351so949445e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 15:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742508611; x=1743113411; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewXqUeA7RBIygwSLbMlGfEG1GVvVQPFVPFBcsvVuklE=;
        b=dRX+qTDu8t6EYzprkPhccbooxWcFrHBpMxKiK72ayGZ96N6tT+tP3It4SU5yag4RzF
         YqGINZK4+WaiftTVXbgnEIvKX3vdQbysNCB7O8p2TZMf75buyL24Jq17ijAJo1pLQqKH
         6HCcntech0ribv4XOqZkRejuS6N/9V97Q7+C/q83R21fB02KM8I4MxvhY+1Gaffylne9
         cMnahU6hpSSKQo9zPp/KChaowYhILuDFLcTnBCMPZJaRqNXkMBHVoHTlr+kwumno/X68
         H+2Tz7Un51m3KcSGfjeddOGS9VxC/kc7A7lZSCeZVXeTA45qouZEmnXE52KkNaY4nuw+
         xe0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742508611; x=1743113411;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ewXqUeA7RBIygwSLbMlGfEG1GVvVQPFVPFBcsvVuklE=;
        b=Rg4hDFvciu4nQV6BhePnku+RTwNjGgEn2j5NV9EZwbZONMahsK6yAeuI2cwZwYdKbK
         Cxmp7oNwLn8nWSqveoF82CBOOot7oDqgWwBuLuLjSuakmXEC9t5gqEaVfH95z5VoB0l0
         Uew9h68+8eMyOywFZ72DZm6uv8VbtuOj/YOkovHI6OVa+cih99pzpHs/5kyjskD3NiNw
         Lu5VnehUCwPpeqxN4LjlwXIZd1x43v6TeHL7UY2jVd53qoZDysezy+UmFv2zfpc4C+Bv
         DsMqto2gIo++DpUj0IOylIv3FfWLVMI9cohSiEJ708mwXHpag3LUzUx7nmWI5buVjV5B
         egvg==
X-Forwarded-Encrypted: i=1; AJvYcCUautpuSdjnQ07eMy2cYUAp2ENsI3AXI+sBxqhjY74trlBLueaaKtS5xSnd9fjswmJmYJx1wN8z7ASrHw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9ph6D8Xv5z//TcgWMGPx+7FUqr0dVQmvEt2Lt+lEMOPmUqqMM
	wC3tj9rrbFUOoMwTjUe2x1A+G2ESRkU7HptobqDO7xEZC8GldSsjEwp3xKPWioI=
X-Gm-Gg: ASbGncvdtG7LogetraqcFKqgKMxFltekAqzkMNG6hG0SSLSmmm9cq6Q4FxTc75OW3rD
	z4ZN6bx7P0f0TRV7cQHPo7XvAOn9N1fZnppLcF90vxfoThJGUpnNjdCwNSeDBxJXHdTCkjgxQN3
	om0u/QQnjBWSYPPwQTnaeFmpBZtEWIUJ3Et65euiSPJJAteLCqWSoVc3iL7/m64hzWLZeEPtWdb
	JeGtY3A8JtvlRPZ+crG8dA+z9U/vLPbsJFPyxri1SsiQAL0ZVWrPqBExvxLcat8d1EqhmVj91Oi
	BnPRGDKqTPVP9Hf3MDP0csY1EnTeMvH2chXH18aUNeJiH6asEXzuuJbJ9+mVgj81+Wrhkhkmgt+
	F87qZboiu9uKzzyA=
X-Google-Smtp-Source: AGHT+IG3iOdJG0QpOBXcV58Rkg48UtcOBUQNUhvPAa+an4gh1o0G7FLaaJ5j+6uFEW3mo9uctUtXkw==
X-Received: by 2002:a05:600c:5252:b0:439:9909:c785 with SMTP id 5b1f17b1804b1-43d5171da80mr576165e9.7.1742508611223;
        Thu, 20 Mar 2025 15:10:11 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9eef37sm655138f8f.85.2025.03.20.15.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:10:08 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 20 Mar 2025 23:10:06 +0100
Message-Id: <D8LFQYX4EHF8.2AJ01XL34WK0W@ventanamicro.com>
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
Subject: Re: [PATCH v12 22/28] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-22-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-22-e51202b53138@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_151013_337736_2DE2F20B 
X-CRM114-Status: GOOD (  10.87  )
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

2025-03-14T14:39:41-07:00, Deepak Gupta <debug@rivosinc.com>:
> Kernel will have to perform shadow stack operations on user shadow stack.
> Like during signal delivery and sigreturn, shadow stack token must be
> created and validated respectively. Thus shadow stack access for kernel
> must be enabled.

Why can't kernel access the user shadow stack through an aliased WR
mapping?

> In future when kernel shadow stacks are enabled for linux kernel, it must
> be enabled as early as possible for better coverage and prevent imbalance
> between regular stack and shadow stack. After `relocate_enable_mmu` has
> been done, this is as early as possible it can enabled.
>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> @@ -320,6 +326,12 @@ SYM_CODE_START(_start_kernel)
>  	la tp, init_task
>  	la sp, init_thread_union + THREAD_SIZE
>  	addi sp, sp, -PT_SIZE_ON_STACK
> +	li a7, SBI_EXT_FWFT
> +	li a6, SBI_EXT_FWFT_SET
> +	li a0, SBI_FWFT_SHADOW_STACK
> +	li a1, 1 /* enable supervisor to access shadow stack access */
> +	li a2, SBI_FWFT_SET_FLAG_LOCK
> +	ecall

I think the ecall can fail even on machines that have Zicfiss, so it
would be good to disable user shadow stack if that happens.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
