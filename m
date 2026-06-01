Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F890CD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TovQLZK1r7iDY219WL8CZn8gLYNKEw7JQoAcJr6BFa8=; b=bcfStt6kIyg3MS
	IyC5f6pMTVaQhwp4BhcStSlS8ieU6OPRAqMY1ooXir4XNc8kE2BSYfsGZfq2HPWLh9MwVbl6rOB5I
	eaGA8KA/ynpsmStqx8Jd53ANDpV8pvl8jUKFtlxcMprDPITTCCS2RXZxWhQ4D4IbuelsAGgd3LuHS
	YOE5n7yh2tag4c4No9LhWbe2JhD4DxqOPIN2QUGuPnwBWbZdJyjhq+1EzrsNnAIrCpDYwedQx5nvk
	FtD/0KDU+Xb8hzvyqPLDAODqKSZcJZ08uFcpKkR8ya7hPdYMDfhS1RP6+9nq3DP66rT2ZtRS+Vxwe
	gg4eDKcuvRjW/nx7gK8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKn-0000000APxP-1osL;
	Mon, 01 Jun 2026 08:49:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKl-0000000APvT-1NH3
	for linux-riscv@bombadil.infradead.org;
	Mon, 01 Jun 2026 08:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=q8b/yYnv8ZH41kctmwMZLOttDvAzW7LNe3UEG0HH1sI=; b=qxpkWs52FyeHPpDx2YM1QT3wn1
	eAqXx0uThX6rsw4VuGZSMQa5HhpR+B4OalssDWNGoYfQCskm2bfN48blrYdHcI4YxaISLq5InQnpR
	wMbFmL2bT56lM8yo9KcdmudN4H7tOyp2rJpsoEHVLAZx8OD6BuoA4OSp2NBl7VxBSKa8nmTub00bL
	ayb0GINckIp0D49YHuDoX9qk0hrYOPyi9awCbmSEUnrHKqSaNv1ooWhQUhOTarDpkPmHeGT85AkU6
	Zm3Hh+/MhbgaYHsDH82wz1cSeoqTLw7C2B0SdYMFdLgeY5HIlpAwsZO/c5vqAMu20SReAyam0ezpZ
	BY8OdnmA==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKi-000000067hu-01tm
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:49:18 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36da8439078so798980a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303754; x=1780908554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8b/yYnv8ZH41kctmwMZLOttDvAzW7LNe3UEG0HH1sI=;
        b=C3j7T1vSqO3N7lUr0N3C3lqzAly22BrIrB5o5v1VKSKU9i0oTthiRyeqHdMYPy0Qu/
         sI7hjkTWOhQQHUyZcETRYHYsXO7nb+H4BVFV8S/T7hXCNT+cDPZax0LtJ/F+WCcAjbDM
         YsVmpKPZbgZHmQcHTnnvrKhoek30miKp4AhuHHku9k/uzfzePSbEDroZbQ2v5rkFa2yn
         nCjTpBzGaHHi1T2yaYgV3C8tAZ7Nu5k5uPJE5Hh8/nSaK4yvsUgKhWUbTNi/PS+hQUqg
         B5bs+a547XO+XL5j/FvSsXPelzPKWKqEodPrd+oDwNoY0OKz36yejz4iUsfzYweidBJV
         +ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303754; x=1780908554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q8b/yYnv8ZH41kctmwMZLOttDvAzW7LNe3UEG0HH1sI=;
        b=C9ESz48Rrcw8EUEbeKuqnHfzicOzl+/og3/qUxkRnbqfzSCz1jA5DuRaonN2v7u1rl
         Q3sRpk+V3DciblqKBrXukbkXQ8RGkeHdts+S8Ysw62n3XN0e31ARMocKQ3n4AJsSuRsi
         8dqcC0bMQ+VChPREsvHJMuwvcG4TRdua3mvMsvgchatVFZlR2DTed1mo4OR8XqAOi2ty
         n1oUKuYU+CYEwaOAn50Ae+sbs8ideWztbOa/1xtDSRKEPjNIrTvscNah+F8sQ3wCtk5r
         XbJWwk3xPSUzMQY+deWeDVvVOzs6OQoX/B3heCX+vsUciHjhMb9+rwXHXAuJzSv3QX2t
         Lz/g==
X-Forwarded-Encrypted: i=1; AFNElJ/VZs/4HVHS+leIZ17+yihuSiWlwl33xGX2+70r846BcNIigq30+N1pbgpFn2WaiKPSCmsRLDicr27oSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHp2y90bZq+gmdZJrGqtvyxDCZIwP3wXSl8dt4vEUT+baBKqPQ
	tAhQXPMOaiRCZS8OpBhwWFLRihQVRUezldzORTlj4UZba8TTCwQ9lm661y6X7OSXkQA=
X-Gm-Gg: Acq92OENKVu93N8sHwlp/+GmI9vIgfb+6A9O6Z9F3J1S4Rv3K1ElNu77yk9UAo2hzyU
	qB1MC8X7OSoJ1ogsDUb4xKCbOFn00msIL4aI4FKgiBc/i9m/AejSTnn4pcJ4QN08BbK3rdK4nBS
	lwtKCumY4hhkzayJYzIH3MMliArHMbfhSnPgmtQR6WJM2y1Q4BkdNTex6avf93zi3mqz2vWlnpV
	VdrZ9n3nG+Ss8vJD5hDMopVEMPeRZYJ8njt58lA+m7kANIKoG1atGIHchodliLXfQt+9ZeiSnFS
	lHZk1vTTSv2iSwoVk1RgawzFLVTmdY0MPTHuHlge8nCfr2JT9yD90Sl21cRlxeMIzWX4IsVBLJ1
	oQE1MBeKLk/Uz/TwboSsIfYu7XxcSIqe0/rDV2J9xkjeegOaj2vDKyn6Fk3P6EfxLMEju5TJcrQ
	zSb5nn0K3xqtWSvy8EknCEX2QqWIC7rfypLhIoredxaIyO9wySVkmMiw==
X-Received: by 2002:a05:6a21:8ccb:b0:38b:eadd:449a with SMTP id adf61e73a8af0-3b428242975mr12005378637.38.1780303754272;
        Mon, 01 Jun 2026 01:49:14 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:13 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	WANG Xuerui <kernel@xen0n.name>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 3/5] riscv/mm: drop vmemmap_pmd helpers and use generic code
Date: Mon,  1 Jun 2026 16:48:42 +0800
Message-ID: <20260601084845.3792171-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084845.3792171-1-songmuchun@bytedance.com>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_094916_465568_69C60464 
X-CRM114-Status: UNSURE (   8.39  )
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

The generic implementations now suffice; remove the riscv copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/riscv/mm/init.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 885f1db4e9bf..5f680eb83e86 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1359,19 +1359,6 @@ void __init misc_mem_init(void)
 }
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
-			       unsigned long addr, unsigned long next)
-{
-	pmd_set_huge(pmd, virt_to_phys(p), PAGE_KERNEL);
-}
-
-int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
-				unsigned long addr, unsigned long next)
-{
-	vmemmap_verify((pte_t *)pmdp, node, addr, next);
-	return 1;
-}
-
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 			       struct vmem_altmap *altmap)
 {
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
