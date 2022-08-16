Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01C7C2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 18:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zh9h2zJUZdFJXrEsYHr0aVN1kp9Sjf3T6u0w8cvPpbY=; b=FeGzntZTxPVhXv
	DVyYYtSDz6Xt+Zmv46WDHD06vfY6TnG0YOOYz3ipcotdeZTL1y7cHEiaoNwpxySOhtXqiu+viQiKi
	zxpvRekGxZyj8lXQlaz4vAIZBMvSf71cestreaqptVIsobznIS/kwyF11csg/fKxeo9yq03lw7tVU
	vBO7gIl+APQ3UbsI+jK/us7DnnmqCyjBjqh7ANj+SsZYiOsuaG3kESDN/wUu8a4XG3yM1CkoYc1xO
	RvECtJ3XpWjtiBFTryDN+jlrPYKNAzDA3PM7wQzLk3p1XRSbbyjgQY/ctilHVwjEueGerJFuQ4AJR
	SeyOLKuGVh1qhZBcSk3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1GV-005oIW-8i; Tue, 16 Aug 2022 18:26:11 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1GN-005o9A-A0
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 18:26:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id z16so13576683wrh.12
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 11:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0menBycPydf3OF4brxfxIM8hwmBUp4QdVL5XPrXyre0=;
        b=cq/wfBYlh9TNFle3AyyvA6aRqw5tapsXhJ5VOkQTJzEV+SvWLBxc0M7sv8kJVNFdJ5
         5JncrYyhkUkDXQWKF8FAx4sOG+2Ex6/MC0HoGJhU8vOvxPOwd8YhEMi9IQCLhhDbmhUD
         5joEaePchEDaqh7S5PvvzvcmKFLRa3Wqpo562J+IcuT6DJ4Rc6YKoH3AOuH7ki/Avy3R
         hLP2aCDDBDn0P/4xlwEI29MsDEgyaxsNArRWr+Y9os15aApcQqcS3ANBUaBPIP9sDbWh
         yow8teObOTaeHu0HIjh+iczV/cqIcV45gESM0bCY/PkvniEAUabK6pe1YdzVVW39fcvQ
         JHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0menBycPydf3OF4brxfxIM8hwmBUp4QdVL5XPrXyre0=;
        b=hlpCwrinXajEqqAtoVbt1i5JEDBzhUGXJ7TZTJfU/xGq8i4QgrKY6nompHn8FLqGwI
         qxweN0MHXdmtIV/qmGux8Mu7M+3IH2+pXT4RLkmX56D/0Q8HwyaOodVQbPpRCiAehJKR
         TvVQK1Bcd6oVWqDXduRcy5X+4dKBuW007aVpaD6lqdRVDuiQe2ZF5FVUZYqv6Mc64wFS
         +uEVW3eGnaNA7VPyVRwUmYmcmSaXVn17GMErcm0FxCGbcdza5g6OCdf5+iQrLCuJ7/zn
         hsTl8kRU+CK/aa5fD9000oUwQx9D4WAr+QnSIlF8jao5G///lOsoMQfrOjKPdSDZtrqi
         3P6Q==
X-Gm-Message-State: ACgBeo2OTlNJ4c0LaJ5GzNoMP9rtmGacGGjGZq4vgFDgFnk9tEiA3J6f
	Xyhy3IlniG0abesAkj3x9L9jLQ==
X-Google-Smtp-Source: AA6agR6kxEpAlsWHGGaIsHWoq0lgu/Z8DXmzz/tOaQf+JXZgc8EJhMGnIovPSVPfRDBgUP5kkbMmOQ==
X-Received: by 2002:a5d:4d4d:0:b0:225:fbf:fbac with SMTP id a13-20020a5d4d4d000000b002250fbffbacmr4093198wru.623.1660674362913;
        Tue, 16 Aug 2022 11:26:02 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003a603fbad5bsm4015482wmc.45.2022.08.16.11.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 11:26:02 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 6/6] riscv: dts: microchip: mpfs: remove pci axi address translation property
Date: Tue, 16 Aug 2022 19:25:48 +0100
Message-Id: <20220816182547.3454843-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816182547.3454843-1-mail@conchuod.ie>
References: <20220816182547.3454843-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_112603_447330_CE523481 
X-CRM114-Status: GOOD (  13.20  )
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

From: Conor Dooley <conor.dooley@microchip.com>

An AXI master address translation table property was inadvertently
added to the device tree & this was not caught by dtbs_check at the
time. Remove the property - it should not be in mpfs.dtsi anyway as
it would be more suitable in -fabric.dtsi nor does it actually apply
to the version of the reference design we are using for upstream.

Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index e69322f56516..a1176260086a 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -485,7 +485,6 @@ pcie: pcie@2000000000 {
 			ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
 			msi-parent = <&pcie>;
 			msi-controller;
-			microchip,axi-m-atr0 = <0x10 0x0>;
 			status = "disabled";
 			pcie_intc: interrupt-controller {
 				#address-cells = <0>;
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
