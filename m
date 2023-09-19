Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AE3CD37B4
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 03:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAvKNxNl7PoLiL/yRdEffNfFJTl7/9bmnNqdgAndids=; b=NWtpKzF7+y5e71
	6zMXMULtUX0BUVOO97QUw9hFXBwxk3B3Kg5aON/tr7zIbPiCcVP4BZHsanS8rd78VTXpQ6MlllXxb
	QRnvjPqr/GpLM+VN8uywUzbF75Cn/tkW4hDF7LO0dLrR6t5LqwpSaV+zad5LLY/VzDTX9KE7ieTNg
	xfigmtSiKy0ULVotbcL2LhrzZuhZfYjRpEMgoW/7aPA0Z4brEClrvhtqgGzoQ+O1UEVqGz8XgfFfG
	GQBBCmFvJWKjBVAMTHsN5hgOuUxmpUlhZMi3zS4xO7qLt82OESryMtMjTRUlkt5sfMgx+yvXUhIox
	PodMYp3sDxZYOCyujiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRoU-00GqlB-1r;
	Tue, 19 Sep 2023 03:54:14 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRoR-00Gqg0-0h
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 03:54:12 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-27496d4e13bso2430576a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 20:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695095648; x=1695700448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pGeVEek9zT+aYZ/+OSRrTZDDVu3TufzzCdFbAdNAEQ=;
        b=NW/EKMEIQMee5ONeMmT8pJuuHJQrHcpHvH2fbQCv1t/lSe0Rl2kxv1SIPsFdjRfRbT
         CupCKxz3ZBTkdwSXSs+GZFJ066l4jf/IaItbcHvXd3LMUZF8hgluzkv2+kfxV+qn3RQs
         f96ZUwKAx3Al9mJDZ2dSK/+QHqaPZzhOnCzx1WBgsZy73j+LH4rOqYHy2lypFQgwAdNF
         DtEC28kulSl1WszowOP4x6dr+DDMNm4/Q0mD/TwjYhjrN2uKOjZchq1bZP2wcHfO/JEP
         MfAgj2HAome3Fb53zAD9rDYmabLcq1Z5JOi92U2ywg7HSJG6XjwPoHCS4gv32Oq/N19X
         Z/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695095648; x=1695700448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pGeVEek9zT+aYZ/+OSRrTZDDVu3TufzzCdFbAdNAEQ=;
        b=co3Z8cFFW4WQkSu++QuU6uxsCRQx4WNNIwgdRxgUesEj8lMLNdlbTW4mtcBmVb2Zi9
         XoT4VyAVePO7uBTJV968BzX0KDDrs0IX8TmRdYDFBCOOloBMwIqDcL+etf2praRko7Rz
         7NSdYOYuihycLLwt8WFn01lx3K2ix0yFzzLcP5CiDCxX2IbSRB5F4MqK3W7vopBeanSZ
         Zw2RkIRwDQKmga5YVcI5v6zVmX6uL977MJEaMM413SM4SDPj2h/MtEK8L1eXufzvmnmQ
         bV+7VQJwufan0qEVcr1aejONURjhWF2qgTCMBp05fC8TmI6BZWSppwz5HFuRiPdxkapm
         nxAQ==
X-Gm-Message-State: AOJu0YwKYkGdDy/TaiGxKUrA635YAJa5XgKEEnj+fJEUc6SMK9rVgI2g
	zMMHmalU7fQDg2TubKDdol4nhEYT/AmjmXqFspbq9g==
X-Google-Smtp-Source: AGHT+IFVL/Ha/V4JMQzZkv55SENS0Zz+GUGtyg2g1JkO21tp4+OerPk/8icamZrt62rtdL0jxnul+w==
X-Received: by 2002:a17:90a:cc17:b0:26d:61:3aad with SMTP id b23-20020a17090acc1700b0026d00613aadmr8451172pju.4.1695095648198;
        Mon, 18 Sep 2023 20:54:08 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a034300b00273fc850342sm4000802pjf.20.2023.09.18.20.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 20:54:07 -0700 (PDT)
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
Subject: [PATCH 2/7] RISC-V: Detect Zicond from ISA string
Date: Tue, 19 Sep 2023 09:23:38 +0530
Message-Id: <20230919035343.1399389-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919035343.1399389-1-apatel@ventanamicro.com>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_205411_259810_BB0E8F39 
X-CRM114-Status: UNSURE (   9.71  )
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

The RISC-V integer conditional (Zicond) operation extension defines
standard conditional arithmetic and conditional-select/move operations
which are inspired from the XVentanaCondOps extension. In fact, QEMU
RISC-V also has support for emulating Zicond extension.

Let us detect Zicond extension from ISA string available through
DT or ACPI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 arch/riscv/include/asm/hwcap.h                          | 1 +
 arch/riscv/kernel/cpufeature.c                          | 1 +
 3 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cad8ef68eca7..7ea90e2dbc5b 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -225,6 +225,12 @@ properties:
             ratified in the 20191213 version of the unprivileged ISA
             specification.
 
+        - const: zicond
+          description:
+            The standard Zicond extension for conditional arithmetic and
+            conditional-select/move operations as ratified in commit 8fb6694
+            ("Update Gemfile") of riscv-zicond.
+
         - const: zicsr
           description: |
             The standard Zicsr extension for control and status register
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b7efe9e2fa89..15bafc02ffd4 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -60,6 +60,7 @@
 #define RISCV_ISA_EXT_ZIHPM		42
 #define RISCV_ISA_EXT_SMSTATEEN		43
 #define RISCV_ISA_EXT_XVENTANACONDOPS	44
+#define RISCV_ISA_EXT_ZICOND		45
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3a31d34fe709..49b6551f3347 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -174,6 +174,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
+	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
