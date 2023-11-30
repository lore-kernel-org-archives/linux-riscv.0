Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19466C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 19:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuEaGbiU38SNz1jMsSiya04p8/OhvGfZ+oQ7i5WVjkc=; b=vImKg+Ng4yMDAD
	x2iLZ5ZlEC26OMoY5wJz5YFPccRT+5ZAd8EooRnb4YKMsMSY4NNDB90jDUbJfyva4e7kG6nDmIzbu
	9qcgKRu2Egl3kBcH+aA9ElGkKR8vUaTwPa2GEMFyGjlZBM0qG+FxXZfxIy6H/f46Wqd+Wabm0GWTd
	t8x8QK5RBZ5nXe+61KEPu9msgtjJfumGxhHaCMtR9Wm/I8/gQnNa8YWCFFuXbOeQuXgjIDhI2E+kg
	uKYBSjszVb/NGvFjhE3TvWgisMvpSM2hweB6KUeRllFxuQ/NlS3HtB4XIkslpbj0xmkuhRArf1DF+
	rJ525fayVuWkRMZHodHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ma3-00BiHk-2r;
	Thu, 30 Nov 2023 19:20:11 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8mZz-00BiGT-2q
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 19:20:09 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c9ccf36b25so11744501fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 11:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701372005; x=1701976805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwhRoaGeDm4lBiOI90iQjOneyaPafhM8egV1M+VsF1g=;
        b=kAhddxX1ciUfdpY1SUgfQ+yJ4emXzwII4eXlqZUm3d0ZsmJ6gJCUDJFtWJibvUSU1D
         uhxbu6t5R1wJOA0QqkLokN2naJn2HAvcb/K5QcZEVqzWDKaZ99j2m3NQxQejeNOI3k6t
         7lLX4oOuGedUt9YXQkkt7g0K4Mozql62NlT06ZAPoAJMJO2TzbUB+YjWMPeZ5+gtmizZ
         NI6YWHvOmZ6zqwiXFiUScVAjT+igxllZ58wtjDw787TsetnLD7CV1fskt0jvbNJLpCFW
         CAHE8WzjMM08AMHI5C7CgMdnZXY7qM3sbcWTjlsKPUeYUuIPxzsRNlE2Tn+hsoQManMZ
         1CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701372005; x=1701976805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwhRoaGeDm4lBiOI90iQjOneyaPafhM8egV1M+VsF1g=;
        b=kzSVEHv/zY6nroZVHbtIDBj3Ku8a25PCejq3gfbZXchGsSnj9vT/zOzk+G3gp+fZ8k
         W4RhfnKQX3oCSlfGFnVTTekIeDlZXPwz0GRwvh1QOQw7iEhYgQO+jRMCguukdh31x1CQ
         Y/YHRCkweFCptZI1V793xtEzwg1AKFatdIGCVZsVOQLl0lf4Ry1E0WUjnyMH79KVygSG
         Xni8BzfCcmRj4YAG/TZGCgZrIL3Pq9R7UI73u0ZYlAqO1kU6Pi7TcEIADbV/wH5r0oAH
         RsFCRrc2kuGpI79TxZmmZRnn7v6cK0/LAi7k3C4bkv7T8tyiOL8qJZONdFD6BX2UB/E8
         K2FA==
X-Gm-Message-State: AOJu0YyRIWKHDJLs1YK9dGbB1bCvIN2qDZKgmAn3YQr60hFGJKye1KaI
	eSlZupl80ux3QjZD9HdrWGn1l834pJUiweEsDF0=
X-Google-Smtp-Source: AGHT+IEfrYpn3/kcLE+pciBFOtjL4quFRbLeZxx4yGfLMCIepBDvEqkx0CnOpqztozv0SQG8dnPabg==
X-Received: by 2002:a17:906:3bc6:b0:a19:83cc:530e with SMTP id v6-20020a1709063bc600b00a1983cc530emr38144ejf.11.1701369550249;
        Thu, 30 Nov 2023 10:39:10 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id h25-20020a170906585900b009e6cedc8bf5sm977048ejs.29.2023.11.30.10.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 10:39:09 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	haibo1.xu@intel.com
Subject: [PATCH 5/6] KVM: riscv: selftests: Use register subtypes
Date: Thu, 30 Nov 2023 19:39:09 +0100
Message-ID: <20231130183908.55860-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130183537.55203-8-ajones@ventanamicro.com>
References: <20231130183537.55203-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_112007_924913_D8EE1C7B 
X-CRM114-Status: GOOD (  12.55  )
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

Always use register subtypes in the get-reg-list test when registers
have them. The only registers neglecting to do so were ISA extension
registers. While we don't really need to use KVM_REG_RISCV_ISA_SINGLE
(since it's zero), the main purpose is to avoid confusion and to
self-document the tests. Also add print support for the multi
registers like SBI extensions have, even though they're only used for
debugging.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 167 +++++++++++-------
 1 file changed, 100 insertions(+), 67 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 42c6244c8d6d..c3aebde0708a 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -28,58 +28,58 @@ bool filter_reg(__u64 reg)
 	 *
 	 * Note: The below list is alphabetically sorted.
 	 */
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_A:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_C:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_D:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_F:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_H:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_I:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_M:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_V:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SMSTATEEN:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSTC:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVINVAL:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVNAPOT:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVPBMT:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBC:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKB:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKC:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKX:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZFA:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZFH:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZFHMIN:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICNTR:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICOND:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICSR:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTNTL:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKND:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKNE:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKNH:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKR:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKSED:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKSH:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKT:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVBB:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVBC:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVFH:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVFHMIN:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKB:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKG:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKNED:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKNHA:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKNHB:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKSED:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKSH:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKT:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_A:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_C:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_D:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_F:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_H:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_I:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_M:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_V:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBKB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBKC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBKX:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBS:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFH:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFHMIN:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICNTR:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICOND:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICSR:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIFENCEI:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHINTNTL:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHPM:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKND:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKNE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKNH:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKR:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKSED:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKSH:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKT:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVBB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVBC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFH:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFHMIN:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVKB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVKG:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVKNED:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVKNHA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVKNHB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVKSED:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVKSH:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVKT:
 		return true;
 	/* AIA registers are always available when Ssaia can't be disabled */
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
@@ -362,15 +362,10 @@ static const char *fp_d_id_to_str(const char *prefix, __u64 id)
 }
 
 #define KVM_ISA_EXT_ARR(ext)		\
-[KVM_RISCV_ISA_EXT_##ext] = "KVM_RISCV_ISA_EXT_" #ext
+[KVM_RISCV_ISA_EXT_##ext] = "KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_" #ext
 
-static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
+static const char *isa_ext_single_id_to_str(__u64 reg_off)
 {
-	/* reg_off is the offset into unsigned long kvm_isa_ext_arr[] */
-	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_ISA_EXT);
-
-	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT);
-
 	static const char * const kvm_isa_ext_reg_name[] = {
 		KVM_ISA_EXT_ARR(A),
 		KVM_ISA_EXT_ARR(C),
@@ -427,11 +422,48 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name))
-		return strdup_printf("%lld /* UNKNOWN */", reg_off);
+		return strdup_printf("KVM_REG_RISCV_ISA_SINGLE | %lld /* UNKNOWN */", reg_off);
 
 	return kvm_isa_ext_reg_name[reg_off];
 }
 
+static const char *isa_ext_multi_id_to_str(__u64 reg_subtype, __u64 reg_off)
+{
+	const char *unknown = "";
+
+	if (reg_off > KVM_REG_RISCV_ISA_MULTI_REG_LAST)
+		unknown = " /* UNKNOWN */";
+
+	switch (reg_subtype) {
+	case KVM_REG_RISCV_ISA_MULTI_EN:
+		return strdup_printf("KVM_REG_RISCV_ISA_MULTI_EN | %lld%s", reg_off, unknown);
+	case KVM_REG_RISCV_ISA_MULTI_DIS:
+		return strdup_printf("KVM_REG_RISCV_ISA_MULTI_DIS | %lld%s", reg_off, unknown);
+	}
+
+	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
+}
+
+static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
+{
+	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_ISA_EXT);
+	__u64 reg_subtype = reg_off & KVM_REG_RISCV_SUBTYPE_MASK;
+
+	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT);
+
+	reg_off &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	switch (reg_subtype) {
+	case KVM_REG_RISCV_ISA_SINGLE:
+		return isa_ext_single_id_to_str(reg_off);
+	case KVM_REG_RISCV_ISA_MULTI_EN:
+	case KVM_REG_RISCV_ISA_MULTI_DIS:
+		return isa_ext_multi_id_to_str(reg_subtype, reg_off);
+	}
+
+	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
+}
+
 #define KVM_SBI_EXT_ARR(ext)		\
 [ext] = "KVM_REG_RISCV_SBI_SINGLE | " #ext
 
@@ -635,12 +667,12 @@ static __u64 base_skips_set[] = {
 
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
 };
 
 static __u64 zicboz_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicboz_block_size),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ,
 };
 
 static __u64 aia_regs[] = {
@@ -651,12 +683,12 @@ static __u64 aia_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siph),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1h),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2h),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA,
 };
 
 static __u64 smstateen_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_SMSTATEEN_REG(sstateen0),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SMSTATEEN,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN,
 };
 
 static __u64 fp_f_regs[] = {
@@ -693,7 +725,7 @@ static __u64 fp_f_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F | KVM_REG_RISCV_FP_F_REG(f[30]),
 	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F | KVM_REG_RISCV_FP_F_REG(f[31]),
 	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F | KVM_REG_RISCV_FP_F_REG(fcsr),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_F,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_F,
 };
 
 static __u64 fp_d_regs[] = {
@@ -730,7 +762,7 @@ static __u64 fp_d_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_FP_D | KVM_REG_RISCV_FP_D_REG(f[30]),
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_FP_D | KVM_REG_RISCV_FP_D_REG(f[31]),
 	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_D | KVM_REG_RISCV_FP_D_REG(fcsr),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_D,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_D,
 };
 
 #define SUBLIST_BASE \
@@ -754,7 +786,8 @@ static __u64 fp_d_regs[] = {
 #define KVM_ISA_EXT_SIMPLE_CONFIG(ext, extu)			\
 static __u64 regs_##ext[] = {					\
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG |			\
-	KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_##extu,	\
+	KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |	\
+	KVM_RISCV_ISA_EXT_##extu,				\
 };								\
 static struct vcpu_reg_list config_##ext = {			\
 	.sublists = {						\
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
