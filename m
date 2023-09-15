Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B8CEE6427
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OJ6xZu524UTgS3QNcNKwceGHUnsT1ZboRsEG4eWA0WE=; b=wWbSsJwtFimogH
	CzV29g5BB1oYObTtn5zMjVX2y7MKJMR4qsG4PXMP5hztkFjpDhMegE3tR2Y3UGmaAr4oyqr3Tw4Q5
	yW6r5tmNB3r/JysoEge/2mq/CHG6td5/S863q24kAnB8NIzq2kbQDMgbOxnj5tM0cr7+PolxhZcGL
	cviinl/Xv0da65LkRJp6og7RTXBvPtGqMHDHLweocuRXe8+asfN2ZN1+Y/XUGEzC25JWj9rSoQg0x
	XWTAz/yPhXW/mBdVwSWje2/Zxac5JLP1c2Fu0b+/zemt2X485VuaRsGvVxjqQEtPGisQJwAnFZ+yW
	/HEqUpIo0x/HidxA2ZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3D9-00A1mF-1a;
	Fri, 15 Sep 2023 07:25:55 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3D6-00A1l0-22
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:25:53 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c4194f769fso10945095ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694762750; x=1695367550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vtiQk2mCxeEr3VVOeU3ze8J3wl3kSWve+xDO77CYJdQ=;
        b=Ca6r+IP9wYA7/c0/FjRkoOzRopfh8vpNK70qt6HL/EpEJu+2qLZz6GnDAkcLDB3ezU
         qB4JQe3vuYBdflTdBPybP/lBFSgJbAwNHchrw4IHvb1xF/bTopRzQ47yhMvEGifQAJpj
         Ch2OtS6jfcQjDqmqDJXd2cZ1boMIs/fTChHvay9tqEcRVPcA6J5j35cXaJtuVdCSSctT
         Pd+W93Z/8E8kuyNN3nBnB7Y3SXP9p/iAproc8nUI+QNLGiakPWj6/pMqfmpLiyE11Gk0
         E7DiEF4ttrPiAiEwJx94TnoeR1Y7088DoW7+hNL9uM8kS+lSqFJiqTUbOBufabfrpIZB
         dkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694762750; x=1695367550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtiQk2mCxeEr3VVOeU3ze8J3wl3kSWve+xDO77CYJdQ=;
        b=ToAn8jWu5J444S/TCztp4dC3NTYO4bilSsFZEEs/bpZebkAmFSVD5PlAO57Zh7zGCa
         EFmoxiEeoa7QB++lx+eTG+r50BT4Pnw8Jow/EG0ugnfMQqlbEKdMdAXkF6a/DIjXf0o5
         wtPfU6SpqXL+Gq4caNYmOlwSM3gF4nUOKNYqj85+B+U5eq5zEQBQ3ZmRxqpdKPzNnM/A
         EZMzbuGNN8jBQ7ffEYhL7jq5kRqxOFk0uiG6v1AHX+WdJNqBB8ycXmjQPOb3rLpghprQ
         FY60zTjv6paEfOHwXAcdBfF5Jdkj5JbLfZOF3Woij2dfUIjBGCF161V9U1itFVfLWqG7
         d/Wg==
X-Gm-Message-State: AOJu0Yzzstr5RgWhumy66s6IUmtBKtaqHXdesS1o8W2/oQoXXkoeBlxV
	Gt5gFN94SD+fetS6tY9Dg9LHcTtZo69hag==
X-Google-Smtp-Source: AGHT+IGUJ7wF6Ucyfo9RtdakD9EC1ecubcsKAFWo65GxfMTiejWgtDU27K1EotMIcRhWahe11YpKAg==
X-Received: by 2002:a17:903:26c7:b0:1bb:8931:ee94 with SMTP id jg7-20020a17090326c700b001bb8931ee94mr747188plb.67.1694762750322;
        Fri, 15 Sep 2023 00:25:50 -0700 (PDT)
Received: from localhost.localdomain ([222.95.63.58])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c10600b001b9d335223csm2768866pli.26.2023.09.15.00.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:25:50 -0700 (PDT)
From: Wang Chen <unicornxw@gmail.com>
X-Google-Original-From: Wang Chen <wangchen20@iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	conor@kernel.org,
	aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org,
	guoren@kernel.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH 09/12] dt-bindings: serial: snps-dw-apb-uart: Add Sophgo SG2042 uarts
Date: Fri, 15 Sep 2023 15:25:17 +0800
Message-Id: <20230915072517.118266-1-wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002552_669599_8C5CB1D8 
X-CRM114-Status: UNSURE (   7.58  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add compatible for the uarts on the Sophgo SG2042 RISC-V SoC.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 17c553123f96..6c23562f1b1e 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -48,6 +48,9 @@ properties:
               - starfive,jh7100-hsuart
               - starfive,jh7100-uart
           - const: snps,dw-apb-uart
+      - items:
+          - const: sophgo,sg2042-uart
+          - const: snps,dw-apb-uart
       - const: snps,dw-apb-uart
 
   reg:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
