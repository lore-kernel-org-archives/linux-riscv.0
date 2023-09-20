Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB6BCE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 06:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0apQF62ATgbcErM25H15HSq6aoRRofSZ/cI3cRXyy7U=; b=zwODWYzyhICS+K
	/R78lhmTbkcixKjc9VAENubHQJH3BRtJwRcHH60WByJorekd9fu44nwDHrPqu6fb8StaohVRy0U3r
	6IWlXj6aQ4Qi2ybK1zrdIOkDSkl1fBCjRGLIqN2A/M4I+rg3cfLEv6Ym05zz0zmtDN6Wdl8ZTGYpA
	hqlrY5h2/79Bji1VYxKDAKWtZzffzu7ARp5cooW8T39/ZePtAu7ihnpamYe8D+pY5+9BBzoF9TQ9h
	w1fWoKTY6oYvYzs1DR7uwTGmKUwwg/Zi5GMgrYbR18dq7YiKtDDVGnIdGGOHDEzn5keIBWSrWy0H3
	4wPMhmKOP0wznkMYmoNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqqC-0022Fb-2P;
	Wed, 20 Sep 2023 06:37:40 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqq9-0022Ez-1J
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 06:37:38 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3a9b41ffe12so4457822b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 23:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695191855; x=1695796655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQ6NBSLffyQDUyw9Nsh5Ze1xMH7VpdACEUTAmC664ss=;
        b=lJSdkntanqbTQ9JrSqygLNdrDj9Uq3j+6+Uwczzrt/Fw7ZGW5yJXG8GouZoMWHH6d5
         HDV5IxYK3aBz8YK86/dx3FC13sUTebNtfMZwu/PYisL5oqFIbJMRnGk6BQwKT/EQbg63
         6zQytrgEciRhzS2SFZagX79JkR10ikT6xQKepjaU8dna3vVNNlWEMyz/xExlE9/C+a5t
         O/diKlAua5gsc8+ZbhU31rB8XFpLjnC8FV2gb9LSF2hnvDWNN1OYStMT7U3snR3v9tZo
         Mb9Ki8grPWaRoZALP86V49z5KwBw9V1StRB+dlDuUmRMQLTYRbYQ8owt0FhjWr2uVyAI
         vU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695191855; x=1695796655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQ6NBSLffyQDUyw9Nsh5Ze1xMH7VpdACEUTAmC664ss=;
        b=k6juDgwz5DmCrLUFOuTLr5S6dgRkfQUDynniT/QOp6jbKO/R1fxMqRhMLS3qESigMd
         wLA76Nwh2HSbwlPCRjuFg/DmTBK30THNaJqcP5E65WxM1gRRnGnJr6Kb3kxIbKO2wtBk
         2sOWUfLf3MnJhXoitXv8JryHHHEq398u7sNQZblqrrCxNaC1EqT8DQoK3G6Q2tiTE+Wp
         1JlTJQerdl/7N0MNmDBDvf0jJ3QHU/Vp6pqUly59kUMOylMKn6ueeREHQlqDg7V1qLsD
         8JrOYra+NbUfOpPnE72R6IaiSRHPEx0e8XvpUtruXyfKhtP1dPALH+fIAq81qCxJ2NE3
         V5FQ==
X-Gm-Message-State: AOJu0YxDz7vZgrcOVvQb0hrs4QGa4DhowWnuDgvoj9uj1Up3psNPyicD
	7sy3KMkyM0vxlFIw9rPF/Tg=
X-Google-Smtp-Source: AGHT+IE662iIMmE8Tx/TZuSvjCwuu2ZkKy5EsZzZZdv5EWqCqxMdo1lpSdW7efhxPf78AjvV5AejEA==
X-Received: by 2002:a05:6808:23d6:b0:3ab:81e4:4da0 with SMTP id bq22-20020a05680823d600b003ab81e44da0mr1636330oib.42.1695191855227;
        Tue, 19 Sep 2023 23:37:35 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id m2-20020a0568080f0200b003a75593746asm1717253oiw.57.2023.09.19.23.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 23:37:35 -0700 (PDT)
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
Subject: [PATCH v2 02/11] dt-bindings: vendor-prefixes: add milkv/sophgo
Date: Wed, 20 Sep 2023 14:37:28 +0800
Message-Id: <dbd7d823a73d8a9484efcd55f6616f5392daf608.1695189879.git.wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695189879.git.wangchen20@iscas.ac.cn>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_233737_442191_8D358C58 
X-CRM114-Status: UNSURE (   8.98  )
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
- Sophgo SG2042 SoC [1]
- Milk-V Pioneer board [2], which uses SG2042 chip.

[1]: https://en.sophgo.com/product/introduce/sg2042.html
[2]: https://milkv.io/pioneer

Acked-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
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
