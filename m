Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B109606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y1E+s+q0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=OtVUJijY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fLBlz/pJjhKbLeUlMNjbTtLtNm+iCSPZOxIkxbL66v8=; b=y1E+s+q00o7Jt/9GKZ9go81/2i
	dUbU1eD87GKDG/kaElXhfongOHB/iDDbKkXryCrTBZHlPGZaC2X/Ur243pC2Yk4yhu0jdUB/rKWLq
	C2as/LAgn6CBh20x/XvDNPoB3iXyf15AEICxYNZpKbjekpT9i5+rX5EABz0JeixOy4gnOKkCMXg78
	0yE3B0nIThYM44H6jAkOPicdBWftR8OKC/7jqxXzXGA+eEicbKl8b+sAGLysgHf9EGvtwV63krLKR
	Mz7zDtt0jNni4pxzkNEW6qr51y2L1RMO6yxkzja+2MBnX/OiOUqFgDvrnUYclevyiVhtOriEYHR+S
	Q+2XLvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTana-000000086xv-128n;
	Wed, 18 Nov 2026 08:13:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTanX-000000086xT-2ZRI
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 08:13:45 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso385293a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 00:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794989620; x=1795594420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nc6nwc4TT4bEx1YMsfrowaduwiJkniqcrnPDD8g2hKo=;
        b=OtVUJijYt17fqD6oo2acFwElO0kpFhDjggZ2iuQxIr613a+yY2+k/sNJJx9gN6t/4j
         TjD0ofwYy8tDj2E7/LR5WZlXf29HdB0OV1hN9qXjF+oxHZFO6aElWKADDOORgXHcXt4i
         Of8lw938Dqg8EfmEP3C8fijYEeqA/O5j4jQ05/5ZrM7lJS0rTIPLJHFCjgs+t7/9EdJ7
         0yx1pFjqRTgvAdX18DsTNn37TjP81sl1cg4+Lx5luj0l5XO+CjkipdJ2rqqfeOa2/naH
         J7bKZ77KSZUM3frchAjiJBcgYthAkCjDpg7L6vZTJ8vrZUG0xY5gA3gvTPitTFnvgzyf
         tsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989620; x=1795594420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nc6nwc4TT4bEx1YMsfrowaduwiJkniqcrnPDD8g2hKo=;
        b=Chsk7Y9Fu3ve91QSmvYLLcEgwr9e4qsJMz7foYQ9Zb5p+5P+rYqLC/CAi8k+ouVHq6
         tMfHCoFZpNnoqYknGI9Sbk9Xo2Lb4Ba7egs2FLbYN0Zr4eEKPkoSAsM//QdtsmLeRCwX
         QIMl90Wk4NejDS/wXSpPD/0UEEGOcpvq/laqXypSFiJsRzD8FvxYwe8e4O6uei5xfUy3
         bsJW5cyOimo5705nzKVzFwWCipVOpA6IVFCGcC7xUe8LOzU8tdw4aisQgAkYywMB4whT
         wR4zASdyYV4Jv6T96d1imLVqtfRm+FdyqiygJgCj28H7Qck+zGbV3C1UBrD3hXs8uPZy
         Fc8w==
X-Gm-Message-State: APuU4Z918Q+K0WR0Z/QJ9EM8uh2+TvQoq+mwsqTHp/AduUoml69SwOdT
	5KHq6ILUmvIJt2jno4193A4xthnb6x0Ra6FL71wEJA160hWvmXtGL+LamOiKv4AuExvBNUcu4J+
	6QVt1
X-Gm-Gg: AZFdTZdyHf8lE30+gwAvvSVpJtVy0CRebX+zTjwaHZiw5YFuSfx1ZZPMEUc22ibZ1zb
	vseYLsxYBxCop6HlDY4UuZAH0Va2k4+1VFx7WSPzAvzAOXyS4YKAHXMWjmCDG1MzgqC+xBg8xz9
	FNkfiZSqBoTp2Xmr0D2B6DhPdG+Lsh7F89aM8ue6dl175s9h97/TVnzQHrtrnjTCQP5Bg89y41h
	s8DWLH2zHhp/NQnhprRRG2vsAusMsS9x/2TpK4JIz9ZgP71z8sXXv/LaP0q4X9DF1g+f5QK6Jbu
	DDmAtPFshcFc3J3Wo1huqBtYUVkAyVPsZzrTesj+gxQlCWKG1qC5S13+DqmyTX2Q7Kt12TedBOy
	hUbA/ifjcoKwNrwz3bQMGf8Vl2tTEdnBHtHfv+ZdOlqaAOiUaSUbndlrHuYh9Et4UZah5Irnbcb
	Gx6LX3ApWDrzqfpu0Ci7/69OYhJhCLC6vos6XDVoYGzAS6mkQqlF9Q0FuVI2pRwDxQZn2cWfN6M
	7V/+hduuc5ojTUHIcp3RvK/QcPUOTtQBIeKVvoOAILa2oKHWE0wsIoiknBWJhVdo8pVzIcJfzq4
	FhI7nPqrLLy4vWe8acdjRg6KGA65lZjg/yuBFIu0dT30xP5vY6M7tPk8x7oMzWg+lSAvJQdtClc
	R2qf7hXI=
X-Received: by 2002:a17:90b:2642:b0:3b3:a982:6e0d with SMTP id 98e67ed59e1d1-3b3d07da366mr1810223a91.61.1794989619995;
        Wed, 18 Nov 2026 00:13:39 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3254680a91.14.2026.11.18.00.13.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 00:13:39 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andrew.jones@linux.dev,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	atish.patra@linux.dev,
	anup@brainfault.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	yuanzhu@bytedance.com,
	cuiyunhui@bytedance.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	will@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: [RFC PATCH v1 0/5] RISC-V: Add perf support for PDIS
Date: Wed, 18 Nov 2026 16:13:28 +0800
Message-ID: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_001343_661753_0F38AA29 
X-CRM114-Status: GOOD (  15.16  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This RFC exposes Precise Decoded Instruction Sampling (PDIS) as a
per-CPU perf event on RV64. It targets the Smpdis/Sspdis draft at
2de60e18118ce78e2da82ec33296345c94d8560c:

  https://github.com/riscv/riscv-performance-event-sampling/blob/2de60e18118ce78e2da82ec33296345c94d8560c/modules/ROOT/pages/spdis.adoc

The draft defines two destinations for sample records. With MEM=0,
hardware records samples in indirect supervisor control and status
registers (CSRs). With MEM=1, hardware writes records to the PDIS Memory
Buffer. This series implements the MEM=0 path and reads records from
the sample data CSRs.

PDIS selects instructions with its own counter and delivers records on
the local counter overflow interrupt shared with the SBI PMU. The
driver samples at a fixed period and reports the recorded PC. Each
event selects either host user mode or host supervisor mode. CSR
numbers and the state-enable bit are provisional. Probing requires a
matching CPU node and explicit boot opt-in.

Open questions
--------------

- The driver registers a dedicated perf PMU for per-CPU sampling. Is
  this a reasonable starting point for PDIS support in perf?

- The model cancels in-flight selections when software sets inhibit and
  clears spdisctl. What sequence guarantees that an old selection can no
  longer publish a record before Linux switches tasks or events?

- The CSR record lacks a privilege field. If user and supervisor
  sampling are enabled together, how should perf determine the mode of
  the sampled instruction? Would it make sense to include the mode in
  the record itself?

- The driver reports the recorded PC but rejects perf's precise_ip
  requests. What guarantees about instruction selection and the recorded
  PC would justify advertising a precise_ip level for PDIS?

- COUNT can reload several times before software reads it, while OF is
  a single sticky bit. What should read() on a PDIS perf event report
  when the driver can only estimate the number of matching instructions?

On firmware supporting SBI PMU snapshots, restarting ordinary counters
also requires the existing counter_idx_base fix posted by liutong:

  https://lore.kernel.org/r/20260823044337.517125-1-liutong@iscas.ac.cn/

The reference OpenSBI firmware uses the non-snapshot path.

Reproduction
------------

The matching experimental trees are:

  QEMU: https://github.com/bows7ring/qemu/tree/4ce5dec939149ccef78358d68ddc15df1fc0c55d
  OpenSBI: https://github.com/bows7ring/opensbi/tree/1cdbbd84f83d80fdc6d62ea3347a4417b388784c

Build generic OpenSBI with CONFIG_XPDIS_TEST=y and Linux with
CONFIG_RISCV_PDIS_CSR=y. Boot virt with the resulting fw_dynamic.bin,
Image and a guest initramfs containing perf and the workload.

Use these QEMU options:

  -machine virt -accel tcg -smp 2 -m 512M -icount shift=0,sleep=off
  -cpu rv64,smstateen=on,smcsrind=on,sscsrind=on,sscofpmf=on,smcdeleg=off,ssccfg=off,x-pdis-regs=on,x-pdis-sample=on

In the test DT, append sspdis to each CPU's riscv,isa-extensions and
set riscv,pdis-test-model = "csr-v1". Add riscv_pdis_test=1 to the
kernel command line. This setup uses provisional CSR encodings.

The test ran the following from a CPU 1-pinned init. The /workload
binary pins itself to CPU 0 and loops over a labelled load instruction
400,000 times (one load and one store per iteration).

  /perf record --no-inherit -m 8 -a -C 0 \
    -e 'riscv_pdis_test/select=1/u' -c 4099 \
    -o /tmp/pdis-u.data -- /workload
  /perf script -i /tmp/pdis-u.data -F ip,event

On the QEMU model, perf received the expected PDIS samples in both
user-mode and kernel-mode runs.

Zhanpeng Zhang (5):
  dt-bindings: riscv: Add Smpdis and Sspdis ISA extensions
  riscv: Detect Smpdis and Sspdis ISA extensions
  perf: riscv: Probe the experimental PDIS CSR layout on matching CPUs
  perf: riscv: Add PDIS event and counter callbacks
  perf: riscv: Deliver PDIS samples through the SBI PMU interrupt

 .../admin-guide/kernel-parameters.txt         |  10 +
 .../devicetree/bindings/riscv/extensions.yaml |  19 +
 MAINTAINERS                                   |   1 +
 arch/riscv/include/asm/hwcap.h                |   2 +
 arch/riscv/kernel/cpufeature.c                |   2 +
 drivers/perf/Kconfig                          |  13 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/riscv_pdis.c                     | 558 ++++++++++++++++++
 drivers/perf/riscv_pdis.h                     |  23 +
 drivers/perf/riscv_pmu_sbi.c                  |  43 +-
 10 files changed, 660 insertions(+), 12 deletions(-)
 create mode 100644 drivers/perf/riscv_pdis.c
 create mode 100644 drivers/perf/riscv_pdis.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
