Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCE5C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0wwVkFLMz93kz6aVV46IvrZiwrkYbhbR86F0NuMaYY=; b=19lnFjB6V4VF1e
	goIXFcYyhMf3xlTTE7Ao2ch0/sAR91+3C7FeKcdbg2Cc20eG4qLlPl5pSiiNn8PwNOcnislkCGXGn
	0cHIWpUeW4r8XGRvIjHXzShP4uNClEfGO8KBaiTb9FXACqZdwljqT4xZgatKfb79ulCF4SNPZ3q3b
	4l8goyzPq0Zq4eTZp3FJ4WEFtAfVnFg80sVOW776Pyd7Tp8BN6kCrP7+1NwX9Rc5RU8CH8QhBriy7
	ZureCMNJY4H6gNTozYlpgJDGYC22pn/zBgUzw4V3ugnmY0RLs5iVG5RQ+HjDkTyxLr5NQnyYTKbCb
	W6fUp18e+RSZW6R8x25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ipw-00BBgK-12;
	Thu, 30 Nov 2023 15:20:20 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ips-00BBex-2o
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 15:20:18 +0000
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 31B104443E
	for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 15:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701357615;
	bh=O3TPicaObXUf+CQ2/13bF4S5EM9ZMGJpI/eXjOZpsCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=phP+KGv83bpzb49tbycHM9QcTZhs8+FP1LSeN6lc2kJsCX+ZxB8ezus6b2fT0stFS
	 QLPTHxOf4C6fvRyrLxTp+RFyUoXgULZdXIOGU11s/5P7vC5cLNjdDuIhula/ax/Kg/
	 2ZX3bEPaYYxSCoox+0KnfR0TJReSYiVohamX9z5d5vuBV8E5bjqBnh13xyl0Ipfpmu
	 y2wQ1oFjBIryuUPOSTwPb46eCXS9VXxxfZug/8fwaGbyvFlpBSB22eE1c8aoRxJiBC
	 ECHEk7G+e0yq6YhMWRuw7XWw7mgDF5CBjVG9GVQlRhIFjxla3XEHIEBUd7mmJmw6jI
	 HBveGQYwimQKA==
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6cba754b041so1391445b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 07:20:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701357607; x=1701962407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3TPicaObXUf+CQ2/13bF4S5EM9ZMGJpI/eXjOZpsCQ=;
        b=UVUf5ILAWQmryS6u/WVH6qUxd4hHBXQVOoMH3alrL+bHYofIyTNgYowCHood87s0zk
         q+EtbIzh1QfzDMWKyn6DbuywfPozTZ5QPdFuni/BOueztBqGVdFPTBHZ5RzBUXrK8xUb
         j62cN2CB5SIKTpXwiuWgCnEgS6DckGxbRRb+h8qaegm+L0ep1GMZz+Hnj0W1PCvfxY7Q
         8VUMnM6UWyuoBIPaLtH0SMn9coi0nwj1wV3G1/mV/5bx89WgtHrKSQq9YCU5NYpmTyFm
         th1xVtsHLbPHTyzXJ+yE1H1ZFHuxPTsbLsjTW0j/9iByVK8U1epOyTlj8L3WuKCtxLQD
         r9ww==
X-Gm-Message-State: AOJu0YzeD9f501CoU5icte+py7RfIX1QzLHoVnTL0kW4FJGqpml7/Ihx
	IZQ6PaX7XliOu7BIIqMsAUPRMwHvD40IsTyCW+GAOFm1HM4whuxMfhMOw8va1Z1L2SEQRC//UW2
	Xavf9Cl/uxQxSuKycWu0oiYYXS9UfN1LdJCaQQfDPCET5ivoBbK6rsw==
X-Received: by 2002:a05:6a00:1914:b0:68f:f38d:f76c with SMTP id y20-20020a056a00191400b0068ff38df76cmr24404048pfi.6.1701357607361;
        Thu, 30 Nov 2023 07:20:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGO2ck+Ida+RKRFtuLd6VUs98DdkRkXb2Q1rcWsF3vYMURGwbviCaQAdpZ1mHrt9Ipgx7Ym1A==
X-Received: by 2002:a05:6a00:1914:b0:68f:f38d:f76c with SMTP id y20-20020a056a00191400b0068ff38df76cmr24404026pfi.6.1701357607117;
        Thu, 30 Nov 2023 07:20:07 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y125-20020a636483000000b005bd3d6e270dsm1356002pgb.68.2023.11.30.07.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:20:06 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] riscv: dts: starfive: Mark the JH7100 as having non-coherent DMAs
Date: Thu, 30 Nov 2023 16:19:27 +0100
Message-Id: <20231130151932.729708-4-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
References: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_072017_040243_6E7CFE0B 
X-CRM114-Status: UNSURE (   9.99  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Emil Renner Berthing <kernel@esmil.dk>

The StarFive JH7100 SoC has non-coherent device DMAs, so mark the
soc bus as such.

Link: https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Cache%20Coherence%20V1.0.pdf
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index a40a8544b860..7c1009428c1f 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -144,6 +144,7 @@ soc {
 		interrupt-parent = <&plic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
+		dma-noncoherent;
 		ranges;
 
 		clint: clint@2000000 {
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
