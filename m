Return-Path: <SRS0=wFsd=DO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C0CC4363C
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 18:53:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E2572168B
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 18:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BNNkgr6u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="TFWyYwTG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E2572168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PRHtjr9+6xKSdl+qz3XYnHjViCzpLgeW9ezedanG7C0=; b=BNNkgr6u5+KhxGRO6vTOqVUzs
	BNnBpmEjQlRFQmWwIklguZm40VE4Y4IW2tnimCrp+615VP380XAz0iksugdaLDEEbj0qWCZ2F1cJY
	jSsjvcrflDnEk22UD43W4Ej3QjufEJyITJdf+N+Pxp0Mo8Opg0SPOcgJ9pslyWax8ROxytcY0z/eP
	cVuj0JdR5NU72A+OAzI/+xif3HOdnbbU/1USLahVzL/5ciRMf6qEimzvjNt93q9rI/0853WBNZzOu
	VHAqk4bnTfDBWq878EaCJGBDc1lIesTDSl8o24FmuE0c1pY9FMm7022VdMbtiZ81+lacIjuDt07g0
	uMASLONQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQEYt-000075-5d; Wed, 07 Oct 2020 18:53:15 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQEYp-00006g-W5
 for linux-riscv@lists.infradead.org; Wed, 07 Oct 2020 18:53:12 +0000
Received: by mail-io1-xd42.google.com with SMTP id k6so3548404ior.2
 for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2020 11:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KO+y56HHfRTV4+PXqtIIHy8g7bN2Nwji1Pf2rJWSLag=;
 b=TFWyYwTG2ftpwcDpT3thFrPNd4YAfiL7KKwnFvVpUScgwpFr0U4+pgptwNqGLNqeb2
 qhD+yHUpmO++xypu2uNSTIkizdBRwOu/53UqrajQXqlx2GMOjaWzFrEmCDK1dkmJbKnD
 M5wT3UVCZan8ECu9cMsA7ZwVbrGsFaQTczyhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KO+y56HHfRTV4+PXqtIIHy8g7bN2Nwji1Pf2rJWSLag=;
 b=SF5I08LCzjl+xw5pgGcqcIz2Dlc8T0RZ/3/bB468LJ6EI7O9uNvuk0WXPdWoIVYabV
 J1zvGHymS4VVexLIJreC7pojsFKIQ9NPwdQSHZNpIy1S11ZCXQA+NvvZNiamW7Y+x5ri
 uvSRjdHKcabPg3fqcWHg13an/El/trkcjm2HhxWUz+6PIXU5n3pxfDblciIHORsLu4l0
 eMflSG1ktBvo6hmBK9OjMYG/aaVhAtefZeisri69ztJHXv+oLP9Aie7YPbVweXUnly3Z
 sWMNfuFlNUBV0m4C9C3KVIS8l7RwffxVkBb+FD675Vy+MXsK7ioyA1cahb4XMYvIoASe
 gX4g==
X-Gm-Message-State: AOAM530kZhjulrraiEzq9CX+7e5Gv2qcyUQ/cYr1DkZfDtIEiEr03JOG
 t3QGcnZOEwzQZ3xcBt3fgfOL4UurqBnYkc/dHstyy6RyKbMd
X-Google-Smtp-Source: ABdhPJy3N9QPqRCm7vLTFezp9RQysmNIo7Crh7+Nm/22ezXbo2bA99nLfCG8eETLCtYOvNYzMeS4MwgaKVOOJ9Nf+DE=
X-Received: by 2002:a05:6602:18a:: with SMTP id
 m10mr3309246ioo.174.1602096789625; 
 Wed, 07 Oct 2020 11:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <1602083313-19239-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1602083313-19239-1-git-send-email-guoren@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 7 Oct 2020 11:52:58 -0700
Message-ID: <CAOnJCUK03L_n51N8CwekAa4QuVtUr75Cv6zfLabZCCgr0Jdgyg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "riscv: Fixup static_obj() fail"
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_145312_088427_C3EF5E4B 
X-CRM114-Status: GOOD (  19.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Andreas Schwab <schwab@linux-m68k.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, aurelien@aurel32.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 7, 2020 at 8:09 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> This reverts commit 6184358da0004c8fd940afda6c0a0fa4027dc911.
>
> It will cause bootup failure with HARDENED_USERCOPY.
>
> As Aurelien has reported:
>
> [    3.484586] AppArmor: AppArmor sha1 policy hashing enabled
> [    4.749835] Freeing unused kernel memory: 492K
> [    4.752017] Run /init as init process
> [    4.753571] usercopy: Kernel memory overwrite attempt detected to kernel text (offset 507879, size 11)!
> [    4.754838] ------------[ cut here ]------------
> [    4.755651] kernel BUG at mm/usercopy.c:99!
> [    4.756445] Kernel BUG [#1]
> [    4.756815] Modules linked in:
> [    4.757542] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.8.0-1-riscv64 #1 Debian 5.8.7-1
> [    4.758372] epc: ffffffe0003b5120 ra : ffffffe0003b5120 sp : ffffffe07f783ca0
> [    4.758960]  gp : ffffffe000cc7230 tp : ffffffe07f77cec0 t0 : ffffffe000cdafc0
> [    4.759772]  t1 : 0000000000000064 t2 : 0000000000000000 s0 : ffffffe07f783cf0
> [    4.760534]  s1 : ffffffe00095d780 a0 : 000000000000005b a1 : 0000000000000020
> [    4.761309]  a2 : 0000000000000005 a3 : 0000000000000000 a4 : ffffffe000c1f340
> [    4.761848]  a5 : ffffffe000c1f340 a6 : 0000000000000000 a7 : 0000000000000087
> [    4.762684]  s2 : ffffffe000941848 s3 : 000000000007bfe7 s4 : 000000000000000b
> [    4.763500]  s5 : 0000000000000000 s6 : ffffffe00091cc00 s7 : fffffffffffff000
> [    4.764376]  s8 : 0000003ffffff000 s9 : ffffffe0769f3200 s10: 000000000000000b
> [    4.765208]  s11: ffffffe07d548c40 t3 : 0000000000000000 t4 : 000000000001dcd0
> [    4.766059]  t5 : ffffffe000cc8510 t6 : ffffffe000cd64aa
> [    4.766712] status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
> [    4.768308] ---[ end trace 1f8e733e834d4c3e ]---
> [    4.769129] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    4.770070] SMP: stopping secondary CPUs
> [    4.771110] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reported-by: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Atish Patra <atishp@atishpatra.org>
> Cc: Andreas Schwab <schwab@linux-m68k.org>
> ---
>  arch/riscv/kernel/vmlinux.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index f3586e3..e6f8016 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -22,7 +22,6 @@ SECTIONS
>         /* Beginning of code and text segment */
>         . = LOAD_OFFSET;
>         _start = .;
> -       _stext = .;
>         HEAD_TEXT_SECTION
>         . = ALIGN(PAGE_SIZE);
>
> @@ -55,6 +54,7 @@ SECTIONS
>         . = ALIGN(SECTION_ALIGN);
>         .text : {
>                 _text = .;
> +               _stext = .;
>                 TEXT_TEXT
>                 SCHED_TEXT
>                 CPUIDLE_TEXT
> --
> 2.7.4
>

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
