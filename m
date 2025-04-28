Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1878C3ABA4
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 14:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Je6Nw+PPmbQ61n0l9XxJAQD6/RuviCC8w8YW1mPRSzA=; b=uQ9WY9YKxkmVP1
	pizXfHbcxN+2rdxASPFNC3wYDY4VPjr6GUsd9XMFVg/sEOkjvlR4g6usgP5pmExNx14/mzwVur9nR
	UXmQLBwSvI0lsCv1/oJZBjv5gw6SJJ249hG2xxaeBUMmXMSRA/apN8SY38lVKO5SSxF40Hoqn36sJ
	HOwOwVliNPoDgW2E9txaVK/hy4jg2z5xr7Nw8KAqYfrDxRmigZ0fOqAe8AP4KmWdqh9DBl82quG9h
	ciIXWTDpeNl3HR0R1ZYYM6BqDT9eHLzJiDlZH+KmzNp4lXP0gPk0QCAFbxvNRMdx4ZlFW2NheGcyH
	C5AOiF5dSQoFw8AO5E/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PHC-00000006b7z-1JHv;
	Mon, 28 Apr 2025 14:16:06 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NnE-00000006EIV-1aXO
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 12:41:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745844050; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hQ9kU5ovfWYh3xJW0FBLTEdtP8B4QMrQxe0OhCIyqy8l89uhvwBy+w94x1AQUTWBJll6HFtD8w1mvdEmmjGhOV4J9ihq7ECj3WH8DmEbFeukEZHM/zN5Vjeeid9NFu38GKvj8qelhGS84v5WNP7HxE+e7gbVRHLE6PALVu2mJAk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745844050; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iDUWlWYITNoYcDcCC3jnCqiVPV8s0bgHvdEQpT3GAHI=; 
	b=mkQToJlHeIgAmzuz7WstdN2eVe88kUck2JXyX09EtmuccQx0rOzdh6XSX28gGsJYX6tvlybqNt8PzllqjKr5AyyyCyGj81+jJjgP0xLjH62ul9cZdsx6wcr20Iv9y40LcqemVnjRDC8/L0hsfCA5KqDPR09OEkNpRonb8hTTE0Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745844050;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=iDUWlWYITNoYcDcCC3jnCqiVPV8s0bgHvdEQpT3GAHI=;
	b=mUOSWiUtolg48QWGbkJ4prdd9W2gijfvjSAvQtnI8ankqLssL6wGuKrr6fGiGOrR
	EMlZMTHeBs8FGlUN5lsBdXu/65jXmh4HzR5NRdqFiDH8k77yimqZBo8TQjg4EPqvQuX
	Kt7iG1YXmvm0RkgHjikoH7C+QMXOZlJVgpNfcMpY=
Received: by mx.zohomail.com with SMTPS id 1745844048587698.6681306110062;
	Mon, 28 Apr 2025 05:40:48 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 28 Apr 2025 20:39:45 +0800
Subject: [PATCH v3 2/3] riscv: dts: add mailbox for Sophgo CV18XX series
 SoC
MIME-Version: 1.0
Message-Id: <20250428-cv18xx-mbox-v3-2-ed18dfd836d1@pigmoral.tech>
References: <20250428-cv18xx-mbox-v3-0-ed18dfd836d1@pigmoral.tech>
In-Reply-To: <20250428-cv18xx-mbox-v3-0-ed18dfd836d1@pigmoral.tech>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Yuntao Dai <d1581209858@live.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745844011; l=884;
 i=junhui.liu@pigmoral.tech; s=20250223; h=from:subject:message-id;
 bh=CSLWYAdiw9/p/f2aE/yXFp+1aCvV9HAX2JHCuVxOo5Q=;
 b=MaKr8B+Qeb+49HSAO3AqIztELj+ryAHblwbpwEXmlyUkGDKJnaZk0YdLvkyy42JZIGCeM1y+p
 6mzz2/ppmOGCLCbXlwjsanvwPw7bhJnv4F+tFzzZnK/5HhCw1Mq/3Zq
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=ZRZkOjG47iI+To+oAo2R4KIpMwtz8r0TffJ5/nO2tcg=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_054104_483032_21A76B9D 
X-CRM114-Status: UNSURE (   7.16  )
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

From: Yuntao Dai <d1581209858@live.com>

Add mailbox node for Sophgo CV18XX series SoC.

Signed-off-by: Yuntao Dai <d1581209858@live.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index c18822ec849f353bc296965d2d600a3df314cff6..f7277288f03c024039054bdc4176fc95c2c8be52 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -55,6 +55,13 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		mailbox: mailbox@1900000 {
+			compatible = "sophgo,cv1800b-mailbox";
+			reg = <0x01900000 0x1000>;
+			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
 		clk: clock-controller@3002000 {
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
