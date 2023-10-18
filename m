Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7018FCDB483
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 12:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yxWlqbwg7gljJEh/FjV6UdYkNg2Ar/2pOZqgoAmjkxg=; b=utpMm2dyoCgRs5
	HnTFLeJV1D+pXCZRb9fxwxVDahk7HLiUYxzFemH0739Dj4j6g4RntvDdDM6ZiYgt4mXLLPU+4YNEs
	U4mm5fdN4/xPMRJ8xb3hGHO01JCp2BDK0tyTP05sQZgmwq76KgOHrQdIXpmf5QbldgC61mEvOyT9/
	bmWQZDUhIGX4fk+BP9zg5DkssFIxe2/Ms8kJTNT6gHM++g1chrUoP6a3TDAKM0rz+1hurFHvlG4jV
	yv9gibcqIzr9AmDswXExeadpVy4KpACHFAGPUUZEVfl9TuT9FtKJr/OyNRdkbpRNrRGTGuxxOMNKL
	1Dm0wx7E2i+QDne28KEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt5qX-00EgXO-2K;
	Wed, 18 Oct 2023 12:40:21 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt5qU-00EgVi-2x
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 12:40:20 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso3555534b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 05:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697632814; x=1698237614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/x3uu9zf3l2rig8KiIUkNU7Cv7Jr5Is7Qpx6yKtZAfw=;
        b=NsC4YBYUHJJ4kDawk7b2ZdNyS0Hjztnvjce/gySNsBCzj7l3ihF1RJf0AfCBwVvk0N
         HPVjp1fAKng6z5BYSRoBaK3t3LruRpN2lmqB/scpKLRPfYz4AGSG880e/15I8k1N1qhH
         ZG+qBW0XPmoUPEFXyrxH1oitIi52YCG2zpvLnUGJut5x8dYDCXsyu4MDEskbwMa6ArPJ
         E/PxeyMBgLzARNGvbi+9PPqd1OwdE7Nvy1bCnN6DXULgjGxq/nxsnh7eEGUM0bM//2X/
         USFrAs6pTUQMuP1SfqZId6m2cJTlW2Yy8iSAgDIx25mrEwJDCJr6aqmqUJfxnZp5EYZf
         36nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697632814; x=1698237614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/x3uu9zf3l2rig8KiIUkNU7Cv7Jr5Is7Qpx6yKtZAfw=;
        b=dnnIWefE5Y4PaeCIOqP3PKmeW+vaZ+b77AhryRilCDYcp9oLTjbDUJsS+hy1VB/pGR
         c+77hZE14tAiUBPL85bKTcwxQWDtLg8CtXU2If9XaFt2hF5ptuUAx97CYSYDNcA2rRqR
         hlN7tasus/+JrDtd5YknZf1Ris2y+aHXQJn52U+PLj8rEytjiAJEVdVib3p28NQ4f/xe
         UxMKtYUp5a3n0e9Fj0ZggVDZDH2a0gD5eL1g3oSZVkJdiErW1TlRmG/HcJJ7+mEmzxo7
         A6hn/wUgXyQreDgyoQi8CG+DGPE6pWKLpU0AyV1wZkAq9CuL78MO46VxnhLbpMbQjDcs
         YfNg==
X-Gm-Message-State: AOJu0YymhxtnxKp73DJDdUVnDWkQP4Nnozy4u6UDbP7pnMdThhahcs5J
	DZy4f1cTlIeWywV1CgFh17CHH7jfLFKtK0Qz2Js=
X-Google-Smtp-Source: AGHT+IGEnGeUGjTrjv2baYtR5a8vWsazPx3pLfK2Zn0Z8uBJVrUEphyrDMbgW79aJUk55uqnYKQ+WA==
X-Received: by 2002:a05:6a21:190:b0:149:700e:f50a with SMTP id le16-20020a056a21019000b00149700ef50amr8044741pzb.29.1697632813642;
        Wed, 18 Oct 2023 05:40:13 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id w190-20020a6382c7000000b005891f3af36asm1599267pgd.87.2023.10.18.05.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 05:40:13 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 -next 0/4] RISC-V: ACPI improvements
Date: Wed, 18 Oct 2023 18:10:03 +0530
Message-Id: <20231018124007.1306159-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_054018_962572_71317C7C 
X-CRM114-Status: GOOD (  12.25  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series is a set of patches which were originally part of RFC v1 series
[1] to add ACPI support in RISC-V interrupt controllers. Since these
patches are independent of the interrupt controllers, creating this new
series which helps to merge instead of waiting for big series.

This set of patches primarily adds support below ECR [2] which is approved
by the ASWG and adds below features.

- Get CBO block sizes from RHCT on ACPI based systems.

Additionally, the series contains a patch to improve acpi_os_ioremap().

[1] - https://lore.kernel.org/lkml/20230803175202.3173957-1-sunilvl@ventanamicro.com/
[2] - https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view?usp=sharing

Changes since v3:
	1) Added new patch to update return value of acpi_get_rhct() as suggested by Drew.
	2) Formatting fixes as suggested by Drew.
	3) Updated tags.

Changes since v2:
	1) Modified acpi_get_cbo_block_size() not to take cpu parameter
	   but follow same pattern as DT (Feedback from Samuel and Drew)
	2) Dropped timer patch from the series since it is already
	   applied.
	3) Selected ARCH_KEEP_MEMBLOCK only if ACPI (Feedback from
	   Alex).
	4) Added RB tags received so far except RHCT patch which has
	   changed quite significantly from previous version.

Changes since RFC v1:
	1) Separated the patches from interrupt controller support series.
	2) Addressed feedback from Andy and Drew.
	3) Rebased to Palmer's for-next tree.
	4) Added RB tags received on RFC v1.


Sunil V L (4):
  RISC-V: ACPI: Enhance acpi_os_ioremap with MMIO remapping
  RISC-V: ACPI: Update the return value of acpi_get_rhct()
  RISC-V: ACPI: RHCT: Add function to get CBO block sizes
  RISC-V: cacheflush: Initialize CBO variables on ACPI systems

 arch/riscv/Kconfig            |  1 +
 arch/riscv/include/asm/acpi.h |  6 +++
 arch/riscv/kernel/acpi.c      | 87 +++++++++++++++++++++++++++++++-
 arch/riscv/mm/cacheflush.c    | 25 +++++++---
 drivers/acpi/riscv/rhct.c     | 93 +++++++++++++++++++++++++++++++++--
 5 files changed, 201 insertions(+), 11 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
