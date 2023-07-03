Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64A3C001E0
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mkpjxmwE7ID/LQvRQtbH3RynR3HKzQZw/pBZ+GvSm4=; b=2nEuXcIGJNecdG
	CCGFG7O130eBXGy4kfDZtALQ01df1i79CA7zEc5Y+EwUQ6R0DnI8BcfV+KJiRBm6ckZC4myP/koob
	CCxlckum3RMA1ygqEyEgsg1B2nPRZzK/AzeJcb2ROxQzKiCF/EItNJoWLniyhgtOgJjDf2XQr9Uxz
	VhDSZBfbZSGokiqWBADbrDJQ0iveoyiyoySNx6fIiVRejhFqE2aMmQ3mnEV97Fc5PYTQjuQMPq43W
	A0yCQw2hSFlxf8WR6J3fuGx60SQuz3755FzZzRlnP493SrQXnJYLk3MI7xsPBzwAgnP29ob8mTvTS
	KqrM/vbYQS322x8yb0lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGo4-00AEQX-1E;
	Mon, 03 Jul 2023 10:29:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGo1-00AEKA-0g
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 10:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688380157; x=1719916157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5gfCaYU0chLq5c3B/D2KhUCxcGWsZsApGGytqjShGTw=;
  b=1asWDMeEHb3ConekwoMpECOG/Ffqh6xe1E5yBXMBfuZzFaK2Ee1ZsQeW
   1BkbR0Be4ZDi74bRr7FU1z3iDk4Hu+U/c5D1W/wijLTV7ht4aYfL2xHNd
   D7yt+swXGw3/zUgrb8Yef7EGeTsHU2VxdvX6IJ7c89udO6JjhOXbE273y
   GUQO5f6Tls90J7shYOWC2LzzIYtqHk6akRwEDfhLLhzwQWRxSHEbcfx5Y
   LczQYjQ+ia89WkzChRxLIQQInNduiVeq9EZtEVg15knsfoLcmaNQRfivs
   TqR9zOzBmBdjwyHGtJFvV7MVQQFK3RxSOy2sdQVwNKyZb89MM9hcFtb+Z
   A==;
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="222963006"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jul 2023 03:29:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Jul 2023 03:29:12 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Jul 2023 03:29:09 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v3 05/11] RISC-V: repurpose riscv_isa_ext array in riscv_fill_hwcap()
Date: Mon, 3 Jul 2023 11:27:57 +0100
Message-ID: <20230703-esteemed-broadside-6309c1fbc65a@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
References: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=5gfCaYU0chLq5c3B/D2KhUCxcGWsZsApGGytqjShGTw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmLFq1+Ma3+8teMa5O+aT5IlRDX9H8ZkRa1dN3+/8FvlX4z vF72vaOUhUGMg0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQATkVFg+CvT3f9tpmuSoUy0ZmTwI+ NbCnv/XWv7Muf6Fwk3p1+2H/IYGbZIcnlzKlnrsk67d9C5MKHhvH3Mp6nLTh1fyXLyHVvRaXYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_032917_338020_8AC11ACF 
X-CRM114-Status: GOOD (  14.64  )
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
Changes in v2:
- Delete the now unused definition
---
 arch/riscv/include/asm/hwcap.h |  7 ++-----
 arch/riscv/kernel/cpu.c        |  5 +++--
 arch/riscv/kernel/cpufeature.c | 26 +++++++-------------------
 3 files changed, 12 insertions(+), 26 deletions(-)

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
index fb476153fffc..6d8cd45af723 100644
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
