Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BCBC43327
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 08:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4B98OAOrwO1Hp5VFHNaKyZuqX1HGrM+ZNHBEOuiUjUY=; b=TwkZMZJbv4OPEz
	yv4ls/Yl1jJgCcl7fCYHkP6KF4yqqMIOm3lx3gmkLJGNbXWGF+Jsb2wkMf/Lifi/8GWW+WVA0kuEz
	SQmIfgl6WXDs4PsAD2FsmEa7hVctLthUsdBC3AJO0i9LLs8LFxYSDwnHtbJMcrSG6B2PzH2zFIW7H
	9KKz8TMU1/jRF3et+vNCAS013/uMSjQ8TiG29IjXnhtaHaj4ft1OXWakWQJNIy5XaHxvGT+6d2buy
	4aB++lqw9dqt80Y8xcu/KCP818gaGXSUeyrGEDFYTlaPrMVPGHckD2VVTp0NBLFhfpw5v8X+THQ5a
	McxIMIyyIHytVGHhh4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdkhj-0000000Cyhz-30E4;
	Sun, 28 Jun 2026 08:17:27 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdkhg-0000000Cyhc-3yzS
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jun 2026 08:17:26 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c9254669d0cso1523919a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2026 01:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634644; x=1783239444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMZJ3bc/HOOdrYFXeaDGp5Mr01fg5cOybXiq3cNrcV0=;
        b=fBAAnov9abelqVeRglmUsq7lCCLBhivY0bdaHjRNvyG0KIdJISISHER+Af/EDR73gS
         9DqpxZNRazZosqJPNH1DKH9x4/XUnsE95mM6QhpgH06BK5lvRfXsV50LT5bDbEpkRX/B
         mu+A6bBywSDGUtoobkioWpEevAY0DPQSnCAgjQfpChMc7y6CV5Q2eeYsOsAEtRAF04ix
         5vO/B/+lphfknZ0vHacf9Pbv2e2b2xl+Ha1qM77V74rAyDlgGBHZHsstoKjmGqpHythn
         Vx8zp87AiKKeqlcidrnrWDYMXJS/aLC5lpdGx1sdviXEv9oS9SrO6l15FTjRFKMr6HD7
         cBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634644; x=1783239444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMZJ3bc/HOOdrYFXeaDGp5Mr01fg5cOybXiq3cNrcV0=;
        b=E9I5n04c4cThq9/67FBMk7Igu+g7qqdO6WqyFOUKZuoq/vL7H6+w98HwI2pqXgAiz1
         UmGxuil8UXzf3dju5WyCk+W6Tdkh3cTqKjQv9oo7k0W3u7GkDXFXuiYDSuRaAL/OXJsq
         vEa+RbAWJJWSTu1QeQHURgIFcCcA+4r8l5LmHYDiydWGym+F6I1hkVzDAqHm/a01rZD/
         vHjuXgJXrzLQ/guk0LgcjCuxyhtF8fi5DegxxzfwhfcdTcNig5/59jvy/gYcJd3EIwSe
         mPcPhtZ8zkr1iHeOBhoR0+oC3yKJrxyo2FU+/HMGOTvVZz/fiU0DX9TU3en4jOUZkhnn
         z/NQ==
X-Forwarded-Encrypted: i=1; AFNElJ/n7jeNWAY2AaojSBD+nDGyDxbefXHoltrs/Jqe8cryqL7F1P1/dyaAYObg4QMs4vODASec1fzm46tUqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTInvCF8RjPiCM3hnqVwSPce+E1iIAOToz5eJqW5pSBrtZp4Bo
	EJBIBbcRlBKG3SEZFcHg044uVm1H8q44cxEcVvv8TIF2h+tF4zEYL14A
X-Gm-Gg: AfdE7cmWLzwQZ/G6SfNNWqCB6f1tBR4uOBv+Jxcx2/G/4Ecpkqm4QjQzzD7tLeLyfi5
	uRMIIqXlxe2LY9ZJ7YNz4d3WEc2LSwTs2q6lvigdzlDuQ5b5F5tPbFoe6Zy+XY94+qFtx9BrI5U
	yTUJ7OH1hGwdODSXsQd4pE1DZXEOewvSlCm2NEqPB26S5PLxKwIXeNVVLAXEo739y73FUCS4fs/
	jHXs+gySkBlS7cmhBXejxv7BYKkMP0W4RGhXkENnL/7XvRa6exvCbORHkc/6f8Gd09GWK41KrtX
	io3ybbyry97g+CuUEiXFVbvoppQ8RA2p+zTzq15qkLu4SvQhODEJYOuSx62k3aKLap3RntO3Y/0
	TaWXRhedtNpwfbKTSzj71o4R5webF88fDA7n0Y9vjll0IYHvMCZHarQYjFPvj7M/LjN8bvYumBx
	ZTzVOixDsiISIMsJlsd1EO2ZFaSysb/i8Yp33a99CgscLldVvAukWed/4=
X-Received: by 2002:a05:6300:6bc2:20b0:3b3:1c7b:ff0 with SMTP id adf61e73a8af0-3bd4af033acmr7744492637.32.1782634643791;
        Sun, 28 Jun 2026 01:17:23 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:3b4a:8aa::dd:15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bd55985asm6020434a12.31.2026.06.28.01.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:17:23 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pulehui@huawei.com
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	puranjay@kernel.org,
	shuah@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v2 0/3] Add BPF Exceptions support for RISC-V
Date: Sun, 28 Jun 2026 13:47:07 +0530
Message-ID: <20260628081710.113333-1-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_011725_033790_471B4671 
X-CRM114-Status: GOOD (  12.36  )
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

This patchset aims to add BPF exceptions supports for riscv64 by
implementing the arch_bpf_stack_walk function and then updating the
prologue and epilogue for BPF JIT on riscv. Also,
bpf_jit_supports_exceptions() returns true now so that the verifier does
not reject programs containing BPF exceptions on riscv64. 

On riscv the unwinder used by arch_bpf_stack_walk() is the frame-pointer
unwinder, so exception support is gated on CONFIG_FRAME_POINTER.

In the prologue and epilogue of the RISC-V JIT, I saved the
return address and then the frame-pointer according to [1]. Also,
according to [2], s0 to s11 are callee saved registers, which is why a
new array (rv_exception_csave_regs) has been created to save these
registers which contains all the required registers along with the frame
pointer as well as return address.

The following demonstrates that all the selftests for BPF exceptions
apart from the ones that mix bpf-to-bpf calls and tailcalls pass.
This patch was tested using vmtest.sh to run the selftests.

test_exceptions_success:PASS:exceptions__open 0 nsec
libbpf: prog 'exception_tail_call': BPF program load failed: -EINVAL
libbpf: prog 'exception_tail_call': -- BEGIN PROG LOAD LOG --
0: R1=ctx() R10=fp0
; volatile int ret = 0; @ exceptions.c:106
0: (b4) w2 = 0                        ; R2=0
1: (63) *(u32 *)(r10 -4) = r2         ; R2=0 R10=fp0
; ret = exception_tail_call_subprog(ctx); @ exceptions.c:108
2: (85) call pc+4
caller:
 R10=fp0
callee:
 frame1: R1=ctx() R2=0 R10=fp0
7: frame1: R1=ctx() R10=fp0
; int exception_tail_call_subprog(struct __sk_buff *ctx) @ exceptions.c:96
7: (bf) r6 = r1                       ; frame1: R1=ctx() R6=ctx()
; volatile int ret = 10; @ exceptions.c:98
8: (b4) w1 = 10                       ; frame1: R1=10
9: (63) *(u32 *)(r10 -4) = r1         ; frame1: R1=10 R10=fp0 fp-8=mmmm????
; asm volatile("r1 = %[ctx]\n\t" @ bpf_helpers.h:169
10: (18) r7 = 0xff60000080df1800      ; frame1: R7=map_ptr(map=jmp_table,ks=4,vs=4)
12: (bf) r1 = r6                      ; frame1: R1=ctx() R6=ctx()
13: (bf) r2 = r7                      ; frame1: R2=map_ptr(map=jmp_table,ks=4,vs=4) R7=map_ptr(map=jmp_table,ks=4,vs=4)
14: (b7) r3 = 0                       ; frame1: R3=0
15: (85) call bpf_tail_call#12
mixing of tail_calls and bpf-to-bpf calls is not supported
processed 11 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
-- END PROG LOAD LOG --
libbpf: prog 'exception_tail_call': failed to load: -EINVAL
libbpf: failed to load object 'exceptions'
libbpf: failed to load BPF skeleton 'exceptions': -EINVAL
test_exceptions_success:FAIL:exceptions__load unexpected error: -22 (errno 22)
tester_init:PASS:tester_log_buf 0 nsec
process_subtest:PASS:obj_open_mem 0 nsec
process_subtest:PASS:specs_alloc 0 nsec
tester_init:PASS:tester_log_buf 0 nsec
process_subtest:PASS:obj_open_mem 0 nsec
process_subtest:PASS:specs_alloc 0 nsec
#113/1   exceptions/reject_exception_cb_type_1:OK
#113/2   exceptions/reject_exception_cb_type_2:OK
#113/3   exceptions/reject_exception_cb_type_3:OK
#113/4   exceptions/reject_exception_cb_type_4:OK
#113/5   exceptions/reject_exception_cb_type_5:OK
#113/6   exceptions/reject_async_callback_throw:OK
#113/7   exceptions/reject_with_lock:OK
#113/8   exceptions/reject_subprog_with_lock:OK
#113/9   exceptions/reject_with_rcu_read_lock:OK
#113/10  exceptions/reject_subprog_with_rcu_read_lock:OK
#113/11  exceptions/reject_with_rbtree_add_throw:OK
#113/12  exceptions/reject_with_reference:OK
#113/13  exceptions/reject_global_subprog_throw_with_reference:OK
#113/14  exceptions/reject_with_cb_reference:OK
#113/15  exceptions/reject_with_cb:OK
#113/16  exceptions/reject_with_subprog_reference:OK
#113/17  exceptions/reject_throwing_exception_cb:OK
#113/18  exceptions/reject_exception_cb_call_global_func:OK
#113/19  exceptions/reject_exception_cb_call_static_func:OK
#113/20  exceptions/reject_multiple_exception_cb:OK
#113/21  exceptions/reject_exception_throw_cb:OK
#113/22  exceptions/reject_exception_throw_cb_diff:OK
#113/23  exceptions/reject_subprog_rcu_lock_throw:OK
#113/24  exceptions/reject_subprog_throw_preempt_lock:OK
#113/25  exceptions/reject_subprog_throw_irq_lock:OK
#113/26  exceptions/reject_set_exception_cb_bad_ret1:OK
#113/27  exceptions/reject_set_exception_cb_bad_ret2:OK
#113/28  exceptions/reject_out_of_range_global_throw:OK
#113/29  exceptions/check_assert_eq_int_min:OK
#113/30  exceptions/check_assert_eq_int_max:OK
#113/31  exceptions/check_assert_eq_zero:OK
#113/32  exceptions/check_assert_eq_llong_min:OK
#113/33  exceptions/check_assert_eq_llong_max:OK
#113/34  exceptions/check_assert_lt_pos:OK
#113/35  exceptions/check_assert_lt_zero:OK
#113/36  exceptions/check_assert_lt_neg:OK
#113/37  exceptions/check_assert_le_pos:OK
#113/38  exceptions/check_assert_le_zero:OK
#113/39  exceptions/check_assert_le_neg:OK
#113/40  exceptions/check_assert_gt_pos:OK
#113/41  exceptions/check_assert_gt_zero:OK
#113/42  exceptions/check_assert_gt_neg:OK
#113/43  exceptions/check_assert_ge_pos:OK
#113/44  exceptions/check_assert_ge_zero:OK
#113/45  exceptions/check_assert_ge_neg:OK
#113/46  exceptions/check_assert_range_s64:OK
#113/47  exceptions/check_assert_range_u64:OK
#113/48  exceptions/check_assert_single_range_s64:OK
#113/49  exceptions/check_assert_single_range_u64:OK
#113/50  exceptions/check_assert_generic:OK
#113/51  exceptions/check_assert_with_return:OK
#113     exceptions:FAIL

All error logs:
test_exceptions_success:PASS:exceptions__open 0 nsec
libbpf: prog 'exception_tail_call': BPF program load failed: -EINVAL
libbpf: prog 'exception_tail_call': -- BEGIN PROG LOAD LOG --
0: R1=ctx() R10=fp0
; volatile int ret = 0; @ exceptions.c:106
0: (b4) w2 = 0                        ; R2=0
1: (63) *(u32 *)(r10 -4) = r2         ; R2=0 R10=fp0
; ret = exception_tail_call_subprog(ctx); @ exceptions.c:108
2: (85) call pc+4
caller:
 R10=fp0
callee:
 frame1: R1=ctx() R2=0 R10=fp0
7: frame1: R1=ctx() R10=fp0
; int exception_tail_call_subprog(struct __sk_buff *ctx) @ exceptions.c:96
7: (bf) r6 = r1                       ; frame1: R1=ctx() R6=ctx()
; volatile int ret = 10; @ exceptions.c:98
8: (b4) w1 = 10                       ; frame1: R1=10
9: (63) *(u32 *)(r10 -4) = r1         ; frame1: R1=10 R10=fp0 fp-8=mmmm????
; asm volatile("r1 = %[ctx]\n\t" @ bpf_helpers.h:169
10: (18) r7 = 0xff60000080df1800      ; frame1: R7=map_ptr(map=jmp_table,ks=4,vs=4)
12: (bf) r1 = r6                      ; frame1: R1=ctx() R6=ctx()
13: (bf) r2 = r7                      ; frame1: R2=map_ptr(map=jmp_table,ks=4,vs=4) R7=map_ptr(map=jmp_table,ks=4,vs=4)
14: (b7) r3 = 0                       ; frame1: R3=0
15: (85) call bpf_tail_call#12
mixing of tail_calls and bpf-to-bpf calls is not supported
processed 11 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
-- END PROG LOAD LOG --
libbpf: prog 'exception_tail_call': failed to load: -EINVAL
libbpf: failed to load object 'exceptions'
libbpf: failed to load BPF skeleton 'exceptions': -EINVAL
test_exceptions_success:FAIL:exceptions__load unexpected error: -22 (errno 22)

Changes in v1->v2:
v1: https://lore.kernel.org/bpf/20260621144259.288135-1-varunrmallya@gmail.com/
- resolve the ftrace trampoline address with ftrace_graph_ret_addr()
  inside arch_bpf_stack_walk()
- Remove duplicated code in bpf_jit_build_prologue()

[1]: https://riscv-non-isa.github.io/riscv-elf-psabi-doc/#_frame_pointer_convention
[2]: https://riscv-non-isa.github.io/riscv-elf-psabi-doc/#_integer_register_convention


Varun R Mallya (3):
  riscv: stacktrace: Implement arch_bpf_stack_walk() for BPF
  riscv, bpf: Add support for BPF exceptions
  riscv, bpf: Remove BPF exceptions from BPF CI denylist

 arch/riscv/kernel/stacktrace.c               |  31 +++++
 arch/riscv/net/bpf_jit_comp64.c              | 115 ++++++++++++++++---
 tools/testing/selftests/bpf/DENYLIST.riscv64 |   1 -
 3 files changed, 133 insertions(+), 14 deletions(-)

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
