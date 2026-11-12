Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FD3606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 10:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4aJ16spF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iFLP/jdd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hZKE3EmG9Ye0XRCnVriLskIdyHQDVAtu5rY4DCNv/iI=; b=4aJ16spFYPBvlzQ+Y1hl44HSwM
	1Vj6UpsGsyQJ6HrYO2cr9F+YQb1j5izlFNqWcsJg+ALSQ3cuKa1FbW/Nv0hOVQJtUxjrAwVYduA+x
	2CWbT2wiUwyYr1S+XG5TKq9UGewFtSsgUjHreEBK209CQvCFwvA32pIPtaLaAVXtjUdQWfymdk1ZS
	90FoAzMTfIMFfo8UGKnzQ455CPCwMchsOO9R5VdLenIzV+8Uo3ALhloG3iMmTD3RWIclN6WHBMDGO
	0EhLPfxU1dYA9YTjrIYZDYeu8DO4Tk2coiISa5Mbk6yNIciVPUjUCR4WhPYrVQSgKyhHevnkChw8P
	S2y0fO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSGM-00000009Ytk-08cO;
	Thu, 12 Nov 2026 10:42:38 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSGI-00000009Ysk-3NbZ
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 10:42:36 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3711270eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 02:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480150; x=1795084950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=klEvwnZ1yJl7mvpdDWS1ABMi3/7l4BDDL/A2UVpdY0c=;
        b=iFLP/jdd3UCgM7ovokb9yl9/6XaPexTmqw5rznv/1EGZK+r477ojjHyACxN07hgmnK
         sbzLxrEkEAeb1JcUsZqDywHItb9QySzCoYKLJDV0SsTCf/Qx+xXw2IWjZltcVek5XJoz
         JvQtVUJa6xJpTYIgn6n073ok8pl3q5Q4yS3h4835Z7cscoggR7EWgFJftFeSdSfJrRDC
         dVT3q2El1GA0WCm1QB4jTy2rFEelX/N/nS99YZ34I4qwyldwCHhqiF3ODu3QouZQ/Q0+
         56Zuc/VmrAhrP/mnvmZ4w2rSH4Tg7xuIKXDt+BjXkSDIUfQIl7nTT6jEY4SBd77ZVJ/4
         Yk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480150; x=1795084950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=klEvwnZ1yJl7mvpdDWS1ABMi3/7l4BDDL/A2UVpdY0c=;
        b=jhG6U8WAw9HiprAlzedO/6MOHZxBna30SPqcJ4Fnk+tAhnYyfhfQ4vF7eLYo4clfJ8
         WaRjqhm+1UccxNvhBuVQvW4vHx6HJDe2iuYFrnfRphOOH25d5+BNiDoEuJ+Sf050GKCJ
         aS3OEWSLOs0Ohp+8ieTysVZ04jD67o/ghAeAQwNuO+S0DgmuqFGz1KZ/CFUviZNPlcVf
         Y4Ax82OYvGh26jUIyPg/jEIMOgALAibRA1sXpCW4hefc3CyO0LTVrUTjiqRlLkJ/B8WK
         j+XKjW5+muaHvwALWi4gaQQRjcqTrya+9pNz8Ccrk4NQyhWNUFvuGy4zDmQLm3Tbsy6R
         /yjQ==
X-Forwarded-Encrypted: i=1; AL+hErEfaiCFuz7wohI+snA9XE8dgPQB3tVX1CfARP/S6LhnKKxRAj6zv+0dBl59YjG1BNGtz8G6+uCHoPgIfQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/tn2Q49JN84fgzLp8AznXbAtCtfavhrUcxmiTIYlmqMGftKb36
	RTyQg5b/y/Jbsmjws74LjiXNdS486PfqNTK3l/crMyQ5g7w/74mtOldXTstbI6bCzZ4=
X-Gm-Gg: AYBFou2b8QPzJkMEGW0Rk2y+JuNx0bRBZOI+JnzlJAUlhxHr+U8UlT2Zc4rTViJ1fdw
	mY8yNBg7lSa0pXz25PnCsP/HQjHIR0Q7KLpwcTYh0AQTh7hjI/I+hoaxpuVek5PZJamotntKfoa
	/UnumMCBaRP49/nt6UqMfy4APMsA9oVDvUGwcUkfi1rka4KICy9tpL4YR5muVxMtWTvVEMGQlus
	ov+xYsxXpQKXP7XPxzsfn0GJ4vRxJmPh8qHZ6xuDvXH92yeKfnRmCjVMcsbKXnXSrMAwibOoiME
	Y7NId1a0axEuacYFbKPeqzzsBikXV9WyWL6x9zvzqG3JJgS44VaOpscjro95EBOW1dUfiZIRvpc
	QuN+UsRQEqdqNflxkP5XUvMbXV/Lo/JUEqpU/uzp7RfzYGVTZg6uwohEAHySQKO6UmZBV/pKHrh
	tsxCloQpvm/3zNGzzFeqBxJieMnLRNqczod6AeqG8zPZ91y00WtBQxjk5WmdD2oVD+b5FqQI2sF
	APU6RCBwgtBzb+0bsKbTiSNf74anXOt3dCqkq7kbbAStlXm03B6SRX06bx6VZNlY5CbYfKg4ByY
	CnZ/UavrNMe3M5Kyg22Vi9EEsWCmQB48NrDSBMb3nvQG/BqdbbeZHF0mgbXxO6HAKCo/igWG9NX
	MMc8dEYxsCZjo
X-Received: by 2002:a05:693c:808f:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-37686858347mr5790109eec.25.1794480147991;
        Thu, 12 Nov 2026 02:42:27 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.42.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:42:27 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	oleg@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	broonie@kernel.org,
	cuiyunhui@bytedance.com,
	dave@stgolabs.net,
	david.laight.linux@gmail.com,
	jszhang@kernel.org,
	tglx@kernel.org,
	conor.dooley@microchip.com,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v10 0/9] riscv: optimize percpu access
Date: Thu, 12 Nov 2026 18:41:40 +0800
Message-Id: <20261112104149.38589-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_024234_867810_49BC0EE4 
X-CRM114-Status: GOOD (  13.40  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RISC-V has no asm/percpu.h, so this_cpu_*() read-modify-write
operations use generic fallbacks that disable local interrupts. Per-CPU
addressing also derives the current offset from the CPU number and
__per_cpu_offset[].

Cache the per-CPU offset in thread_info and implement preemptible this_cpu
operations using recoverable GPR critical sections. Each operation records
the registers used to form its per-CPU address so exception return can
repair them if the task resumes on a different CPU. Use AMOs for
native-width operations. Use Zabha for 8-bit and 16-bit operations when
available, or a 32-bit LR/SC fallback otherwise. Finally, select
HAVE_CMPXCHG_LOCAL so common per-CPU counter users can use
this_cpu_try_cmpxchg().

The recoverable-GPR scheme follows the arm64 design. Only the protocol is
common, however: RISC-V uses a cached offset in thread_info, its own GPR
encoding and exception entry code, and AMO/LR/SC operation sequences.
Factoring these pieces into generic code would share little beyond the
field layout while coupling architecture entry paths, so keep the
implementation under arch/riscv.

As with arm64's SDEI path, independent NMI-like entry paths must
participate in the entry-state protocol directly. Keep the save, clear and
restore operations in common RISC-V assembly macros so SBI Supervisor
Software Events (SSE) can preserve an interrupted per-CPU operation. SBI
SSE support is developed separately and is not a dependency of this
series.

With CONFIG_PREEMPT_LAZY=y, GCC 15, the same linux-next base and
configuration, an in-kernel microbenchmark pinned to one CPU ran each
operation 2,000,000 times for 15 rounds. The table reports the median
empty-loop-adjusted time; lower is better.

  operation                 v9 (ns/op)   v10 (ns/op)   change
  this_cpu_read(u64)            5.668         0.333     -94.1%
  this_cpu_write(u64)           5.668         0.395     -93.0%
  this_cpu_add(u64)             8.002         8.004      +0.0%
  this_cpu_add_return(u64)      8.335         8.004      -4.0%
  this_cpu_xchg(u64)            8.278         8.004      -3.3%
  this_cpu_cmpxchg(u64)        18.713        16.133     -13.8%

With the same configuration, vmlinux .text decreased from 14,369,618 to
14,212,882 bytes (-156,736 bytes, -1.09%). percpu_counter_add_batch()
decreased from 330 to 228 bytes.

Changes since v9:

- Rework the this_cpu operations to remain preemptible using recoverable
  GPR critical sections, as suggested by David Laight and Jisheng Zhang.
- Put the cached per-CPU offset first, then split the exception/fixup
  infrastructure and operation classes into independently reviewable
  patches.
- Keep GPR-state save and restore in reusable assembly macros for NMI-like
  entry paths such as SBI SSE.
- Keep masked LR/SC cmpxchg operands XLEN-wide so RV64 high-byte and
  high-halfword comparisons are not affected by LR.W sign extension.
- Force both halves of the AMOCAS.Q new value into fixed registers so the
  implicit register pair remains valid when either half is zero.
- Use TYPEOF_UNQUAL() in wrappers and fully parenthesize this_cpu_write()
  values.

Changes since v8:

- Drop the PIO helper patch, which has already been merged.
- Rename the first patch and update its changelog as suggested by
  Davidlohr Bueso.
- Use value-returning AMOs instead of rd=x0 for CPU-local operations.
- Remove unnecessary memory clobbers from the new relaxed AMO and LR/SC
  code.
- Use .option arch,+zabha for the Zabha inline asm, matching the
  existing RISC-V cmpxchg implementation.
- Isolate arch_cmpxchg_relaxed() behind typed always-inline helpers to
  avoid macro variable capture while preserving atomic instrumentation.
- Make the cmpxchg128 fallback use the already resolved per-CPU pointer,
  avoiding the same macro variable capture.
- Copy the cached per-CPU offset from prev to next during context switch,
  as suggested by Thomas Gleixner.
- Initialize secondary idle tasks in the common startup path, covering
  parallel bringup and CPU hotplug, and remove the duplicate initialization
  from smp_callin(), as reported by Sashiko.
- Select HAVE_CMPXCHG_LOCAL in a separate patch.

Yunhui Cui (9):
  riscv: store percpu offset into thread_info
  riscv: add infrastructure for preemptible this_cpu operations
  riscv: implement preemptible this_cpu read and write operations
  riscv: implement preemptible this_cpu void RMW operations
  riscv: implement preemptible this_cpu add_return operations
  riscv: implement preemptible this_cpu xchg operations
  riscv: implement preemptible this_cpu cmpxchg operations
  riscv: implement preemptible this_cpu cmpxchg128
  riscv: select HAVE_CMPXCHG_LOCAL

 arch/riscv/Kconfig                   |   1 +
 arch/riscv/include/asm/asm.h         |  25 +-
 arch/riscv/include/asm/percpu.h      | 701 +++++++++++++++++++++++++++
 arch/riscv/include/asm/ptrace.h      |  15 +
 arch/riscv/include/asm/switch_to.h   |   9 +
 arch/riscv/include/asm/thread_info.h |   4 +-
 arch/riscv/kernel/Makefile           |   1 +
 arch/riscv/kernel/asm-offsets.c      |   4 +-
 arch/riscv/kernel/entry-common.c     |  32 ++
 arch/riscv/kernel/entry.S            |  10 +
 arch/riscv/kernel/smpboot.c          |  10 +-
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 12 files changed, 805 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h
 create mode 100644 arch/riscv/kernel/entry-common.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
