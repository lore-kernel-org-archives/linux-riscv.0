Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8535FCC6B1F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XyxN7we/GpxXx1U6ly2jeDUdib98jaqEQASZpNq/H0M=; b=feRs3fDlhKQlbK
	4KOBWnTkk21Gjxf46eUI36/mx5O8e1Oditfm5Vv5ZsO17MAUhxQ+HTb3m1K7TlQL6LHh+dfH336Vz
	Xsl47/MrKRmXYQHFPKDoCB/SOvPfdh+NTAOmSi0900xD4HCCRHBxI+Q/fSK9kk+d/4FIoDWZKsneY
	G9hebkPGUvyQq2tfxPlFbAGbtSzEvu0vVjv86qZD3vCMpmkiRPmkcGg0buqSem4bQjzTCjf0GLu8d
	wlgMgvf9WBXJczIyOsfmuLsVFt/5teTeKO61cp/rT+lPa3UK1vC6e/VVrtH3xdFDN9l0MeAY6UIy6
	p8ATISdVYnNJ3f7roE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwC7-0000000FCoM-0mfe;
	Wed, 14 Oct 2026 10:26:47 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwC3-0000000FCnw-4678
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 10:26:45 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-15354aa70e8so1935174c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 03:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791973602; x=1792578402; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VtYMXNbVtRfmsxMVZSkEhD6PvdF6VjEcdjKsoIPRggg=;
        b=zrJbOI1Lw5LQ/Wc0Ee6PRAbifITm5uc+8gc+hWigUq7yiFhdE1z13MKcETxOwsjbc+
         sH2dPn7relZws7B4pt6/nvzmlcKnI4ieyCAQc73D2pxgPM0QatJw+W5C0gAO3LdtEWj3
         AXrnAt75xU+EupC+3AsK1RUBR4KSRzlOUFxIyW2pPiN/JNEXqGWh7szrw+5kHi0xBN6i
         tqTXisTJ7eln/4I6B6YmUNIxQrcJUFouL7/zhOllAxgr60+0IhGFOpFBtxqznK4L27Rf
         MpgiGI3x+AzLNxNyFfgPROdhbhutJXUBnkpL8ox1VAmbCYFqOp5XodEKGwaHwvon0qaL
         2Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973602; x=1792578402;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VtYMXNbVtRfmsxMVZSkEhD6PvdF6VjEcdjKsoIPRggg=;
        b=hKCtr1ZOLCmMGLKtyxQ9dteQ6M21CiZdHEirV/nZfysNoDapSSvMZuJWyEGv/9P3WX
         LHh2rzww7UTaiX5r3CCPbABPhf77Hvv1K2ub785FhvSWHgUZzLe+82GyYqHe45/6sb/y
         5sbYlDMPdNQeXQLxH/Grwj32fTna4lQ5K3My4SiP8fIa3FscuUFCKilJrzUayHf7COS5
         WafjxDMY63LoSeQJBQ5IS3aM1Nzj6xK8/r0hmMfFbtpUFKRyreaPGTWmPcd+AUylU35Q
         LWc7kEY1QMxyRRHC2ziDJKSwb7hJeuhwplwgGkxuNEbVrLxY3bOaqE4OdGNmm0HoinUc
         PrKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFwRPQsWH5UiU2ZwS8SKUSl2VWFngu7hx3Kg3eWPrU1X+JW6a1o2olg2kngbdZogr3Wea887DEykZ1/A==@lists.infradead.org
X-Gm-Message-State: AFq9FYJfoQsy9B0xes7K2oz3YS9zWMN8tdhNsNHiWUOIbOQn1qFJpHF6
	4moB8GDL2pEeBspPSzOZHbCNI/kIzy53RotPAtcYeYwCLZ6PwsvDSkF3Da8/Bia7vBE=
X-Gm-Gg: AYBFou3nSoOUVHGU4UAbDU96wydvlXlFFvr1qfTe7df+b5aE6wDPTtWpQUiE0lnJh4H
	KNWJqg0td3740Yi6sXlMJsz9K0M+47weBEsC6I/IxcP13iZ2xFFVAbLerP4EXLccoDWw8fJPhjI
	D8oG/I4km2rr35pS7h1g2XbIZ6lkRSp4vvr4xnVqfKf4KLBClZ8bkaevtcRbPl2KCusBwFn4zAx
	F8S7CRi5JWozSZqmFJVjHj8RdPiJCs0eEfD+pL4ipVagMQMu0g+UrDG0dGC5DhcCqz6RIbxdMhm
	J/0oNVuSoSPZSiWkPn/tPeIp3fbdzYpLuHrK09/X6W17UK2uPhFSQ1hSpuBslqtMTtLJqb67W7C
	9TCwM42a1lzDoi2ww/cUvImpfa7W0xzycUTSYQi8VURQ7dyet2QkfTDJJXpFCI5huv9X+HyYEhG
	c6OdLeCdVTfLYV2OJ7P7vZBrJCAVxU1Y+1PBbcps0izpQxh8RJsI/TQ1If+kDzXt0BNkayQCoDb
	RAISTz6QVujHQ==
X-Received: by 2002:a05:701b:450a:10b0:151:bbe4:b6ab with SMTP id a92af1059eb24-16a5ed3d9bcmr20307029c88.17.1791973602335;
        Wed, 14 Oct 2026 03:26:42 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:bf23:2386:c0c:815])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm70318219c88.18.2026.10.14.03.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:26:41 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 14 Oct 2026 11:26:33 +0100
Subject: [PATCH] iommu/riscv: Use named initializers for acpi_device_id
MIME-Version: 1.0
Message-Id: <20261014-acpi-iommu-v1-1-1744523fa658@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDUxIiSuIhbTdjASrbSIRNxds
 XyL/y+IHIQjtNkFgQ+J4l0C5hmYidzISmwylEVZY4GVIrOKEr8su2JEy1bbhkhDCtbAg5zfrOt
 /x13PbLb3APf9AIDyXE5uAAAA
X-Change-ID: 20261014-acpi-iommu-e11dedbd7aab
To: Tomasz Jeznach <tomasz.jeznach@linux.dev>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973598; l=2641;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=gDHWDcYK2QanyrU6NUlrYkRMYYGX2rjQ5QCZVztfKm8=;
 b=AwtnJHIiJrTb4iNCDXIUiIfMWQQpeSjBoeHg0K9C/FGGtJ2S2EBE/Vbsc2hjBGRj6UWaaVaOG
 0c5IzhdxGZQDYbImcQizT8FBGigNg/gaCupWKWysURa6+HbfFZBsZtA
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_032644_287170_3544042D 
X-CRM114-Status: GOOD (  16.47  )
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

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member (does not apply to this tree)

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
 drivers/iommu/riscv/iommu-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
index 399ba8fe1b3e..5680424e36c4 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -164,8 +164,8 @@ static const struct of_device_id riscv_iommu_of_match[] = {
 };
 
 static const struct acpi_device_id riscv_iommu_acpi_match[] = {
-	{ "RSCV0004", 0 },
-	{}
+	{ .id = "RSCV0004" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, riscv_iommu_acpi_match);
 

---
base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
change-id: 20261014-acpi-iommu-e11dedbd7aab

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
