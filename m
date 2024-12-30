Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9001DE77188
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Dec 2024 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLF1bvpK+f+aX3mGJ5gDYGE+kAdA6sGstjzK1JWKAas=; b=03u9UqwJCeVndJ
	Twufk3eBMbPBGiEfs+48U6WYy6kBrNjpJL/Wx04XJohbEPwj4QETWPDmqABU4HKoPwO4yqb8ZPY/8
	imBQY7+oN0fUqiZM3R4IA6bLr7/ZYbj1+nni5moIKQq4iG0dYC4xEi9BOBnbzF0+UB/+Hvn8B0Lpv
	3t3TqUeeJyytuLwaCeAX0xBWVHsobhqEpWhhtbc+qWVa7P4S254YhLwNGLPHgX+RxzD1q5bBRlm/a
	2g1/xuB9vjNT9fbz8X4pC+BO41fa6jFm5n3BTM10084GHWdErmvrsKNrk5Bn77H41ku3sUS78b60j
	tKHjr5rEp8jP/17FJ85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSC5M-00000004w3s-3paK;
	Mon, 30 Dec 2024 09:29:16 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBoF-00000004tGM-0R5J
	for linux-riscv@lists.infradead.org;
	Mon, 30 Dec 2024 09:11:37 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21669fd5c7cso116693605ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Dec 2024 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549894; x=1736154694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=YbpxeGb5q8Imu3/QVcIT89m0+29EvlgIvaXTO5u/a4FdRWP7SYerPgMeEj6l+cu4MA
         wtcbuUvS1DjbCXxcE8jkM1d2PbsjLF7akEBPODyYOEgWC50afCEglAY9jiP1p/mfPpii
         ACb7IaW0gwe9e99rI8hrFlm4GIHWniL7J1PdzLUyzfevv2mjAa6SICatJOtkfzCwSOBf
         k8iVvMgQFKFfHD26GKsBNvdGdJq4quoZzPSuYFSocm0eEmgV2lCvY1sIB0IuWxgMLErs
         8i3pM+KFVeN+E4OKBUFdgICduIokLJcqjj9d+P6JbfIuB8k2C1qi+k7eQ1aEeYrZfSLl
         OBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549894; x=1736154694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=phyBBxTYky6hWGHCZFs5wHOlPW2RQDNomdb+OT52nwHEBMxt9nrMRUGsgFsdNKbYAH
         HkAxCo6DmP/2/4uUNGUWRHxUVqXuEmBplyUKJszij68o9at3uw/4OnrybaAimCpk5qRm
         FEdoetDgsLdRItlttji3YxpQajaAwGbbv7BwyO9e+r7LVsV5h3tjftTDzHnlwpNF5E+t
         1xCulbSaDXatrhNCLw9off+cuF1Sq4Rzp3Y9V4KCcgtPjD+0RCELjpG9fRCOJQhQhsu7
         0EfQdSKb7cf2xe2A3Cdy8/j04xZe0wtmf281H6w7MSD45Ut+LoBluv46JJmGl2d2Qkwd
         7OYg==
X-Forwarded-Encrypted: i=1; AJvYcCU3SvioXBnBALnBLyFs+dFWqja2m91280wNMjdqUVPxzZL0sY+SewviduG9QGa5Y+GjMec5RSlnKBpCYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPJE+ApQw1tnYGiFuH/RzNDdnd1Y3j2wkEreLudhVUCK/NXd6q
	eZb6YNChqyUCaWvLGuH/FLTj2lSozVBXwIvGhZ3nf+VMcxVxTBIBxFyjN0/Sbbc=
X-Gm-Gg: ASbGncvcbb3f9bFhQ1Z1cSqUKHXD8IKeb6od78ztqMxM/DuHHMkhdr5Iv9Kkl8eLoQn
	YZRD65wtyLlV60q9FIPv/9hZ7XR/a+VWJb0VXeYZX50Z7i0QTbObTRZVukyU0e3jmh/iVaXRVeA
	TCs4ud3Ppgrs8cS5/vuA9jf4HUd9rL7TyE+V5leJR/GH/b5rAqi4NkPBGLed4U2iKeWJIzSHozk
	6Z2Fbei4Mzl8wMkux7Ifm28awP/duZ2oiZuYDlVv9kuXT3YfyyCwmFNgBekx6jBwHNzFAyz2JyA
	Dw5aKj5fqiNCsUKOwOetGA==
X-Google-Smtp-Source: AGHT+IF2zawjY8HUYTCaMJHzWmoJ2TNFStaqczmOTvWfDCo9S9fZfm/YNlaFMm14SUWbTnX0T2oRFg==
X-Received: by 2002:a05:6a00:600c:b0:728:b601:86ee with SMTP id d2e1a72fcca58-72abde82a17mr50548930b3a.16.1735549894520;
        Mon, 30 Dec 2024 01:11:34 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:11:34 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 14/15] mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
Date: Mon, 30 Dec 2024 17:07:49 +0800
Message-Id: <286e9777dd266dc610de20120fae453b84d3a868.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_011135_215029_8FA221F8 
X-CRM114-Status: UNSURE (   8.44  )
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

The __tlb_remove_table_one() in x86 does not contain architecture-specific
content, so move it to the generic file.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/include/asm/tlb.h | 19 -------------------
 mm/mmu_gather.c            | 20 ++++++++++++++++++--
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 3858dbf75880e..77f52bc1578a7 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -20,25 +20,6 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 	flush_tlb_mm_range(tlb->mm, start, end, stride_shift, tlb->freed_tables);
 }
 
-#ifdef CONFIG_PT_RECLAIM
-static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
-	__tlb_remove_table(ptdesc);
-}
-
-static inline void __tlb_remove_table_one(void *table)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = table;
-	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
-}
-#define __tlb_remove_table_one __tlb_remove_table_one
-#endif /* CONFIG_PT_RECLAIM */
-
 static inline void invlpg(unsigned long addr)
 {
 	asm volatile("invlpg (%0)" ::"r" (addr) : "memory");
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 1e21022bcf339..7aa6f18c500b2 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -311,13 +311,29 @@ static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 	}
 }
 
-#ifndef __tlb_remove_table_one
+#ifdef CONFIG_PT_RECLAIM
+static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	__tlb_remove_table(ptdesc);
+}
+
+static inline void __tlb_remove_table_one(void *table)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = table;
+	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
+}
+#else
 static inline void __tlb_remove_table_one(void *table)
 {
 	tlb_remove_table_sync_one();
 	__tlb_remove_table(table);
 }
-#endif
+#endif /* CONFIG_PT_RECLAIM */
 
 static void tlb_remove_table_one(void *table)
 {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
