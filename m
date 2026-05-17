Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2F7CD4F21
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZcYuLsPC3SFEMpbHw35ZUauSd1LiIu8TJH0hVOyMAU=; b=3GI5erntvgyb9C
	9ecXECyOPDIrGoFTBm/MXYxrref+kLgX2+KCaoi+auZ9U5NdSyaLxdmsPiYBJbt6YgWnIwCSKVaUk
	AcopjvdAvZEpovNr0R8Hujc7UaacCfy5BATOAjsmdyCvx265/QMmZipPxr7ZTYRp7IffIkEjPWztt
	rVZuRk9KBtH8xPXqfe+oM0rxStBUuGc/CDTE30Y5iAtGDyqoWPBNiuisXe6+g+l3iX7H/ekMh5idp
	SkdtRHLyKVIs/zm4BLuXgs8nxpNk1nw4MsbJb0qcbW24A+Skomjh2HEPnuwPuT9DvhzMPx4L4wSHU
	nbElYwioFLEuNTivqHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOcFo-0000000CpMt-1aek;
	Sun, 17 May 2026 14:14:04 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOcFm-0000000CpLp-2axT
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 14:14:03 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-83ea84df1d0so322781b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 07:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779027242; x=1779632042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxQKu0qPaPWJEtwO0UUAfVj3SWZjw97pz5Uss4p8Sr8=;
        b=dJkHTdIotum3I0RDmprmVPncnKjFngP/KGBh/QPYT8D95UjyKeJ7PjFZljB4B2W6wO
         WwOWNa5VRttvAtarJYBSVvASXQLf5XxLFQWv9r/CLJTUBWHxD21gtPTr4f6IhUdlFcC4
         eMsrq2AfpFdqaTG/z5bOAQfohTnOmG6iFvobLeEtotWJ0fBIGThJqgDzFRb6CIFua94a
         PUB3Kb9Q6mQLYfqOGuHGx8CZjcoDMfD6Gl1Gtmj7BD8kA4ring26LOGPhLBtnO7zCCzH
         pzAnQ/obFb8M3WX0rHJ3Kjv/WeEkT+jWg/3tjn5KvXNsjmcaGhJH7WTsdjQ66ZoGWCe3
         J8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779027242; x=1779632042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KxQKu0qPaPWJEtwO0UUAfVj3SWZjw97pz5Uss4p8Sr8=;
        b=U0R5nRZxe8DGLrig8Ydhsy5PTGEomcS4tIEuPmToV6WdrZiECnORLGDiVMFHiNO/gP
         0JqFrJ97HlMxN7z7Q12I6otPryu7WJmYU/cAq9iUr94AUiMaJk56CPJarbDa8Ork3cUO
         S3xnBfmr4DebUsseYmMEE1r7Fvhrds8pwuVcV207uoNOsaz84rXpUXzXi2KX1+XZx7Rg
         C6BP8o++swXy7l9qv9VHT3Lc4gS6v4IX4Cbik9Zc4NpoFQaMktqSGgP5ySSSB8kksw7Q
         t3mIac2Qhmr8JeXq7ch1lk/ACDDnj/Sk5XqN4CjRqjdGCMvzpf3+Hx7OIL70N8Pt1FTx
         Qe5A==
X-Gm-Message-State: AOJu0YzmkdCz3DyX7uMmMVHuJGsDC6vBjmrlRbpVAXpOrqAWYXOltuSG
	AgpMnfjT9ypnMeKMSMC4c9nKcNxM0yWa4EsR7AgihUZDV7aOtNrV4b+z
X-Gm-Gg: Acq92OEbjA6ImYnYSYeKrB7KvGX3Jg17aSeiSxRae4ysPFItkO45yrJMo7G/6pT2VlL
	c9x8FiKHPrHd8I5k9KUKVutkyfJUwNYb5uA+I+/eoFvEIEggFzNnzDx9Ozo4mCHO2kTyggOSwj2
	Xf8+f4n87Ogi20zf/C8MvrNg8Hn21xMi4/sCknUsKK53cogJi1DlURQABedg/LEXbwn31HNInAM
	VH3pLsCUPOxk0duIOAc73RwwZayeXIdF9+fdx0HHfeDGx+UJOw7tUUL2K4Tc56BeR/vh0rcLHE4
	T1aPEATgGvA/nDldNtPbnbdB36Kl7VlNt6/9gR+Tv6IhawkM5TARpdGXCwXsNS+WSaZglagFUt2
	ta7xu3NvswJBTWgNs9RoxgyKtif/OYsxPiL7HxYGPPACW2asLN2Dmz9NnTnk3aQEf9LeGNxG9dO
	AVd8THYQPeexGQrlr1ZyNYYn57JRa5
X-Received: by 2002:a05:6a00:4fc8:b0:82f:84c6:6510 with SMTP id d2e1a72fcca58-83f33c961c7mr11808884b3a.11.1779027241731;
        Sun, 17 May 2026 07:14:01 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.163.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa5489sm10252528b3a.60.2026.05.17.07.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:14:01 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 17 May 2026 22:12:56 +0800
Subject: [PATCH 2/4] dt-bindings: clock: add binding header for sf21-topcrm
MIME-Version: 1.0
Message-Id: <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
In-Reply-To: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_071402_664530_A973B1AA 
X-CRM114-Status: UNSURE (   9.41  )
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

Add the device tree binding header for Siflower SF21A6826/SF21H8898
toplevel clock and reset module. The header covers both clock and
reset IDs provided by the block.
CLK_ETH_REF_P is a clock name that exists in the vendor datasheet.
This clock connects directly to CLK_PCIEPLL_FOUT2 and there's no
clock gate/mux in between. An alias is created for this clock
to make available clock names align with the datasheet.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 include/dt-bindings/clock/siflower,sf21-topcrm.h | 63 ++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/include/dt-bindings/clock/siflower,sf21-topcrm.h b/include/dt-bindings/clock/siflower,sf21-topcrm.h
new file mode 100644
index 000000000000..3690b3452501
--- /dev/null
+++ b/include/dt-bindings/clock/siflower,sf21-topcrm.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+
+#ifndef _DT_BINDINGS_CLK_SIFLOWER_SF21_TOPCRM_H
+#define _DT_BINDINGS_CLK_SIFLOWER_SF21_TOPCRM_H
+
+#define SF21_CLK_CMNPLL_VCO		0
+#define SF21_CLK_CMNPLL_POSTDIV		1
+
+#define SF21_CLK_DDRPLL_POSTDIV		2
+
+#define SF21_CLK_PCIEPLL_VCO		3
+#define SF21_CLK_PCIEPLL_FOUT0		4
+#define SF21_CLK_PCIEPLL_FOUT1		5
+#define SF21_CLK_PCIEPLL_FOUT2		6
+#define SF21_CLK_ETH_REF_P		SF21_CLK_PCIEPLL_FOUT2
+#define SF21_CLK_PCIEPLL_FOUT3		7
+
+#define SF21_CLK_CPU			8
+#define SF21_CLK_PIC			9
+#define SF21_CLK_AXI			10
+#define SF21_CLK_AHB			11
+#define SF21_CLK_APB			12
+#define SF21_CLK_UART			13
+#define SF21_CLK_IRAM			14
+#define SF21_CLK_NPU			15
+#define SF21_CLK_DDRPHY_REF		16
+#define SF21_CLK_DDR_BYPASS		17
+#define SF21_CLK_ETHTSU			18
+#define SF21_CLK_GMAC_BYP_REF		19
+#define SF21_CLK_USB			20
+#define SF21_CLK_USBPHY			21
+#define SF21_CLK_SERDES_CSR		22
+#define SF21_CLK_CRYPT_CSR		23
+#define SF21_CLK_CRYPT_APP		24
+#define SF21_CLK_IROM			25
+#define SF21_CLK_BOOT			26
+#define SF21_CLK_PVT			27
+#define SF21_CLK_PLL_TEST		28
+#define SF21_CLK_PCIE_REFN		29
+#define SF21_CLK_PCIE_REFP		30
+#define SF21_CLK_MAX			31
+
+#define SF21_RESET_GIC			0
+#define SF21_RESET_AXI			1
+#define SF21_RESET_AHB			2
+#define SF21_RESET_APB			3
+#define SF21_RESET_IRAM			4
+#define SF21_RESET_NPU			5
+#define SF21_RESET_DDR_CTL		6
+#define SF21_RESET_DDR_PHY		7
+#define SF21_RESET_DDR_PWR_OK_IN	8
+#define SF21_RESET_DDR_CTL_APB		9
+#define SF21_RESET_DDR_PHY_APB		10
+#define SF21_RESET_USB			11
+#define SF21_RESET_PVT			12
+#define SF21_RESET_SERDES_CSR		13
+#define SF21_RESET_CRYPT_CSR		14
+#define SF21_RESET_CRYPT_APP		15
+#define SF21_RESET_NPU2DDR_ASYNCBRIDGE	16
+#define SF21_RESET_IROM			17
+#define SF21_RESET_MAX			18
+
+#endif

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
