Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C92C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 11:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEVl0+Bt54kF7xCUgabHR92PpvL1yeZxC20xJLK0XBw=; b=ND0tAxGtMc3rgl
	dr70olLkqyWLpYV4Vw6ZqeQs2F2c/7L2kXPGmyD0UaTkW1Bsr1z/F1ogBLv3Q2m/vr6hWct/OYuyt
	bcRnY5eq5gNvjo70k7lJ+SoB3ZppKdWjPQQwVqY9HEhsO0CA26VV57jCwKn1rM6v2o8mWviwyrphG
	xNVBT52J/9b36tOjyAGKu8OybPpVk1M+YPgkYbiV4FDCwg53xqVoKW5mFbUYPZh8AG6PiFAh4RGBV
	w6koxJD5GcT+lsMukVkdsvIGruIirNtDb1klE0Gv2KCrz8K+4X2PbDaZhRtUY7l22I+iQ8aOkF1RW
	oycaJPlLm8ubCyqX5I3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7bDf-00E9O5-4i; Tue, 20 Dec 2022 11:55:39 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7b7z-00E4wG-Tx
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 11:49:49 +0000
Received: by mail-pl1-x629.google.com with SMTP id s7so12011472plk.5
        for <linux-riscv@lists.infradead.org>; Tue, 20 Dec 2022 03:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RmlljmkUiQ/N0sQ5qjktzv73g5YSuqYv8504U1/k3g=;
        b=Xy2zxuh5Fm2eybUV7G+NWIEyMSetQV0GP5I+NyPF01gYU9WWztZdxlIaCANUG0qU2l
         rEhTTOkyxI9jLlweO+bnbuEO16i3Ocq8P7diRvXim2ebgv9erLCynCEtpiP3yBTz0icE
         mqNcNYHYwq5lEnJBSYc6uIv0Cq5JulSqhWTbQwtiaVBp8zjl+Rh+ealX94XUj4gWyjGH
         EH41u8FWLlUWRcUfWV4Q8fnpE/S0cMZbepb4ZxmfYOD5AGdp4W55SgLdVPUK8iaD/Lle
         r2Vdgx17AO+lTO2hmgcvnHuDcV/ljsFpDRgN2PYJ4dlEDZQRHUpPPuAuHO3vQ2Ew0C+i
         ezUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RmlljmkUiQ/N0sQ5qjktzv73g5YSuqYv8504U1/k3g=;
        b=5Sh09XcQ+MRdEOXAyxRJM9YQG2BFb/Zn2v/YZz80lXJOYcaWbfRRTGbsdy7ypy3gsF
         mF61At0fZ58CdZSJtO51BPemu9gPAKJOVyNRaXay/Fh0X7Bj4JATVVkFRuWtEBh+o1rH
         K32dV3DspjyrMpYg+KMzRlaVM6z4rYsUK6+ojA3jB4rgeat55sO6l74OLuG1gorbQnqz
         Gl+Hk/G67j8R0+Su6/GRpUjeczkhLt2WhmaLzRgD0E1cj18mqbcTOtCxDL2FYGCTprLN
         migyIXIdqtRqaPETaLd54pZrcsZBsrF4ySUsfZ1L+T6xF1WhtyqcM60Ca41gGiC1TNcl
         FMNw==
X-Gm-Message-State: ANoB5pk5JkEO+l9CzV6iZmWMgkN2hKr53gmsgg3W82nf3WYd0+x8vsvh
	or+0hQB53c1c7EiUN18e5Rhcwf3ojRkvA+cXd2U6zEdjgxm1l41U4qnatAJeLngeuvHgabLrZKk
	W8+g8Ydb+CbmXomVapETPHDIS8u+el7ciBBYl8XEY6UNpjvIp9g49CDCfKx75InqIGide2oYZi4
	OaMQRE5WvT1mpwkUeAEA==
X-Google-Smtp-Source: AA0mqf5SdWxvKou4/XuPuB0PJJZkMFYMc3snPAaq9Ieo+FSbkc3Rc4iYsG0MyssXFRNI/PELt7jbKQ==
X-Received: by 2002:a17:902:ccd2:b0:185:441e:4cfc with SMTP id z18-20020a170902ccd200b00185441e4cfcmr50835882ple.44.1671536986647;
        Tue, 20 Dec 2022 03:49:46 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id l7-20020a170903244700b001894198d0ebsm9197930pls.24.2022.12.20.03.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 03:49:46 -0800 (PST)
From: Ruinland Tsai <ruinland.tsai@sifive.com>
To: linux-riscv@lists.infradead.org
Cc: ruinland.tsai@sifive.com,
	greentime.hu@sifive.com,
	kito.cheng@sifive.com
Subject: [RFC PATCH 1/1] arch/riscv : Add support for Zba/Zbb/Zbc/Zbs ext in ISA realization
Date: Tue, 20 Dec 2022 12:02:36 +0000
Message-Id: <20221220120236.219804-2-ruinland.tsai@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221220120236.219804-1-ruinland.tsai@sifive.com>
References: <20221220120236.219804-1-ruinland.tsai@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_034948_015635_171B14AF 
X-CRM114-Status: UNSURE (   9.96  )
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

This commit adds the ratified RISC-V Bitmanip 1.0.0 extensions
into the hadrware capability realization procedure.

Thus, the print out of Zba/Zbb/Zbc/Zbs of /proc/cpuinfo could be
matching the information provided in DT.

Signed-off-by: Ruinland Tsai <ruinland.tsai@sifive.com>
---
 arch/riscv/Kconfig             | 24 ++++++++++++++++++++++++
 arch/riscv/Makefile            |  6 ++++++
 arch/riscv/include/asm/hwcap.h |  4 ++++
 arch/riscv/kernel/cpu.c        |  4 ++++
 arch/riscv/kernel/cpufeature.c |  4 ++++
 5 files changed, 42 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..4f64d02d5208 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -447,6 +447,30 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zihintpause)
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23600
 
+config TOOLCHAIN_HAS_ZBA
+	bool "Zba extension support for B extension on Address generation"
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
+
+config TOOLCHAIN_HAS_ZBB
+	bool "Zbb extension support for B extension on Basic bit-manipulation"
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
+
+config TOOLCHAIN_HAS_ZBC
+	bool "Zbc extension support for B extension on Carry-less multiplication"
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbc)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
+
+config TOOLCHAIN_HAS_ZBS
+	bool "Zbs extension support for B extension on single-bit instruction"
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbs)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbs)
+
 config FPU
 	bool "FPU support"
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index faf2c2177094..635fc2642a5e 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -61,6 +61,12 @@ riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
 # Check if the toolchain supports Zicbom extension
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICBOM) := $(riscv-march-y)_zicbom
 
+# Check if the toolchain supports ratified B extensions 
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZBA) := $(riscv-march-y)_zba
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZBB) := $(riscv-march-y)_zbb
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZBC) := $(riscv-march-y)_zbc
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZBS) := $(riscv-march-y)_zbs
+
 # Check if the toolchain supports Zihintpause extension
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 86328e3acb02..baa51a282a69 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -55,6 +55,10 @@ extern unsigned long elf_hwcap;
 enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
 	RISCV_ISA_EXT_SVPBMT,
+	RISCV_ISA_EXT_ZBA,
+	RISCV_ISA_EXT_ZBB,
+	RISCV_ISA_EXT_ZBC,
+	RISCV_ISA_EXT_ZBS,
 	RISCV_ISA_EXT_ZICBOM,
 	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_SSTC,
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 1b9a5a66e55a..70361105a612 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -166,6 +166,10 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
+	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
+	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 93e45560af30..ee536e08d197 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -224,6 +224,10 @@ void __init riscv_fill_hwcap(void)
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
+				SET_ISA_EXT_MAP("zba", RISCV_ISA_EXT_ZBA);
+				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
+				SET_ISA_EXT_MAP("zbc", RISCV_ISA_EXT_ZBC);
+				SET_ISA_EXT_MAP("zbs", RISCV_ISA_EXT_ZBS);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
