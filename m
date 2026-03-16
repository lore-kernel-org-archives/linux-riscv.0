Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C91BF30297
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 01:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+2AbjXVDZHzkxzJSpvsKZjNC/MFMvqbdNFfBqHcFO8=; b=RwZ92N2KEa+T8m
	SdfqQcG9tdRmmArb8ILDqpyD12RbXa6FqZVpV7XT/zUtTeKivnbO0gkwyx3egq/S/LMcEByOS2gED
	JT8Z0zI7s/RGJNegOpYlkUPsbsGb/HM7uh0roKXWB1lGQi1t1HG1lmKKVtG7pVguIomnIrdI/5/Rt
	ZgOkcBwMOITbjRrZquySLd2jG0m7vYGXEE/JDrQ6dHk7h8kj3t2yZEvM9svWo+z4tx16zv/l1Fv1B
	KEBupFAvDX6OcZ39mLxp+XqcOZK+8MCu14lDeeYR5kH93JFj3AI8LYqyIsI121/1iH/pk2Gxfz3dc
	BN8mqMvm+upYCkan67tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wuD-000000036N1-37BK;
	Mon, 16 Mar 2026 01:38:05 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wtx-0000000369I-0Yaw
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 01:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=rQcagALQLeTz5tV/mHsK9LJ2EDyVuBD
	9zblixho2U4s=; b=gQcu1I86NlcNeVyC7/pCxe7jrEBkA2Xr+0/BuvsWkZgd9Jn
	UXGO7osCv4e4iIiCPXtwz7WtB2TYdlneUSeq02tYCIuaFUUxqW6y06DWOnk9PKsa
	H1eViEXdK+WpWnQGlc6NYojz0nmOPD5hq1YfivC+t5usbT1MSFLZfo558Lv8=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAHtSQNX7dpnx0BAA--.1023S4;
	Mon, 16 Mar 2026 09:38:22 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Mon, 16 Mar 2026 09:36:19 +0800
Subject: [PATCH 2/2] dt-bindings: serial: update bindings of ultrarisc
 dp1000 uart
MIME-Version: 1.0
Message-Id: <20260316-ultrarisc-serial-v1-2-c464f3e933a5@ultrarisc.com>
References: <20260316-ultrarisc-serial-v1-0-c464f3e933a5@ultrarisc.com>
In-Reply-To: <20260316-ultrarisc-serial-v1-0-c464f3e933a5@ultrarisc.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev-5b4ea
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773625052; l=836;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=Uw0NGiz8x4PPMad9fzhlyBuyNg0h3JSAcYi6ECTRq+k=;
 b=s+JtSpDbcmaK17G0/yU8VC7gTIcJFnKaGOLgO2FXUD5dtzrE6bGkkaYNLbcbG8yB8WBMnpm6l
 aZtwv5rVNFfDEmSUX1rk+RHdH5nZpYSxjwqVghRDcwQ4898OZ8Bcmi3
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAHtSQNX7dpnx0BAA--.1023S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr1xurWkWFyrZrW3uF43Awb_yoW3trb_Aa
	s7uayDZFW5ZFyFqa1DAr4xtr45Aw47uFs5uFn8ta4DC34DZasxKFyktryYyr1rWF1rur4f
	Cr93CrWqyrsxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb9kFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY02
	0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7VUbH5lUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAIEWm2TAkAAgAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_183750_178550_F12F599E 
X-CRM114-Status: UNSURE (   7.04  )
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

Add UltraRISC vendor-prefix information
Add DP1000 UART compatible information

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 6efe43089a74..0040ed28e35b 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -78,6 +78,8 @@ properties:
               - starfive,jh7100-uart
               - starfive,jh7110-uart
           - const: snps,dw-apb-uart
+      - items:
+          - const: ultrarisc,dp1000-uart
       - const: snps,dw-apb-uart
 
   reg:

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
