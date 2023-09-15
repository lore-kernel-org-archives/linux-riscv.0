Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC138EE6425
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VzecgKp6Sz8os9R7BRl5JEBaCJb9CL+QKVi2OGLMPhc=; b=h4FzguS+GLkXgn
	wFSNnDpj3pvREXTNzQ82ouOSv9dWraMyubVZh30M9JJM49/XZIgDZMetVjX3PTQaySnwFRoYrZll8
	H42HYRm9iRFIjxVSDrV8bkjxSTTk4HW5cfN7as72UomPbpLwT+K4hzJn6Twhn3YlcrDQByOQvvGaO
	fwNMIomu9Ymo9XI0hGU1uA/ZHwJ56pskvcRyXFo8RzBPk/CfAKR5aG6ojX6V2hESOHCExpIEQ4UeE
	UrobPpwFwGCDKKiL4OlwFCYjaT5EKcAx1LdMqdDsvGEPHlbnV6to1kz/y0Atidrqs3rJ5IXyX2l79
	d75Fgpw12UxuihTEVFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh337-00A0Kq-0P;
	Fri, 15 Sep 2023 07:15:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh334-00A0KS-1F
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:15:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c3cbfa40d6so16388675ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694762129; x=1695366929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xPt+lflGxmD7kew86V+AaK7Q6nPGEAHxfdx7vSqNo0w=;
        b=B2LiCTo6LZkCBgdUon/Z1W/I7bvL8CtGS8v/b9aWBIn9vWtqn2yLt3VX6LLbo+fd6O
         8DWlzusoiVuD3CvwFFQmXLNTI/fdD4wCKTmp05jI1T0iBMS9yG/mVHluTwEKBAg/qodB
         qvX4N6hSIR75dBVr2lac6OkUhIXrvZke9ED1Am58v/BnwL0B7nCrD2aok1JfZ1aU5xe+
         XKWXs83CLnpTxXK66BrZId6o0qMUTOIiNeimbW8DYcg6R5Chfd56nOyDkRewkNzfsJjF
         zqtsTJ8cgIAyEYOgy59zGaZ6Ju/uZbMrU0X5UkoPLMzx8jZZNUc8YTEWX5QHgEZ8dcvl
         oGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694762129; x=1695366929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPt+lflGxmD7kew86V+AaK7Q6nPGEAHxfdx7vSqNo0w=;
        b=miG3uDEqamMA7qnj4KZv9iJuX1AM/+5fJsGBe+CTmbdJHdYqcGWhPKYRT/gSYF7rdT
         XZG8p275O5UT3r1V4hbrUExt5vEy+PZ2+UbdG8fXv6QEdLhDFnPDleBr6cOm/YeWykBD
         Nt/G0HZ85j0+ZhISpJL5T0WvabyJaTfNGHK4YhFcd0sHtuqzSq9YZTdcAlgfzX+hV8f+
         ZW+8qyJKIvv2gSQZH/Iv/b77MQ19+/79sAIIBFDt+1qwSafV/B5wpI716lVKillysa2P
         3/J/afZSwZFZ8pYK5SF0eHhM9qHG3JwmC7NsiSUax9mRYlg1ib2ZDRgwbDtpxT7moxA1
         bAlA==
X-Gm-Message-State: AOJu0YwXLgDPJhCzevQMRIgotBYtig6cvER2AkWxT/pt4kIVsKrLmwdE
	HfDCzzOPdbPKIfPsXCNckxVKT/+0af1/H34f
X-Google-Smtp-Source: AGHT+IFCdr2RrtfYmIsOzqNUg5/c7ZTKK3DcpYDUDxfJxaRuGC+qz4+2B1LFXLrvhMSnOIofAHGA+g==
X-Received: by 2002:a17:902:a3cc:b0:1b8:1bac:3782 with SMTP id q12-20020a170902a3cc00b001b81bac3782mr889683plb.6.1694762128648;
        Fri, 15 Sep 2023 00:15:28 -0700 (PDT)
Received: from localhost.localdomain ([222.95.63.58])
        by smtp.gmail.com with ESMTPSA id q23-20020a170902789700b001bdc6e13665sm2723958pll.275.2023.09.15.00.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:15:28 -0700 (PDT)
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
	Wang Chen <wangchen20@iscas.ac.cn>
Subject: [PATCH 02/12] dt-bindings: vendor-prefixes: add milkv/sophgo
Date: Fri, 15 Sep 2023 15:14:09 +0800
Message-Id: <20230915071409.117692-1-wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_001530_444588_1F84BEF8 
X-CRM114-Status: UNSURE (   7.29  )
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

Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
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
