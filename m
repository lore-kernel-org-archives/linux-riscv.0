Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A39AC3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 18:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RGLiE/oNTYOXq/wjexVQmitwCMiZlWsi574FPhbSf1g=; b=bqBBdKa+3rkI24TcUGezyLT/4r
	XTRAaB2tv5fkSphuFWqta4QlLJfsf+3Cbygui1fG8aH+la3JhXlo/O9u9COxvVuXj4l4bw/Ole7xf
	5cj5k6uT32ULqR0aqLcGJPf7xqS3IIxn8e+rdu136FMocs2MNA6ugdbINDPSd5uvpbXEbaJoHv8L3
	DdKLlAI/MuWvP+IVkpI8DlRFUJeMriA9/E2O1A7TBirl+7MWszTlbqqaw/JpM5sWyfLsfgTuV+Svh
	orKNEuDk+2FFFyVPbPSzU1sbc7H2qzxEWrp2hcviGZ1coWxHOieF/G5FB8hiT5ZY5nPiF6tU2ebyM
	m5F2A7DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wgI-0000000BWLz-2f8C;
	Thu, 10 Apr 2025 18:31:18 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vf4-0000000BMsx-2SsC
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 17:25:59 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-af579e46b5dso929475a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 10:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1744305957; x=1744910757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ig/FhwGwD1jLitbxX81FyIbAc6VmuE4TZHPbRttZ3+g=;
        b=CB2ItAoGvISmNaiqDpeWvKJqs2bIfvLCcs+KqD01/QvqwZ4bkZFlKwWdz5xhRyy2FU
         f2NLzcA1iZLBwcttB0ANe8vaENGbkNN+Vfb9Pk8Gb1mibmQ4ibqXMC+kQ0+wrizftXCt
         cE74EUnCFrvpUWQN9otIEeXvFg2HQ+KwJFdjRm071Baoh/coPfv0AqM6hVBD0jPu4wfH
         TS+/oTfvn1zuXqm6RW0G/c2QK3J28Z5VaC55FvuszmbCbkHJK9jb+z2kI3IqqwHv66IE
         0yeoY0wk3B6ZaRfHlIKOxggabj/8NDrlxyJYzB+3wQ+RWV2EYsY1TjBJtD3b6A22RYvy
         dChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744305957; x=1744910757;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig/FhwGwD1jLitbxX81FyIbAc6VmuE4TZHPbRttZ3+g=;
        b=MszkpA0P7/C2GGMjBKH8J4qDnmFA9bSY8q6tQiYk0QyOBzU4K+suWV4Lqogcwc6fNz
         4D43Yft3jl4tA1+B59/FEKxTeO2NUnZezh7wKfGQ4ESkY86+6efxnlcXBZZXqOfhNv99
         mZUo/RTkueASR+R79Qn1uQRpwMwOwTcAMYOd32jareHThQ1qxVEl5wDnqGM+oqo2dUpA
         +Cl1fgyQ99zvGiLZhSryl9IFMG5HU3o1+eF/8P9iajloufcQ8fMfuCQci5gu9y7ScfaZ
         DqhNJ+0x1ajR+6rS1/6/YpMkVCVqMkZtEkkLg3WCsn6hZZBbNhRqKLtMwACP+KiW6JFS
         vdSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWugXK4vfbxa/TKyKWPy4Ed5bpidjXhE2WVUw01Nfo2+GdjD/YenyRLoynFv9c3DB/V0qBKUqm3ZaUxDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiSkFsITuOAnL/OIh8J4BrwR2DPivHo1U6LeIoctqsCOIe0Tz1
	IBFItq5IoHoH0lfo35ZV9wNqI+L4T9kCwyN0YBysJDb+1qwL5FuSXrIW4f8AlAY=
X-Gm-Gg: ASbGncvb/ukpKKN7wbLXfH3m2XZqJOjdCAkYrY5/oYX+fuQ5x47S9VFsgzx0cMwMain
	vGHmQpGz1+eLItwBWvBPLs34GU3T1SSc4J5z8U5m3kRmQuLTdLF9Dt5jjr7AVWdLScsW325mN3z
	dLssXwmr/gW71rwfRdUGEG02U/lhBmeLkvTrcFRH9arW2OczVo7dn0IIbQAe5y2tO/aaz7KToCV
	I/r2ZXimB+eAPgz0hXi6dqxufegC+qrZ/zUDpL6WAx52bqVwF416BrVw60fBDuwF7QUmkJ7dWTB
	aO9hAE8YvJ8NHUNeY/eM1hFgcqYq8+rEAg==
X-Google-Smtp-Source: AGHT+IGsEtG4l/fsVtmjE6fIGvxm9O7zGTf6ZWhcCE4riLaK3/QbFCyU24k3i6IpZbiWZewa23zmSg==
X-Received: by 2002:a17:90b:270b:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-307e5972f0fmr6092903a91.12.1744305957335;
        Thu, 10 Apr 2025 10:25:57 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd17191esm4373489a91.39.2025.04.10.10.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 10:25:56 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:25:56 -0700 (PDT)
X-Google-Original-Date: Thu, 10 Apr 2025 10:25:52 PDT (-0700)
Subject: Re: [PATCH] riscv: Avoid fortify warning in syscall_get_arguments()
In-Reply-To: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alex@ghiti.fr,
  Charlie Jenkins <charlie@rivosinc.com>, ldv@strace.io, kees@kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, nathan@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nathan@kernel.org
Message-ID: <mhng-cf999eb1-59c4-4784-8c01-44b1e2482a50@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_102558_626410_02B4291A 
X-CRM114-Status: GOOD (  32.63  )
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

On Wed, 09 Apr 2025 14:24:46 PDT (-0700), nathan@kernel.org wrote:
> When building with CONFIG_FORTIFY_SOURCE=y and W=1, there is a warning
> because of the memcpy() in syscall_get_arguments():
>
>   In file included from include/linux/string.h:392,
>                    from include/linux/bitmap.h:13,
>                    from include/linux/cpumask.h:12,
>                    from arch/riscv/include/asm/processor.h:55,
>                    from include/linux/sched.h:13,
>                    from kernel/ptrace.c:13:
>   In function 'fortify_memcpy_chk',
>       inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:66:2:
>   include/linux/fortify-string.h:580:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
>     580 |                         __read_overflow2_field(q_size_field, size);
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
>
> The fortified memcpy() routine enforces that the source is not overread
> and the destination is not overwritten if the size of either field and
> the size of the copy are known at compile time. The memcpy() in
> syscall_get_arguments() intentionally overreads from a1 to a5 in
> 'struct pt_regs' but this is bigger than the size of a1.
>
> Normally, this could be solved by wrapping a1 through a5 with
> struct_group() but there was already a struct_group() applied to these
> members in commit bba547810c66 ("riscv: tracing: Fix
> __write_overflow_field in ftrace_partial_regs()").
>
> Just avoid memcpy() altogether and write the copying of args from regs
> manually, which clears up the warning at the expense of three extra
> lines of code.

You could still memcpy, but you'd need some sort of

    memcpy(args, &regs->aregs + sizeof(args[0]), 5 * sizeof(args[0]));

(or however you index a struct group).  I think it's saner to just do it 
with the manual copies, though, as I'd have to look up what this code 
does every time I run into it.

> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I omitted a Fixes tag because I think this has always been an overread
> if I understand correctly but it is only the addition of the checks from
> commit f68f2ff91512 ("fortify: Detect struct member overflows in
> memcpy() at compile-time") that it becomes a noticeable issue.

I'm going to add the Fixes.  It's a suprious warning (there's no actual 
crash from the overread), but even spurious warnings are a headache for 
peolpe trying to build stuff.

> This came out of a discussion from the addition of
> syscall_set_arguments(), where the same logic causes a more noticeable
> fortify warning because it happens without W=1, as it is an overwrite:
> https://lore.kernel.org/20250408213131.GA2872426@ax162/
> ---
>  arch/riscv/include/asm/syscall.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 121fff429dce66b31fe79b691b8edd816c8019e9..eceabf59ae482aa1832b09371ddb3ba8cd65f91d 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -62,8 +62,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  					 unsigned long *args)
>  {
>  	args[0] = regs->orig_a0;
> -	args++;
> -	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> +	args[1] = regs->a1;
> +	args[2] = regs->a2;
> +	args[3] = regs->a3;
> +	args[4] = regs->a4;
> +	args[5] = regs->a5;
>  }
>
>  static inline int syscall_get_arch(struct task_struct *task)
>
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250409-riscv-avoid-fortify-warning-syscall_get_arguments-19c0495d4ed7
>
> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
