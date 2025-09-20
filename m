Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A666CAC5AC
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9NClUfRBR4/snQXX6LV0BR1fzsHdCc6vSw8IXAP7F4=; b=k8IRsmomD92Hj+
	0TlPiWvc8D2quqkmeDThcYNVrK8j1A2SA/c5o80ldjxUz4ZOpYnaIFbTZCj6BqRlyRv/mdiGy0tI8
	Pe6cFZpvjx7b17TI9e2oDiOpB/BGnGgjrZr2i/1iAvXbDgNEusIuB3ouuJplG9R06QK+vgNlxniN6
	oC39Y46lo295zcYPO2jE9LG2vMrjuZoylJMubbTdyZITezxvZ6w3/tLmhVdUpwlW6Gi4ORiF1/IWe
	CD2uMfKL+yE4yFp5ktP+W+v+hgiUcyjgG5qVkX1QvP1DeovbBaNBklBdTbLINdqSxGTAbWSEI8CRx
	cZhTPaYQlk+zy61xPdSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MF-00000005tJS-2XQn;
	Sat, 20 Sep 2025 20:38:59 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MC-00000005tGC-1pu8
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:38:57 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-4103fb72537so28729445ab.0
        for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400736; x=1759005536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6NLd7h8COmFlKXea5yNf3+i/groQ/UZ03coZlB4lvw=;
        b=T3kXIWBEivz616OhxYw75S0eYCbX6F2zVPN6Mmf019c/QToAigGdB7KHVWrnKsEei8
         aJ82uNAMybxjA+AROKI5GRZMXi3qyqQnyD8thvlSwRkXYeTW7xFsDJ1b31Y/vjJ6buLS
         PE0lGnN9UgdVnOYTSKxGtJUBAVhmvTxDo2k3dqdEwy+QXhWsMskmW/aict9SOEkOXE2R
         GTwAtNpg93Sv+WE0/Mk5Iap2V5K/sJOJRAOiEn+QXK81dU7NzfOfl5azthsODENVkc/f
         /3M2S+ep3ZE1XvkHsODXNhfK+reuo3LChvHuu4EWDEGKxaNxgmPqrkDuqk1B3HfbnaVB
         aIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400736; x=1759005536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6NLd7h8COmFlKXea5yNf3+i/groQ/UZ03coZlB4lvw=;
        b=fOlubyXzSw5Diw5x9Yt+MaYGlE4+7EDbs3VqbBOn+WRz1LYssDJwP/8kGQdMPSsZmT
         2rvvlBLNlNt5bh8xx66nwn8eO7uWDIaQRsiZvzk1Rq/4eQ2fPqbVyDc/7R1O/MeQLEOd
         3CfHGmRmO+Xsuu9BBKDsxOizhEtcMz+eKeR5RRsFx3y+D0EAJLtmFyTR1xGDAcrhcj6i
         n5PGnIwUr44wbnFa48HQ95IAr3iCEXIVNVtJuob+mXrVYHrHJ0pxG/DTUxgIFUH7NC8S
         VNnOF1GQxZsClgXPM0eK2sLnSZkbJMyMGADA2faftmvWxyOnWLdJFSnbINZqV8eEi6Oz
         QW5g==
X-Forwarded-Encrypted: i=1; AJvYcCV7pbMdX/nWSBKHBLGxQjZVnP91zU6fAptoWK9wtagwgoTP7O/k4N17DCiQ8nRT6u/MfV0eRf606wz2+w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+AnAoqOvbkj3gYr4lvMCNr3K9kNTDYYGzsyJ6jLEKybHvohUG
	MnLLnV0a6YBj5IXs2SNw8tpbLJEUEUboM4vQvm0klpFanOEXk7ldPA8MTYmtxG5KwIk=
X-Gm-Gg: ASbGncvXtIiEa47aKGh5IFypD7RLEXMLDReP000Z5FpSSPRcfQfd44huzzyK8EvDyAK
	Pfpc4QI9c3LeByR9DmQHWI7EC0NPXc1QoM/I1J1KUoddf3d2a1SDUnKa4csA7wRsttBazSX1oBH
	pl4HIrQen/mRGAjfhD5SqDw+BM5wGZwKU+ruEJ5yUqyvLQXReKfWivlD3VA9Y8qKNl+A77JNUuP
	zp/Zv9yHnCyjaDcIcnaBHG09gAmudH8+pED3fVLAqgR57fpadyfS2afR+r+2EsmqOVKr6FBJpVW
	WK0sVDcg1WBVHzQm9HBdMU3nzVUoKQgeHs55mBT25uO953uxzdHUSlMjTDgRB64N0S95hT144Yj
	ifSLyp09HlJIRHF4Gym/6UDP5
X-Google-Smtp-Source: AGHT+IHbDh/psntZAQrwhmgYfdd6+QUgFKcczM818cmbTUp9YMR8lJJAeTz4CAy+PPiDGOALUnKI9w==
X-Received: by 2002:a05:6e02:2305:b0:41f:5e50:23f1 with SMTP id e9e14a558f8ab-424819af385mr128428775ab.25.1758400735680;
        Sat, 20 Sep 2025 13:38:55 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d50aa5f44sm3758324173.49.2025.09.20.13.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:38:55 -0700 (PDT)
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
Subject: [RFC PATCH v2 02/18] iommu/riscv: Move struct riscv_iommu_domain and info to iommu.h
Date: Sat, 20 Sep 2025 15:38:52 -0500
Message-ID: <20250920203851.2205115-22-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133856_481190_7581A523 
X-CRM114-Status: GOOD (  11.62  )
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

In order to add the interrupt remapping support in a separate file,
share struct riscv_iommu_domain and struct riscv_iommu_info through
the header.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu.c | 20 --------------------
 drivers/iommu/riscv/iommu.h | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 0eae2f4bdc5e..901d02529a26 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -38,9 +38,6 @@
 #define phys_to_ppn(pa)  (((pa) >> 2) & (((1ULL << 44) - 1) << 10))
 #define ppn_to_phys(pn)	 (((pn) << 2) & (((1ULL << 44) - 1) << 12))
 
-#define dev_to_iommu(dev) \
-	iommu_get_iommu_dev(dev, struct riscv_iommu_device, iommu)
-
 /* IOMMU PSCID allocation namespace. */
 static DEFINE_IDA(riscv_iommu_pscids);
 #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
@@ -802,26 +799,9 @@ static int riscv_iommu_iodir_set_mode(struct riscv_iommu_device *iommu,
 	return 0;
 }
 
-/* This struct contains protection domain specific IOMMU driver data. */
-struct riscv_iommu_domain {
-	struct iommu_domain domain;
-	struct list_head bonds;
-	spinlock_t lock;		/* protect bonds list updates. */
-	int pscid;
-	bool amo_enabled;
-	int numa_node;
-	unsigned int pgd_mode;
-	unsigned long *pgd_root;
-};
-
 #define iommu_domain_to_riscv(iommu_domain) \
 	container_of(iommu_domain, struct riscv_iommu_domain, domain)
 
-/* Private IOMMU data for managed devices, dev_iommu_priv_* */
-struct riscv_iommu_info {
-	struct riscv_iommu_domain *domain;
-};
-
 /*
  * Linkage between an iommu_domain and attached devices.
  *
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 46df79dd5495..1d163cbd9e4d 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -17,8 +17,28 @@
 
 #include "iommu-bits.h"
 
+/* This struct contains protection domain specific IOMMU driver data. */
+struct riscv_iommu_domain {
+	struct iommu_domain domain;
+	struct list_head bonds;
+	spinlock_t lock;			/* protect bonds list updates. */
+	int pscid;
+	int amo_enabled;
+	int numa_node;
+	unsigned int pgd_mode;
+	unsigned long *pgd_root;
+};
+
+/* Private IOMMU data for managed devices, dev_iommu_priv_* */
+struct riscv_iommu_info {
+	struct riscv_iommu_domain *domain;
+};
+
 struct riscv_iommu_device;
 
+#define dev_to_iommu(dev) \
+	iommu_get_iommu_dev(dev, struct riscv_iommu_device, iommu)
+
 struct riscv_iommu_queue {
 	atomic_t prod;				/* unbounded producer allocation index */
 	atomic_t head;				/* unbounded shadow ring buffer consumer index */
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
