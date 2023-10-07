Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94701E936FB
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 07:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3Ln1V+kuF/eMg1zHq8FEkvH4FcL15xWoQ+jK8ulVhY=; b=Nv2gRWyCA1vXwU
	Gu/+tl/313hLz76OoDjx3fgQfUlrlq5QCpU/UxEoa/3SmO6zpT+u3RzHehLw+IhGYOIpElzSuwUfw
	Z4UxHQuKAz3fvRK4JqLgip05+Fzvl/+zTJg4fUEB6/ng3eQaOeao/Leyzza1/Mv+1zoY3HItOOLKa
	bz18ssZAjJYX1xJtB4KgitdX/OS2vHBc66EO+/4QoPhTbtGS8lkzWj16VAOBICGBczjLXL3Le4qvl
	+gfGapMmzt7v8WQMvOv6Su0hu4dknZuymBduJm8PRUk5Iw5/DuUoeD/DtCeYu0vGfXYB8TH/oAdVo
	fmIVT86f8j7JTpCb3+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp28j-0078qB-2E;
	Sat, 07 Oct 2023 07:54:21 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp28g-0078pJ-1S
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 07:54:19 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3ae1916ba69so1930058b6e.2
        for <linux-riscv@lists.infradead.org>; Sat, 07 Oct 2023 00:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696665255; x=1697270055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+Bt/pK9fjZb2V2F/uxXmZS4s2BES+Pi96M/AbPYC3s=;
        b=jP1VmCEvCahLRRFA2HOTNv/1dXluKO1lNv2Hme0SN7XdQBx7Z4GGYlTBouyWEW9UHp
         QGfS+u4EAcXLjTqGmQLuY+PixWEyVj2ZYaD9VUxmNsgP41Ma1lCNmK994oE52jJg5E/I
         SX77xNqP6DU6hcR0KF2iuyDwig1e0Ldr/XzkdXayspHFdgmPKT8Vhut5G66OIAePPWxO
         kcz5gmtzFkezOAoixjIBJpJxX3Kjd7HTHRIC3roi3FY2IXiuQHlt2irvY6g2G9TgSVXb
         F6rprzSCBi7bIja6rOrNE2EJGDvA+ZycxgNQHxNtpc0Hx067Zd7G6PHcKlPWyLjAP1xN
         HkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696665255; x=1697270055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+Bt/pK9fjZb2V2F/uxXmZS4s2BES+Pi96M/AbPYC3s=;
        b=Ch0DsfSC+85MYz/h8MwpG/io5AbkOJRSEyPjD+5Aq5rJAm4+JwMc9OvH0ZkjDj0OBe
         SqrrciLwvBiANIh0DyDEut51+2fiiZJh4fWWOFntV5r+BSh7QYvdsF7n25IQGt+W4dyX
         ppUH8oLLXOb85+mJmngAC5RLiNheGKIu+2piJeKXkeF82ZsX/nBG38WOp4GuHbBdYHKA
         B+hkoYoMHzvSso7Ofi/y+hK2IwOky4EgNoNsmrvsg6sW5wVrcIcRPuguFnNOGEEiZDeq
         nKOMV+scf0mOuJPmvGsfsUtf77JUliUFRM8XyRobNhSLn6qR+XPUo+56T1gnfh/Rbg4g
         yzkg==
X-Gm-Message-State: AOJu0Yxs2YcYx3aoc+FBllTqxAdCjp4bAw4Zjpq0ONQ+dGFTR//Q9Cjc
	YRVw+V0zsjMixWAoDKH0cR0=
X-Google-Smtp-Source: AGHT+IGYYVSKz8U0XPm2HSLPok86XdRVhk858hg+KaxayfheYI3IX17LDnbk69Fq6lFvj8JkGYy48A==
X-Received: by 2002:a05:6808:1495:b0:3ab:83fe:e18e with SMTP id e21-20020a056808149500b003ab83fee18emr12806231oiw.54.1696665254781;
        Sat, 07 Oct 2023 00:54:14 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id e14-20020aca230e000000b003a78d196acasm899573oie.32.2023.10.07.00.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 00:54:14 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 02/10] dt-bindings: vendor-prefixes: add milkv/sophgo
Date: Sat,  7 Oct 2023 15:53:57 +0800
Message-Id: <0aa38ae82ccefe7f3e83a73df93cee75f309efc0.1696663037.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696663037.git.unicorn_wang@outlook.com>
References: <cover.1696663037.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_005418_486983_5555432F 
X-CRM114-Status: UNSURE (   7.91  )
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

Add new vendor strings to dt bindings.
These new vendor strings are used by
- SOPHGO's SG2042 SoC [1]
- Milk-V Pioneer board [2], which uses SG2042 chip.

Link: https://en.sophgo.com/product/introduce/sg2042.html [1]
Link: https://milkv.io/pioneer [2]

Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Chao Wei <chao.wei@sophgo.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 573578db9509..fcca9e070a9a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -863,6 +863,8 @@ patternProperties:
     description: MikroElektronika d.o.o.
   "^mikrotik,.*":
     description: MikroTik
+  "^milkv,.*":
+    description: MilkV Technology Co., Ltd
   "^miniand,.*":
     description: Miniand Tech
   "^minix,.*":
@@ -1273,6 +1275,8 @@ patternProperties:
     description: Solomon Systech Limited
   "^sony,.*":
     description: Sony Corporation
+  "^sophgo,.*":
+    description: Sophgo Technology Inc.
   "^sourceparts,.*":
     description: Source Parts Inc.
   "^spansion,.*":
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
