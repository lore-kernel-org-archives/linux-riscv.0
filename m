Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E48C001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WZeRDEk0cmPCflnVJqSECzAF0y2UbyT0fuWjd32zPUo=; b=V2PBlYH7hNTZKG
	gtq5hG0xzCpCgUj4yHle4ZcargdwY144Jfq3KFQURdUS9M+7h7rIhjgz6wldSeYO+87Du2HNo1fb8
	ZU7fxD4KExkm7LzKsHMsM69ka1Jjdl7cS7Xj4jMSewc5vGUb8yhvMHCqsIC0gtiQNlILn++UD60Vg
	lObOXJF9dZsa/qsRFeHo62PFdpvDC+UZF/30IBodI/wdhZ7XmV++dMgktoKMpHjQ44yFWdVcOXRzg
	cW4BSPMYZbvJ13ViqYIrz67Ft1VQy8vxz7J9M496Y44UVIuARhPXrZ4Zd88mz7EXSo1OMzsIpJ9Vf
	7LJPtCMH1ceo0rsCeJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpBv-002Jgv-1k;
	Fri, 20 Oct 2023 13:05:27 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpBr-002JeC-0K
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 13:05:25 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9a6190af24aso134064166b.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 06:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697807119; x=1698411919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tO6b85zrLI5vkTvBeIBZq2vAbzDSu0OLPtfh6UdtaHU=;
        b=WFUHl3TX+bptVt0uoUmZXvJ1sWmrKi3OdozHwyejoR+s3SV1AZtWMWXSPDuN9ZBc7s
         Chjz/NiQIKBRbnGzyZqL7qO55lPC8D4gU+D9cb7fKGSOu/7OLj8nl2+PwNEJexpohYre
         8+jtvnSp0r1T7Y1aHsNKughonIKD/Qiw1hL6L8dhiZm18QIXm7SupdT4FOo0WApDojDD
         j3U7RzrZbC0Gw4l2mXUPcnxqssHjMjjJ4HwwqJOgUbU6ZhoolVmk+zGb68ukGyjeVysy
         JkK4YBA6hq5Y8BBtOZP0oRa6cbsSRhlSG9duhQpkJ+uW22li1rdI8/n5WzPQpA5BopSd
         uFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697807119; x=1698411919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tO6b85zrLI5vkTvBeIBZq2vAbzDSu0OLPtfh6UdtaHU=;
        b=i6A240u4DuOW624r9lX5DHSbuegAqybMy/WSDnRinAdk42iM28XCroEwaIErk2Vy0a
         8YDt20AocIl0CwlnziYCA0fomtqsbunHzlk8Zmu6fUtECgr2PeZei/RClQU5EIEuaM+/
         UNsSs6DuJJU5oL0iY0anbGXE4ukFExsGQG3b3s8oFq4KamgCanRVNmZrE7H32cdOXuUn
         sqP9T7VNc6ftkgon6Z2uxDaomDqJpbwEoEnF0oHYhY5tJn6LvupwI8wj6ygPYz3X4lji
         GrgeuNe68fo8ok+iiFPvB3+EkMwP6tbq2rzOOOuThQjbfEEWkqF9smQpHFv9JunlO/n2
         snhQ==
X-Gm-Message-State: AOJu0YzwQbj311bhAJYqRMY4tE3/jxMM26TqnhJzFVRuieD1qopnt+Y/
	KsYZ38fKeg4wdyILAtbj0AP+RZrXeP4rai5IeTs=
X-Google-Smtp-Source: AGHT+IEuOH8W/60bvanh1ZPX8nDw64obMcq9jqEmfC9e10bwAFcBvJmdKE8xI8vXjk3oq2XRFT9fdw==
X-Received: by 2002:a17:906:fe04:b0:9c3:cd12:1925 with SMTP id wy4-20020a170906fe0400b009c3cd121925mr1279331ejb.58.1697807117869;
        Fri, 20 Oct 2023 06:05:17 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id dv24-20020a170906b81800b009a168ab6ee2sm1441882ejb.164.2023.10.20.06.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 06:05:16 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v2 0/6] RISC-V: hwprobe: Introduce which-cpus
Date: Fri, 20 Oct 2023 15:05:16 +0200
Message-ID: <20231020130515.424577-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_060523_151973_9D83C81F 
X-CRM114-Status: GOOD (  12.32  )
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
to getting the cpus for a set of key-value pairs. The series is based on
the patch pointed out with the tag below.

Based-on: https://lore.kernel.org/all/20231010165101.14942-2-ajones@ventanamicro.com/

Changes since v1[1]:
 - Dropped copyrights when splitting hwprobe out of sys_riscv.c [Conor]
 - Improved documentation [Evan]
 - Fixed a bug where the set of cpus could get changed to the set of all
   online cpus [Evan]
 - Added check for empty set of cpus in the vdso function [Evan, drew]
 - Replaced memset with a for-loop in the vdso function because we don't
   have memset there [drew]
 - Added an r-b from Conor

Changes since the RFC[2]:
 - Split hwprobe out of sys_riscv.c into its own file [Palmer]
 - Split the which-cpus functionality out of do_riscv_hwprobe() [Palmer]
 - Rename hwprobe_key_is_map to hwprobe_key_is_bitmask [Evan]
 - Move the homogeneous_cpus logic into the vDSO function [Evan]
 - Rework logic to not need to allocate any memory
 - Honor cpu affinity in the which-cpus selftests utility
 - Picked up some r-b's

[1] https://lore.kernel.org/all/20231011135610.122850-8-ajones@ventanamicro.com/
[2] https://lore.kernel.org/all/20230921125518.175428-7-ajones@ventanamicro.com/

Andrew Jones (6):
  RISC-V: hwprobe: Clarify cpus size parameter
  RISC-V: Move the hwprobe syscall to its own file
  RISC-V: hwprobe: Introduce which-cpus flag
  RISC-V: selftests: Statically link hwprobe test
  RISC-V: selftests: Convert hwprobe test to kselftest API
  RISC-V: selftests: Add which-cpus hwprobe test

 Documentation/riscv/hwprobe.rst               |  28 +-
 arch/riscv/include/asm/hwprobe.h              |  24 ++
 arch/riscv/include/uapi/asm/hwprobe.h         |   3 +
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/sys_hwprobe.c               | 357 ++++++++++++++++++
 arch/riscv/kernel/sys_riscv.c                 | 267 -------------
 arch/riscv/kernel/vdso/hwprobe.c              |  86 ++++-
 .../testing/selftests/riscv/hwprobe/Makefile  |   7 +-
 .../testing/selftests/riscv/hwprobe/hwprobe.c |  64 +---
 .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 +
 .../selftests/riscv/hwprobe/which-cpus.c      | 154 ++++++++
 .../selftests/riscv/vector/vstate_prctl.c     |  10 +-
 12 files changed, 676 insertions(+), 340 deletions(-)
 create mode 100644 arch/riscv/kernel/sys_hwprobe.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h
 create mode 100644 tools/testing/selftests/riscv/hwprobe/which-cpus.c

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
