Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44471109024D
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 16:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MVnzHxmAPwX+MXoOm/9GS5yzAAbKAyazIQbd7QMiWE=; b=Nsbhc9L18yCJZV
	zb2CoVlsNAeJCnq0fQ32yFee8VM35aM6i5j7an4EJ4pi4Ub8hr0trwUrfilA6Q5vEt0pxHVGP5U6t
	T76CJ0jeTG/03aSW/l5o48EjKCRbYDUpvgw8YDFmIlRndvnKttyMTUCINEuQeqH/LZjKwDBTcgXJH
	G33Nus29TzpI3e4+YHmLSYpXDqTTGQj37v+5/5npFjwJ62Fw1hLkRoe2ee2mxSiwNIwRA54naPDZC
	dmKfnnlIBr7eVQopj/XxDLoY9d/RVZb/Xmzq9kYtCiJ9NXb1P6nFh4VhGdylBgvdKnMttjZ8coB5i
	nBtOjpoGcZtgIVPiAjsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GHo-0000000B5DO-0WPu;
	Thu, 19 Mar 2026 16:31:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GHl-0000000B5CR-2Qmi
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 16:31:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E6B64414D;
	Thu, 19 Mar 2026 16:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA6EC2BCAF;
	Thu, 19 Mar 2026 16:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773937909;
	bh=808siTn/eKlIL4fo1RdjLsJxG5BEBSTbGLlJxTqmWVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UUU31YWPvBVPjtqb8P4Ak32O4yTKIRdPax3y2K8iJGZGx+yRPWgZS8KC4zfYJ2HTv
	 Ktg1eKPA2Hp+SvGVDRMeQibvMwgHbYL1QEZWApUNX9YRM142B3hvsLVnKeViAhUTwq
	 PSyEyW4j5hOOJzSrfE+7yxs7JAsPjgshDOeQurySZ6ehDt+pNmQFHulE4836nimQju
	 t/eCELpRucFJOCV4KvEwLqh6pMJjobJiRwKTl7vAjvyH3iOU7V6kgkVeellw7NAMeB
	 mJuakFcu10lQHn/CRfIT16Phu310duhfOr2af6mFG0JdVu0UkWJG4qpc6JZUnzTrl6
	 QXVmPDwohEvMQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	Brian.Burke@microchip.com,
	cyril.jean@microchip.com
Subject: [PATCH v1 3/5] riscv: dts: microchip: clean up beaglev-fire regulator node names
Date: Thu, 19 Mar 2026 16:31:17 +0000
Message-ID: <20260319-impale-perch-2b612429c555@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319-outsell-hypnotic-94b480408ad4@spud>
References: <20260319-outsell-hypnotic-94b480408ad4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=gip2ctW3zViKnQHwnuvE1rS87LP2hxhiGIYJwVK2hCY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJl7VK4wr5PhXJHH4xzB69Cu+bDYblH24kMsyypXCH+QP zUl9d/sjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkLhPD/9iWM7+DJ4oWnP6v ZLj58QmG9bZLxdlbbD7v/pW81r76yxxGhg2/OGQLXK9Imr6Lj++1P9q+zT/HVfF60+3pLNt+THJ 8zw8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_093149_659462_C6A5480E 
X-CRM114-Status: UNSURE (   9.00  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Recently the binding for regulator-fixed introduced preferred naming, in
the regulator-XvY format. Change the existing regulators to match this
pattern.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
index 2c0a420d89ff0..37c3525d490c0 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
@@ -63,14 +63,14 @@ imx219_vana: fixedregulator-0 {
 		regulator-max-microvolt = <2800000>;
 	};
 
-	imx219_vdig: fixedregulator-1 {
+	imx219_vdig: regulator-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "imx219_vdig";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	imx219_vddl: fixedregulator-2 {
+	imx219_vddl: regulator-1v2 {
 		compatible = "regulator-fixed";
 		regulator-name = "imx219_vddl";
 		regulator-min-microvolt = <1200000>;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
