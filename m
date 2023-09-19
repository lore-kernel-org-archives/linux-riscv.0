Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F29DCD3432
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 03:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpaV/OvKYV3RkwyQ1L4UZX0SEhvPG2kij/2ke4Nssnc=; b=br1Qan5JGwUX+0
	LNbbPW2MoIoP2IzyO2+wb4c0EMXR6Hw+etwDm9VVQImw2+ZEK+FB2ptraSgK9MHbi9xyOcLc3ckqt
	FR6NhDbWQi7b3sSqA9cuM5IEkuS6Wh5rD+YnJVg+ICqIDwOTXUiWrljn7pSUjeHkFrBsuDetHY9Hp
	c69tOb2a9K11BakIA/LX8I0ndvDtiab6EZkFJsln6ymX4zkDc/mRj33CW8zeIDtULz06EbEmwKj4B
	k1DWmexpNpZFpSc8DQS/zKrE4lERdagiqeFEfPNrY0Ddx+43l5EeuLNE9/ZWt8TshQpyq6Iqen7M0
	aiGrbEfd8BwMWk1cNHXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRoP-00Gqga-0n;
	Tue, 19 Sep 2023 03:54:09 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRoL-00Gqd8-2h
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 03:54:07 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2746ab05409so3223682a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 20:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695095642; x=1695700442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/pyUqu/Tkd0d14pnWQAKU8r5MyttJS43LfVvYmIT30=;
        b=cuJmNbAVBtFc3XQA6H0kOmTweN//G72CIy3LKyL1q+Efk3b98Dp8T8aqH+fbZ44PSs
         IwH70ZR8hl2Zofr41UD0GynYc8JvQVZyXhQ1ph9v7q/oBoAnPEf6uyf+DZv8kuIRSNpG
         ypNj2od2wgt+5OzHZEATAUJ1Ql1lQF2WaTjELOo8mTOIeyxCzU/uyWjjMjg1DRUruikX
         P8iFv6lgO1Lbof+7W5vN/OxpiiH77P2wkv4TRfvqOtmxvr98c5F86TNkiZlx/oCbQ3WM
         CBYT3LzvUU1bQQHO1CesfzZ5KdH/trjJ60MzgV3fvPb3EunuUqQczjumgHo3Urk9NdPh
         aCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695095642; x=1695700442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/pyUqu/Tkd0d14pnWQAKU8r5MyttJS43LfVvYmIT30=;
        b=I3cGw8z/1xKg+hCY4tjfn/1cSGc6/vbXn0vz4DuCIhMIDBcH5QNiRp19zEZ2RwJc1x
         UvOsQHTWSv0DVWZKA3KX4lyXHgf5+j377pXluI+XmsXPeEbH0416WFvZJlp6c3uOa2gA
         NyAvkSFQLhATwVS2Hch23r/V5Lsh8sKf/cK+d3PKAPn6IJKOoXxhDt/GsQgyT67ofpwF
         IWZMCtHI6pBI1cUP6tX3CFspojoX1+cxRfffCJ3bWXX5O2a3RTQavg9Z9OOCKqNSdUBh
         gCYeoSg76cjPmPgRAEiMkMu3FNolP0ds5yMAnXEk+bBDXq0EHkYiR7UKT10OpGqWnNQp
         c2HA==
X-Gm-Message-State: AOJu0Yyci617g7XoEdpHUYL5hGS+Upb6ZJ/2/9xD/XJoQWBBuoLqNJ1J
	+kcscYmT6OK4cH6VQr3TrwM+IA==
X-Google-Smtp-Source: AGHT+IEv2GtqSdnsDMi5LgNHnFDwtL1zsQsjYDdjeBpdLohkB2ds19n77ngsGEre26d9mHroBrq5UQ==
X-Received: by 2002:a17:90b:190d:b0:276:7907:ecf with SMTP id mp13-20020a17090b190d00b0027679070ecfmr3278208pjb.36.1695095641908;
        Mon, 18 Sep 2023 20:54:01 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a034300b00273fc850342sm4000802pjf.20.2023.09.18.20.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 20:54:01 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/7] RISC-V: Detect XVentanaCondOps from ISA string
Date: Tue, 19 Sep 2023 09:23:37 +0530
Message-Id: <20230919035343.1399389-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919035343.1399389-1-apatel@ventanamicro.com>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_205405_877568_058124F4 
X-CRM114-Status: UNSURE (   9.75  )
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

The Veyron-V1 CPU supports custom conditional arithmetic and
conditional-select/move operations referred to as XVentanaCondOps
extension. In fact, QEMU RISC-V also has support for emulating
XVentanaCondOps extension.

Let us detect XVentanaCondOps extension from ISA string available
through DT or ACPI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 arch/riscv/include/asm/hwcap.h                          | 1 +
 arch/riscv/kernel/cpufeature.c                          | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 36ff6749fbba..cad8ef68eca7 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,13 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: xventanacondops
+          description: |
+            The Ventana specific XVentanaCondOps extension for conditional
+            arithmetic and conditional-select/move operations defined by the
+            Ventana custom extensions specification v1.0.1 (or higher) at
+            https://github.com/ventanamicro/ventana-custom-extensions/releases.
+
         - const: zba
           description: |
             The standard Zba bit-manipulation extension for address generation
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0f520f7d058a..b7efe9e2fa89 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -59,6 +59,7 @@
 #define RISCV_ISA_EXT_ZIFENCEI		41
 #define RISCV_ISA_EXT_ZIHPM		42
 #define RISCV_ISA_EXT_SMSTATEEN		43
+#define RISCV_ISA_EXT_XVENTANACONDOPS	44
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3755a8c2a9de..3a31d34fe709 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -182,6 +182,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA(xventanacondops, RISCV_ISA_EXT_XVENTANACONDOPS),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
