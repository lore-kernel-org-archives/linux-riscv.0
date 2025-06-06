Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55A9C5B555
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 13:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PQY17tAAioe3M/j7/VTcJYa0RXj9PHXyuBHIhkSnS38=; b=1wuLhk2IfUd4sU
	eAnRJVKiEX3AusSVEGazzof1zf8SNVEy+o2ceoIz5RL46LWS/pYuLIFSEFlaso7t+I2zofXj7aiLF
	49W+pu1ZcseMzizQzRI2OCrfyEdqhw4eaLwS60PybJ5f+id4pyKxLA9xslt96lrG2ah3WJVi6wrg2
	1dQVsdE8AHJMYxl8pCrgBesObPVOaQax4y9yy5GC2SpRsF2LTyqZxtQhu4eB0iIIjM3UKpaGhPByD
	biX8FN1gZNOVdlppQemTXqJewSjHeUZXoRbxj6AnGgKNFGdIAuQEhw250y5IaSQMna9ZSO5ylL5cY
	pYn/OBMyvbq4atY/JAFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXQV-00000000Mum-39q8;
	Fri, 06 Jun 2025 13:48:07 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXQS-00000000MuQ-2EGm
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 13:48:05 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so2220863b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jun 2025 06:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749217683; x=1749822483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xg6qWBW9452a89D15vuiBGGJUNV9bhzosnI+08qf8bo=;
        b=jkHvfN2bUeiiLaby4mnU6+6othRwJVmNOVOfNSHEA3EBfpiySQ6S4Ei7OdnecZL4c7
         3HN0/l+F+A6/gm53vr7r7KEW2HnZLO0P34ELEXOzap9gLwyUnkhEG73dJHXX1klCPMm3
         y6/jIB6W/PWWTfDVFReDU1A1/CHXbdqlFkJ9xK8UpCBU8M9/QG6NRhfS2jIXF3gIx5IB
         ki4jueQtq9yQBLni0E+aDQUs5Qd78iJU5lyTQdUywYU6guhJj61gPURagZ77hHyqDf3I
         Qxmfe2p93TSp7oKX6zasoysQgG33AYiZ3zXAiThUEFF6zzDE4ZhnWBWzGYlFXYLa7b1G
         A/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749217683; x=1749822483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xg6qWBW9452a89D15vuiBGGJUNV9bhzosnI+08qf8bo=;
        b=ZVkjAMMlC00wdbIT+OGIi73gsVuNzBMKedIWSAs78gI1NxnGOh7dvDsFbhnMAu+M6Q
         8IPgF+iH73YREf1Q86hAOGwQfvF7jiYXDp2ZFfuM3oleMDGu9xEh+mA5ddTSl2jL7NYM
         aqSWuLGpn70KQfZsAHO4zcguBFpCH3tN8aLy2mdeAXeiwXPFi2QYJYGKQjVP+FQ/FjaX
         8XPVri0lHNUs1hf6vgN88bHByb40YpvtEmYm1Z+vDRjUYfmqFXXPvQBbFaQ+poCV0+JL
         o2Sb2824u1ibbMlgWCELhx/HUPGbBMC9FW1iWMf9lQZLjiCJ8Xl2d0HfIDgDdVxiMrgQ
         D8hw==
X-Gm-Message-State: AOJu0YyoRi5t5qZjmeG/EAlFzTXX5KBbscxiQlKkdfBOJtt3p3RPW3GP
	QE0+FQvPYACVf3/QJ32SavP+aFU99hoUZTICUiuqFzO4f7lHY2ELgTz5
X-Gm-Gg: ASbGncupRAlVPSfVAVCFU5f/0VSfnwjiiZOsIqYh0GCFDFdYRhlUTAzuKvAvBpI8Cei
	QO3M7f11G6sVRnvvb6C4UWEqyPb/nJ7tHBLfdR+XyPg9yHfiFT8a/YXUU4jcqfuEY6QbW/LVsGw
	mEiO6L5qo1alfouRfyf/7T+B/05dlxKY8iamMgZGQPRiZGSTL9CKJ0jbbosvtWEaIe9zq2pzLf2
	QFjy14FTjQljHjxd5iifsNE+WHRWgHJADfgQE8t0yZM04lwZyCSVEFGr4gHJuAVj/jZg+d0yiOO
	fkY4ANAqzU1nQx7xC/waiLZNH5oy9CLidJgGKIPOkHWDhmOrLpKZCX91fTP2GKsYFbGJbROdCag
	w4YnkGA==
X-Google-Smtp-Source: AGHT+IGkvFTXTyoyFP5THpiFg7vz28z93vYZnhgXj37vty+QoUT/oX3Gk9XgnFYyH9xdaWnr72Cmkw==
X-Received: by 2002:a05:6a00:3cc8:b0:746:25d1:b711 with SMTP id d2e1a72fcca58-74827f159a3mr4536689b3a.17.1749217683105;
        Fri, 06 Jun 2025 06:48:03 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c1168sm1296798b3a.136.2025.06.06.06.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:48:02 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v3 0/3] Optimize GCD performance on RISC-V by selecting implementation at runtime
Date: Fri,  6 Jun 2025 21:47:55 +0800
Message-Id: <20250606134758.1308400-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_064804_570964_B19C781D 
X-CRM114-Status: GOOD (  13.16  )
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

The current implementation of gcd() selects between the binary GCD and
the odd-even GCD algorithm at compile time, depending on whether
CONFIG_CPU_NO_EFFICIENT_FFS is set. On platforms like RISC-V, however,
this compile-time decision can be misleading: even when the compiler
emits ctz instructions based on the assumption that they are efficient
(as is the case when CONFIG_RISCV_ISA_ZBB is enabled), the actual
hardware may lack support for the Zbb extension. In such cases, ffs()
falls back to a software implementation at runtime, making the binary
GCD algorithm significantly slower than the odd-even variant.

To address this, we introduce a static key to allow runtime selection
between the binary and odd-even GCD implementations. On RISC-V, the
kernel now checks for Zbb support during boot. If Zbb is unavailable,
the static key is disabled so that gcd() consistently uses the more
efficient odd-even algorithm in that scenario. Additionally, to further
reduce code size, we select CONFIG_CPU_NO_EFFICIENT_FFS automatically
when CONFIG_RISCV_ISA_ZBB is not enabled, avoiding compilation of the
unused binary GCD implementation entirely on systems where it would
never be executed.

This series ensures that the most efficient GCD algorithm is used in
practice and avoids compiling unnecessary code based on hardware
capabilities and kernel configuration.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

---
This series has been tested on QEMU to verify that the correct GCD
implementation is used both with and without Zbb support.

v2 -> v3:
- Drop if (!a || !b) check in binary_gcd()
- Move DECLARE_STATIC_KEY_TRUE(efficient_ffs_key) to gcd.h
v1 -> v2:
- Use a static key to select the GCD implementation at runtime.

v2: https://lore.kernel.org/lkml/20250524155519.1142570-1-visitorckw@gmail.com/
v1: https://lore.kernel.org/lkml/20250217013708.1932496-1-visitorckw@gmail.com/

Kuan-Wei Chiu (3):
  lib/math/gcd: Use static key to select implementation at runtime
  riscv: Optimize gcd() code size when CONFIG_RISCV_ISA_ZBB is disabled
  riscv: Optimize gcd() performance on RISC-V without Zbb extension

 arch/riscv/Kconfig        |  1 +
 arch/riscv/kernel/setup.c |  5 +++++
 include/linux/gcd.h       |  3 +++
 lib/math/gcd.c            | 27 +++++++++++++++------------
 4 files changed, 24 insertions(+), 12 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
