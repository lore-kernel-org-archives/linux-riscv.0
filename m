Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA69E810AD
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 09:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSTkX3GTnBfY5etWbUGgxC6YrP7p5oeqtIAxXOFYHoc=; b=HeZU92483sftqN
	eW885oqxh1VqcOfURJq3t2w99MrMlikzT6BjbCABA0X0OghG9RXe3WAyIslo3G6nggpd4SV6cQYr7
	+XhI33qhrBh3Hat6zGCbfE7FEemZZaVYCyVEPubzWTqSoTSWSJm2PRloO6zpyJsbuYMELgwhMQLk+
	0vOWsal1x6FgFjymqaivuxsBSwLtqZHZKjOeI7y2SHwADvmN0uNjo/2nn4RRNfiufUG9MkLE7Lp79
	mTsoHzl3fggNolHXSDdFNlUlBE+7Qt9Aovb9n1uzCpfKCn22o5lKsS1kWy0vgi47YTiGV31qbJvZt
	piw6/Vgglun/B+bmyQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQPw-000PR3-2j;
	Wed, 27 Sep 2023 09:01:12 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQPu-000PPo-2r
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 09:01:12 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1dceaa7aeffso3554835fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 02:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695805268; x=1696410068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODqNNHjxC0NVeM1m9gAP6A0kzi93bZeVY7W7icOmVaE=;
        b=YMvZzAtfAr0hP49z/UZApYLsBpdxFykybPHryfiZ6VC+eqsTKCbvnIb7tRrUZWWgoJ
         XKyz8xDxQOXfeP2BQk63QkcTz193AkYibwmiNeY6oAPCK1MiWJ6Vlf8TqcUVfp3ltLY0
         4EKaKZzc7ElTZg3YBMT2Pjop6dzfzErJkUiwUO1JNUe4J576bZIjB7QX9gxydnbAk2Fu
         mS8hlOwbb5iqgxAeDUH4/6WU+tIPVlpH4hKssz5doYzxXG+achTEjdKj5qXEObIm7KNB
         8koa4TfbdEIvfi2gT5CP9HxlIa7Wu/S4HdzBKx+fGVNY2H/zmBtmWeLpW8PY6iafkBvu
         CYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805268; x=1696410068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODqNNHjxC0NVeM1m9gAP6A0kzi93bZeVY7W7icOmVaE=;
        b=hLWCuIaXtgoxlNG6nBzeMAW6Vx4OmlT/Qndd/1xUXqN9creqpu9iEEoOSd4mgE3t9Z
         S4hiAdrbEaFaKowB6VhcigHnEFKftaf9wePUwbyj+xrBUeenVXR+2qm1dbD5E6eiBTt7
         nw3R5pFACy9rzekZic7dVdIRCcW4ErasyTNwElZFLu7Cyi4KJ6k9HyeAwmfuT30dJHbw
         jTql5w1DYg8SwMeoE6f6dXFwnfRib1+HH78O3OKzexAY7QN07T1qcd3gu8qndVbmEM1x
         L7+r1oi+sQ095SLsQHDWUf/qFgfrDMeg91gqKS+MyBOX+mkWWUBKbczwOAdwlr3sKnZU
         Dtxg==
X-Gm-Message-State: AOJu0YyJMnAjwbnFKRf9XPH1X0zAenAPBFyMX2zz1sIa9sc/M3UlDquo
	d3PwWFcso+dB9s4HEnNfDC4=
X-Google-Smtp-Source: AGHT+IGTYEQQtusE0CyCmkiDlDcs60WYT32tt0Bi2KqDaJl4xc9ZEqgZU2IC1fpPCb/OSam53TE05w==
X-Received: by 2002:a05:6870:2383:b0:1bf:42a8:2cd2 with SMTP id e3-20020a056870238300b001bf42a82cd2mr3169881oap.25.1695805268582;
        Wed, 27 Sep 2023 02:01:08 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id ms17-20020a0568706b9100b001dd842cc563sm402554oab.26.2023.09.27.02.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:01:08 -0700 (PDT)
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
Subject: [PATCH v3 04/11] dt-bindings: riscv: Add T-HEAD C920 compatibles
Date: Wed, 27 Sep 2023 17:01:01 +0800
Message-Id: <f7e71c60389973eea49e9e97ca50fc8c9c34e637.1695804418.git.unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695804418.git.unicornxw@gmail.com>
References: <cover.1695804418.git.unicornxw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_020110_923602_F7F4D690 
X-CRM114-Status: UNSURE (   8.72  )
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
Notably, the C920 core is used in the SOPHGO's SG2042 SoC.

Acked-by: Chao Wei <chao.wei@sophgo.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
Signed-off-by: Chen Wang <unicornxw@gmail.com>
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
