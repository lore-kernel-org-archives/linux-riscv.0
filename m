Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5915510AB800
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 18:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nTfbakJKbSam8DstWZieCo3r4oIWMgQZEUgzRrsCgM=; b=O+wAjzWb2wCkBF
	yFw+0tK9FHpcsdwMjpFKMccX2NSKjF0zONJiQXEPhIACfOCxYeIXYDKtQ/lrftsWmZhJ5QPzjZreg
	sV8hPgrB2i2J7Lu6cHqBhZUDT07LGsT6041IQACRivVrWJqdScshOOV71JGrIdGXo0jIieFiwc/Uv
	wDK+no9Wgyb1S3tNMZde/PmLm34kkZ8Cq3ySfJVQX+tV3vnibfsbehIwokipz4tQuI9nhxTVJjR+d
	87VQEDrf4IQVJ8P0yOPQ75YMqnvxk/6yIXDSS8wEtaHvOj+wxBvLCSIIfEBULdkd2e2dHeGEWr8je
	2JVlis9Ub0+HwMnz+7aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pat-0000000639e-1McB;
	Thu, 26 Mar 2026 18:38:11 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pap-00000006362-2bkw
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 18:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=i+OkUBOkqN90FxBJF3iUtR3fbhuPAeGsJmHvGA9/AeM=; b=RGtrnEJJ1oAxXulgSTg5S34nCH
	CQkZAfLEbKBAtXCObwV7qdBbTVHkpvBFGicB0v+JSUpyHG5ezND3aziNGiFBz9sl1Zf9VqNs7cvqc
	5AkNhWyqnM+1ruPrUX98iihYg7d20gYSIVa/bcnkU86FvTvg7bTLjwDBVc/QYjrduDHvmEDkwfdiB
	jjAWB9tdrXPGWZ5AMNaZQLvm/Ikh9ZkpqYfXHzkr2ivFWVgCRpa+O+5/KfbmWIl83HLl8ZGhDW/zN
	7zOYOhIXzychIX60sHv+hd/yGMEtvtdeg2bMySpqVEKkESauJYBbUpC+lh02xQYt4ils31QX0JKtM
	77oE94vA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w5pam-0000000GAjQ-3Ol3;
	Thu, 26 Mar 2026 19:38:04 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Javier Martinez Canillas <javierm@redhat.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 3/6] riscv: dts: spacemit: add i2c aliases on Milk-V Jupiter
Date: Thu, 26 Mar 2026 19:35:31 +0100
Message-ID: <20260326183745.1370642-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326183745.1370642-1-aurelien@aurel32.net>
References: <20260326183745.1370642-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_113807_656870_15D0D198 
X-CRM114-Status: UNSURE (   8.21  )
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

Add i2c aliases for i2c2 and i2c8 on Milk-V Jupiter. This is useful to
keep a stable number for the /dev entries after loading the i2c-dev
module.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 2 ++
 1 file changed, 2 insertions(+)

v2:
 - Collect Reviewed-by:

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index bd48208a370cf..836311c3f035c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -15,6 +15,8 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		i2c2 = &i2c2;
+		i2c8 = &i2c8;
 	};
 
 	chosen {
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
