Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACD2606A327
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 06:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=klW4CvXk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=VdQqk5Np
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Date:Subject:Cc:References
	:To:In-Reply-To:Message-Id:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FOX0RbQh4PfQ9Q3A+2YOH3M1+Ll6920XEcxbraq+6RM=; b=klW4CvXklAlOP/mcjqX76FrWbX
	BhFBDmyp7jDYU6DNHLyYKKi5sic/griN7AO/3W7T3sxLyoonxMy1a1XUVoV3rwCz+JHYntc/T9Bz6
	XmdsCoZJBHIR0vJll72CWcgMxGGZKCiEMCGcuzoqPee9dlb13e/qPTYZDiUN/XgsyhaOCdOrj0rwK
	bBH6TSNzzHHXJBS6H0KRNnnWg1LVJwrobtMd9UuEKXuPy5b19DCsLwwAAPusIyczINcBSXiux9LOy
	jYw1F75sAFqNqNlqEfXCB0QP6hGKQUPChPw+AniYGhd3w3+DCdpeDLaSXpMTAjIyt3QxNlDtudDSu
	2PQdu9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNl7U-0000000FcQS-0oea;
	Mon, 02 Nov 2026 06:02:12 +0000
Received: from va-2-39.ptr.blmpb.com ([209.127.231.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNl7R-0000000FcP5-2JXp
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 06:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793599324;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=quTJ/XxVKV0teBm3OuTXvbxjmUOvYB55/JlNClrvCTY=;
 b=VdQqk5NpP+hMW+NVY/qJxCGrBcAIJqMGJSiGU2FYyU841PWHPy6IqYwur4ZCKXqJV7HauP
 LmVgqBTDsmy8YhOBF4RX8pLxfiRKNgFqm5GNJ3zV0CCfYfst5GgzWBj+TCp6XNAxcqJMVr
 2Es+9kkj1cnwKJhHnFB5E697nMX0fOdt4TENXjE07DcSEFb233oR9uVJLGnxCqiL6uQ+jT
 dGTNm5TxiyAXDS9p3Ais3YDwvICbhArQ4hPbGm0cWn6ww+m1Ze+IcOr8QSChZ6WGg0V7em
 nO0Kg+Y/47IoHXfjzbffQJfP4BqJKC6odZ9l5pih9EWZ0mIZ3jhW9IGogI9baw==
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20261102060155.100679-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
X-Mailer: git-send-email 2.43.0
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([113.80.9.210]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 14:02:01 +0800
References: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v3 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
Date: Mon,  2 Nov 2026 14:01:55 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ae8275a+66632c+lists.infradead.org+sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_220209_674407_93810421 
X-CRM114-Status: UNSURE (   7.46  )
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

Add the device tree node SDHCI-0 controller for onboard Micro SD card slot.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 84f66dd8f962..4471338a9774 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -184,6 +184,28 @@ &combophy {
 	status = "okay";
 };
 
+/*
+ * Onboard SD card slot:
+ * Plugin/Plugout the SD card before power-on the board for secure.
+ * It works as a boot media. so set it to non-removable.
+ */
+&sdhci0 {
+	pinctrl-names = "default","uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	non-removable;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
