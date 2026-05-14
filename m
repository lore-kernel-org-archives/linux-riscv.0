Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7989CD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 17:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hsYM6lAwkHt95O37XlNgMypIvbfmwO3c+KWod8baebc=; b=uaqwt6fPJpYYrt
	MdDn+RqctTVNVj2RskoZ8wFz2XSXZ61Gp2Tx5/OWf5p1vTeZEmYIAxY5vuidQLgP2pbgbFk5SbWP3
	AwbKOgSL5qgPKdXUkubje3WQUsXVhsre6yRMR4zA69/F2Jg0jEI0HiLYmRSOaORff8w7Rh/wv/Jpa
	15ClksguQYvN5GLZh4cfv64kKdDHwKT4usEbVFe24XKTQ6fR+PDYOLLwNJ9ZzEEn8o61WnkweGlWX
	e0YnbJKrtc4mnHf0HVQy4r2Yw6e9GP0cmbXnv7oK1TDFvFdDjSUjDixOyCr2yQMsKL6Sc9zugIPu6
	ytKx95u5ygM5fQwFb8xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZzU-00000006DSF-3vnE;
	Thu, 14 May 2026 17:36:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZzT-00000006DR9-08DU
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 17:36:56 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-44b052142e1so4667141f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778780213; x=1779385013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KChkhZSF5dUBGW1dpwhtz2Nd2WW6tFTUrsIGPgeyre0=;
        b=Vv39yy9j9Zu2M6gYu4fMfy0nUFsq9nvg9XSHYv1O6+heQq4p26IISrC0Js6Wan3Bad
         RnvgPCWcoZfTQ6Vc9eupoi5eH10rU1MSCwr676mQKa5R0HiACPo4v/ugPQJf6O6WM6ak
         ZQ1x2WfaLuPJlf20cvWbUin5GVEZz9k3qHqbDX2bu7YLOSWW6nLjjjnWLbNOENoQI9F1
         ocn51NBtJyYBtbT6psyhXC4HJJt7AzlB7pBRDXPmbkKzdi9yObJ7M4vsxOHBVMxrJfnj
         Pa774zQUWIiKKLGD0snMFE7GUmF7qI4Cb/kROCiC7zLs80pOK1WM6Dynf3XywqAP/S7H
         Jdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780213; x=1779385013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KChkhZSF5dUBGW1dpwhtz2Nd2WW6tFTUrsIGPgeyre0=;
        b=ZviJkCU9VMFqDemXV2HDc5heX2vrA3F4v+7qvPLkKq0Ng3RyF4Mf/EsahYESLra8gx
         DNI+dAV4mXcmDqpzvCeHTUMQRwOx/Frqhk7sJzKpl6kc4SvQ98w5/okXGPAKKA2Nz9rp
         ElV5d6VPAp8IhTxOQMGg+lphXAkZcmFP1fHT2miUT+b8T1FC/QmGQ0BIqfozZMFsGUwO
         fRQPRVjqMc6DiHXOj/pcqYd6EGZb0mt42jvno4ZrgWfaFq8Q7I+FPOSv2yhojXP8SMgM
         qq7zEed2rmkeCzzohM9ZFhZygddLmX7DCVZCrK9bjUeebOeppajSHVilqgL+Dd8Dvspp
         2o3g==
X-Forwarded-Encrypted: i=1; AFNElJ8fdRR694Zec9zUyctIK4cfEUPvv7bZoIG/fWJZdqtGlegxIg6yzdNfC0Ms9Cmty9Ua5R1H4qyjh9KVyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGYGGYhrYvL4Sb7eZs2TDrfUTuNBKIBgIThdJnSkUFb2JHpIGw
	w8QHbWHtKz1YCfz9N2tQvEDSTlY41x5tNBdqQf0uFZdKOdz2r14g5JHE
X-Gm-Gg: Acq92OEAY7Qp1dI6GjUkhI6Sq//S2dHX8zsChCwUEsXD5+2r9hAjw1doUqTXjBJu/ln
	f+REcWJAx/7n0koyXItMkWeZludLijG+RXxb/SWdfaopCzuP+R1Ffdr+oktBOe+MY2VxtBcKaZc
	o54h6DvXTRXcdhntdZmvMWlzp8FNyzmxw0EHZvwyzOd1hU6UK54A3KoV3ahyTUWt4AiiLlyiDee
	pk1As2Wo1/pL5NCmNtbyFYme4BaioHTpQZHo1V2sVOQ2HG2nUolPeEi0XCysw0oQzJ6AGWJyuG3
	JAZoZ/7u0JICShb1RwHO6dtlmY9y5z8leJD1xeMcyfr/wK6eOln4uhLMFtSgmeI6wtFHiKWBKjF
	LO3IIN+qgtubrOc/JG/P9wm6zCNY6C/ksfOHlHff2sm0dbViMAEXYVawOLRiVcl5LDOptfP0chQ
	UE0mvwbxBbxoxKxxw094ZHdFqjNqaU/cSXytiCV07/w6Mati2LqvmVC0DpNSdQ
X-Received: by 2002:a05:6000:220c:b0:45b:d891:4ef1 with SMTP id ffacd0b85a97d-45e5c60497emr19791f8f.34.1778780212640;
        Thu, 14 May 2026 10:36:52 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:4f8c:d716:5699:930b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe222bsm6575063f8f.27.2026.05.14.10.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:36:52 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] riscv: kvm: return SBI_ERR_FAILURE for pmu_snapshot_set_shmem OOM
Date: Thu, 14 May 2026 19:36:40 +0200
Message-ID: <20260514173642.41448-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_103655_075434_2B01D86C 
X-CRM114-Status: UNSURE (   9.62  )
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

kvm_riscv_vcpu_pmu_snapshot_set_shmem() returned -ENOMEM from the
SBI extension handler, which caused kvm_riscv_vcpu_sbi_ecall() to
abort KVM_RUN and surface the error to userspace instead of
ompleting the ECALL with a negative SBI error in a0.
Use SBI_ERR_FAILURE and the normal retdata path, matching other PMU
handlers and kvm_sbi_ext_pmu_handler comment.

Fixes: c2f41ddbcdd7 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index a935ed96bc17..91aa0155a420 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -453,8 +453,10 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	}
 
 	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
-	if (!kvpmu->sdata)
-		return -ENOMEM;
+	if (!kvpmu->sdata) {
+		sbiret = SBI_ERR_FAILURE;
+		goto out;
+	}
 
 	/* No need to check writable slot explicitly as kvm_vcpu_write_guest does it internally */
 	if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
