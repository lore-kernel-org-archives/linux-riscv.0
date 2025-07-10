Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C729CC83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 14:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=grhi+S41+57TBE9i0APjqTdsHrWlzeRtJO0nTKqiUns=; b=VJENWbK/Ek6k0t
	xd8/BhDUkLvVX5QA6uH+JGvrWcBjHq9utL5H87WHRDYwwnsJc5qmGMPQnQhMJKAO+AKKLODBp6+LM
	Msx5P5XNg5tkICNd+Tqd6KkA3TdEizHt4vavLNzZhFYrjkENYPPX3tU18IcHjvpD9rDQdI+yEmHbK
	lS0f2CNXYFj16nfJgGnEclw2VZbowgymjLrIUBB7UTjRlfLFvoOL3xmzuLiJMb6RAB5Y+HcDkWJvd
	9Fgw2aBAv2rrbEy63d0LQf8tGxJgIwiTOXcbgCZLMIcu6b52BaU4aICm5HhFjgZfAjBQpkb7hqCAG
	095GW4+Liwox21+XTSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsVC-0000000C9df-37HU;
	Thu, 10 Jul 2025 14:43:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqlo-0000000BpwV-48xD
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 12:53:02 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-236377f00a1so9060865ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 05:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752151980; x=1752756780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9sSolDnOeL8Qn5bsbXBGk9GdJMqX3fYqqm7e5urFgg4=;
        b=T3xWjE8EqPt8hbvduLMVzHvbC4cgoCotgONknFqpXcpKhxb0V8bNT3qvoOlISg4pcj
         C0fR9kJLcrMXsdc6Cbl2jZe9E8H2Mnjt6ULwQ4NrQjkGT4leM776eIvLQCivRQEVoN7S
         z+FIPFtDBES+vyKpmigKJ/18xosD1rH9tJZ7p20xeJrQEZTX9vW2/pcitm0OAvNYXBhY
         V7U65hzP+jzQ7EGNna+iPem5gWWFu4nNmUA5XhnoT0AXNlWSb7THxTlh/UCVgBd6upp6
         KCR820w7PtKIKf5qBYfHMfjvP5FwRRcZbiIGLNk1EqLBrB1A/zafXJEHxYYgQ94nJSMs
         24uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752151980; x=1752756780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sSolDnOeL8Qn5bsbXBGk9GdJMqX3fYqqm7e5urFgg4=;
        b=H5M1E2FnhlnaGfJQ0EeIlZjKrlxbb0eh8BDcnPBGcolDK+9iEoeONq5dXh2AsFrJZH
         UUoNLtSqo86djFXUhjcs9H5qe/eCM0tUzFibWgCqLuNJclcBuLFyyYGOi/49R6TZX7m4
         PZZ/D9kUF7B61okj98VgAsc6HWfGTCl2rgpA3GRI/8k4J94F/yoG8SPaJaLo8uzuxCy8
         2t/UBXMKeSivHiDnoYRblvYb3rnzbPC/PY3twibsto9oDiaUI6FRx7Je+ITCBrmbznuf
         fdrlj6zRr5XPyHC7/lYGJ0g5fsXKUd800DQEC4i/V4Mlx4A42dGuGu/OUlN1KF5H3qdL
         lBng==
X-Forwarded-Encrypted: i=1; AJvYcCWJ0X+CtNuEjfC/wkEo+76E9icextdMoH68kgl7mqcdKV6rA+FOiaseBgfkFTAHo3DQeVDclasA7ooVMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpfIqkmqv4p42tVy9KR1AMPu109uSvP7eo7TQ6QjSIkay/FsLa
	5eRrhDp5phw9x+JdXoW8g2punQ4L0IlXwmU6ofzHk4mhe1cAhUBoAuWXpneOWeYoC7s=
X-Gm-Gg: ASbGncuS0WiLCGE2aTs0m7gK4NGNTRxRtfDM2McJnU4gB8d8jssG1e6W/BYDI5qo06K
	8uSjqjN2Z4XgbSLxDJY+CZWgBRstwumLCKGjGTL87K04rgq7RqQHRluxXjLZ+V2pGUcUSKvqCkF
	V544m8hgVgBxFloA+0mPXq10wejQ+6YMr0dE8qY93XeJ8vDCjSCj+R8kYZ8u2ObRwe+F9R5HrZP
	2ZBJmhc6iRsUthECe27vwbgrMcs5Z4j+AxnHOTWa43X81NLkUycGrdIU68p8PsXVvIp6NFq8Q8X
	GGyd9HgZ2hiGCoj+PD5okr5FWaH0kpKnMFzRLpbFhC+Flnh74a1b95FQEQiR6E+8B6ccce7mFJk
	wwIEqZfKLKDFbyCaAcFvjG+M=
X-Google-Smtp-Source: AGHT+IEztXrV4s36cuuPaBPR/uJ57CmW/fEKa2vBaNvpU5su8ofpXHgJ3aoe6UZWiAsKIoYYDMrzHw==
X-Received: by 2002:a17:903:1b04:b0:234:f19a:eead with SMTP id d9443c01a7336-23ddb343a4cmr102677405ad.43.1752151979813;
        Thu, 10 Jul 2025 05:52:59 -0700 (PDT)
Received: from ventana-bhyve.dc1.ventanamicro.com ([49.37.251.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4359c68sm19230715ad.213.2025.07.10.05.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 05:52:59 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH v1 0/2] riscv: Introduce support for hardware break/watchpoints
Date: Thu, 10 Jul 2025 18:22:29 +0530
Message-ID: <20250710125231.653967-1-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_055301_025875_2445C798 
X-CRM114-Status: UNSURE (   8.71  )
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

This patchset adds support of hardware breakpoints and watchpoints in RISC-V
architecture. The framework is built on top of perf subsystem and SBI debug
trigger extension.

Currently following features are not supported and are in works:
 - Ptrace support
 - Single stepping
 - Virtualization of debug triggers

The SBI debug trigger extension proposal can be found in Chapter-19 of SBI specification:
https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc8/riscv-sbi.pdf

The Sdtrig ISA is part of RISC-V debug specification which can be found at:
https://github.com/riscv/riscv-debug-spec

Himanshu Chauhan (2):
  riscv: Add SBI debug trigger extension and function ids
  riscv: Introduce support for hardware break/watchpoints

 arch/riscv/Kconfig                     |   1 +
 arch/riscv/include/asm/hw_breakpoint.h | 320 ++++++++++++
 arch/riscv/include/asm/kdebug.h        |   3 +-
 arch/riscv/include/asm/sbi.h           |  29 ++
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/hw_breakpoint.c      | 657 +++++++++++++++++++++++++
 arch/riscv/kernel/traps.c              |   6 +
 7 files changed, 1016 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
