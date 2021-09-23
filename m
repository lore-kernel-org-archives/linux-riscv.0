Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52609C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 10:07:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0682660F70
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 10:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0682660F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSMs/1mBg7cJVNbvf5rapJOxBQ3YNeqiQJjkUKZo7EY=; b=fvyf0v4NeB88wH
	O8wcmXA+iTpxazKcPL9hJDJW0ok523TWiKBmsWInckswtimL7114tXu3EhzlTFxh06ViLwG3Xq4Od
	Iqj8VxOB7gdlCJWiohpBTmP38JDbsXolznsAorhvHcDVu4qIrdsTivz7nj0hagjt9r5OIcRcZIc0w
	CFYY9XCQy9lmm/X1VEKgeMyu2wSblYZEQuY8EkmlZky5xHdOMQRvWPycujvVdEXDBub7uUlPqryfr
	s/XpsRi2SQjt7FNuL9s5Eq+165hX4lS6ZJ1+DQ5FSGfaL8hppqDY+jgB8O7IOG5uKHIwubA0XhoLL
	yTvHYtfuaaRXGG/tke2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTLdc-00As9s-Ve; Thu, 23 Sep 2021 10:07:33 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTLda-00As9L-PC
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 10:07:32 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 97-20020a9d006a000000b00545420bff9eso7776784ota.8
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 03:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PGizDeLzRGbblNybKFZtNPTDc7twErSudSG0K9dzTyI=;
 b=gx9iJmpVsc8VC7E6X1G9/vtVS9wUZJ2aHfzCzL7eNrFi4amBr08Tu0xEQNKip8IsdA
 YjmRTgXS+h66ufU2hH5mhyxN5jO0or5XLeCWMv3NtTu2wyzkvc70MJ6V12gyA9j7apsL
 G+Z0RVYZZGA+S3Y+iB2aBV3/vIhZvnWYv7yRfvmqiA+cIb7tGYhXhI5HIZx4Jvpxcy1y
 QlLHQZ+48XfbYmXAhLkxdB8Gihog2WYby21ipIwlaBn52KE8RXWW7ieJnVhk6l7/H8Te
 Sh+fML80EampCLvZLhfkdQ+YLLf1R5M57FlcqEcrS2c8P2mIwi8TJH6Yr65FeCpanA6x
 PyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PGizDeLzRGbblNybKFZtNPTDc7twErSudSG0K9dzTyI=;
 b=Duo4QQeT0wAsAaJZWaNIqe/4jxjj3nUCPQHGfo1Fhg0u/T0A7R0YH5AtwKvoZMNmL6
 8+jeH1Y9SrJDo00v/F9tNL6Ij86DF8oZ+WRBzGYgJtIo/gGj9B4076dc17eSGG61ZrIZ
 84nq6GafxNOIVaKr5//ytI184oElfF/5QlvQFfivswZLGLkJNGwe4BE2YkH6Be8POqI8
 LW7m2CWwcU4PZqOPak4KcR4o3D4I9CqefwddEuH5Px+b198BBThImBct3wnhsH5DWy5a
 9ky5OSpt2Z8b/Cp6trf3jeMWf8xFv5eCSDl4A3/X3TmnBwSWyDmR8mnOuK4hshPQfW+E
 r82w==
X-Gm-Message-State: AOAM531SP0PEhr/HMTGoYVDJTFg7edPjXaMZ6cKJ6TKr1jyz7OkIhNIp
 rXeiuJQVB6HL1FqLxw10QnOzTfzCA3oCR8gr4aIf4w==
X-Google-Smtp-Source: ABdhPJxQcNl+E0hqlYvj6R3nzKpFx4Yhh0lkCFH7MUOEbWh5g8rHrqts6FdpO0TwI0sRMnxa8VbR/CKkCmzDr0KiJOg=
X-Received: by 2002:a9d:135:: with SMTP id 50mr3469525otu.295.1632391649222;
 Thu, 23 Sep 2021 03:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210922205525.570068-1-nathan@kernel.org>
In-Reply-To: <20210922205525.570068-1-nathan@kernel.org>
From: Marco Elver <elver@google.com>
Date: Thu, 23 Sep 2021 12:07:17 +0200
Message-ID: <CANpmjNNqgUSbiPHOpD8z5JAv2aiujxAMiO4siymYdU6zpid_2g@mail.gmail.com>
Subject: Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>,
 kasan-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_030730_880315_117AD9C8 
X-CRM114-Status: GOOD (  18.64  )
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

On Wed, 22 Sept 2021 at 22:55, Nathan Chancellor <nathan@kernel.org> wrote:
> Currently, the asan-stack parameter is only passed along if
> CFLAGS_KASAN_SHADOW is not empty, which requires KASAN_SHADOW_OFFSET to
> be defined in Kconfig so that the value can be checked. In RISC-V's
> case, KASAN_SHADOW_OFFSET is not defined in Kconfig, which means that
> asan-stack does not get disabled with clang even when CONFIG_KASAN_STACK
> is disabled, resulting in large stack warnings with allmodconfig:
>
> drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c:117:12:
> error: stack frame size (14400) exceeds limit (2048) in function
> 'lb035q02_connect' [-Werror,-Wframe-larger-than]
> static int lb035q02_connect(struct omap_dss_device *dssdev)
>            ^
> 1 error generated.
>
> Ensure that the value of CONFIG_KASAN_STACK is always passed along to
> the compiler so that these warnings do not happen when
> CONFIG_KASAN_STACK is disabled.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1453
> References: 6baec880d7a5 ("kasan: turn off asan-stack for clang-8 and earlier")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Marco Elver <elver@google.com>

[ Which tree are you planning to take it through? ]

Note, arch/riscv/include/asm/kasan.h mentions KASAN_SHADOW_OFFSET in
comment (copied from arm64). Did RISC-V just forget to copy over the
Kconfig option?


> ---
>  scripts/Makefile.kasan | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 801c415bac59..b9e94c5e7097 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -33,10 +33,11 @@ else
>         CFLAGS_KASAN := $(CFLAGS_KASAN_SHADOW) \
>          $(call cc-param,asan-globals=1) \
>          $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
> -        $(call cc-param,asan-stack=$(stack_enable)) \
>          $(call cc-param,asan-instrument-allocas=1)
>  endif
>
> +CFLAGS_KASAN += $(call cc-param,asan-stack=$(stack_enable))
> +
>  endif # CONFIG_KASAN_GENERIC
>
>  ifdef CONFIG_KASAN_SW_TAGS
>
> base-commit: 4057525736b159bd456732d11270af2cc49ec21f
> --
> 2.33.0.514.g99c99ed825
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
