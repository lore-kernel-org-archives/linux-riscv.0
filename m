Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F2510A88F9
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 17:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J4NNH++2TkBKkSb0aJWbDT1tfDmssRAFh3w+tLPc8MM=; b=RKd7rZ9wAs4QlZ
	d0YR4BWfab25wybQZULWk52mZdI7+1XTrh1d5kA4wBAXMBSVDehFFp4SNRkS11YBm2+RjW3tu3tqd
	W52iywGLz57sxNtrJ8sOOdP0g3XDwX+KStKV3KfALnsNcoq543hiuEUX1vB8tvdaIYSqkCqGlCfi2
	X86MliF8HoDlA4rXa/o6hJ72PjY/rzsD6zgqVoavIim87RjcnxyGFiBx6P2yE4viw7OuXhDs6GuXA
	dlJbldGHztTfKI6KFIh18bOlBD1rp4aloDumMaPQUFkbSXpNB91e/YCraV0Tf1XZ0gccQ5NomayDb
	kxV9HDwuPKAd7MW/Tuuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oxm-00000005zXi-0DsH;
	Thu, 26 Mar 2026 17:57:46 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oxj-00000005zXK-3GMN
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 17:57:44 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-79495b1aaa7so12971117b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 10:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774547862; x=1775152662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DkV/sS5NXQeiPjlp9UyXTqzIZIBKvql5Nx/cBjkpGbc=;
        b=rkYamIOZKDm0sRRmrH8dFI1Jq2SKPrlJqbC8obfauvZiT73lHCPOeC2HzB5NjEURGE
         Cc2toOneTg3pY/IdFyoLyS3ID6cjIbmyE8i6INCmSyjY2cQG9kUv68oJ05M9UBREpDrl
         XlGwnIZ0uoisAqr3LOcQmgG1Q9AULqYnAJ4mW0ESpG1p7gk3bHkD1lYjEemm+AXGaxE3
         oubYE90Z3NtuI3XiTpjlcSVNHIyxom4cR3vL/lsF4GeY+28lX5gXUXMfxbTj5XRnsf4H
         JPHoBgHPYY6+7TSXrYLiwqpw2QNi9ol/A9z3QCSuqlKwrh1E57oIup9GFq/cwBtHNrKQ
         nRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547862; x=1775152662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkV/sS5NXQeiPjlp9UyXTqzIZIBKvql5Nx/cBjkpGbc=;
        b=cgWJDUtLFvYTuQqUjs6X2ggbdx8lOmu9O7TwFwWQhEhBF2BIG2pWwZq0u+i++9Fm79
         Os0txrNxU1yEnBzE4/5ivHGi8UdxH+ewdVUNQlz1ePOR7Cbo1ABzyoMu7VNaV5fhe3BS
         7WHkkew+ZADjuUFr/0yhfj8zL3xKmv2PtunoMiWwk9uEa3+nKybzdvgLD+odvJ6jOnmS
         EtYYQZPe5pBv3hIwxjSrhKxAm8ou4tpB56VSOGiigQWU7tZsbmbCcsHi6rHy9SKQ0c/E
         GthMz0ETun8aQUfTzy58Ed7FiahuaiRfTz/6e4getAgPshrYp70SVEKQTGD2EINKGq7W
         Vs8w==
X-Forwarded-Encrypted: i=1; AJvYcCXCsB/PdtOB8buCbKcLJ5ORE84GaBYmHREohgpgPE0tYYWgaoF5QMp1zbNHEbFVcYA9qLllQsWd7kCevg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoTSIq4neKS0vC4s/jlTWAGnMXg1kYMzlmNW4MyVl439QdbPYB
	NvXuJ7BkwD1wZq8qNSpn4Pj8dcfHszhO65/b2UUz8MZuG7DljU79qjq4
X-Gm-Gg: ATEYQzwXyd+w3APv+KGZB7TpX4AaOOdUKbGLG9D393Jh3QK4PMWuZ3FBtlqJDtwyq/q
	rc4R7wulDccq3dl9+V/irn7jatb8f3E3I0nbbLJZWRMBekmXN7SF+6mgnN0Mszpj+HzWatxU9Ub
	Hpc286mcNkK3lZ1LPOqAc6WFNaIJtzdue+19JezkouU/AYSH8GKNi2YQyJfuw6XZim94lvFKd59
	b3CRyoXmsGqGA6vLwGbQglU0v3BzH+xjdSBrcOWbDYjIZnXz3L2yjWq6hC2+1jlIjJqrMNdF/iP
	dGmF6ZXPp88etD1HZh9HzmXiNdqtcBhFPX4IiKtjMZrj3sn1+S3vy9FLL+d6SyxJFjXzCB+T5Ng
	0HdiMHS05jsUkDGfAfO4N9BPtiu6UejFifGOhRi6XkBfXu0iwgBwdf98sBlBO5SrkISEb9xsTeD
	YjrJSMG9OoNPCSfi9VQmYLVoxLv2+fOFhfMOilyP1FDmvZkCSeF7uCQ42zDFgy1uHJd3bCgFkEG
	zgn+p8ZyKFkJ+22a5qBIpIJ
X-Received: by 2002:a05:690c:e4e7:b0:79a:ad57:f93f with SMTP id 00721157ae682-79acf647c7emr72115717b3.39.1774547862224;
        Thu, 26 Mar 2026 10:57:42 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79b1e3bdd89sm16277137b3.29.2026.03.26.10.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 10:57:41 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Kossifidis <mick@ics.forth.gr>,
	Sebastien Boeuf <seb@rivosinc.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2] iommu/riscv: Fix signedness bug
Date: Thu, 26 Mar 2026 12:57:38 -0500
Message-ID: <20260326175738.750060-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_105743_824944_5A250FE5 
X-CRM114-Status: GOOD (  11.56  )
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

The function platform_irq_count() returns negative error codes and
iommu->irqs_count is an unsigned integer, so the check
(iommu->irqs_count <= 0) is always impossible.

Make the return value of platform_irq_count() be assigned to ret, check
for error, and then assign iommu->irqs_count to ret.

Detected by Smatch:
drivers/iommu/riscv/iommu-platform.c:119 riscv_iommu_platform_probe() warn:
'iommu->irqs_count' unsigned <= 0

Fixes: 5c0ebbd3c6c6 ("iommu/riscv: Add RISC-V IOMMU platform device driver")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
v2: 
- Add correct Fixes tag.
- Add RB tag from Andrew Jones

 drivers/iommu/riscv/iommu-platform.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
index 8f15b06e8499..399ba8fe1b3e 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -115,10 +115,13 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 		fallthrough;
 
 	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
-		iommu->irqs_count = platform_irq_count(pdev);
-		if (iommu->irqs_count <= 0)
+		ret = platform_irq_count(pdev);
+		if (ret <= 0)
 			return dev_err_probe(dev, -ENODEV,
 					     "no IRQ resources provided\n");
+
+		iommu->irqs_count = ret;
+
 		if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
 			iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
