Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88285C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 07:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EH0k4Gah7QeUz+5df++bWVQNSI3i68x3fb1YgiUUNg4=; b=rVmdqZDnRJMu5H
	kNSRu1cw40PBywtBFxL4C6S4HaO5SLNEyjyZ3i+yF/CHIeQW98QynaEbodAA67dI5yuO8hYToZ7Om
	K5FZh2u8mkKAdhYh7ZbD9JQ8RiQ3/cok73u9eZ+omY8Awim/zc2EyZaqiW4+2bipOR4Cxhoir6QnL
	jU1hIsV7jeq/Tu5FlveFiuavE/sqdOmKKSjs4CgDUjP8gsJzvLdgVmFAkTZh3/of0XLRxewyyIifT
	GSpozvHkmPBPum1BxC9PosQSOgUYebBDhZf1yMyVDiB1lIBqYhhVWRloBeaMHtoyrulp9npgUTYkI
	1q0EXAtaRMUpRBsZXiNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepko-00000000xnI-0Pe3;
	Wed, 01 Jul 2026 07:53:06 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepkk-00000000xmY-2CNd
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 07:53:04 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-c9486571b64so108131a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 00:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782892381; x=1783497181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=puBKmxakpyuhyti8JVghjO1VLPpzeh7Dz9u+N6AR8/o=;
        b=XHo6KquhZUqPV1IBIIVPdM77Bg5Qx7PxNLxgy3KCWEjs8szl4eJqlYH4QmG1Hq94Ns
         JGqaiKkBtEJgcDNvLwBJE0Ynt8Hxj2cwE1eUMGzi1o9eAa4OktQujZA+LU65V0C5BdpN
         WZdgM3fSQehfBazzqLwd3et1WgjyQyq0dZ1RbDYj8TEnWwBd8IjiTVufJrI8YmjY5Z2i
         DfNbWSrg7C49h0YgBNqWqV5wtvgu1X0HgcR24X5qRi/vyzAj9i5bh8rliHPh4C8hXurP
         9n/ImXKp2h3uuUHN+YI+7Xq25SbsNvjfN4G5pJBcuz+sEiwPeIamBfzohaN+2YfEHe6I
         CM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892381; x=1783497181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puBKmxakpyuhyti8JVghjO1VLPpzeh7Dz9u+N6AR8/o=;
        b=PRn5JfRCtQcey7zEppLm1f9rQ6+STJv7yzlKRUD8+cwA5bddX6wOXHUeDZ9aDXW2m3
         B9nkKj5T0MHgFX9VKRigqs6YZw/2KODxKF4buuAfNw9FY+fQefgXkpOUOHZuQ4k2O4WA
         45faKXuXQVJDrIKHMcojldvO9ZDsGz/DAMF8eZ9l7GvskQELNd1wJRBw7HZl3fJBsQ/I
         E4S0g4hkYLEtOU6tlwVbCZJi0Z1TN5nXRMyYX22XIO6zw7Sx+jJcP5BFWLbx5KRioXc/
         a87mTLZtG2wuyt8+Md7bj+TFrpJegjC8vbk4fLz1+hQnAQ6NDAfemXiStcqJfV9M4qvH
         W3QA==
X-Forwarded-Encrypted: i=1; AHgh+Rqj+yUFPLMg+AlceZcO1iz97DdZGsAzqFMyow5xIYmh6xVi/b14qBgY3LR3aTTdOLJJRW0t9PNqT2Yexw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwINrGhwpL6XZX3YAbxyfK3E7YxwcrjslDMxCeikea0PQT4KelO
	P9B237iBhrHaff4VDjGcNQFsdmQlspYU8adJrDhK9H+g6+S5LqGpAV0P
X-Gm-Gg: AfdE7cmTbwje27SoD/AtrIFtRqEO53KQv2EXIu2i0jxnuq0Ml2lhXlrEYuHPcCeI4jq
	OITirGxR3MSoNvrdBAshNC27G6bwKeCF+fb+o0tVi+QHNAU2bjXEAFEqCEhaR9JErwebAL0e2VJ
	dBY92qXe8W5oV414r8vs6dNtNzlU0zfge5MlA5P+QEr4G1vfZrKVAcB6iNhMI9dKB8YwMWx2R9N
	GWmug8mi//5EeOSiEYY4CP4c6yxIBD6YHmzM3sloXI7cHD+83kfcvg6/yokIE7zmJ+Uthj3Kiwc
	HLqPiiJ5xptRPHVnHdlomrhD6pBQJbsEnXocdAB5PCPZccU6SmraGfHEHU5a2K8zU6qqksJH62J
	YpDrOBvHeuw1d0Yh0BMRjzqvRRS1RxhUhr3gK14nN2rRqpQs+pTaBdATBdT9KimyVu7djcI1Cl9
	if2wdTu8QdVRD1Da261smVetxwMaLENJg=
X-Received: by 2002:a05:6a00:3d56:b0:845:e9e5:cdec with SMTP id d2e1a72fcca58-847c097e705mr532613b3a.62.1782892380950;
        Wed, 01 Jul 2026 00:53:00 -0700 (PDT)
Received: from wud.bbrouter ([2409:8a1e:9473:9f10:5de9:783b:c249:18c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479ff8f959sm3608232b3a.3.2026.07.01.00.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:53:00 -0700 (PDT)
From: "Dylan.Wu" <fredwudi0305@gmail.com>
To: anup@brainfault.org,
	palmer@dabbelt.com
Cc: atish.patra@linux.dev,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	zhouquan@iscas.ac.cn,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dylan.Wu" <fredwudi0305@gmail.com>
Subject: [PATCH] riscv: kvm: Skip preventive hfence.gvma for new G-stage mappings with Svvptc
Date: Wed,  1 Jul 2026 03:52:39 -0400
Message-Id: <20260701075239.95542-1-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_005302_566428_EF8A7676 
X-CRM114-Status: UNSURE (   9.36  )
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

For Invalid->Valid G-stage leaf PTE updates, the flush in
kvm_riscv_gstage_set_pte() is preventive. When Svvptc is available, new
valid PTEs become visible to the page-table walker within a bounded
time, so an immediate hfence.gvma is unnecessary.

Skip gstage_tlb_flush() for that case. Permission-restricting updates
continue to use the existing flush path.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dylan.Wu <fredwudi0305@gmail.com>
---
 arch/riscv/kvm/gstage.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index c4c3b7956..7b805112d 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -10,6 +10,8 @@
 #include <linux/module.h>
 #include <linux/pgtable.h>
 #include <asm/kvm_gstage.h>
+#include <asm/cpufeature.h>
+#include <asm/hwcap.h>
 
 #ifdef CONFIG_64BIT
 unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 3;
@@ -171,8 +173,11 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 	}
 
 	if (pte_val(*ptep) != pte_val(map->pte)) {
+		bool was_invalid = !pte_val(*ptep);
 		set_pte(ptep, map->pte);
-		if (gstage_pte_leaf(ptep))
+		if (gstage_pte_leaf(ptep) &&
+		    !(was_invalid &&
+		      riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC)))
 			gstage_tlb_flush(gstage, current_level, map->addr);
 	}
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
