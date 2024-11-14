Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA186D68B38
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fucf/NTbivx0SWtbw94Cd1yOgHbEJ3fJZcSh4i6WRqw=; b=VPMCAYIe5m4HOG
	vny7MqueVB9hzf1MoihLZbBfL1ymTUgUvQONq7v7c97o77SL3Pp+ccAN8T7UkRE6j8upoqw4p7H5P
	fRY0RMl7TFyQ6eRBl1blClGCwYxkgOr+5FXjDkbuHg9nyDVMlTbPxuTHBIasWVlFCYKOUNeVR+ryT
	GMMXKwT61bicPrmVQtY+a36GBW0CtLkDFK0Rgz0VCvyFgu7GjQk2D/NGvGhRpWKTwOJ0v4G3IAli1
	GfKdHefrHmwov0OgdB+a1kbz4JSVvaBBFpVbXTUy4xnPJAEd4ljGp3OBiezcHWBdZ0Ba1EaNu+xal
	bK9Mp6axn04sHjNFiRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYa-000000004vE-3pOm;
	Thu, 14 Nov 2024 16:18:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYX-000000004ps-38GF
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 16:18:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso6995005e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 08:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731601132; x=1732205932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3RScEb/zQMeNBIY0PtZD1/ZjJQ2IegD9nNkwkqM6gc=;
        b=o91C/Z/FTD9GqtnFqTP4X1CCuH7Y2G7mEFC1i3WQZocrHAcLTxYh/57Wbj1EtqxPJY
         Sk3Xt+EGYjznj93101Uehp4beUs/K77SVZal+qNGGqkIVLlEB/zXvx3oXdCwCugBKpk/
         ChpSSTc1PLihAtI2p3lFStu2sOJWiGrAO4eHBvioWdtp1Te9RtI3ZNnl+NRHmt00o9nx
         71S/LlYb56eFzU+EU75zd5kmvMFS7oFSsxV8MUgPRvru7VRqmcNiJg2m0aJ0N48Qxc1p
         wAeZqExB2E26Xb6048kOOT5Uo+fiuyiBTHmhhvGvd2aFeBoyeS3iRCn9jaZrTqM/6AJy
         9uFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601132; x=1732205932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3RScEb/zQMeNBIY0PtZD1/ZjJQ2IegD9nNkwkqM6gc=;
        b=tji8fsKTS9oGyZvURxlYuGQOZV10u6TFfRsUCq1CEyt8SJc9ZRs76y7vUIabKkHdX3
         tXhX/DyePT71ivOPf5rJCp1u+QQues7Ppf+kBQk1oduXrEa9ZL7VjLq9gb+uyOCr9JMA
         BgEGaxsrxlyqlF6beZtGd2/njLhjSczQrfb6py4RaYP3jHnp3iBcAdaTPGFZjdyZneNd
         mtXeQvVbBgQHfUVBhNse2vHqlqHxGnFYal/bwvHl3z4W4ECKexHUBzB4rEHnVXAJVk+1
         qywhebVtlu7In2ERICUdMvFPjIjCLBt+a4i8v0hvBAjmAnbnohXu+fRjjRHP8VvYKoTD
         iXjA==
X-Forwarded-Encrypted: i=1; AJvYcCXeWgCsdxbFcgpe9oQflJp03eERU/D8BWcv5JKaNsTxx1VryB7/AeVlCPLzA41IOpnAEGXApb4BC2HqEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5jJHaW3PCAIMBcJr1Mm42wtuC8bqp4PFrpdvLgm/ZYkjIaG+D
	0uEzEmulL49SVBjqTvdcQaWZexj9Av9eNlHjQUNnnsLQjO7RphDTb7AHS1kKOfY=
X-Google-Smtp-Source: AGHT+IETarykQuvm6+z3/CASGfAXpcrdoszeWN3rsEIL+bc92gQplNjgpnYXoIwCDFze+tOTvORF1Q==
X-Received: by 2002:a05:600c:3c8f:b0:431:4e25:fe42 with SMTP id 5b1f17b1804b1-432b751e28fmr192523985e9.32.1731601132365;
        Thu, 14 Nov 2024 08:18:52 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab72184sm24967935e9.2.2024.11.14.08.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:18:51 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	zong.li@sifive.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [RFC PATCH 04/15] iommu/riscv: report iommu capabilities
Date: Thu, 14 Nov 2024 17:18:49 +0100
Message-ID: <20241114161845.502027-21-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081853_794153_E5051D6A 
X-CRM114-Status: UNSURE (   9.18  )
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Report RISC-V IOMMU capabilities required by VFIO subsystem
to enable PCIe device assignment.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 8a05def774bd..3fe4ceba8dd3 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1462,6 +1462,17 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
 	return generic_device_group(dev);
 }
 
+static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
+{
+	switch (cap) {
+	case IOMMU_CAP_CACHE_COHERENCY:
+	case IOMMU_CAP_DEFERRED_FLUSH:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
 {
 	return iommu_fwspec_add_ids(dev, args->args, 1);
@@ -1526,6 +1537,7 @@ static void riscv_iommu_release_device(struct device *dev)
 static const struct iommu_ops riscv_iommu_ops = {
 	.pgsize_bitmap = SZ_4K,
 	.of_xlate = riscv_iommu_of_xlate,
+	.capable = riscv_iommu_capable,
 	.identity_domain = &riscv_iommu_identity_domain,
 	.blocked_domain = &riscv_iommu_blocking_domain,
 	.release_domain = &riscv_iommu_blocking_domain,
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
