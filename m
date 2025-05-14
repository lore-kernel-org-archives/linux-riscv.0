Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5B1C3ABCB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 05:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ZN9cWMPvyqnnn+eMiAWd/gir7U5VxeostxRm7051t0=; b=2WI/pT+dMR0/O5
	amDbbwNlnEVrQp6g2xUCuU63prvCj1hnG/moANib14cK2yoX1DksAowgcv808zpkUqRR73yQH0+aw
	OukEB5R3pSJsOtHgpRLxY3dWFmZJ74CW6LqN75J+WP4MicdY9mOIWF63MA/DfRw4uzy7Oo/1F1JXM
	j81jOAA7BQAXlygOzHa2RTSn8ao8f45EawHvxD8FYLzPqG1Q261QBnNrIufw1tnfC8gZa4/LKRTbV
	H4W3DVGRuUFx97pMbbYsr5xJr55D2aodh0gADjaRlRPKaafAOx450ppQJdeX0Jp24+D4NTMlYp2IQ
	wlB/E5j/ErphDZFxOFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF57q-0000000E7Nr-02a5;
	Wed, 14 May 2025 05:57:54 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF57m-0000000E7Lz-3mHZ
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 05:57:52 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b1f7357b5b6so4111415a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 22:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747202270; x=1747807070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnkjvbjcuENvVJ26saTSRizx+WjEaICu8Lhi+aJlcF8=;
        b=aHrdJihNzD41Oj3ukrBVc36ATF46pmpBnt1HmRvITldQ6dgyoPp+8xaHSUUoHz4VLP
         qn1OqqeB2qfiyOyrM/a9L3zGkJH3Hnk8Me8vjAYp0ZnUvsJuiuVY7tLeIaAV1Iq7xRXg
         Q4HHgVEjJX1P8DvNnmCGmgFPH4Iyg9aJ2IM8xXDmFD+2Gj3gjS/RvzdQkFtGTHFR/dEg
         FdjCH82AX8KE4sBGPwuGzmhg5kxmWPfbTggEGXtWxwS5RDVbXiJRHlfp1PUYdtP8X442
         +lJvZ2E7OFa3ycPYTUNFbVc4/ZNolIoF0Y52nDaOKhMF6rR4fGwjikC2jn5LEYtVL3LE
         liNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747202270; x=1747807070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnkjvbjcuENvVJ26saTSRizx+WjEaICu8Lhi+aJlcF8=;
        b=uFgARZlNKrXuUkZYikwl+U/pYaZ7xdGtkZlgB3ZOMDXsZnqkng8nzSt409N3WLirmX
         Gud309Zwt9g6aQTC3MNd6J6QNL0t4qTWA9zsftsrVE4RM1fYlwlJB+TqDG2disnAhTqo
         n0lQod3o3YkftILVcp2PwtyNXk1m4NJOuJMM5DZ1iSxowBvKI3dxpZy2C79zwPhu2WQd
         VHhFUm+Wsg8VXcIDKFZ32ht+DQ8nLFFqG8aquxGakjml640t/+5Is5HAlfiaEEFpsUS4
         gKzm06D+tDtTL8ocNg2Cx5PoSK6jHIiyJwL+TN8062FbS+PQfJMNvs6zJQhioOS/rEtC
         28RA==
X-Forwarded-Encrypted: i=1; AJvYcCX825cRZ5i/3LrINnHYvcEAOb+QgGd8zGfoGkhYenYE3z/aTvFABjWoecavs7wIWKZA7fMKE4Gf2xy39w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYE8ffTvLs5k8OnSVc9/wtTP5vE1qPVD/f4HU7tXCj7ps/0qKe
	tQR8s24lLsSyd7hQ8ahuB2Jq+ZKFL8RL/dC4pV30ljnp7KzKvKJKc7YI9G7zpIY=
X-Gm-Gg: ASbGncv2yeg8PCdPB/sn9bKcgjhw9gRTYFG4pHmyPKuj1V0buoEBbm0TM1TDa+h5mk/
	JErrMzn8Vb0igDIl1b/aYasAbmy/Y2zzBondOeWCxY/dWqghLG2n8LZLlxdtvRxPe526m0AGXNp
	rLbIubyCD3/BWRstDe1X0z/hpmqwIwGnhzAsVG98DKG9VS6DQx0ReANJu51fR9FfovxY/VW6J/o
	fcNrhk0naluZXFEAE9Rdy1mjQIL2diwau7l3DdihLYD1ZvUlWDXBm3t4MxZWa5kWsfqhHWQW4By
	EPJWscse4C1MVc0MZ+6hms1MRpNpzcjMiBJG8xct1uGlmeFV2IdKvZnChuKXEg==
X-Google-Smtp-Source: AGHT+IGOnxIH4YjGEW5GtZaYNs+W/C6hB2R8AaG0BsyNWrPx0B0lajN6mf6PqMko8vPxUuZYiIe5uA==
X-Received: by 2002:a17:903:3ba3:b0:223:3396:15e8 with SMTP id d9443c01a7336-2319810114emr33089565ad.22.1747202270073;
        Tue, 13 May 2025 22:57:50 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.196.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c2dsm91721615ad.135.2025.05.13.22.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 22:57:49 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev,
	acpica-devel@lists.linux.dev
Subject: [PATCH 3/4] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
Date: Wed, 14 May 2025 11:27:22 +0530
Message-ID: <20250514055723.1328557-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514055723.1328557-1-sunilvl@ventanamicro.com>
References: <20250514055723.1328557-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_225750_937381_1FCF2F5B 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Atish Kumar Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

acpi_iommu_configure_id() currently supports only IORT (ARM) and VIOT.
Add support for RISC-V as well.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/scan.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..70f57d58fd61 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
+#include <linux/acpi_rimt.h>
 #include <linux/acpi_viot.h>
 #include <linux/iommu.h>
 #include <linux/signal.h>
@@ -1628,8 +1629,12 @@ static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
 	}
 
 	err = iort_iommu_configure_id(dev, id_in);
-	if (err && err != -EPROBE_DEFER)
-		err = viot_iommu_configure(dev);
+	if (err && err != -EPROBE_DEFER) {
+		err = rimt_iommu_configure_id(dev, id_in);
+		if (err && err != -EPROBE_DEFER)
+			err = viot_iommu_configure(dev);
+	}
+
 	mutex_unlock(&iommu_probe_device_lock);
 
 	return err;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
