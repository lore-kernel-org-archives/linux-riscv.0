Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2010FC7EE2E
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 18:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/xF3M6kfC/MkWMbLWr0z9NADlKDOzM/qEKWFV2017U=; b=YAhnblKJidcZAz
	1Tnwo582htXIYFCAY9ylWSonKOcY4rNSufvNFOBoFP6GjeJ919NpKlwi8RoLpHRNRol6IilOb7w4M
	oE6D6rWDXDz1s1W3Apy/i9829NPOtsloQiyB167Hjly4LD4iaMApED0R6gPWa1HpizT+RgjLvYGW4
	OgOMFMCMRrQ5auPBMkZjaf+8etBSIhbpjwvSrxKeJKQJtZ87GGM+EiLO+ynZ5rGqYc2dI4C3ZOW2C
	kSkxPz85Uuj4eySqrgFGv/G7MZlVTbrIZEoMKcS0tBERzkcquTjcruZYRuapruP+kDL13zseHPqF5
	CGFAdLqJJvg//ZDiOBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvjDK-00GYJF-32;
	Sun, 07 May 2023 18:34:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvjDJ-00GYId-04
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 18:34:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 908E761187;
	Sun,  7 May 2023 18:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752CDC433EF;
	Sun,  7 May 2023 18:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683484468;
	bh=5Ctl8xQn5Up2BfcQEPensi3ZFyebX1h9yHH8JgAlfCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GehbaZeik0nSLoZNom/ZTCM0VHsqmpTwh5xbhVcQl8OSoZhhfGUog1cH08s3zpl9V
	 AYYIaMPmJcU0f9YlzCeDy43U1obqTFYZuMNO6BLy7OLdemKuctVdAhuXzNl91nIk62
	 f0/LCnyxwniZuHwxfdasaHd1uO8ajjSp7ZlqAocn/0g8dYAIOj/KdknmHwjXJv4cMe
	 mGhaaMYZZRYLfOLwvXe8Yq7Bb8pbFmVo0SKNXgUgYcKoTVshRXYHWsumOOXy2437oz
	 NrBtzurbpkuyUC1FAY2ko5fqepWgZO7UtRtMfNu4/bLTB3EVX5zoMdIDZlWHBHyPth
	 Hp7vTxangetyg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH 5/5] MAINTAINERS: add entry for T-HEAD RISC-V SoC
Date: Mon,  8 May 2023 02:23:04 +0800
Message-Id: <20230507182304.2934-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230507182304.2934-1-jszhang@kernel.org>
References: <20230507182304.2934-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_113429_095074_B3E48472 
X-CRM114-Status: UNSURE (   9.13  )
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

I would like to temporarily maintain the T-HEAD RISC-V SoC support.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e0b87d5aa2e..e1e51accec4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18155,6 +18155,12 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	Documentation/devicetree/bindings/riscv/
 F:	arch/riscv/boot/dts/
 
+RISC-V THEAD SoC SUPPORT
+M:	Jisheng Zhang <jszhang@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/boot/dts/thead/
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
