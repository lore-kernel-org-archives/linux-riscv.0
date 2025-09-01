Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20B6CA100C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gei1bS/lWmQDAGJ3t5VViVYrPII6VIDnv3HBNpab0HA=; b=zkI1ypg9gGpk0n
	w+UilY+WxMB+hqWXdrrUXa6wLXQsAtgK3MAfDO+q5aDBGm7lvQ2RZXIuz3MH0ovjRGjt+t7Ew+xus
	sr0na1FojKoIpfAeKcz8dNAK2KWBnOvZB6hvIufCEkhVERbXLnyFK9N1KDrQjj2lDzl5Dsax+RI+s
	IDaqSCXn0/3HhrAdDhZulcexdhlLLOq5WyyHs7ZUeGEjTJpqxAZu1xIJFkFpUpITv0sc38bWTI8BI
	3V8XYdhhzye2WgZHff1zoJkuZrZQWJE1/Edz5ygj1Ouy9yeSAk2TLgErLNStkuvRjbZDSaU/vV9qx
	w2LBkQE+ktWAsyyFfWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4uV-0000000CkCN-15xw;
	Mon, 01 Sep 2025 13:49:27 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2kI-0000000C3st-1rdN
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 11:30:48 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77251d7cca6so882420b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 04:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756726246; x=1757331046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PM7ZOBxbXaYL3polB/sK+4dHFDAVqr3gYjlAgyAuBEQ=;
        b=c56LkjN+W/vdxpO8msA+di11RHpoyvmcO2U3jNV+7d6zioJVcPdBL2WYnYLZNJqtxD
         4bD6JSHgwjUVvG5KQLnwBqC82QYCPhqyzXDA4O3NxI2EPHilkwLoH0iC7L0ay6KSmZ8P
         hIMhcRXrkTxD5aExRC5ZzNVcAX3M200RJOuEGOupzkWBmjXZZf71HHiEtzmmwkFbOtFs
         Sbtv16E/yYi8Vjl9GXxGepIrOufjZfjrdh5Rgv//P2hFzSQ3y+JIEm2Z4QC+WShfnqg7
         wuCpuLyZUTMV2sOOYl2gLt31jb3B5kSvnz0/uzzB5EHs2qNRkknGQAMQUAOy/DvTy6zf
         BB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726246; x=1757331046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PM7ZOBxbXaYL3polB/sK+4dHFDAVqr3gYjlAgyAuBEQ=;
        b=AIDYPhurl7OMKkXrdOtEn8JXTQhclGirlCnyNBfajkl7crxErria9FoGWydpcntew+
         aGE8RATptUFgDPnYuV3dX/vc1Rfi522AS7s6RkWDet5BlgsrrFc9pe0qIfNxeMv9XmbD
         Ltb8zY6YIg9C87zRxShqYLCD399IIU2erL0fbj9F5R4PXWNooMgRSYpu8bdoqbFP6CfN
         YWDm/2OuE3tucwLlv75kmwgqc8TCqQhg2Txi0AdMBCjQQiNYYbnaWNQeo5dAEO9EI/J8
         a39xtBR3qdSjOOOGfzbsoUCLhdfhw/y9p5FSWSdN1HYVwd6ayS5HkWQ7i/ohEEXYw8S7
         IBYw==
X-Forwarded-Encrypted: i=1; AJvYcCVDdzFT5imuByT2AyYQ2v80IsgK46bwnNJnp7/uqBpx1tYQ/QCZn+6NS4G62kLC86OfbotoUi5GeszxQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3bZjXzUQiscxE8LXtGkP03KXb2TVzmZsO1M2lkJ7joMvgP8yB
	CX7ByPLn5A0E6QSwupQct6u9+yrp86pH91aCg47UPbLUKIymJo1oYWDb4oOTinLzp5U=
X-Gm-Gg: ASbGnctAxioo4+9SBv5PrHLl28ytCHuBc9aCFWUCfStvj9ugTY6M580/4FT6nIg7pEg
	8AUFInDR9BnHSrPK2T4VZiVyzYFtGsxcn/xTIfIjxYc7tbUvKfLBNTndrAZXEQw9WOYUOWBlx9M
	5oOOW0wWYr3VgyXE+xGGpQVPwSCYgB+iW63NO2gDDlLW4kzodQZ82eBGKZbNWgTZVFPKk18FREZ
	S587AV/wf/PBpvghCnPJR1O+ElF/iWbuN18qhEGKkXH6QsoN9CRIzC18d/CgvpmqgSDrL2nVw4u
	TmkPzU6N3ymLLKFoDdNEWevjWletXt8ugQATZM8I2o09aAIG0jiKsJUTfe49bFC0DnteTlkNqLg
	FMqlVp2H/eZYV86G9/G2F2ZeOKVEzXcVg3QYSQhFx4Q4dmWpchoCyF6X+pCLRn46dzrJgAZkcOQ
	hTUzyQlJcuMT9JD3dXStpmdXfiigevZwCoorVn2uWPsn3QQ6NwTmOddLHIqcSx/m6U
X-Google-Smtp-Source: AGHT+IHvewUVfv5QStAVuopdslXVnLmKdfTffBO/yLK1Zcu3D+UIlnEHf0YO2HWkB4oXA6WwHzKOog==
X-Received: by 2002:a05:6a21:3396:b0:243:c217:512e with SMTP id adf61e73a8af0-243d6dd1431mr10269229637.7.1756726245635;
        Mon, 01 Sep 2025 04:30:45 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725ad1e9afsm2911441b3a.11.2025.09.01.04.30.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 04:30:45 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	brs@rivosinc.com
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 2/4] dt-bindings: riscv: Add Zalasr ISA extension description
Date: Mon,  1 Sep 2025 19:30:20 +0800
Message-Id: <20250901113022.3812-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250901113022.3812-1-luxu.kernel@bytedance.com>
References: <20250901113022.3812-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_043046_482995_ACA9689F 
X-CRM114-Status: UNSURE (   7.68  )
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

Add description for the Zalasr ISA extension

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ede6a58ccf534..6b8c21807a2da 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -248,6 +248,11 @@ properties:
             ratified at commit e87412e621f1 ("integrate Zaamo and Zalrsc text
             (#1304)") of the unprivileged ISA specification.
 
+        - const: zalasr
+          description: |
+            The standard Zalasr extension for load-acquire/store-release as frozen
+            at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
+
         - const: zawrs
           description: |
             The Zawrs extension for entering a low-power state or for trapping
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
