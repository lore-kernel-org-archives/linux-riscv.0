Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCBAC28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 21:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsPYwksJrnNSZhK2fwVDubfLz1upwJOfKgmQxTrOiX0=; b=dMiOcZNsVOoBlQ
	YvBT/sf9WdNf+LpNIQ+FETtpKRnp85VsWkC614nr+JBPU5ho7FfJNd7PwP81icKjWFt8A6Ul/H1Cx
	07iSzcZiX1hb4wz3nQaRLbBtfxwSnYOYT3+JOg38BJZd7Ak81+EgATGdasnK/yuqloVHXfWA/O+68
	0svPDJjuiRJl0DrHZskQ/tGU4pkLXiGu13DXgqvAQey/CufnzjggnsTMM981yEGlZMJF4xIYzJ8DX
	35itILdvEpVfg0CYUXpyaCQ05B/Wt9G95AlScWBfpRTEnFikmkK24d0VCmSOw6yqXELSNwW+YVMNT
	59dglZAvPwSUMu1ti2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvNYV-0000000DGGi-2KFI;
	Thu, 20 Mar 2025 21:35:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvNYT-0000000DGFd-0wrn
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 21:35:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so474625e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 14:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742506555; x=1743111355; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqJgAERJO0hWodgjO+O6nsJOj3YPTpObkXEvNBlmG3c=;
        b=XglR/uMuYyB0Tq1M3e+wbM8x9cQRe0IwHqQ/toJCCQqKn2V5vPka/fEKSLtLyqJcFX
         ll44NgJor8bWwKM/RWtx3xyuLTX202CA2kwnMawJ+ykKyO5xAP84TYBXT/ZhYZ0c9ZKq
         CLDVJrMrWOlVGJ/0BdLIVbthQQOehPIBqWuPoOkaK1wy3/FFkqQ1VA5I/U6Ia6RpcAwU
         tSGdWn7DLUUHB5rhH0yQJKWZ0zLJAdo1qWPRR4+PUJOTdnDuCqeMzPGWREjNBGRv1Wgv
         l92//PcKPbdEAibLSP7Qzl2h/NRdKQ5MNrDJ9Br7bvbmBqbOFJJC96l8lwb9Mq0WR3iM
         1Tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742506555; x=1743111355;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JqJgAERJO0hWodgjO+O6nsJOj3YPTpObkXEvNBlmG3c=;
        b=lyttVhqsYH1Ec+aYL7PVYLmbeEN/fBGZcSb/FuwmXa2uNd6GWB15WYEhXqDbaualBF
         e1gqIULp9UU02xD3C3SGbaYCXjB91AMZzKgRkkV0CZwvcaobYVptczT30Pz7cylPLgu4
         DL4vEnvWqFgSsnPqOl8AxTMKzUf0odJAwkJ5NRZ7IVbVM1cpr+NSdMJcy/PhIP8x6Dx/
         36lvUUYlnUXbAlcbRwmfjtY+Os8EK91sO4BR6fPbpixPtnc5jqtP+LSGj0ocb94b2HxS
         V9V1ozo8kuOGAqMs3sN0x13K2Txd2gKtutE/OCUkNj4uUWqgMHPASis3+gfSNztk6qVU
         alaA==
X-Forwarded-Encrypted: i=1; AJvYcCWlsd6GOVGIAyWlZNO1MSemoFmA32FkjRdiOqYt50v76IaHAVTrk0yUjbPzfCz6hneS7eCB0T676Gn1zQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy38KflvBRh+cYXPpNXkNLxN6I/KZPhLLpd4UtB8gflUVEkvb4V
	8c9WvD4yJOE8IFa2ay7xYNdaQICqPBpHj+DrdPGNFG93iqmJ0E9Am7X1az6NFmA=
X-Gm-Gg: ASbGncsMZ32ozCjy3uBDv6HRu2ER/iCS7CqAHAZy+bFZhBQ6krRtfx+jzqXp67kIBs7
	ttHUnRzK62Ez2Av49zf1DSXRc3TqSlQ87gM/De1dcTH7wwULGkyN02wPiChBuvIB08DEKbWqb+k
	tUqCESCa0D4MR/f2FzjyGzdoo+VFXZ7J+s/KXa65CreVAQ+ihU2jLjo3DqLzc9FFIP+eg5UT4kS
	6Fuq1hOrWKrmfLfW1eJnktQ/G7QxG6Ou+xR0j1taqxvFCweYmJ0oymEVhuBZG+DYu70Cbfx7iT0
	HRor1augB3B3q/WLoLTvMEuKM/4lIORsuBdFOQlwEp9WYMXZDeSUC+bpwyw8Nd4YPevuH+Z+ssH
	/pY9S
X-Google-Smtp-Source: AGHT+IHQLBHBcxn45pDMJ6mBe7Q5GjHdSOzikTUHc7bZFFqM3IvCF49MKGgOPWFCY1ifjxDw5fxebw==
X-Received: by 2002:a05:600c:3552:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-43d5170c622mr550105e9.6.1742506555439;
        Thu, 20 Mar 2025 14:35:55 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef16csm605211f8f.86.2025.03.20.14.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 14:35:53 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 20 Mar 2025 22:35:52 +0100
Message-Id: <D8LF0RDZ6809.1I3MCCVSHRSQ2@ventanamicro.com>
Subject: Re: [PATCH v12 23/28] riscv: kernel command line option to opt out
 of user cfi
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
 <20250314-v5_user_cfi_series-v12-23-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-23-e51202b53138@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_143557_264171_A1DE9E09 
X-CRM114-Status: GOOD (  15.35  )
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

2025-03-14T14:39:42-07:00, Deepak Gupta <debug@rivosinc.com>:
> This commit adds a kernel command line option using which user cfi can be
> disabled.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/kernel/usercfi.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
> index d31d89618763..813162ce4f15 100644
> --- a/arch/riscv/kernel/usercfi.c
> +++ b/arch/riscv/kernel/usercfi.c
> @@ -17,6 +17,8 @@
>  #include <asm/csr.h>
>  #include <asm/usercfi.h>
>  
> +bool disable_riscv_usercfi;
> +
>  #define SHSTK_ENTRY_SIZE sizeof(void *)
>  
>  bool is_shstk_enabled(struct task_struct *task)
> @@ -396,6 +398,9 @@ int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
>  	unsigned long size = 0, addr = 0;
>  	bool enable_shstk = false;
>  
> +	if (disable_riscv_usercfi)
> +		return 0;
> +
>  	if (!cpu_supports_shadow_stack())
>  		return -EINVAL;
>  
> @@ -475,6 +480,9 @@ int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
>  {
>  	bool enable_indir_lp = false;
>  
> +	if (disable_riscv_usercfi)
> +		return 0;
> +
>  	if (!cpu_supports_indirect_br_lp_instr())
>  		return -EINVAL;
>  
> @@ -507,3 +515,16 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
>  
>  	return 0;
>  }
> +
> +static int __init setup_global_riscv_enable(char *str)
> +{
> +	if (strcmp(str, "true") == 0)
> +		disable_riscv_usercfi = true;
> +
> +	pr_info("Setting riscv usercfi to be %s\n",
> +		(disable_riscv_usercfi ? "disabled" : "enabled"));
> +
> +	return 1;
> +}
> +
> +__setup("disable_riscv_usercfi=", setup_global_riscv_enable);

I'd prefer two command line options instead.

In any case, I think we still document params in kernel-parameters.txt.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
