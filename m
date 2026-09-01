Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2845C624D0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 18:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RgPHzOfykXTEFs8IvVHXfiq6PRQ4AGOq9sCsOPHAP2k=; b=wDTfj8KF0/MI+G
	hqfkHROk0k+cjti6ySBHDXZWrK61W5nbqGX4vDnnVnT2lYIf+7oC8g2mfNG0Z6YwTKu3z9ObqeOVe
	gb36nI4ooxSeCp860Eoc1bqUGkrhPW7zvXccsCDT9Zsbo2/2WCij8P1jdk/+45vdwGUARfNW9KBao
	FLNMDab+VUV5MG+X+PR3QBSEhGIPuoSaWka67ZcwMUvrDZPERcMOH8KZtkZwxOxqOjSs24HBfyprX
	sYcdczQ0Sfbdf15izLc5ui3+4s06+2mwia9d0GytV6fplyxaC0I2tlQI1abLFeen0sy2ITdW7oA3V
	pSn+THdgQefvFt+7TUDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TSq-0000000CzpY-32uC;
	Tue, 01 Sep 2026 18:44:08 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TSn-0000000Czoh-0v4N
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 18:44:07 +0000
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-03 (Coremail) with SMTP id rQCowADHzz3jHJdq01y6Bg--.19179S2;
	Wed, 02 Sep 2026 02:43:55 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Wed, 02 Sep 2026 02:43:40 +0800
Subject: [PATCH] riscv: dts: sophgo: sg2044: srd3: add spifmc node
MIME-Version: 1.0
Message-Id: <20260902-sg2044-dts-v1-1-aa1fd1a4ec0d@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIANwcl2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwMj3eJ0IwMTE92UkmJdY8s0A8O01ERjMwMLJaCGgqLUtMwKsGHRsbW
 1AOJ6wUpcAAAA
X-Change-ID: 20260902-sg2044-dts-39f01fea3608
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Hangfan Li <lihangfan@iscas.ac.cn>, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: rQCowADHzz3jHJdq01y6Bg--.19179S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF17ZFy8Ar13KFWDZFW5ZFb_yoW8Gr1Up3
	W3CrW3Ga4rtrn7tanIqry0gF43JF95Ga4Ikr13Cw48Xan2qFyDG390ywn3JrnrXF45X3yr
	Gr17XFyruFsIvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [223.166.93.127]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiCRIRDGqWi1k0UwABsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_114405_629568_137C91B8 
X-CRM114-Status: UNSURE (   7.25  )
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

From: Hangfan Li <lihangfan@iscas.ac.cn>

The SRD3-10 board has two spiflash.

Signed-off-by: Hangfan Li <lihangfan@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts      | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index fed3d9a384a00ccfc91dfa1531f799aa397a5dde..e0cd939e742ec349c8b7516c4924d94b9e763b53 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -109,6 +109,30 @@ &sd {
 	status = "okay";
 };
 
+&spifmc0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <133000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <133000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
 &uart0 {
 	/* for firmware */
 	status = "reserved";

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260902-sg2044-dts-39f01fea3608

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
