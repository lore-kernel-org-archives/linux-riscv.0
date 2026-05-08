Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E65CD342F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 06:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cg5cJ9CAFeoDUPHxJJuYQ/2OTDzyWhyqCwpvOR4NstA=; b=Ni8YI2Aiub/HjN
	eNZE2/2l2l9W1b5DUtcnC38WdXbnmcr0WQQpxgsPS1VrjA/I5AUs5YzATBIwPLQJta5eWgs2ZqSlA
	aqzvOKNFI7bpWUQ34TpOhRbJEklxHTjWQbn7uONiO7gBSFgR0PfrbYLe34rWWd6Y+Waq3Do0INn7j
	LAHF8Wa25oQP7WVcSBwIw/3U2hhnlTV4QA3m7uFMGC4jELETUjt2d4FhNLTKy0t/evNlVxTJKdGfq
	sRKfU75e9g74TNXudNTWSuoik/4JEHEZpqyBQZzsAf0NCzz5zzbNKIALd86/aXteu381GJU1nYjfu
	xHw4SQmqQQly+oofgbAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEYb-00000005iUd-3okE;
	Fri, 08 May 2026 06:19:30 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEYY-00000005iT8-3d3O
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 06:19:28 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8353c9f24d2so895245b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 May 2026 23:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778221166; x=1778825966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+4px8BwYZFhTuuCugdzO8I6K2HioZzSZpj/NFEZaAQ=;
        b=e0Rj3JP5lIdktOgVZUWTJbaIH8s2ARgi9JMWR60eBHsvrqTQyo5L0gv65Hu+IhBRDD
         HJPllj+tN78uRFtBAYPk/C0B6i2YtVZTUyMkqW3DFeozOgAb8qY+94W/ANKy+XfKjGGJ
         ESGC2ZeW9ufmghR46NH6p2yXhR7FWK9qBXXQrbbL7saoRTXOo13e+WuOVLm/CaBhkAEe
         T87rrb6bo8NSWjuMSeT63vANPCYotqFXRFETyw+XpgRN452UKmLnF8vnub+FQgqT8RPV
         c9S7aKulrwEHJtJopO5fKKfrfTiztFQJMx9+qPzaZnNKog53JYZZggO8/xprw2xpLbtI
         veaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221166; x=1778825966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z+4px8BwYZFhTuuCugdzO8I6K2HioZzSZpj/NFEZaAQ=;
        b=sVpXGiGl38Jwfb46zU+gNFyq7GhCDYl7uam+2IEgIgK6lGZAI/OVxtrMcuz4lxHUgu
         /294Nf5MLdKWGzr65vH+rFRxEgwDWDoDPTwDL0YRVo4rhZBANM4djiQlLakr4t4nz63+
         6uzgm3bsF4eTJQDEGpS6tCFWVTQ55htJuj7tJJVcOuQiPkF0IcjY1h8MDST1bnUT8ylO
         KMhqnDhvYGswNj9RjjF9MbVkZgnFAG5II21t/9h0jLdY15tpvThN03dd/jiMaD4Jblhf
         JnFcBd+F9S5smhKkwCXDddIOT5NGaE16o2SVh25kPwxB5mKyaimX2mJYstA5AwtZCoyD
         qMYQ==
X-Forwarded-Encrypted: i=1; AFNElJ99VYjuBV9xr9FH2BsZ9f8hDgGKeBqkKaN2D6Qwwnn3O4Vre5XzhqHEzq374Jl1fgUQOBznybOQ0GYCCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRnohDbl0/HBA2aolNZV0YXZ9eDPlej1Cs3h03yo/Yr3OtaEgt
	bl8gvXDTpvhVQEfOg5fUTxO6+YcTX4LDwYaieEHbY10sS0bmUlwN5NHY
X-Gm-Gg: AeBDieutkSqir15JtYmwvFi0uzMMlc+aeww3ONQFM2TQJwuxyge6wrJCAWyxbftiPO4
	lHw+Yn2S2631weL+QsDyV6TzxqVICjcPmLOgzxPtDO7JK1ACs1TuQPULNqY38LqsNyT/zm+BCQ5
	Ho4N2VTS9+yu+qupO5YJ2VfgRK1x+Ckkx1kOPFB+FVOw5NNFq2AF16yMSom9CelUC/IF11dE5I0
	9VsSGVeLKYX/YbgEIp5s0sI9oRfyUygvxUI+HKKEkvs0HKatyJtdQvgeJO+jBAyYZUvN+WA4+Hb
	+S161sd1GgJsUDxmp62+CTL3bsqljon07pPFrXqv50fbZ8Dw4mqAd5BNuF/A4mgfrpB0InPE1O6
	4pv71gjlQg1Q0JVp8d2xxDP87tjoBwJbV4+hyftGOKX5l3lD4fdzoSSPYCTCATkTyvEY6Yhe7PI
	UqtzFW9Jz2YVeG+51Ubi7m6zjg832nQYT+E4PlWQ==
X-Received: by 2002:a05:6a00:6c9a:b0:82f:98c:1465 with SMTP id d2e1a72fcca58-83a5d681339mr11042157b3a.27.1778221166221;
        Thu, 07 May 2026 23:19:26 -0700 (PDT)
Received: from ubuntu22.mioffice.cn ([43.224.245.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm11308452b3a.19.2026.05.07.23.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:19:25 -0700 (PDT)
From: Wenchao Hao <haowenchao22@gmail.com>
X-Google-Original-From: Wenchao Hao <haowenchao@xiaomi.com>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	Barry Song <21cnbao@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Minchan Kim <minchan@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Wenchao Hao <haowenchao22@gmail.com>,
	Wenchao Hao <haowenchao@xiaomi.com>
Subject: [RFC PATCH 1/3] mm/zsmalloc: encode class index in obj value for lockless class lookup
Date: Fri,  8 May 2026 14:19:08 +0800
Message-Id: <20260508061910.3882831-2-haowenchao@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508061910.3882831-1-haowenchao@xiaomi.com>
References: <20260508061910.3882831-1-haowenchao@xiaomi.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_231926_915244_1AE6BA97 
X-CRM114-Status: GOOD (  18.01  )
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

Encode the size class index (class_idx) into the obj value so that
zs_free() can determine the correct size_class without dereferencing
the handle->obj->PFN->zpdesc->zspage->class chain under pool->lock.

OBJ_INDEX_BITS is over-provisioned on 64-bit systems.  For example on
arm64 with default chain_size=8: OBJ_INDEX_BITS=24 but only 10 bits
are actually needed for obj_idx.  We dynamically compute OBJ_CLASS_BITS
as ilog2(ZS_SIZE_CLASSES - 1) + 1 (8 bits for 4K pages, 9 for 64K)
and verify at compile time via static_assert that the three fields
(PFN + class_idx + obj_idx) fit within BITS_PER_LONG.

This encoding is gated by ZS_OBJ_CLASS_IDX, defined only when
BITS_PER_LONG >= 64.  On 32-bit systems the bits do not fit, so
the feature is disabled and the original OBJ_INDEX layout is preserved.

Split OBJ_INDEX into class_idx and obj_idx:

  obj: [PFN | class_idx | obj_idx]
       [_PFN_BITS | OBJ_CLASS_BITS | OBJ_IDX_BITS]

class_idx is invariant across page migration (only PFN changes), so a
lockless read always yields a valid class_idx.

Update obj_to_location(), location_to_obj() and callers accordingly.
Add obj_to_class_idx() helper.  Adjust ZS_MIN_ALLOC_SIZE to use
OBJ_IDX_BITS.

Signed-off-by: Wenchao Hao <haowenchao@xiaomi.com>
---
 mm/zsmalloc.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 88 insertions(+), 7 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 63128ddb7959..bccadf0a27f2 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -96,11 +96,74 @@
 #define CLASS_BITS	8
 #define MAGIC_VAL_BITS	8
 
+/*
+ * Optionally encode the size class index in the obj value so that
+ * zs_free() can look up the correct class without holding pool->lock.
+ *
+ * Rather than fixing a hard CLASS_BITS constant for the class_idx field,
+ * we compute the minimum bits needed from the actual number of size classes
+ * and the actual maximum obj_idx, then check whether they all fit:
+ *
+ *   _PFN_BITS + OBJ_CLASS_BITS_NEEDED + OBJ_IDX_BITS_NEEDED <= BITS_PER_LONG
+ *
+ * This naturally handles all architectures and PAGE_SIZE configurations:
+ *
+ *  - 32-bit: BITS_PER_LONG=32, sum easily exceeds 32 --> disabled.
+ *  - powerpc64 64K pages: ZS_SIZE_CLASSES=257 --> OBJ_CLASS_BITS_NEEDED=9,
+ *    but the sum still fits in 64 bits --> enabled.
+ *  - riscv64 Sv57: _PFN_BITS=44, tight but still fits --> enabled.
+ *
+ * When enabled, obj layout is:
+ *
+ *  63                                              0
+ *  +-----------+--------------+-------------+
+ *  |    PFN    |  class_idx   |   obj_idx   |
+ *  | _PFN_BITS |OBJ_CLASS_BITS| OBJ_IDX_BITS|
+ *  +-----------+--------------+-------------+
+ *
+ * Migration only rewrites PFN; class_idx and obj_idx are invariant,
+ * so a lockless read of obj always yields a valid class_idx.
+ */
+
+#if BITS_PER_LONG >= 64
+#define ZS_OBJ_CLASS_IDX
+#endif
+
+#ifdef ZS_OBJ_CLASS_IDX
+
+/* ZS_SIZE_CLASSES computed conservatively with original OBJ_INDEX_BITS */
+#define ZS_MIN_ALLOC_SIZE_FULL \
+	MAX(32, (CONFIG_ZSMALLOC_CHAIN_SIZE << PAGE_SHIFT >> OBJ_INDEX_BITS))
+#define ZS_SIZE_CLASSES_FULL \
+	(DIV_ROUND_UP(PAGE_SIZE - ZS_MIN_ALLOC_SIZE_FULL, \
+		      PAGE_SIZE >> CLASS_BITS) + 1)
+
+#define ZS_MAX_OBJ_COUNT_FULL \
+	(CONFIG_ZSMALLOC_CHAIN_SIZE * PAGE_SIZE / 32)
+#define OBJ_CLASS_BITS_NEEDED	(ilog2(ZS_SIZE_CLASSES_FULL - 1) + 1)
+#define OBJ_IDX_BITS_NEEDED	(ilog2(ZS_MAX_OBJ_COUNT_FULL - 1) + 1)
+
+static_assert(_PFN_BITS + OBJ_CLASS_BITS_NEEDED + OBJ_IDX_BITS_NEEDED
+	      <= BITS_PER_LONG,
+	"zsmalloc: class_idx + obj_idx + PFN do not fit in obj on this config");
+
+#define OBJ_CLASS_BITS		OBJ_CLASS_BITS_NEEDED
+#define OBJ_IDX_BITS		(OBJ_INDEX_BITS - OBJ_CLASS_BITS)
+#define OBJ_IDX_MASK		((_AC(1, UL) << OBJ_IDX_BITS) - 1)
+#define OBJ_CLASS_MASK		((_AC(1, UL) << OBJ_CLASS_BITS) - 1)
+
+#else /* !ZS_OBJ_CLASS_IDX */
+
+#define OBJ_IDX_BITS		OBJ_INDEX_BITS
+#define OBJ_IDX_MASK		OBJ_INDEX_MASK
+
+#endif /* ZS_OBJ_CLASS_IDX */
+
 #define ZS_MAX_PAGES_PER_ZSPAGE	(_AC(CONFIG_ZSMALLOC_CHAIN_SIZE, UL))
 
 /* ZS_MIN_ALLOC_SIZE must be multiple of ZS_ALIGN */
 #define ZS_MIN_ALLOC_SIZE \
-	MAX(32, (ZS_MAX_PAGES_PER_ZSPAGE << PAGE_SHIFT >> OBJ_INDEX_BITS))
+	MAX(32, (ZS_MAX_PAGES_PER_ZSPAGE << PAGE_SHIFT >> OBJ_IDX_BITS))
 /* each chunk includes extra space to keep handle */
 #define ZS_MAX_ALLOC_SIZE	PAGE_SIZE
 
@@ -722,7 +785,7 @@ static void obj_to_location(unsigned long obj, struct zpdesc **zpdesc,
 				unsigned int *obj_idx)
 {
 	*zpdesc = pfn_zpdesc(obj >> OBJ_INDEX_BITS);
-	*obj_idx = (obj & OBJ_INDEX_MASK);
+	*obj_idx = (obj & OBJ_IDX_MASK);
 }
 
 static void obj_to_zpdesc(unsigned long obj, struct zpdesc **zpdesc)
@@ -730,17 +793,29 @@ static void obj_to_zpdesc(unsigned long obj, struct zpdesc **zpdesc)
 	*zpdesc = pfn_zpdesc(obj >> OBJ_INDEX_BITS);
 }
 
+#ifdef ZS_OBJ_CLASS_IDX
+static unsigned int obj_to_class_idx(unsigned long obj)
+{
+	return (obj >> OBJ_IDX_BITS) & OBJ_CLASS_MASK;
+}
+#endif
+
 /**
- * location_to_obj - get obj value encoded from (<zpdesc>, <obj_idx>)
+ * location_to_obj - encode (<zpdesc>, <obj_idx>, <class_idx>) into obj value
  * @zpdesc: zpdesc object resides in zspage
  * @obj_idx: object index
+ * @class_idx: size class index (used only when ZS_OBJ_CLASS_IDX is defined)
  */
-static unsigned long location_to_obj(struct zpdesc *zpdesc, unsigned int obj_idx)
+static unsigned long location_to_obj(struct zpdesc *zpdesc, unsigned int obj_idx,
+				     unsigned int class_idx)
 {
 	unsigned long obj;
 
 	obj = zpdesc_pfn(zpdesc) << OBJ_INDEX_BITS;
-	obj |= obj_idx & OBJ_INDEX_MASK;
+#ifdef ZS_OBJ_CLASS_IDX
+	obj |= (unsigned long)(class_idx & OBJ_CLASS_MASK) << OBJ_IDX_BITS;
+#endif
+	obj |= obj_idx & OBJ_IDX_MASK;
 
 	return obj;
 }
@@ -1276,7 +1351,7 @@ static unsigned long obj_malloc(struct zs_pool *pool,
 	kunmap_local(vaddr);
 	mod_zspage_inuse(zspage, 1);
 
-	obj = location_to_obj(m_zpdesc, obj);
+	obj = location_to_obj(m_zpdesc, obj, zspage->class);
 	record_obj(handle, obj);
 
 	return obj;
@@ -1762,7 +1837,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 
 			old_obj = handle_to_obj(handle);
 			obj_to_location(old_obj, &dummy, &obj_idx);
-			new_obj = (unsigned long)location_to_obj(newzpdesc, obj_idx);
+#ifdef ZS_OBJ_CLASS_IDX
+			new_obj = (unsigned long)location_to_obj(newzpdesc,
+					obj_idx, obj_to_class_idx(old_obj));
+#else
+			new_obj = (unsigned long)location_to_obj(newzpdesc,
+					obj_idx, 0);
+#endif
 			record_obj(handle, new_obj);
 		}
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
