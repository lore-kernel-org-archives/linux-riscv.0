Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B279BC64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 16:52:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6624820868
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 16:52:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O7pRnWTW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BHdf0pTD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6624820868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owxugn6FPzil4IguTz6iDFnHsMVqymB5csZKVsIdbxA=; b=O7pRnWTW1A+C+E
	K8FaBDNBhkgPR+CAW8zmwBeN0jJKd3yxykic2jQFkojmWtELpLWRmbENI7cKT0yvgF50Hl/K/BTZu
	KkF7p7UH+qlzccd9iP3ca5FsEqU+XH942yfp/38kZddys6yBIJxPCjh7LHPm3yIpvrxDYvgmbVYgp
	qEuMw9PQKFQzvdp50ohBzUioilk+QKxwX7xEux/m3B9BUHyUev2b0ex9doZlFxetb86LB+QA7s6WB
	nTa1bpLoVZtPg0KmM28V5/ou9AHyTqJY0hAV+ZA5+LH0Dwf4OBkI8H7G9ypyDYsxSojjvwXk/Rcvp
	OfzQeUkbf0jM53ZDBtrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUwsf-0005M9-Dr; Thu, 06 Dec 2018 16:52:05 +0000
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUwq1-0001Fg-7D
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 16:50:01 +0000
Received: by mail-yb1-xb41.google.com with SMTP id c15so921525ybf.7
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 08:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f6ZhIgPxb5JuEi5w65rXIUYHXmApKJnwNsBxtTH3yT4=;
 b=BHdf0pTDh1fcUnEzAb5K2S1oG8rWk/mh7j7WM6Hni5W9pp++25RnRnYhX7ZmgqV3pH
 FerZn5Pq+xwK7tSjDNXjUrrH5t2BXhEmc61Y5RkWSDB33VRt6QRnimqH5p3bCsC5JLpP
 a1aIWFjjcvTJ/r+u25H3UuIRad4UFcdTFgyLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f6ZhIgPxb5JuEi5w65rXIUYHXmApKJnwNsBxtTH3yT4=;
 b=cLnC8KHH0TpjPR7UDjUUgb7hkSKNMTIv3xWSBKSqHF3l5kHrTvRiCVzkMAxQGbmZwG
 BIU9U04n2PY+6fjB5j1T/Gl81kCWoavn2w9FMkasCxhrnvcqQx9lkOp7xvG2qVTxSCjo
 1oFuQquwKEkvEPD3neJMXKlo8qkkbMWMgQuNY1NuDNhGKrkuPnLZyQ1fwP2Tp8Vg90cw
 O1++9DdyiZbycVDYlqkgYFZr5vPvCfDRVQbmvKwkrG5AxB/SJxoMpF7JbI8LTHlzOZm4
 F+wNXpxJr283wGLGDbngPupHv3/Aj5IUWTBN/jhc9RjW29XNmhjJhfpc02dXsXbN9qHH
 8Rjw==
X-Gm-Message-State: AA+aEWYoPho42wLbmrMpXT663hL+Y2zhKuAwOPDXF7ycvKSz1HUtTV+9
 rCu0Ovs39QBqGYew08ohLXVGDK3HaSM=
X-Google-Smtp-Source: AFSGD/WluVOCoalxUMQnQ5f7osppiM+G/+wmgDmlN/ueJlVl/Q1fWVkAfKjblGdo/7DXalT0sp/fyQ==
X-Received: by 2002:a0d:e1d6:: with SMTP id k205mr29312289ywe.78.1544114949249; 
 Thu, 06 Dec 2018 08:49:09 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178])
 by smtp.gmail.com with ESMTPSA id 139sm194356ywt.78.2018.12.06.08.49.07
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Dec 2018 08:49:08 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id s15so924532ybk.6
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 08:49:07 -0800 (PST)
X-Received: by 2002:a81:98e:: with SMTP id 136mr28855840ywj.47.1544114947295; 
 Thu, 06 Dec 2018 08:49:07 -0800 (PST)
MIME-Version: 1.0
References: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
 <20181206150156.28210-3-david.abdurachmanov@gmail.com>
In-Reply-To: <20181206150156.28210-3-david.abdurachmanov@gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 6 Dec 2018 08:48:55 -0800
X-Gmail-Original-Message-ID: <CAGXu5jJT4wY9wgCF8gB+tjgH+YQps4eUDVwZoGY=GVmLMpLPxw@mail.gmail.com>
Message-ID: <CAGXu5jJT4wY9wgCF8gB+tjgH+YQps4eUDVwZoGY=GVmLMpLPxw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: fix syscall_{get,set}_arguments
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_084922_233773_C68A5FBA 
X-CRM114-Status: GOOD (  18.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Will Drewry <wad@chromium.org>,
 Palmer Dabbelt <palmer@sifive.com>, LKML <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, green.hu@gmail.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 6, 2018 at 7:02 AM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> Testing with libseccomp master branch revealed that testcases with
> filters on syscall arguments were failing due to wrong values. Seccomp
> uses syscall_get_argumentsi() to copy syscall arguments, and there is a
> bug in pointer arithmetics in memcpy() call.
>
> Two alternative implementation were tested: the one in this patch and
> another one based on while-break loop. Both delivered the same results.
>
> This implementation is also used in arm, arm64 and nds32 arches.

Minor nit: can you make this the first patch? That way seccomp works
correctly from the point of introduction. :)

-Kees

>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> ---
>  arch/riscv/include/asm/syscall.h | 42 ++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index bba3da6ef157..26ceb434a433 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -70,19 +70,32 @@ static inline void syscall_set_return_value(struct task_struct *task,
>         regs->a0 = (long) error ?: val;
>  }
>
> +#define SYSCALL_MAX_ARGS 6
> +
>  static inline void syscall_get_arguments(struct task_struct *task,
>                                          struct pt_regs *regs,
>                                          unsigned int i, unsigned int n,
>                                          unsigned long *args)
>  {
> -       BUG_ON(i + n > 6);
> +       if (n == 0)
> +               return;
> +
> +       if (i + n > SYSCALL_MAX_ARGS) {
> +               unsigned long *args_bad = args + SYSCALL_MAX_ARGS - i;
> +               unsigned int n_bad = n + i - SYSCALL_MAX_ARGS;
> +               pr_warning("%s called with max args %d, handling only %d\n",
> +                       __func__, i + n, SYSCALL_MAX_ARGS);
> +               memset(args_bad, 0, n_bad * sizeof(args[0]));
> +       }
> +
>         if (i == 0) {
>                 args[0] = regs->orig_a0;
>                 args++;
>                 i++;
>                 n--;
>         }
> -       memcpy(args, &regs->a1 + i * sizeof(regs->a1), n * sizeof(args[0]));
> +
> +       memcpy(args, &regs->a0 + i, n * sizeof(args[0]));
>  }
>
>  static inline void syscall_set_arguments(struct task_struct *task,
> @@ -90,14 +103,23 @@ static inline void syscall_set_arguments(struct task_struct *task,
>                                          unsigned int i, unsigned int n,
>                                          const unsigned long *args)
>  {
> -       BUG_ON(i + n > 6);
> -        if (i == 0) {
> -                regs->orig_a0 = args[0];
> -                args++;
> -                i++;
> -                n--;
> -        }
> -       memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
> +       if (n == 0)
> +               return;
> +
> +       if (i + n > SYSCALL_MAX_ARGS) {
> +               pr_warning("%s called with max args %d, handling only %d\n",
> +                       __func__, i + n, SYSCALL_MAX_ARGS);
> +               n = SYSCALL_MAX_ARGS - i;
> +       }
> +
> +       if (i == 0) {
> +               regs->orig_a0 = args[0];
> +               args++;
> +               i++;
> +               n--;
> +       }
> +
> +       memcpy(&regs->a0 + i, args, n * sizeof(args[0]));
>  }
>
>  static inline int syscall_get_arch(void)
> --
> 2.19.2
>


-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
