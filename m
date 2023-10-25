Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DCFC07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 14:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SiZGZ8Pyb4qVPaI3Mt/XIkBpGEUPjPPTrvuM43iDLtQ=; b=fTCondxrQmX2Zl
	p3XVYEgY6uYyPay/dbUz7F3eJAS1QwmGQa8TdsGXoX1twa5HSgeN2ml+lHfDrthWdkgFZfj0lIHVe
	LaUztu11LHNfLj3PbGqMGaYX39uPlQ3p5kcDjRIXJgFvgqm4WgsqDpZjIkwvyhlriN7bEE9Kb8dKw
	F306F2Y1mGqVhVPqxUKQnyHJ55gMEUjGIvlaqj0fKcVZ9TVzdoejJUvtQZQ8CvOw0v/tcleB/wwH6
	EyEewM5uODSgDd9gyRwP5GcAfark/WMgirStkxOvSNYnDB6NDQYss3u/YEA5MLlJlWKnbHVVtTknq
	4CmLTR8hmdh+O/TAm/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvesJ-00CW7q-2o;
	Wed, 25 Oct 2023 14:28:47 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvesF-00CW6P-2Q
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 14:28:46 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6b709048f32so4799060b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698244121; x=1698848921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYhetJOGeGWONv0pBZCT4Mywf3EBvVtv+lOqGOUogJM=;
        b=nI0UdrgGOt/EIpWAIxgYtP5QpefbGlcPEvdzL5kedA0+rK+iMwsoWU9KCsjF0Tados
         oWfTuj5DSrZfYtvTVODAzS/oS0es8LLvde7PJGRMwvopV4Za6ogjlLC6p4khbIASIAb2
         wIvbXBCsuYVU0QLvOMnPDsNomCN6khFPVgAYSSkJ8D6ITRe2AcvTaQkx8SF0bDh+dXIp
         a/3+blWY0DTIfQhcp8Zh2fWilaXRSQr93dwk0syhBHLsIC5OLbqeULiKr97y17k6OTMx
         //W/0UBJtJugQqh9q/TT/pUu1wyEB6c6dhQiHNvw0Qf2qqcKl7q28PzmJ6eA9idWTtcr
         xeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698244121; x=1698848921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYhetJOGeGWONv0pBZCT4Mywf3EBvVtv+lOqGOUogJM=;
        b=AwlsYruXG01kZz2VGlUojibpAVRa/4kfDZnpOQ88TxrELaUKfJw6TdVC3d9dySa6Ib
         kJyrI9fF7kHnwpxtLSUkz5Os6qmCkCsoBN1V8ElFIXpS9h2Lzt99hg4OJ3UTnAu9vtan
         SMHeSnTUuCs8cmwt0iKfuLZG9G8aBlEAESHI+69gTs1coOoB5aqEvRbyzvBFcWg6OWkO
         jQZjIXXfiQHLGDonvzc2JneHt3kZPwF3OxI42SCtIqnuvDmTnNl15CnWW3KQgNXcyq5B
         nkFPKufQ5lIVPxddCPNOF9XcW2JYDKonMe4JFx0BpR3fmwkr/PzG89FKsXSYDA0Xq4JJ
         uk5Q==
X-Gm-Message-State: AOJu0YwMTThAKiz64z0/P4TqTbyI4Xw183BAdUk1TNWmmei17VwFOaad
	Ip35/YhM5v6Q/l3RQXhQwya87A==
X-Google-Smtp-Source: AGHT+IFQNbBr+sMT3u5z/l+o0iF+ppZGPFxjQxnFACN4M50PeyfMhxm13pEjMBXrYf9gZntSp2P55w==
X-Received: by 2002:a05:6a00:985:b0:68e:417c:ed5c with SMTP id u5-20020a056a00098500b0068e417ced5cmr14915842pfg.32.1698244121321;
        Wed, 25 Oct 2023 07:28:41 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id g2-20020aa796a2000000b0068ff6d21563sm9817411pfk.148.2023.10.25.07.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 07:28:40 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 1/3] RISC-V: Don't fail in riscv_of_parent_hartid() for disabled HARTs
Date: Wed, 25 Oct 2023 19:58:18 +0530
Message-Id: <20231025142820.390238-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025142820.390238-1-apatel@ventanamicro.com>
References: <20231025142820.390238-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_072843_794204_1DE7FC4D 
X-CRM114-Status: GOOD (  13.37  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The riscv_of_processor_hartid() used by riscv_of_parent_hartid() fails
for HARTs disabled in the DT. This results in the following warning
thrown by the RISC-V INTC driver for the E-core on SiFive boards:

[    0.000000] riscv-intc: unable to find hart id for /cpus/cpu@0/interrupt-controller

The riscv_of_parent_hartid() is only expected to read the hartid from
the DT so we should directly call of_get_cpu_hwid() instead of calling
riscv_of_processor_hartid().

Fixes: ad635e723e17 ("riscv: cpu: Add 64bit hartid support on RV64")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index c17dacb1141c..157ace8b262c 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -125,13 +125,14 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
  */
 int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 {
-	int rc;
-
 	for (; node; node = node->parent) {
 		if (of_device_is_compatible(node, "riscv")) {
-			rc = riscv_of_processor_hartid(node, hartid);
-			if (!rc)
-				return 0;
+			*hartid = (unsigned long)of_get_cpu_hwid(node, 0);
+			if (*hartid == ~0UL) {
+				pr_warn("Found CPU without hart ID\n");
+				return -ENODEV;
+			}
+			return 0;
 		}
 	}
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
