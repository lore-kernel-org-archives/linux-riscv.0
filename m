Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4ECC4452D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 23:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQ6QzxPnRxC2Qmv0zHHutDMjoD1Ik4dVz6tUxrgLdlU=; b=PrnT6NrCVHZzTw
	hzQq9Yth6HXVrjhoFFhbqadjw6emplfAL3ugMDOaYuBt8dSWZDVCD031eUDznVQUAC+AglZMVeYsg
	puJbBo0jnFjVltvCX6TpccQP67FDp9UM/dyeFYv7H4V71e0T5HdbPq0BrGuc+eytLzEOt9SNeG/8y
	JgoVP5Kvph79ie6u2s3NokEDxVhgWwr2t2tfO3HXRvuKlWosLiEw/z7HfXTid7EwM9vp3DWZv+QgQ
	VfLMcsyMnQ8HdBAAxi9rp0mR0T8M3hSAHj/rvIqw9p9jegJIW9Vhj1yOvSGfnqvBFiRDU4bkjDPPp
	SVS+EgKnTXf+ompESx5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJzf-0000000AazT-3a8j;
	Tue, 21 Jul 2026 23:35:23 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJzc-0000000AayE-0gWj
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 23:35:22 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ceeee8c46bso22323155ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2026 16:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784676919; x=1785281719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIKbYQezXfRqiCRbFbgZE6r12ftiEK/BOxcKH/SDpe4=;
        b=LTI9FIA2N3tYJ4qfLHwVUXPQw9WOk5PxfiQiicH1QYH2MoVyLQ7jGhtZ2Lio1PYgSD
         te9qRJRuMyxAHJWbm+s2YEPOScZk+y09PTwKOf+SLdLnMpOoF7fmlLqWux/PcQrJ4033
         gKKwT+JGNqz3U5G+JpFwlx14NNNyy1unjc1Fm2iKoPhY3k3so6YiF4IsYxOKU+KQeoQl
         qBd2lER3U6Sh2MrY1ptGX/XeGIbLGjQRlOUbilahU0ec7Ia3pIuQItIcyAy2nr0CWojX
         JE/rtbm+KXXhZAPdzQC9PsxQI96RuBt7OObBvoH6T1dRvTBZTrupgS0SKlFL1kbAiR0S
         QjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676919; x=1785281719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIKbYQezXfRqiCRbFbgZE6r12ftiEK/BOxcKH/SDpe4=;
        b=SvN9dhMzLCPjXGwKGZGnF4gi+0V2EctUddszSkZ+xZigVmldboV00kNLl3Vqwe/mLL
         RgYwenXDAyILzrDEw/MLTA/Yp+JPG3fRKFG4QX3LZGrz92RdIxFpQBU0ZVaHFumG1Uo1
         fMHfBttzziNB8meU9Yf0vR2pgfnqgc4OTC+6SjtGYYw2WSUzNuv5xj5IZLccB1KAHEXs
         sip/+9fW+hFSiL8blDAs3qjhnbPzd+rwiFjLPFkXjVTxX+YVajaqgKRj4j9osWLmOxbJ
         zk3rtPUkVVyRe0PM0DIWY7zTMeW1td9heDn7AeIulXpESVwY51CDUprDlYQX+P5EyaLF
         saEw==
X-Forwarded-Encrypted: i=1; AHgh+RrT8iW7HUwekvODslCk80j9EXW9OT1lPwUANl4ovhY/asw6Pg/j0VFj24D/nbmdXYUcdLH0eFFAqBBupQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4yULioL0RsrgWbvH49EgyU8Uh4/INwhMtIJk+zohEbhHqGwTF
	fhkukVDwDpTtnA8smkT3I983K8bxz8aufmbrwTShLKteyFVRa9cvChIK
X-Gm-Gg: AR+sD10s232qQgG4kg58yozqNQBJgAsDvENwACQphUpH2yP70w2psURJIHCO0oFsQ9V
	EDouOfOFXQBLEU2RkiQmya3YFsJV360LxBBbAV408YbRvBDrGkdKb07UqznNG0e3m7l2Wkbm+Bh
	9KOjrBrcF5KGoa6uKWOtWn3RYb1nkPR6hQBlnef+yFg+tCxtkxv9ey2uXbNJwvapSHlQUm3L39F
	A1i6g5DRgPdkriHK2eyHJxRSkZWUuStyEnDAxvuQ9ZuDbMVGs3B9z6J3eBuLMidkN/FNNz7QQPv
	5afW0GkLypUaf/PLMeITCxI4MwSBHRkgKbuf4jCG4ezLei6aZSArQDG3bjQLIrzgnr2atgzupUC
	9Gh4jEjFC20+7yiZPZj1wVrgrraypWIVUmSjdpd82DqtPeVPZGYMruF3kZW2tKrzNq6XHUgixAU
	8D7Ll2N+dt6hfylIEE/JasnS+ej2c7vDR0G4n1HOmZag8/uuN3AsfgPisVKateNi+TlklV4nhFl
	n1K7Zkp+tJDpNlk5J7zlZ6aW38kxR39b1iB7nBL
X-Received: by 2002:a05:6a20:9c8c:b0:3c3:5e14:461b with SMTP id adf61e73a8af0-3c40fa2d957mr3995483637.5.1784676919255;
        Tue, 21 Jul 2026 16:35:19 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ebfcesm245353a12.11.2026.07.21.16.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:35:18 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
Date: Wed, 22 Jul 2026 07:34:43 +0800
Message-ID: <20260721233452.112204-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721233452.112204-1-chenyou910331@gmail.com>
References: <20260721233452.112204-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_163520_975806_26BE39B6 
X-CRM114-Status: UNSURE (   8.61  )
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

The CV180x/CV181x family has an additional DesignWare APB GPIO
controller (PWR_GPIO) located in the always-on power domain at
0x5021000. Add the node so that boards can reference GPIOs in this
bank, such as status LEDs.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
Changes since v3:
- Move the pwr_gpio node to follow unit-address ordering (Inochi Amaoto)

 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..8bf67ee4eca5 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -448,6 +448,24 @@ usb: usb@4340000 {
 			status = "disabled";
 		};
 
+		gpio4: gpio@5021000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x5021000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <SOC_PERIPHERAL_IRQ(54) IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
