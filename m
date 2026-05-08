Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EFFCD37AA
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 06:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9+tft9l3hxe65QAC3SQDOb93nP6CN573zUgT3hdze8=; b=Riq5JQ0ng3lwPM
	mvwDoXeXgWfDR9XGBYwUkkXcMJhmuu9bLcNB3q7XvJfwgWdbc9nhEMzLrGflJRiwq9peyv/Nql1M9
	WpCbLjy03800uAvspXRUiIy1REjLWNsGoPVe0LSrI4vxbVT4M9v5p+tWvGm8RZkwy/CcDRQRHoWY7
	pQncZAzhjSIa86o3DtDfn4fYtoGbBYZOEsQw8macPs+1mkNTqP4C/cS4CCxsz5CqI1SqwLkmqjRTz
	OVRp1VGv54oPDCwbGx94lLif5yo7VmxZmk/fgfxmbZpmnw4e/aA+l0W3Gyt6ag7TmY9LUU88r7M7S
	mzK0i3Pkt+IkU4mr3ing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEYj-00000005iX7-0Y7f;
	Fri, 08 May 2026 06:19:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEYh-00000005iW6-3Bun
	for linux-riscv@bombadil.infradead.org;
	Fri, 08 May 2026 06:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6yd60DVAg2KX/emKeF35pZxyEzN8nWOKFEbn6cCyQzU=; b=NdBEG2QQqgm91sbg4v91qdaP8G
	mvp5ismVPJSYwdH88W4FzO1ohOzSLOzsFArAV1Gd0c7ZEON7i+OMvgZarm9IQfydx2s1Hl0qpofZi
	gZwafq5M0qwWSZ/XYV/a98YlRe0qRbNh/JMvb50Bfu68EYKDTECIZwLHqjBKiT0nf21fdnzY4ixNS
	O9yU67PAVattYTEXsPmD2kdGZb/pkeffygYFD/ucgCIWLmcqywSFvTofX9m0wp5vK6lca6y63/Pwx
	qdRwh4Jt433rIxtRMR8xE6bKB7nNYzgir+/2XCF3WYkZeyO8MfprQgarUS/QCmU54/KbZl0/N9x9g
	goqfbQcg==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEYe-00000005SCY-2BgM
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 06:19:34 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8353c9f24d2so895382b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 May 2026 23:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778221170; x=1778825970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yd60DVAg2KX/emKeF35pZxyEzN8nWOKFEbn6cCyQzU=;
        b=fzD1tmubAhfWwM1l/FuH7YuPm/12Ruti/KQURRPRm4KbG2pBBQHCXQXwRfriKGDb/c
         mitjUiIZZ12zuTe1YkR8vqf/z0YtQTk23KUrm6eot6dhGK4TrsWrlpCZMAEgfzVNyAAg
         Lo9lnpsMfZ9MvgKw87zOi/IuBrqZXHra5gnLuHjVJyK5RSTT2JmcCZ4uvvipXkgWc7P+
         FOJwMzkoB8V8tzbjEHooqMFK6gChO60c/FARbpg4EX0pxxC9wdECZFdu6SqDJ+hJh8ue
         9K6q0TT+Qi6YHuJXlbJK6tnPW6fvNL5Gf+w5ZNVYz2J0fGESiMHfdPeuCQwAPw8XFUMI
         e3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221170; x=1778825970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6yd60DVAg2KX/emKeF35pZxyEzN8nWOKFEbn6cCyQzU=;
        b=BOH9qo969FwZk3FpeCsXi+2g+ROjn9NfFKIOCDNyZoOFaRHV/3XHVR9ndxix662spj
         dr+wXKVjMabOwduQmQEe1JmbieCdjbr4BCVi1+C9pRZsBCnrs75jf5/kAvW5XOyawRrN
         p0llWd0404xLyTvyhnyjC5aEEpIH9NSdZvTBHoM/TZ57iZZC+b+DnlZSdjYXKDWHP100
         2c0QyoWR2YSu6NjK4aQcTsmdT4T0MLbRZSrEdt/tLmrDlnK3LsWE5OHhQqei7aPgboFZ
         g64WYLOKL+ZqDMJvbHtHcreSV+n1s1F+cb7EEFcXlTI/l/pfhEwZpHxpw66YNvng/TD4
         4reA==
X-Forwarded-Encrypted: i=1; AFNElJ/7d9XBmjAHH/m2kV8C+kYKLNmdoI+2MsopMDWO8WC1hGl+aeFrs0dKjlUezjp93EUaaUPkwkZ6LakTTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yws3jSHWskGm4wCP7Yo33YDi111qVv5OotgmviSpjo4hSPpTShk
	Ru8QPvbxp4FujFm4NyD08rjyXOFc4e//qMZkB8GDecxsNWdRhpyOkU77
X-Gm-Gg: AeBDietRW4ZPLRdW8k0oSbF1TNcZ/1nZlurVc+4ERBWhGz0J91FGgq9R4+B1GLFG+xh
	gxTosfsMmDmDBJtpm3etC7hZGohrJ+NmUpANcM3VPm58ZcjfKmfyRbwkTFws+SFEfjqt7T1SxzX
	dQgxdnpojbI+NElIBLUujEzkmQ/6dEUYbDh1v/gawpUs0LExvbz3h9JOGbycmancj42gg/wr988
	JhNhdY8AJs/Gcl16/pKlVjdNX2gNCC+lIswevy7abClAhWZ08Pp4O/bgVn39+8SIBmj8ClKgaLF
	5MOsW6dn/MFAOWpzuGj/0bMVL6+d23iD3IdTKWd9CjvGCK+DOeJfcvknSYBBnVgHQt1hlWEl2oG
	30egf6CXetXwMyxo/k1dE7PLluwakMga0JG0SV4CRIvElV12nIi56IUCT6spqsTXxeSItrZE2AS
	UOiorZm/jwO/awPPKJ0HIKySnG7Op0gL2rWLNJDGWghLReWgXF
X-Received: by 2002:a05:6300:8b0f:b0:3a2:f14a:4287 with SMTP id adf61e73a8af0-3aa5a735addmr12419479637.6.1778221170292;
        Thu, 07 May 2026 23:19:30 -0700 (PDT)
Received: from ubuntu22.mioffice.cn ([43.224.245.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm11308452b3a.19.2026.05.07.23.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:19:29 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] mm/zsmalloc: remove pool->lock from zs_free on 64-bit systems
Date: Fri,  8 May 2026 14:19:09 +0800
Message-Id: <20260508061910.3882831-3-haowenchao@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508061910.3882831-1-haowenchao@xiaomi.com>
References: <20260508061910.3882831-1-haowenchao@xiaomi.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_071933_061485_BCE344D4 
X-CRM114-Status: GOOD (  13.10  )
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

With class_idx now encoded in the obj value (ZS_OBJ_CLASS_IDX),
zs_free() no longer needs pool->lock to locate the size class on
64-bit systems.

The class_idx is invariant across page migration (only PFN changes),
and 64-bit aligned reads are atomic, so a lockless read of the handle
always yields a valid class_idx.  After acquiring class->lock (which
blocks concurrent migration), the handle is re-read to obtain a stable
PFN for the actual free operation.

This eliminates rwlock read-side contention between zs_free() and page
migration/compaction, improving zs_free() scalability on multi-core
systems.

On 32-bit systems (ZS_OBJ_CLASS_IDX not defined), the original
pool->lock path is preserved.

Signed-off-by: Wenchao Hao <haowenchao@xiaomi.com>
---
 mm/zsmalloc.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index bccadf0a27f2..47ec0414ce9e 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -21,6 +21,10 @@
  *	pool->lock
  *	class->lock
  *	zspage->lock
+ *
+ * On 64-bit systems with ZS_OBJ_CLASS_IDX enabled, zs_free() does not
+ * take pool->lock; it extracts class_idx from the obj encoding with a
+ * lockless read, then re-reads obj under class->lock.
  */
 
 #include <linux/module.h>
@@ -1467,10 +1471,24 @@ void zs_free(struct zs_pool *pool, unsigned long handle)
 	if (IS_ERR_OR_NULL((void *)handle))
 		return;
 
+#ifdef ZS_OBJ_CLASS_IDX
+	/*
+	 * The class_idx encoded in obj is invariant across migration
+	 * (only PFN changes), and the read of *(unsigned long *)handle
+	 * is atomic on 64-bit, so we can determine the correct class
+	 * without holding pool->lock.
+	 */
+	obj = handle_to_obj(handle);
+	class = pool->size_class[obj_to_class_idx(obj)];
+	spin_lock(&class->lock);
 	/*
-	 * The pool->lock protects the race with zpage's migration
-	 * so it's safe to get the page from handle.
+	 * Re-read under class->lock: migration also acquires class->lock,
+	 * so the obj value is now stable and the PFN is valid.
 	 */
+	obj = handle_to_obj(handle);
+	obj_to_zpdesc(obj, &f_zpdesc);
+	zspage = get_zspage(f_zpdesc);
+#else
 	read_lock(&pool->lock);
 	obj = handle_to_obj(handle);
 	obj_to_zpdesc(obj, &f_zpdesc);
@@ -1478,6 +1496,7 @@ void zs_free(struct zs_pool *pool, unsigned long handle)
 	class = zspage_class(pool, zspage);
 	spin_lock(&class->lock);
 	read_unlock(&pool->lock);
+#endif
 
 	class_stat_sub(class, ZS_OBJS_INUSE, 1);
 	obj_free(class->size, obj);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
