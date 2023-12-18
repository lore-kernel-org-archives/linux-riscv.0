Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0645C46CA2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 11:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ea80qVWJwze+6juUMNlkoi1pYTCPlIoqZ5lIMVA7wd0=; b=MbFeE0FUN5POUJ
	3HmCUfHv9bTHo0RhinkJMFY7CjH/zSV8tQgSzD/M/9SpC8JXFiKaKWXQRoXXz9Oo5ewAfW6k/6pvy
	sHYukKSbq6z0c6CUuJvrHUJY5r9LEnMmDOPBkiaWf/oHUeNI69MSZK23UgTpYPJ0tLFcz5iJWu+92
	0l4IKjl5jxfy9Xh7c5vInVIwFpwXRSbc6s2wPKI5I4wK9z5Jk314VZTwcNWxUydYz4IYgmFph1z3x
	Te0/Xf7TCR0n4pW0mf4VFMxtf/GKtEC2cpCrXORuf2BmA7bLXvTbq0PtI1jkk1jMR/Mmt3pLXTGeZ
	2XcbXS50zD4WWWpcP1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBSI-009yjZ-0I;
	Mon, 18 Dec 2023 11:06:38 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFBSE-009ygC-2l;
	Mon, 18 Dec 2023 11:06:36 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a2345aaeb05so130262766b.0;
        Mon, 18 Dec 2023 03:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702897591; x=1703502391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8/JnmQCAMS2cYksRjeaCp4G2NnTSXTyff3BziFBU7s=;
        b=Hht+T18TU3yINZcqpJf9VwjVEDS1dDcpsEePA9svMEA5X9A6vNCNlAzdTtDMX1PRyZ
         SlBM0Xj+KPztpqDwyrDGzPQIlOOGgqqRjj4CkqqU9qG3MpQUGQ5EBkayBf3/n6dSi2oh
         /M9OB0b50pZDKNP0PD8ZLGtXza8jgDbKkhxievP5IatB+ZKQar2u6XwhYqK1aAdj7Bnf
         qEhbwvhrn4moTmc9cRRGPRJqtfxKPed/G2UB8+b/ee6H9dyRrbWARlB212hww6q9HRTg
         LH2N7PW9UXT/dhFrqm4X0MBKhcxwAg5MRBpCNoI03H3U6wVLONO20sM6s0BPMmVfm4AH
         qPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702897591; x=1703502391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8/JnmQCAMS2cYksRjeaCp4G2NnTSXTyff3BziFBU7s=;
        b=WX+pDTgWYzG5brBpjYQPsQ1DUYfFHA0M3uYRZJp4aRgUgFqJ8J2Zl9IMMWbcaQmQbK
         eu478JQS9QXPQqwSra0xz0DlkHnO+T8Rin0N2lPmyYwNPUKUWDS2mAdefK1cZ/+NZ2m5
         hu6nSW52Xwv0HqsP7oTg6HqPc1/RuIv2KB7RoO4Mxf3GbiZZL1Ee8EQ2UqsgOaifRDna
         yK/+96QZNKSGn+79ZpQp4eGaoQHi+rcmLPfarlyGs5PB/+nDsJepn5X3mDBcT38EZ1AV
         Eo+yb/pbDy5Ps0xiFngBWSFR2x/1uocsnibjTJCxnUWEzZAy7YtebVZv6/uNQ6h3DAse
         t+TQ==
X-Gm-Message-State: AOJu0YyE33MqjND5DtBj/LIC+Cl1RiTYuw4xlzLzV5nRIwMl/ARIb8A/
	Kxf3sLFHhEseJ6Mc2EFYK84=
X-Google-Smtp-Source: AGHT+IFf3fTdcqRMdf1nMW9QU6h5ioPHWtIwlndls7xDU+7sKH62DkfHYo+TKGbOTDX/dltHActCzw==
X-Received: by 2002:a17:906:fd86:b0:a23:26e4:862a with SMTP id xa6-20020a170906fd8600b00a2326e4862amr2021405ejb.88.1702897591591;
        Mon, 18 Dec 2023 03:06:31 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.164])
        by smtp.gmail.com with ESMTPSA id pj4-20020a170906d78400b00a2353af1f7bsm1406769ejb.92.2023.12.18.03.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 03:06:31 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH v2 2/5] dt-bindings: opp: sun50i: Add binding for D1 CPUs
Date: Mon, 18 Dec 2023 12:05:40 +0100
Message-Id: <20231218110543.64044-3-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231218110543.64044-1-fusibrandon13@gmail.com>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_030634_891073_CD4E7760 
X-CRM114-Status: UNSURE (   9.97  )
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

Add binding for D1 CPU OPPs.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
index 51f62c3ae..fddaa3216 100644
--- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
+++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
@@ -23,7 +23,9 @@ allOf:
 
 properties:
   compatible:
-    const: allwinner,sun50i-h6-operating-points
+    enum:
+      - allwinner,sun50i-h6-operating-points
+      - allwinner,sun20i-d1-operating-points
 
   nvmem-cells:
     description: |
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
