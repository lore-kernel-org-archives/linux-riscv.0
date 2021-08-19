Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F1FC4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 15:45:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A150861029
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 15:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A150861029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PYB6m/55BR6LbDbJVd5/2TtKS0eFdJxLORVVfF8c1p0=; b=DuIRp2VhLRvl/E
	fQ6MZTXGb+g5PN9srRX3CWl2KAhu7jnJdIH0UsmOHJLRazsvLxUR65BM1Mbb+5lY7KCfO/Pk3s/19
	dFzY523c7GBytQ4j2/olntDap4pNtH62IibnLKURv0xyMlkGI/VUaeH5g4K9F3WPY97toX7ELCSm1
	3DqAEjv28aj+py5YsBd/MkJUO9GoiVapn5wznozhbuIxtpjxR3o0E1wWtE3nBzj4bQZzNNoE41gQK
	auJ38Y/1HrQmhbaO2vLz3TMkD4Mg74X/7NW7DSycJIvfgKzr+qY9b8UIr/s0Wp+uFHVIh/LzI5p6R
	UxHL+9uqrHC8mS+fLLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGkEU-008quR-Fe; Thu, 19 Aug 2021 15:45:30 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGkEP-008qqQ-1z
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 15:45:29 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id AF247411BC
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 15:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629387919;
 bh=R7D35cbra117D9PxgbQHF85yjpBLQZ8KDhGISFH2tcs=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=vZiSX1PyuE/9tBTRwkHxG21YU4abO1BKVXEsDfVsnLY2VwinKu0LCXDZ16yhGnIsZ
 7tGH/WaBGmG2UkH/vGKFiUkxEGtYgkT/0hA1gPVUbcEDdA3poqiR7EUhFkumEDft0N
 k4CMkweHn8dY0tjWa5HNznyT2XErlWN276JonjrZaoesGTsaDjeDlwFhfJae6lT6kt
 Pi3bxIB9du+z6ksrW5rjXm0UuOzckGWPTmfJa43n2rxKnyplcQbGcL/3vv9K3rmc+E
 74NYDhh72QVRalSAY9RRvR4/BOeijdMYiiLKy5BZA87v9vh1OxRpD/X1f/OKQR35QG
 YWg0soMYdk9fQ==
Received: by mail-ed1-f71.google.com with SMTP id
 ec47-20020a0564020d6fb02903be5e0a8cd2so3043134edb.0
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 08:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7D35cbra117D9PxgbQHF85yjpBLQZ8KDhGISFH2tcs=;
 b=Pc20rcCHSukdxCcxZKKkS/66gE6tXsZxNjpQYdfdYrzTi+1VyH8d8K8JjJjI7a4Dqk
 aUKzuqbbVhT0dhlnjY8qpEWntbZ2OUQMWgwKoHTddjhZY15V9eCyURRJ0YZ/l22a+E24
 wf0vv6bFTUc/l3II+81qv7LMSUNpvr0td5ngqzXcvSxSmwmPpCrgtyv64LqGiCEDLJHn
 q3PMtuy762BzSuCTJZySkxnMqzXGlQGlFBvBofENNFCi8n2eBk5SIJMj83de86RpJv4O
 kGBNUYJW4fq2coPEUOHEln7C8gikJCVekKar2Kdav1hVEwTldxrEPEUxJPMn4YF5CFQN
 zrVw==
X-Gm-Message-State: AOAM531HD0XW7b0bRuwSQ4urmCSWdeAibpSjo5VTbr2ft42Ojb3jq2z8
 xQivmV5vT7m7a3Gxu8uBlnhMSVx1NBdH60m9Wg3AiFknpF3VH86cT+lGvMzggJiwkgyE+ex0fi+
 n5A1MOkF/N4z1+La8ok3CmQHHdgYM3AwXSrcL6Pb6MXBzuQ==
X-Received: by 2002:a50:ed05:: with SMTP id j5mr17338663eds.256.1629387919477; 
 Thu, 19 Aug 2021 08:45:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwExpdLPWOGCIOlhdKLAezKk54YUmCNyk9hkQhVf/OBX+C4Dw+NBvBYgBjE6TzVYrSx7HyOxA==
X-Received: by 2002:a50:ed05:: with SMTP id j5mr17338650eds.256.1629387919373; 
 Thu, 19 Aug 2021 08:45:19 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id f16sm1925373edw.79.2021.08.19.08.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 08:45:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 3/6] riscv: microchip: mpfs: drop duplicated nodes
Date: Thu, 19 Aug 2021 17:44:33 +0200
Message-Id: <20210819154436.117798-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_084525_279257_128A2A8C 
X-CRM114-Status: GOOD (  11.27  )
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

The DTSI file defines soc node and address/size cells, so there is no
point in duplicating it in DTS file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index ec79944065c9..237830583514 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -9,8 +9,6 @@
 #define RTCCLK_FREQ		1000000
 
 / {
-	#address-cells = <2>;
-	#size-cells = <2>;
 	model = "Microchip PolarFire-SoC Icicle Kit";
 	compatible = "microchip,mpfs-icicle-kit";
 
@@ -27,9 +25,6 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x40000000>;
 		clocks = <&clkcfg 26>;
 	};
-
-	soc {
-	};
 };
 
 &serial0 {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
