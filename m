Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91784C83038
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+7AoEXpHDarkuWoRuCaN42jKWssIqKATjt+FntingmE=; b=TG8KixM4aTqa8g
	vng2yUXvclBuWTxhq0cTFLWrpY06U+yRnwmrCk+9iux6Ypxe+VppWW01TjSsOL13RqEWAf80PfSd9
	YQizDC15fZYO+mF5GhjatK+Dyeb9kedLrTtbBRjHXPjtslTtX7ezmEW3/NKPrft9y2RXzK44+ZSsL
	MDdSVZoFwvZcgf/LEhoOHqmrZ3FOQNwJlwfXSYXzq/eT+aAR7wT7f0Vppwy2DZCeorKsysqnHwDem
	fb5SIn1alT/vkxEFl9caETSZLRoVlT1W4cHamHEvGsrnMq7o54Kv91B3I3+jSCf4oeCkvtYlQKzN8
	n29/a5/vSZJRKwYMs6Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtqe-00000007mMO-19q1;
	Wed, 02 Jul 2025 09:33:48 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtWP-00000007inJ-3Ou5
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 09:12:54 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7d41cd4114aso1142670185a.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 02:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751447572; x=1752052372; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cf8Ao2h8ezKAJAKvqATMwMqWYsWwofhGl/dOQNSqVI=;
        b=QpYS3OrNDG2/u5cdXB9Ibe/jzPBTBDMTYwbCtnEou5hEH5la13G5DMOKOfOytzhjhJ
         3UTcCUaYIt44ACS4nU9CLRwCZnATOdxJx5mBE6SPgcnHBvNssI9MBLmi5I4W2+WNXJOy
         vbURSkRSTybFf8brSQ2vr6E8bwp+eTJdwjephoCPDKWwDGAT94ESXXLrVD4ooWEiwOJh
         SMARt38Pj2tx5XEDJjibnmT3pHvPtx7q7IZrnhuqX7cUoVCKblWpobZNcYqO/UlFKjpH
         CjEs2JyiFOHk5aNo9rA22ReDgENr/GDpvTh7GTfMe9RaOBk+u9FcM+2LFCqNh8E2mGPi
         pNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447572; x=1752052372;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cf8Ao2h8ezKAJAKvqATMwMqWYsWwofhGl/dOQNSqVI=;
        b=bwaeRYpYl0jGo4TIhZOCQ49zq0n2Sr4f/QDLJ5jnhCbWIpI1I0IlCBEu858G1Zwnx7
         BPTBY5W2hBK3koo4JCwSVjFOEtHD+G/aSLW595MHjdWNbzjBzBCFAbfblGpqA0Y4mPM6
         vZYLCjHW18kvHMdcXD70QKKeSoBmbw/QuRAPbRF7zCSlfaLFPGMRdL0slZfrYFIYc7NW
         yOk5lig6gDDUeYLkFwyWuwbLvz+c5yxy65vUToEbJWsAjYmBQN0YzLvUx948kjsoiCsq
         wqnnTu8w8I/4RjE5I8G65iM5yltoGQrK8WtMLHKxuIRNnzZm9rK1+2C1QFKF6h3xHhRm
         Hfsw==
X-Forwarded-Encrypted: i=1; AJvYcCUd6MttjvV5ZRXr8jdPCFsqsMx/lvn62PnI9CXYR7B8Pe4GBewLuY7t9YJTXi4HNHrYDC5lCgGqBM5jpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxydB7FdrBsrDMmgx087+LfnGv4Fkq6kehz1rIfJOwcirLeg76e
	FQkezb0WTLNtYzFwz+xha/bSNtofx4I2ARHTAJboim3kS1BaM8dKSE42v9Pwmk/XNBc=
X-Gm-Gg: ASbGncsI2Um33g67omDA8C3p4yM0cict1cVLFEIPf3O2Z6Zk2awN4GGPXBvKIpkJRMu
	3MfFJsfaMGkZGmGxqu8pfUSsYXPMnoC1Lu1QXcGFg9sssrC5HNHoHGkUFwYWt6WthIhSSZhXlyX
	Z5wouJOSbU701FDuhmjmvfHdtxFIamfVbk3+tTiWSb1hmnubKzOOsINEIzMtHNMv2yccxnyv+Ja
	HAuDHNIB1lYImOXj03vzbolsg5a/7jrtRhlRhK/tnzSGLDNqgxvdCIpOzftqECFQSbt4PQTz2xo
	LQj7E3v5ita8YiaD4E7Vq96vcsl4Bi4NxDNFKwV/qRq/qNC63GxLGL1mw+L935TQDmTN9s9ZOzi
	QSQJy5HBo
X-Google-Smtp-Source: AGHT+IFyUD4FCCIykzg07RiGu76x9G20kiM+j8vVrvF5F8WMSMCxKkhYmass4SQjSysQCzVcm6o7XA==
X-Received: by 2002:a05:620a:2a08:b0:7d3:f3e1:b8d9 with SMTP id af79cd13be357-7d5c4719241mr256799185a.30.1751447572226;
        Wed, 02 Jul 2025 02:12:52 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d4431344f7sm911736285a.2.2025.07.02.02.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:12:51 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 0/3] Add SiFive power provider driver
Date: Wed,  2 Jul 2025 17:12:33 +0800
Message-Id: <20250702091236.5281-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_021253_861579_C087D507 
X-CRM114-Status: GOOD (  12.28  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch introduces the SiFive power provider driver, which sets up a
generic power domain (genpd) provider to coordinate with the RISC-V SBI
cpuidle driver.

To enable this coordination, several functions from the cpuidle-riscv-sbi
driver are exposed for use by the external power provider. This allows
coordination between power domain management and CPU idle states on
SiFive platforms.

Changes in v3:
- Update the explanation for the absence of the SoC-specific compatible
  string.
- Drop the smc3/tmc3/cmc3 bindings.
- Separate the genpd init and the idle driver init. The genpd remains
  functional even when the idle state is absent.
- Address the warning from the kernel test robot

Changes in v2:
- Add the driver for SiFive TMC, CMC and SMC
- Drop the `sifive,feature-level` property

Nick Hu (3):
  dt-bindings: power: Add SiFive Domain Management controllers
  cpuidle: riscv-sbi: Work with the external pmdomain driver
  cpuidle: Add SiFive power provider

 .../devicetree/bindings/power/sifive,tmc.yaml |  58 ++++++++++
 drivers/cpuidle/Kconfig.riscv                 |  11 ++
 drivers/cpuidle/Makefile                      |   1 +
 drivers/cpuidle/cpuidle-riscv-sbi.c           |  46 ++++----
 drivers/cpuidle/cpuidle-riscv-sbi.h           |  20 ++++
 drivers/cpuidle/cpuidle-sifive-dmc-pd.c       | 102 ++++++++++++++++++
 6 files changed, 220 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/sifive,tmc.yaml
 create mode 100644 drivers/cpuidle/cpuidle-riscv-sbi.h
 create mode 100644 drivers/cpuidle/cpuidle-sifive-dmc-pd.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
