Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743D4C4450A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Z/LIu01C6Aok3dQ7TU+PaGL536zNQrrnN1ARRYuwxM=; b=SRdjb+8kgYmpwK
	K1wxkCJMqnRMGsDSPoFeey+KR2X9t0f6lA+KE39HsKenWhSIS1gyTFVNOl/KPath7euSmAndYgttB
	SAgBBy1EdhpkGOQ8Cj59YUdjYQIIb/c4XrsIvWIlLkceC9+SDZo0rFCDTqig3u0+3jfcl2fTT8xtt
	82kja8d+nN1yBdH3BjArGievzwQ4E3zmAQiBsUpcQLjeopLIoCZ0xV7Zk0UnFnXqRy9miXeyfcGrZ
	YBZ96kbREdEljH49BuxdEsmvaLiXb4unnitnNx86IUujt/26Nn8IgZ6c6tMiMjRfpPuSqBXFM3Ojh
	QFX64iFdWl+XgXHw/0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLS0-0000000HJer-1lgl;
	Thu, 16 Jul 2026 12:44:28 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRv-0000000HJYi-3xbN
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:44:27 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-848593533cbso3358419b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205863; x=1784810663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MW3VkNC58mnWKcn8BtrFop2mUDTlw3bfVwg/aYM+yrM=;
        b=I/I2ivd63Cm998WrNygaFsbuokYI75uuARjFE123bNhex8aElOjpT+Kd4JbqRMza+u
         CkL331yE8OyYgY/d5lCYycVA+BymqBlxT5PyUrOriOURns3K8OiSmsPbnTto9stMZY9H
         /kOp4UaSSTeSQLIffB2yLtgXkGxz91n3dZlfJeSjmXO60mYAGHB1JVZCIlfWEaYa0qg5
         t3UbeZd3MKPlOG43jWc/q+oEV51jMh40h4WWuq58hfwRW2Jp7oe7OhD6NvNXUK7F0fcO
         P8KgMg+1oZGzT/EXMwaBgESiire0kScwjFDAo4oBuJ/Iv8cJAp47d8vcvARoiGeN8fn2
         koJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205863; x=1784810663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MW3VkNC58mnWKcn8BtrFop2mUDTlw3bfVwg/aYM+yrM=;
        b=Q/YHHSj+fL/WjhGysHRmxwR7bFQWHzBkJ+CY7FRvnvw14TVvXpDt9UyYJBNHNbSsBf
         Dz+LfJuBoY3+m5u7roizrmcNgS7WKNcEfrdtTtJo/DqYttbMrzR0EVLJea7BzdBmZghh
         OnAwJ+bz3ICA1sEv7nEEM2PiL4sItjWfL+I0HN9xRYEmr98xdwPWG/Vj0PgyK/k6Cyc+
         JKD/nDDXgOM3WVy29cJc09VYShRYsFEAOK+yFE0c4fkBO7Pykdz9jVZmNcNqoS9d7cZn
         Qq3mW7n6HHomn9/gvyrgsWl1TuXqFNlWqBiSM1rHg1fqTGJC0QKaSt8PLnTs8+ZYer8A
         WDxg==
X-Gm-Message-State: AOJu0YwghIYxRFmxNGJG+OAfz54zyZuCRIJdK0zcMM7Jsr/RgH/XB0U2
	yR2lcAzFD2hfsT+ZZT6NxwrNWwcfryr60IcdWNR2PSR9MEvSW2tiVyMzEIQn+Y1BZURp5Gsl3od
	gZ6NmovA=
X-Gm-Gg: AfdE7cmtW5SFdqV0T0fAWek8gQMLdlGU34ZhyXob2LQkkms5TynP+LDTB6AdTM01tVT
	KRyH4zL7EEwHGXTqh3rHxQ9kBxEs7GgrC5oA4OoB2deUCb9uS23Q4X9Lgd4ZVZcBx9QjvNN03yS
	3HbfuoVwuNxsK8XXnkvjsUPUiv9FIujsneJrrp7T46A/iwn6Q/KSdy+igTKhDfKMgGP3XVENuYs
	ofWZWuxbNkwPTt0qHOTadB5h8oFxhABMR5pAUOJNNDRA6ioRK1tDlDk4sjuMo3lDPYbsfUc0EvL
	VYgHPe6lnT4RWIr1khigJEqEOWgES6IO9NpSs2aoT8wDkwn51AE00pm48RMhCQdmN17MOg3RoNW
	Pvw03IHfHBshGw4wMKxWpM8DHXEzijWc5hYrNNhGE/o/eRmhoZuhf8zkncWiA9Qci3ezDqFdtwT
	/ACYXtIE4EYIuvqM1JXSfa+NI=
X-Received: by 2002:a05:6a00:4c98:b0:848:4b27:36ce with SMTP id d2e1a72fcca58-84a673c79a1mr6078389b3a.73.1784205863094;
        Thu, 16 Jul 2026 05:44:23 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.44.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:21 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 11/15] riscv: mm: avoid Svnapot A/D aggregation in fast-GUP
Date: Thu, 16 Jul 2026 20:41:46 +0800
Message-Id: <95699db9c9b90fd1f95310e9d95b000eb8cfc616.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054424_058335_6F40AF50 
X-CRM114-Status: GOOD (  10.08  )
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

fast-GUP only needs the PTE state for the current virtual address and
revalidates the raw PTE after pinning the page. It does not consume the
block-wide accessed/dirty aggregation provided by the public Svnapot
lockless getter.

Override the fast-GUP PTE helpers to translate a NAPOT PTE into the
current sub-PTE without scanning the whole NAPOT block. Keep the public
ptep_get_lockless() semantics unchanged for other lockless users.

With 64K THP enabled in always mode, fio 4K random direct read
throughput improves by about 10% over the previous implementation on the
same system, from 2.615M to 2.874M IOPS and from 9.97GiB/s to 11.0GiB/s,
while average clat drops from 95.54 usec to 86.97 usec.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 20 ++++++++++++++++++++
 arch/riscv/mm/contpte.c          |  9 +++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index dd56c20a817bb..3727c148fa0fc 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -597,6 +597,7 @@ void __napotpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, pte_t pte);
 pte_t napotpte_ptep_get(pte_t *ptep, pte_t orig_pte);
 pte_t napotpte_ptep_get_lockless(pte_t *ptep);
+pte_t napotpte_ptep_get_gup_fast(pte_t *ptep, pte_t orig_pte);
 void napotpte_set_ptes(struct mm_struct *mm, unsigned long addr,
 		       pte_t *ptep, pte_t pte, unsigned int nr);
 void napotpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
@@ -956,6 +957,25 @@ static inline pte_t ptep_get_lockless(pte_t *ptep)
 	return napotpte_ptep_get_lockless(ptep);
 }
 
+#define gup_ptep_get_lockless gup_ptep_get_lockless
+static inline pte_t gup_ptep_get_lockless(pte_t *ptep, pte_t *rawp)
+{
+	pte_t pte = __ptep_get_lockless(ptep);
+
+	*rawp = pte;
+
+	if (likely(!pte_present_napot(pte)))
+		return pte;
+
+	return napotpte_ptep_get_gup_fast(ptep, pte);
+}
+
+#define gup_ptep_revalidate gup_ptep_revalidate
+static inline bool gup_ptep_revalidate(pte_t *ptep, pte_t raw_pte)
+{
+	return pte_val(raw_pte) == pte_val(__ptep_get_lockless(ptep));
+}
+
 #define set_ptes set_ptes
 static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 			    pte_t *ptep, pte_t pteval, unsigned int nr)
diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index 0f66426b0ecfd..b0b8ff0aade3a 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -413,6 +413,15 @@ pte_t napotpte_ptep_get_lockless(pte_t *orig_ptep)
 }
 EXPORT_SYMBOL(napotpte_ptep_get_lockless);
 
+pte_t napotpte_ptep_get_gup_fast(pte_t *orig_ptep, pte_t orig_pte)
+{
+	if (!napot_hw_supported() || !pte_present_napot(orig_pte))
+		return orig_pte;
+
+	return napotpte_subpte(orig_ptep, orig_pte);
+}
+EXPORT_SYMBOL(napotpte_ptep_get_gup_fast);
+
 unsigned int napotpte_pte_batch_hint_from_pte(pte_t *ptep, pte_t orig_pte,
 					      fpb_t flags)
 {
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
