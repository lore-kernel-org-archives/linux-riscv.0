Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB49AD0C601
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 12:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLsWBHpzG9INI750pR+2DyIBPCgfLGO2vc1THpP2fYU=; b=Ab0h0FUjYKlqNi
	uxbRmTdA4E9Cjik4EOg2ulakX118oTmYoJGHfKEIB77ylxt+ea695BLXertdwWdB+rOoZL2oGtO3t
	b6D7Dgk5GGMCj4mJJnEUestBJnDmOoEuOJf7uMOZ0r+7PckroW0hUxBoOthNcEhWLmm88t1KhDxBl
	ZD9BPrM0/2lYfPLGBCYP6tb2cvlgI4FNbrmWXczuDh8/+XXfqFLP95olDq59jzck8xqruMChyYAmS
	Zam5biEIR5+WYM22pBZQ6DA4rlLgOsphY5xQXE18pwsz8IFDhf2app2WWy3OSHj/XCXsx8ZEQvKwY
	iXWgilnoF438OXNdGjig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JYL-00000003fur-1yxP;
	Fri, 25 Oct 2024 12:36:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JYI-00000003ftS-0j42
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 12:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729859786; x=1761395786;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xWSs+CCHo2cnkHp+YQIYQ9pyFy661acsmyXS6RC2uDQ=;
  b=tzQxAX0UPOY/bCd7clxue8CBOjHb+L1KrqU9sEYy7EkaeLfnCSYEUZ6S
   O6gw8fQ2eW4c7UmCbsrLzAooCQ0AlvtoUOylVFzlm6auIq+BNLNb8xris
   VzDy/4SgI24X96iGGy4tcMJPOPggXNuSUlNkQDC+OPDcOY8lKVAK4JNI1
   SfvtW7y6/30tZKIj2Dt3xFYUfukTV128/t1ORc/HR8fdzJIrHOJuHT9n6
   4SMFjMKH0KBKmUmNYcsIo4zI/wM6deJzoaKGQSszQg/FdP6f5vSS6u3KI
   F4HwkZ7mGfUHL6jTE0CIuFBbD3Pre9IGiZ8N+At80cIykXxpZ+XMwqqbQ
   Q==;
X-CSE-ConnectionGUID: /fS3tpDQTK6/KTRMJLYOIQ==
X-CSE-MsgGUID: Vf5KeAiTSWC4fxC40P2lbw==
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="200905581"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Oct 2024 05:36:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 25 Oct 2024 05:35:47 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 25 Oct 2024 05:35:45 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterlin@andestech.com>, <conor.dooley@microchip.com>,
	<conor+dt@kernel.org>, <ycliang@andestech.com>, <dminus@andestech.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <jassisinghbrar@gmail.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v2 1/3] riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
Date: Fri, 25 Oct 2024 13:51:08 +0100
Message-ID: <20241025125110.1347757-2-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025125110.1347757-1-valentina.fernandezalanis@microchip.com>
References: <20241025125110.1347757-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_053626_290361_24183658 
X-CRM114-Status: UNSURE (   7.65  )
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

Add Microchip Technology to the RISC-V vendor list.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 arch/riscv/include/asm/vendorid_list.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index 2f2bb0c84f9a..a5150cdf34d8 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -6,6 +6,7 @@
 #define ASM_VENDOR_LIST_H
 
 #define ANDES_VENDOR_ID		0x31e
+#define MICROCHIP_VENDOR_ID	0x029
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
