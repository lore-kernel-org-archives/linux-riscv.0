Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517DFE810A8
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 09:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R77MX5V7R4OvHTeQcMJyVZvcXPFWYnyrJta/i4ztDb0=; b=QZihW3hnroTewi
	h81nnAmvZxZUvG2XwxRgPrHQdMRL+G0LdKJBf/0YNwsSMdB+K5aUVKXwP+7LiA9XZgToF34NHTTP6
	veMSEvNmis/BguXRqE6tCkAiwJ+7cnHVrST6aEICCZlsWui7NtWszW4IqPZ1Z5s5suaeSaaPzEhuL
	HcbkwiQyPGvx4/84Vxp0/iXA6JhB6917VUMYrvHPcpSBkZRwfSMoDuWHMd+wyXYYLR96/RUMly2yN
	xl8LK4+isoX8zr2r+V7x4glXztGuePXR7vznQirFCy9/0Pzdh1OPRBlrjK2cv1j8J/KrqEfe8l4Re
	ki2pHWLDDUMn1tJHCxsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQPO-000PDS-2E;
	Wed, 27 Sep 2023 09:00:38 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQPM-000PBn-1g
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 09:00:38 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3aec067556dso919026b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 02:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695805235; x=1696410035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiV1ULQG3s0x2nlhHANe2aPzX+bV/lE/JH9vnJWbNSw=;
        b=jgpf29qUDqWRtSHuVI8q1ET/iof3OtKrgLCg7IJF5iVtBhtOJzNROSZJfu96NgRJzS
         YEEGkJyxN3PBXLCZpHxIJh1SrtV/QsNPwm4xB/5xAnrZ5ASloWqzGVCBMq28UPBwyGBL
         9osl7+AlgKGaEOCT148gj0C25XmtWVwWbGwOCORAZcz/BUk5Ht8hq5Xn35+uRSSL/P5E
         ZP5QYx4CfmMm39ngWdqx8u9VNrhhuH9dvrDxnf6czicnOqwV7I30tHn8HQWbcukKq0VG
         2LjzC9azBq4KWb27G87tlEaV89ZBwD++No/7p35rQXYzp0tv6bTvRJCZAydvdgZzV+/v
         e03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805235; x=1696410035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiV1ULQG3s0x2nlhHANe2aPzX+bV/lE/JH9vnJWbNSw=;
        b=OLjkcjUziwQFArw/sn3ZnsB1+l6Jjfb/JTpZ3TP7QIvXzRBEVh7Re/C6oQvw8Z/l52
         /zy+g5qbqVL9a76mgEfZKquay0l6w9CbSw7l9Geik+Gwek9cjILrSt1cF8YPRbUDQLe7
         VppdThPjydxAImKQA9NpBnHighYapvGboGQId349pr6blB7t9HwoQKZuXz/XssoRjivZ
         l8YUhxkFaUlL2stkMQvZ3QZ6zzK7amnbka3aM7HGTGnBwRix/bs7s+rIdZYGbizAK9lC
         eI53z/s27+c8dORkBb4A90rtCMa4XCHf3EiocLGLJ7wFsfELrwavcRK8yGehXwzJ2eu0
         PFvA==
X-Gm-Message-State: AOJu0Yx+v8Ne4XWpeKs2BkO0YS50+5j9UOGjancuSXUCetxx1BpefK2g
	InzAwHecdqiV24crviNZMsk=
X-Google-Smtp-Source: AGHT+IHRLsiqqvilGXV7akKllvlYz9S+uorAcdH6PSFC8vgoeHy/ik7nsmsja3IemwyAGE0aqJ/3KQ==
X-Received: by 2002:a05:6870:819c:b0:1dc:a055:8587 with SMTP id k28-20020a056870819c00b001dca0558587mr1850005oae.6.1695805234798;
        Wed, 27 Sep 2023 02:00:34 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id kr9-20020a0568719ec900b001dd60c202e6sm766131oac.10.2023.09.27.02.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:00:34 -0700 (PDT)
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
Cc: Chen Wang <unicornxw@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v3 02/11] dt-bindings: vendor-prefixes: add milkv/sophgo
Date: Wed, 27 Sep 2023 17:00:27 +0800
Message-Id: <df92b2a50cc372098a7a8340e09be4d4cbc664b7.1695804418.git.unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695804418.git.unicornxw@gmail.com>
References: <cover.1695804418.git.unicornxw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_020036_559841_ACA9D7E5 
X-CRM114-Status: UNSURE (   8.64  )
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

Add new vendor strings to dt bindings.
These new vendor strings are used by
- SOPHGO's SG2042 SoC [1]
- Milk-V Pioneer board [2], which uses SG2042 chip.

Link: https://en.sophgo.com/product/introduce/sg2042.html [1]
Link: https://milkv.io/pioneer [2]

Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Chao Wei <chao.wei@sophgo.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
Signed-off-by: Chen Wang <unicornxw@gmail.com>
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
