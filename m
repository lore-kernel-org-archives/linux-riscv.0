Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844C6E810A8
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 09:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=825xX390O/9OIKO6Yp1t3gv1xwf726P1SQpAL/XqS9Y=; b=b+K5FvszBclub/
	Oygrsv1b4+C4N8A+AtOiSnB6t5EV/gFpsXVawy7sgEvAsrkc3L+xhuz7BOUNVjAQ1I4zXJzxTccsm
	z/tOGnknhwOU+JWsKPqOWRNMK7zHtRNbf8NAGNPR4quygMpt/ZjD74J+8APYp+qmkBjOjeF7KyQYN
	klhM12cC33Y2kUgovhM2AXvYiXUqpu9hL36TCLACP/Fmimi836S1BI11kYygJK9ZQWvih5jQ4kcoe
	87DQW57WXn8517LO0jPcBpRY4R5s+7v/5Pibk3pp164wr6DBp5B7RFOJ4mVzQQSmtyCux4Su5lax0
	91XE1G9vBADceppDcYGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQQG-000PWp-2z;
	Wed, 27 Sep 2023 09:01:32 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQQE-000PV8-1F
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 09:01:31 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6c4f1f0774dso2646543a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 02:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695805287; x=1696410087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YppGQzKW+2r3xnb53t/LIH/j9u+a8juMyAfNzTVGTww=;
        b=FrzvDqqtQg//2+wlD6E3ZBRiIYGv8uNe/CxKuMkAQTFsx9teOsiOU8G3CuB2IcS8qc
         z2D7c0Q3AUOU4ScLzFzJhFAq+zsowIqp4T8Db4bvpOkeodBaE17yGSA+dTD2NPMcIvex
         9ZrugNYTu7ZT05hdUMzw+TMAiQ83fM2tDoY6PV+6o6Ywfr9mxfwjZ18Zl6JilDZttBu2
         5b3y5dQPVMClYJf3cZ3wxjhNTN0d9EiNe2B1U1tSdJotmVICfgn2+Y0VN4PPwp56/Mfo
         rBPKgxMsfcAk0GQzK7wqWCwuQgMl7Z8LCUl9aoy0ms+9139qET7SS4zkVC53CIXZLaM0
         YqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805287; x=1696410087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YppGQzKW+2r3xnb53t/LIH/j9u+a8juMyAfNzTVGTww=;
        b=DjKAKsFc5ZKyMm8sb2ITW7Sgh459UVSIzJnBFawyOitIGqPFhorjnsHcJTBGadHRVO
         JpP3XxOVoCqeuDLkaxQiyphFFjPLQFCI3j1HqPzKB8IhQ8rhM9Kk8gqUgyJcapd62T5j
         aXNWExoDTGisCglIufPxouIsw6olpjT4L988QLO35Wk1J5bIbd7eXBZxETrIcmZ4gmMR
         umPkhY6dpe+1iXG7Dkjr9iJX5qyhC2g7MctkaVsIWDgO1yJRmvkxQhpNlDng2TOvUCPE
         KCZ8MiTGRJGoGxq8itk6HXhSlYgWTPDHUQbqt395uJTwP5lDT4ZqUxtNUUMPH97Vt4f8
         ufZg==
X-Gm-Message-State: AOJu0Yy2WeiuCrlDF+EHoQh0k2IJZpuVs5u4kNwOZzx8EX+w0AQ6rd02
	a4XSmeLMb9PgxhShELV7EOw=
X-Google-Smtp-Source: AGHT+IES/qcWO76tOeeuoIlprC1dblIRpibZEH/5iy8gCVaskuyWvzti7QClb5q84LqsaWehVwQJ/w==
X-Received: by 2002:a9d:4f12:0:b0:6c4:a30c:f3f1 with SMTP id d18-20020a9d4f12000000b006c4a30cf3f1mr1566244otl.19.1695805286685;
        Wed, 27 Sep 2023 02:01:26 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id w1-20020a9d5381000000b006c4e2f00135sm1086568otg.28.2023.09.27.02.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:01:26 -0700 (PDT)
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
Subject: [PATCH v3 05/11] dt-bindings: interrupt-controller: Add Sophgo SG2042 PLIC
Date: Wed, 27 Sep 2023 17:01:19 +0800
Message-Id: <8fb6f431928271bf9d5d4bba204729efdd12669a.1695804418.git.unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695804418.git.unicornxw@gmail.com>
References: <cover.1695804418.git.unicornxw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_020130_421564_775BA50D 
X-CRM114-Status: UNSURE (   8.26  )
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

Acked-by: Chao Wei <chao.wei@sophgo.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
Signed-off-by: Chen Wang <unicornxw@gmail.com>
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
