Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C984BC4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5sXeJMuHYNVg2ut/7hwszbK1isHusVPx8W/hkgZj2Y=; b=jJs7/U415lOkm/
	m2/70DNReLRHX+CwJaRvlVAxdSFuUK0FzIHsYKyffQ1LfavdS92MMhIxgoFCKYQYGD9CdlE4Be8o6
	hvixfOVGT5pqfxGXwuAg5kuxcTb8y23JQrG3o98VRvmnvi/GCHRe5Qi0dLSKbYyN7CY5/tvDWdEVD
	PHmaZk5dUB1cY15f1yQDlsOx8olC6xr1sP+ZQl3t4bYsJyj1mB4bLyKCobwt3xiduXTdUCXTs0oJz
	IbHx8Trr8Yn3cGqU+6XQHbai7sJY9YsbHZtc/jJPoC+ztFCHtw5sGJh3mUsSnJC147UzMToPov0ck
	yVO55pZAEpKuZ7fJJgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpKM-00Ayka-0K;
	Mon, 22 Jan 2024 08:06:42 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpKJ-00Ayiw-1R
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:06:40 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d71cb97937so14010415ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 00:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705910797; x=1706515597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VU56JILwy1WXTrtMzKmPdAiKq/ot3j3oAn5XBUHBiYQ=;
        b=MM0YD0gTw169at1coqYYVjwT8D2fAFjmHzQP5PpE1m5uIKAwieTpbKIw7g4Aw1tRa/
         pKC8iHHUO3z6Lt8Cslly3HYjLlYkNFwDSiyXX90Bb0fll8Ays3drN6PvLSevGdfkW9qn
         S2qTcSyaaaeOWPWKbHxNbo767pfnowcqIM+cAfGcDc6qBdb50pa2UA1goTy3hSDGoslf
         bHC8HfkxqLLeWa4xw6CKgjCKeL3Y1NaymQn0kH093auHq5GqitxYeTl76Tp9pq1fE1pU
         LVOyLg+UtUosPD9hHMvBeCSZP2j402rigwxq2BRu4/doNK3962Bc7Z6f2SDUYw01uec7
         tSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705910797; x=1706515597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VU56JILwy1WXTrtMzKmPdAiKq/ot3j3oAn5XBUHBiYQ=;
        b=qQr5yBHPUUTizXy4Rw5ricrAbX7nc+c16rKW5+RoVra1ADwIIpXNx3Ro/nTtF+uKpC
         I72K8+g1Ddl4sk7Rpb491tHv/T5VsjKvfhcfy7MGLTHELxHCPS6QgGMgnp+cmFjcuGEI
         ltagzvmdQseoXLIaltgg3IaVZJOhk2fWQHUGt6zj86bnuKBoayGoH2MkwPHPMY+s+ovs
         r04RXNE00pj0BsPGeADP4J7n/9suqr9NheMuHM1eaEOMgytNA/ioQXhgo2jcP5okBS9a
         2R2z/k+UXG2gK5jdq01NwZn/sgAIJ+4MeWizkp+1PNx/ZrYHn0Hn2PVpiSyQF6ZNsef6
         0vQQ==
X-Gm-Message-State: AOJu0YwXhWOjATr02OnlOesmSNSLEDwVKMxtfDeWIYzkUytveNLCVLs+
	4ZnECuAPJ2uvzOVTO79pQOiGYpyZOHWBGFOSQ0LXASB7l+P2mlOD
X-Google-Smtp-Source: AGHT+IF13paWEa4F0XS+JYHFMWFgLLn9MwQeEuuxtGbot+R0GeOPKiyEbQOUVZSkLU9+kQ1FuLeP3Q==
X-Received: by 2002:a17:903:41c2:b0:1d7:2ede:ce8a with SMTP id u2-20020a17090341c200b001d72edece8amr1243257ple.98.1705910797339;
        Mon, 22 Jan 2024 00:06:37 -0800 (PST)
Received: from localhost ([46.3.240.101])
        by smtp.gmail.com with ESMTPSA id d13-20020a170902c18d00b001d7134d149dsm5764072pld.256.2024.01.22.00.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 00:06:37 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org
Subject: [PATCH v7 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
Date: Mon, 22 Jan 2024 16:06:31 +0800
Message-ID: <20240122080631.2880-2-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122080631.2880-1-qiujingbao.dlmu@gmail.com>
References: <20240122080631.2880-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_000639_485877_0511BF30 
X-CRM114-Status: UNSURE (   8.36  )
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

Add the rtc device tree node to cv1800 SoC.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index df40e87ee063..0cd7eb9a3048 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -119,5 +119,12 @@ clint: timer@74000000 {
 			reg = <0x74000000 0x10000>;
 			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
 		};
+
+		rtc: rtc@5025000 {
+			compatible = "sophgo,cv1800-rtc";
+			reg = <0x5025000 0x2000>;
+			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc>;
+		};
 	};
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
