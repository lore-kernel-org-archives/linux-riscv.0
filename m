Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5162AC47DDF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlOjlZjvHnw4y+3++QZ3TO0uJMwQ+C3KOhyGeRwEx5U=; b=csIauRnIe4cEaT
	5++sLq5/eDk5kmHIvbaaXfjL97mPIJ8xiOBkAvatj/7ZeqGyjg9ERzzNEQIKcSJGxtOgPfWln9MqD
	z6+X69gm9EmaFdUf6o93X8tYXLDtfh/lGnoZLV4hJUEr/GrNF0t7wu7nExYlBg5f2x9K1tuLy/719
	xzwu1pDq3spn3Jod1LDzUOBpJ5ZtGyQro6pd8fZM2YKsSZ8PU/T3/formY1VXtmgv+Wco7Gqx5bn8
	yu7JXI/djev3stRiLwFscsrzsDNFRUC6nKCK20jSWh4HoXU+Kc+RhYTKu7cMw94mMRqxpK3/WLyKT
	4+sZCVtoMTwUVOmmBNIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSsyB-006g4z-2v;
	Thu, 25 Jan 2024 06:12:11 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSsy9-006g1v-0z
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:12:10 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-210ce33ea1aso3433635fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706163125; x=1706767925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H81WNcgEuRcj9vRkVpM+pIQnKvMNYSKJ0QdzyPMV5tY=;
        b=nMh1fD90uC+N2AGG6JNk/4caYB2COwMl64vsuRcXcd0/NPsB9pvVxvTpaPU7B17ogF
         IS1Fb9Mq7ugYNT8FWYI8KCa4ZJ8oeZCfxqNYiAzwPYZVw1lyJIYmEorPbtZWxE8DSXpx
         i1eVbG/0uXYNMIN09TqeC4JQk89OxQvzMnO8ormonv4t78O/OOelKwHZxn5Z0hwH3Qat
         ZCq8EhcczS5UR0dRhXmL7JwJysfKeTdbhyYzVMfAjqnO4mgkFcMUErEPD1MWyXA3/Qmo
         U09uQXGOV2HsTDvq7+D7YI+C89kbNsVo7K1Y25J1EYyVlCcRJNvFAmD7N4McYzmPhIFS
         x1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706163125; x=1706767925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H81WNcgEuRcj9vRkVpM+pIQnKvMNYSKJ0QdzyPMV5tY=;
        b=rgYawlj+lSTPxQQ6BCnUsGTtObh8tuYJvRwnKx7J+H+3b5HjGZdEdS0kBRf6iukkJv
         pRaHcgT9rRht8oA0h2gstg0YtJuF/0tX+ZbpNSwkkbsTnK3JMQ+Jt1zHhB3Nt+8xekTW
         lH4nsVGWHlU/Vmkc+7Tcw/V34kvtmStuzXMPuZJkstEPfw31Zom/tZVWjRx9nDIuURGw
         5yp6M+Ch1s2XgPcfkwrfrCtuSAQTFHhGbUco2kt/DMs5QTxUOVSkn4Tc9B+Qu2moJ4BR
         WQIwq205VmqHNIBvZ5TNg7pQNpxnV8nDpv3jvih7YKucR3gYbtm3rjaJBT5exnoasWfw
         djpA==
X-Gm-Message-State: AOJu0YxnPjqAyAgkfOf/N91xDOBFV6agRSA0XQF0zlJWAEN+7+dHEn9L
	DBvA/HzfWaJW1r7vcMJpRXLEPyHsKvmKmqTwLAoUceWtEiNJ+Vl60DLgWiMnGCI=
X-Google-Smtp-Source: AGHT+IFPAbDHMb1RVDBOGKQTTme4ARS/WDZd+tSOVRZYGMKOHH2zF50aLIbedrsXEpPlEeMYn1zKBQ==
X-Received: by 2002:a05:6871:73a9:b0:210:d251:8180 with SMTP id na41-20020a05687173a900b00210d2518180mr417453oac.9.1706163125441;
        Wed, 24 Jan 2024 22:12:05 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id w4-20020a056870a2c400b0021453296524sm2006054oak.41.2024.01.24.22.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:12:04 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v2 4/4] riscv: dts: add resets property for uart node
Date: Thu, 25 Jan 2024 14:11:58 +0800
Message-Id: <685eeea20960d96ac2c37eb8990e1f7112ee4178.1706161530.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706161530.git.unicorn_wang@outlook.com>
References: <cover.1706161530.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_221209_345951_B9843994 
X-CRM114-Status: UNSURE (   9.28  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add resets property for uart0 for completeness, although it is
deasserted by default.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index f59081d4f0ee..03266f216021 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -327,6 +327,7 @@ uart0: serial@7040000000 {
 			clock-frequency = <500000000>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rstgen RST_UART0>;
 			status = "disabled";
 		};
 	};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
