Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7E8CAC5B1
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mkRC7382bqo9fi9GoWF9z7fp2MMNuMjX7oLQH4icrv0=; b=ZrdYH7njgcrrn5
	iGEPOCQ/LhsSirWHi/JAtk+B/FdWlIzn/OUNbNcf7RP06L01SFB1TrrQikAUAkdhEv780fi3+4Ktj
	DF0oJmjoAhHC7z33bKRAKqrx3Rn0XEW1NT3q2gkXh2HaH6HEk9/F6xrrOuWUMlJOAp4aGynRjVaSE
	8b/T10XZezM3tcc6WW3yG+E/VUNPGw9rb9n0/Gxit3ruFV7cOJcoRX7TMyubvKRHQCw1VYNQfAtrr
	NTLtqCH2z4GQAUnTQ1QXNtRAKekNsnnOrVyWPZtVlJL60qivvxpuZVS9uBPMNDofiGxdWNGi9ep2E
	uSSGaE7Teb+/IVBDVT2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MI-00000005tM1-0zvb;
	Sat, 20 Sep 2025 20:39:02 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MD-00000005tHA-3xZ6
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:38:59 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-4248a13fbe9so7503145ab.1
        for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400737; x=1759005537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZPFm4Y9icCAth6wrzJMUkgkEfNQH2w/TjaKN8QVYFg=;
        b=KoOpdXSISh6UKvvemsceSc24gCtCunwMfMBceJ3u8T7d3PAKiCM3b9N+xmSBeCmey1
         zjLNhBS/t/XNG1Ld4GwSUuRM0pF8ij0AfG0LfIXrtS/BQhWK5Ym5XO8Bctt//JrRxrsG
         KosnMaR6MFKxigI1MKlzr1SbtyBrLpwKYh/a99iwA2Z9FiCd3ixeMggXTw1/HAFqm0di
         ZnApnBICDXqT65jA+r4uv9+gr5qxy73SlFjNsSeh/5hlmhDoMw+FkPNS+HM7UAvMA57V
         EzwSvjtAhzX7tBGuEmQfVRLyAbjljKpZ7dDjaE+c7JBJwscV8cT7O+vewurQpoSHYYya
         pbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400737; x=1759005537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZPFm4Y9icCAth6wrzJMUkgkEfNQH2w/TjaKN8QVYFg=;
        b=CRaO2VjplsQyKTgh3AR/Pom9cU2ahtXuRV8cwY8SkZDKjiSW15iUdSxLTwqjwk7z2S
         B5ZAzbNYt1sAH0TsrzKm7J0GYIveAASwkF1aObdBRea3R+JTLQ9rgT9arXrMCPk2c6of
         lPXFc47YGI5CsGChDMOCPafKNWk86XFMbX+2B2mAMDIwulcm5KgsFqmJ1z369c95eNN3
         LCaAFVPhgH/P6Pmh7wGIJpQpwaSa4y73HHHTluzahipGgKAM8OM8qZjeSB5eKCqENH+L
         dJIlFv9wSP68KTfjoYzQeWluKLWniAH6ML43TmX1kzwiKttZrWbXxwJNDcdZ+kQMmwx7
         gmCg==
X-Forwarded-Encrypted: i=1; AJvYcCVzZpttAo+jfhGC9Mvw/66rUeMQmYzffCtpjv2tnilbKusHSWeX3wfGvPQxaT/5twuhNpATRqG1s4FjKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkQ0djqI66C5wDWVk1DiPi8/vymDQQ8PUWchhIx6p5mw4umQCd
	RT/nf66WVMD17tvKj9ruJGmkV1O8/+jisFGLt9sFOpmARSla1kvNtrHazlhHe0ti6eE=
X-Gm-Gg: ASbGncshKQt4xLP7fgeieDAvm8ZmocigjKHK4daLdi4HCeUFQE7wGGaWx3XJRDoasAD
	A/YHyDLmgl/Dg3S9CpM9yhuFy/73yDaD+YjI2kaXwh4H2GBniPdEI0VcOBzEqRdoRvoE4uHJcGr
	XsWdW9pohopo9EWgaZaaji2klYvm36MSo5t7Q0mvORYc2+OvF2YXFch82kKBU5czAdNoBurk/oR
	GT58QyFY5rqAn85uvfMJbEvVaA2iidf6iJUND/xBRjM773uJLszpNTSzQi4OsD9xK7onCHRQSAD
	FpRfIqgYlKpZ0CKUNdglcO/CNiWe8Y3hqw8T9Nt2BIptf1DLuiYmGXknnckywNwgqEzarwyF95I
	wP00GzYV8LZyKyEXxZWhxQeXt
X-Google-Smtp-Source: AGHT+IFXBb6vr/8D7CZ5otepQnRcmkVx5TB79A7j3YsaSno67UMLJAS4DCtxM6o0ZN+HnZGFA1J8HQ==
X-Received: by 2002:a05:6e02:17c9:b0:405:5e08:a3e4 with SMTP id e9e14a558f8ab-42481911882mr110200895ab.1.1758400737038;
        Sat, 20 Sep 2025 13:38:57 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afaa351sm39931395ab.29.2025.09.20.13.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:38:56 -0700 (PDT)
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
Subject: [RFC PATCH v2 03/18] iommu/riscv: Use data structure instead of individual values
Date: Sat, 20 Sep 2025 15:38:53 -0500
Message-ID: <20250920203851.2205115-23-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133857_994787_DC0AA281 
X-CRM114-Status: GOOD (  13.19  )
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

From: Zong Li <zong.li@sifive.com>

The parameter will be increased when we need to set up more fields
in the device context. Use a data structure to wrap them up.

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 901d02529a26..a44c67a848fa 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -988,7 +988,7 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
  * interim translation faults.
  */
 static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
-				     struct device *dev, u64 fsc, u64 ta)
+				     struct device *dev, struct riscv_iommu_dc *new_dc)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct riscv_iommu_dc *dc;
@@ -1022,10 +1022,10 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
 	for (i = 0; i < fwspec->num_ids; i++) {
 		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
 		tc = READ_ONCE(dc->tc);
-		tc |= ta & RISCV_IOMMU_DC_TC_V;
+		tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
 
-		WRITE_ONCE(dc->fsc, fsc);
-		WRITE_ONCE(dc->ta, ta & RISCV_IOMMU_PC_TA_PSCID);
+		WRITE_ONCE(dc->fsc, new_dc->fsc);
+		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
 		/* Update device context, write TC.V as the last step. */
 		dma_wmb();
 		WRITE_ONCE(dc->tc, tc);
@@ -1304,20 +1304,20 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
-	u64 fsc, ta;
+	struct riscv_iommu_dc dc = {0};
 
 	if (!riscv_iommu_pt_supported(iommu, domain->pgd_mode))
 		return -ENODEV;
 
-	fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
-	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
-	ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
-	     RISCV_IOMMU_PC_TA_V;
+	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
+		 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
+	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
+			   RISCV_IOMMU_PC_TA_V;
 
 	if (riscv_iommu_bond_link(domain, dev))
 		return -ENOMEM;
 
-	riscv_iommu_iodir_update(iommu, dev, fsc, ta);
+	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
 
@@ -1408,9 +1408,12 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct riscv_iommu_dc dc = {0};
+
+	dc.fsc = RISCV_IOMMU_FSC_BARE;
 
 	/* Make device context invalid, translation requests will fault w/ #258 */
-	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
+	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 
@@ -1429,8 +1432,12 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct riscv_iommu_dc dc = {0};
+
+	dc.fsc = RISCV_IOMMU_FSC_BARE;
+	dc.ta = RISCV_IOMMU_PC_TA_V;
 
-	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
+	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
