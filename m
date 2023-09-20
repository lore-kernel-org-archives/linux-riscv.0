Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83462CE79AD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 06:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBO3mvddERJisb0uZ/OBt/TEfsJ8Lr5I9lCPG6y1XFw=; b=fhx43kN2znK02N
	DkFBPmKxfij1sx7pFFBpRxLTDY/8l8PW6kiX7QDAGGPzotYATPyH9ha9Gg7pSuAenE9Eie9Ac+ldg
	qJzzn47OBCD+uM7YMZe5LsR1p1/j370Z3z+6yx1U73+6goTZX3zRKmmRB5zQYJD9h/GppOVZpEINF
	SbiL2N/s42Jrz5wKooMpdhX1ifRCOt5LncNDa5y/4I2Ipm1enDCr1HNljfzrYE0CoR7gvobzlBLXm
	CqkwTTRTc/+LppVw7pkGwOevv0YD6H0Bpmh07Y7pU83aGnCWrrNDZx5UwpOLA1srvzo83BKzZbLIF
	ey+nDNr6b1ZLz0GEDbKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqrg-0022Yz-31;
	Wed, 20 Sep 2023 06:39:12 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqrf-0022YQ-16
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 06:39:12 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6befdb1f545so4506834a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 23:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695191950; x=1695796750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KI/QX9GZKKfmFvg1oHlCB/TJtzRtp3iLf9zqKneYIf8=;
        b=OuXtU1X8yKTXm0yrJb7C7iFJTbBgW63EG28KwO5Id0ABT9HAt22blvXR+bSuvb3i5G
         d8uHpnEpvXIsLGlvLoSivzcYnMGcAN1YY/qFsXFaGsys+YxUexrdljLp7IACSs/3wa7E
         0/zdl/pBzPiHhmpbcFZKnUMCQRurvQBLfXfrkgRH6pgPiiSXP6Fpp9vPnezkofsr76DL
         pYiqXPMp3K7KtvnoMLyNw0l+SoQmebt1+AUQcO58Q9hJApEwjEofP1FHn7b1LEA6NqQ9
         oRTWkxBZsMPMlqNKzyHrSbvosVgJoZxGn/wc3DTLy/F0N3t3P0OrnL6EulRW0K9BTAJy
         Wt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695191950; x=1695796750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KI/QX9GZKKfmFvg1oHlCB/TJtzRtp3iLf9zqKneYIf8=;
        b=ISUKmO3zxGDR/diYVa7Fv/HyyuiYX/4muToHa0sG2AKNELy8L0yW46liELXC0zFjrK
         eO2OQS1yZg0vN5LmDRCgl8YsrLh0cloer5U0Y+/+m9SBViS3UNcvyif/Pi2Kpo5PL02W
         EnHSrshhqGh1So7glzIPFqovQegWORARJt7lKAaEtF6swIVFOl6eyYXpgXjLz5hZMrz/
         WPotC1Mf/zpjoEwKLaTQ1wpRdd2jx71tgN1y9wQeo3OOeUEfcb/0+SJMCx8Hq98T3Ff3
         u0NQVA25PZAWPVi6AQBqWqOofgw3NdNFMGaOS4VBSrBdHF3s7hETlAWlplEiSbzUnXRj
         VTaw==
X-Gm-Message-State: AOJu0YxyTXv5Un2vFMR78NfxoaVZjyVCf/b6+CIMCzGxqkbq9khZrKFc
	9VDuJUWpr1n072d3jIiRSgU=
X-Google-Smtp-Source: AGHT+IHHcVB62V0O8O8EhZNxxnHZ/EOAMlu1mcrCjEcLLL1XAJibYFmuDfj3Hy9MMHpB7b/QOdNAdg==
X-Received: by 2002:a05:6870:5ba0:b0:1d5:91d6:65f3 with SMTP id em32-20020a0568705ba000b001d591d665f3mr1746274oab.7.1695191949915;
        Tue, 19 Sep 2023 23:39:09 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id ka5-20020a0568700ac500b001d65b641873sm5848095oab.32.2023.09.19.23.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 23:39:09 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
X-Google-Original-From: Chen Wang <wangchen20@iscas.ac.cn>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v2 05/11] dt-bindings: interrupt-controller: Add SOPHGO's SG2042 PLIC
Date: Wed, 20 Sep 2023 14:39:03 +0800
Message-Id: <11eca9395bf730f41f142be2f8d26f527e36517b.1695189879.git.wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695189879.git.wangchen20@iscas.ac.cn>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_233911_383597_999ED2FD 
X-CRM114-Status: UNSURE (   8.59  )
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

Add compatible string for SOPHGO SG2042 plic.

Acked-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index dc1f28e55266..16f9c4760c0f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -65,6 +65,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - sophgo,sg2042-plic
               - thead,th1520-plic
           - const: thead,c900-plic
       - items:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
