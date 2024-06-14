Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD47DC27C79
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 14:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sjlNshPkZ6t6N95YtpLBukrAuOKYHTML6cVbTqvCsEM=; b=lKFQHwZ2HvENQX
	5sqnHuA06uP6nfcKo+8YSLNnz1OMSwxqa1vRPKc3cO2CUm6RS72IcASq//5DthLN6x4V8FAPEd3wT
	ODS30LTfug6dFjmxo5i+Vf0UpC/HWe2mSZ+OrVlyzea9JmrYXuF2uBPTxT1kEagWlC05ZcSvWfvei
	xH7JcQbLAlktK93ShRM1dYhJHGaG7fO9/10rV3vvzCf3x3Z3SpJ7JfW8OtDnomQ5qwoXs99VEHBTV
	HbNdKPQbTD9dQhuBTP7nbIIG38w781hOBakWE5BAgI95b8b/fTz+T7ZeN9YOtq/O235W6ndHga5hR
	YeDizckKCAvB2MInKRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7oi-00000002zsU-2JKp;
	Fri, 14 Jun 2024 14:22:12 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7oe-00000002zri-1qyk
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 14:22:10 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f70fdc9644so25403975ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 07:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718374925; x=1718979725; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIgry4ZlTdfYnxRdys2JHwePBLV3NAUgUfJMeam51TU=;
        b=l4X1hNA7xpSIRZmUjl6LTKYvovNSzxIUCTpfJguyUaQvM/q09zMvzpIrmV7NEngJAo
         1ID51RWUvUWMdZXXkup9BkIwIXsCSudHIJuk0qCv7XK3H0SGszxfGb6uHcR5E4hZE+HL
         UlBNbP60mjNmj+YLItrgilDLwH3ZqTbbfvUiurQy7KlUtQavsVUldPiThEuy1naqF+XW
         Cmdcj5xHLQ9HT/pBpzj6iAXhfqn/5J8VnbwibZbQlXagLFIr4jupqB8mETqM16MjytIE
         ctN8uiD0fj7+pGuITM9zt/Hu9kInbkJOz53ExoKk5r3BYjDmXN+6RYm4S/dE7qwF5hHK
         8MQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718374925; x=1718979725;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIgry4ZlTdfYnxRdys2JHwePBLV3NAUgUfJMeam51TU=;
        b=sJTYg7FMH3wUQiW9zlquj5LYRcDqG8b0Mc1q40RV34q9BIa3CgEj73B9IZRVNAP/tn
         Bi40gG1bZ4GdLvyy39aP9Xb8i5sIsQu/jqW3VuGaQLh12FKl0/vTcvGSEw6B1GaIJabF
         +MC2Zh8G/bnRfPnVPj7sTPRrxcvYxIl1ifblPMnJPAKqcrGaPkQ68zK4U6AmNuiqJtnC
         Yp1yPxoFhOPV24vOG4nSNpDjIsWqVE35dNl2jB0R2qQCCxuKV4+8AvtOoziI9MnbTc/N
         lMYCSs7q6eYCG+gjPTgsl4aXPtaKWvPcUy8XgH4zh73PQixWnHqBpmseYEU1DQFLE2pN
         FdKg==
X-Forwarded-Encrypted: i=1; AJvYcCVP9JD2YgBvba8hrFVN5Ffz0wo6uKv4HfO2JstThiv0ph8avvBnARyujrrT2WJA4+ZtfY9wD4DpyKPhyfuus9iOwTD/kVozzd0nGJmn+yLe
X-Gm-Message-State: AOJu0YyGd3r/yCamTIUD1Sg985fsQENLbo3N0DiXdpaXaXbbqoJFyChq
	kVeh+bnOBjn8BGq3WhfB1E1VmjT/058PWhw7iNw5aVhxWuNPVRKUiQO7QpqnIMo=
X-Google-Smtp-Source: AGHT+IEVsMcS6+7wufPf6Z6lst2MBU5R+h9CJE7+OjLz9j0eS8xJzhCtKfTAGpUKzPFSFcnOw3bIlw==
X-Received: by 2002:a17:902:ec92:b0:1f7:9a7:cd33 with SMTP id d9443c01a7336-1f84df9b5admr85978835ad.3.1718374925217;
        Fri, 14 Jun 2024 07:22:05 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e559d9sm32522005ad.35.2024.06.14.07.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 07:22:04 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [RFC PATCH v2 00/10] RISC-V IOMMU HPM and nested IOMMU support
Date: Fri, 14 Jun 2024 22:21:46 +0800
Message-Id: <20240614142156.29420-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_072208_667672_53339149 
X-CRM114-Status: GOOD (  11.71  )
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

This series includes RISC-V IOMMU hardware performance monitor and
nested IOMMU support. It also introduces more operations, which are
required for nested IOMMU, such as g-stage flush and iotlb_sync_map.

This patch needs an additional patch from Robin Murphy to support
MSIs through nested domains (e.g., patch 09/10).

This patch set is implemented on top of the RISC-V IOMMU v7 series [1],
and tested on top of more features support [2] with some suggestions
[3]. This patch serie will be submitted as an RFC until the RISC-V
IOMMU has been merged.

Changes from v1:
- Rebase on RISC-V IOMMU v7 series
- Include patch for supporting MSIs through nested domains
- Iterate bond list for g-stage flush
- Use data structure instead of passing individual parameters
- PMU: adds IRQ_ONESHOT and SHARED flags for shared wired interrupt
- PMU: add mask of counter
- hw_info: remove unused check
- hw_info: add padding in data structure
- hw_info: add more comments for data structure
- cache_invalidate_user: remove warning message from userspace
- cache_invalidate_user: lock a riscv iommu device in riscv iommu domain
- cache_invalidate_user: link pass through device to s2 domain's bond
  list

[1] link: https://lists.infradead.org/pipermail/linux-riscv/2024-June/055413.html
[2] link: https://github.com/tjeznach/linux/tree/riscv_iommu_v7-rc2
[3] link: https://lists.infradead.org/pipermail/linux-riscv/2024-June/055426.html

Robin Murphy (1):
  iommu/dma: Support MSIs through nested domains

Zong Li (9):
  iommu/riscv: add RISC-V IOMMU PMU support
  iommu/riscv: support HPM and interrupt handling
  iommu/riscv: use data structure instead of individual values
  iommu/riscv: add iotlb_sync_map operation support
  iommu/riscv: support GSCID and GVMA invalidation command
  iommu/riscv: support nested iommu for getting iommu hardware
    information
  iommu/riscv: support nested iommu for creating domains owned by
    userspace
  iommu/riscv: support nested iommu for flushing cache
  iommu:riscv: support nested iommu for get_msi_mapping_domain operation

 drivers/iommu/dma-iommu.c        |  18 +-
 drivers/iommu/riscv/Makefile     |   3 +-
 drivers/iommu/riscv/iommu-bits.h |  23 ++
 drivers/iommu/riscv/iommu-pmu.c  | 479 ++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c      | 492 ++++++++++++++++++++++++++++++-
 drivers/iommu/riscv/iommu.h      |   8 +
 include/linux/iommu.h            |   4 +
 include/uapi/linux/iommufd.h     |  46 +++
 8 files changed, 1054 insertions(+), 19 deletions(-)
 create mode 100644 drivers/iommu/riscv/iommu-pmu.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
