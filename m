Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E90C83F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 16:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFhAIYLr7blx/iK0tVp2GoZ3kM3neQ+56Ez2+NbgwvM=; b=XM9DpiLDu8AZ5W
	Kf1TafAtT92UPm25OQipAXyNK8qiD1aOGUVhVbJ9ouVw+IkAF9X+9/kCqXoq4zdyFYXeG70C6atft
	tbvVNNir8jr498IwMFKO3U3dVxNqh0d2//RCiNDzEAN6eln6ESDbHb3CUQIaLAVcXtW8EXdgCYr6o
	4LNK+naHmoPTi3zW55SNd7xUiwidKSLR0T1cHd8TPfRPRnHwFCGf5WD7ycVyRguBj1Tpsyj10ENfz
	QhNdecE30Z0l+a1y6WN38eiLgG0tRJtyuaHPY59c+6QzYFsbSEhoW6hGS8CxJ5daIWVlB/Y2DFBQo
	HrqJ4ge0bOciwR3Y2fcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtne-00000000FIf-3mxF;
	Mon, 21 Jul 2025 16:55:38 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsnZ-000000007Ne-0Oi8
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 15:51:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753113083; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L96xQUmYl0cNVfockUxvD3K+HAHnBIZidDEvBUk7jWf+Xp/CgE4KdH6Cte0OnzcS8KyR3BH9Yz8TdoMOMoKQ757IW+8u9yZRCu0g2pCrlxeUwfaj1yufkmauNmXDULpqn7LzmRi1BAfiWsGs2TqsAIQoWy2DAqiYwmFmUUFSH/4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753113083; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NmJkGyDYI14AaMaSvTmSGY4Uxj56rzD9WcCXfn09Yyw=; 
	b=DDhmTpKTenvERLr7VKZ1w5ZXQrcVlMOSZtHn0ncIPYPpA2gcqryBoRATCFGFRz5G+fFHAc/rz7ww/+ebfcInv1izS89t4wSyyoKwUpzwqmARQfFNZVZbLmo5YJyW6Ogasd0n+k7875NjYcmCXQPe8VHV7V0VcRlFi6TTnx50ZGE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753113083;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=NmJkGyDYI14AaMaSvTmSGY4Uxj56rzD9WcCXfn09Yyw=;
	b=En1M0SFokYBhqYYtLEscvS63SUQxamZ29AbxV9kvtX7bFSzjA0FwF3FHqXwyISIf
	tdT3hiAMPlX5dd1rVe7d4HlgfGAdFvn7thO4QmZKYqm0C0eiJjQwWeG4ri8RUNBKXcO
	Q7acHvYayjx5VP+NI6lFwSh2uxVyczjkDV+rZSuc=
Received: by mx.zohomail.com with SMTPS id 1753113081950103.5430234161762;
	Mon, 21 Jul 2025 08:51:21 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 21 Jul 2025 23:46:12 +0800
Subject: [PATCH RFC 06/10] dt-bindings: serial: snps-dw-apb-uart: Add
 Anlogic DR1V90 uart
MIME-Version: 1.0
Message-Id: <20250721-dr1v90-basic-dt-v1-6-5740c5199c47@pigmoral.tech>
References: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
In-Reply-To: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753112991; l=948;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=jNFRA/llS4U5KfG6ULgPecJZNDjUdexNLrl/DkZcBZs=;
 b=lSmRU0jW9pXdSHdptmP380xwUKv0VruypoQOEj1tP0tAVeQ309WIPD4uiUqndvP1UsgVIOggB
 cRfKMRb/cJKDsvtQ2QS4Le1JOtjdZp+K/Xs3VjnC4/NOAqZAl4WISzk
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_085129_196092_AFB1E64E 
X-CRM114-Status: UNSURE (   7.30  )
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

The Anlogic DR1V90 SoC integrates a UART controller compatible with
snps,dw-apb-uart, operating at a 50 MHz clock.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 8f1b7f704c5bc7cb9552b7d4825d96199cbc6c4f..ed00eefe17aa11200e0a10637d4cc10b68948699 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -51,6 +51,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
               - rockchip,px30-uart

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
