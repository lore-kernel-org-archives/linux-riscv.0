Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11441C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 10:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zblo8rqjkylJk1CzXPuQSUok90sAuNVQPrcwppccdZk=; b=W0FKeQ/Q4uaWrb
	MI9tgKA9dHj5wDAK8bMZvkURvAlKfQHx/OWRnZg/XVha6TSLUjEVd2fflwiPioseYEdsTik6GOM6L
	qlrsOHPHUpCKkU94RJG9t+vClHEu5CRhd/euMVrbVVLPabLbNZ1Dm+5iawlykrZx+1+yQD6RqX9OI
	5y3iRV0+v6lJN4SykqWbSw7yGU/C03gqJ6/kOg71XC/GLBwffOh1XMRd7jlI3rEkLZeF5DYXYa5lr
	heD0woGGlvodD9Bbbl+fwUgXSqxXJm4Lqe0rFQ9W5qWI1DoXBMh3hdgDd4GN1/AVJm58F2YW5Zvy0
	m4RKRrGicY6CckYy+9EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh93-0000000GSa3-0N1Q;
	Mon, 24 Jun 2024 10:41:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh8w-0000000GSXI-3R7V
	for linux-riscv@bombadil.infradead.org;
	Mon, 24 Jun 2024 10:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i7mi9Bjb4BM1PJcskbgpuJBr9qDMUUvyXw66omSy+kk=; b=DQxR7GLUTwyxcch2Euhcc5zU/g
	55G3bCM3Gs64pd5KQobNuSvno9agBFzQb51N5gBXccGlVfZBIKfTyiVSlJigI93hVBZUtoBxoFThP
	2aRHpJXIGoDmB1skatjL6H5iyokrZLPtNvqKz8yHoxjCwdwqj8N87+VQ1xquOUUcRnquNA2Ur9ax/
	7xHvOV+TyhgJFH/vl2bqIwBwygjbyqSvEBZDkPElx0GAetCh6gfdUFMiaPOdZd7ZcAyicMCQE8ujo
	vrHWeppN3uock0LZFLq6JbLl304zbO5FvQlt3Za2jhc9z3NTdxvsqW1MnmkqP5UOxLoqZSmfWdYNm
	INd8kmFA==;
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh8s-00000009x8d-3qyf
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 10:41:49 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 45OAdw5a009984;
	Mon, 24 Jun 2024 19:40:01 +0900
From: FUKAUMI Naoki <naoki@milkv.io>
To: kernel@esmil.dk
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        FUKAUMI Naoki <naoki@milkv.io>
Subject: [PATCH v2 4/4] riscv: dts: starfive: enable heartbeat LED for StarFive VisionFive 2
Date: Mon, 24 Jun 2024 19:39:25 +0900
Message-ID: <20240624103925.946-4-naoki@milkv.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624103925.946-1-naoki@milkv.io>
References: <20240624103925.946-1-naoki@milkv.io>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_114147_476789_BE49CD70 
X-CRM114-Status: UNSURE (   6.41  )
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

StarFive VisionFive 2 has a green LED to show system load[1]. This
patch enables a green LED as a heartbeat LED.

Signed-off-by: FUKAUMI Naoki <naoki@milkv.io>

[1] https://github.com/starfive-tech/linux/blob/a61d1d826ca3060fd76ab31d37c691fc09b52fc0/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi#L79

Changes in v2:
- new
---
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 9d70f21c86fc..e5808268fe8c 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -5,12 +5,25 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include "jh7110-common.dtsi"
 
 / {
 	aliases {
 		ethernet1 = &gmac1;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &gmac1 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
