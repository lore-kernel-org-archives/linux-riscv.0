Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832F5CD98F2
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jun 2026 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DepeNNWEXVU2xYHYRBa4aaZ07rooP4V2EsFf8ldhSlo=; b=N3mKIZzvY43enL
	h07d+UauaGChDTPkvvAfQgZq4IRGXxv7TC88Grb/MXcq2zHgTZE/MHm7lHAifgtKwafDzsGkvH+tp
	DO3T1SMRh88xCQv4DDAnmKVlGTxNjnl3uM3gSowJpBC56lSZUqeq7CLQQgGUSm3/aVl8y7RX7FNS1
	YNI1VZNvL7c1C/qJl7ZLgkpmLyNnR0a1eyr9Qbopy4COv7kGrDkiPYNy2S7TwjxaPdZdLVjUR7SyX
	cp3T5xCpa0J3Zd61OGuy58sjxyGwKZ7G3/x72rW0THLMZWDMhPtyWe/e+4dm3CzDxxAFsh3caGOUW
	uqkakzbnUH8iYSvxURFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJOH-00000003zrx-0giY;
	Sun, 21 Jun 2026 14:43:17 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJOD-00000003zrY-3hmc
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jun 2026 14:43:16 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8424b00710aso2439482b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jun 2026 07:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782052992; x=1782657792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j21QVkqcaKlx86cBO+UHi3ihgP8Gq0rj/qDDVA+Xps4=;
        b=aUHtU//HnuGO6XZ+MqJGFffxR2XETBK3QHQo1TVUhXj72OHCZZPdiKzr+4KJRZUiXV
         vehNveg6Vlx4ujSIAfhjQd17zGfa3ImqPNKNDk18AFFz6coHavxGJjQp1aX5RqLeFL0k
         HPDeiObtLHmqUbCQepd0n6qIHwZRhy7hs8jvUSUMXN4xbybf1+WVANPa5VBvtH0WU98/
         YPHqKQxT0m/6z8ToIlb8UM0iuBMRMfxKdfhaW+y2vxN/SnD9MwhUwp+Wu+tGh2CHq25r
         rg8hO4ST+bd7EX2l1oIZA5iB+nQaoaKRz9tPHcX0MqxvUAnGy+aMjQUoya0kyUoayP67
         ugpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782052992; x=1782657792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j21QVkqcaKlx86cBO+UHi3ihgP8Gq0rj/qDDVA+Xps4=;
        b=aJIcgmYwtZ3kY89fk9JLKuDw7QSn2+j4pS3EcVM88anWIJzf6H6A9KKRxsdchW65TH
         4fgFHv5oQTbCbkPTnXz3FIWg4SokSikbTecbfgXg5fmVM5P19cB5z8nVudv9AAl3V10/
         FEiVng+AP4jLhGHrTSrw9mXxi/hCl38AlxmGqFMOj6oEI9twzlm22eWUoINzdO/Od/Eu
         7QIo6Qz0z2+eQtv9iUJLwp4aVtRxBnJyZ220HS/u0j2Bg8N4gLV6m9HQH3wxnM6xV8iW
         O4WiNs2Y1Ia5Z3nwNVR1tfRkD2qONZ7GT3wFu4fV4oN1OsZiBkRQlIQyydoqa5VDu+fc
         BUow==
X-Forwarded-Encrypted: i=1; AFNElJ+HW7RipONKO/4dhy6jMOCTW+dWJiOjt0GJ1si3/v1LiU3p3iUOfFO1ZBqYj6Say9EMyXVyo2uyoX597Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrDml03QZ51LsdOjzbw8H1/20WDFJrKl5t7NMqgjWbDEtCGatf
	hHqturtbLsopYb9huS2BqwHf6kHi96LpB1fueNc4K+aYBYKcuLK6JoWe
X-Gm-Gg: AfdE7clMiyv2hPGsEQza7MC2Hqx9tXWAjWjFj1Y0bBCzeUOgGu9RFUg5Z8OscwtiC5U
	IH5XUN1yZXCgt80XZrbhZHgPohsUPUW6TgH6zYY1Pa9iPvvZNL0xHnz9DzOe4+LyIuScbELBIbO
	DyfCJHL4SBjLCTrhmAMKzJV426nmKcepzxHaJPfQ0ADTZSsPOxlMrU9QCADzDZ7EEwFdMiP+gMm
	FWRSdOxE9DV5CxD9Uc82XhZNECV7eL9F1EPxx/FoiwWgfA9MdSpyy0L1uKfmvv8mJMGrNZbdmKr
	UfTqYMXcbYeCX+h4qazbMbo21Pv9O2RufnUXDSOR35bCeS8ICigW6a6ZWqZO7cps+aqm5ssO4aV
	/D97ZTV1dH/sKmsCYux2xllevKPasQL/VPCXR119N8Es23nu/+hhNk7UsOWSZTWaSBOg7tOMbH7
	uNwFTDJA8ZCC3om00IX6npBhQsugq4UFIinW6LrFY=
X-Received: by 2002:a05:6a00:2eaa:b0:842:7992:bdd6 with SMTP id d2e1a72fcca58-845508a31e5mr11541607b3a.36.1782052992276;
        Sun, 21 Jun 2026 07:43:12 -0700 (PDT)
Received: from computer ([2a09:bac5:3b4a:8aa::dd:17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e7687csm4963254b3a.35.2026.06.21.07.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:43:11 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next 0/3] Add BPF Exceptions support for RISC-V
Date: Sun, 21 Jun 2026 20:12:56 +0530
Message-ID: <20260621144259.288135-1-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_074313_953775_DB675E2E 
X-CRM114-Status: GOOD (  12.09  )
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

[1]: https://riscv-non-isa.github.io/riscv-elf-psabi-doc/#_frame_pointer_convention
[2]: https://riscv-non-isa.github.io/riscv-elf-psabi-doc/#_integer_register_convention

Varun R Mallya (3):
  riscv: stacktrace: Implement arch_bpf_stack_walk() for BPF
  riscv, bpf: Add support for BPF exceptions
  riscv, bpf: Remove BPF exceptions from BPF CI denylist

 arch/riscv/kernel/stacktrace.c               |  28 +++++
 arch/riscv/net/bpf_jit_comp64.c              | 102 +++++++++++++++++++
 tools/testing/selftests/bpf/DENYLIST.riscv64 |   1 -
 3 files changed, 130 insertions(+), 1 deletion(-)

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
