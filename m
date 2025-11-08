Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3DDCCFA1A
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 19:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r+onI5A89ijTUr0nz+xCbGdxerlWDXQFrcMNkAYPjw8=; b=s1J6tYB5d7f++R
	PoqZDaJb8BDc4CaP28rEjHvbiZyMiPs+ZxjvzyZq8vNP/uW0MqZp1x3GHOuMHLkpHsiawRmrsMZUm
	nqju/uwbB+b0OPe45j6vXFm+G+utpfen2PgRoqYG2P5cd8UUF/cCCnSpcaPoQ+B8xSUOaZET/bDj8
	0uqxeOZEGIvtEoDV/joFou7Num98r7vZWooFvWhPy3PrO7K0HcBYRKK77A8rHCeaL5VoBOQUQV/L5
	b9oMsjskSNj1lQ6jKxuIXtUcD++Gy+lTyczGL6LphFWin4P/4EFKXg87kgUoYGYQG63zFaB6b39ql
	ZtKaFEAmE2pFnOM27jMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopH-00000003Opv-3O2A;
	Sat, 08 Nov 2025 19:42:19 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopF-00000003OpU-2clq
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 19:42:19 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-378d6fa5aebso15299071fa.2
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 11:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630935; x=1763235735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=13aFuuc1GQr46fPnxHYB7JQQ32jMQnvYNiL//B4303c=;
        b=PQ2V9EF3iL+v9K0bPxq6eMRmkGQo3D4w34v87dX+lVBYD0uFNgFhG2CazVt2yPsUrI
         E1jZyM85TkHJnSEVlgHmVKEhqSmBHwmRkztcL7rcTUKKhd9TS9UTVv+Niiq1U1NO8ngm
         oL9fPCe/m4meuAPWMpySJQbB8LdyB5WJ+8FW7tyrEYRf9ezhclmdRzE21z2JZEGnO2Yi
         8CuvbkTy9lfvDqFDc7bCUFluXkqBC+cgEitNtoMqRMXC2WoDFfyTGA8N6FB3Q+CSDY7n
         9zTaOiwDzw2uup1FKJ+sUBmNrQkFTJuDidfy+XVjRisnh3vwISD0F+a/Mi6FIwcvuKA2
         Xiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630935; x=1763235735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13aFuuc1GQr46fPnxHYB7JQQ32jMQnvYNiL//B4303c=;
        b=tzD2Crw0K4hKUVD2ULO6R4LBgiXj79cO3+z2Z6OSyrn8nN/d8BFsUuLRo6Tbs+wKbf
         iAEB/kLEoXJdJ3rjOcd54tKr5QGh7HWs3qz3B2MncuRloNjlV+hvhYk3RI+ZWuGDlB2c
         9gpOOUkbXoqMTfBTzPEbb33t85ZTqx0PqXm5LgU3qgG/8hGQF5CjP/liGu9lpPla5MWg
         EElWbSdSzeMNoLuewk/6xswN0q792pcN1jSfsBJtkWp+IobQLLfUgNg/qWL+jsPhtuLF
         J+6hh3AztKc70xW84bYSrRnk9dvwdSfVIufp4l5+bfz4daaPUYrf0k1rHMWYDft2GNpz
         MtkQ==
X-Gm-Message-State: AOJu0YyEtDZN+Z/NPRLn5G6qC3CvtmaJYG2HHvdaW14LybQF9GpQj+yx
	TlFBAVDsgwR9KSApSWRJmxLYgWvSt1ADevrpFjSz9JySXw1YfjMH+z6bOliQn1kv984=
X-Gm-Gg: ASbGncvs5h3cIFtiA0oSuUEY+yLFRoaC09m2T44KsQF0JRYqonCWjTvdbPcYmnD/eeo
	kCP3afzwGd/xl2eugZAO9lTeZdW5/0K1DdfJv4x+9EMgGmMRaemzFEkaei2HJMgJiuBrAKERQp8
	H3E8FhkLtvDWDPoMiAxzdR1jdQbfaZH0qSzwCNkrIjHsq05vx+SQ62jivpmrENV1zl7SnmosXIB
	xCTr3hnj4lY2B8ehdu7Z75K7uxklyXhw/JvdYEIhYfiCIc9lrCAWY6BgTn5Sl17zdlbph7Pe1v/
	y+vgkA4UhC4rbmrVfxJgW6Y2y5QEaKCEm3H4LI0HCIx/3qo0iNZ0tcfq8LWHkWjA/FsANxBbifG
	JhG3MQfKzg8pEerFGkCsEilL/saFfC3eYy3fYwMelm+DgvwQe2XshmoeXPquqqIwnGvLqy+CqF0
	GtEA==
X-Google-Smtp-Source: AGHT+IFnDCuSBk7jK+h8KqudoG4bWkSSmVwNgOJURKDwKCfuB23jHIyPUYE9uyHMOVa5uRsybmgG3Q==
X-Received: by 2002:a2e:b535:0:b0:37a:2f61:5f30 with SMTP id 38308e7fff4ca-37a7b30bad5mr6315371fa.35.1762630934396;
        Sat, 08 Nov 2025 11:42:14 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-37a5f0edac3sm22115421fa.38.2025.11.08.11.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:42:12 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Joel Granados <joel.granados@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v4 0/9] riscv: vector: misc ptrace fixes for debug use-cases
Date: Sat,  8 Nov 2025 22:41:39 +0300
Message-ID: <20251108194207.1257866-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_114217_686051_9151B927 
X-CRM114-Status: GOOD (  13.32  )
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

This patch series suggests fixes for several corner cases in the RISC-V
vector ptrace implementation:

- init vector context with proper vlenb, to avoid reading zero vlenb
  by an early attached debugger

- follow gdbserver expectations and return ENODATA instead of EINVAL
  if vector extension is supported but not yet activated for the
  traced process

- validate input vector csr registers in ptrace, to maintain an accurate
  view of the tracee's vector context across multiple halt/resume
  debug cycles

For detailed description see the appropriate commit messages. A new test
suite v_ptrace is added into the tools/testing/selftests/riscv/vector
to verify some of the vector ptrace functionality and corner cases.

Previous versions:
- v3: https://lore.kernel.org/linux-riscv/20251025210655.43099-1-geomatsi@gmail.com/T/#u
- v2: https://lore.kernel.org/linux-riscv/20250821173957.563472-1-geomatsi@gmail.com/T/#u
- v1: https://lore.kernel.org/linux-riscv/20251007115840.2320557-1-geomatsi@gmail.com/T/#u

Changes in v4:
The form 'vsetvli x0, x0, ...' can only be used if VLMAX remains
unchanged, see spec 6.2. This condition was not met by the initial
values in the selftests w.r.t. the initial zeroed context. QEMU accepted
such values, but actual hardware (c908, BananaPi CanMV Zero board) did
not, setting vill. So fix the selftests after testing on hardware:
- replace 'vsetvli x0, x0, ...' by 'vsetvli rd, x0, ...' 
- fixed instruction returns VLMAX, so use it in checks as well
- replace fixed vlenb == 16 in the syscall test

Changes in v3:
Address the review comments by Andy Chiu and rework the approach:
- drop forced vector context save entirely
- perform strict validation of vector csr regs in ptrace

Changes in v2:
- add thread_info flag to allow to force vector context save
- force vector context save after vector ptrace to ensure valid vector
  context in the next ptrace operations
- force vector context save on the first context switch after vector
  context init to get proper vlenb

---

Ilya Mamay (1):
  riscv: ptrace: return ENODATA for inactive vector extension

Sergey Matyukevich (8):
  selftests: riscv: test ptrace vector interface
  selftests: riscv: verify initial vector state with ptrace
  riscv: vector: init vector context with proper vlenb
  riscv: csr: define vtype registers elements
  riscv: ptrace: validate input vector csr registers
  selftests: riscv: verify ptrace rejects invalid vector csr inputs
  selftests: riscv: verify ptrace accepts valid vector csr values
  selftests: riscv: verify syscalls discard vector context

 arch/riscv/include/asm/csr.h                  |  11 +
 arch/riscv/kernel/ptrace.c                    |  72 +-
 arch/riscv/kernel/vector.c                    |  12 +-
 .../testing/selftests/riscv/vector/.gitignore |   1 +
 tools/testing/selftests/riscv/vector/Makefile |   5 +-
 .../testing/selftests/riscv/vector/v_ptrace.c | 754 ++++++++++++++++++
 6 files changed, 847 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/vector/v_ptrace.c


base-commit: e811c33b1f137be26a20444b79db8cbc1fca1c89
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
