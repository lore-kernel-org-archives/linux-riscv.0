Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59FF606A32A
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 09:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=josnNyGa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FSqZ+UAd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Date:Cc:References:
	Message-Id:Subject:To:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MYpfwrkBoBw6R+TbSlLpfbQ66A28pCU1PqUAmEK6alE=; b=josnNyGaOjRxtPXn40SZ7Ip1Av
	PqTwBbxwZQb98mQAzLkwjEnh5xpiEf/1WFsFWdvd2PLrYmfpbQv0OQWQ/m1kivN+OEMjYd0M2vnmd
	dsN/voDV5SXqsjYC6h3P1P0jDIVm/f6u2r0lxRIxSfzanSv8lnW7MDkfQ5P2hjLjk/QOZcMgvxrLE
	EOgLDfEo6MzBfyiiD3mPnEV9eogzS0MvkvmVM4aoDG8fSunxSYs+Bd4FZnkiU3n75YH5Ed+awtZND
	A6IYr35ka5DtFGPDqto8sLHXnf3CXvJyNG4+EQxc862bOY4RRKimwHNCJrn8SZjyWoXlG86P7S0+J
	LsTutj7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsZT-00000001hHW-0pSz;
	Mon, 16 Nov 2026 09:00:15 +0000
Received: from va-2-28.ptr.blmpb.com ([209.127.231.28])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsZR-00000001hGr-1FB6
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 09:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819602;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=70z/WI0McbinqpG+yd/C6iK+RigsJ/gp7vM2rkwjXR8=;
 b=FSqZ+UAdMtrYBd8YAom/an2rtDRtOjJyQ1rLAW2iRUOX0mWbEeYYkIMHoIBEleSCOgbHqD
 EdGjlaEI4BKXxvBigTnHnLNkcC9iMvkg2gxBwpnY99Pj6C3+NM1A+huRp2gPnH3qQSxoFc
 awLnLvsK0erLl4v2Bvhp8ubctAzwwh5spGw54ZaE6tBaFe0bYYDGF5Iq/QWhQ1gXD+XzEr
 XixWqlNDO9zNvCEMsAjZ/UqHhWWGbqj3fIMIsT5igYrKBECBCbsx3OVFK3J+Zb6pTVtMF3
 /gwnGWmScBt35zyMJMdNnuGmxetYJQe9ljiLX0lFMrrJ7+dtBbDXhefEGA956Q==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Subject: [PATCH 4/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add WLAN power regulator
Message-Id: <20261116085952.951331-1-sandie.cao@deepcomputing.io>
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Mon, 16 Nov 2026 16:59:52 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:59:58 +0800
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26afac610+731bd6+lists.infradead.org+sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_010013_407913_9C1876A4 
X-CRM114-Status: UNSURE (   5.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The WLAN module on the FML13V05 is powered from a 3.3V rail gated by
GPIO41 (WLAN_PWREN). Model the rail as a fixed regulator.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../boot/dts/spacemit/k3-deepcomputing-fml13v05.dts   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 8c12fd01227b..2e1ad0929ee5 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -31,6 +31,17 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-always-on;
 	};
 
+	reg_wlan_3v3: regulator-wlan-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "WLAN_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio K3_GPIO(41) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	rfkill-pcie-wlan {
 		compatible = "rfkill-gpio";
 		label = "rfkill-pcie-wlan";
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
