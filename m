Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89483D78326
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 14:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLsWBHpzG9INI750pR+2DyIBPCgfLGO2vc1THpP2fYU=; b=lJ1LANEhqJ7vwL
	MzSMHerSrtXDUrbZxS2qCIHmeRbqP2s+6lmF7fWSFvW1FJpc9oIb9Cl9JWKkPiwEZTAJO736Ghe/t
	DdggGtje1pzyK81ww7gXgXiDaF2sSiuzmotYpW5BnLkEonoIO8dJWs3Jx2iHO6o5QYpHrvWGlyvWG
	c8dU4jrYMgWJjuwFmKpyaJ+GIE10JGe7ob5mnEz25w+1AMn/K2jcw1fJ6QuEN501nkQv4mNuGz+d+
	1bSgqi67HfE4X0ukFzXHxaRcjXIq+hXnIqZtoqbyttqKyUEw9fcbCutS+E+a/qqO1UEbxOkErNzUX
	rbwfRcbI8g8yqfT1W2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI79D-00000006NRP-1IJh;
	Mon, 02 Dec 2024 14:11:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI79A-00000006NPT-2eOh
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 14:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733148692; x=1764684692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xWSs+CCHo2cnkHp+YQIYQ9pyFy661acsmyXS6RC2uDQ=;
  b=KWQPpTzxzzkJF8gj+qg6VRe0CFlwkPvvnX//M/XIcFApzt9/78kUtPBf
   143xAaw57effGfm3scWu47Eg7uzAjXGX2s76CZgnguXQ95NQEEB/D0o+8
   fNqTAGSAjPDRvZwT4tYbYCPhEz1dQRUZrlDgG2fWWToUz1kbstS6Qz7iw
   GWLCDE9qUDA8W/G07wr/n5cxDWB5PQvoyGVMApeQhK/XmpT6zjUjL/q7h
   95drPcpmhP6N0SbUf0meL8uEswUu2DLsD/xbCtJxO7rPx4dxwjNJBZ51U
   lcPt/y+wNE4mfI8UX3cpNpQK4EKjigT6oKP0nzy6oKPQxQpePN/MEvf7C
   A==;
X-CSE-ConnectionGUID: taQ6Mgj1SxiZ/6FO2hCQAA==
X-CSE-MsgGUID: uZ6rQJhdRhGgV3P57k1CDQ==
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="35497715"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Dec 2024 07:11:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 2 Dec 2024 07:10:53 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 2 Dec 2024 07:10:51 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<conor.dooley@microchip.com>, <conor+dt@kernel.org>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v5 1/4] riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
Date: Mon, 2 Dec 2024 14:11:04 +0000
Message-ID: <20241202141107.193809-2-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202141107.193809-1-valentina.fernandezalanis@microchip.com>
References: <20241202141107.193809-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_061132_728266_B75D3DB5 
X-CRM114-Status: UNSURE (   6.86  )
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
