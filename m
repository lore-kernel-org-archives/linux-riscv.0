Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C24C4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvoZDCcmkxHYGAiGrhC80nojGiSO9EMN1VCl1Qx8mmQ=; b=gPuZcGLoJUBhu7
	QBg3C/J232//Y/KsQ7vW2MN52zu/bwXBjrJo+UHeemKthou+Q2W7FBhnaqCva/y1t9wunBIurdvWj
	bJpzj7pYnVrQdX9G0hLQHQvoi0nfjIrdE69H8uBZwFacYOcSgE+c0SzuvDVIUGYUOf17Hh4sjn+8w
	vZDlmitT7eqhe6NGu8DbATNB6+4p33VMb9ki+VGA1BhDS6LT461s0lht85W24trNKKSQh6kRCG8RT
	Y3cF9dlVm7XI3dFLFlJK10jQRFw3DL/WCTobtw+7oSp8M+tTHGp1scP1G1scAOhAWChPemgVLxSwt
	grNEUnWrAYCkQOtEkx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01xM-009S5a-9a; Tue, 29 Nov 2022 14:51:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01xI-009S2b-AC
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669733489; x=1701269489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ag9tRag2tCMnYNZ7PXKJUn99ayga3IWCVtRNMuIqp7c=;
  b=TaSlfA5E7ZXZuODOKRHGjddeteuBxpjVZA/wRfQ+tBbL1v6ByiDUeb0B
   zp66LmEPE1hX2bdTNzNHnHRKKaXk8DDV6K4/i8mCk2NVvZ6tVjxsV6If4
   5M3OZQP6Wn+vgMPnahajU7lh9rMJEe7TezxAL26oq9p4QDWFojFBycVaj
   bjHGj7FI08ry5QbcVk91T7ILemHCAEmmKPJxEzFyGo1ygdjwjfQD+gOXQ
   98LtbwVmCpohQDISLJ1Q9cP5Uvvmy8EBG7CfgdQKRI85y/DnVQ2iyFVIE
   qLZjfax/1+VEjDVUZnmEVUl1bIxEJhpbLHJho+MZxEhCMF/SYMPnMbhZw
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="185697717"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Nov 2022 07:51:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 29 Nov 2022 07:51:18 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 29 Nov 2022 07:51:16 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, <ajones@ventanamicro.com>,
	<aou@eecs.berkeley.edu>, <conor@kernel.org>, <devicetree@vger.kernel.org>,
	<guoren@kernel.org>, <heiko@sntech.de>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-kernel@vger.kernel.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>
Subject: [RFC 2/2] RISC-V: resort all extensions in "canonical" order
Date: Tue, 29 Nov 2022 14:47:43 +0000
Message-ID: <20221129144742.2935581-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <Y4XvnHIPw8ZuBZEk@wendy>
References: <Y4XvnHIPw8ZuBZEk@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_065128_451561_A5040FD5 
X-CRM114-Status: GOOD (  11.76  )
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

Per the comment in cpu.c, re-sort all lists/tables/enums/whatever in
arch/riscv (apart from KVM) in the current edition of what the isa
manual considers to be "canonical" order.

None of this is in uapi, so we are free to re-order it? I'm never sure
when it comes to hwcap...

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h | 6 +++---
 arch/riscv/kernel/cpu.c        | 4 ++--
 arch/riscv/kernel/cpufeature.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b22525290073..d7d5f27619ee 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -53,12 +53,12 @@ extern unsigned long elf_hwcap;
  * available logical extension id.
  */
 enum riscv_isa_ext_id {
-	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
-	RISCV_ISA_EXT_SVPBMT,
-	RISCV_ISA_EXT_ZICBOM,
+	RISCV_ISA_EXT_ZICBOM = RISCV_ISA_EXT_BASE,
 	RISCV_ISA_EXT_ZIHINTPAUSE,
+	RISCV_ISA_EXT_SSCOFPMF,
 	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_SVINVAL,
+	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 5e42c92a8456..1d0fa0ebf6a8 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -150,12 +150,12 @@ device_initcall(riscv_cpuinfo_init);
  *    extensions by an underscore.
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
+	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
-	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
-	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 694267d1fe81..d3df72c4b94f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -199,12 +199,12 @@ void __init riscv_fill_hwcap(void)
 				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
 				set_bit(*ext - 'a', this_isa);
 			} else {
-				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
-				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
+				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
+				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
