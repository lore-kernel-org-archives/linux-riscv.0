Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DF6E7C4CE
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/vJ9ih6AFR0LV8HnNNRGmn161FU9eTmJc9X1C1RQno=; b=tkGS2RYLKND+Dm
	R/NxIrSORV9jxUQLtKYq/0nf0t02kp7XvERRpBXTajupwbBdgr70wIVGCQ1xlyVbtTc1nqNzP5Neo
	45I0eynXxi1QPYn9CN3VIobIbXBakehm6x/z+lOOVkdRMEuy7acBxzO/Rxv1XfhxZrN+GG1RrylMK
	7x1dEFJdWiyxKSeV7KOk0INEft58b2D2CUDDmv0KNNnOl6J7jS/5N5AlkKEwQKhSQ+Pf24VguGctH
	f2lwCo9KjgZcxggcdzo5cS9DeWHqgOFlmutBY0w1PN/ZieLomPmE7Z5s0FwvD32ZTd9vfqYVq5Zni
	vwy+3pq1/NxXplLKqA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3zR-000NlE-1e;
	Wed, 04 Oct 2023 15:40:45 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3zO-000Nkb-2y
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:40:44 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6c6368a1a97so531781a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696434041; x=1697038841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGAJAL4u2VX3FIWEkVnsPhkCa6a31tzGgZXni0+jw5s=;
        b=P5rVdb+9rPn8s29kdyU65GO03KrsAS8HjjJaZTyHJyk/Mru8dLzmlXo3l/VCISgvGw
         8/l4ke7P5nnb3u/SqfGIBHkffbaqtG1BH19PHxiJb5903/r4S9tmyU20X3i3/i/ASxuX
         y9OwuwB19DKgBn92YsrAMT1hsyG54l5XXNDlEbAPEqukeEnWmLZZStMOtNr+lLHD1eN0
         IAVk0iNkUGrsu4n0XhlprsjTHMfwppzhE7GYMB9+1vYKQBotwfheIOjEE2PfNyZM89d/
         Drw31Vc/ra/FlJGxbvKZ0sU4ewvT4CwwHAH48JdE7JVPe0hjZAs6u7fCoC8RmRj2ANsT
         xxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696434041; x=1697038841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGAJAL4u2VX3FIWEkVnsPhkCa6a31tzGgZXni0+jw5s=;
        b=K5U+yFasNz5IxfhgXNcMByOY4ZGCDM45Jv965BTQXotVlhoAyXNh0ksfSlIYB+bhFS
         UI28pmva7xoQ3CLYeIpSFokX8XYnqLVK1QDrT7HrYenia3/6DNWOYqB4Ly1RHU/Vi9q4
         fLpltU6vuEYG1gNJxSy6kUzP/GsEbN27vJb9IhWaLF6SpzcoIlz6Yb9jl75h3xFyFz3/
         WZN9+QzvPeeTqtc6VTZgfFf2eVTmLQZNGPTtlNU04Zb4aJJAPaSCTVZYOE+64zBzNMS4
         XYQr0Q0wRuAfBlk7ZeaqNgt5BvEy+3jqy57aEJMZ3C0L6NODpRshlg5qqDooRooxZkyo
         Xjzw==
X-Gm-Message-State: AOJu0YzMpjdGNGV5m+6ZCU3/G9yiZGtQay7LH63F6l1htpxKjvfRTRIM
	w3+ytBxm79S7cCk9v+kYAfc=
X-Google-Smtp-Source: AGHT+IFTIU1nASd/e+dc6F3k6Dv/9g628/YQ1wR0t0xkHX0r9SBPbwv40GV37Gq9oXgdJhnenlUoOg==
X-Received: by 2002:a4a:255c:0:b0:571:1c44:c9c0 with SMTP id v28-20020a4a255c000000b005711c44c9c0mr8013ooe.1.1696434040692;
        Wed, 04 Oct 2023 08:40:40 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 128-20020a4a1d86000000b0057b43a25deasm677359oog.3.2023.10.04.08.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:40:40 -0700 (PDT)
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
Subject: [PATCH v4 02/10] dt-bindings: vendor-prefixes: add milkv/sophgo
Date: Wed,  4 Oct 2023 23:40:32 +0800
Message-Id: <aab0368a9558571c698fdb78585a47ae3297743f.1696433229.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696433229.git.unicorn_wang@outlook.com>
References: <cover.1696433229.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_084042_963490_32C703CC 
X-CRM114-Status: UNSURE (   8.47  )
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
