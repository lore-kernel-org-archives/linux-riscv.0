Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EABBC5CFC1
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 07:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eCWA4sW3SIVR8nwAp+RLVrYaljSBBLQFdP63O6k5KBQ=; b=4eqTbZfAXQPleq
	Ug4YTm3EJqw7fMntLiSNEp1JcbGebvGw/22EepulBPKv+f51awDWpouRC2lLQqp76g0LXUVUR1Zzb
	ZpJT3ret0s1xFVPG46fLWr164cRR6RbL2GxVh2cMMvGtqZvBZj0AaKE0w7220awhFR53p0XmC68tu
	OC3PRw8CJrc9IkwjYvau++bSeZRE+l/IF1empcF4TbNe70DwqZSPfjt72U27bsoE78TN4jmj1FYVc
	4gLL1HuJqpBtYzYWiTKONwzIYhV7+nqP5Y0qTKdV+LAkuxnLTSEkQa+S3TnA4InW/tiSYd94uXsoo
	0+ZThKNWNFL56vhBMWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvru9-00000005ZVT-3CjR;
	Mon, 17 Aug 2026 07:37:09 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvru7-00000005ZUg-2fdo
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 07:37:09 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so2243496a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 00:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786952227; x=1787557027; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3gUmNuG/ckNSzubFHushPezZ5Bn5dYZ1USzLE1epwgs=;
        b=gke4iJ/0xfhhyK1IWrDM55n6Yb5ehkwCF0XWaYDDlF4gyvviRfgpZWXDbpglVXv2eS
         LpFBsPGxXRNbWYSDs8qZc7vOB8MqbZQUGCC0RHofAoMRsx8naijNiCM6NYVsq/cs2DMy
         FdFYj95aDw9knYtvTT7cI/p/j6cYXHA10ptSu8sKzw7R+zOR4BxfmYv/gKAUg2HZLnHu
         Baea7OPlC/0WunAxdxjqvE70CuHHGS3qFhMblLE/YTcivQUAhvxoh7a/OL9QsRH4a0Bo
         C5pXdjEKxd7amd44MOimlUqHWaFga0D+kkeRaOkcFduZH2TpLMhVMSenXVAkCwvtMExM
         khPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786952227; x=1787557027;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3gUmNuG/ckNSzubFHushPezZ5Bn5dYZ1USzLE1epwgs=;
        b=X1IL1qZH8VuQ6K0zqMb6o5g0NB300MNHJ8btGJSTXIPRa+UFtth0Po7t6Eu+YDSGDL
         4o3+FTZvjNI2Dj4aP2/M/sSXgKRmjCG82rnEfG2SclWCYw6tD06Us5vslCPMARSRlE3Z
         MX3pIZNqiDRlELJCXomnAJ/k2iIfYadFM27SxUBHTx/jK4Vr4diaWG2mfVL4Bu4wqZix
         TJ5aBYc9FGaAhXL4GLfZGwbEkaTuqZCp176iR++sd+ea5r+EPVyqQHRH/KefRVeBULbi
         QFoIUUJ4saPjc/YRWQiWgNCyCxM7Hb5t9kw8lRF8Ef+eI5kY+pxgkccBV0hnZyu4m9Va
         tCBg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6ns0WFCNAvL1bq78y5X+StxiQGRHmsrJg4j18pmIPVn1+uuYwy+8YKGrtdTfwQnwFv4EDaCJhwQD2tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQyuRbpGq7KTVMH8QGZ7qnwgfdDBRFcXzRS4L8CMaetvpJ5KTU
	oFoBpuQz89DHvF7wc02yaV7QapbNNh1voUHz1KhdJPaHaGZLxG+B2ykhxMNCPAEuAaU=
X-Gm-Gg: AR+sD13reYsy6s4cZt0WSScsr+Jrp+TkPgFHTEdQDjppRMMtooEEqyMZydW88x/ZbDt
	k4465UYB5vHc39p0k66tvqzKs4gKAlzZC2/ygtaUXL5NebiDhVHWgMIi/1pEIVa7PvTR3QPNK53
	ETFXanfMlVAUDVd3wvB6ull07u2UqjXcB6RAJP5dMF6lZs7YEY8nh392korfZvCa8MHzWFSUsgd
	SGJEX7ZqP4xigOwIY9ZvUP274ec1EfVxu86scF8CfCyvV9Jdr9BqzipHHsu92w7fgbBUGvMa8ZQ
	V5IEOeDT1m+5hvdLzbVhbSO68vFhfVy6rEh0Gvz4R/LDl2/sJEEvIfna2JsUtUlEg8OdcOXGR+x
	yrNtW6MZ54c85uaDkG9Q/l8e/z6OoydAwbyEobUihVJGnJyoAp5ONuysUhyMfJmW8KNpfL1dq0T
	FnZ/nocJ8W64uCqhseBde+kRSeFcR/h/0OY/eEcqfGbsbwO7p38VouMJn7CjjmR7wWkvHCmXZLK
	jRd6dpi
X-Received: by 2002:a05:6a20:3ca3:b0:3c3:b226:f165 with SMTP id adf61e73a8af0-3cc71fb5d5bmr28253699637.35.1786952226663;
        Mon, 17 Aug 2026 00:37:06 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267c3876c9sm3463040eec.24.2026.08.17.00.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 00:37:05 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 17 Aug 2026 00:37:04 -0700
Subject: [PATCH] RISC-V: errata: Add SiFive MAL-9092 workaround
MIME-Version: 1.0
Message-Id: <20260817-sifive-errata-v1-1-6a80f1a2743d@sifive.com>
X-B4-Tracking: v=1; b=H4sIAB+6gmoC/yXMMQ6DMAxA0asgz0QKpiDKVVAHkxowA0V2QJUQd
 2+g4xv+P8BYhQ3a7ADlXUw+S0KRZxAmWkZ28k4G9Fj7pqidySA7O1alSM4TVQ0+A2L5gNSsyoN
 871/3+tu2fuYQrwmc5w8q9r2NcQAAAA==
X-Change-ID: 20260816-sifive-errata-0aa5829c2234
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786952225; l=4858;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=AMbcDPquCxU8XUaVraEOetv/PywwFvcozMvx2gPNVfA=;
 b=bz96CmQxSqClNFJ9/HpAAy9oDX+Qnapd+uWGd8kT+anKrJCSXj4H9k+8OAdaA7ix4ZGFBAmYS
 J1iZ74aUMzkCvZ0Ix+jhkNKWsLhLP3caQPI7n5Zr5g9Oa2y9ZTZqCsE
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_003707_700710_4B193AF1 
X-CRM114-Status: GOOD (  12.62  )
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

SiFive cores with MAL-9092 require fence.rw instructions around
HLV/HLVX/HSV hypervisor instructions to ensure proper memory ordering
when accessing guest memory.

Note that HSTATUS.HU is cleared during KVM initialization, restricting
hypervisor instructions to HS-mode only. If future changes enable
HSTATUS.HU for U-mode access, additional errata considerations will be
needed.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/Kconfig.errata                    | 14 ++++++++++++++
 arch/riscv/errata/sifive/errata.c            | 20 ++++++++++++++++++++
 arch/riscv/include/asm/errata_list_vendors.h |  3 ++-
 arch/riscv/include/asm/insn-def.h            | 16 +++++++++++++---
 4 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 3c945d086c7d..a94e7da629d2 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -96,6 +96,20 @@ config ERRATA_STARFIVE_JH7100
 	  Say "Y" if you want to support the BeagleV Starlight and/or
 	  StarFive VisionFive V1 boards.
 
+config ERRATA_SIFIVE_MAL_9092
+	bool "Apply SiFive HLV/HLVX/HSV fence errata"
+	depends on ERRATA_SIFIVE && 64BIT
+	default y
+	help
+	  This will apply the SiFive MAL-9092 errata to add fence.rw
+	  instructions around all HLV/HLVX/HSV instructions.
+
+	  Note: HSTATUS.HU is cleared during KVM initialization. If future
+	  changes enable HSTATUS.HU to allow hypervisor instructions in
+	  U-mode, additional errata handling may be required.
+
+	  If you don't know what to do here, say "Y".
+
 config ERRATA_THEAD
 	bool "T-HEAD errata"
 	depends on RISCV_ALTERNATIVE
diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index df80c9614df1..1a5d223ebf35 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -51,6 +51,22 @@ static bool errata_cip_1200_check_func(unsigned long  arch_id, unsigned long imp
 	return true;
 }
 
+static bool errata_mal_9092_check_func(unsigned long  arch_id, unsigned long impid)
+{
+	/*
+	 * Affected cores:
+	 * Architecture ID: 0x8000000000000109
+	 * Implementation ID: 0x19251031, 0x19251217, 0x19260320
+	 */
+
+	if (arch_id != 0x8000000000000109)
+		return false;
+	if (impid != 0x19251031 && impid != 0x19251217 && impid != 0x19260320)
+		return false;
+
+	return true;
+}
+
 static struct errata_info_t errata_list[ERRATA_SIFIVE_NUMBER] = {
 	{
 		.name = "cip-453",
@@ -60,6 +76,10 @@ static struct errata_info_t errata_list[ERRATA_SIFIVE_NUMBER] = {
 		.name = "cip-1200",
 		.check_func = errata_cip_1200_check_func
 	},
+	{
+		.name = "mal-9092",
+		.check_func = errata_mal_9092_check_func
+	},
 };
 
 static u32 __init_or_module sifive_errata_probe(unsigned long archid,
diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
index ec7eba373437..c62a82f60468 100644
--- a/arch/riscv/include/asm/errata_list_vendors.h
+++ b/arch/riscv/include/asm/errata_list_vendors.h
@@ -11,7 +11,8 @@
 #ifdef CONFIG_ERRATA_SIFIVE
 #define	ERRATA_SIFIVE_CIP_453 0
 #define	ERRATA_SIFIVE_CIP_1200 1
-#define	ERRATA_SIFIVE_NUMBER 2
+#define	ERRATA_SIFIVE_MAL_9092 2
+#define	ERRATA_SIFIVE_NUMBER 3
 #endif
 
 #ifdef CONFIG_ERRATA_THEAD
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 7c6daf116756..8fcc848c196e 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -192,18 +192,28 @@
 	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(49),		\
 	       __RD(0), RS1(gaddr), RS2(vmid))
 
+#define ALT_SIFIVE_MAL_9092_FENCE					\
+ALTERNATIVE("nop", "fence rw, rw", SIFIVE_VENDOR_ID,			\
+	    ERRATA_SIFIVE_MAL_9092, CONFIG_ERRATA_SIFIVE_MAL_9092)
+
 #define HLVX_HU(dest, addr)					\
+	ALT_SIFIVE_MAL_9092_FENCE "\n"				\
 	INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(50),		\
-	       RD(dest), RS1(addr), __RS2(3))
+	       RD(dest), RS1(addr), __RS2(3)) "\n"		\
+	ALT_SIFIVE_MAL_9092_FENCE
 
 #define HLV_W(dest, addr)					\
+	ALT_SIFIVE_MAL_9092_FENCE "\n"				\
 	INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(52),		\
-	       RD(dest), RS1(addr), __RS2(0))
+	       RD(dest), RS1(addr), __RS2(0)) "\n"		\
+	ALT_SIFIVE_MAL_9092_FENCE
 
 #ifdef CONFIG_64BIT
 #define HLV_D(dest, addr)					\
+	ALT_SIFIVE_MAL_9092_FENCE "\n"				\
 	INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(54),		\
-	       RD(dest), RS1(addr), __RS2(0))
+	       RD(dest), RS1(addr), __RS2(0)) "\n"		\
+	ALT_SIFIVE_MAL_9092_FENCE
 #else
 #define HLV_D(dest, addr)					\
 	__ASM_STR(.error "hlv.d requires 64-bit support")

---
base-commit: 8da45c93dfa98f25b148512d92ecfa75d027a5cc
change-id: 20260816-sifive-errata-0aa5829c2234


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
