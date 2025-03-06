Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97D7C282EC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 00:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l2PC2PePYQ8cMdBQktv2U1cviXnDSX8So1MTRBS+rtc=; b=llWzcJBu3Grife
	1w2ekjks2FEyl7loIpM9PI/JMSflxyxeWpKRljLdn7aVwQzGS/+5zFSDxx6zvhBPw8ZZx6qdt4v56
	+yHQhiJ0JV8zernxf0SBKhbH+yA/rtvmWnyZiiLTIC0IJKuyUbZrfrD1Cxa99WAevnUPySLYdhEuE
	uo5AkmUXZvao8B/MeZUUhNRInl2BC/mOIGlWc04zJHbKLmNW3wcj+S8Qpo8OHsVt3hH3f79sGLrEz
	x9+yYRdfKioYYKZdjChO6Qb5OFAnS44cVq8Q4cdQ7StjB+7m6hIO/mPdmSnsKJVL2BFwmIpKnpxg7
	KlBx5EinKOwWMSv3YR0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpzLM-00000009ifx-2SIH;
	Thu, 06 Mar 2025 00:44:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpzLK-00000009iev-12wH
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 00:44:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2234e4b079cso838425ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 16:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741221845; x=1741826645; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yl5pQMvwhs9KXlNz+24dCzwkEL5L1AwJPXBGp3tpzqo=;
        b=FpKBwlLfK8YS+5QDyUYVbSb8mlvRcUpOP0KBFIh9rQ/s/MKM2ZyTw8SW+KCboT5/bd
         vShJoYv7p4pv4rMyiRynom47zkBy0zTmWLPp2FfFTW2XKEwEt6Rhh7PI+0qHjN0RuW6c
         pO07CPzvfUaVB/kDdcIEAmSPhWfXDASFfz28sKo1Q5PMabuSgd0DRddGoo9OQoR8bOkm
         6kmqDa9gDQ7H/i5XB48+svFTfnaeVCNumalBfVzFXYQj2FAZSbfk9A1WTWog8AZWssgE
         M+YxCsWd5XcjIOokIz5j6gxEsaM7Q64AC218AoUW1o9KcX0rBgeSLsoNSow5n51PeJg+
         77yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741221845; x=1741826645;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yl5pQMvwhs9KXlNz+24dCzwkEL5L1AwJPXBGp3tpzqo=;
        b=VOBeyrrkGMR9BnuOc/QHHcOQs8UpvrXAa3X5EbCUD8Bay4E6mARiyaAAUUJaIwqj9/
         4HFWA/xDyiX2tUamHuIX0rCW369Qmiwrgqp6sl2AYxuvXO2blY5MF7xuwLJKovU8kG53
         A5pt/AQYdI2DCeZry5pDZbfYb0KRmtpRqU8J+gl7QoyhhmNGaLIeSBjKfH+Yj3mDxf6S
         QenzGx32pobNr1IajfbuQiMoBLRId2rS5wvFO+fJgCGCOii3SsTf2lea0w5JJ4cVu8Kr
         m5BXHVvVIvQRcmzqSqB1eVD4XiPCNRJSCU6GK+xf0QXaKvfq202aMiBwSUGJU+NcfxUt
         z65g==
X-Gm-Message-State: AOJu0YzUQmmoNTDsv0tqVCxDT/Xth7Fe2C99I2XQAkOqPs9TR7K8XRqu
	JJaXJAzcpkKWQ2eW1sNpOoTA6ql8DdEaeGhLpQnYLzGmPfNBADzCTXDWAt3+OA0=
X-Gm-Gg: ASbGncv8TaWFffPWRfBmAhi9DpvX9lk0o5sJa1ijuTStjvL0yh5KL/6DHzfXz76NQp7
	/eN/wa4qVhMnl3f8gKKdowsZvWlxAPcjJQYJiLdBqZbSTXXDLg/A5vrRPgkq7e3+t0sDkU33VTa
	yEZ0pqjiDVB5l62MlRkdGJwJ2Q/6iEd9QlinKfE1tKJhtfR9UOZj+UonsbRmNhoMJbPe+2u6Hov
	QNmH/Wout0Qa51kWf9okaFHjGKoLAMROL8ugZX7hH1yu5JH8YX1u3BLlvCI2X9wnMmPRRIX7IlR
	ZsZ9Db8Qb/Nblp5UnUpGnmmv1lxsezRa+F9EurVg1AvMsofKPFqIPY5wqURc
X-Google-Smtp-Source: AGHT+IHI2rP2Hyd2lOR7EMEDGvOEHYUYseZqcPAUg2IT9Fva6WUyScEehXV53qnCOoMF9yh/zzST8w==
X-Received: by 2002:a17:902:f710:b0:21f:2ded:76ea with SMTP id d9443c01a7336-223f1d6ccddmr92798435ad.36.1741221845509;
        Wed, 05 Mar 2025 16:44:05 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f7efsm347085ad.132.2025.03.05.16.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 16:44:04 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v5 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Date: Wed, 05 Mar 2025 16:43:43 -0800
Message-Id: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAL/vyGcC/3XNwW7CMAzG8VdBOS8odWya7LT3QBMaqTt8oEFJF
 cFQ331pTxWix/8n+eenypyEs/rcPVXiIlniUIM+dipcfoZf1tLVVmAADRrQSXIop3gb5Sp/fOJ
 hTA9Nzjq0CMYCqXp6S9zLfWGP37UvkseYHsuX0szrDJJpYAMsjTYamT0R+dB35itJiVmGsA/xq
 mazwNqxGw5Upw1AHj10ZNwbx64d3HBsddzB9/Zw9oz2/MbBtdNuOLg4LvRta6AL/sWZpukfmPs
 pi5MBAAA=
X-Change-ID: 20240402-riscv_optimize_entry-583843420325
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2610; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=/XPBPYPK+Ts2ontme00hSLTZRIeMbEhmEiIPzB22szs=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ92c6erj6L4quN/7dqcybGPVlekXdFbf23JKd89sNn
 093enajo5SFQYyLQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIlcfsTIcOXwk9z4c12MHic+
 SL44N4X38GztPo8bhyp5i4s+sRisWsrwP7XpyOZn0m+5BC8/XdKZ9zfBw/v5w+91ZyS1G972H52
 Rxw4A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_164406_491461_100F7906 
X-CRM114-Status: UNSURE (   9.58  )
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

The Intel bot also reported "kernel test robot noticed a 1.9%
improvement of stress-ng.seek.ops_per_sec" [2]

Since this is on QEMU, I know these numbers are not perfect, but they
show a trend of general improvement across all architectures that use
the generic entry code.

[1] https://github.com/kdlucas/byte-unixbench
[2] https://lore.kernel.org/linux-riscv/202502051555.85ae6844-lkp@intel.com/

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v5:
- Rebase on 6.14-rc5
- Link to v4: https://lore.kernel.org/r/20250127-riscv_optimize_entry-v4-0-868cf7702dc9@rivosinc.com

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
base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
change-id: 20240402-riscv_optimize_entry-583843420325
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
