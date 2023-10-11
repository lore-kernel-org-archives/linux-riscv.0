Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E101CD6E74
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 13:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wiwB95TDP05NMuTLhJXyMQTe83K4i68KFWXCiFprNt8=; b=R6zy9ks6NBfTpy
	zX7CyBskLl4zyJY9YZIxvzsHZFwkSi9ApSJ+76B0FFkKK/KqlaCah0/xlbvh5sfPf7uZI7K0xxEUR
	YSPJfUD6HkF9RLTrMSUJpcEFhLJLGXyrdJ4e0ySE5yeiLhhnBzbImMsxoWj24BxHAr/Q30cbKyRup
	BLGBJsOOFls1EYoVQGN0iosauLj0U2qOgzNdG/R+WVQW/yWss2pmfALJdO2x4Veo82fvaxa6zfZSL
	uvzKLj/9ZgCQIUzMzAB3fqWxDaUXshADu0gmj6P1EewmegkhIHUnasqfUuFp2qLw5gqg/xtgtjj97
	WRJadxbY6OyA9x4AwpCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZhD-00G1y9-0u;
	Wed, 11 Oct 2023 13:56:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZhA-00G1vx-0p
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 13:56:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-405361bba99so63498825e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697032571; x=1697637371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iwEcUxdspe2CPJUng/ZwhFUAz9h4DsFmKuuU53zdYAE=;
        b=iFj/xP5GyCdJj+kt3Ed45+m4/oDK+k+0ij80QccL5kurZjsCVABvFfeeoKTMz8kmhy
         z6QCIxQnEScarPzsaNmTpetVTW9I7xpIcJlAe4aU2BEznxd64yMN7ZULPAKY0Zrancn/
         ASYPu1BYpNxLtlZJMHO801+qniIrZW8vsrTCZup0Yn+0w8Ts5LG46CQjNdEiyf1uEoul
         7wGTAjz2tFCIWEO1UU7gBbxqmoaTyHta0MqLWNBgY4Iy1e4Mq2qIrMeUv0oH6+i4bArB
         qn5uKODjWyupEBeet+RODYta0/jthStscU52KYQZbeCpMmqIJZJFR1Qz6LYAI1paAW1j
         OZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697032571; x=1697637371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwEcUxdspe2CPJUng/ZwhFUAz9h4DsFmKuuU53zdYAE=;
        b=UmWcWeuCYEkfRIzpnB2epF1HOBdcNazJAJEleiH+9R9kV6gpm022EIWBVkVi5maqRM
         za7dE8P+AqkbqHrNwyvrPP8dLvaMJNL9ZZSNmJZNOI+4Joqr28RW4Xot0rDLNdprl/4Q
         KFo3UGJukIjxCm1JMawvzcQN7VqqUqGzEZvf6CA7x1Cn8gMvMKJ0iNMtaBLU1sCIjRSj
         2vi2ijzTZ4hCnwwoYCgHBua7sAm77dA6Ca6884kLqlG2dJxmzZBtRAGCJl3aFapYSSqy
         gfzWAIOPMHphQEbJWhhzuXh/eP70HWQHehJaeUoCCWruR5OCd+e6zTJERP1lITaEbzB8
         SrWA==
X-Gm-Message-State: AOJu0Yx9Sj1428TyGkFDWQx6o99C6akfnPjr2c3o+huQzjcYic6uQiVq
	oqsqNJtoOJzspYCoi6uOWJTsgnLS1joVGqghYIU=
X-Google-Smtp-Source: AGHT+IEGoZNpQiQKY4K3VBh3CW6EkB2rCwdtx5NPMhGxfula8s0c6VlfHWACJacTiwmbl1JwllpC5g==
X-Received: by 2002:a05:600c:2a4e:b0:405:49aa:d578 with SMTP id x14-20020a05600c2a4e00b0040549aad578mr18903215wme.37.1697032571465;
        Wed, 11 Oct 2023 06:56:11 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y6-20020a1c4b06000000b00405588aa40asm16957382wma.24.2023.10.11.06.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 06:56:10 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v1 0/6] RISC-V: hwprobe: Introduce which-cpus
Date: Wed, 11 Oct 2023 15:56:11 +0200
Message-ID: <20231011135610.122850-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_065616_299218_8C44E0D8 
X-CRM114-Status: GOOD (  11.89  )
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

This series introduces a flag for the hwprobe syscall which
effectively reverses its behavior from getting the values of
keys for a set of cpus to getting the cpus for a set of key-value
pairs. The series was originally posted as an RFC[1] and based on
another series. v1 is now only based on a single patch pointed out
with the tag below.

Based-on: https://lore.kernel.org/all/20231010165101.14942-2-ajones@ventanamicro.com/

[1] https://lore.kernel.org/all/20230921125518.175428-7-ajones@ventanamicro.com/

Changes since the RFC:
 - Split hwprobe out of sys_riscv.c into its own file [Palmer]
 - Split the which-cpus functionality out of do_riscv_hwprobe() [Palmer]
 - Rename hwprobe_key_is_map to hwprobe_key_is_bitmask [Evan]
 - Move the homogeneous_cpus logic into the vDSO function [Evan]
 - Rework logic to not need to allocate any memory
 - Honor cpu affinity in the which-cpus selftests utility
 - Picked up some r-b's


Andrew Jones (6):
  RISC-V: hwprobe: Clarify cpus size parameter
  RISC-V: Move the hwprobe syscall to its own file
  RISC-V: hwprobe: Introduce which-cpus flag
  RISC-V: selftests: Statically link hwprobe test
  RISC-V: selftests: Convert hwprobe test to kselftest API
  RISC-V: selftests: Add which-cpus hwprobe test

 Documentation/riscv/hwprobe.rst               |  27 +-
 arch/riscv/include/asm/hwprobe.h              |  24 ++
 arch/riscv/include/uapi/asm/hwprobe.h         |   3 +
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/sys_hwprobe.c               | 361 ++++++++++++++++++
 arch/riscv/kernel/sys_riscv.c                 | 267 -------------
 arch/riscv/kernel/vdso/hwprobe.c              |  74 +++-
 .../testing/selftests/riscv/hwprobe/Makefile  |   7 +-
 .../testing/selftests/riscv/hwprobe/hwprobe.c |  64 +---
 .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 +
 .../selftests/riscv/hwprobe/which-cpus.c      | 154 ++++++++
 .../selftests/riscv/vector/vstate_prctl.c     |  10 +-
 12 files changed, 667 insertions(+), 340 deletions(-)
 create mode 100644 arch/riscv/kernel/sys_hwprobe.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h
 create mode 100644 tools/testing/selftests/riscv/hwprobe/which-cpus.c

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
