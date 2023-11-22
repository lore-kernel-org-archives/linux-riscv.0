Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE88C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QXT4lD4z9mc0AL3LHQbzSyQ8sr6xYndsLibzZOKquwk=; b=FJLaKwZOejy0qR
	IcreYsWao4weT9rTgeMmsRkp7GuxHQgADMGM9QjduECDwA3Cf0Kd0pV48rD7i8jQLVmi0rITENX0i
	7BMi8zhN2SqFSmsxq1roFcOeiA1GSHp3QY5A3v9mNiEvNaQB9W8iTn/JxqyFcOl+XmXbN54cMf3n+
	5OLs3E+T5CkkKH0niOX870MGHVO4/qwMeSdZ8KytuEG6hTahLxpm3mxAi5ZET6M5JTHMcWdfUm0t3
	Y2zwrtcFSKBhY4zaTSvIjZqjzjQ4e3OQDyoHHYabLEHUu4yev1yqWy3llqRHoFjY/489L4zmB3gWA
	Eb0/BkIn18vI9WjAfbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qNb-002YKy-3A;
	Wed, 22 Nov 2023 16:47:11 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qNZ-002YIF-14
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 16:47:10 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c8880fbb33so36240231fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 08:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700671621; x=1701276421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uamj0HgeZVp8fCloxGscB+b1Kq8JcRX4M1VNfAmy5Qo=;
        b=cC07UWVkCWq4pBgLDX22vb4/xOHR3jBBJpsZMkGLS5F6xe0fUvS/80nN65NbmDA2LK
         vM/T7XIBnyh7+ChOxzwKozdf6QpfX03mm3gr30qbstVCBPbrq8VFasXYMjqXIah+eKQE
         z0mc6iW+k4LH7KXbWlfclpXkl7HpZYYKvRT1Qhq4QtUq6c+x7RwQraLXvnJiKzxp1uEN
         5HkXeKWR0ehHNxvme17t51vMNbgYmzTSAMj9ajTuKx0NSVLcqgBak4PNUBixU4kPfKrb
         ns3W7RGduffjGn3728wVjlZ7qnXXGiXpZWikSUqGAwHwNtVN/A6Vn0LmO6Y95hVfELGl
         mIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700671621; x=1701276421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uamj0HgeZVp8fCloxGscB+b1Kq8JcRX4M1VNfAmy5Qo=;
        b=QaH+Rdi78uyxtFQcW2oUnBZpkwsJxh82hAIOLIyrlvm1Z1XaeZPCt9A1zjtuQNtMkj
         eBvsFL5ii669cqOZbu5IbshdZDSICYrLsfutUNO19oG+p2NV3k1nHOccBeMo1VqSOwlP
         ls2OioePYQist7nTYRtYQDAAf8spv+Oi3WXxWmzcFhEL2PubfLJMJSvW+6Z9nA/lG2Xw
         q45Zh2xg4v70TNKVBE/0Fh7caFxZGyKjr+lguFnMJfbLRoV7b5sHCKY94NYCkTkXOUo+
         QAP0eokWHryKBlixRsxrXmWF5NIxZxbBgtpyP3PILsl0pTjgBB98If4LeZTg13WPE6Cm
         jYwg==
X-Gm-Message-State: AOJu0YyzI2mnRnpNdJGUd2POrUC9+MxktNJLynar+phuGGpWQ7R3W02w
	ckJQ1askzRwOCIEf4h9mAW7foNg4r8wWqbnAIWw=
X-Google-Smtp-Source: AGHT+IHzk3v2Y8fqA7sbpIWgoGXh2/NYVtsuSwWg0OcZkdRopBBUYhhEjn9Y9raQk8jKQ8oRcHYZug==
X-Received: by 2002:a05:6512:3d21:b0:507:b17a:709e with SMTP id d33-20020a0565123d2100b00507b17a709emr2978881lfv.1.1700671621343;
        Wed, 22 Nov 2023 08:47:01 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id x26-20020a1709065ada00b009fd04a1a1dfsm4591272ejs.40.2023.11.22.08.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 08:47:00 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v3 0/4] RISC-V: hwprobe: Introduce which-cpus
Date: Wed, 22 Nov 2023 17:47:01 +0100
Message-ID: <20231122164700.127954-6-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_084709_371432_D5BBDF97 
X-CRM114-Status: GOOD (  13.13  )
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

This series introduces a flag for the hwprobe syscall which effectively
reverses its behavior from getting the values of keys for a set of cpus
to getting the cpus for a set of key-value pairs.

Change since v2[1]:
 - Rebased on v6.7-rc1 to get green on patchwork (dropped a couple
   patches that were merged with [2])
 - Added an r-b from Conor

Changes since v1[3]:
 - Dropped copyrights when splitting hwprobe out of sys_riscv.c [Conor]
 - Improved documentation [Evan]
 - Fixed a bug where the set of cpus could get changed to the set of all
   online cpus [Evan]
 - Added check for empty set of cpus in the vdso function [Evan, drew]
 - Replaced memset with a for-loop in the vdso function because we don't
   have memset there [drew]
 - Added an r-b from Conor

Changes since the RFC[4]:
 - Split hwprobe out of sys_riscv.c into its own file [Palmer]
 - Split the which-cpus functionality out of do_riscv_hwprobe() [Palmer]
 - Rename hwprobe_key_is_map to hwprobe_key_is_bitmask [Evan]
 - Move the homogeneous_cpus logic into the vDSO function [Evan]
 - Rework logic to not need to allocate any memory
 - Honor cpu affinity in the which-cpus selftests utility
 - Picked up some r-b's

[1] https://lore.kernel.org/all/20231020130515.424577-8-ajones@ventanamicro.com/
[2] https://lore.kernel.org/all/20230918131518.56803-8-ajones@ventanamicro.com/
[3] https://lore.kernel.org/all/20231011135610.122850-8-ajones@ventanamicro.com/
[4] https://lore.kernel.org/all/20230921125518.175428-7-ajones@ventanamicro.com/

Andrew Jones (4):
  RISC-V: hwprobe: Clarify cpus size parameter
  RISC-V: Move the hwprobe syscall to its own file
  RISC-V: hwprobe: Introduce which-cpus flag
  RISC-V: selftests: Add which-cpus hwprobe test

 Documentation/arch/riscv/hwprobe.rst          |  28 +-
 arch/riscv/include/asm/hwprobe.h              |  24 ++
 arch/riscv/include/uapi/asm/hwprobe.h         |   3 +
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/sys_hwprobe.c               | 375 ++++++++++++++++++
 arch/riscv/kernel/sys_riscv.c                 | 285 -------------
 arch/riscv/kernel/vdso/hwprobe.c              |  86 +++-
 .../testing/selftests/riscv/hwprobe/Makefile  |   5 +-
 .../testing/selftests/riscv/hwprobe/hwprobe.c |   2 +-
 .../testing/selftests/riscv/hwprobe/hwprobe.h |   2 +-
 .../selftests/riscv/hwprobe/which-cpus.c      | 154 +++++++
 .../selftests/riscv/vector/vstate_prctl.c     |  10 +-
 12 files changed, 660 insertions(+), 315 deletions(-)
 create mode 100644 arch/riscv/kernel/sys_hwprobe.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/which-cpus.c

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
