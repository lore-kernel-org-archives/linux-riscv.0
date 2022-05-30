Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E5FC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n1SsuOUU87xkZcdyv5LRTLDdmftjDhM5X48zkIXC3FE=; b=tzt0ByFrRAEkNk
	8DM8ABHeIbbHpg2oAGTRugVbioKbV5V6ho8XWcf161qCq/qfIOwg4NHgFDRt1ATbQ/z+ag4ogw0VO
	qj/VaqqteGTMGt+HG1Ic+KZUagK0rWNmI68/HojT72PoaTpRz0GdA1TPpU3AdVQGylVEUCXZYLK2Y
	sjGrQltxoYlyJPqEmZtR4J7Sw/h6faJTU9G3KwRvYoBqBhyxutXZTIQCiNMXnHtSfoZwCAiJeADsU
	oGmRQ8PQMzFOXrCGeeRYrHLXMWvAibShiwmUDth3KP3edvMaMKRAkMq7KCUo20mfNYxJzk3lbJTK9
	w5UmwBVhp3YR9q9tnbMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbEa-0062BA-7G; Mon, 30 May 2022 08:58:44 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbEW-00625N-0u
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 08:58:42 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LBTpQ1zKHzDqZ2;
	Mon, 30 May 2022 16:58:22 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 30 May 2022 16:58:31 +0800
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
Subject: [PATCH bpf-next v3 0/6] Support riscv jit to provide
Date: Mon, 30 May 2022 17:28:09 +0800
Message-ID: <20220530092815.1112406-1-pulehui@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.115]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_015840_265996_46477F46 
X-CRM114-Status: UNSURE (   7.37  )
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

patch 1 fix an issue that could not print bpf line info due
to data inconsistency in 32-bit environment.

patch 2 add support for riscv jit to provide bpf_line_info.
"test_progs -a btf" and "test_bpf.ko" all test pass, as well
as "test_verifier" and "test_progs" with no new failure ceses.

patch 3-6 make some trival cleanup.

v3:
- split kernel changes, libbpf changes, and selftests/bpf changes
into separate patches. (Andrii)
- shorten the name of jited_linfo_addr to avoid line break. (John)
- rename prologue_offset to body_len to make it more sense. (Luke)

v2: https://lore.kernel.org/bpf/20220429014240.3434866-1-pulehui@huawei.com
- Remove some trivial code

v1: https://lore.kernel.org/bpf/20220426140924.3308472-1-pulehui@huawei.com

Pu Lehui (6):
  bpf: Unify data extension operation of jited_ksyms and jited_linfo
  riscv, bpf: Support riscv jit to provide bpf_line_info
  bpf: Correct the comment about insn_to_jit_off
  libbpf: Unify memory address casting operation style
  selftests/bpf: Unify memory address casting operation style
  selftests/bpf: Remove the casting about jited_ksyms and jited_linfo

 arch/riscv/net/bpf_jit.h                     |  1 +
 arch/riscv/net/bpf_jit_core.c                |  8 +++++++-
 kernel/bpf/core.c                            |  2 +-
 kernel/bpf/syscall.c                         |  5 +++--
 tools/lib/bpf/bpf_prog_linfo.c               |  9 +++++----
 tools/testing/selftests/bpf/prog_tests/btf.c | 18 +++++++++---------
 6 files changed, 26 insertions(+), 17 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
