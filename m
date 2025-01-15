Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FAEC02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 07:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cR9X7ZbvtaO1vxncGO3OZ4Gg9cTPnsXDnr8xK/ZNDSY=; b=Cgerg6N1D2/AoT
	ata33q/2HW/FV4n06oycZVlmL5MCpZs4/RpuIKDiFfKd9z2APCjtYdrb7bQBTrvyOC4OQqBLWAs8D
	nUdbQxt2XkYrX7O937qtR0oq52Lo0lvSF+odVhQcvwwil0cGVNzTdxSjl6mNzek1a+vpNjDtapTkC
	xHLK4UvWbfe2zKosA34vlvFlMg12t96rOOf0oYjScizKaIfpw8/cUPTF7D1nVh8ueUJe8HlGMonx9
	xyzKGDjsOqL7tM2R+eTqzcJvARa/m7IBoGz1vmt47xJ/7OPNa/ZcFP3daX+8Ch3K5AmZB6KrN5LgO
	CDmOHhwfT7mJCUK4TdiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxUu-0000000AtXf-2oaX;
	Wed, 15 Jan 2025 07:07:28 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxUr-0000000AtVu-0rEE
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 07:07:26 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-29e70c9dc72so3387324fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 23:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736924844; x=1737529644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlFqZHbRMZQIsl21pBG7gtzE+yobsjoVl3cax1/kql0=;
        b=dRDgsb2uT1PDfO5phHwzy5JDNduk0l+jVtHWq0G/G50NPsdG7yWKGjKN05ReJpPp3/
         A2oNPLQ8Hb5QClFY3OlcpnEdikNGAQyPJsc4QbRkuWzCs7HM9zdi31W2jqx8nqVp/+tu
         KH7bf0XSW3khxsKxh1omWwOFQ7lQkgtoojOgI+26JLky2NiCxYZNHGlHu/25wnerA7On
         dIRvQ31YEG73E23bHdLd46x3FJ+mztVGEXmD8RI1ps2pTyEqPhhY4M0jdKM+LnKQLVBg
         cGc5Vvk7KK/EuQTnQAWDOmXditedYayizDtzSHq1gs3Gbvqa4x8nzzu2Wyi3JxeDYQrz
         ZiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924844; x=1737529644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlFqZHbRMZQIsl21pBG7gtzE+yobsjoVl3cax1/kql0=;
        b=AyhxOhSgfB7sZ6SymfRu4x0UGAVM9pvFAmTrFoy2/AyA94MHiyvzMB7yjsLJFxboHz
         2TlWk7BnNdgZXHLrPvIs4pGI89UL242gg32uWSikirgpb9gMIyGf0uLO+0njMkrmxu50
         zbSx7a0VN+2SlmYr3YNs9kAjn5vR/Rn6lCzZgArOKZZMNx70bpJw37LhYO2wYQioEWGr
         sbauvLfEk6jLYrRNjPgXX9IzVjVGp80BQX3QOgenzLXVAWaadKD87PQ1oFKY9DDFQajL
         a6F5o2tWVazLmmMmV9QRi7p9FqgInQksD1xuPXeLbC6ZdU9gabtyASNSnl17rzPUnu6n
         niZw==
X-Forwarded-Encrypted: i=1; AJvYcCVqNsjfFzVDBjPsRj1XudkFUXt0l4BZQHChiG8Rl6QpWoV5vzC4NTW+CKcTo91hEvR7RpowYKLLtBD5Zw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxdyUGfnN/cGrRwSY5Mff2yjmATzLLEhLISH74/dM1owADdCcm
	1AQG1kxolau5jIUeW6PZA2j52HP9SwLoPnCYtS4CHxShaEhmhSYI
X-Gm-Gg: ASbGncveyvWdzj0Y42snWo3wIKRAMrq5358YsUh6cftspFTEmQ1zdujMNNCgKkqVHTt
	qX/Nhpi3E3k3lLgSvak0Gd5JJS8PX/McxiBOPmiEsvWg5jnTPC2qq8tALzFWPQLuGquYE50gWpF
	zvfLzDR/xlOa/7MzmzaX8TUsq3j47/yN9Oz7Wk9UWLJ42CkBF+axyV4jrjc6vSEOdCArSbSag+F
	AnlbjW8NzI3cc10Wx0sDSw+FsjazPg3HEVc8hj2eg2Shj+6pfn8qa5mZham7+7QT10=
X-Google-Smtp-Source: AGHT+IH2zwPcOIBs8+fceXZ8ucN4/6KD5TvWigTV1j9AmgF5uoZNytOQGOluCGEdhsiy5ijULWUSuw==
X-Received: by 2002:a05:6871:6507:b0:29e:63b3:8e2b with SMTP id 586e51a60fabf-2aa069b19e7mr15263626fac.37.1736924844191;
        Tue, 14 Jan 2025 23:07:24 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ad80599052sm5992749fac.24.2025.01.14.23.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:07:23 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: kw@linux.com,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pbrobinson@gmail.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	helgaas@kernel.org
Subject: [PATCH v3 3/5] dt-bindings: mfd: syscon: Add sg2042 pcie ctrl compatible
Date: Wed, 15 Jan 2025 15:07:14 +0800
Message-Id: <a9b213536c5bbc20de649afae69d2898a75924e4.1736923025.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736923025.git.unicorn_wang@outlook.com>
References: <cover.1736923025.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_230725_242621_C16223AC 
X-CRM114-Status: UNSURE (   7.92  )
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

Document SOPHGO SG2042 compatible for PCIe control registers.
These registers are shared by PCIe controller nodes.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index b414de4fa779..afd89aa0ae8b 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -107,6 +107,7 @@ select:
           - rockchip,rk3576-qos
           - rockchip,rk3588-qos
           - rockchip,rv1126-qos
+          - sophgo,sg2042-pcie-ctrl
           - st,spear1340-misc
           - stericsson,nomadik-pmu
           - starfive,jh7100-sysmain
@@ -205,6 +206,7 @@ properties:
           - rockchip,rk3576-qos
           - rockchip,rk3588-qos
           - rockchip,rv1126-qos
+          - sophgo,sg2042-pcie-ctrl
           - st,spear1340-misc
           - stericsson,nomadik-pmu
           - starfive,jh7100-sysmain
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
