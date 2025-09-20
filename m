Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365D7CAC5A7
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PiXdJwAl7rsjX5eTT1JTViUk4a5MVbAIIfd6HhhN748=; b=ReOl3zIPhFjb/4
	DvZjAhSyHHwfj9i6T3T3OCAWh9EYdk1HKnTH8f+G/sQwRdsEzP+xbkRT9XBXtYT5kv5p8qFhy/YmF
	muAiJlXB3769nEputQrLYZW9tIUIDuBrdjqGy4gYqLLX4wfWl6yuFBUss/37DEIWm+KKuifRF1RI2
	Nu+gkerCHopm0Jp4dmcyH8/uEbRkg0yBHlXd7KnDXdjHYx11xsLKP33UJIpEXOoCiQC16S/Kct9vY
	/6Amv2hS9cHqYiqkOtQYR7ppkfH80VqlseUn13fg1aG/hoTnuKsFj+dj7gCAIgCd6B+EmB26pVOe8
	xwAnjsYBRbMQU2siF8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MY-00000005tox-47w0;
	Sat, 20 Sep 2025 20:39:19 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MQ-00000005tXz-2pSk
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:13 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-4248062c973so22987535ab.3
        for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400750; x=1759005550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiJg8ON0boDhCQorG+j+Xw5gw12MCBbaI74+jnmrMFk=;
        b=DihRN6J7Do4hIOOlELuEGv12GkELBadJCuznenHaXFw37qQfxoXMCL58YX3qEIVzVa
         hsa16WpMmJQGgr8rwa4CUghYkq3E4nqpBh9cnC8Tl1aUpYzp6TYf6soXVp9u6bO/et9+
         t/BiZr+Y6PgrGJaWOXotBYEinfB9ExbXVXSa3mXlHl588UoxEnUt/oIK3btqEotp0iXa
         eyQ6KxpGZZj7ZZsLgMQB1s9inXhwHFcrxA3voOI5aVqGq1ka5/bqhMMY/ZaN8k7/YI0e
         08c9UPVQaaYf0ugPg6fSPB+JrLTlbLLigvbCgUXXJYNBHwh7MvhGtnn0erXq+rmSBl/v
         EvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400750; x=1759005550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiJg8ON0boDhCQorG+j+Xw5gw12MCBbaI74+jnmrMFk=;
        b=hTo1NmegGm5wUML40wArmjiEkSdIPI3UpJ6UlTRaVfGdNV5d869p8Nl+GIJprl+Igg
         CGwzA3zkgsv3LWD+OyyfJGEQGAMdhAH/G3P22jOB7taLx3QlVfh3bdS5nln5nrdiLZOy
         V720sCHfFMdBS3t+nAhswDnJSUGbsIVjIB7nEONmq2IOoDSntHw/Zt+4znyI9KMbizi7
         YSkMow5R+D7Nhg/vtOsrcdUPetCDl+hUcv7LZPnJP6Kl16jgweGW2PkoPC0rQc/GPwx/
         eamRWJmGBBcPG8gbGIZc6TY4JAvcFCnAuYY2TMMnaYWm+Ysmn0+HyyGdB8X5ilOQ9NBt
         KUTA==
X-Forwarded-Encrypted: i=1; AJvYcCXOZGCz36qxUJIoRAoL8qIbB59gMDZwlInzjMafoHxDDfs8YTf8JTHqSllPWRmT3uROq+oAZuJzPhWWxA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1yOTs6TvKpfzZ4GGYUSJv0dUYPyDMaqQ8YL6zwqEEKspN5tM8
	/+n1krSgfAF9tWoC7xE0iSFMEci6nJ0p6MljuUdNN2RpSQUjuJNpgdBLY+LavVpm1d0=
X-Gm-Gg: ASbGncuFDSJBvG+beih5fRpbVTnXz6cyq22KKqAx1b5szbWiG2eAoTh6G+3FEmk2zz1
	e0b6yOBNSuue7DAaZw8NO8PjcVihJvebO64x93zgpzbYTekIZkAudULwABdwYvwVFTzXjehQcUR
	8Dl94HzLprUmTtO05832c74aJ+7brocmOHDMazc9x69BOet7AEutUU0aVNEA+e5mXlu2OhagRhn
	wY0RngklRBVl+jUROoETkv/DUKmFiVKLc8ViUvEQ5A0Udf0i7x7UkQzAH7P4czpkDMeI4Twg33E
	SxZrakfN0L2p8fY/O7u2xoXyxXYMO8AYv3r62AQyFk+zGA/r2B94M2IGvAy+ffh0hFbRB2m/IoV
	BIQpkd3IeHBT5ztSa/3J8NZbf
X-Google-Smtp-Source: AGHT+IFsmriwC7sM1H4SekuoxTk4S0bUk4TUqEUdLP6mEpfm4K0KojSVb0TkIY/Q7lu1c7nixhkmrw==
X-Received: by 2002:a92:c24c:0:b0:40c:410d:dc35 with SMTP id e9e14a558f8ab-424819709a7mr96072735ab.21.1758400749673;
        Sat, 20 Sep 2025 13:39:09 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4248a975078sm17095365ab.17.2025.09.20.13.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:09 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 13/18] iommu/riscv: report iommu capabilities
Date: Sat, 20 Sep 2025 15:39:03 -0500
Message-ID: <20250920203851.2205115-33-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133910_730671_9D46AD17 
X-CRM114-Status: UNSURE (   9.70  )
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

Report RISC-V IOMMU capability required by the VFIO subsystem
to enable PCIe device assignment.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 02f38aa0b231..5a0dd99f07d0 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1452,6 +1452,17 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
 	return generic_device_group(dev);
 }
 
+static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
+{
+	switch (cap) {
+	case IOMMU_CAP_CACHE_COHERENCY:
+		/* The RISC-V IOMMU is always DMA cache coherent. */
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
 {
 	return iommu_fwspec_add_ids(dev, args->args, 1);
@@ -1531,6 +1542,7 @@ static void riscv_iommu_release_device(struct device *dev)
 
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
+	.capable = riscv_iommu_capable,
 	.identity_domain = &riscv_iommu_identity_domain,
 	.blocked_domain = &riscv_iommu_blocking_domain,
 	.release_domain = &riscv_iommu_blocking_domain,
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
