Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC8F10706E7
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rBeEYlpxQ8/nIb07hcuEfi48e58b89xXLbbWK4e1s2E=; b=yKm367WzUcHhmf
	KuyZ4rBnAxGnLwOAl2urlsZUPftv+UWSgL6HcvPR04S67eRfNiqUsR+oWzEQ3z9hrH0fGmo0A0cnc
	hV36oxzKTcDotUCYx27cgP6hGlyZbef7KNBsv2qp7It9eloho4cAFIescGOFvIWMvdynJaF0aVLrm
	nc1YASM4VMXFOX6c15yPOZ3zL6ABdlHrZx4qcR+zyyo/qy7wn8BUqDqf5XE6TNJp7iASDECqbBhJq
	KkUDjUOIDvb5Wm2N9PBIIvq0ozfOYcURxuA3HjOz9+j/I9wpqW3U5bGG7Izwd65Khmdi0iIzVqwny
	jm5pzLG/YDilYjPqCv8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1RS8-00000001ytM-2ujS;
	Sat, 14 Mar 2026 16:03:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1RS7-00000001ytG-2Hnh
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 16:02:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78F6B60008;
	Sat, 14 Mar 2026 16:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 236E1C116C6;
	Sat, 14 Mar 2026 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773504178;
	bh=gW273cX5oHbg/QoABE2SB7PT0aTQ/h5U216t18qbRMs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QYASmWMmM5rPb6P6M/GW67xjWV0DT2QV6FnyrC4XUjVrQaRAM6mP1gsANpFO3gcHl
	 XzYCqtfvxi8oGwntcVW4pRyoh+nejoV8cnOZ3aCD/JYyWJDtMsgMtoVMvz2T49HX4x
	 7StCfls88j2SlaMD7GE6yzX1ACkZHXN7D2HXTYTlyHvDY7WwvGLqkZ7x7/IjyiHDtw
	 cXORGe1sfs+kcBbXhAnBJGoKxDZEZTwJTHrV/IVBh0w0ysCBml3lTIBPJ41jHmuYyc
	 aIaE6RynhHdB8cRc422lONZiGyS6rpbBjwsWrpTNKfmjrnNL/Goah+oRSCir4ByhIE
	 e0Nf50eLdE1Hg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117BC10706E2;
	Sat, 14 Mar 2026 16:02:58 +0000 (UTC)
From: Levi Zim via B4 Relay <devnull+rsworktech.outlook.com@kernel.org>
Date: Sun, 15 Mar 2026 00:02:48 +0800
Subject: [PATCH bpf v3] bpf: do not use kmalloc_nolock when
 !HAVE_CMPXCHG_DOUBLE
MIME-Version: 1.0
Message-Id: <20260315-bpf-kmalloc-nolock-v3-1-91c72bf91902@outlook.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNyQ6CMBAG4Fchc7amCxT15HsYDwWm0rAMabHRE
 N7dpjcvepnkn+WbDQJ6hwEuxQYeowuO5hTUoYC2N/MDmetSBsml5kqUrFksGyYzjtSymVIdmOa
 dOXHUQnUI6XDxaN0rozdI+3BPzd6Flfw7P4oij36ZUTDBZGkaq2xdmbO90nMdiYZjS1MGo/yPy
 IRUtUalsLRG19/Ivu8fv2qK1AABAAA=
X-Change-ID: 20260314-bpf-kmalloc-nolock-60da80e613de
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Amery Hung <ameryhung@gmail.com>, linux-riscv@lists.infradead.org, 
 stable@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, Levi Zim <rsworktech@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5177;
 i=rsworktech@outlook.com; s=ryzen; h=from:subject:message-id;
 bh=F3NzhvAzd0zCVDcRlr7RmrSHpJygKeFMqZIONIS/DVY=;
 b=owEBbQKS/ZANAwAKAW87mNQvxsnYAcsmYgBptYataz9Rjqgmj6vGqmsIM8a6ZekZLkTCdBL8E
 xjDsqOUPQWJAjMEAAEKAB0WIQQolnD5HDY18KF0JEVvO5jUL8bJ2AUCabWGrQAKCRBvO5jUL8bJ
 2F2AD/9oKgja014FkRBZt0+EeVAdwGQx2xV8nIGzJFegeQEj1nn2IEPSyYITgmeLJ+wp0LhaJ7M
 KZ2ZG7quAiDTUYPLSTk1+qNAR+JaDp15cA1/GHDrdFoLCEO0A4TYRP4eMrqQIOIZra2hF+7EX0C
 v6ndojsunyGRPgeDln9cs6pYfa1XUa8dHgD9bSivT1DluvOajJU1gXjbhTKEOeasYdzMt1IQfNw
 kQX7wq/P3JoUFMTJCL4I66odN1QlGfe2sS7xNg5GOu08NtxDrXY8QkbSLNGAqYA/t5lKwOjdjNg
 MfdFm4zzKcTm4Qe9STv6V9cQjVoG3kRqCbP35meqrOq690na+7HUW4RrAjozujCSLeQ8Zv2s32q
 o9m6p3nzUyP6wB2/sJkwk8eD7S3o4X9ODWpdSAr76mi+9o5AHTvTA2BdaHE4yDhjfSByRrZxjin
 riSi1Foj46ovVjKDCFwdEN0ocJFHCfUW1GjnXA2qjM2Sale7GV7fS/UNNnftktWBTyYA2Jw8hyK
 V30UKE2bZsSHx5wsDVKV/YphBApMDRFi+2OUkKhFIJovNl7pxU2DxjHiKa0T5r1u6xAVlpvEfA7
 5lHcoM60D8Hn0Xn4JcC9YioctxKS6UI/2FPAVvrham+ytnO0SIbDZbXaiqjWhkr/F7qR0LE3eGI
 k2lMPSDkv1fCCIA==
X-Developer-Key: i=rsworktech@outlook.com; a=openpgp;
 fpr=17AADD6726DDC58B8EE5881757670CCFA42CCF0A
X-Endpoint-Received: by B4 Relay for rsworktech@outlook.com/ryzen with
 auth_id=536
X-Original-From: Levi Zim <rsworktech@outlook.com>
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
Reply-To: rsworktech@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Levi Zim <rsworktech@outlook.com>

kmalloc_nolock always fails for architectures that lack cmpxchg16b.
For example, this causes bpf_task_storage_get with flag
BPF_LOCAL_STORAGE_GET_F_CREATE to fails on riscv64 6.19 kernel.

Fix it by enabling use_kmalloc_nolock only when HAVE_CMPXCHG_DOUBLE.
But leave the PREEMPT_RT case as is because it requires kmalloc_nolock
for correctness. Add a comment about this limitation that architecture's
lack of CMPXCHG_DOUBLE combined with PREEMPT_RT could make
bpf_local_storage_alloc always fail.

Fixes: f484f4a3e058 ("bpf: Replace bpf memory allocator with kmalloc_nolock() in local storage")
Cc: stable@vger.kernel.org
Signed-off-by: Levi Zim <rsworktech@outlook.com>
---
I find that bpf_task_storage_get with flag BPF_LOCAL_STORAGE_GET_F_CREATE
always fails for me on 6.19 kernel on riscv64 and bisected it.

In f484f4a3e058 ("bpf: Replace bpf memory allocator with kmalloc_nolock()
in local storage"), bpf memory allocator is replaced with kmalloc_nolock.
This approach is problematic for architectures that lack CMPXCHG_DOUBLE
because kmalloc_nolock always fails in this case:

In function kmalloc_nolock (kmalloc_nolock_noprof): 

	if (!(s->flags & __CMPXCHG_DOUBLE) && !kmem_cache_debug(s))
		/*
		 * kmalloc_nolock() is not supported on architectures that
		 * don't implement cmpxchg16b, but debug caches don't use
		 * per-cpu slab and per-cpu partial slabs. They rely on
		 * kmem_cache_node->list_lock, so kmalloc_nolock() can
		 * attempt to allocate from debug caches by
		 * spin_trylock_irqsave(&n->list_lock, ...)
		 */
		return NULL;

Fix it by enabling use_kmalloc_nolock only when HAVE_CMPXCHG_DOUBLE.
(But not for a PREEMPT_RT case as explained in the comment and commitmsg)

Note for stable: this only needs to be picked into v6.19 if the patch
makes it into 7.0.
---
Changes in v3:
- Use macro instead of const static variable to avoid triggering
  warnings.
- Wrap lines at 80 columns
- Link to v2: https://lore.kernel.org/r/20260314-bpf-kmalloc-nolock-v2-1-576e33e4fa67@outlook.com

Changes in v2:
- Drop the modification to the PREEMPT_RT case as it requires
  kmalloc_nolock for correctness.
- Add a comment to the PREEMPT_RT case about the limitation when
  not HAVE_CMPXCHG_DOUBLE but enables PREEMPT_RT.
- Link to v1: https://lore.kernel.org/r/20260314-bpf-kmalloc-nolock-v1-1-24abf3f75a9f@outlook.com
---
 include/linux/bpf_local_storage.h | 1 +
 kernel/bpf/bpf_cgrp_storage.c     | 3 ++-
 kernel/bpf/bpf_local_storage.c    | 4 ++++
 kernel/bpf/bpf_task_storage.c     | 3 ++-
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/bpf_local_storage.h b/include/linux/bpf_local_storage.h
index 8157e8da61d40..d8f2c5d63a80e 100644
--- a/include/linux/bpf_local_storage.h
+++ b/include/linux/bpf_local_storage.h
@@ -18,6 +18,7 @@
 #include <asm/rqspinlock.h>
 
 #define BPF_LOCAL_STORAGE_CACHE_SIZE	16
+#define KMALLOC_NOLOCK_SUPPORTED IS_ENABLED(CONFIG_HAVE_CMPXCHG_DOUBLE)
 
 struct bpf_local_storage_map_bucket {
 	struct hlist_head list;
diff --git a/kernel/bpf/bpf_cgrp_storage.c b/kernel/bpf/bpf_cgrp_storage.c
index c2a2ead1f466d..cd18193c44058 100644
--- a/kernel/bpf/bpf_cgrp_storage.c
+++ b/kernel/bpf/bpf_cgrp_storage.c
@@ -114,7 +114,8 @@ static int notsupp_get_next_key(struct bpf_map *map, void *key, void *next_key)
 
 static struct bpf_map *cgroup_storage_map_alloc(union bpf_attr *attr)
 {
-	return bpf_local_storage_map_alloc(attr, &cgroup_cache, true);
+	return bpf_local_storage_map_alloc(attr, &cgroup_cache,
+					   KMALLOC_NOLOCK_SUPPORTED);
 }
 
 static void cgroup_storage_map_free(struct bpf_map *map)
diff --git a/kernel/bpf/bpf_local_storage.c b/kernel/bpf/bpf_local_storage.c
index 9c96a4477f81a..a6c240da87668 100644
--- a/kernel/bpf/bpf_local_storage.c
+++ b/kernel/bpf/bpf_local_storage.c
@@ -893,6 +893,10 @@ bpf_local_storage_map_alloc(union bpf_attr *attr,
 	/* In PREEMPT_RT, kmalloc(GFP_ATOMIC) is still not safe in non
 	 * preemptible context. Thus, enforce all storages to use
 	 * kmalloc_nolock() when CONFIG_PREEMPT_RT is enabled.
+	 *
+	 * However, kmalloc_nolock would fail on architectures that do not
+	 * have CMPXCHG_DOUBLE. On such architectures with PREEMPT_RT,
+	 * bpf_local_storage_alloc would always fail.
 	 */
 	smap->use_kmalloc_nolock = IS_ENABLED(CONFIG_PREEMPT_RT) ? true : use_kmalloc_nolock;
 
diff --git a/kernel/bpf/bpf_task_storage.c b/kernel/bpf/bpf_task_storage.c
index 605506792b5b4..6e8597edea314 100644
--- a/kernel/bpf/bpf_task_storage.c
+++ b/kernel/bpf/bpf_task_storage.c
@@ -212,7 +212,8 @@ static int notsupp_get_next_key(struct bpf_map *map, void *key, void *next_key)
 
 static struct bpf_map *task_storage_map_alloc(union bpf_attr *attr)
 {
-	return bpf_local_storage_map_alloc(attr, &task_cache, true);
+	return bpf_local_storage_map_alloc(attr, &task_cache,
+					   KMALLOC_NOLOCK_SUPPORTED);
 }
 
 static void task_storage_map_free(struct bpf_map *map)

---
base-commit: e06e6b8001233241eb5b2e2791162f0585f50f4b
change-id: 20260314-bpf-kmalloc-nolock-60da80e613de

Best regards,
-- 
Levi Zim <rsworktech@outlook.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
