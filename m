Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAB4C38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYgFvy3fiO2qjoRxwkp2AcP8dBE4aIq7m3WUFZixuXE=; b=ap6egiHPRpiT28
	8RpZc7ZvMivB2tsWgdPSbY9k4w8ut57k6LLT/eT3Om8Myo3Bxq6y7FGCv/+R/JZIndwFcQukAAbzb
	stjkprG7gmxfZ3f6FbPQ9BOrwZHQYb4huTByavzTWoiaAFqX0HhD2czme6NacJ6JWLmz3GyLyey1s
	SJLT1GaX9FyC6TZ4hGxbu6+o+nqkg/G/eelfkYyMwhI06dRtO8ZUCRiBBXJMWaUf/ZF9NtTVwuZFN
	qdu0MvqzvTNsXq3IrtZU1O+JViR9EXSViz1ZLxE7A/2uXBvwnJIpC0ToHOObAGttCZyDsJMXMSa1H
	PAKq0MEeT7K93oKeSLbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU4Q-00BJdx-Fc; Tue, 06 Sep 2022 08:36:34 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU3v-00BJHi-B2
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 08:36:11 +0000
Received: by mail-ed1-x530.google.com with SMTP id x73so7172559ede.10
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 01:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5W7xgJ1XLJGULKevAAgXs+P90qRf99ffTuS9uPib130=;
        b=Tjp7n55JKlc/JtFcJKGoVy3GEhSY+XnC7d//XFiVIbJyuMG1pG3Kq/YApDs8RBvhRy
         aNRO6R64gPqiyZC2MfyGOGsUZiLydeuEUV9ooeGAp8Ckm6XL/i84mg0X8zEyS0VMsXQx
         t7W9Lw54OrIZb1Cb1pz8n27PvHt5UUXIABJWJyeyyHb+HCvxltjL95W4xHZP8vwrLYd4
         j2pnPJjtUZNj8C/IQwWW/Qx3deAdoGm7gagoNjqXb1siXeQUMQvo4QlpHfXWSIqwI3Vq
         MMYDIjWKa0Htte43io6GDlhNQLC10r3XWFafu9ZJM4StA/S2uudXA6UK6QpMLy/c2M5X
         nGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5W7xgJ1XLJGULKevAAgXs+P90qRf99ffTuS9uPib130=;
        b=z3PVD71S6PRz3jmyA9Up7snnj2y435twVM9y4D6Wct7bP62OG30aHBIbiSu6xAokwm
         5GLkmziRpwOIuTBA/l4FaLCVHyEAsDD0F4JLXqvhtHu45pGeVfHPGXoPDyXy4sT6gA7T
         7tQzOrxkgJsMWKIKPuMT8k0fXduhyJCvwPLeF8BWb6raFzJbuAGZBopb+13WbOOmDLx4
         pWvd8WPac3hIGLHWuLpNvXALgJCZYk7rZrXMrhD3KV1Xw3G2OcSnomuv2MW1lVpXLgUL
         7BX2Hu/iDRRr+KS5krJ4MsSEbz1kBxOjL9QLAxF7ZFVNWye3A1tHde+ID189sClsaOAA
         lU+A==
X-Gm-Message-State: ACgBeo2OeP3asnClU8UKhO2jYLBIqok0BGQ7KL+b6KQpMFs0JNa2jH2H
	0q6TpV6iEPEJICg9VVzJ5zrTMg==
X-Google-Smtp-Source: AA6agR6vS0pten5+vz9t1KtsoYWDvWMY0lCUg3ONJqzihxaZ7k+aW50T8a6ipUzn5PdS5oCFk5r8/w==
X-Received: by 2002:a05:6402:cb2:b0:44e:4336:d2a0 with SMTP id cn18-20020a0564020cb200b0044e4336d2a0mr9656605edb.209.1662453359825;
        Tue, 06 Sep 2022 01:35:59 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id v14-20020a056402348e00b004464c3de6dasm8022913edc.65.2022.09.06.01.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 01:35:59 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH 2/3] RISC-V: KVM: Provide UAPI for Zicbom block size
Date: Tue,  6 Sep 2022 10:35:54 +0200
Message-Id: <20220906083555.931806-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906083555.931806-1-ajones@ventanamicro.com>
References: <20220906083555.931806-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_013609_724107_0DE16CC5 
X-CRM114-Status: GOOD (  13.28  )
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

We're about to allow guests to use the Zicbom extension. KVM
userspace needs to know the cache block size in order to
properly advertise it to the guest. Provide a virtual config
register for userspace to get it with the GET_ONE_REG API, but
setting it cannot be supported, so disallow SET_ONE_REG.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 6 ++++++
 arch/riscv/mm/cacheflush.c        | 1 +
 3 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7351417afd62..b9a4cf36be4b 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -48,6 +48,7 @@ struct kvm_sregs {
 /* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_config {
 	unsigned long isa;
+	unsigned long zicbom_block_size;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index d0f08d5b4282..3f36e79876e7 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -18,6 +18,7 @@
 #include <linux/fs.h>
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
+#include <asm/cacheflush.h>
 #include <asm/hwcap.h>
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
@@ -254,6 +255,9 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CONFIG_REG(isa):
 		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
+		reg_val = riscv_cbom_block_size;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -311,6 +315,8 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 			return -EOPNOTSUPP;
 		}
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
+		return -EOPNOTSUPP;
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 8595baf8e403..c555ac7ae69c 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -90,6 +90,7 @@ void flush_icache_pte(pte_t pte)
 #endif /* CONFIG_MMU */
 
 unsigned int riscv_cbom_block_size;
+EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
 
 #ifdef CONFIG_RISCV_ISA_ZICBOM
 void riscv_init_cbom_blocksize(void)
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
