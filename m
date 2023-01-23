Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F48EC05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/xGt/ajbiVE/KRdchqMRBkkwo2mb1xMxkREUNaqHks=; b=InoSvM5ziCE/lm
	AGprUaYxxPq8wGbCMzqoMAVaELPoW0gkhCrhZ0xsS5rcHOfwHA35OA6yM40AFlqvndINeOD1AqjbP
	ZvoUN81x2aDiZpcbGaqH7+PhMOPt4gtFqwEVhFGyls0f2qKJJAcdAl+1TYRIdPq2Kt6ocUfil40+j
	howboasZHHVmxKRJDppQ34Iy81VR7NAaVI5PpUhpr2JxNxQ3x6SATnLH4dNC6oyAEwBmQvsC4KsiU
	aJUqgBfbPFhbk1DFlHrcNLcCsel+yAw1aB7aCdLZSuLB1Xq6TPE3iVVZVi/7Tw+0xqHpqZAkOUOSp
	EmZZBIvWcrqIonODfkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzX5-000UTB-8b; Mon, 23 Jan 2023 16:18:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzHK-000Onw-FL
	for linux-riscv@bombadil.infradead.org; Mon, 23 Jan 2023 16:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=43A1eeWrpE679NQnTX4HGXlIW2NbDWo9ZcYcCEyQGv8=; b=ea8AeUIYD3By6X2dOeM/G3Eh8g
	oOsAh9hCUYzSjTKYYTAHhH1kApdPhjUISFiQml9AoY1zfFTJZCUUNRXYLyrnbAD2Zr/k0pgR89nAk
	RvysKcgCDXF5MGpJzvgMrwndehNw9E+5eVbYmUI/OzbmTmQ+KpSxH6PAPeQ84xL43N03JfdZ1VEV0
	BS9LVMSbVN4tViKdtun0U34NzM7mHcNls/6xFv1ueRj7Mkx9fuD28HSP6OQDiB84cAKYm4gaF4tTd
	vX/Z01q/kJ0sVwzAI9FabEdML/mZldQb3FFk0ZRyT+WRCx1yQf/jRDJoE9Pt2pNI3Z8noM7nbT+TB
	NB26Qojw==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pJyV6-001ZCd-0S
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jan 2023 15:12:51 +0000
Received: by mail-wr1-x430.google.com with SMTP id n7so11121918wrx.5
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 07:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43A1eeWrpE679NQnTX4HGXlIW2NbDWo9ZcYcCEyQGv8=;
        b=FbKY5x7kOocmY+G15u1Rybl6N5c7s5hINmWMLLUIbiX/Ia7UVazwL9ZlxHQPrvzNe0
         hmTthuzRAT/WvX5fVZYCvGgbezljFwp4yEHJf/7w0iWxS3KE22I3LPlX5YWIKd5EZY3P
         NwyQCoxNJQxTUzsgP37xTwwuxTNRiYeM+5Kl2bv84O+8PY4QJxP0qjtbyqXL+BoD54ue
         GmriCtjqim4n05LitBhAPlA5IsdCIQ8OfYkbsLvk7ijkAi7eUJ51rjKr/zDQRqpI6yXZ
         ligCskz7bKRdcY2CX+Lj/O1lLGNoGiZp0YCls3ydkJtQdpsBLTnb3UecqVDiGxN/CHsx
         fegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43A1eeWrpE679NQnTX4HGXlIW2NbDWo9ZcYcCEyQGv8=;
        b=0fuqvx5xa2ALQW/dB7VLXefHqPRUtRFsjsr8HlApBK2GCyPAnujsXhx1WvdMBtGscu
         L/HxhVRPwuV24tlsDcLQIWRXelJmDb4E3+9YWM0EUvMrTK/EADtrU8QGWYf+teDDru3E
         FIfTXkh8FjOH9uPjVsTxi3XDu9KOX5KUd8oEvowDxt0K2Jn40yrlAJnVffeRl5FbTZsK
         8eXssDzkkV/T2Qa9iz8BzrsWb7sdW2NdQ7L3dB+o3z7xYD0yGppODTZJtw1Vqu0upnxE
         GbKwlQdcWGNnaTqOluKghlAJw2kR02qSb9SoRXTOjjW3sifmLMka7JuFQD3FdTeS8y34
         t65g==
X-Gm-Message-State: AFqh2koLOXzKNJNY3ywq8+/iOF+/pSKs2jn0zT1L5ytTCe//cYO+0f+G
	7/hqUnWL4rehycW3zhNBF+aEFw==
X-Google-Smtp-Source: AMrXdXv89Fdo1L5qZYdd8EVxzoXYPQmn3ECLVZ91hGdnIDdEE5C27DGKNmJUU86YLBT9uYnmMZ2p9g==
X-Received: by 2002:a05:6000:1f14:b0:2ac:5b46:9c85 with SMTP id bv20-20020a0560001f1400b002ac5b469c85mr21246802wrb.68.1674486795939;
        Mon, 23 Jan 2023 07:13:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	- <devicetree@vger.kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Chester Lin <clin@suse.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Pragnesh Patel <pragnesh.patel@sifive.com>,
	Le Ray <erwan.leray@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 03/13] dt-bindings: serial: pl011: allow ARM Primecell properties
Date: Mon, 23 Jan 2023 16:12:52 +0100
Message-Id: <20230123151302.368277-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_151248_345668_C1D00AEF 
X-CRM114-Status: UNSURE (   9.23  )
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

Reference ARM Primecell bindings to allow typical Primecell device node properties:

  broadcom/bcm2711-rpi-400.dtb: serial@7e201000: Unevaluated properties are not allowed ('arm,primecell-periphid' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/pl011.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/pl011.yaml b/Documentation/devicetree/bindings/serial/pl011.yaml
index 80af72859876..9571041030b7 100644
--- a/Documentation/devicetree/bindings/serial/pl011.yaml
+++ b/Documentation/devicetree/bindings/serial/pl011.yaml
@@ -10,6 +10,7 @@ maintainers:
   - Rob Herring <robh@kernel.org>
 
 allOf:
+  - $ref: /schemas/arm/primecell.yaml#
   - $ref: serial.yaml#
 
 # Need a custom select here or 'arm,primecell' will match on lots of nodes
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
