Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531C2D5B175
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 16:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Anhrbrt0yFv9tbBPi5NGhlXKDkvTMwZDGdeqBGxLCWo=; b=1xnRt8x7s8ZOXo
	6vB09DCkRluIElL4DSZhzVf5z5k4Jdi6MD+UcqdqB+YapcfFYaMNDo0zek+29AMg5hBdQoPdiofXX
	stz9ECJt9wLjMhEtSy0WyRpbrKUcsxg7QjOolHdyg7WZzCr/IPASpv2HzVzRNPVvOCxR7WSidRjn/
	TjveGmUHKaPCCj8BlaQsXJclc09SGeDzLtxweZ0TFSvzsoZEtrNLiU9LyGLRYNxp0ROETc3aC2xa/
	aZoPwBN6uDtIkZePSBmXC4jksVI98aR0JIRpXg4jzWj+89iv/9l/BeIdZg3OKZYoMaain/xK+9qfR
	d0c4pavKtPQfLAhcmbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4d-00000002aEC-0OYX;
	Sun, 14 Dec 2025 16:35:55 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4V-00000002aD3-0IuO
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 16:35:48 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59578e38613so2745854e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 08:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765730144; x=1766334944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KW14eOIkaYwqJSzWMg8OOBiyNxtSIoZ6QzdhSZdq80k=;
        b=dQ7j8GW1aibjhTz/lo6k4WQ+M8A3ZKa5S9L0hhRhjLBaGNxH1Qx6qR9nuHhZI0aMoQ
         7rpEchoF0tQC3j/P9fAn4UfAj/PxfULhfhKuPYZFxTuWUtPY5xA0COQ6B34Ax5PgrdV1
         wGC5d0/qib2DJyUfTxUA0jDARMK18ao+mxAwRK3yOwSKvWnK6iXun1Bn4M/B5AvSB1hI
         pdRfXbUxG1/2CxxAatFbKFNwIBu6ZxdSShnZdb6ROjWjM5oN+Eed07Yz2HJmtzoo7dLU
         2LRpm10xijUNywTb03Oj8gbHDId8y904Aa65FJHTMGfURbF+K3c8H4THQvVRuerxM7Gk
         AAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765730144; x=1766334944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KW14eOIkaYwqJSzWMg8OOBiyNxtSIoZ6QzdhSZdq80k=;
        b=ql5kzkv6UZ6/jDGDM4TgY4EapJNDlZBlBfy2kqU8yz51VtgmFxKBxBxF/d/+Na26Ua
         qR35F+SghlIZIrF3f4xJrZ+amQEaxp7I0TCASCPh2rCOkKg2r+LjmiBdikdIiv1U+Q6e
         ZFtTeRgfuuiL4IIbEGd1JWxQ7j3TuJK+NYR6VC8DT51a2KbgTCQrpuTIa2NPZGUouRsn
         sK1N+W4K9CI166mjEzuXp9m+QozOoNGwrlv1LDbqcRlbpHcNLgv6F+VIiX8cXJd47wHb
         8/9ZM0wb42hWIyavsMuBRV/5bjVZFVKQY2qWlHoLWrPSo4LwN4TJegKb932Z/no2WBl6
         L0PQ==
X-Gm-Message-State: AOJu0YyYi/hiQahmaTVjUT9FByoXB9gk5n8ct+M9IHTj8Q0CVcn86OYU
	60zD7TeVSz/aqwisJaQPhg4OwGsrTWhkwcJfmgcQKYmU3WsWfbhHv4ITbYQ6dE4W
X-Gm-Gg: AY/fxX5kqI6sUTvmdQPXLokaZ3vigMC2O5rPWUoGfJrj6K53UTtVtkFHS9BQlwrtXy+
	0nR2J81OxhTfLzkIB02QOp4S6uzk1PYfVFgOsn8YKOJC6gw8aO7rbrTsTsnizCIEvwDtKI36/vE
	tkVJmEWhhFYCbo7NYRylK0SB8KFW3+DhUTTJA/HX5tj52N3NPkiRPn+r2qB7kuoax/wnhtrT8sI
	fQCw84FmggpfyxNkCjZXb7ysjfsiXDKCNB/5MBQZiNeuIkD/NWtCTlb9j7+k7sxt5P8BLyzq2aw
	RRItNbOmn/3MYztq5QWQypg9wh1Fde+u0U9lna3yc0iJJZveycEDqPLjj2kv5DmCnAZSfah3/Xm
	AaxsOvqRTQkA/8N7IDIvWcoIv/FZhaGPOHFf+EEOJhYoCgGR25354jbveoMTA7deOB/bVo+PdOe
	5mVQ==
X-Google-Smtp-Source: AGHT+IF0fXC+uv8d2AkqLZUwN0Kj5Ka9OMORJEEFQOxcLCnJNaAOH3tMwrpqZgf74HUK7PX9yUcEbA==
X-Received: by 2002:a05:6512:39ce:b0:595:7d40:df10 with SMTP id 2adb3069b0e04-598faa8effbmr2438191e87.40.1765730143778;
        Sun, 14 Dec 2025 08:35:43 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-598f7717b79sm3789618e87.60.2025.12.14.08.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 08:35:41 -0800 (PST)
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
	Guo Ren <guoren@kernel.org>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v5 0/9] riscv: vector: misc ptrace fixes for debug use-cases
Date: Sun, 14 Dec 2025 19:35:04 +0300
Message-ID: <20251214163537.1054292-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_083547_163832_11D9891F 
X-CRM114-Status: GOOD (  13.85  )
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
suite validate_v_ptrace is added to the tools/testing/selftests/riscv/vector
to verify some of the vector ptrace functionality and corner cases.

So far tested on the following platforms:
- test in QEMU rv32/rv64
- test on c908 (BananaPi CanMV K230D Zero)
- test on c906 (MangoPi MQ Pro)

Previous versions:
- v4: https://lore.kernel.org/linux-riscv/20251108194207.1257866-1-geomatsi@gmail.com/T/#u
- v3: https://lore.kernel.org/linux-riscv/20251025210655.43099-1-geomatsi@gmail.com/T/#u
- v2: https://lore.kernel.org/linux-riscv/20250821173957.563472-1-geomatsi@gmail.com/T/#u
- v1: https://lore.kernel.org/linux-riscv/20251007115840.2320557-1-geomatsi@gmail.com/T/#u

Changes in v5:
- add support and minimal set of tests for XTheadVector

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
  riscv: vector: init vector context with proper vlenb
  riscv: csr: define vtype register elements
  riscv: ptrace: validate input vector csr registers
  selftests: riscv: test ptrace vector interface
  selftests: riscv: verify initial vector state with ptrace
  selftests: riscv: verify syscalls discard vector context
  selftests: riscv: verify ptrace rejects invalid vector csr inputs
  selftests: riscv: verify ptrace accepts valid vector csr values

 arch/riscv/include/asm/csr.h                  |  17 +
 arch/riscv/kernel/ptrace.c                    |  98 +-
 arch/riscv/kernel/vector.c                    |  12 +-
 .../testing/selftests/riscv/vector/.gitignore |   2 +
 tools/testing/selftests/riscv/vector/Makefile |  10 +-
 .../selftests/riscv/vector/v_helpers.c        |  23 +
 .../selftests/riscv/vector/v_helpers.h        |   2 +
 .../riscv/vector/validate_v_ptrace.c          | 919 ++++++++++++++++++
 8 files changed, 1075 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/vector/validate_v_ptrace.c


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
