Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881F0F53D69
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 15:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8lwsSwRsapLJlF2c8zdDGITi+lA6GRDg45j/oEokQ8U=; b=P+bvW3QVsf7b/J
	s2tehDzuml15fC/CzotTY98Iu9sIlCLYLNJtS5HLTIXvgXmU4bhdIgy3kCl+Avj5QTSTGEeNrYD/w
	hj0qhhdR3zzlD/nwuxgk6hRWGsXUekblaKn2syc52/hqW5FTu7cC9hfMJXJ4Y391bFzZ9S5ob9WWS
	eZcw91CyWuFm4myhE+KvnDvbsW6xXZfYl7rbtFg5bRVFh9hLHSTzmZ56xssnYBynydtU0iwmeYThy
	3QNOhqUKhnT6+vI2qyvVFuVnj3790z28YrXOapJkSL1Pn4ng/2oKcAHdE3K4doZK82Oqg2m/x/PLT
	hLLVQz+4B7SlmVYlbYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29gb-00000004JJZ-15Gn;
	Mon, 16 Mar 2026 15:16:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29gZ-00000004JIr-2Yc7
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 15:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=GVRLeXaP+scdPe7yJ2McKwjwTUisbGcHJ9Hw5wkSV2o=; b=Gk7JbEMg8863HrEImAMv1OXwaH
	0FgNK+KDvCFfAA8zpTT4+Cx6cTFfxRN7oLIRhezUU4MN3Uub5GkCAjdSybEppQLpUzWBTn5bF6mvD
	qvEbD7nBPYdxCIFV3f5Hhj4NSDWCP7zddTzb9CP6bcI8DTiY2nQ3U0TwJ/DLietgtZJMt9pfw/4VZ
	NnEO/8ldVMlnSEb9JBWohJLcQpBmjfo9HQe+CbqmlX1VwGFs7NZcttGg3x0OdVvQXI3dWM7kRMGEh
	NEevOd9X0bZm7P9U5fvjf0gOnnmV/xd/pjgIV5dBK46auhPzSEOQGubq7nedCQqJG7ellIrm3bBz/
	+LzZm3uQ==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29gW-000000073Dj-2HT9
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 15:16:50 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so5323763f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 08:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773674206; x=1774279006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GVRLeXaP+scdPe7yJ2McKwjwTUisbGcHJ9Hw5wkSV2o=;
        b=T+8chPAnWamkw2DGCQkYNTgdq1tgs2vL6kbiEbnhsIxus66tfz8cisdveM3PcXn+K3
         i4xSAoXel4KJR4BVcXBO+g+UJ35F3+iaMPrLSjc2wMc2e2/PWEMh6P5XXPUvomZbsBte
         TG+K6ClqpFdbJnu96xwo+hjBc8x9xDfnjMdxI+E7W1JX2fNdvTwzT6PR0jDL4wONEBqx
         6j5FPwtTgME9LWM/ziCsyITwhKnvztRt2xgYf3Pfb1BObJiCS3WdJifojStZW/IAYiaj
         ldBPX9edi+LvTpegHrOVX8XC8+ijUCp25pP7WAbtQ2JghJHqx+G0klC7yM6PbZXFBlH6
         gXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674206; x=1774279006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVRLeXaP+scdPe7yJ2McKwjwTUisbGcHJ9Hw5wkSV2o=;
        b=XA72tXlTQv+rayKiZ7pA9EOoiP6h/woFo0QliGoRnBT2c3iI6G10x3DRtxlZypj6P6
         aecV6/H5UFV3tOp4ymeoe/2Ed7tGLsnTnEyodtxbKFc78OBx3lKYAsvPgt6QUKNrk0UD
         yhRI481AuomcRuaOaQ9//UmhfLpdgYlHnGtIof+mKIp5SSIg7+MwZw0G4j49b72ekyts
         YvKjk454gWRjm6E4cCNYMNmMx5QXlYLBRbPKmZf3NvB2g75QSv6w2MOJsZL33cZX6sMR
         l3fr7sUTAKpHsiqIJXhTAK7WQ0iIOmpq5JBzKx3PibdmM2DZjv+5oZIb96xNRkhNRA/i
         ENOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqCVT/V48tmQsLVRpFK/lK1df/t5ze77vXHZid79m7K2WJ7APCYHPiVfJ/dz86ULi6WUT+V15daz/Qew==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEehGDxRnkjQTlC+VQN2WXS2tXklHogv8fFvicj/T+mw0JyKz1
	9Acz8V+DTkJDFQFVTF7aIpX+QdCinzqZRC+CqEkaT1AanC6GvvlrvxD8CmsJS/2x
X-Gm-Gg: ATEYQzzmomhACypAcK4HCTwAI35y9ljNhRb4SDCdmQz0XGxk2bXo/6BgzrWLK0lKeHt
	uxg1ESP0iETf1TYr/hF46rbP4Ey3wbGPVsSyjG2tdES/cxkMrvq90bQCohxwacp+cEy/TzjFpPF
	MeqUsvU2i3DpaFWxTgRM1JOm4lHubaX+uRzzYjO00O+H3K9kiZe7jyMZqixXK7DHr8L6/j+3XGA
	xpBiW5yrG8BkE5XW2T1IVYzm7NsCXwWBy6wxajnHmKJq3y8Lc1lM7doOed6NwVheLv9qrUj1Y3t
	ksG2aFV4o7Q6XrBjgi5HXZ/xX82jOxNcFojGikkof6b0cZqgFXBbCcdGOP2uHc89BnVEU95DDhk
	XQNAlN9QION/uWQA3i+zmzAmD2VA5jibenHyW376uAm5L9LppA/OPDbUIITTRCiyeXZdpcbN+q/
	79hqEGPmqO3c5TjEQCygO65hyQ3aq1RHEW23WpiT7EAdKWybIdu+fz/vbymg==
X-Received: by 2002:a05:6000:4011:b0:43b:4720:10f2 with SMTP id ffacd0b85a97d-43b4720135cmr3807182f8f.43.1773674206375;
        Mon, 16 Mar 2026 08:16:46 -0700 (PDT)
Received: from osama.. ([102.46.166.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b457cfa07sm6753634f8f.6.2026.03.16.08.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:16:45 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] riscv: mm: add null check for find_vm_area in __set_memory
Date: Mon, 16 Mar 2026 16:16:39 +0100
Message-ID: <20260316151642.13738-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_151648_647849_CE455199 
X-CRM114-Status: GOOD (  11.15  )
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

find_vm_area() can return NULL. Add a null check to avoid potential
null pointer dereference, matching the pattern used by other arches.

Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2:
- Add Cc: stable@vger.kernel.org
- Add Fixes: tag
- mention __set_memory in the commit message
---
 arch/riscv/mm/pageattr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 3f76db3d2769..46a999c86b26 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -289,6 +289,10 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 		int i, page_start;
 
 		area = find_vm_area((void *)start);
+		if (!area) {
+			ret = -EINVAL;
+			goto unlock;
+		}
 		page_start = (start - (unsigned long)area->addr) >> PAGE_SHIFT;
 
 		for (i = page_start; i < page_start + numpages; ++i) {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
