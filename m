Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD5ECE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 06:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uY0QGnvuhTKJZZhH3efwIP6Z7VtknKX7Txy7+q/JMrI=; b=aiqwZMjLbyZ1TP
	DfEA3r/srbrXwRKFp5ChGmYV3PNCFOCgfqXg/ojoHlOBmknj92kGBkCpmHXcLDOa4NFSsREJiXMSn
	skMJSX4rZ5EUuB65JKie7ERVT31+U1bZhB3OFoDv0HyRaTT0FIkg3LIwJOJQjdLwapueD4lPX2Jyh
	F1G+JLQEHp7JO6RbM3wrr0+OaESpS/obLWZKk+1WoHPfyS4YFZRwZ3Wzigxf53FHg+MetKz/cAcX1
	C0Bus36JbkZjuPfh0uJAiHEoxGX9zmlfgVmkJv4AhQGNMd7awrcTWwls2EAwXh6jG9FupgS9PRHxn
	RURjd4knDa50IcNbXVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqqo-0022Om-2w;
	Wed, 20 Sep 2023 06:38:18 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqqm-0022Nc-25
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 06:38:17 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3add255c88aso317145b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 23:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695191895; x=1695796695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqOL131eM6+9EM2kWhV9SIhEDvrKv/6vCDQf5HCxj68=;
        b=e2p6mVY5f68zexC65w361Vfz6StxvX/6G8ZWPIuVM+KI+FB2BAKfzSBWqr3IWlYRjN
         +OGGt1Pd6pAM+epFnsoY7e7EUfIdvYP3rAUPg5rMxQ/0hSLyngCsPZp9Q9YxPaeDwSGl
         8BApwLGucj3U2vtfCEv/80wEt5/mh47ruuYwgiP8knABgcywx6P/GmxoSGbYlpn/7OSy
         V+fm3bhCK9GO4llQwJSVF8wBz1qVFGq2xyCKzp1Q3VXWhht5QfLRY11j2vc8mssHWfvD
         AjXgc+y8vvWGj0KY28vAEAIyajdqs5EbnnTLOQWxiNCDeeRcXz+3UgH8FLFxtGI1PIrk
         Dj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695191895; x=1695796695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqOL131eM6+9EM2kWhV9SIhEDvrKv/6vCDQf5HCxj68=;
        b=tQ9Q3l/olNJqRh5LAGWyhz2dEnPewWVn1qxeKXgpLt0tO64g43/y1p7FNwrfeO1CU/
         IkZs+2mAfCSd3W0NSQmWhZ+b/WR47ysEdkrCx+H+s3TbnuiVWRsAPXlcb48Yw21Be84O
         DjCxzm5iKnjzpd8Wg9m2f9XI7SpvbfWfuH2HdLFjIkLagKBye41Jaf4B+w376KvcL9Co
         KfbORnQZqYli1uVvRHyrjvVgj35nsrxLeNiYPfvT6QPW9qK2fqu9CgYSQFrTq2YKlCcf
         dp46/QSS/5qG04FJBvjiSqdndLbSrUwAQInH2rIZsYeRy0Dh9vZteBCqCP4tmm1a1AgB
         rT7w==
X-Gm-Message-State: AOJu0YzA9+S6lO+t1pWXivCxmoup5EtvHZBBOwOnJWtMeiQjr/enySGY
	RPtnT0PWF5eAGomAGjahS88=
X-Google-Smtp-Source: AGHT+IEcsKynrDvut/VM3OUOKYAEi4DE+22EYsG87JkRtkakAbHE0xLs89S1n6DB50p+QYwC2S5VLQ==
X-Received: by 2002:a05:6808:d47:b0:3a7:33bb:e5e2 with SMTP id w7-20020a0568080d4700b003a733bbe5e2mr1286693oik.16.1695191895536;
        Tue, 19 Sep 2023 23:38:15 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id a23-20020a05680802d700b003ab6461c8fbsm5604896oid.31.2023.09.19.23.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 23:38:15 -0700 (PDT)
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
Subject: [PATCH v2 04/11] dt-bindings: riscv: Add T-HEAD C920 compatibles
Date: Wed, 20 Sep 2023 14:38:08 +0800
Message-Id: <c5061fbe8ef9c4971cd45de7b5d8408dc1b848b4.1695189879.git.wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695189879.git.wangchen20@iscas.ac.cn>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_233816_680881_56003750 
X-CRM114-Status: UNSURE (   9.13  )
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

The C920 is RISC-V CPU cores from T-HEAD Semiconductor.
Notably, the C920 core is used in the SOPHGO SG2042 SoC.

Acked-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 38c0b5213736..185a0191bad6 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -47,6 +47,7 @@ properties:
               - sifive,u74-mc
               - thead,c906
               - thead,c910
+              - thead,c920
           - const: riscv
       - items:
           - enum:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
