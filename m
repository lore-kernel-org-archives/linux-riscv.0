Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203E4C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 09:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+4jzojIuVZlTpfQHMahg3mxHkxMzHJu1GpccrsO7nU=; b=2sY0vD80j4Bs9s
	NqG82zgfJ3OO5dXrnoxcBmmxv90x5qrTjb8ib+nDB2o4AlZmistKt9BRT8A8VB40B8VGwXANkWbAi
	Cso6qVjeJSy3ZIb11vLjUcVrIWtNRvjnciehrv4pfRh4ckGemzakOfphx57t16ryMu8khL1ygxTJR
	QycLdECoVGQYhtbY30JbnUgcZVPn1EtrXsLs7KfkdLXqa+Qg5V2He1qzJDISGBsOsorVC75rLCadI
	ZnRL7qPhigUotq5gk28Fpl+QQh2LdQfjqrdYxJWHv0UznpWq0N7bCJbST0JVLN9BegBNSA7n9ff/J
	Klv9WrX3LCMwNWdzBBjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ22C-00F2QO-1f;
	Wed, 17 Jan 2024 09:16:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ229-00F2PV-33
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 09:16:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40e87d07c07so9060255e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 01:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705482987; x=1706087787; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IsdAvf8hxCZPrunA4Y1YJj8dzQfMO9GuW6K07QeXqBc=;
        b=KpoMdlN4kFa1bt7Xg+QtM3Tl5QXUczN4irO56MRnKrRx3lx+OM8yN05mx+DTZZW2kk
         dly2dldZsFJyYERiY0iZUt7ls3NAGbR+nLLSrjQndxD/vKmD7dy7OCNPwYyK4IQIVOUR
         4OeTMGhH3FyA4OdLyuZiDvJYcGIU4KSw5hGBFN62U2FfxTXvUEO1n52kUKhrvA4ECSnb
         9IzwV9FFyodptyFzfiSzZuH9XphOepYtXqQ0vKPYSny3tIy8qkZLOlTBaLIuion1ILH9
         HVTNyIL6TbGyGHhBo6l7Rf3sa4wmEGDhUk6hCvubV25OVq+yNiDXPF6a0pcp3LGfPij3
         4rwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705482987; x=1706087787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsdAvf8hxCZPrunA4Y1YJj8dzQfMO9GuW6K07QeXqBc=;
        b=grjJsNS3FA9pHzEb4QLlMZCkh4zMEVedkviLTTaB5jCbZsNP5ov8uNShHIC7P/wIeY
         XInTLN0jZb2sqCg2mzd+Ix+ooljUarH2cnQWouA6tGf5GVhQDxoS8ED4Rg6vjoV5afL/
         K0E8D6CSj6c3XDWHzHKQ4hK0OOsk33YmI1hcCQ+CguJBknV8te+tjfejRpsMVd2m3Bm8
         1Pr4MGjb+9BywoyyhShF2ZwJccWTkRY5/niNH+KzDSUhQI1QTzoRy78XIQEkuPsCUQUe
         gO/7xjSqbL5SyMNtQWhNElKuvRNSZOLdFAU6IzmfjPGKp8Ybnbu+w7SFkGNuikJG0G+j
         JHXw==
X-Gm-Message-State: AOJu0YzY+evWZWuBKCwx/9+6j3FSdcCHC/JMC9waqwoOi2WjjyuRs8Cu
	q3H/P4iXWFoDMFtnPsI+VryTJ4/wqvk8fA==
X-Google-Smtp-Source: AGHT+IElDHZcHY6KtbxrcIOLwAyWKlUemsAhPHr/51sSMy0a2ZcI/YvCUrgFo//DPT5UsYvBbPwa+g==
X-Received: by 2002:a7b:ce8c:0:b0:40e:499a:6734 with SMTP id q12-20020a7bce8c000000b0040e499a6734mr4782442wmj.60.1705482987285;
        Wed, 17 Jan 2024 01:16:27 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id je6-20020a05600c1f8600b0040d8d11bf63sm21911921wmb.41.2024.01.17.01.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 01:16:26 -0800 (PST)
Date: Wed, 17 Jan 2024 10:16:26 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: shuah@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, xiao.w.wang@intel.com, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, xuzhipeng.1973@bytedance.com
Subject: Re: [PATCH] RISC-V: selftests: fix cbo.c compilation error
Message-ID: <20240117-274e425c51d0deaeca80857d@orel>
References: <20240117082514.42967-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240117082514.42967-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_011629_997503_DBDD21E6 
X-CRM114-Status: GOOD (  19.28  )
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

On Wed, Jan 17, 2024 at 04:25:14PM +0800, Yunhui Cui wrote:
> When compiling with -O0, the following error will occur:
> cbo.c: In function 'cbo_insn':
> cbo.c:43:9: warning: 'asm' operand 1 probably does not match constraints
>    43 |         asm volatile(
>       |         ^~~
> cbo.c:43:9: warning: 'asm' operand 2 probably does not match constraints
> cbo.c:43:9: error: impossible constraint in 'asm'
> 
> Add __attribute__((optimize("O"))) to fix.
> 
> Fixes: a29e2a48afe3 ("RISC-V: selftests: Add CBO tests")
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Suggested-by: Zhipeng Xu <xuzhipeng.1973@bytedance.com>
> ---
>  tools/testing/selftests/riscv/hwprobe/cbo.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
> index 50a2cc8aef38..ff1d8e843d70 100644
> --- a/tools/testing/selftests/riscv/hwprobe/cbo.c
> +++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
> @@ -36,7 +36,7 @@ static void sigill_handler(int sig, siginfo_t *info, void *context)
>  	regs[0] += 4;
>  }
>  
> -static void cbo_insn(char *base, int fn)
> +static __always_inline void cbo_insn(char *base, int fn)
>  {
>  	uint32_t insn = MK_CBO(fn);
>  
> @@ -47,10 +47,11 @@ static void cbo_insn(char *base, int fn)
>  	: : "r" (base), "i" (fn), "i" (insn) : "a0", "a1", "memory");
>  }
>  
> -static void cbo_inval(char *base) { cbo_insn(base, 0); }
> -static void cbo_clean(char *base) { cbo_insn(base, 1); }
> -static void cbo_flush(char *base) { cbo_insn(base, 2); }
> -static void cbo_zero(char *base)  { cbo_insn(base, 4); }
> +#define OPTIMIZE __attribute__((optimize("O")))
> +OPTIMIZE static void cbo_inval(char *base) { cbo_insn(base, 0); }
> +OPTIMIZE static void cbo_clean(char *base) { cbo_insn(base, 1); }
> +OPTIMIZE static void cbo_flush(char *base) { cbo_insn(base, 2); }
> +OPTIMIZE static void cbo_zero(char *base)  { cbo_insn(base, 4); }
>  
>  static void test_no_zicbom(void *arg)
>  {
> -- 
> 2.20.1
>

Hi Yunhui,

Thanks for the bug report, but this isn't the right fix. The real problem
is that I didn't ensure operands 1 and 2 match their constraints, just as
the warning you discovered says. To do that, I should have made cbo_insn()
a macro and not used the local variable, i.e. ensure 'fn' and 'insn' are
indeed constants derived from the 0,1,2,4 constants.

I'll send a patch with your reported-by.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
