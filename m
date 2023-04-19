Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F82DC7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 12:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twgevVnO4qNMtqTHL9LcywBiZrlUcrPmTAuDBcJK6mI=; b=ihwJBSMO1zGv2G
	VrIRVXzgB5ZKlHyXuzHBmSI9Ggu0NcDoPMv+2YR0Bj7p0m2s50kKtQe638qFur+eWM9ZjeMnl1h9E
	8I+7QYtKFhMeUbpLfumbR11ODDzw6Ursx1lMgTeRo4HbO504xE+yzN8kBW5JjIYwH3qM95e7RHvsH
	t6FZVFDGnqx+YlT1MDSuAL/2NpKhjX+WAXxJXnvI0jxjaLRTLG/50RreGGibXPT4VxRa8VLmzxvTJ
	gD5uHJkYezku1OAB1Vran7K39eFRWtP8Fj7NIYNhHJZod5xUImbdzYBigSUJ5CN6JNz+kC7g/vJZR
	iyBGlGO3A3V0M0lejpNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6ip-005JG9-0J;
	Wed, 19 Apr 2023 12:15:39 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hs-00585b-0i
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:37 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-63d4595d60fso6108567b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902635; x=1684494635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMTmZYX45TS17GLlk7oZqME3pRStBNddDLQwkiv9SHY=;
        b=46+5TNw+d2+58D3lEwkZD1Q8Gjos23n16w76kwCbjIECo1omLOWdsqJ46O7WHdtCVf
         D6qRVkiwMOMRAxvlv69gS5768jAdvZ3q7SLH2mCNoo7pA6DoTBc59/I15a15pUslSRDK
         /sazIdZh4izVkCBDGPfmF4UdHbNV47UlD3fcXsGPM4eRj25LcXDU0OhV/GDD0igGJuqH
         ml6QdIY3yH15VCschcFTjCoiOk0b8wP3ZHQkAxu3r7qM6fXIOAtfEp8TawssQfzZ+3jQ
         Pz4fkHwI1vBeH+6KTWIqpWvkeSeuRVl81TzDA/3EEnLNJgOPMIAgi3B1w0h0VX43lGZj
         JPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902635; x=1684494635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMTmZYX45TS17GLlk7oZqME3pRStBNddDLQwkiv9SHY=;
        b=fhjma3hw5OUSh3+gF3BquDU3c/1ic8LvjQa2VMvajIBadmCPT8/nhK1xrPwm1sL6Ie
         w7fcDNlSsdSUSZ9/XG397yS22mccwN4ArYdjq5fUwe45awD7Mlg59k1RDBfbl4MBvHL+
         TkL8iVRTTG6RDfbN8/4ZpN6jObZ82rk8WYGQWZ/6BU6s2YKD44GtdOFxgC+CFMQJMGhR
         5wpKTO31iXeACqEbhqJmggTGJl5wyoW8y7Dd2/VFRCziR3D7adN+om8iMPAK2fSrbAgO
         2sqA+/dg0m05dxN4nAIKp+LGPBSifz9YkWr/jmK/r3EQwUBNvpZD+DU1OJXg5+8waR5r
         0XcA==
X-Gm-Message-State: AAQBX9ccsTPIOXcewFfV5bh3UO6dvqDuwkSMLvY4ce1058xGEGEf30Wn
	uhC4rk311ThlIWrRXzAPQulhAiGgQvOluYOOJCI=
X-Google-Smtp-Source: AKy350bNtcXmBs3y7eW4IdMHqOa9Oa7W5HHD92Z47TlERpw2rIKTANDR14gbiWN3KKUZ+zGReRRKzw==
X-Received: by 2002:a17:902:fb06:b0:1a2:89eb:3d1a with SMTP id le6-20020a170902fb0600b001a289eb3d1amr2109505plb.6.1681902635547;
        Wed, 19 Apr 2023 04:10:35 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:35 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	x86@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	James Morse <james.morse@arm.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 18/21] DO_NOT_MERGE soc: build Foobar SoC drivers
Date: Wed, 19 Apr 2023 04:11:08 -0700
Message-Id: <20230419111111.477118-19-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_041036_307319_DB9176AA 
X-CRM114-Status: GOOD (  15.37  )
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

Add Foobar SoC cache and memory controller drivers to the build.

The hypothetical Foobar SoC serves as an example of an SoC with
controllers that implement the RISC-V Capacity and Bandwidth QoS
Register Interface (CBQRI) specification.

Link: https://github.com/riscv-non-isa/riscv-cbqri/blob/main/riscv-cbqri.pdf
Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 drivers/soc/Kconfig         |  1 +
 drivers/soc/Makefile        |  1 +
 drivers/soc/foobar/Kconfig  | 21 +++++++++++++++++++++
 drivers/soc/foobar/Makefile |  4 ++++
 4 files changed, 27 insertions(+)
 create mode 100644 drivers/soc/foobar/Kconfig
 create mode 100644 drivers/soc/foobar/Makefile

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 4e176280113a..8578f8c607ff 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -8,6 +8,7 @@ source "drivers/soc/aspeed/Kconfig"
 source "drivers/soc/atmel/Kconfig"
 source "drivers/soc/bcm/Kconfig"
 source "drivers/soc/canaan/Kconfig"
+source "drivers/soc/foobar/Kconfig"
 source "drivers/soc/fsl/Kconfig"
 source "drivers/soc/fujitsu/Kconfig"
 source "drivers/soc/imx/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 3b0f9fb3b5c8..37a77c2dab94 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -11,6 +11,7 @@ obj-y				+= bcm/
 obj-$(CONFIG_SOC_CANAAN)	+= canaan/
 obj-$(CONFIG_ARCH_DOVE)		+= dove/
 obj-$(CONFIG_MACH_DOVE)		+= dove/
+obj-y				+= foobar/
 obj-y				+= fsl/
 obj-y				+= fujitsu/
 obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
diff --git a/drivers/soc/foobar/Kconfig b/drivers/soc/foobar/Kconfig
new file mode 100644
index 000000000000..4548e822357e
--- /dev/null
+++ b/drivers/soc/foobar/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config FOOBAR_CBQRI_CACHE
+	bool "Foobar cache controller for RISC-V CBQRI testing"
+	default y
+	help
+	  Support the cache controller in a hypothetical "Foobar" SoC that
+	  implements the RISC-V Capacity and Bandwidth QoS Register Interface
+	  (CBQRI) specification.
+
+	  If you do not care about testing RISC-V CBQRI, then choose 'N'.
+
+config FOOBAR_CBQRI_MEMORY
+	bool "Foobar memory controller for RISC-V CBQRI testing"
+	default y
+	help
+	  Support the memory controller in a hypothetical "Foobar" SoC that
+	  implements the RISC-V Capacity and Bandwidth QoS Register Interface
+	  (CBQRI) specification.
+
+	  If you do not care about testing RISC-V CBQRI, then choose 'N'.
diff --git a/drivers/soc/foobar/Makefile b/drivers/soc/foobar/Makefile
new file mode 100644
index 000000000000..e4f34058e39e
--- /dev/null
+++ b/drivers/soc/foobar/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_FOOBAR_CBQRI_CACHE)     += foobar_cbqri_cache.o
+obj-$(CONFIG_FOOBAR_CBQRI_MEMORY)     += foobar_cbqri_memory.o
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
