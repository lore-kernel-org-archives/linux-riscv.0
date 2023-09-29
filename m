Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC9AE743D3
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gjVrUdu0ji4xW0pEH0pt+RZWJIliqzQ2xeR1t5HB4s=; b=ktzTg9Oe8oPoSs
	9/f6HDXGpLVdR/PrKYB0MidlfGKeg5paaco3N+k03UMeRyu+5jSJgX13406iwhlxeK3/mxyDkEoZS
	OVBARNp1ubGJGQEeUb2GqqeGMigsw3ymSlhKki0dRihoaNhmvnMwuLM6CfvQpFFPImE4s6cOo7aIl
	oFpvGUigWzCfmD/lR4qJA3qK+dgSnzhelflmZG2CSKgPQkYpRrJcaY9Md9sHMnRXNLHHKySS3F87A
	yqmEzehTo6YbitJBGtxldK8n4kcvALFLb9D4afYUHXhvV4MN53C+Vuvs3+axTIQRbzd7rN/l9Xe+F
	96WgcX/XAd/T7zyo0weg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm12t-006tqU-0I;
	Fri, 29 Sep 2023 00:07:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm12m-006tlm-2C
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 00:07:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so33732865e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 17:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695946062; x=1696550862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QykmGOhFH5Jg2YbpjBw5TT8uCu2shmkEPyDr16ah5mo=;
        b=X8oKvJRgrjWoJYgjuJLa3WQrmCw+qNI6M0kocMpTELrTg+zm/uqPdLGLAB+iy9Pfm+
         NAi9LiEjDJSXpAT2FlNH8QmLek2azYIfgwHHfnnh2JNqY0Am1kKaCF/ATgtkU6aD98ZK
         2H67ui0dDQcJwEJ6CjrIg49wIJCoLqGYJlIlvKL/k5M2W4NTgYzXNlyipCZYQP9Om4rV
         xc4sViZ1L2G2GBZ4z5B7Tv7IlceW/Hmphu81SbmxLZCobSSz7KQqlNdPy/COO1eT8g0v
         KTIM5kFl3Eu4uYOKO78W95WFiDdhif6+fQ5seRZomt+Rk5duZ1YGnCrOB6zo41eUWD+X
         rgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695946062; x=1696550862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QykmGOhFH5Jg2YbpjBw5TT8uCu2shmkEPyDr16ah5mo=;
        b=SAbbjL8qshwPfrzuth1lZZN2rWJDU6vsyteWHfqFlsS/dO2UGuijgG9osmzZozSMJt
         Wr4slzGhTtxvHP9KieUZo1R7n/Dubd2bL0zg9MHlD/s8/thi9Mo0dfP5P5RPTB15Zu/K
         Yc557kV8YwIHTtcT9OSebyg8mVxs1SIZAkunZq8hL7w8p8FwotAPiUB9So4FiIRaEpNa
         kjIaRtxDiJk1IZ8/Mngdl+JVlRcfF2GS/IqmiJfwBxbLzpR2HcmUIe4PLRpRFqep0GI1
         /9U6Y/oEX7HwBegmDOJptAiEDQ7biIjQ4M69juAG65jypFt2/y6sIiIgMvXxHPTGZEKW
         s/Tg==
X-Gm-Message-State: AOJu0Yxm73z3N4PceYaioKqdRndj+e7VDGvU5hmCEa6nt1jWUiwZAfAZ
	r7DLptgqofqH8k2FVJaDvmc=
X-Google-Smtp-Source: AGHT+IGcyD2e2QJk+LbGAQCmTqrP38BeiU/fWbbAOj645xzShm9qaJzxb8HaVmLacKAeJbhw5CVjJw==
X-Received: by 2002:a05:600c:21c5:b0:406:45c1:a657 with SMTP id x5-20020a05600c21c500b0040645c1a657mr2522204wmj.6.1695946062630;
        Thu, 28 Sep 2023 17:07:42 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:fe98:5e2c:1821:4cb6])
        by smtp.gmail.com with ESMTPSA id y20-20020a7bcd94000000b004030e8ff964sm245667wmj.34.2023.09.28.17.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 17:07:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/5] riscv: dts: renesas: rzfive-smarc: Drop dma properties from SSI1 node
Date: Fri, 29 Sep 2023 01:07:03 +0100
Message-Id: <20230929000704.53217-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_170744_722367_298131CC 
X-CRM114-Status: UNSURE (   8.91  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

With DMA enabled audio capture/playback has some echo noise. So for
now switch to PIO mode until fixed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
index a8573fdfd8b1..85f96e24a96e 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
@@ -6,3 +6,8 @@
  */
 
 #include <arm64/renesas/rzg2ul-smarc.dtsi>
+
+&ssi1 {
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
+};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
