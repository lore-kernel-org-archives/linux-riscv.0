Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7040AF327AA
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 06:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0Bn7rNwZ4VHA958yJsHU+cPFR2T+VhtpUNCYGKWVmI=; b=taHlk5o/NgI8ya
	yjkvB5h2LqbtFOfd15dse2fDRyshdVEGEIfigJ72N2cjYVM2Uz6XAG7z6qKtRmd6TiYqDDDTti2x+
	5S4XhbjLNPvPk7lZUo5SPcfmTlImLVywSsoDEPi0ZlPMvDpc4hBE/AFqm7J+tPQVwcHyZxjEAJMlF
	76xXhHEg8ARRkZPifflWYV3GFjiXS3d4Z1qvSCahswko1cn18Wygcy1c+wNgRggMlwKDjFaLaa9AY
	3Paf4FTA88wF7PGjitkpalMQ/Zo8fBNb7oT7TL1ozQOn/Ua3qxwEmq3lU/eiBXnVCebM7wuYSQRZ3
	cKLta0mJwcrm/5RI+jlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4Zk-000000086Eb-0kDB;
	Tue, 21 Apr 2026 06:27:12 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4Zg-000000086EH-24jq
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 06:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=IunV+g35Iv9Wif8Qwna4P1wIGXGPiiv
	nhH77S5h3sg8=; b=EdX6J9y4HTiBMUySpQhe1eugOQ72YhI5kFxFAHXJLD0CRIO
	2ILuWwUpBZ4YsVeTU5jWKKB0Do+4guWPdvyAQzGxJcRiMk7Ck48QY2oK8H5Ljqvn
	Ax2i/CGcHOmHWbf0YGqOLPteZhQF89SPwhU8MF24kwLj9u2VMtacYp7N/Qrw=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkNyEudpn5ACAA--.1518S3;
	Tue, 21 Apr 2026 14:00:22 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Tue, 21 Apr 2026 13:58:51 +0800
Subject: [PATCH v3 1/2] dt-bindings: serial: snps-dw-apb-uart: Add
 UltraRISC DP1000 UART
MIME-Version: 1.0
Message-Id: <20260421-ultrarisc-serial-v3-1-3d7f09c2420e@ultrarisc.com>
References: <20260421-ultrarisc-serial-v3-0-3d7f09c2420e@ultrarisc.com>
In-Reply-To: <20260421-ultrarisc-serial-v3-0-3d7f09c2420e@ultrarisc.com>
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
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776751174; l=887;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=fd/GPuODvz6hEyhIIX23mIspVD0bj+TwDCa2egzIms4=;
 b=2i7l2Hj3OGIs9vN1NC2cl2JWvsa6EaJM3B89Sp0O3lq6L/V1p0srR3MIXU0B0TT+Z6dI+9ne7
 +m29PGkjIXOASIdgDWTJQ48tm4Kgovs+hTxcjjGfIT9uRw7dJwEBGz7
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnEkNyEudpn5ACAA--.1518S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKF1UuFWkJF48CFWxXw43Jrb_yoWfGFb_C3
	4xuayDXF45AFWFva1DAF4xtr1rZF47WF4rCrn8t3WDC34DZa98KFykKr90yw1rKr1rur4f
	ur93CryqkrsxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQADEWnlor4ACwAHsP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_232709_227780_C2967D81 
X-CRM114-Status: UNSURE (   7.21  )
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

UltraRISC DP1000 integrates a Synopsys DesignWare APB UART, but it does
not provide the standard CPR and UCV registers.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 6efe43089a74..f84600f66df8 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -77,6 +77,7 @@ properties:
               - starfive,jh7100-hsuart
               - starfive,jh7100-uart
               - starfive,jh7110-uart
+              - ultrarisc,dp1000-uart
           - const: snps,dw-apb-uart
       - const: snps,dw-apb-uart
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
