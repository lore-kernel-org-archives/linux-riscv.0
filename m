Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF3BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 15:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdNblwOC5An02esH2MNZNsChx3nbFtZbnd5ca3R8uto=; b=ryuYd76MI6zS8j
	1/mY/sR8rvELkUFLmzOQP8pyodLr7x5RanNWAkQnv7O8203Md4qcNRVTx+ilOueIagE4DVnz17UzL
	TKYPqX0OjJ3kEDnh/qI+uNB6AyAQv7RWdrxX8VQggkZv8DqzvMACUlVTzkBMRaGVQyNoErHGQ7jxv
	NfdLnmZhZFjkVwAWIpKpkjZED09dXb+HMAqIOEZlXOF8UrAZ2lau6ZUGptZdjSNh8QkVS0dxgEQr4
	XuKnZBzwsj3HAOFBqPS/uGheC+a7vmRkrqlkboljq6UIDQxVrTM4wuthg1hNHJlPqJ8rMrabzJGrg
	l6LIeyLolbrPXuaAQSWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngpXm-004YnF-Ti; Tue, 19 Apr 2022 15:13:31 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngoli-004Eaa-W6
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 14:23:54 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KjQyf1Kt1zhXZm;
 Tue, 19 Apr 2022 22:23:38 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 19 Apr 2022 22:23:45 +0800
Received: from k04.huawei.com (10.67.174.115) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 19 Apr 2022 22:23:44 +0800
From: Pu Lehui <pulehui@huawei.com>
To: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <andrii@kernel.org>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <kafai@fb.com>, <songliubraving@fb.com>, <yhs@fb.com>,
 <john.fastabend@gmail.com>, <kpsingh@kernel.org>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <pulehui@huawei.com>
Subject: [PATCH v2 bpf-next 1/2] libbpf: Fix usdt_cookie being cast to 32 bits
Date: Tue, 19 Apr 2022 22:52:37 +0800
Message-ID: <20220419145238.482134-2-pulehui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220419145238.482134-1-pulehui@huawei.com>
References: <20220419145238.482134-1-pulehui@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.115]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_072351_533882_5B02EB3B 
X-CRM114-Status: GOOD (  11.14  )
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

The usdt_cookie is defined as __u64, which should not be
used as a long type because it will be cast to 32 bits
in 32-bit platforms.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/lib/bpf/libbpf.c          | 2 +-
 tools/lib/bpf/libbpf_internal.h | 2 +-
 tools/lib/bpf/usdt.c            | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index bf4f7ac54..33d21ed7c 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -10982,7 +10982,7 @@ struct bpf_link *bpf_program__attach_usdt(const struct bpf_program *prog,
 	char resolved_path[512];
 	struct bpf_object *obj = prog->obj;
 	struct bpf_link *link;
-	long usdt_cookie;
+	__u64 usdt_cookie;
 	int err;
 
 	if (!OPTS_VALID(opts, bpf_uprobe_opts))
diff --git a/tools/lib/bpf/libbpf_internal.h b/tools/lib/bpf/libbpf_internal.h
index 080272421..054cd8e93 100644
--- a/tools/lib/bpf/libbpf_internal.h
+++ b/tools/lib/bpf/libbpf_internal.h
@@ -571,6 +571,6 @@ struct bpf_link * usdt_manager_attach_usdt(struct usdt_manager *man,
 					   const struct bpf_program *prog,
 					   pid_t pid, const char *path,
 					   const char *usdt_provider, const char *usdt_name,
-					   long usdt_cookie);
+					   __u64 usdt_cookie);
 
 #endif /* __LIBBPF_LIBBPF_INTERNAL_H */
diff --git a/tools/lib/bpf/usdt.c b/tools/lib/bpf/usdt.c
index 934c25301..8e77a7260 100644
--- a/tools/lib/bpf/usdt.c
+++ b/tools/lib/bpf/usdt.c
@@ -557,10 +557,10 @@ static int parse_usdt_note(Elf *elf, const char *path, long base_addr,
 			   GElf_Nhdr *nhdr, const char *data, size_t name_off, size_t desc_off,
 			   struct usdt_note *usdt_note);
 
-static int parse_usdt_spec(struct usdt_spec *spec, const struct usdt_note *note, long usdt_cookie);
+static int parse_usdt_spec(struct usdt_spec *spec, const struct usdt_note *note, __u64 usdt_cookie);
 
 static int collect_usdt_targets(struct usdt_manager *man, Elf *elf, const char *path, pid_t pid,
-				const char *usdt_provider, const char *usdt_name, long usdt_cookie,
+				const char *usdt_provider, const char *usdt_name, __u64 usdt_cookie,
 				struct usdt_target **out_targets, size_t *out_target_cnt)
 {
 	size_t off, name_off, desc_off, seg_cnt = 0, lib_seg_cnt = 0, target_cnt = 0;
@@ -939,7 +939,7 @@ static int allocate_spec_id(struct usdt_manager *man, struct hashmap *specs_hash
 struct bpf_link *usdt_manager_attach_usdt(struct usdt_manager *man, const struct bpf_program *prog,
 					  pid_t pid, const char *path,
 					  const char *usdt_provider, const char *usdt_name,
-					  long usdt_cookie)
+					  __u64 usdt_cookie)
 {
 	int i, fd, err, spec_map_fd, ip_map_fd;
 	LIBBPF_OPTS(bpf_uprobe_opts, opts);
@@ -1141,7 +1141,7 @@ static int parse_usdt_note(Elf *elf, const char *path, long base_addr,
 
 static int parse_usdt_arg(const char *arg_str, int arg_num, struct usdt_arg_spec *arg);
 
-static int parse_usdt_spec(struct usdt_spec *spec, const struct usdt_note *note, long usdt_cookie)
+static int parse_usdt_spec(struct usdt_spec *spec, const struct usdt_note *note, __u64 usdt_cookie)
 {
 	const char *s;
 	int len;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
