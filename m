Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA259C0218B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SqvXfrRAKkP2JytcMwrPyR33fFCysOu7j3pMsL+mZDg=; b=qLzXmJH3MX5Tm1
	qDBtKZ6qWUXCitKsQF/U6YJRT2kOIsZ8CDcKIHPhKTYqMIQgKwbLtMHmT7T6ESzLSCtpV5g7D2OSi
	VkzYdJgwRoxhlPSPgn5O5zbzrLbNiBAjAlC/XtKgdyKSfaDA2CszTGS+jy9X2cfMN9w55nUk69Id1
	tupAtwfgIbbuBiaSIWscFbdtWA0bTruAOYVREbPA4iV3UESbaijUX4gp53tgXRxQuyI1fyw9KjsOg
	XSdfP0MnU/7SFRlMIHhRE9pYu4zJeZyw8na/2gEEDpu+m9toKQEmH1y5G1YgJpU+ieAALGZN+q7+A
	w0OJvFGds/6E2y27a9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2fg-0000000D6cK-27Lh;
	Thu, 23 Jan 2025 19:15:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2fd-0000000D6ay-3ghK
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 19:15:20 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-216401de828so23106035ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 11:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737659717; x=1738264517; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xbFhHhTinc/thmLT0MtA207eqVgoMSXCZVa6DhPymsA=;
        b=ME42GwwOYdIpcUSRfiDRP37JWnM7gX95x83xMmV73lJLRy/s9ZGUrmTplJnVPQxUWw
         VjTux1qObnuQInxT0nU9DUrai+oGjJkOgYNBJFLi+X8pISjfTRiYafLHAjqmp6Zzwby1
         sTcUP8BjduD9v6dQPTkYWr3wCUUQTSBcZmup34bUZ+9Q+4vY1eTuFblXNItPBtRHBTUZ
         Yoiad47lfF85z/l9xrP0zpUsy1jLsms7V+Aj5OSf6YZdk+RgVT4ERnExGBKt+JvzdF6Q
         zlNAHm+h/hHNRsAsaMyF6eM7gEC4nogYpz28/B7vzah8eY7ii1R3FPbylYkLVt+o24gV
         pzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737659717; x=1738264517;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbFhHhTinc/thmLT0MtA207eqVgoMSXCZVa6DhPymsA=;
        b=EIXcfrgni4lCr43pLXpLM5lO8yPGfpVPiFBFc3lkoPlO0cmOf6ct3xAppuHFhseBfc
         MqqDL3V77LkQMS7Lo8p2GB6zpCKUddaNLB5C0h+f18pnWJCFWfqQfeEhKRZtNz8GaerM
         ssC/8P/WAQhemwTbZ8PJSDesEOkab3RgEV1ogn5nsQDH27Ergq+51+7xDWXio326K4Wq
         BO8XK0iyEIu3w3iRQAsyoZjhAfJ6qoxQeok0P99CWtFy+KvBgdgBetza6pf6WeWtefgx
         9X+6RjyxFNZdgi3EaPlIIkGd5pcrb++mxQ34uVUyCs4Fe1LZ5ccH756afUqQtKYknH1q
         Loyg==
X-Gm-Message-State: AOJu0YwDeR1mmcObAt9nLrC5YxYzSsMWWZ3Ci1NabcVWKL8HR03eP9ZQ
	RuAhbaXLlsFg785HinqCwA9PRcj8sEfGKdKjLaCagEXUAszA/xyKyAVCaDJC3yw=
X-Gm-Gg: ASbGncudONfYnQAPjkbq22gGt+5hyHZBKmZbTI204/xme/PDWQFKICq88JT4DlBtKYk
	3yUEnUum1NUEOcaR6e0tIrzap+5FNnxk5lwBtLnfRX6n6erlU2KyFtRMsDu6NuSu8QUx8Ge3Mly
	VuD+N3KUl8YTX4hL4JIkimrgqdO39GU1hVbrwxC9dbmVQmYDmdRG9kezXgUCDyzzoUdTQYO5w0c
	Itfm8OZzc1Aj5g4sO7z7kSFDzTM8aFpeUGDdbmGuTXY3Msaza8gWdke4wH6X1XenFQdjOR2ov9J
	DYUBQ+XSvi7nztJx+7iu
X-Google-Smtp-Source: AGHT+IHpzV+15pT9rC0dv425JvS+EQ7ijp2j9zmm/V4a6N6t16e1ARxMwg63ScRMethPfVN56ayBDw==
X-Received: by 2002:a17:902:eccf:b0:215:7cde:7fa3 with SMTP id d9443c01a7336-21c355301e2mr397914035ad.25.1737659716962;
        Thu, 23 Jan 2025 11:15:16 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3cb2sm2504645ad.90.2025.01.23.11.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:15:15 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Date: Thu, 23 Jan 2025 11:14:28 -0800
Message-Id: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABSVkmcC/3WNQQqDMBBFryJZN2UcE9Cueg8RKXGsszCRiYRa8
 e6N7rt8D/77u4okTFE9il0JJY4cfAa8FcpNL/8mzUNmhYAGDKAWji71YVl55i/15FfZtK2r2lQ
 GoUKr8nQRGvlzZdsu88RxDbJdL6k87Rm0UOKfYCo1aEPUWGsbNw7wFE4hsnd3F2bVHcfxA9Aq+
 Ji7AAAA
X-Change-ID: 20240402-riscv_optimize_entry-583843420325
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1931; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=07MvLhT2Wy7RrEKkDU/7g2rxiX30LJFHB9CllhdgXSA=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qkqdaz2SP2T34j8rlu2aSJZyu8VfoWbWAwlOEKlThfb
 pz69blFRykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABM5dZmRYQN7ftcXnRyDwp93
 f5bZ/I1e1yW9ZokJ/yozL/eAozln7BkZHn/4bX1k54E6kchzPancQftU3ngJ7bUJ9XI7LVv6M1i
 ODQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_111518_134454_1B3792D4 
X-CRM114-Status: UNSURE (   9.05  )
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
Changes in v2:
- Fixup compilation issues for loongarch
- Fixup compilation issues with CONFIG_CONTEXT_TRACKING_USER
- Link to v1: https://lore.kernel.org/r/20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com

---
Charlie Jenkins (4):
      riscv: entry: Convert ret_from_fork() to C
      riscv: entry: Split ret_from_fork() into user and kernel
      loongarch: entry: Migrate ret_from_fork() to C
      entry: Inline syscall_exit_to_user_mode()

 arch/loongarch/include/asm/asm-prototypes.h |  5 +++
 arch/loongarch/include/asm/switch_to.h      |  8 +++++
 arch/loongarch/kernel/entry.S               | 22 ++++++-------
 arch/loongarch/kernel/process.c             | 34 ++++++++++++++++----
 arch/riscv/include/asm/asm-prototypes.h     |  2 ++
 arch/riscv/kernel/entry.S                   | 20 +++++++-----
 arch/riscv/kernel/process.c                 | 21 +++++++++++--
 include/linux/entry-common.h                | 43 +++++++++++++++++++++++--
 kernel/entry/common.c                       | 49 +----------------------------
 9 files changed, 125 insertions(+), 79 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20240402-riscv_optimize_entry-583843420325
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
