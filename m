Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A87EE6425
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0yjRodQmmPYw2M1cEYBBT2WeKrBqTwLbrNYXRPw3Nzc=; b=Nq4qoai6CnXYmF
	FssiLiDk7Xe1A4o8hyC+ShWs5UTUpFW+QW0RCj8yaZ6TuHTSjS5HBvmT4Ye2kG8Zi6/ekdck90t2y
	vHKi05JDFtr7wvclr7+aYwT6ouZy6eF6WS9WKkrw1XuYh4DK2yoR8fhQ/Rs89vBXLgV3/HHxoPJVu
	goFsxuSMecZuJtGEcgNIcC6Daa6wP3DBckXoGCFBtEmEJN50dtRmc77b9IcXiJTgAhj3O71Dav8Z0
	aNm/hNHKIYwusU6pEG8qgTUwrpasz4s7oYH+b4uo5siwCbN5Rq0A3RSPcn5whRFgeSQfxPrjzflKA
	Xp02FxZWfpuHle/+Hv/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3BT-00A1GW-1u;
	Fri, 15 Sep 2023 07:24:11 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3BR-00A1FX-2X
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:24:11 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c0ecb9a075so15239735ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694762647; x=1695367447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QaNp6vd76nBX4EIgc/17q2XiC73X4sxuT4uDWwfKOL4=;
        b=kCVAVC9gB8gE1BSGQ3+KI7geTqtyXXhPno0LpTaOHYfZtGhTfTZ8qVfBFkS06EicdT
         sH34L089XHKJ0ZyOTdoRQfo7ZMbDmDKVnxJ7bGrpC6k8kqF6gRQCq30GVyf+12z6vLsV
         LaWVhRGMMclyink7He83Nqr7gQNtHXaTXkhSBdfjtmpWzKVtiRmFuFDVFQJH9BqBQr0w
         PqC58Yh8Pw4cPB0D+DJuKvo8ktQz1WohvbgNxCQkwHQI+lxYP5zL9q66llJsY2dzjPwv
         AHf2YOL5j7f2mmrpQmaiKLDZ4YolsBZJnTNnu9zYawrD2Kz91mBmkKYSTHYBtdDxPp39
         D4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694762647; x=1695367447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaNp6vd76nBX4EIgc/17q2XiC73X4sxuT4uDWwfKOL4=;
        b=CiBJeP9bBXdhs5Y5wMRIVkCO/Omeoazhn3ZUCpBHpsX5dLhHgfsvuM+5lQIarTULcH
         S09zcHvs2t3zmS+us93SYYfS1Bktz4pND3zmK/2O6AZZWrmPBtbM3LnDao7nR8ZjZ9o5
         VeKg5HZahwP0dQJOr82KYP1UTUXMxm+XjrZirzH1F3z/6hLjTq+49si4PT8Y0TXJKibT
         n77XjgBySGqgSuNRnmyF/FrHgD939KaY/yE1DBoSQDuj5Um56rxRoT10ZSa3Q0ruDrZQ
         99vH/XPuPLqD0bDA4VU58XRXpsz+kK9OoRfAlMcHNTPeaqIYJxYlgPBR7HPactUBURAl
         xlfw==
X-Gm-Message-State: AOJu0YwgkrHAa8OcAHjqyinqpJ+5qc7EYZmBL0c76jjKUw6JXfFrifuI
	HhcEuqCf/ncofVwWh+NBIuinmVDmYOsdSA==
X-Google-Smtp-Source: AGHT+IHyv/ddLA7MSNkIAr2jiHyMnYSlV0XYvR0QP7EyYs9q3c9bwg8H3ZjmKsWw+CfJpBwlz9L5jA==
X-Received: by 2002:a17:902:7081:b0:1bc:7001:6e62 with SMTP id z1-20020a170902708100b001bc70016e62mr740375plk.35.1694762647382;
        Fri, 15 Sep 2023 00:24:07 -0700 (PDT)
Received: from localhost.localdomain ([222.95.63.58])
        by smtp.gmail.com with ESMTPSA id bd12-20020a170902830c00b001b86dd825e7sm717590plb.108.2023.09.15.00.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:24:07 -0700 (PDT)
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
Subject: [PATCH 05/12] dt-bindings: interrupt-controller: Add SOPHGO's SG2042 PLIC
Date: Fri, 15 Sep 2023 15:23:58 +0800
Message-Id: <20230915072358.118045-1-wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002409_825055_10CF044A 
X-CRM114-Status: UNSURE (   7.78  )
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

Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index dc1f28e55266..3abb1f68ea62 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -66,6 +66,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-plic
               - thead,th1520-plic
+              - sophgo,sg2042-plic
           - const: thead,c900-plic
       - items:
           - const: sifive,plic-1.0.0
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
