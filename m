Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D455BC28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 22:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYo9DbIX3Irw94+QUtsjuTcgP79sI9l3S/oHfCrISBU=; b=vbKb826oXlLwQr
	dvy/gseMw3pe5QjuWa7j4AmETYaDGxRLr8DKAMDGyDtL/wWoGc0GI6fUfIHFveDaSTbZX5Vd24Gy0
	zs720Eu6WyC8byqPzxVMdvHNkmcGx3Vg72pumXBTYq9olMWjQ1jB5rrR7twPX9KSThSkDf59bkWyW
	i4fbN3zMaxBwmDq2hKf151cAIEFURRa3XT9N/0uCVBHY3qfsYfBKLnCV32ylnw047qSIzcseAPGKJ
	oiH0/ucPzO4x5j0913MGhUjsA70P1VRZYuVRspHe4Od6EkFCNbJGZ/wIf6TV7lf0KaGYh/FuVaUNs
	rNZYgrCfuqFcRw7LdSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOKy-0000000DMQQ-2hEV;
	Thu, 20 Mar 2025 22:26:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOJN-0000000DMBI-2dPa
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 22:24:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4394944f161so1495305e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 15:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742509464; x=1743114264; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3HA3HoJNZW8enSnrAqrQ3Y05aO56vxfDpg3v9Wkt6M=;
        b=hULM2VHt/EPJbYhmoRnUyoa1y5vS3Zik4owGIQo5Y1eatWXkXekRSS7mjq1+5CyVT7
         IzABegBCYbNXt9e/gZngwzOTMM3hG1K2AZvbOYnfignK8WZi0LlN6+KwkNx+M5YHmaDI
         B64j8WZTYNQj8VCFhwrOpb5aHmpG58jP04kkT3avrug5cGrRYgJUijroJQc3odE3P2yc
         ZYIDYxiPb2tBkRQ7ERHqVPASwOzcGqG4Q6xK/rYdLZrNoBATcxmQMDdk+LscLYZUYjEn
         025/SXdPLT8D4OGFFfNUnfFowwZhN0KFTqGVOOSv3b3GJX+Y6iUB/EftYB2ozbCwbCu9
         Kbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509464; x=1743114264;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M3HA3HoJNZW8enSnrAqrQ3Y05aO56vxfDpg3v9Wkt6M=;
        b=DJW940lVlZb50LUl6T8NF5PUHDDDpXdykE99MvIYqBdydItP6rFB9NH+J+hzn5eEUe
         bp/Iex2vklfJ6JS9gMyHdm9MuNKl3GQILlWLFlNzZ3bXADkn65dodD6x/tqJMDde4cM1
         +eSHSRa24gVrw/8xR/K07zpigXuriMtRMuoTm71Yb56o16x0x40uWMIkWlvIguOEhWU4
         jzeo74wElr4Ao5XMU/AnzHlUT2bILcp7O9VWt1l7HlMDoMgHx/pl6aM78A0l3MjxiZsz
         l2gArpPvoA4VgcAUg1XlBjmqXc/t97nicnMEYuFYCCEtQBFblWi6PIyY/EG6dj0C9XT3
         mCcg==
X-Forwarded-Encrypted: i=1; AJvYcCWUbLYqtVCpDv4yWon9LvpgVxOM3bV2Rpwt8Waok6yfIrjiIqWScPZWarFlHQlLv/DRX4m8DsXdHhWMdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyF/Tb7KSOp805SbZU4gbvXiSe7I9DgHDv71gQi6qgfenDd/Ezd
	of7zmAaq0wBS+zWOqRLfyPtGYA9baKvKZCZlSEW+IaJI28WS4y+34zWJjDJRXeE=
X-Gm-Gg: ASbGncta2iKx7jJH38yfFd59A/U1OhXWdG1KVvTx4i2U+CRa6yax+BeO3QnlMdsFYlR
	fag6ZTGl2K5PdtS3XKB1T0/Z74J4Cu5rzcWYn4k1kzFu9Z8YvRBE7FABVa5bboA9XqapasZLnsV
	UVfmAup6T4ASfvEKg9oAkKpZNOjxw9KTNLBnv+NzbdJ4qMvlSz/VDCVlcSwXanNItWKzxo7zSud
	odjkIBklGCdlA9+qQFnGsxQB4RB+Flu5dBQLplOqgrpICAgUwfmhE3p9sGXN2ua75V2g6rFU5Hi
	6Gh4DRP/sqGurAVenstDepPXevpUcd6Jk8KhvpRX6g4kChrxO3R3FWNqZFpSArFIZLq+dg4SiLS
	rzEZ2
X-Google-Smtp-Source: AGHT+IE69CkeFEj88CLeab7klKRoAawBZazbHPIMjQcfhs1Va11jKN4uP0xkM8FxO9at+ieqUDxG0A==
X-Received: by 2002:a05:600c:3110:b0:439:9a5a:d3bb with SMTP id 5b1f17b1804b1-43d509e428dmr2353095e9.2.1742509463811;
        Thu, 20 Mar 2025 15:24:23 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9decbsm9222955e9.27.2025.03.20.15.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:24:23 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 20 Mar 2025 23:24:17 +0100
Message-Id: <D8LG1TTBMPWX.3MKAEM8X1WYAX@ventanamicro.com>
Subject: Re: [PATCH v12 19/28] riscv/ptrace: riscv cfi status and state via
 ptrace and in core files
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "linux-riscv"
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
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-19-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-19-e51202b53138@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_152425_662166_C8AF8CA4 
X-CRM114-Status: GOOD (  17.23  )
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

2025-03-14T14:39:38-07:00, Deepak Gupta <debug@rivosinc.com>:
> Expose a new register type NT_RISCV_USER_CFI for risc-v cfi status and
> state. Intentionally both landing pad and shadow stack status and state
> are rolled into cfi state. Creating two different NT_RISCV_USER_XXX would
> not be useful and wastage of a note type. Enabling or disabling of feature
> is not allowed via ptrace set interface. However setting `elp` state or
> setting shadow stack pointer are allowed via ptrace set interface. It is
> expected `gdb` might have use to fixup `elp` state or `shadow stack`
> pointer.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/uapi/asm/ptrace.h | 18 ++++++++
>  arch/riscv/kernel/ptrace.c           | 83 ++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/elf.h             |  1 +
>  3 files changed, 102 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
> index 659ea3af5680..e6571fba8a8a 100644
> --- a/arch/riscv/include/uapi/asm/ptrace.h
> +++ b/arch/riscv/include/uapi/asm/ptrace.h
> @@ -131,6 +131,24 @@ struct __sc_riscv_cfi_state {
>  	unsigned long ss_ptr;   /* shadow stack pointer */
>  };
>  
> +struct __cfi_status {
> +	/* indirect branch tracking state */
> +	__u64 lp_en : 1;
> +	__u64 lp_lock : 1;
> +	__u64 elp_state : 1;
> +
> +	/* shadow stack status */
> +	__u64 shstk_en : 1;
> +	__u64 shstk_lock : 1;

I remember there was deep hatred towards bitfields in the Linux
community, have things changes?

> +	__u64 rsvd : sizeof(__u64) - 5;

I think you meant "64 - 5".

> +};
> +
> +struct user_cfi_state {
> +	struct __cfi_status	cfi_status;
> +	__u64 shstk_ptr;
> +};
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* _UAPI_ASM_RISCV_PTRACE_H */
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> @@ -224,6 +297,16 @@ static const struct user_regset riscv_user_regset[] = {
>  		.set = tagged_addr_ctrl_set,
>  	},
>  #endif
> +#ifdef CONFIG_RISCV_USER_CFI
> +	[REGSET_CFI] = {
> +		.core_note_type = NT_RISCV_USER_CFI,
> +		.align = sizeof(__u64),
> +		.n = sizeof(struct user_cfi_state) / sizeof(__u64),
> +		.size = sizeof(__u64),

Why not `size = sizeof(struct user_cfi_state)` and `n = 1`?

> +		.regset_get = riscv_cfi_get,
> +		.set = riscv_cfi_set,
> +	},
> +#endif

[I haven't yet reviewed if a new register is the right thing to do nor
 looked at the rest of the patch.]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
