Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61309C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 11:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lrVr+zwiAy0YHqNC7XqeQH9doEpTQ3DQGvy2SeRP/bM=; b=AJvISN7HLa8o4H
	S49GqPoNju1DyajF29zX2MhWXJBBmAogG2s2pNtrSdTPm9bdc6S8SZLwWFOGqKuZAoFCo9uS8dKHS
	Bmugh1osugr0mCSvzk916YcuCDlVH5sWtQXTzUuvp/SskUf+6xLL2lsZfQbrMszffW2FJJ9imyrSm
	Qeaec1jRgt/54NkK0yV8qfGJoEmtkewTbbMgkOw717e7SArCDx/VeMkYUaXtsgwk2dwgq5D8ZCqWU
	mz5uVSj+AYJEphJ0x22wxpbaHpIuWFaQszo4GfWjnUWXv+82zRJENCA1qzGL6W+ZQh1OOzaYPuawj
	meIfGbDuzm8sGPCH/X4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh8Rb-008kQ3-HS; Wed, 20 Apr 2022 11:24:23 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh8RY-008kPO-W2
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 11:24:22 +0000
Received: by mail-pl1-x635.google.com with SMTP id v12so1503761plv.4
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 04:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qOcKsvlhkYOH6DURGCa3GxXMgwg70eEyugu305Hx/i4=;
 b=huQStEUgrnTLqHQcUVA47DLBVrjhRp8/5ooQIcVS/8VOTw2v7UkspwQK1F5mHJtRn+
 sKTazcqIsPoEyQWgGsL4xjnBB4ggKKLQlVrFCGSSASgstQ8GxPdRXPIPSSYqM6X+BJD/
 CjMNlZJQ6oILFY8f8vYnge/n0FMUaKLjG8YvtsFan0ZB/1LmuExXj14da32mDyl6ftWf
 PuR9vCc39qC6/gaDqF+WNahOZAUUI2XepCDQSa+U0oFcraBdJt/17pbNfNY82qUnJZ2x
 hXDiN2P2lw684VdyX08UCSdFaox9esIBTZPyPqRH2niJiQan2u9omItP/YrlYSrEbKoG
 s9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qOcKsvlhkYOH6DURGCa3GxXMgwg70eEyugu305Hx/i4=;
 b=CBHFdYg9kNdRWa1X1+P4w+6+xm01dgpbbCgvQzLRSmNm66qHMu4IkXgA/CzzOo7f9Y
 5KMwqYtdR5/1q8dL0HJlULEtRrewSgE0Xqut8cw7CQvTn59DgUSScFr9sS7eJ7eczNJS
 yNPTaR5btiwKje31EZ1Dize0GCChjUUR1P4V/WwORWNC3NAliFDubMzQk3RTXKldx19t
 LAfxdEEunGnWVb56SnMlJrE0tKfiJz2I18+JhEVyZbEn/g+oftS8tcHSCDBBEiOHTgee
 eHhWoqoNKALH04E0GQ5/lwFOVaViHTS6QkoQyOT1L5cOO69zFzRy+CJczUKpSVeAGq9Z
 q8KA==
X-Gm-Message-State: AOAM5325tg7SWVCKhp1LLW53Gtbm9tmWJOSeirS4zamHGItP/dDBmymc
 WOqH7NgBCZ1VaRFT8gzju5t6EQ==
X-Google-Smtp-Source: ABdhPJzl3XTlnh4BpULoaWgL0FpnqMN+W7u1X3uwNeAxuOqev46qNnJVPCiu+w89eCRxGJ3fhrBbrw==
X-Received: by 2002:a17:902:f787:b0:152:157:eb7 with SMTP id
 q7-20020a170902f78700b0015201570eb7mr19337488pln.109.1650453858367; 
 Wed, 20 Apr 2022 04:24:18 -0700 (PDT)
Received: from localhost.localdomain ([122.167.88.101])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a17090a859100b001bc20ddcc67sm22273743pjn.34.2022.04.20.04.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 04:24:17 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3] RISC-V: Increase range and default value of NR_CPUS
Date: Wed, 20 Apr 2022 16:54:08 +0530
Message-Id: <20220420112408.155561-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_042421_069035_3801DEB1 
X-CRM114-Status: GOOD (  11.33  )
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

Currently, the range and default value of NR_CPUS is too restrictive
for high-end RISC-V systems with large number of HARTs. The latest
QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
restrictive for QEMU as well. Other major architectures (such as
ARM64, x86_64, MIPS, etc) have a much higher range and default
value of NR_CPUS.

This patch increases NR_CPUS range to 2-512 and default value to
XLEN (i.e. 32 for RV32 and 64 for RV64).

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
Changes since v2:
 - Rebased on Linux-5.18-rc3
 - Use a different range when SBI v0.1 is enabled
Changes since v1:
 - Updated NR_CPUS range to 2-512 which reflects maximum number of
   CPUs supported by QEMU virt machine.
---
 arch/riscv/Kconfig | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 00fd9c548f26..1823f281069f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -275,10 +275,13 @@ config SMP
 	  If you don't know what to do here, say N.
 
 config NR_CPUS
-	int "Maximum number of CPUs (2-32)"
-	range 2 32
+	int "Maximum number of CPUs (2-512)"
 	depends on SMP
-	default "8"
+	range 2 512 if !SBI_V01
+	range 2 32 if SBI_V01 && 32BIT
+	range 2 64 if SBI_V01 && 64BIT
+	default "32" if 32BIT
+	default "64" if 64BIT
 
 config HOTPLUG_CPU
 	bool "Support for hot-pluggable CPUs"
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
