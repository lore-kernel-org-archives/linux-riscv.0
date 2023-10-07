Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3985FE936FB
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 07:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sWTdgEZgHIW2lkE2n6puZlLYswJJlRwYe9rVSrjdkVs=; b=377YNKvG20aPOG
	Q+lvVnfsWCmE16KA/X1tNt0rOhEH2B2zJAIdofn0rDz3BAKgWZ3qRYc8kTdCLM26x1GUvvoJHJFQv
	2/ssxKNDhBPIW7HLXfE5nv7FdhKoK0eup3BBv24/++gMv8sBbxY4doMGwYjsnul/U0X/uiT6HnpAN
	cNlcXlWQVDVmM52DgSkEY3FvZ3A4oKoxGoHa+eR+M584MicIsi6Fe/FsHAuuDfppGsyO6hgKeO4ra
	CxkEQ26s/wJ7NVjPgH1RFm1urzFJdZXaEJDZFdGIt97rCIod/HyT+E+3wjmxq+pluHOcejMwxSkhy
	mRBcu1mi1nlDgciqTvFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp2A2-00792l-3D;
	Sat, 07 Oct 2023 07:55:43 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp2A0-00790t-0O
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 07:55:41 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6c4d625da40so2004984a34.1
        for <linux-riscv@lists.infradead.org>; Sat, 07 Oct 2023 00:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696665335; x=1697270135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Srl7q1CDQqnOcA8A4KoDbSUD1lo3jJe2F7cZabOFURY=;
        b=gzMsub1i5G03x8NxOK12uphRWC6IyXIvca80UeFj7H3jI2fn9GjQ/c5w29PK1WVLKF
         cas+BNLEXFyhpcqmAWiypLJrXYscAwK6gkWd7vf2yCuF1vmp2xYiOsePtLsweSEa7jj4
         MJAHCHdrzBk6Rpx87o4Ivh6Kv1Xr93LBJhX5aBVzD+mXavy0nTbZ0RVhMXGu0NFQcYc9
         8fMSCQh0u63EeD81DQMGKW8gdOMBH/mDJEgrY1ExZ9OoIXVhlDscbvLM2STGA01yjJ14
         /F9KvFnGXJ+9gvTAokFqjzR6aZ8VBg7vOqi4trvATPSFCsKSEFfeOU4xyCRj2Sgc6Zc+
         blPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696665335; x=1697270135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Srl7q1CDQqnOcA8A4KoDbSUD1lo3jJe2F7cZabOFURY=;
        b=L5U1nSSM9NyxlnnaaNXdcc4QjEH4KG8gIa8Q8SaDBysxjgJj3MdR7e1wEQ/0olmUqO
         0i3IFf9FCy2dLfffNGFaXD4T1bMP2Cg8oy7bOn9yj05gVcOeRr/HBLHacNUIpiKhmj6s
         7/PxGdsbMwFpYtH2yxQn025YDbRm0d3dKFeyEuqFirpEuRkhSg/iGgAr98DPankkfpKf
         jNXXwJTuCat8eqRbZ+pq/qSPSq+RSEef0OdgExx3XcSwEObXysLUN2vdx+EzF4HwmP7b
         Cf3I6tcuZD+m7Ul70QPYjFseevo+Hni+a7cSzBvrwgwjwSbqwUbc6Ig5iXxPdODq1rDb
         fP5Q==
X-Gm-Message-State: AOJu0Yz3qOVRc0I4l293avNqKM3AjD3PzGJ87+ay9h/3wGR8AZzO8aau
	IEPzqxtv3L/Jy/YuDfohxBvK6IN3SQQaoqI5
X-Google-Smtp-Source: AGHT+IHs2ohbPpXYA99aB8ELd0gUEDQJsHk9lTEy3E25h+y+yzB9uVSfHjmNczbSroS6r/oWrbw70g==
X-Received: by 2002:a9d:62cf:0:b0:6b9:cba6:b246 with SMTP id z15-20020a9d62cf000000b006b9cba6b246mr10165678otk.9.1696665334888;
        Sat, 07 Oct 2023 00:55:34 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id x2-20020a056830244200b006c7c1868b05sm666285otr.50.2023.10.07.00.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 00:55:34 -0700 (PDT)
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
Subject: [PATCH v5 04/10] dt-bindings: riscv: Add T-HEAD C920 compatibles
Date: Sat,  7 Oct 2023 15:55:27 +0800
Message-Id: <0783d4e9c9fcea8a84a8a7245f87168d4b698149.1696663037.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696663037.git.unicorn_wang@outlook.com>
References: <cover.1696663037.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_005540_159926_59DEF8A4 
X-CRM114-Status: UNSURE (   7.99  )
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

The C920 is RISC-V CPU cores from T-HEAD Semiconductor.
Notably, the C920 core is used in the SOPHGO's SG2042 SoC.

Acked-by: Chao Wei <chao.wei@sophgo.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
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
