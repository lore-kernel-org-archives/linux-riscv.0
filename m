Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F82C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 11:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPWfS8gtiQGM7+Ic7p4ACIKOga/R3PcNswINjdxnG/c=; b=Yp3Rt9DC5XknAg
	lx4/GgjtZuAucLwBFM9egJDjg6s/4PMp7FgleAZFzgQEP1gSv23XByCC9diq0pJEc+EXID2UDexmj
	OkARCQD0W0hq92YFNjyCLsjUPYLUUmELdFaaVvIVc8Oc4OdLCyHmbqXHdhNla7gj4OixRPsCoh8Eb
	YSeLuti2VBinY/5h/LbBs+Vsm3EWAlvihKe8BtL3XPV6YQDlMn2qutvtE9Arp4ofiLVXI6QX/aQQL
	UE2hQ+t1NmvO6HMLmkYjqbwhRn5EJPUUv9spdILVBoc008JaLj5tki2ZgQMJzYw0PvEbcnHRDiPsb
	eqaQMd00V+d+9MCnCadg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfSM-00D59m-Id; Wed, 27 Jul 2022 11:44:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfSJ-00D56s-VP
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 11:44:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id b7-20020a17090a12c700b001f20eb82a08so1911704pjg.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 04:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/CPQHjznoZ6b2glx4mv5BleZiD6F9CrQGa2QjZHjYAk=;
        b=FRPQ5DEeON6hr+ON1ZUCBRqVaD6UKtMN7FWnG+TiJ551KlCqDdy0r3uLcwH2HL6QJH
         l7WDhuWl9MkfjaS0XSPgW9n1unZhtd6+ZfZIrtE0tIBXUKu/nxEI8OzSdaFZhd36YBw+
         wbWNIjvHFN6IOiBHmHuSoXwZjtEnI3g6Aquz2voLi7ZqtjwNt9yj4UpVrKUpMt9LYOLV
         YFedqPoHh7qK8JDHl3M9tTn+9SS3ruir8rwhVtM13Btz83igBcjWQzRMQYfrDzbONY4O
         MQyTStOXmK5oUhHGLHrZVgYo3MU7fQNWgfu66fsCss8DYRVxISd/TFoUlrgTkqMwzjIR
         fSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/CPQHjznoZ6b2glx4mv5BleZiD6F9CrQGa2QjZHjYAk=;
        b=saQQqlDuOW0DEqi8tGwYKk8Dx/zhRLvurGQwfTc5aBfmXPXaWe+3B/HrejXHzyBq8s
         zCU+LuTuLwlz750sPdIxtaIGH4ZAgfuxG7FDvVyHMZsrzGQC037jQ5cdxb0JcHfNa//G
         tR6/u+Dx2wwxVAQ/rFYg/2EUxrXjUKNUEw1cGsgG9U6IFvgtO+3/2RtNPLW+Hwb7kBRa
         mMITO05TARSrQQ+yWu/TfPuo+enk3i6fBkclfQj1sWxOK+yM2stQknFcd+qogRCf0Tx3
         nlZno2Oe6h2Z7KBjZ4uk7pvPtynWf2oalJgEh+fFbcPugeijsD5uWH2kK5dWXftu1/rG
         3qrg==
X-Gm-Message-State: AJIora+sUhyZeTyX1qtEIPV2+14IU1yk3Os0GFohHoikMY1jB1HVNQvV
	eIJq0d6lm0sFpe7Qgu+XEs5hBg==
X-Google-Smtp-Source: AGRyM1vnaKRmTMYomS9eDouKLzyJu05leK/dJlguPo3uyJqQ85jD8Cdr1zYUFAC0wnfYAIhPgdEy4w==
X-Received: by 2002:a17:90a:9bc4:b0:1f2:389a:7faa with SMTP id b4-20020a17090a9bc400b001f2389a7faamr4282213pjw.72.1658922238405;
        Wed, 27 Jul 2022 04:43:58 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.87.63])
        by smtp.gmail.com with ESMTPSA id o8-20020a170902d4c800b0016be9fa6807sm13486685plg.284.2022.07.27.04.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 04:43:57 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 1/2] dt-bindings: riscv: Add optional DT property riscv,timer-can-wake-cpu
Date: Wed, 27 Jul 2022 17:13:01 +0530
Message-Id: <20220727114302.302201-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727114302.302201-1-apatel@ventanamicro.com>
References: <20220727114302.302201-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_044400_036771_D627E4AF 
X-CRM114-Status: UNSURE (   9.39  )
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

We add an optional DT property riscv,timer-can-wake-cpu which if present
in CPU DT node then CPU timer is always powered-on and never loses context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d632ac76532e..b60b64b4113a 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -78,6 +78,12 @@ properties:
       - rv64imac
       - rv64imafdc
 
+  riscv,timer-can-wake-cpu:
+    type: boolean
+    description:
+      If present, the timer interrupt can wake up the CPU from
+      suspend/idle state.
+
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
