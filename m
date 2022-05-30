Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0020DC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 08:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nXr4Pt1lBCjVc+/74AmNQmlU6bir7FUzXEYAT4mDrhQ=; b=rqOVJ5yGNnl5vB
	ipU97sRh5lAaUkicaVTZhgiIWnfz3RW4mm0mA3IonznXc9w4oIwggpIx/HzHId7Ch0Hi6vDe5r5qU
	durdrumxBdsFHhK5reVm62xGXuqF/pc33dIW21YKC+qPPNOIUVY0huWXcauZmJpkDOw2IDB0fK/vs
	eY7zrCgBDOkc2PoxxwLmmIJXjeMQYq/NhOw2bkg57Op3/1pfrcznRcbfmHm5NHANvvtn9dnJBAGQB
	i9XN6I6C0Se/T3132Ay3LIfjyGN7KPFKyXQX9K11Q5Qn8kVDWXAPu0KWrBp5VmCpLoYSXgBpUFB0m
	E56cv26HOh6X46oBEQAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbEf-0062Ex-KU; Mon, 30 May 2022 08:58:49 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbEW-00625M-1t
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 08:58:43 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LBTl3331kzQkHK;
	Mon, 30 May 2022 16:55:27 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 30 May 2022 16:58:32 +0800
Received: from k04.huawei.com (10.67.174.115) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 30 May 2022 16:58:31 +0800
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
Subject: [PATCH bpf-next v3 3/6] bpf: Correct the comment about insn_to_jit_off
Date: Mon, 30 May 2022 17:28:12 +0800
Message-ID: <20220530092815.1112406-4-pulehui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530092815.1112406-1-pulehui@huawei.com>
References: <20220530092815.1112406-1-pulehui@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.115]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_015840_295614_2DF6FFE3 
X-CRM114-Status: UNSURE (   9.85  )
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

The insn_to_jit_off passed to bpf_prog_fill_jited_linfo should be
the first byte of the next instruction, or the byte off to the end
of the current instruction.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 kernel/bpf/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 13e9dbeeedf3..197fad955c46 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -176,7 +176,7 @@ void bpf_prog_jit_attempt_done(struct bpf_prog *prog)
  * here is relative to the prog itself instead of the main prog.
  * This array has one entry for each xlated bpf insn.
  *
- * jited_off is the byte off to the last byte of the jited insn.
+ * jited_off is the byte off to the end of the jited insn.
  *
  * Hence, with
  * insn_start:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
