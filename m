Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF48BC001DF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 12:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JUsYnrem60CLhEQXS4apiyd8IUyBuizgaanuUWQe7pg=; b=j/FL7EB8nMmC3t
	Q4UlDEQBtJlg+kK4IofJE5c/TRqVB5Pij9IS0js7PVyeDqSoQPqLsLbGEYqDbb9uDwWnwUkhVtmrA
	savJ1DA+C/gkpLs2VZB74tQgg4mSTkLJfhKPIzu981Nue4L2ks0P3Epv0/3BncOyA78QWY5BN5hRG
	ab1/GQ1V2xNABslgf0jA8gmLXG40WBuAMCmfeBhOHGGLh98Svu7HAmSm+ssG9/y64JQDZn10RW5zA
	eU6ewYuSdhYSSJmldBiSZoibX7/jd42P+eWVhs9TtQDNKoI2zXeTvOmRrI9aDoHmb9OBYxzF3xU3A
	H7KlWB2FwMHZ+wnIYZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvBv-003Brp-1T;
	Thu, 13 Jul 2023 12:13:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvBs-003Bo6-21
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 12:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689250381; x=1720786381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1RiFXp6VosblDMvQmJ9JkmMZVqvj4S+xVV3jhRMbmdU=;
  b=f5yF1a21D6q03wXUv+L6IcB92SFVGYSsshY1OU4eQAZUdntN5tvfNa0m
   BAYRWze020quItc2Tcmqa2QxzubkylSJXiMIzQPZ24H8SnTBR/b6CP7fK
   PIrSCe3jJ2cEmLCBqvFX833Ju3X8TWipf20kZYh+K6JvvllF4LQ6F578a
   bdukCQSwdiDZ2UqQOBhyjhfSTdJ5J1q4ULPKdRW8tAZc+noL9RYwlhv6m
   YRiJPyPuwYuwwEQmRC6qjK8ABhH/VCyNbd0YDGEYTaKu17AduFq0kua2u
   Su3H6Dig+dM3XFjtLheXDNtVp9gel+KBr/bdocfFFc+/woEn11EPjwpn8
   g==;
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="220194590"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2023 05:12:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 13 Jul 2023 05:12:44 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 13 Jul 2023 05:12:41 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v5 05/11] RISC-V: repurpose riscv_isa_ext array in riscv_fill_hwcap()
Date: Thu, 13 Jul 2023 13:11:03 +0100
Message-ID: <20230713-dastardly-affiliate-4cf819dccde2@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713-target-much-8ac624e90df8@wendy>
References: <20230713-target-much-8ac624e90df8@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4231; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=1RiFXp6VosblDMvQmJ9JkmMZVqvj4S+xVV3jhRMbmdU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnrX15TteXZvCs/fMr3ZVNemCf53e52N/EsyeUKOvZVwzHm /VaFjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzktRcjw5zed9uXTF43vcNLfdnr3T szPi2dzNrBJrFX6WG6inedURPDH46Wvf/1RdNb5e84prka5XbvtN32UsmKVYz1tfne3qvnmQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_051300_765847_DA2C0FCB 
X-CRM114-Status: GOOD (  14.92  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

In riscv_fill_hwcap() riscv_isa_ext array can be looped over, rather
than duplicating the list of extensions with individual
SET_ISA_EXT_MAP() usage. While at it, drop the statement-of-the-obvious
comments from the struct, rename uprop to something more suitable for
its new use & constify the members.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v5:
- Swap sizeof() - 1 for strlen() as pointed out by Evan

Changes in v2:
- Delete the now unused definition
---
 arch/riscv/include/asm/hwcap.h |  7 ++-----
 arch/riscv/kernel/cpu.c        |  5 +++--
 arch/riscv/kernel/cpufeature.c | 30 +++++++++---------------------
 3 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 7a57e6109aef..2460ac2fc7ed 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -55,7 +55,6 @@
 #define RISCV_ISA_EXT_ZIHPM		42
 
 #define RISCV_ISA_EXT_MAX		64
-#define RISCV_ISA_EXT_NAME_LEN_MAX	32
 
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
@@ -70,10 +69,8 @@
 unsigned long riscv_get_elf_hwcap(void);
 
 struct riscv_isa_ext_data {
-	/* Name of the extension displayed to userspace via /proc/cpuinfo */
-	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
-	/* The logical ISA extension ID */
-	unsigned int isa_ext_id;
+	const unsigned int id;
+	const char *name;
 };
 
 extern const struct riscv_isa_ext_data riscv_isa_ext[];
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index bf93293d51f3..aa17eeb0ec9a 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -168,9 +168,10 @@ static void print_isa_ext(struct seq_file *f)
 {
 	for (int i = 0; i < riscv_isa_ext_count; i++) {
 		const struct riscv_isa_ext_data *edata = &riscv_isa_ext[i];
-		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
+		if (!__riscv_isa_extension_available(NULL, edata->id))
 			continue;
-		seq_printf(f, "_%s", edata->uprop);
+
+		seq_printf(f, "_%s", edata->name);
 	}
 }
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index fb476153fffc..859e3831fac1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -99,11 +99,10 @@ static bool riscv_isa_extension_check(int id)
 	return true;
 }
 
-#define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
-	{							\
-		.uprop = #UPROP,				\
-		.isa_ext_id = EXTID,				\
-	}
+#define __RISCV_ISA_EXT_DATA(_name, _id) {	\
+	.name = #_name,				\
+	.id = _id,				\
+}
 
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
@@ -350,8 +349,8 @@ void __init riscv_fill_hwcap(void)
 
 #define SET_ISA_EXT_MAP(name, bit)							\
 			do {								\
-				if ((ext_end - ext == sizeof(name) - 1) &&		\
-				     !strncasecmp(ext, name, sizeof(name) - 1) &&	\
+				if ((ext_end - ext == strlen(name)) &&			\
+				     !strncasecmp(ext, name, strlen(name)) &&		\
 				     riscv_isa_extension_check(bit))			\
 					set_bit(bit, isainfo->isa);			\
 			} while (false)							\
@@ -366,20 +365,9 @@ void __init riscv_fill_hwcap(void)
 					set_bit(nr, isainfo->isa);
 				}
 			} else {
-				/* sorted alphabetically */
-				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
-				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
-				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
-				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
-				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
-				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
-				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
-				SET_ISA_EXT_MAP("zba", RISCV_ISA_EXT_ZBA);
-				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
-				SET_ISA_EXT_MAP("zbs", RISCV_ISA_EXT_ZBS);
-				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
-				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
-				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
+				for (int i = 0; i < riscv_isa_ext_count; i++)
+					SET_ISA_EXT_MAP(riscv_isa_ext[i].name,
+							riscv_isa_ext[i].id);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
