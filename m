Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58396C19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 23:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eIB6tRySSazj4r1aqgAq54uUtQC+4ptrg7A21pf+fwk=; b=L98H2Knt1HP/rY
	wM//i/PuYNhgOwh6EdmUxuPVe2YfAw8mmBbVP0nxQFMA+BNCRJeoWa2u8P33Hy4ktLciktcpxzxO+
	Y5sQZr8cqMco4AVvUs93KbZhXyjvv03De04HLKWB9za4nH48n7MGhkTIsixIHYpJaGht5jBf01+E6
	Z4F4tTqKMU2Fp0cTmO8jwXW6TQ3rB3MalN3pI2Dh7lkHImDYpqVJLb7/9Xm2qnBQjy8uWHvv8vAIQ
	2/i/g7IBqbglmaB/sLH/T3wWF7keUON9vGxiBrex8o4ivfQWcjxkggvpPDAu8o1qMTKOJtH0i969e
	M1LExk0FpNdb1v9+5dtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxjJ-00000009YNU-0NlM;
	Wed, 05 Mar 2025 23:00:45 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxjG-00000009YMH-0uTe
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 23:00:43 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so112170a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 15:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741215641; x=1741820441; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXOEYTInHDTSYq1AFClqzRbl+ZkEHDGXfjWhKaTrwBI=;
        b=Ll79wo33gjGo11A8yC82nPxUFaiLeUMCH14W8rBfseuUddIyHa7YTJ6nB94H0b0nxc
         Ou77t9hd1B9p4KZ9tIVns2X7EagzmZzX3MgksZZl6hzClEAlwR8HvW9zQ6aR0JEoaHqB
         1MKTEwKRq2FMDo13R2KlCVUY9lC9Jn++ndfpkpVMTHhnrErdejk5FyDJv4maqanu/5F8
         LvrX/FQm4x5OI5yYg4eLXsGRfDvfAN578ZiArgilrUZU/5vpssCqoi5zrprHHhKENh4k
         oRf3EAvKPE55xgB07IxkOIPuVH3GJyWRpAC+BgDczBj5h1PTBJc/HkOSZ+LOmA9P/ScL
         FjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215641; x=1741820441;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXOEYTInHDTSYq1AFClqzRbl+ZkEHDGXfjWhKaTrwBI=;
        b=ZyiHgau3U/tBaTuYfOKMbgKSvxZ3tbPqa09TQuiiT9mJPOHoZ6fz2XVUhxwn25aACG
         nKNc0Y7CoHj5TaZJEfoLPwZb+fLvoRDtFEXCSmQbrHPGub+pOpRj/T25x0DvY1kSpmbj
         79IiqF8GLbcr0Y9yA3PJ+wD8C4Nwt+VD7SA9CidPX3Py1EWzKWKDOuUjs0CPcINIO706
         uFML12apTn902P4WHhSYw/5FSrQWuFxQ6kwDuRtTv/YSKrTmQEOVqUjkLhydZXNrFkAs
         6AERX+2WYVTFfnxpcvbP8fRDoPJvPTUtyQF6TMQFc1QP+/sC7ImINkKKdGwCoI/3fozr
         Fr6A==
X-Gm-Message-State: AOJu0Yw44/Fr+BoL8LBob9qDU2Ppf3pOdiMM6FcHz96YVlsBuCleyfHh
	I2ZI2FkB9HjyjJ8p8GcDkPzk6EHuuRKsCh4oL10h88HwSN2IWorJP7/eyARv5WM=
X-Gm-Gg: ASbGncuHM7AijokwgYGQgTmH/QWW65mRwCmwZBQaSLmGqlSpiyCYUtMnbY6fe9PhPoh
	sSyEo3P6FMLT+peuhftIBdvcdppbPI95jl9Caj8aa6FlCnYuOYX//GHyh9SE8zRrihfUKGhoe5o
	yEdYDyQnLjIs5G9Uss2G08ypeZinXK8AgmcZA3maIPxQ9We796bT4qVyQBXZfTOGqLyRHdVtfzT
	sDEGMGMADmbdznO5qiee+0Qvq5h00Y3U3onCboPwKFtdjVUIPrSn7+4xocUPflpwV2jg6PT1cj/
	ZKqYYExayKqDgGJBBu4ROnbPOUfh3Bbnmjah5A1OqT2yDZ4WR/1TpwUMKfuF
X-Google-Smtp-Source: AGHT+IGC2nc8khTnmGuhu0Gds3SKj5WRJ4Lw9OkM+lUlr5dLYMfrx7W+qe5bbMu3V+b1JB/wwlZfuw==
X-Received: by 2002:a05:6a21:78a8:b0:1f3:48ef:8aa0 with SMTP id adf61e73a8af0-1f34944ed96mr9881349637.6.1741215641152;
        Wed, 05 Mar 2025 15:00:41 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dedd22esm10593413a12.63.2025.03.05.15.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 15:00:40 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH RESEND v4 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Date: Wed, 05 Mar 2025 15:00:24 -0800
Message-Id: <20250305-riscv_optimize_entry-v4-0-0d81bb45203f@rivosinc.com>
MIME-Version: 1.0
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2306; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=g0QrlFghj/wYi3pHrM1E4FGE1hrhwiJrmPHndROZfrM=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ69Mea/w8opI0a+Kna9vNuo8tW5fAtvxt4uYpv19N8
 504pyJgT0cpC4MYF4OsmCILz7UG5tY7+mVHRcsmwMxhZQIZwsDFKQATKQ9g+J81JzTmQg+vl6Dw
 6m9zz3m/LCjLuBUzMeizw23LdC2dBV2MDIsme6f4GU82P2Yu9ueXXMqj14vzqnwCntwxKK5c8Sp
 yIRcA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_150042_260569_56A17A1A 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

Similar to commit 221a164035fd ("entry: Move
syscall_enter_from_user_mode() to header file"), move
syscall_exit_to_user_mode() to the header file as well.

Testing was done with the byte-unixbench [1] syscall benchmark (which
calls getpid) and QEMU. On riscv I measured a 7.09246% improvement, on
x86 a 2.98843% improvement, on loongarch a 6.07954% improvement, and on
s390 a 11.1328% improvement.

Since this is on QEMU, I know these numbers are not perfect, but they
show a trend of general improvement across all architectures that use
the generic entry code.

[1] https://github.com/kdlucas/byte-unixbench

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v4:
- I had messed up warning for ct_state() on rebase, correct that issue
- Link to v3: https://lore.kernel.org/r/20250124-riscv_optimize_entry-v3-0-869f36b9e43b@rivosinc.com

Changes in v3:
- Fixup comment to properly reflect args (Alex)
- Fix prototypes for loongarch (Huacai)
- Link to v2: https://lore.kernel.org/r/20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com

Changes in v2:
- Fixup compilation issues for loongarch
- Fixup compilation issues with CONFIG_CONTEXT_TRACKING_USER
- Link to v1: https://lore.kernel.org/r/20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com

---
Charlie Jenkins (4):
      riscv: entry: Convert ret_from_fork() to C
      riscv: entry: Split ret_from_fork() into user and kernel
      LoongArch: entry: Migrate ret_from_fork() to C
      entry: Inline syscall_exit_to_user_mode()

 arch/loongarch/include/asm/asm-prototypes.h |  8 +++++
 arch/loongarch/kernel/entry.S               | 22 ++++++-------
 arch/loongarch/kernel/process.c             | 33 +++++++++++++++----
 arch/riscv/include/asm/asm-prototypes.h     |  2 ++
 arch/riscv/kernel/entry.S                   | 20 +++++++-----
 arch/riscv/kernel/process.c                 | 21 +++++++++++--
 include/linux/entry-common.h                | 43 +++++++++++++++++++++++--
 kernel/entry/common.c                       | 49 +----------------------------
 8 files changed, 119 insertions(+), 79 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20240402-riscv_optimize_entry-583843420325
-- 
Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
