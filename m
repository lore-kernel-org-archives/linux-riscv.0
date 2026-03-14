Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F9C10706CE
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 10:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SWacFNZLR9uJueIzC8Zag4zGukx9bTk0hXIFGeSpZ6E=; b=tdlehF49do6WtV
	udaGJyhu4Nifv3o8BsohoitrVj2Mtz6Uf2yuDgc4q+FICJIRqsLivgVd/ccof/jB8pLfl38l9Zb2o
	N/W0s7Jz3hkd+Cdq3QI0/84evJt11QREiN5QcvdHRmLWIztJO4NU1K3JKkq3FvLEXQG+hhaNj5AGs
	FlLN3S8MYYdyyZOw/KE376vpWPUIS8zWkNn4CXZ0V+2DNYC4orn7xO4tT1a7ASXMmMst4qHrei31P
	ESonpX2qxxwIRW2JKXgY52DkiRt+UizlrwXtdaWQd96/StRPLlO/majck6AZBUnS9T20nx2ZGcg5B
	wtjd/+ropNGy0bFEZ0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MMF-00000001kbs-0e2g;
	Sat, 14 Mar 2026 10:36:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1MMD-00000001kbk-0Xed
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 10:36:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 241F660008;
	Sat, 14 Mar 2026 10:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCE80C116C6;
	Sat, 14 Mar 2026 10:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773484591;
	bh=8ETulfXTKfn6xXZVUkPqEIhROGr0XO3o3r6Ttt19XQk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=vHk8E9JBoOnLB/4CsXojWjwa/EhIcCulnxGLn+x1tEK3hdjU7WX3oA6prrCCKaIbo
	 AAJwQLXTLPj+YToYB2jeNlmiTjKQ4xL6oQ58jEpIrGOsjB7wwVPXRQEOQxkNYbQCsq
	 sNWmE2XbysaEY5YhblpLyptnB7lhZbcd2P2gS4FvcJSOJ2rAmW2pMGIDc49Zr2MNkt
	 BooD1btWz1CoH/1mjANOtSlhrjd7hhLxZKYAN156b975cAFcS/0OSOkyEu8FEiNYsH
	 Sf0Q6KwxQQmAt7n20H/5kK/2klKweOuIH/C0spgfn54iV18MXy0dqH8d1Kz1Oop7uz
	 NVwr4Qcpct7QQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12E010706CE;
	Sat, 14 Mar 2026 10:36:31 +0000 (UTC)
From: Levi Zim via B4 Relay <devnull+rsworktech.outlook.com@kernel.org>
Date: Sat, 14 Mar 2026 18:36:19 +0800
Subject: [PATCH bpf] bpf: do not use kmalloc_nolock when
 !HAVE_CMPXCHG_DOUBLE
MIME-Version: 1.0
Message-Id: <20260314-bpf-kmalloc-nolock-v1-1-24abf3f75a9f@outlook.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MUQqAIBAFrxL73YJWSHSV6MNyq8XSUIhAuntLP
 wMD816BTIkpw1AVSHRz5hhEdF3BstuwEbITh0Y1RrW6w/la0Z/2OOKCIQo9GuVsr8jo1hHI8Eq
 08vOfjiA9TO/7AU1VTm9pAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4230;
 i=rsworktech@outlook.com; s=ryzen; h=from:subject:message-id;
 bh=QOQQvNeL8PrIqPi0m3JHglV7ieN/9+UfvisySvT/v4A=;
 b=owEBbQKS/ZANAwAKAW87mNQvxsnYAcsmYgBptTooRbmkLsBvfVY7zCs8SZI8nDOpAcm9uBuzB
 nCMVjhWUTiJAjMEAAEKAB0WIQQolnD5HDY18KF0JEVvO5jUL8bJ2AUCabU6KAAKCRBvO5jUL8bJ
 2OeCEADR8P2Uxds/iCtElbGKkbcKkohS0ENKy1l3pKUinigemojfX5EVTSbjU/jcGoQ6t7TeHNi
 yqDF0iWuanovTdO0u+0RgRQWeubUh2DcU9zoZFIRLAEa74AfnUWizOF9x5jakwt7DN1/tXGJx/D
 z5s74yT1frkH4nzW+ScRdTeNz2i5HM//MIFmQ0uZCOqSweN5MjpWO6kvN9gdqP6u6+2iiZWkIk0
 801KLi8G7GlxX0yTldIj+LUzknAdTvpT/bsPOrD+lGtvLAwcU0Zz6RitWxCpKHP1FAi1qd3OWhA
 WioCxp4COL7nt4X0TZuRWpinmpn1noa226U5cfrFMUNGKPDwySfWYyvJn8zOZRKVg+xnrtD29pA
 QuFmje0O3MobS6IMKwRLTlBDkcGWpV8R26y5FiaPpZcGqmZWa2NF1BMXtiXiEjl17fdAEMqW2dT
 pXcrNjXiaIi/lPOOZk+TmwasML6EyNX0F7XbgcKuq0zUX0omVVwpurhpoKh/BKTMETJOFkEuJkK
 6R+fyFjRkgezi8zeO4P0Nw4+9ck5p7P37UdhoRsQiF+oUZ6jWo4p/v0YUmfLPXmnM49Hm2aBUMH
 La4koSyh3joxkpiGyhEw3sD41kditehoALriZ/Z8qW84QCSMF5W+vX0Dd+PowVO4Jgr06iiA0xF
 DhNLuSZrftM31Fg==
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

Fix it by enabling use_kmalloc_nolock only when HAVE_CMPXCHG_DOUBLE

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

Note for stable: this only needs to be picked into v6.19 if the patch
makes it into 7.0.
---
 include/linux/bpf_local_storage.h | 2 ++
 kernel/bpf/bpf_cgrp_storage.c     | 2 +-
 kernel/bpf/bpf_local_storage.c    | 3 ++-
 kernel/bpf/bpf_task_storage.c     | 2 +-
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/bpf_local_storage.h b/include/linux/bpf_local_storage.h
index 8157e8da61d40..a7ae5dde15bcb 100644
--- a/include/linux/bpf_local_storage.h
+++ b/include/linux/bpf_local_storage.h
@@ -19,6 +19,8 @@
 
 #define BPF_LOCAL_STORAGE_CACHE_SIZE	16
 
+static const bool KMALLOC_NOLOCK_SUPPORTED = IS_ENABLED(CONFIG_HAVE_CMPXCHG_DOUBLE);
+
 struct bpf_local_storage_map_bucket {
 	struct hlist_head list;
 	rqspinlock_t lock;
diff --git a/kernel/bpf/bpf_cgrp_storage.c b/kernel/bpf/bpf_cgrp_storage.c
index c2a2ead1f466d..09c557e426968 100644
--- a/kernel/bpf/bpf_cgrp_storage.c
+++ b/kernel/bpf/bpf_cgrp_storage.c
@@ -114,7 +114,7 @@ static int notsupp_get_next_key(struct bpf_map *map, void *key, void *next_key)
 
 static struct bpf_map *cgroup_storage_map_alloc(union bpf_attr *attr)
 {
-	return bpf_local_storage_map_alloc(attr, &cgroup_cache, true);
+	return bpf_local_storage_map_alloc(attr, &cgroup_cache, KMALLOC_NOLOCK_SUPPORTED);
 }
 
 static void cgroup_storage_map_free(struct bpf_map *map)
diff --git a/kernel/bpf/bpf_local_storage.c b/kernel/bpf/bpf_local_storage.c
index 9c96a4477f81a..8e4b0fe6d12af 100644
--- a/kernel/bpf/bpf_local_storage.c
+++ b/kernel/bpf/bpf_local_storage.c
@@ -894,7 +894,8 @@ bpf_local_storage_map_alloc(union bpf_attr *attr,
 	 * preemptible context. Thus, enforce all storages to use
 	 * kmalloc_nolock() when CONFIG_PREEMPT_RT is enabled.
 	 */
-	smap->use_kmalloc_nolock = IS_ENABLED(CONFIG_PREEMPT_RT) ? true : use_kmalloc_nolock;
+	smap->use_kmalloc_nolock = IS_ENABLED(CONFIG_PREEMPT_RT) &&
+		KMALLOC_NOLOCK_SUPPORTED ? true : use_kmalloc_nolock;
 
 	smap->cache_idx = bpf_local_storage_cache_idx_get(cache);
 	return &smap->map;
diff --git a/kernel/bpf/bpf_task_storage.c b/kernel/bpf/bpf_task_storage.c
index 605506792b5b4..9f74fd1ef7f46 100644
--- a/kernel/bpf/bpf_task_storage.c
+++ b/kernel/bpf/bpf_task_storage.c
@@ -212,7 +212,7 @@ static int notsupp_get_next_key(struct bpf_map *map, void *key, void *next_key)
 
 static struct bpf_map *task_storage_map_alloc(union bpf_attr *attr)
 {
-	return bpf_local_storage_map_alloc(attr, &task_cache, true);
+	return bpf_local_storage_map_alloc(attr, &task_cache, KMALLOC_NOLOCK_SUPPORTED);
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
