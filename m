Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D1CC54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lqkzsl26mfnJ6k2Ec95MadtlbpqppmtFXgjklce7YVE=; b=rmOm+waztLQ3+b
	uNeKYtKRonlpm9XR+nK52wo6Q5kQ/Ejs3AURgqgPN1Tn2BuSauQk0oGEsE3mpfxQay1wAqSiV9sV2
	GO/8b3c812WfIyp6mOr17xCs8z4AHWn1DnPen3NHjQ4ylbkRa+DTf/B68mdZndMICvIlGC6GVAiYr
	F4RBT/4fPdJsmLcvxysHpkdwXSMFCU80iCSc+Esxh1dZnR/j46ZEc4KbFhZMq4n9K9USliHpJH2SQ
	Kc+syNYaTBbg6y8i0/zo//V838lUTy8+aWismLaxQlzKELrQOgblTK8n/Dzlhzt67D7Q61Ekz+cHo
	OLkREIQH4BwWzThwp8uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp34b-00000007pPQ-2GPl;
	Wed, 29 Jul 2026 12:07:45 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp34Z-00000007pNv-1p9C
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 12:07:44 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-ca00ea47337so288985a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 05:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326863; x=1785931663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KyJMaQ1sYDuVfSZMuwHiwzVH9paIzHnqdE6/bJyXJ+M=;
        b=hOi7zRu7jbXaHEUe4MzzljG7Qb4Wwndc2RdGfY2QqMy7q8pFKLkO/m51P7mIvnefso
         T1ioqRxoYc/0S4ICZ9JjuSYTfK89U0zPEuq21KPn6M0rlDHdx6cfs/OupL4X/jlFb50s
         zCjYlSkgfuRdUI+Y17rDWnV3uDTMYzTzvoxQaHGpK35S9tP5I8jcxpCfHF33Aec/vC6m
         W7JvWQ56P6HT5JEVFLtku3eaibtNrVESTmAoDbuP+pQ9jQzdLdMwac45uNH6woKhp8B6
         NuDP4NULGpoEbPRkn1msgAGPMmwfy7B4AdXqMVzIngk7UaKoHjL8fx9pq7N/PRLpR78v
         /WDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326863; x=1785931663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KyJMaQ1sYDuVfSZMuwHiwzVH9paIzHnqdE6/bJyXJ+M=;
        b=VmB+HNFiI6nAFHfq05CcAcaES7f5zMZ908s0SzJyu82ZRJ45re5kZsrIBkYxcCuX0F
         +xvRVLtBY2w4I+Uhlokl/IKJmPXxeC+C/Q/w8UseV34uLEpIArBH77JFTHpXyGEYsjoS
         l6dJjW2a6U+anrD/khoWm7LQcrqLPdESERLFaBdyfsPMYiZaagGMRjwrpQiBuh0FMBoP
         JOyjdL6Et752geq2+yaBJ/vtiU4XX6z29DyPE3tiS1xp4VVRYLAfPA1y5heAZ5Z4AGRa
         nD/BIubGjzA2fvHZNEUWG+xwXpMQrDfcGDEUvgTvnbeM/j9H8sAxvb9i3I0gDpXzg4u+
         GwYw==
X-Forwarded-Encrypted: i=1; AHgh+Rrn/Vzcq+jFvTSt5K+5gMp7y0FOAeKl4Th09BGb2LxntbFmKkn/7212yIbK0tFrdZRodI09Ol5ihDz9yw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcoDpR66yJs+r8xrXItbWBsxyJ3SYGBgKAMWAnGA8h5V2x4IES
	eeOT3Pba+ekKwu0Tut8FfxIcGbpPPwtLNOuFDCZv52EGxPJxM4LhMv2O
X-Gm-Gg: AR+sD11zOrrsxCPOoYjGtLyxkpuU/GYhSKzYSQyYGozVDFqnwlwaIwQTFT1WJyqu8rV
	I7flLdiwtbnkOZwd94KD9e7K9/eGTO7w5efGCxW7Zmp2OQlUgq0jfFTY16UKOMDKOLwkUPJJCmE
	GIwSUAqHpxeoDN7SEO1uXodYdYuO4RVOLoGRSOL8IGVs5AgR2dL+efKsPgF/CECia2TjTjxSkoP
	5razxRqliIHcRTSN8M+xoEN5qZ64YNpuszDFxyYTod7xSWPfD60ZZ8ew81f4Y3LWMccMQj4MtsG
	a9Xk4z09ggAK/7yqUVo/NaQKy3hIjo58vQ463kHTAvKsovg50Aje10kmriqSqsng8GRIvrV0zZG
	oiKDGnB/rDrfMIz6NiI7/31vDh5xKcuP0xoTcP3k5yx8Lcj1tu1RYvtbAu3HykHbKgANGH4Yy6Y
	zu6QrF7QMlCbXp1E6xwCtfpqap/XQf4ypmlW4FnfD++uixx1O5OfPc3EhA0+nAkTUYDo1BOKoJL
	LR+qtt9G8jfCA==
X-Received: by 2002:a05:6a00:b4e:b0:84c:1cd2:142b with SMTP id d2e1a72fcca58-84e932ca245mr6604434b3a.9.1785326862618;
        Wed, 29 Jul 2026 05:07:42 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0055133sm1309570b3a.18.2026.07.29.05.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:07:42 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	stable@vger.kernel.org,
	Bingyu Xian <shanbeeyoo@gmail.com>
Subject: [PATCH v3 1/3] RISC-V: KVM: Treat -EEXIST from G-stage map as success
Date: Wed, 29 Jul 2026 20:07:31 +0800
Message-ID: <20260729120733.829457-2-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729120733.829457-1-shanbeeyoo@gmail.com>
References: <20260729075230.743030-1-shanbeeyoo@gmail.com>
 <20260729120733.829457-1-shanbeeyoo@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_050743_491957_0548BFE5 
X-CRM114-Status: GOOD (  13.16  )
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

When a concurrent vCPU installs the same G-stage mapping while we are
waiting for mmu_lock, kvm_riscv_gstage_map_page() returns -EEXIST.
This is not an error -- the page is correctly mapped and the faulting
vCPU can simply retry the guest instruction -- but KVM was treating it
as one: printing "Failed to map in G-stage" to dmesg and propagating
-EEXIST all the way to userspace.

Align RISC-V with x86 and arm64, which already swallow -EEXIST in
their respective fault handlers.  This also lets kvm_release_faultin_page()
drop its "ret && ret != -EEXIST" special case: with ret normalized to 0
the regular release path is correct.

Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
Cc: stable@vger.kernel.org
Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
 arch/riscv/kvm/mmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 8a0aa5e0e216..943d8dc72105 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -652,11 +652,13 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 						vma_pagesize, true, true, out_map);
 	}
 
-	if (ret)
+	if (ret == -EEXIST)
+		ret = 0;
+	else if (ret)
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
-	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
+	kvm_release_faultin_page(kvm, page, ret, writable);
 	write_unlock(&kvm->mmu_lock);
 	return ret;
 }
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
