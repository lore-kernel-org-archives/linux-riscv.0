Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10CAC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 17:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=b5TidAY6fcaR3fxEf30Fg6O2HFL5dQn4Rls16FplSQ0=; b=3K5wByDRuWAlUGeqSfRmssLdMZ
	Ek0zYl493vWvuiXh/Qh2SMvRbbpVA6md7wBjglMtusKBYowq3D6bTfjqdFvYV3dDiKeXXOhZ3Yf80
	MbhUmO79LZm4tWlyn3DE9A3wTxsVkBcw6K4OV/a7OMp2GsCRWMku6bioN6cTrPh8YzlDRPqCpp6y2
	mj6lNmyfkyxyvLa1QPS7W2Nyu63ZceBmXEe8ip3zw0ii2ApNIIA+QvvslH8pjMgEBBg3OzgWJf6JN
	DANGnZQQVfFFxbI+TZOQ8o/klcTRilp+vmlGlzJ24kzT0wxIFOciS8QvfkS5MRAOPhkXhBvc5gq5C
	/af8TXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtDr-0000000BHdf-2eEa;
	Thu, 27 Jun 2024 17:47:51 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtDn-0000000BHcc-0sAm
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 17:47:49 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-71884eda768so4235929a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 10:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1719510466; x=1720115266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pP/AqxoKCyoqEpFvmzCtu+OJjkK1mMvRQlVqjG6zlp0=;
        b=hmZ29g/JsjR+3ehZ4dtNtjgx9mtQDtwzz4XTskkO8F+5XjIxMDKA/dgrIb4w5OUU5I
         WkSfI11LOyTNcJ0IjmdhvijslDXwKWImctU6fFjFtLFZV4M7SSsLLRQ0IlBjw9xfiFx/
         sVKAvCUchmCDmx8jNVSJuqwpC5rfPKa4Nw8/xkX5JK3tWxbttALJFEWaOi5X6OgbhNhq
         npGw7TExjlM0XCCRGgkBKXGQt5e4jGQ0ZvB+SG7sa2lgTYtlUaZuaSCr434hr6xi9Xmd
         +xrl5Bhm+3sFFXJ2pkDQcAgkL0rtRNlWZpl2d52yzgi4XLxc0vazKM1KtISo7b+d0ZXJ
         k+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719510466; x=1720115266;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pP/AqxoKCyoqEpFvmzCtu+OJjkK1mMvRQlVqjG6zlp0=;
        b=cS6XT03aiupQbXdYlYjBeoK7en/QQgo4bNEpc4DLMqs07qYiDXdDXuQBbC0G2FmuZl
         xCI9Fp6R8+Qv6gJKMGRYuJGSip4DroCejngMAibpg3nCLg829mfaM2IXZAHjtMYNnX2A
         rFAkuATEoi0PZW64zZ7Jbctq2sVbDoH+FJZClsLTw94C4mPM02PdG3v9CeRYARK7nqxM
         Ee2lBbNSjOYT+rKjnMgEWaOxprNBJZM6cryv7DykrjScdiWE5ZNLeVpuS8Ie9aBHjCIJ
         8MLq6wOY0KDOitAUpO4pAAu4xAaH7AlmXZawstx98m0GxJ2WfW74zt39n360CKbYr3gH
         yBuA==
X-Forwarded-Encrypted: i=1; AJvYcCWPb66XZQNSA12w2MJuZAeqekxosw+4P0OBS6XocLAOvuGTMU6nhq3Fs+TImRS3B022EcPQ1EmmW/MSm8pcDrLht2N/VHuT2nRG4+r2GBcF
X-Gm-Message-State: AOJu0YxL9eEUO5S+63DXl28OMo46xQfoSvMg1oBrQ1Jd/bOk30Ez2/c0
	s1Mv7Rga3Ss8BoNun4wq/dr+fiOR/ZjRDZCIVv055kfOWYKelfF5jmEOzbSFJCo=
X-Google-Smtp-Source: AGHT+IGVJIolUw1wnEP6rXONdYGodPDrBpa15ZN0Oskw9/8CenqbKYTIAQinxff1hF7IO+HHWnbJgg==
X-Received: by 2002:a17:90a:780f:b0:2c2:f704:5278 with SMTP id 98e67ed59e1d1-2c8ab7379d4mr8580920a91.42.1719510465605;
        Thu, 27 Jun 2024 10:47:45 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce466f8sm61119a91.21.2024.06.27.10.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 10:47:43 -0700 (PDT)
Date: Thu, 27 Jun 2024 10:47:43 -0700 (PDT)
X-Google-Original-Date: Thu, 27 Jun 2024 10:47:41 PDT (-0700)
Subject: Re: [PATCH -fixes] riscv: patch: Flush the icache right after patching to avoid illegal insns
In-Reply-To: <20240624082141.153871-1-alexghiti@rivosinc.com>
CC: rostedt@goodmis.org, mhiramat@kernel.org, Mark Rutland <mark.rutland@arm.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Bjorn Topel <bjorn@rivosinc.com>,
  alexghiti@rivosinc.com, andy.chiu@sifive.com, puranjay12@gmail.com, linux-kernel@vger.kernel.org,
  linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-d9e4078a-6e3f-4890-b507-93005c5a91df@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_104747_460099_C651D901 
X-CRM114-Status: GOOD (  24.13  )
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

On Mon, 24 Jun 2024 01:21:41 PDT (-0700), alexghiti@rivosinc.com wrote:
> We cannot delay the icache flush after patching some functions as we may
> have patched a function that will get called before the icache flush.
>
> The only way to completely avoid such scenario is by flushing the icache
> as soon as we patch a function. This will probably be costly as we don't
> batch the icache maintenance anymore.

Ya, it's going to be pretty miserable for performance.  We'd talked 
about using objtool for the static rewriting a few weeks ago in the 
patchwork meeting, but with the dynamic rewriting suffering from similar 
issues it seems best to just pick this one up.   We can always sort out 
the performance isuses later, at least this is correct.

> Fixes: 6ca445d8af0e ("riscv: Fix early ftrace nop patching")
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> Closes: https://lore.kernel.org/linux-riscv/20240613-lubricant-breath-061192a9489a@wendy/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/ftrace.c |  7 ++-----
>  arch/riscv/kernel/patch.c  | 26 ++++++++++++++++++--------
>  2 files changed, 20 insertions(+), 13 deletions(-)
>
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 87cbd86576b2..4b95c574fd04 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -120,9 +120,6 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
>  	out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
>  	mutex_unlock(&text_mutex);
>
> -	if (!mod)
> -		local_flush_icache_range(rec->ip, rec->ip + MCOUNT_INSN_SIZE);
> -
>  	return out;
>  }
>
> @@ -156,9 +153,9 @@ static int __ftrace_modify_code(void *data)
>  	} else {
>  		while (atomic_read(&param->cpu_count) <= num_online_cpus())
>  			cpu_relax();
> -	}
>
> -	local_flush_icache_all();
> +		local_flush_icache_all();
> +	}
>
>  	return 0;
>  }
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 4007563fb607..ab03732d06c4 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -89,6 +89,14 @@ static int __patch_insn_set(void *addr, u8 c, size_t len)
>
>  	memset(waddr, c, len);
>
> +	/*
> +	 * We could have just patched a function that is about to be
> +	 * called so make sure we don't execute partially patched
> +	 * instructions by flushing the icache as soon as possible.
> +	 */
> +	local_flush_icache_range((unsigned long)waddr,
> +				 (unsigned long)waddr + len);
> +
>  	patch_unmap(FIX_TEXT_POKE0);
>
>  	if (across_pages)
> @@ -135,6 +143,14 @@ static int __patch_insn_write(void *addr, const void *insn, size_t len)
>
>  	ret = copy_to_kernel_nofault(waddr, insn, len);
>
> +	/*
> +	 * We could have just patched a function that is about to be
> +	 * called so make sure we don't execute partially patched
> +	 * instructions by flushing the icache as soon as possible.
> +	 */
> +	local_flush_icache_range((unsigned long)waddr,
> +				 (unsigned long)waddr + len);
> +
>  	patch_unmap(FIX_TEXT_POKE0);
>
>  	if (across_pages)
> @@ -189,9 +205,6 @@ int patch_text_set_nosync(void *addr, u8 c, size_t len)
>
>  	ret = patch_insn_set(tp, c, len);
>
> -	if (!ret)
> -		flush_icache_range((uintptr_t)tp, (uintptr_t)tp + len);
> -
>  	return ret;
>  }
>  NOKPROBE_SYMBOL(patch_text_set_nosync);
> @@ -224,9 +237,6 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
>
>  	ret = patch_insn_write(tp, insns, len);
>
> -	if (!ret)
> -		flush_icache_range((uintptr_t) tp, (uintptr_t) tp + len);
> -
>  	return ret;
>  }
>  NOKPROBE_SYMBOL(patch_text_nosync);
> @@ -253,9 +263,9 @@ static int patch_text_cb(void *data)
>  	} else {
>  		while (atomic_read(&patch->cpu_count) <= num_online_cpus())
>  			cpu_relax();
> -	}
>
> -	local_flush_icache_all();
> +		local_flush_icache_all();
> +	}
>
>  	return ret;
>  }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
