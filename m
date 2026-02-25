Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E482EFD20A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 08:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5PTwxVHrnPfDtuzUtpItgjNO+WqNdLHHhE7ZCBYjmw=; b=HD0HIM6TGWVBrP
	KO7ORNVGEsVVVblWZjPd8RBx2rfLL8Vfjf9+rvL+Kl/9ikdYQMemuIA3PLSTlsD0Sef8GML9t7RRw
	2fyK+B8SQxz6oP99mfx3xnT5tGA79i1xmIA6P+l9aiSj1XIsbJnKr9LsybawBM3c69mzJHmsEB8vb
	EFVgChBSmLwHxdpLUahQnfUDuqCBa0huAx+FAoXKjx01dqc5lMps6vd081NZL1PCjIJrp3ltQNm74
	RQ2roYIIZQWsrAAaxdKMiCjoZI8SS4BQ1/f+C6afNTnoAxspYpsE+6z3NDhcK9QsyqJOtle8kxd/p
	mNE+9pGdkfL0j97cTdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA3S-00000003UhM-2dXU;
	Wed, 25 Feb 2026 08:15:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA3Q-00000003Udt-04wk
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 08:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJ/15auNTcs4bEnKE4TKOadihs1pA/T7OdgqiTtaDyY=;
	b=c0X3QpC5vcKEFdL/grFd/wVL4sU7h17e0m5Okw5SAXE+m5Viyrvt1gwKqtkmiDL11AcG7F
	BjP7fUrCRt1HrQoAVeKjRPzmfhY9D6fTrqGIXc47oAYdtPU2GGQST+a1opZLK06KI7jauG
	Ciopo/kTp9GtjvYNXSL0WkZ3rhVXN/4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-MO7Loi8qMuGy7jOa06YqRg-1; Wed,
 25 Feb 2026 03:15:25 -0500
X-MC-Unique: MO7Loi8qMuGy7jOa06YqRg-1
X-Mimecast-MFC-AGG-ID: MO7Loi8qMuGy7jOa06YqRg_1772007319
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 320AA1800349;
	Wed, 25 Feb 2026 08:15:19 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.55])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BFB231800465;
	Wed, 25 Feb 2026 08:15:08 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org,
	andreyknvl@gmail.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	linux-s390@vger.kernel.org,
	hca@linux.ibm.com,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v5 04/15] mm/kasan: make kasan=on|off take effect for all three modes
Date: Wed, 25 Feb 2026 16:14:01 +0800
Message-ID: <20260225081412.76502-5-bhe@redhat.com>
In-Reply-To: <20260225081412.76502-1-bhe@redhat.com>
References: <20260225081412.76502-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: rbBvTQ4ipYgS8OhvfLABE9uYRZLhbOpWSiJjdpRSYJs_1772007319
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_001532_136747_E0D7774C 
X-CRM114-Status: GOOD (  11.22  )
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

Now everything is ready, setting kasan=off can disable kasan for all
three modes.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 include/linux/kasan-enabled.h | 12 +++++-------
 mm/kasan/common.c             |  4 ----
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index b7cb906825ca..cec21a08446e 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -4,10 +4,11 @@
 
 #include <linux/static_key.h>
 
-#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
+#ifdef CONFIG_KASAN
+extern bool kasan_arg_disabled;
+
 /*
  * Global runtime flag for KASAN modes that need runtime control.
- * Used by ARCH_DEFER_KASAN architectures and HW_TAGS mode.
  */
 DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
 
@@ -25,18 +26,15 @@ static inline void kasan_enable(void)
 	static_branch_enable(&kasan_flag_enabled);
 }
 #else
-/* For architectures that can enable KASAN early, use compile-time check. */
 static __always_inline bool kasan_enabled(void)
 {
-	return IS_ENABLED(CONFIG_KASAN);
+	return false;
 }
 
 static inline void kasan_enable(void) {}
-#endif /* CONFIG_ARCH_DEFER_KASAN || CONFIG_KASAN_HW_TAGS */
+#endif
 
 #ifdef CONFIG_KASAN_HW_TAGS
-extern bool kasan_arg_disabled;
-
 static inline bool kasan_hw_tags_enabled(void)
 {
 	return kasan_enabled();
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 0d788a468e96..fc6513fa5795 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -33,16 +33,13 @@
 #include "kasan.h"
 #include "../slab.h"
 
-#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
 /*
  * Definition of the unified static key declared in kasan-enabled.h.
  * This provides consistent runtime enable/disable across KASAN modes.
  */
 DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
 EXPORT_SYMBOL_GPL(kasan_flag_enabled);
-#endif
 
-#ifdef CONFIG_KASAN_HW_TAGS
 bool kasan_arg_disabled __ro_after_init;
 
 /* kasan=off/on */
@@ -61,7 +58,6 @@ static int __init early_kasan_flag(char *arg)
 	return 0;
 }
 early_param("kasan", early_kasan_flag);
-#endif
 
 struct slab *kasan_addr_to_slab(const void *addr)
 {
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
