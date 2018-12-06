Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAF8C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 18:26:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D32120892
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 18:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nBvSQKYh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HApzvqug"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D32120892
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lp8Uc61BN8NEKy25IiAVB2/lJMHsJ/7ycY+w39wq6lc=; b=nBvSQKYhSw9T5l
	B9NyBqKfk6OX+kb0a4/wRBNOqioNgYKM1og9mCZkuAbjD9WdGqGrWZcC4Iu8cmm8MMFCPc44tkVmg
	j8bcDTYLHx0DO8LI8YfF/ZZsUjSnsb4RsGFBj+hXIJAk444bdTabOqs69clw2yR2Vi9vLNxEIq9gr
	NGZMi0qXrr9h5PRzISkvoxI/2HQFhVgNAvKTGXP7VqvFqfMKenemobnADV/QPJe81iPl8MnLNCpks
	/y0WjibgGXlwBrE91Khd2rPDCdcdwqRW0Pwg8QRrTyCUGH7BqEXZBMhex/aL+0G8s3NCRv8QdLE6F
	QGAcEZRKLzk7FIUJ2rPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUyLv-0004VN-Gf; Thu, 06 Dec 2018 18:26:23 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUyLq-0004Ib-Mk
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 18:26:21 +0000
Received: by mail-oi1-x244.google.com with SMTP id u18so1209570oie.10
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 10:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v2DWXNZ/Eudi3XtWV6e+8PEfxt5fUO75Ry2aNHGeSqc=;
 b=HApzvqugz5o2w6TxLkJMJyiDE8mJAGIlDA9FJyxBHkuVOHFh7NfJLcR33fvCdetIXi
 mJkJ5NunGNHcTiSVB8CjhxkY/q925yEtAggokiXdEoL1Xe9g6G64IPTnLqeq/iXzj8bY
 AVD41zZiaLS8IoLePz77v/Px6epYakxgnzewzQJyZXBUn/RHyORkSlY6zRzuY4gC3C0c
 q+uhVCxfK7+hINXXTTlHkAMB6DNxSM/kcbT9zrEqQkZUz9Smv/jzvj8K7Tqi42h7Qnxp
 t3wC3r7yCYI2akhS3iLveyDcrlazyg0XTXcbZSVS79PIEcRYYOjAmLOV3oV8RY0cGFkI
 MbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v2DWXNZ/Eudi3XtWV6e+8PEfxt5fUO75Ry2aNHGeSqc=;
 b=ldFUpxk791EVLHgtPonYNFIm4hmDlstlmdlb1B1xCcbGA5AQ9Ho2npU+ky68gbrXvA
 ExNJssISoo2kEcjcupIN6cToQiY39/g2QGJUx+YK0XQ96vEoTLnK4HHf5b1r6zsndFka
 b4T464zMdLiayT+i5O7tznZB3ntZE1c/OYXqaQW/7RFbUvm2nzyOUZayIyLBt4ObVrei
 t6Dvzy/CBXerf0F08ZYJoD5Pv4Ntbg4ZNI+k4bIJ02Y3oNzFnlUafppGtbtpma6X6x+g
 y/s/hHoCB/fF/MKPOlfwI+VAwY3lyK1qbCCjoTW9wQ+TZHDjC+gXQYArqxFgfkKVLNw0
 +RpA==
X-Gm-Message-State: AA+aEWbIWMUBHO3iX+FIdJoO755llNpI+j56bC+joaS4tvgAsgPm2CiS
 Z93oYGuokLytkIyBco7voBPCxna04kUOCfn+cKw=
X-Google-Smtp-Source: AFSGD/X2WPmdahMOIyQRLcoLeMUMf9T7g2Ctc9+pT5xESJxtU8gW+lAPmyfEpYapSxjfIvr7D0/rkw4I0vSVjfBLiP0=
X-Received: by 2002:aca:db85:: with SMTP id
 s127mr17302958oig.165.1544120766589; 
 Thu, 06 Dec 2018 10:26:06 -0800 (PST)
MIME-Version: 1.0
References: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
 <20181206150156.28210-2-david.abdurachmanov@gmail.com>
 <CAGXu5jKfnE_RJL7aA5x-qqYdA9zoTTtKwahg0r5fyW5GqFLgdA@mail.gmail.com>
In-Reply-To: <CAGXu5jKfnE_RJL7aA5x-qqYdA9zoTTtKwahg0r5fyW5GqFLgdA@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Thu, 6 Dec 2018 19:25:55 +0100
Message-ID: <CAEn-LTrhGAX2+V5r1kdBQw33M4Sre8P5e7wfRcwFruT5Y-WeXw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: add support for SECCOMP incl. filters
To: Kees Cook <keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_102619_311239_9B552FD4 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: aou@eecs.berkeley.edu, Will Drewry <wad@chromium.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 luto@amacapital.net, Green Hu <green.hu@gmail.com>,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 6, 2018 at 5:52 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Dec 6, 2018 at 7:02 AM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
> > The patch adds support for SECCOMP and SECCOMP_FILTER (BPF).
>
> Can you add support to tools/testing/selftests/seccomp/seccomp_bpf.c
> as well? That selftest finds a lot of weird corner-cases...

I hate it locally and will include in v2.

The results see fine (tested in QEMU).

TAP version 13
selftests: seccomp: seccomp_bpf
========================================
[==========] Running 64 tests from 1 test cases.
[ RUN      ] global.mode_strict_support
[       OK ] global.mode_strict_support
[ RUN      ] global.mode_strict_cannot_call_prctl
[       OK ] global.mode_strict_cannot_call_prctl
[ RUN      ] global.no_new_privs_support
[       OK ] global.no_new_privs_support
[ RUN      ] global.mode_filter_support
[       OK ] global.mode_filter_support
[ RUN      ] global.mode_filter_without_nnp
[       OK ] global.mode_filter_without_nnp
[ RUN      ] global.filter_size_limits
[       OK ] global.filter_size_limits
[ RUN      ] global.filter_chain_limits
[       OK ] global.filter_chain_limits
[ RUN      ] global.mode_filter_cannot_move_to_strict
[       OK ] global.mode_filter_cannot_move_to_strict
[ RUN      ] global.mode_filter_get_seccomp
[       OK ] global.mode_filter_get_seccomp
[ RUN      ] global.ALLOW_all
[       OK ] global.ALLOW_all
[ RUN      ] global.empty_prog
[       OK ] global.empty_prog
[ RUN      ] global.log_all
[       OK ] global.log_all
[ RUN      ] global.unknown_ret_is_kill_inside
[       OK ] global.unknown_ret_is_kill_inside
[ RUN      ] global.unknown_ret_is_kill_above_allow
[       OK ] global.unknown_ret_is_kill_above_allow
[ RUN      ] global.KILL_all
[       OK ] global.KILL_all
[ RUN      ] global.KILL_one
[       OK ] global.KILL_one
[ RUN      ] global.KILL_one_arg_one
[       OK ] global.KILL_one_arg_one
[ RUN      ] global.KILL_one_arg_six
[       OK ] global.KILL_one_arg_six
[ RUN      ] global.KILL_thread
[       OK ] global.KILL_thread
[ RUN      ] global.KILL_process
[       OK ] global.KILL_process
[ RUN      ] global.arg_out_of_range
[       OK ] global.arg_out_of_range
[ RUN      ] global.ERRNO_valid
[       OK ] global.ERRNO_valid
[ RUN      ] global.ERRNO_zero
[       OK ] global.ERRNO_zero
[ RUN      ] global.ERRNO_capped
[       OK ] global.ERRNO_capped
[ RUN      ] global.ERRNO_order
[       OK ] global.ERRNO_order
[ RUN      ] TRAP.dfl
[       OK ] TRAP.dfl
[ RUN      ] TRAP.ign
[       OK ] TRAP.ign
[ RUN      ] TRAP.handler
[       OK ] TRAP.handler
[ RUN      ] precedence.allow_ok
[       OK ] precedence.allow_ok
[ RUN      ] precedence.kill_is_highest
[       OK ] precedence.kill_is_highest
[ RUN      ] precedence.kill_is_highest_in_any_order
[       OK ] precedence.kill_is_highest_in_any_order
[ RUN      ] precedence.trap_is_second
[       OK ] precedence.trap_is_second
[ RUN      ] precedence.trap_is_second_in_any_order
[       OK ] precedence.trap_is_second_in_any_order
[ RUN      ] precedence.errno_is_third
[       OK ] precedence.errno_is_third
[ RUN      ] precedence.errno_is_third_in_any_order
[       OK ] precedence.errno_is_third_in_any_order
[ RUN      ] precedence.trace_is_fourth
[       OK ] precedence.trace_is_fourth
[ RUN      ] precedence.trace_is_fourth_in_any_order
[       OK ] precedence.trace_is_fourth_in_any_order
[ RUN      ] precedence.log_is_fifth
[       OK ] precedence.log_is_fifth
[ RUN      ] precedence.log_is_fifth_in_any_order
[       OK ] precedence.log_is_fifth_in_any_order
[ RUN      ] TRACE_poke.read_has_side_effects
[       OK ] TRACE_poke.read_has_side_effects
[ RUN      ] TRACE_poke.getpid_runs_normally
[       OK ] TRACE_poke.getpid_runs_normally
[ RUN      ] TRACE_syscall.ptrace_syscall_redirected
[       OK ] TRACE_syscall.ptrace_syscall_redirected
[ RUN      ] TRACE_syscall.ptrace_syscall_dropped
[       OK ] TRACE_syscall.ptrace_syscall_dropped
[ RUN      ] TRACE_syscall.syscall_allowed
[       OK ] TRACE_syscall.syscall_allowed
[ RUN      ] TRACE_syscall.syscall_redirected
[       OK ] TRACE_syscall.syscall_redirected
[ RUN      ] TRACE_syscall.syscall_dropped
[       OK ] TRACE_syscall.syscall_dropped
[ RUN      ] TRACE_syscall.skip_after_RET_TRACE
[       OK ] TRACE_syscall.skip_after_RET_TRACE
[ RUN      ] TRACE_syscall.kill_after_RET_TRACE
[       OK ] TRACE_syscall.kill_after_RET_TRACE
[ RUN      ] TRACE_syscall.skip_after_ptrace
[       OK ] TRACE_syscall.skip_after_ptrace
[ RUN      ] TRACE_syscall.kill_after_ptrace
[       OK ] TRACE_syscall.kill_after_ptrace
[ RUN      ] global.seccomp_syscall
[       OK ] global.seccomp_syscall
[ RUN      ] global.seccomp_syscall_mode_lock
[       OK ] global.seccomp_syscall_mode_lock
[ RUN      ] global.detect_seccomp_filter_flags
[       OK ] global.detect_seccomp_filter_flags
[ RUN      ] global.TSYNC_first
[       OK ] global.TSYNC_first
[ RUN      ] TSYNC.siblings_fail_prctl
[       OK ] TSYNC.siblings_fail_prctl
[ RUN      ] TSYNC.two_siblings_with_ancestor
[       OK ] TSYNC.two_siblings_with_ancestor
[ RUN      ] TSYNC.two_sibling_want_nnp
[       OK ] TSYNC.two_sibling_want_nnp
[ RUN      ] TSYNC.two_siblings_with_no_filter
[       OK ] TSYNC.two_siblings_with_no_filter
[ RUN      ] TSYNC.two_siblings_with_one_divergence
[       OK ] TSYNC.two_siblings_with_one_divergence
[ RUN      ] TSYNC.two_siblings_not_under_filter
[       OK ] TSYNC.two_siblings_not_under_filter
[ RUN      ] global.syscall_restart
[       OK ] global.syscall_restart
[ RUN      ] global.filter_flag_log
[       OK ] global.filter_flag_log
[ RUN      ] global.get_action_avail
[       OK ] global.get_action_avail
[ RUN      ] global.get_metadata
[       OK ] global.get_metadata
[==========] 64 / 64 tests passed.
[  PASSED  ]
ok 1..1 selftests: seccomp: seccomp_bpf [PASS]
selftests: seccomp: seccomp_benchmark
========================================
Calibrating reasonable sample size...
1544120467.383132905 - 1544120467.382814604 = 318301
1544120467.384111505 - 1544120467.383931405 = 180100
1544120467.385728706 - 1544120467.384510905 = 1217801
1544120467.386858006 - 1544120467.386096506 = 761500
1544120467.388563407 - 1544120467.387171006 = 1392401
1544120467.392465908 - 1544120467.390143107 = 2322801
1544120467.397988410 - 1544120467.393666109 = 4322301
1544120467.406494614 - 1544120467.398347511 = 8147103
1544120467.427372522 - 1544120467.406955414 = 20417108
1544120467.467600338 - 1544120467.427772222 = 39828116
1544120467.542484667 - 1544120467.467954738 = 74529929
1544120467.693806026 - 1544120467.543004867 = 150801159
1544120467.970921334 - 1544120467.694244026 = 276677308
1544120468.522149049 - 1544120467.971549534 = 550599515
1544120469.637696984 - 1544120468.522606749 = 1115090235
1544120471.829467338 - 1544120469.638147084 = 2191320254
1544120476.263601568 - 1544120471.829850239 = 4433751329
1544120485.135465027 - 1544120476.263980268 = 8871484759
Benchmarking 4194304 samples...
26.716000000 - 17.812000000 = 8904000000
getpid native: 2122 ns
46.548000000 - 26.716000000 = 19832000000
getpid RET_ALLOW: 4728 ns
Estimated seccomp overhead per syscall: 2606 ns
ok 1..2 selftests: seccomp: seccomp_benchmark [PASS]

>
> > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> > index 1c9cc8389928..1fd6e4130cab 100644
> > --- a/arch/riscv/include/asm/thread_info.h
> > +++ b/arch/riscv/include/asm/thread_info.h
> > @@ -81,6 +81,7 @@ struct thread_info {
> >  #define TIF_MEMDIE             5       /* is terminating due to OOM killer */
> >  #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
> >  #define TIF_SYSCALL_AUDIT      7       /* syscall auditing */
> > +#define TIF_SECCOMP                    8       /* syscall secure computing */
>
> Nit: extra tab needs to be removed.
>
> --
> Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
