Return-Path: <SRS0=hknt=D2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802CFC433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 18:54:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E450D223BF
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 18:54:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XUsRh/xZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="JlQ9cG/y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E450D223BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nZ+ly8otNnHfQ7eDneJQxm6rDYROAF5X7kbbLSO4F8w=; b=XUsRh/xZ/ArffPJKePnvQqIK8
	pJPL00FuBpAj2pyzZrRZK65sVdy+u0mINsdNVIdhFxYV2UYotz5TvrQ9WcrxmSAsH/JbeKD+7nCJR
	RexWzYgHLKcSK9EqkaoKEat9Inse+OW7HMOyJjphjjqFbGyTgrSwUETMzN0GHRtNqrhNRAZJxy7bi
	eEGsO86oZLcFvgajnsKHwpcP1wJJVYij9lgWa4NsHBUT+Ez/e3oStyBxVWrPnz19zytOggJkP8vkO
	8tMqZW6kDDpHkR/QyIlGIQR3n75PIE7YUjYruOHUsTmARRB8dYUI1h5zIbB0T2GGl4X4mr3c5Qxfe
	YJMgGIWWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUaIq-0004GN-JN; Mon, 19 Oct 2020 18:54:40 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUaIm-0004Fg-VP
 for linux-riscv@lists.infradead.org; Mon, 19 Oct 2020 18:54:38 +0000
Received: by mail-il1-x142.google.com with SMTP id k1so1301454ilc.10
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 11:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g2jWFfexdEDtBs2gfOXBbLGLdiOa+LTYwZ8t0Hf50aI=;
 b=JlQ9cG/yAPjE1oRino9Ot4VwHkBF+HDA8uJqkjp+tCCfIbq1LZBxFO3nmlTgDGiRgc
 O6lMduG3Rjn04ohMMV4Iaycqd4TlujJhVdHrZZYwQLkvi+lZzqsXGmty+VqzwaLg9n4J
 lYUwJZjZE4DAT71qHcQ85586gf8egO1rwVWCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g2jWFfexdEDtBs2gfOXBbLGLdiOa+LTYwZ8t0Hf50aI=;
 b=MZ5EjOMuhirNS89ybkKat3TDRIB0GWd+LEBBpa3y6P4Fd+T/G1NOGECD8vKJj3vppv
 CBSv9NO6yN9BaNMJMDZ0r/c3z9ZHqPtsNZz0IkEAV4Tn8k/6W6OG5Yv/Ks8JcwTIEhgw
 Ct6RT9TkLEz5GMNtdHy6ojshdIRPDU8W5FjboPLLresNEQgNNONm+qsXddCMJEzq90/N
 hJm6AYNxP5Ckw8/in7djQqt61Ijk7GQk2t6iL4F38TcN4pIDOdQucaBq+V5YyK+Ej/68
 KYmDp6c55SemMC35jFzSTSWvPqQ9mi57hzS2ChFNQxEFjl2oazhlNp9Ou6RlMi2YKEpb
 J+AA==
X-Gm-Message-State: AOAM533icnanoz6rkBT9EgNa8zFLDwDKtnJfYdsziS/YwJfXJzc1BROi
 GrDsxtt9w+0fqd+JC5DbWyGXkQJGVxYchJu9+6gA
X-Google-Smtp-Source: ABdhPJyb4PiVcwv1NkNj9aDJ/FpCHM6dnsTKUq/tHGd1tg2kp/35Pn9JvsV5zP5l+EX8LkrfBx7zhVJp6sbJMpGmIv8=
X-Received: by 2002:a92:1801:: with SMTP id 1mr793536ily.219.1603133674949;
 Mon, 19 Oct 2020 11:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <1602918377-23573-1-git-send-email-guoren@kernel.org>
 <1602918377-23573-10-git-send-email-guoren@kernel.org>
In-Reply-To: <1602918377-23573-10-git-send-email-guoren@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 19 Oct 2020 11:54:24 -0700
Message-ID: <CAOnJCU+oTRcJ2p8WQDX5P-EsOHmkn3kP9s54VQa+iw2wXDvzkg@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] riscv: Fixup lockdep_assert_held(&text_mutex) in
 patch_insn_write
To: Guo Ren <guoren@kernel.org>, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_145437_190680_A9F1F3AA 
X-CRM114-Status: GOOD (  20.01  )
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
Cc: me@packi.ch, Guo Ren <guoren@linux.alibaba.com>,
 Alan Kao <alankao@andestech.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 rostedt@goodmis.org, linux-csky@vger.kernel.org, mhiramat@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Oct 17, 2020 at 12:07 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> It will cause warning messages:
> echo function_graph > /sys/kernel/debug/tracing/current_tracer
> [   47.691397] ------------[ cut here ]------------
> [   47.692899] WARNING: CPU: 0 PID: 11 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x182/0x19a
> [   47.694483] Modules linked in:
> [   47.695754] CPU: 0 PID: 11 Comm: migration/0 Not tainted 5.9.0-11367-g1054335 #132
> [   47.698228] epc: ffffffe000204530 ra : ffffffe00020452c sp : ffffffe0023ffc20 gp : ffffffe0013e1fe0 tp : ffffffe0023e4e00 t0 : 0000000000000000
> [   47.701872]  t1 : 000000000000000e t2 : 000000000000001b s0 : ffffffe0023ffc70 s1 : ffffffe000206850 a0 : 0000000000000000 a1 : ffffffffffffffff
> [   47.705550]  a2 : 0000000000000000 a3 : ffffffe03af7c5e8 a4 : 0000000000000000 a5 : 0000000000000000 a6 : 0000000000000000 a7 : 00000000150b02d8
> [   47.709159]  s2 : 0000000000000008 s3 : 0000000000000858 s4 : ffffffe0023ffc98 s5 : 0000000000000850 s6 : 0000000000000003 s7 : 0000000000000002
> [   47.714135]  s8 : 0000000000000004 s9 : 0000000000000001 s10: 0000000000000001 s11: 0000000000000003 t3 : ffffffffffffe000 t4 : 0000000000d86254
> [   47.716574]  t5 : 0000000000000005 t6 : 0000000000040000status: 0000000000000100 badaddr: 0000000000000000 cause: 0000000000000003
> [   47.720019] CPU: 0 PID: 11 Comm: migration/0 Not tainted 5.9.0-11367-g1054335 #132
> [   47.722074] Call Trace:
> [   47.722561] [<ffffffe000203c88>] walk_stackframe+0x0/0xc2
> [   47.724608] [<ffffffe000b2020a>] show_stack+0x46/0x52
> [   47.726246] [<ffffffe000b23c24>] dump_stack+0x90/0xb6
> [   47.727672] [<ffffffe00020c9c4>] __warn+0x98/0xfa
> [   47.729131] [<ffffffe0005f4be0>] report_bug+0xaa/0x11e
> [   47.730624] [<ffffffe000203b74>] do_trap_break+0x96/0xfe
> [   47.732448] [<ffffffe000201daa>] ret_from_exception+0x0/0x14
> [   47.734341] [<ffffffe00020452c>] patch_insn_write+0x17e/0x19a
> [   47.737235] irq event stamp: 39
> [   47.738521] hardirqs last  enabled at (39): [<ffffffe000201d0a>] _save_context+0xa2/0xe6
> [   47.741055] hardirqs last disabled at (38): [<ffffffe0002c2404>] multi_cpu_stop+0x130/0x166
> [   47.743551] softirqs last  enabled at (0): [<ffffffe00020a4d2>] copy_process+0x430/0x1316
> [   47.746031] softirqs last disabled at (0): [<0000000000000000>] 0x0
> [   47.748617] ---[ end trace 88a1054faa6524ef ]---
>
> Because the path of stop_machine(__ftrace_modify_code)->
> ftrace_modify_all_code->...->patch_insn_write has no pair of
> lock&unlock text_mutex, so we shouldn't put assert here.
>

What platform are you testing ? We are seeing a crash while enabling
any of the tracers multiple times
on Qemu/HiFive Unleashed.

http://lists.infradead.org/pipermail/linux-riscv/2020-October/002354.html

As per the thread, Zong agreed to take a look into that.
@Zong Li : Do you have any update regarding the ftrace issue.

> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  arch/riscv/kernel/patch.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 0b55287..2ee5063 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -55,13 +55,6 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
>         bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
>         int ret;
>
> -       /*
> -        * Before reaching here, it was expected to lock the text_mutex
> -        * already, so we don't need to give another lock here and could
> -        * ensure that it was safe between each cores.
> -        */
> -       lockdep_assert_held(&text_mutex);
> -
>         if (across_pages)
>                 patch_map(addr + len, FIX_TEXT_POKE1);
>
> --
> 2.7.4
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
