Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4581C4453A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 20:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDZzsZlqbxtzJowmzqoXffhwJr5mPZFUHxzOhj54zMc=; b=Cy76PNiLGo7Cyu
	JAPlOcpYwNQ2Ui1MpIXIRiaoRUz0r3IC318q4DyGcqTUlrdrPtPPs+OSUIjf66eNXHNMRQKE9gg/c
	BGS+uFnBwpGhZiDEJNfcmZ+/JyFIv4vhQ4cXkKv0nTwkinE31JKmVJqqWxz4/bs4NoqHBIDk9459k
	H08vp3pUX/LYabqtnNl7Xq6jlm/XYSkdLxzEWicGZHbZePaqiKNpQNutxUSJuCgfQMDEczTpXP55s
	7nfV7wV60clYJ2EOcwF+kVP8OoXZkElNScaBW4ueAXM6TegSfQVZ1oE7DLQaW5jia/RAjB0AoCdQu
	7FY6DWSaWBO0nIdjHRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdbQ-0000000CjSz-1Y9x;
	Wed, 22 Jul 2026 20:31:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdbN-0000000CjRP-1aq9
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 20:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784752296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8Wg39SYXO0JHmLOHU0723C4lSHO7cWpCqGrL2pJzpY=;
	b=bEb5yDXEbgQVCrPqdwNbSezKMebSKTPrNnWGsz0NV8pu3pfRV7SoW55Hi1Jmvhedit0KHm
	ERGkY3Kn99pVuIGOl3RU38EsXEUWE/gjOHpj4uWoXSEA2oJYAoqiVI4LQaC6bOjI8eMtdN
	8eXXdZM6B3wcgLNpPFADSQ/oDvCx+Ak=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-5wCegVwVP_qFwWrGq0U99A-1; Wed, 22 Jul 2026 16:31:34 -0400
X-MC-Unique: 5wCegVwVP_qFwWrGq0U99A-1
X-Mimecast-MFC-AGG-ID: 5wCegVwVP_qFwWrGq0U99A_1784752293
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e6abfca68so158030947b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 13:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752293; x=1785357093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8Wg39SYXO0JHmLOHU0723C4lSHO7cWpCqGrL2pJzpY=;
        b=bhvB99Xn12snf5vKFIteqCX159ybS71JPeVSMqSrYF/cKp9NZnSHAJJXrNN+HMztbp
         FlL0u8LR2IHFAq0S/G0u1QEHjBQ/KiHPY0Bpl2hHHlusHAUtNN6Sq0duhLImUwEfQIY2
         Udbju8ZaYB13ZBzrUo/tj6hOwMuC1F+b+1/9NznbxjvixtNhyZjj6CwTabcuwVmhx63B
         h1FA52X2Ev0V42Wv0RSNHm9varXTTLiu2XnoOOPMzgHysYjdWOtCi+9ND/tnOMFagILK
         clbxCFTmycFZf/0VpMGT5onCZJkRxXQsCLCadxZaPvtGBqgbl1GVyjEiLn3N+vs5mhAT
         6afQ==
X-Forwarded-Encrypted: i=1; AHgh+RrApGAutm0uOLyiIwxL9xSYMnm1FZ7m/RG0lTWE64HIxoByxxXrARW8ctGd2WJ9soW9+SKvXcr87twVxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+Y9R7jQUN5ldAwNAxdb2V5qLMbjyuKYXGGQcgLwaTF/KFbhCL
	GVsfmleSmQlhmdW+FE4ZzfHyL6Q1/YWe5d7GSftPbBJYYQaapZ2+PntahnZ/+JJNKPYVOITXWYd
	MOGkHyivfo1rncJM226PmxGSetBKRjDKLtoV6CDvR8TmvKkMC3wgpMANJEPG8ChbHSu8cvw==
X-Gm-Gg: AR+sD13/pA1LL1tPv1SdQef0d0xy7JRF/JhMUdpx/JGNRfhsouKys7G7IIRaIJmJbmj
	KVorsPT3x4f7kiuYMTud9++oyDJmkOjNTCjy0odqtY/mRwbtWQFpoRsrOJ8JJV9E7Mi20DRiDem
	JO29AFDfLp9/maayPjwm7LulHAcAr2Sx9/+8/tZei182WM1L5MHgGm38in+dBVkZMzc/sUb++Ts
	H04M2aHS7/VAQLWRpFNgDsNn0qx1l9Jjm6cE4uIe3mPUMsWfRN40ao/RDUTB+tHIPR7iZTIMLoh
	vwSUsCWv0yKDd6xiiNRRkvJadjxWGGTEzYfDUitvLP+R59wILGe+Lw==
X-Received: by 2002:a53:df51:0:b0:667:c93a:82e6 with SMTP id 956f58d0204a3-668a4cacafcmr40421d50.44.1784752293185;
        Wed, 22 Jul 2026 13:31:33 -0700 (PDT)
X-Received: by 2002:a53:df51:0:b0:667:c93a:82e6 with SMTP id 956f58d0204a3-668a4cacafcmr40395d50.44.1784752292656;
        Wed, 22 Jul 2026 13:31:32 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668906d9344sm1923573d50.12.2026.07.22.13.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:31:32 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1
Date: Wed, 22 Jul 2026 16:28:48 -0400
Message-ID: <20260722202848.1817988-3-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722202848.1817988-1-jberring@redhat.com>
References: <20260722202848.1817988-1-jberring@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bLJofX1Eg-UAqyQtArQUF1dnHlaaqXBGgOY1Qhtn1Mg_1784752293
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_133137_497633_787713D4 
X-CRM114-Status: GOOD (  10.39  )
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

Enable i2c1 for k3-com260-ifx and use it for a 24c02 eeprom. This
eeprom, unlike the one connected to i2c2, is part of the carrier board.
Some boards do not have any data programmed on this eeprom from factory.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 15 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 12 ++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index e7f76cd24b903..a5c08a7a781a9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -20,6 +20,21 @@ chosen {
 	};
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_1_cfg>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		pagesize = <8>;
+		reg = <0x50>;
+		read-only;
+		size = <256>;
+		status = "okay";
+	};
+};
+
 &sdhci0 {
 	pinctrl-names = "default","uhs";
 	pinctrl-0 = <&mmc1_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 5b9045e014345..6482d24be1394 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -78,6 +78,18 @@ gmac1-phy-0-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_1_cfg: i2c1-1-cfg {
+		i2c1-1-pins {
+			pinmux = <K3_PADCONF(54, 5)>,	/* i2c1 scl */
+				 <K3_PADCONF(55, 5)>;	/* i2c1 sda */
+
+			bias-pull-up = <1>;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_1_cfg: i2c2-1-cfg {
 		i2c2-1-pins {
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
