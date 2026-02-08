Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59051EF06E2
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 06:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJs2O2yE0MOL+DJbfRbDlk086Qil+mVGrPBbD8mdoxw=; b=wrMXBWQJHUGXmc
	R4O2IamsSNFUaRCj+yKH/x9gNIXQzrczXAwOLpohzrS5iEdlhhHCExKIf14sbDn56ROlV7vq8Tnwk
	jktyilHwj3lU2+H/n+guPN5cvtI+piZhq8Fyp73AwDCSJC76cg0/KHQWIQPdx5PSRgLgzm2LJxVsg
	z1l5LrciBNqYTyK2O1hrGrQDFxoIhuIbxZq18C90gjDzmEQpVZX3L/t0nR+v6tivd1bhAKWEt+Gda
	H+UljJBglX2hYxtis4iAQmNsX2SDdqV2+ZMgZQRi0+Eq/NaK5UDtHrdTuQczqOhbLBK0gmbVyet3k
	RECsj6F91XhLm7pqpRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voyRm-0000000D5az-2Y9M;
	Sun, 08 Feb 2026 06:39:06 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voyRj-0000000D5aM-2liE
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 06:39:04 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-124afd03fd1so2703054c88.0
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 22:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1770532743; x=1771137543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqJrVLmLyHXBLluZVvcfbrCnXHVEtGPNlw21Z5ct3vE=;
        b=HemD9ZglV3Pruh0jnFgRCPGzhKRBjjqw4X4la0oRhM4ocBXPf0JNmGSmCUlckdT5ww
         7Im8Xov0xjlJQJZ/yllErUckQxLpzIZvUCxMTr/2SDdqMEAkuIcAVqjqmJYAGUG4bQIS
         +27laJI68sQTx6fcYiwlLh6kOMXhUu+CeheWY7QLUspkyJCLi1jRI6kzAJYFP+40hKrg
         1ElcBWc6Ow6ltjzjPTuTNQtEW00geaSiAUrxj3VD5nLV2xXRnMOJZ3v0ZjBaBISdyPs6
         gDw5DrdVWTeIM/Siy/HT0VxbO72+kfJ4/sxdJWzBpwx6ulkYuh9Y4VW1SlB+FgYQtYpi
         wkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770532743; x=1771137543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SqJrVLmLyHXBLluZVvcfbrCnXHVEtGPNlw21Z5ct3vE=;
        b=K4t4QYECp09KFt8CEqtqlhomBSnZkeZ+pJhw9lv/3My+uA7YPN9O1PdxHQC+GjvquZ
         iuZXvkrIFyZNzfTmVdOqyBADL7+q6UGs8ql+mL7Rb93CBKNcegJdomla2n4EuD1d6CHy
         Xqpv0kDcA8olI1GFoXdwAP+oy4zmwXmYuFA4nJw7WSz+K3tlS/LLbXwYbt5heTa1IUTJ
         aaClnw3/RTAN3hsrvKxljvu46AvT79H+11rwqJvE6Wx05uaCv8R+N9OdZ9gqcdwlleAd
         15ShU9x4B40hVtMZp8lo2rI676gBKLrnwKk26B5hABL3mwlJ8kQl8IDzzeHMabcruF7c
         UjCw==
X-Forwarded-Encrypted: i=1; AJvYcCXMZJfHHKo7cLYpnq6TKZ4/sQ/n0kUWYoAx10Pqep/XtTFB9AWvjWlNWiLAXKe/nI9KL2gfSyo2Y83q0g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx31gncnvRJUwvVrv2iECdPalOwsEnDSfpBNjJ9chnaA7VN+8A4
	fO9x6kXrXFZG0X93sh3ejQGkoA6h45LH4Cqq0pal3H+vEC6Xr9UpZDuzOcyFh1LpEvk=
X-Gm-Gg: AZuq6aLaBOnXrANdLcdUFgsy1ZpGsHF67SkbPWjXClebmUnODVppRfJ+TSyKY8+Fzse
	4sy2Rg12pGk/+8G6zrTNVqcPmnTqN7vgxxAk90EvnEH1w/WuGfCT1PA4HOq4RuVt5w3lv+dtmbj
	ReqHMSN3xf3jY1pEm/qEXMZvE3e71AXRhsuiVhinEMkzjTX9Agm4uAQxKtqJGWg5/z94gRF1zH6
	1BKMfY1acnjeFf+DsNc/IGq10s3jKCQUW6adm9Q+Lv8HWrtaFFjFHyYwPrQutz45LMZGJyrdM80
	OdYHJF8vDXzRM00N5PaTA9w+rFSP+taEa1tayx8avNj1XZ7UQqiEBdLXmXL5AY/BOR/LLtEuav8
	QQw3ZUj4E8gXRXwhVsJJvNv7jwCNegUtjvB9rHRZ4YEFr3DpTK8YrC4yv7TmncIMFjJOIXIvjss
	SSqnK7B87heLxtCEbx/HNLdwE=
X-Received: by 2002:a05:7022:2527:b0:123:2d4f:ef1c with SMTP id a92af1059eb24-12703ff4c81mr3247994c88.26.1770532742709;
        Sat, 07 Feb 2026 22:39:02 -0800 (PST)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270c9ff2bcsm5114647c88.1.2026.02.07.22.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 22:39:00 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	mark.rutland@arm.com,
	conor+dt@kernel.org,
	krzk@kernel.org,
	guoyaxing@bosc.ac.cn,
	luxu.kernel@bytedance.com,
	lv.zheng@linux.spacemit.com,
	andrew.jones@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 2/2] iommu/riscv: create a auxiliary device for HPM
Date: Sat,  7 Feb 2026 22:38:36 -0800
Message-ID: <20260208063848.3547817-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260208063848.3547817-1-zong.li@sifive.com>
References: <20260208063848.3547817-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_223903_702749_F346CEB7 
X-CRM114-Status: GOOD (  11.26  )
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

Create an auxiliary device for HPM when the IOMMU supports a
hardware performance monitor.

Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/iommu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index d9429097a2b5..7cdb80d4343d 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -14,6 +14,7 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_rimt.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
 #include <linux/init.h>
@@ -559,6 +560,22 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/*
+ * IOMMU Hardware performance monitor
+ */
+static int riscv_iommu_hpm_enable(struct riscv_iommu_device *iommu)
+{
+	struct auxiliary_device *auxdev;
+
+	/* TODO: for custom event support, the modname should come from compatible */
+	auxdev = __devm_auxiliary_device_create(iommu->dev, KBUILD_MODNAME,
+						"pmu", iommu, 0);
+	if (!auxdev)
+		return -ENODEV;
+
+	return 0;
+}
+
 /* Lookup and initialize device context info structure. */
 static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
 						 unsigned int devid)
@@ -1669,6 +1686,9 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_remove_sysfs;
 	}
 
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM)
+		riscv_iommu_hpm_enable(iommu);
+
 	return 0;
 
 err_remove_sysfs:
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
