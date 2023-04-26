Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CA5C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Z5eoodjnSKJPRjH+m5rKeGhncL6kA4NVeZj8lnjxEU=; b=zzT5lhzf0/aeNu
	NSphSGuqYmCGA9ns1Pabva+mYpOfmX562NQDw1Vt+LDqL4l94eUf0gN7IRB249UROrGsSrSeZdTaV
	euMNyU2QdlWQYnz0xch7SM4oWxrylcl4QFV8JmlFmp2ESGnUgfs5f+BK9RfsCtJ2Dg1YpT7j2OuQa
	xEQ5hJ3Mtbzli5mW1mfkLKGHXfIUITQ7CfIAb2TRrbdOrDfzj+j4wNdzSXGK9bdX8EVI9D0DiboCy
	lVDB5XwGOolOjVs9J2kh7qe6CnHSCB7tSwNT7jZ5WNrF0uEzliKkQjr0B8w6HNyeeLRGTqOWohk79
	KyccGRHR79zDaHkEYukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcdR-003cYJ-0M;
	Wed, 26 Apr 2023 10:44:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prcdM-003cQk-2c
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 10:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682505864; x=1714041864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P7aomWah/OpA02/AqRra4XwMTh/phPJAkXHsrsHN6yA=;
  b=su1WIF8TDNLHU9V5jzRKy9NZEMrizBX99vDB1GT7aNM7HjYrvX/fT/fb
   DLjS8kWXJ7Dt1V80dtMybFHZrSSe9sli/YTocdpuL3dSYfTDozyGVeTas
   lpFmVhoMMIU3qwgFU5BvLSUJX1D/CY3B0x8Sr6a6nVLjPGYkZSkHP9z4+
   TmNXBXClljJrzmGAFASzxqyMQUNewaMwsXAjBm4adU4VOvnHcWx+r0w6P
   QWmllO5Oi+RDWAfXzGgpxV4pn+SoRfjcGPJNQEtumWXnaxWpbf4klByeQ
   c7Vkd9snTyzZ7RG4ZvIo73KgeEyHKD+9TgF1icLwxG0uYICqlwAbWD/Fj
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,227,1677567600"; 
   d="scan'208";a="212354511"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Apr 2023 03:44:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 26 Apr 2023 03:44:09 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 26 Apr 2023 03:44:07 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Wende Tan <twd2.me@gmail.com>, Soha Jin
	<soha@lohu.info>, Hongren Zheng <i@zenithal.me>, Yangyu Chen
	<cyy@cyyself.name>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v1 1/2] RISC-V: skip parsing multi-letter extensions starting with caps
Date: Wed, 26 Apr 2023 11:43:24 +0100
Message-ID: <20230426-devalue-enlarging-afb4fa1bb247@wendy>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426-satin-avenging-086d4e79a8dd@wendy>
References: <20230426-satin-avenging-086d4e79a8dd@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=P7aomWah/OpA02/AqRra4XwMTh/phPJAkXHsrsHN6yA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmeDJ5JMyw9lrx/cCJ8ldBs2bs1V7t1Hoe5+6v63CrbZdko smZDRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbymZ2R4eOr8mkzeZ9HL1dPN47Z21 c+O3XFIdu3uoc5XHd/0V+WvY7hf91R25uqltu5ryz3u76K/b90ePGJvsvMufY5YTcjeduceAE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_034424_912621_44CD1C6F 
X-CRM114-Status: GOOD (  12.68  )
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

Yangyu Chen reported that if an multi-letter extension begins with a
capital letter the parser will treat the remainder of that multi-letter
extension as single-letter extensions.

Certain versions of rocket-chip will export devicetree containing
rv64ima_Zifencei, which is parsed by the kernel as rv64imafc.

While capital letters in riscv,isa are invalid and the validation of
devicetree's isn't the kernel's job, we should behave more gracefully
here. Rather than abort parsing on meeting a capital letter, mark the
extension as an error & allow the parser to skip ahead to the next
extension.

Reported-by: Yangyu Chen <cyy@cyyself.name>
Link: https://lore.kernel.org/all/tencent_1647475C9618C390BEC601BE2CC1206D0C07@qq.com/
Fixes: 2a31c54be097 ("RISC-V: Minimal parser for "riscv, isa" strings")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 52585e088873..93850540b0b4 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -142,6 +142,10 @@ void __init riscv_fill_hwcap(void)
 			const char *ext_end = isa;
 			bool ext_long = false, ext_err = false;
 
+			if (unlikely(!islower(*ext))) {
+				ext_err = true;
+			}
+
 			switch (*ext) {
 			case 's':
 				/**
@@ -156,6 +160,15 @@ void __init riscv_fill_hwcap(void)
 					break;
 				}
 				fallthrough;
+			case 'S':
+			case 'X':
+			case 'Z':
+				/*
+				 * As the riscv,isa string must be lower-case,
+				 * S, X and Z are not valid characters. Parse
+				 * the invalid extension anyway, to skip ahead
+				 * to the next valid one.
+				 */
 			case 'x':
 			case 'z':
 				ext_long = true;
@@ -185,10 +198,8 @@ void __init riscv_fill_hwcap(void)
 				++ext_end;
 				break;
 			default:
-				if (unlikely(!islower(*ext))) {
-					ext_err = true;
+				if (unlikely(ext_err))
 					break;
-				}
 				/* Find next extension */
 				if (!isdigit(*isa))
 					break;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
