Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B3EC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 08:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRPQkqirSfp4mQOjzB6C+GKdkkEemJZo5a92xLKXuVs=; b=LEfh008LC/zM3j
	9QCqWwqEUNRgOzKaBh878fEm2y+qeFFUHlmO232zWkXnRsXMxPiHDoceG1IbE95XGX+ottURuwuFl
	CI8+ZvJDNLyCYq2DEFUIvFP20CJ7TZcvNYPu99C6DDmOueGv1lH7STC4Z2eWvw21mqv1PMOWtE7Pi
	IgLRFijR+w4rx8WIwFOInga8XPgxL+jHwZ/5eCjSm0Q4JJCudTJhDy5NtThwJSf29jlg0WmMTkuON
	xSdsKNQHk6jcz6dJPYuUWF5XP75f47F//ZcLRo6v5kuzBT+uGRyr7sk8gzBI74lXG1CJol2wO3w/D
	M5jycVTbTVa5tnLqYkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbEl-0062Ih-KM; Mon, 30 May 2022 08:58:55 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbEX-00625f-CD
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 08:58:45 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LBTml35SXz1JBq9;
	Mon, 30 May 2022 16:56:55 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 30 May 2022 16:58:32 +0800
Received: from k04.huawei.com (10.67.174.115) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 30 May 2022 16:58:32 +0800
From: Pu Lehui <pulehui@huawei.com>
To: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Martin KaFai Lau
	<kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Pu Lehui
	<pulehui@huawei.com>
Subject: [PATCH bpf-next v3 4/6] libbpf: Unify memory address casting operation style
Date: Mon, 30 May 2022 17:28:13 +0800
Message-ID: <20220530092815.1112406-5-pulehui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530092815.1112406-1-pulehui@huawei.com>
References: <20220530092815.1112406-1-pulehui@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.115]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_015841_592000_3B7093E9 
X-CRM114-Status: UNSURE (   6.94  )
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

The members of bpf_prog_info, which are line_info, jited_line_info,
jited_ksyms and jited_func_lens, store u64 address pointed to the
corresponding memory regions. Memory addresses are conceptually
unsigned, (unsigned long) casting makes more sense, so let's make
a change for conceptual uniformity.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/lib/bpf/bpf_prog_linfo.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/lib/bpf/bpf_prog_linfo.c b/tools/lib/bpf/bpf_prog_linfo.c
index 5c503096ef43..7beb060d0671 100644
--- a/tools/lib/bpf/bpf_prog_linfo.c
+++ b/tools/lib/bpf/bpf_prog_linfo.c
@@ -127,7 +127,8 @@ struct bpf_prog_linfo *bpf_prog_linfo__new(const struct bpf_prog_info *info)
 	prog_linfo->raw_linfo = malloc(data_sz);
 	if (!prog_linfo->raw_linfo)
 		goto err_free;
-	memcpy(prog_linfo->raw_linfo, (void *)(long)info->line_info, data_sz);
+	memcpy(prog_linfo->raw_linfo, (void *)(unsigned long)info->line_info,
+	       data_sz);
 
 	nr_jited_func = info->nr_jited_ksyms;
 	if (!nr_jited_func ||
@@ -148,7 +149,7 @@ struct bpf_prog_linfo *bpf_prog_linfo__new(const struct bpf_prog_info *info)
 	if (!prog_linfo->raw_jited_linfo)
 		goto err_free;
 	memcpy(prog_linfo->raw_jited_linfo,
-	       (void *)(long)info->jited_line_info, data_sz);
+	       (void *)(unsigned long)info->jited_line_info, data_sz);
 
 	/* Number of jited_line_info per jited func */
 	prog_linfo->nr_jited_linfo_per_func = malloc(nr_jited_func *
@@ -166,8 +167,8 @@ struct bpf_prog_linfo *bpf_prog_linfo__new(const struct bpf_prog_info *info)
 		goto err_free;
 
 	if (dissect_jited_func(prog_linfo,
-			       (__u64 *)(long)info->jited_ksyms,
-			       (__u32 *)(long)info->jited_func_lens))
+			       (__u64 *)(unsigned long)info->jited_ksyms,
+			       (__u32 *)(unsigned long)info->jited_func_lens))
 		goto err_free;
 
 	return prog_linfo;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
