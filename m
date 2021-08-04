Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAEDC4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 12:30:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 980B760E8D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 12:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 980B760E8D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zJc0UDHk88+sipLUb57ubGCJVL5ovirdj3k4pnZKy/E=; b=w+KLGVY0vfITj3
	XikkEE/MlWStrZHzLa55rMA73h218yEP7ykm3kHn5NU7jr5NupGaTcKy7BVhN4S3rMu78m5JueB4O
	Vfjm9AnTaJib49d7jYjrXrEQILbw5pqWQbEsLcyCR9mKFzAG9fLlFGE9KXYv40bi99rvVdNnWK3XQ
	eqHpjACumX73ObF9JtJTPIO7ASwyv/tmeRsxOtH11HtyM38SY9/I0MBhFsdnCuZpnOuwTnCu38QDz
	eYghajIc5umzVdc511V0vijnDWhKuXrmOnz5adBaUvWtkoCJtCFA+vRsJee2RuyaO8uvBMoyK9t7h
	Qv2XHDVFIyyCblIVelYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBG2Z-005yyy-EZ; Wed, 04 Aug 2021 12:30:31 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBG2W-005yyU-Ra
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 12:30:30 +0000
Received: by mail-ed1-x532.google.com with SMTP id i6so3307783edu.1
 for <linux-riscv@lists.infradead.org>; Wed, 04 Aug 2021 05:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gcr8BhuUlRn9dO5oYZlFn/1npo+Wb2aMp3w+r/9MRMk=;
 b=WHKHoCpXVz/+eBeqLg7X8OOd0zw5SbQ8V8eTxq9QbYyNdg/1UfJBh6/CJxfwEyZ672
 UQ72/RmfGI6i5A2WGOuU23KrfpW2v4J82hxlSZ0STUvMPUMQIuvn7M6aI4VbaBFf8qVV
 LgifWWKRKWB3+iTsuVwNAxZaUY81YATnGteYy/X/9MkyTt0F3yRVSdxeS/4NlTBQcUfv
 RJB+V8LIg7OFihL6w8uUTAMNsLHVv40sj8Hr8RFNqEANKycf6HvGNsOX7NLqKHNpPRQT
 IbgucPZG243C2IEqwZEBCh5kwONLZqMWbNtFHAjeZL6hy8kBIobOAcN7VLMSPzn+7OE3
 qICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gcr8BhuUlRn9dO5oYZlFn/1npo+Wb2aMp3w+r/9MRMk=;
 b=CiYsQYesAAnY2CHs6MdZ7kU4v/X3bWOg+t7WxXCrD7rbm320p6acMrwCdNFuBBft5W
 eqFwhzIuT+8LJRRG6ABf0gJUH2fdYbI6HKGPO8S3PwAE2OhXTEgNlNhKNHNlSZNVyeUV
 SH9RS5gFGAg0wgZe0L7B/JuIl/KkamoqFxw/IaszTDJVEAAL5D1PCWAWqP9S561qiPeX
 7EeVRCt3EOanGSRjnFddMhYekhj+ukaiOBn0/jAgJGaaTTLa/f0gKgbBK+/f1PmvGA0r
 A7ECtE8FHJ5WN8G9SoE4Qmp12SdkKuVxTyjQnSXciUXFikIvMs7qEewqVaYokK909M3l
 iw6A==
X-Gm-Message-State: AOAM530mnNqTrs6PbRFYGtqbe2GXBpjB3gC0c1adaz5tZ/Kuvxa0XdM8
 112aECSyBBMQO/OYgLrNYOE=
X-Google-Smtp-Source: ABdhPJwWCUzOdpguggzhTnudkKa+0jV8mVhsPd0pRn7Jd/RgWXtGu4TEEiyhKU8ZPYkIP/U38Qolog==
X-Received: by 2002:a50:9503:: with SMTP id u3mr31376325eda.135.1628080227448; 
 Wed, 04 Aug 2021 05:30:27 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id f5sm627590ejj.45.2021.08.04.05.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 05:30:27 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Bin Meng <bin.meng@windriver.com>,
 conor dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] riscv: dts: microchip: Use 'local-mac-address' for
 emac1
Date: Wed,  4 Aug 2021 20:30:14 +0800
Message-Id: <20210804123015.807929-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_053028_936150_5CE07504 
X-CRM114-Status: GOOD (  10.77  )
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

From: Bin Meng <bin.meng@windriver.com>

Per the DT spec, 'local-mac-address' is used to specify MAC address
that was assigned to the network device, while 'mac-address' is used
to specify the MAC address that was last used by the boot program,
and shall be used only if the value differs from 'local-mac-address'
property value.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: conor dooley <conor.dooley@microchip.com>
---

(no changes since v1)

 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 0659068b62f7..a9c558366d61 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -317,7 +317,7 @@ emac1: ethernet@20112000 {
 			reg = <0x0 0x20112000 0x0 0x2000>;
 			interrupt-parent = <&plic>;
 			interrupts = <70 71 72 73>;
-			mac-address = [00 00 00 00 00 00];
+			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg 5>, <&clkcfg 2>;
 			status = "disabled";
 			clock-names = "pclk", "hclk";
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
