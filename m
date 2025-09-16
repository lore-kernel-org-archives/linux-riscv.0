Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02B7CAC598
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=925XHFZgqFVIcyoW02GMPcDQl0cxHp2PGIJrlLG1a5s=; b=nvwKOK2rEUshSr
	YdVUUdEGBQPGR0Wn5DFPJWhTvU92v73U1D5G1aXprhKUbUM7lpOKtmKjMipf02dhIz5MVffnBpHsJ
	bMq2kSfAEUi6cDGY+GV4IAG6ABllTFwYW/4JfumBjoOdUdExjvVl0Zg3yWQ340dE6fbmBlQBucCr0
	gxelTzppmCpsbZ5Jws7qH77Uf69qRKc3QYkP6gluGPxCYir0CDrkUWZLLdYKh2dmWhXKE0xiBaa4D
	w/lpGAcaqccB3AMgcrjMXYu7bGMfIWLNqifwl083CNFhT7fLeVDBbFNHdJxLg7cZ6VY6vuq7K8t3j
	SCWSPsgYHBtqNjHQzQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVeG-00000007v6V-1y94;
	Tue, 16 Sep 2025 13:23:08 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVeE-00000007v5w-2Pb1
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 13:23:07 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-772301f8ae2so5059945b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758028986; x=1758633786; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyl0BpQ16/PyZbIlinkdVOcrBnbxP1cm62TtUJjokW4=;
        b=Xh22b+oJrP80hXdR2H1vO2dFroaY65XafhKCr7fiJ4dANry0UvQwHB7YFCujWbbAHc
         WcBL5vy5g0aMJE4QC8V+wjIPTwATGR9Rg5a0FA+IdlnZsjuKYOnOdk6JJ6A6IzGE87dS
         XWTuUaGk70UIyO8W5HEvlBaBZBK3FKYzoOv+fW1rIeXciEp3o5m6t3gGaubeTscudcpN
         tIqOijNf5A1+qisN75iPLLjFXprbIWsO6hCG25Ell/mZN8X9jkp5klJoxBDw1dXvCFD4
         adwDrqNy6AhVrp2iAfYk/4xF07TDW7WXyt9Bm/Dbq8uTcdCLLbeykNhISMq7ThoYiP61
         nAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758028986; x=1758633786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyl0BpQ16/PyZbIlinkdVOcrBnbxP1cm62TtUJjokW4=;
        b=u5LUhir3MrCS7y/xdrQ+HfCq6wZRL+RgPnqWY48YtME9CCVqiY50RKIWxU/zl74pDc
         DoHe5p/EeuIZk1qmg4VimK7RDucpaXDx+vbErV5E8Qt++0nXcJNUwJ0cEpxBQTjDOejJ
         IHKx6eJmgZhhLom+2R7qQClYmkuSSRg88gOEfLF3gjrTqTNee68+9+Y7CrEUc/RAv2Wx
         5p2lHGtsrLLIpWPftnOLqqgVnLJY2iVCQgtP/B3ToSWh2tivxx7eusGHpOu1jRt0N+Ps
         bKHT3qSdfAzjyCu50RF5QHDlUII9fXbh0N6u8TNGaEbfgUXROsYd2a5SXc9vs6gOjGqb
         E6Mw==
X-Forwarded-Encrypted: i=1; AJvYcCU0t4gSK4TB660ZMNCcUH7VEzo/zXrRtOMv5cNTy64PHdMrsdGjTV0dvEgb2kyLZ6IY4Pe6hKiIcdsKPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvFXfLwqq2s2qLwImZ4UbmgTdyQXcWt2VBlYPFExX422kzUHyB
	JCR8Dr+XTGQboXwdTliZBcIIuDsGHhGrlGRMeNV+Y73lbbBpHUd8eUoJ
X-Gm-Gg: ASbGncsjB7fYg/dBJunOyoQNdGqU1A/md6PQ3umclMT6BKmxDDD8b+A4ZsEp2tCMc6N
	sctJOIFC/drBh76SjvQaUP/Qa6e+9Q4t00gtEM9wLvdpe6wHnBY4EYI/cvJC3z2DYUd55jRt/56
	GhNmBUMfQHF8b9yMMdG9fzOWlyaKOSC3sezFrx5tei6jIMZC9TpjTU7BbtDs/OLbuHeN9AnYpJM
	3269vD6ue6/dy9VfxaCgM2KjkGpqxcnyJde5sRIFYtUiM7yQPusqReaUx5QqSP8RRwY0ETQ1878
	225Zj/LAzNOMQbVhcEgWx+pmNibEOE87BBt2oNR/YaY/ms4mwYUpR2JpRjMNIIGspa4Am99Ovrq
	akovpZXlaKYu5xrEi7ZBArnSw59+cqg==
X-Google-Smtp-Source: AGHT+IGSbUcFgUuRvZhaEbQGDXU6wqj1uhsdBmleOb5RXYY5OoqndPwdDpqY08h9eGK8Pj5YxrReZA==
X-Received: by 2002:a05:6a20:1594:b0:243:78a:8291 with SMTP id adf61e73a8af0-2602cf10c79mr22060394637.56.1758028985340;
        Tue, 16 Sep 2025 06:23:05 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761562f25dsm13277310b3a.74.2025.09.16.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:23:04 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 16 Sep 2025 21:22:51 +0800
Subject: [PATCH v2 2/4] riscv: dts: sophgo: Enable SPI NOR node for
 PioneerBox
MIME-Version: 1.0
Message-Id: <20250916-sfg-spidts-v2-2-b5d9024fe1c8@gmail.com>
References: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
In-Reply-To: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758028972; l=1355;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=LW8gKY2G7VDUyUL5o7Bf03DIXlO30RMJvYfW4F5X8pE=;
 b=LmgXboPjMuiz3VPvrfkLEdDdVW0rUIoVOP3joiPKFCvu9SUeNA/yoJgD6nm7b0aJ96eV9Rtb0
 +QkVfFRRv0kCq67IYvjTluKfTWicee+PH4Ibp9rjh8E8H/WzMTholA4
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_062306_623864_213AFDD8 
X-CRM114-Status: UNSURE (   8.10  )
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

Enable SPI NOR node for PioneerBox device tree

According to PioneerBox schematic, SPI-NOR Flash cannot support QSPI
due to hardware design. Thus spi-(tx|rx)-bus-width must be set to 1.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index ef3a602172b1e5bf3dcf54a8cacdad5172b7f50e..93fb493995522a88d61de67fa570631c01807718 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -138,6 +138,30 @@ &sd {
 	status = "okay";
 };
 
+&spifmc0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
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
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_cfg>;
 	pinctrl-names = "default";

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
