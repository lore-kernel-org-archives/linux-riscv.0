Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA30CE79AE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 06:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qslFv8rMYqPSyvfTXeTdjp4mX0ImI3OA8Qv7Fz1bmes=; b=3GOhgYlfj7N2Fc
	8JifFsdg5b7E2bPLXKWNxRoztiGUJnsw8c07QlVzXoszV0w4Xar1YT596wCBm6wyzaKK3QzoZOm3e
	ReNudA7f7PF32c/dCiTDtZFrSf7kAVbHMFACkI9LOkKL+NAvNgn6alSXZFC6J/tT1WWRd37r8SlAa
	0ypog4XsiA5j6ndW7AFd58gFvFrtSB9px7pOw2XdVq2z+T6KpgQ0aIcM0WPYW0oaAz1NAnGqr5nSg
	igAryNv8672yYMRY+zP7uc+4qUN9dre5nvDkQ2TPKhhaulHQEiF3CAyfQx2LBCGJ/tRAJNe0XmRTR
	T4gj9f51CUz1bfuocgGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqsc-0022mj-11;
	Wed, 20 Sep 2023 06:40:10 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqsZ-0022ky-2H
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 06:40:08 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-573675e6b43so4165164eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 23:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695192005; x=1695796805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwXg+ilQ0RHmfCXNasOazmFwYr/JJwhhEAkK60Nck04=;
        b=HRpJaOPyEHyZ5/swI/fGRJJLbTDsyA/wDk9ZjmisvfAhjngv3jJkJsfCEa5tKeMEdK
         DfeCGoGPtrFlCg/hFfCBO24NdIgpOII9Uji6Fh/AOF5gaSvvm0effWW2PYvZibBI8OH7
         r9nj2t/Kjl/DB+nrBk2Jx/PdIHVlsE7MJlaGtnC1O3aKJEi0NHBwmP0ssvxAopfNrcME
         jOOX1UnNeKB0yVcDMa6OcXvS4pbBjbO23ZpfZdeAV7zBT2gSJZV+zxfXSEYNBqdX3tHH
         vVCXHR0wUuo24U6bOAsPnG/X9O11AkOF8tBd8M800uZ88lgRgFehYTi+ZK7+uRz43RC6
         4ioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695192005; x=1695796805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwXg+ilQ0RHmfCXNasOazmFwYr/JJwhhEAkK60Nck04=;
        b=tIOUPeo8n20ZCtWEAllKdp8FXNTdzh2XvyJSr92Fag3betcO288/PrcbhxZznwcm74
         8HrPTjjz5hnXU4IqhaMcFpWxdCgcqNGFcOkvI/FG8Y0ndc1rZkKQz86GZdVcDIkRLX9M
         hTAcmmTHDFquwZmgX5TUUqWAmkHe+mvAcL2MaEFUdvQjD0OVWh2JnxkUtddZbV1KzRRs
         KSY+zMWCFBQ1EUYc25qiy0JCxfncFX1c+wzY4s9m99kr2/TItj1uKZ+7xeyqeONvXvT+
         jFR0Dj9ve/jNJ2ftRF0EDsjEQxGKYPnBqAxVVuumW8+7Y2LNO9qtF0N7D40TsgZffp1I
         XTXA==
X-Gm-Message-State: AOJu0YyMKZm+WFMpfTH+myFNG6elJob8/WNJQ6X4vUSygrTs+DaOAbOo
	lHiBfZzpFRbDdv9wheYOKzA=
X-Google-Smtp-Source: AGHT+IHW9cf7GsKofv0VrXQeWwee9ruAO4LJSIL63WsuVZFAbAAr2jucMD2LgmNLvK50rjiBsZPYAg==
X-Received: by 2002:a4a:e096:0:b0:57b:3a07:181c with SMTP id w22-20020a4ae096000000b0057b3a07181cmr261020oos.9.1695192005156;
        Tue, 19 Sep 2023 23:40:05 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id z196-20020a4a49cd000000b005768a6a19f9sm6450618ooa.2.2023.09.19.23.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 23:40:04 -0700 (PDT)
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
Subject: [PATCH v2 07/11] dt-bindings: serial: snps-dw-apb-uart: Add Sophgo SG2042 uarts
Date: Wed, 20 Sep 2023 14:39:58 +0800
Message-Id: <05fcf91d60468323a6c7cdb8ac57c356ab4a3050.1695189879.git.wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695189879.git.wangchen20@iscas.ac.cn>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_234007_744289_45CA2FA0 
X-CRM114-Status: UNSURE (   8.84  )
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
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 17c553123f96..011d89e6df0f 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -45,6 +45,7 @@ properties:
           - const: snps,dw-apb-uart
       - items:
           - enum:
+              - sophgo,sg2042-uart
               - starfive,jh7100-hsuart
               - starfive,jh7100-uart
           - const: snps,dw-apb-uart
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
