Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D74C3600C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 01:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKpsPIIt8B3sbw5iSC2QZejCrq7u16HmVUnUtE/KrrA=; b=D4TriWn73us5sV
	6c0DCK/A9w43rwmWRIJpDbfrWFWSOg6OKlhM0ab8JsealMe3NtWnNXoBbW6jmFHntN+X4ZWZJglvx
	Xu2RvWdPnjFsIEVxbgcn1JQ1GhcZFcOIKhu9/SLRdCsYe1guu3LNwIacE+1+FRtlSueDDdwGr8GVj
	+SqIXTv3pvCnWRY6IDx2/iI5ccJBoY1u3eT9wuo+nOpyaTYRMHnLfQn+uAJI3E2rLNwd+HXOjBDGf
	geGEr/W3smc5pcM+AzfAix7NF+2CeJDIE6Xh3azYsc7xcYz4pBWR5XcX9ZGWYINaNEcIIxuMfQzzo
	EjreCxGJdYlj3mP3736w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1axA-0000000G5Ig-3kRy;
	Mon, 07 Apr 2025 01:07:08 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ax7-0000000G5HB-3r8o
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 01:07:07 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4769aef457bso39709281cf.2
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 18:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988025; x=1744592825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vsCaRl6PH5MXOUa90IYL4ZnfxU9+wZVMbRb1hNiJ9U=;
        b=KToa1wigY3JD1x/fM7EbTMCEZ8mAhrR5MqGRVp4FmxkPAFwOwzfaotBLD4Fnl2p4jF
         kbrMS71KpVs9snkhhU2NwEe4fp/TKD/ik1hZhwJBZ+suQSrY3c4T0044PyIBS4P8Se2f
         7+3HWb2w7Dumfo8h+AmteU/+p96g/IHRXSKJ2+5ZR6ddoQhbOMLu5in2dwnl9byuccgp
         b4t/h+WPgxMdao3QTnNA2attr1i3Kc/sHVU20BbWfkRih0MbRa11d8dKbZZkPM+L8OF5
         YaOVjQ9OU4HHC7GXpuKd3vgUyA16fmBtC7XX8ANQfa7wrQ4H5VaihVC0fQQNTzLeOqcC
         EU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988025; x=1744592825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vsCaRl6PH5MXOUa90IYL4ZnfxU9+wZVMbRb1hNiJ9U=;
        b=uxDUebQIX/DligURio57T9NDnpdMBL3uYwmQKG3MkbPyzMQVy9zlpQcSE7+jiJJaBm
         uLknbjLMh754VuDaC5AWGwa2QauH/l2lnLxlwIAqAqxiiq2+2EZDR/tvUaCoRqmrMNK2
         FxXug+y8wzy9VRk9+RfvZAuD+DlcO5EptArWGq6LnZse993iV2q32AhNgMXyl6tPhJ8l
         XiyxG+PkyUo7ivlI0M7j5arsdkyDd2Pl51+l43VxhRo2UNKpWQg1mMHSJqxeaYeg8kIA
         pYQ93v/tDJXk5WlKW/uB+IDavEq41GBA2TGCZfFpGHAI0liIK9ZHc1xCIzzKRAxdxjrF
         4sHw==
X-Forwarded-Encrypted: i=1; AJvYcCWqwZtjCh60Zh1dLKofkOTOf/ne9StU5oqaYQEa7S21SrfVfcpGDjhRDU55soOOYSjIBj+Lym1kTUrKvg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Zx9kt0XMh8gYNtYStzbujKvImZz9f56+FFCptMEpMuBFpOlJ
	KaecUw0hRX7j1ah7YiAyZeLnOYTcOHGPUiTsha+dAf+PMFZIknT4
X-Gm-Gg: ASbGncv1tEh4sqnL66Mq5Lr2h2fv9d/7dABjE6D7CdBNde5IYgbROZDdBRh2O64iqYe
	IR4JV3pchbiOLBvygJitXncEoIa8dMxYDzid+uAkVp9mJHQq7vRbiF65DEfEqu401mMiGBkYfY8
	/XOaxIhKnsUxCSamblNTC98apIA87VLJXFfPM6QXnuiOI8Mj9F0R8gDjbBgzT4Rs1dXLnmMzXBR
	YUY2W685M408yeI3WeGu0DegksCl2tuuJHHzGaAfB5JaaICGigLdUmp7ocqSRLn4as2gK4XPZRv
	zlRZQ79C7OfLzD9NVJg4
X-Google-Smtp-Source: AGHT+IFkuuxhR+U1DbKH3U1yTcluZAPfs3Z52K5B+BYtDKVGXg8KxpwvB9wBRVPiAyCI06NtDvnreQ==
X-Received: by 2002:a05:622a:1189:b0:477:ea0:1b27 with SMTP id d75a77b69052e-4792598f38emr165080631cf.26.1743988024739;
        Sun, 06 Apr 2025 18:07:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4791b059870sm53342001cf.14.2025.04.06.18.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:04 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/9] dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
Date: Mon,  7 Apr 2025 09:06:08 +0800
Message-ID: <20250407010616.749833-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_180705_997174_9F5B6346 
X-CRM114-Status: UNSURE (   9.28  )
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

The SG2044 implement a standard T-HEAD C900 PLIC, which is
already supported by the kernel.

Add compatible string for Sophgo SG2044 plic.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 3dfe425909d1..ffc4768bad06 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -70,6 +70,7 @@ properties:
               - sophgo,cv1812h-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
+              - sophgo,sg2044-plic
               - thead,th1520-plic
           - const: thead,c900-plic
       - items:
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
