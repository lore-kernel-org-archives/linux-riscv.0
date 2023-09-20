Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF31CE79AD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 06:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2OwhfrUflLQlnAT7ItHcHHkwOOMkevK/4ESSbDbq64=; b=XqYCPIvffRGvE1
	l1qO7sNVEbpEnM/zA1Vx22FHrWMIT22RqZDK8uFXFJ2U6boYMROVtu6Jt6AvgmZvp2dx40mKYCjUJ
	sTkTld8JicEYc5mg//tpHmziIhpPfprMADIUmrGlYi59C/QNOA6ApsQ5F1aLH/UcuiJY6WIwOj/at
	FTetipCQoROplUGp2qnCsUnp+c7avHnMx/e44kBoM+yrTSctkWlynzjiNrId/np+z7TTcfCXlI5cR
	cSuryQ0yQo49vPy9WCaEkmxVP0lRMNJbBY7QCxsV0cU8c78mwy2aFd9VxtNkz/KUdSMuQgesAe838
	Go+o1w3Ewf8HhJWMeKMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqsM-0022iF-1x;
	Wed, 20 Sep 2023 06:39:54 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqsJ-0022gB-2v
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 06:39:53 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6c46430606bso934607a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 23:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695191986; x=1695796786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIS769hMse1vDi7mpkrCqnYIQ3QwZYvHFR8ADh3yuGA=;
        b=ApSP3OftwXYGBzTR6EWQOsCzvbHb0/sIv8j1RSMXlYr4sRxgu/PTYjpq6w4X48hU85
         YfuvYEmYwgGz1S57CfDTYPsQPcRIXvGLvgZjApLvjzSkJ68pLt0zsd7BYS3A6wA06tb/
         oGx0yC5odZvVAqbsMX9kNxwqKhYrcsTsk61nRRX2QQzS5S/GQ1weMKQQisbQ28aIsEkv
         blB1qak7o8DNo1WNgpRYejAubEzpqbLUZo8flAUGqYj8Yx9Uno6cISuC1V1hwcjInHRv
         9HghKJKTs4pgd6U8NAtJzyCrPjAq8VByVd+htRp3CGZXPImVMtg5AxODZFbXkz93jd24
         6VjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695191986; x=1695796786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIS769hMse1vDi7mpkrCqnYIQ3QwZYvHFR8ADh3yuGA=;
        b=DcZiuOQO6C6viJKMqxm/uLfUkBbopyaVpwPMImQS5OOCC+nA55JN56aHQ4hab2o036
         JnQzv18N/suQY8ctvNy2JLgGzN4+KhfSj8+syqDzXgX8MRaOonk9vwc11iDy2vmaXf27
         FHTIFs27/Dzhl8hTHurabaRZ7JXW7B9wtLaj/SPIEFEEuGjpxYoOTJtoDkePls1k20Wz
         F2H5za+Q3wUiEJdJfm9ADAgBL3f2jDliJQwB2G50GmjlUsS8EiDgGw+G/5/vvSQFjtHK
         cD4+XEdkfoXaUWFuRhs1wpmQm5go2Ig6Q45iq1j9RkqM955uCIIACzBLcTU8mm0vcz1o
         NbzQ==
X-Gm-Message-State: AOJu0YwMfZQoQyqZKA9BMcXsW/eTVysn1fAoJAw4+eS3Bm3OGRx9nFAC
	1bqKhkCQHXs3Ucnc+waQNt4=
X-Google-Smtp-Source: AGHT+IGvOZR9TEOpFxR7CU19sAHd0S0o7LQPvKu+dpiaEQBrFkNJITq/KyqRguWGoKOQD5qCXe3qBg==
X-Received: by 2002:a05:6870:c6a5:b0:1d5:4fb0:105 with SMTP id cv37-20020a056870c6a500b001d54fb00105mr1753205oab.20.1695191986216;
        Tue, 19 Sep 2023 23:39:46 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id m10-20020a056870560a00b001c02f12abd0sm6282986oao.38.2023.09.19.23.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 23:39:46 -0700 (PDT)
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
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Date: Wed, 20 Sep 2023 14:39:39 +0800
Message-Id: <55865e1ce40d2017f047d3a9e1a9ee30043b271f.1695189879.git.wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695189879.git.wangchen20@iscas.ac.cn>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_233951_944396_31E6A42B 
X-CRM114-Status: UNSURE (   9.90  )
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

From: Inochi Amaoto <inochiama@outlook.com>

Add two new compatible string formatted like `C9xx-clint-xxx` to identify
the timer and ipi device separately, and do not allow c900-clint as the
fallback to avoid conflict.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index a0185e15a42f..ae69696c5c75 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -39,6 +39,14 @@ properties:
               - allwinner,sun20i-d1-clint
               - thead,th1520-clint
           - const: thead,c900-clint
+      - items:
+          - enum:
+              - sophgo,sg2042-clint-mtimer
+          - const: thead,c900-clint-mtimer
+      - items:
+          - enum:
+              - sophgo,sg2042-clint-mswi
+          - const: thead,c900-clint-mswi
       - items:
           - const: sifive,clint0
           - const: riscv,clint0
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
