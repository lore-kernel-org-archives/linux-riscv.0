Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE56E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 10:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2cj4xA2tXygTDczLk/soMsV6uLe9VesZ8tXEl/LEnIs=; b=SWjtnoKs9vX+WU
	9STYUPHGWc+dNERyActgMRai8Gqfr2cCUpKuikB77BZIAk39lSxpFRYEfikzqdKkC4YQYg6uY4Ctu
	QJRACeQKT11R2X1Duwi6y5ccbjXGO0VfwBe5ba5WpUsU2f/Fj91zQ8TyvHcAu4mizUNwbch1zjxjy
	1gMCYqP0rWJp5YR5tHIbuq8fMM6VPcqhTonwA06YVeYORssjBrfK5w1Wh48AYpsMcGHxHiLQsfCtc
	L8ElnxgExMfEAnLcnb6f1oqH8iZdP9WFN5WTPTZpoDBANRLoxZS17BT6zaHBBbL0MYn402nQDnECS
	Y1d4jkScXrmpFboMQGkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCIP-0000000ExoQ-2l52;
	Fri, 10 Jan 2025 10:31:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCAV-0000000EvjN-2RW7
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 10:23:08 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38a34e8410bso1047566f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 02:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736504586; x=1737109386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uptf3GXc/k/u9e7lbAQhZINoMQaRjvXtjGmMCYEc/JE=;
        b=LfqRcHj/0hlRhVDZdajTAtYwZTOwKryhSVoUQS9U652n9JKedI33A7iqeChX4zJPMZ
         zIy/g3z1TW/bXIv9tLCA++hlKHF/F2QAASwlEAdtISxl8pwUdLXRYrnYPkg+0sUAGSCq
         jSEhmT9ycLMl6MEikfGOgdLCgAkvPew8f0Gl3LK/MlPQTOF2jTiMWU7Mtvw3wCvKqBh2
         oZe0L2tUyKpWteROCSrkA2wLOK5OH3yyl226iXJaMMmzx7BOLKURu/R0NV1rWDA7vk0l
         6EvdOrhOwZ/hHCrBierDqwSKvh71akbQJ0mBelbNLQxzGtC9MS/yz4P8iNJRUYqBwQzw
         s1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736504586; x=1737109386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uptf3GXc/k/u9e7lbAQhZINoMQaRjvXtjGmMCYEc/JE=;
        b=MDhhqWCHP1wIwRx6Wo4u7EkjNKP8jPRT8fyTdZ9zHvk8TFpEV2rcYQ1wIRaAICXU1R
         m4zSnTNFt2p3A+G96vamFOxyQA8shPchfS/XFSfI6brSHg5KQINGiVIo6xOjXGKERk0P
         vnnWFlDj2HB7SMI1ge62svIPOgHKj+OgeIAAqvI6whd/LbazaMCfiXBKLSff+zUFtDsH
         MR1gJKGjRz7Rds4BqxACQhmvRHwXydcnXYayXzyk00zMsUCt1l0kJbeJ+vtdXky4uRaX
         Aes2jlgkNcNqihY16+NbpQFVk1H7JzMDkCcZXvSB4V2fOdUQhvd2jOIY7kL92Y/9R9aA
         Wb6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSTn+gxWvrcYtOB4ZYmC7g/C4uHguoGEFcjLcZ8ta5RNZwC6G1PZYWk1jvvhpQcFFgb2hmdWby4t3VlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXVAg9KI5+vcUFwQpaBZ8GKGJ9zWzdnHoW6YQaR1Yg5FTIH28+
	d4tKgjZLubC2XT3O+LHCCEx1FIfMi/QTwQ8Fgx5igmx3H7pTh//W
X-Gm-Gg: ASbGncvMn7PnjCbcfXzZDVqg075uuPo3ArE38Ecymfc4usnQA2PYSYad1omJPhTAhLA
	B+lje8BK8gny1GObqIWRsfEA+y+gV5E8JfMRlYC63sZ0RDC/BOhOJSevn37kYpQdb/8wtqUEMEl
	LOh7P9ZAUHqj+SOXogYzgaymD4etxH//5bytLakUj02+vEHrpJqTmo0ZZo1ftNzOXpQOeHiPGiT
	BdT+n1O71yFeev41eSbP5oOWjxiz3StK7d/aBBj2maIgoQMv2Ey4Qcd2WpZXc0fmpf2lOiGUpP/
	lR7XNsGDQp1ugOnle9iC
X-Google-Smtp-Source: AGHT+IEPudct7hjeXT2efX3Ffw4ABkF+MQ0uNBX6Rjj4y4YEv3Pr5n0gzGpy3z45iBW839P4MKeRNA==
X-Received: by 2002:a5d:588f:0:b0:385:f062:c2df with SMTP id ffacd0b85a97d-38a872d2b3cmr8354456f8f.11.1736504585889;
        Fri, 10 Jan 2025 02:23:05 -0800 (PST)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436dcc8ddddsm74859185e9.0.2025.01.10.02.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:23:04 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] Add OpenRISC restartable sequences support
Date: Fri, 10 Jan 2025 10:22:42 +0000
Message-ID: <20250110102248.3295944-1-shorne@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_022307_618224_917CD14D 
X-CRM114-Status: GOOD (  12.24  )
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

This series adds restartable sequences support to OpenRISC.  This came after
discussions with Michael on the libc-alpha list where he added some preliminary
rseq support [1].

The changes use mostly the riscv port as a template.

The patches were tested with selftests on qemu using my glibc branch containing
rseq patches [2].

Note the RSEQ_SIG instruction I chose is a `l.nop 0x35` which is just a nop,
which is different than most other architectures that use a `break` instruction.
As the signature does not need to actually be a break or trap instruction I
figured the nop is good for this.

[1] https://gcc.gnu.org/pipermail/libc-alpha/2025-January/163504.html
[2] https://github.com/stffrdhrn/or1k-glibc/commits/or1k-rseq/

Michael Jeanson (1):
  openrisc: Add HAVE_REGS_AND_STACK_ACCESS_API support

Stafford Horne (2):
  openrisc: Add support for restartable sequences
  rseq/selftests: Add support for OpenRISC

 arch/openrisc/Kconfig                         |   2 +
 arch/openrisc/include/asm/ptrace.h            |  73 +++-
 arch/openrisc/kernel/entry.S                  |   4 +
 arch/openrisc/kernel/ptrace.c                 |  96 ++++
 arch/openrisc/kernel/signal.c                 |   2 +
 tools/testing/selftests/rseq/param_test.c     |  24 +
 tools/testing/selftests/rseq/rseq-or1k-bits.h | 412 ++++++++++++++++++
 .../selftests/rseq/rseq-or1k-thread-pointer.h |  13 +
 tools/testing/selftests/rseq/rseq-or1k.h      | 181 ++++++++
 .../selftests/rseq/rseq-thread-pointer.h      |   2 +
 tools/testing/selftests/rseq/rseq.h           |   2 +
 11 files changed, 810 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/rseq/rseq-or1k-bits.h
 create mode 100644 tools/testing/selftests/rseq/rseq-or1k-thread-pointer.h
 create mode 100644 tools/testing/selftests/rseq/rseq-or1k.h

-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
