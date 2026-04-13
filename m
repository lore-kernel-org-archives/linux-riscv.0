Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E8CEBFD0A
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 07:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y86gSPUx0qTpqLuPjbTCtDWX5BTfL2GxoJVrdRh6FA4=; b=pDhwPVOsPI1l/a
	MC6TlH369p7SETyBDOGwTxjTY2AfcnrmjYJmsj8MwrAL270q/Kj54W4g2TPG8+9rNTivy4LEcYQfw
	u3ZUd60hIQHRn1KtmeZJ+HgzPAv2Ng4FiX/HDNr+hF32ogwZAeYV/UkJq+LF7gV1qbc9so6WY+9D9
	d198jPVVU56kDKMeNw7LnjxD6hQ9E4INvg5twG+dnCoR9WtQvRWbagyWJntvBrAD+eNe2RYOaolfN
	hFmLJQwfW3/WZnnXhwQoh8+cx3T0HNaOUw66hDM+W9+MazzvnzoizktP50X/8FtLq9ZxohzdgQPY8
	x+V3zRanynq+kMHUrgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBh2-0000000F8mF-2JIQ;
	Mon, 13 Apr 2026 07:26:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBgz-0000000F8kM-27CW
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 07:26:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so51208225e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 00:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065203; x=1776670003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgUUdQtr/fVKD3Ff4J9UbF4I4wxaToLEFfaMYOrzMgY=;
        b=KgyCkT2Ied/Ek2undT5QT1a56qL1YGoCF5OoHPKcaGPFb60wnLrsnqC43hh5xxJFHp
         lCojQdXwWxsJiaVI7vNAePj3UMyutSKDzmWbwiHT5DjKmcbxuQGCtNo4S/C0LAQG1xdr
         FcnurV8+BNewhuUAJqmL9JaksfUc7j9SfZ7bvFNu5pQIbcfN67RlpDexdYhRt9RWxLdd
         uRoSOHu3g2Ewwc7fBQyjS8UUcYA8uhNdvkmm/+cGdZIWb8Xtpe2n62+qkOMCyzz2hmfj
         hRuCv0dq8nRLQ3Tu/X0vY01gAPWDFNaNZpIDZgKN+5bnr57yI6XVNSGlqoIvl1iyhn1v
         8wBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065203; x=1776670003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jgUUdQtr/fVKD3Ff4J9UbF4I4wxaToLEFfaMYOrzMgY=;
        b=l1mNwbfdRmAxTsbolZJb3wKVjRf4BX1J97wcWHJQGuga0FMcSHpZx4WJla6hMMJaKF
         EBxC4f5Lkka32HYm86cPAoGNGB1Z4V7zsmxcj2W7z1y2yxIRC2ZyGmWvqs55oK7fvIVz
         lxLflIyZXldl3MG2g67gqAkKdmQSR3jfg61AuL7AMMbSOldvR1KoK7cy3EdsWfEtvKma
         cbAjbx5KKZhwoT28foqQXOUk2Sh0b/r9M/P0RwKp96hWC8mKpWWTqz/1SDFGk51rkgoY
         gDqVDZQER6KOhAbB9j2WDslbJ7dwjhiVXd7zq0NFc6Dg69+CER00pHcWbp/96/Vi3S1n
         RX9w==
X-Forwarded-Encrypted: i=1; AFNElJ/9oN1yQMrtkX3arrfJ37y3IzWgr0aquwkCnLfvPB6/9o2e4uaXjdToGcROLaFW1aMGaJWqfcjSJBWGwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YynM3Blc+MZSbyB5BE6mVJ5mnZ2XbqZLq9G2HA03fAttaV5oycz
	4JmpKWe9XOsRhwpGSmAXL/9PCefS16ldX1Zt3L8ZDktBqq6oN+A9YBbv
X-Gm-Gg: AeBDievEQT6QH3OOt7yFYqPPYAs40VmsjxUIwz9WgzOt7/XLukVjx7sXCS0c7voKP+Q
	sSis6NbH8ZoMGRxSW9F+iqxHG8h1X4ux+lgevPL7fIw8q5KQhj1SH4oU0keO1r56zBUnu+KQzdO
	amoBzKwVczCibzGodby0FRcOrpK2ljYp4zM84HFhbyXi4ZmyMLGyjAsClTS1Yn62Eck2xqYagcm
	4sKpv7nOdym7oETdUg8ZCdWsRjAt4mW9UVoijDqdF9yqObaig8nHboew8gVX5XR87xOrBbHflgt
	5C7ZJ2TsV6cwhz/mLLwRKQ1XAUM2FuwtTqOyUVRlRbKBE4EaYoU+i4MlNKFiVj9Pogf6Ef4h5Xh
	NFBSTA+F+axnTeF6JtqE0P/7mU6hUY6kEgzQtCbG4OFIN7Oq65n4Jisrcshax1ErBf874Zvk8V3
	RZh3qT/I62WCKVtgIpv3NTlyw6loIEOSplUrYwLQLVW80NEDJfXgWPLVyquhv10A73
X-Received: by 2002:a05:600c:609a:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-488d68a10d7mr175221425e9.31.1776065203465;
        Mon, 13 Apr 2026 00:26:43 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488e4d0ed99sm85734235e9.12.2026.04.13.00.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:43 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v7 7/9] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
Date: Mon, 13 Apr 2026 09:24:49 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-7-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_002645_564924_279C7C55 
X-CRM114-Status: UNSURE (   8.64  )
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

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 9c417a483f6b..95cfb4681ced 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,22 @@ aldo1: aldo1 {
 		};
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
