Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF60CCA476
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XVGXhbDst+sKkPbCyTFTYxAsLs6LdPr32nIvxhVYIZ8=; b=EkKAgm6PTaua4b
	XxspP4CakBKoFFy+NuocanZDJa6Y88AATUsnJam3ctRvJ+BK4F1yVEvlES/TwrOMCZe1cbMozKZ8F
	PvYkfifHV8N+LW/I1kVZUOUWiIZGpZTR9pWFX+4OSyRkSD1dTxYTgLWbwebSjC340BEuIXYvPyHxH
	0ZHFlS4iP/gK4+SPzLcoaBgav8UtH1oKydglKr91aDi2f1PpvQYq49/lMdeohLnmGpFu3+qlHAtil
	XuRUXu/raYLFNTLctCuZAD5y32aZrzzzZq3M6utJBbq9UFGQmLp9hICs4QaqOP1Vth+qqvvOEgrat
	H6hoBIMDHkYupjSHbzww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66LB-00000001vzk-0HH8;
	Tue, 07 Oct 2025 11:58:49 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66L8-00000001vz9-340V
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 11:58:48 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-57b7c83cc78so5969423e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Oct 2025 04:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759838324; x=1760443124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1UHSTsWVgVFJryrJ3NLdWTjkzgi76W+AuTzj7De7nJs=;
        b=nIPivMKS/lfIlajBK7FmCh3z6SIwwgKoBKXQDK4pR6bEEBcN8HQKJufyC777iaVsuW
         TDr+E7uBzoc/NIkgDAOjRR4tu22NxSzbyrN1NAIDJSu+vmaq+cIBtjtZ7EXZM0rzvIQw
         P/q5v5JNXMiGbcFuiLkz6EGvdZHWBcEHosv6bpqKFSL2ZoCCya/d58ehcEJXHBUVzYva
         aRgNNtXudoOW0DsqnxWQzdLq9kXRzuz7ctHTnjG1wkDTO/ptnHbfsB7ajVON4x0hp/fd
         SEEImfGg1ln+RYbqRKSCuK+OwKxZfKlWH0ubM3HHvIvH9rSdqDmRXQc1lBgqv8XPgL1H
         QCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759838324; x=1760443124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UHSTsWVgVFJryrJ3NLdWTjkzgi76W+AuTzj7De7nJs=;
        b=LeO+NccAdnssFJlKVGnt8LgOO4+NMHZpwNHhGIZxEAFWz7GIEtrG82z4jvoY1obwvm
         Olkeq1V+zbD4RoY1thso54DZoUXrM1R2Ol9UBmk62bpS5RWHIJ2mTHW82jF4xntqf+G9
         27jUOBo8hoYs1rfjb7ovy0OWik4XGx7ckvcXBk/LrzhqAraDTiWkJ76bDxjZKUUFVu3A
         MwnSXp29qmJJGunnq59JA7/46774BFSytxqEzXIcEhU5hnnaHNEJfNPM2jH7nel0gguW
         qRHXptET7b36oYcVMJtUyGJ2xfXvhi3I+eUAFi3eqgc2P4j0Phc3267x88gp3gqgnuqy
         8I5A==
X-Gm-Message-State: AOJu0YyJxZaDLLTzZSA6kA6QpRr6X8J90uWmAQRwCmskNLrx/zMoqZR7
	A5PerDLri3+qtAbFcgOaVkntXgpzw1Qlvq9DvB+JTTVnXwgVP8SwdvZ+bVziMlHH
X-Gm-Gg: ASbGncuroMVzwPWGYNXfz+abEt8Fa6u18qSugTFcRllsLqp0p6ubUxQejgFZTA/bUv2
	xSfTa6XY6vUTb+dwCEvbjjrHiKWjb8L5DSxtQ010zGYtIthtrFc02OchiU/yl1gCOnpJG/B7OCl
	tKv9epTq+XGf756vh9ZD6mSqqSwseqngXNAg0hak0vir7QXL1G6oOdJuP26fU0Qdk63nqt4hVuN
	8dVjvpuOpnfDnJmY3PAU/rwtpK3y4XCXpD564pEh7WYowFGUGb3nUI38sUAxc6HzE82vBbN+avh
	cQTYz6YcGWwq6ML48frWLuhJgSKJF+ybaZE4aAtYCRrCw9NzE9NEg3P4CmHpf2y+vanc5WHr6vR
	RtwL8nYkSJa2YCU6tuAFXsdmA4tUam/scYxfEwQ==
X-Google-Smtp-Source: AGHT+IH7bnrkgnYWwbfbVsumwqkq4TDS5dWXB/mKRxP9HCltzhRMTTRuu0r7Qqnaw0RjDr3wioTn4A==
X-Received: by 2002:a05:6512:3987:b0:580:dda2:52f0 with SMTP id 2adb3069b0e04-5905e21c2a8mr974685e87.8.1759838323582;
        Tue, 07 Oct 2025 04:58:43 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-58b011a8941sm6043339e87.114.2025.10.07.04.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:58:42 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nam Cao <namcao@linutronix.de>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v2 0/6] riscv: vector: misc ptrace fixes for debug use-cases
Date: Tue,  7 Oct 2025 14:58:16 +0300
Message-ID: <20251007115840.2320557-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_045846_809138_BDCAE7E7 
X-CRM114-Status: GOOD (  12.44  )
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

- follow gdbserver expectations and return ENODATA instead of EINVAL if vector
  extension is supported but not yet activated for a traced process

- force vector context save on the next context switch after ptrace call that
  modified vector CSRs, to avoid reading stale values by the next ptrace calls

- force vector context save on the first context switch after vector context
  initialization, to avoid reading zero vlenb by an early attached debugger

For detailed description see the appropriate commit messages. A new test is
added into the tools/testing/selftests/riscv/vector to verify the fixes.
Each fix is accompanied by its own test case.

Initial version [1] of this series included only the last fix for zero vlenb.

[1] https://lore.kernel.org/linux-riscv/20250821173957.563472-1-geomatsi@gmail.com/T/#u


Ilya Mamay (1):
  riscv: ptrace: return ENODATA for inactive vector extension

Sergey Matyukevich (5):
  selftests: riscv: test ptrace vector interface
  selftests: riscv: set invalid vtype using ptrace
  riscv: vector: allow to force vector context save
  selftests: riscv: verify initial vector state with ptrace
  riscv: vector: initialize vlenb on the first context switch

 arch/riscv/include/asm/thread_info.h          |   2 +
 arch/riscv/include/asm/vector.h               |   3 +
 arch/riscv/kernel/process.c                   |   2 +
 arch/riscv/kernel/ptrace.c                    |  15 +-
 arch/riscv/kernel/vector.c                    |   4 +
 .../testing/selftests/riscv/vector/.gitignore |   1 +
 tools/testing/selftests/riscv/vector/Makefile |   5 +-
 .../testing/selftests/riscv/vector/v_ptrace.c | 302 ++++++++++++++++++
 8 files changed, 331 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/vector/v_ptrace.c


base-commit: c746c3b5169831d7fb032a1051d8b45592ae8d78
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
