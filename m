Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07D7C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApMRos1JFF58MmdbWHnBpytmN5FnwdGxiQZbwdLeL1A=; b=shXZp4/Q61AEq6
	BhACoeJrG67y1a40EYyEZ+l1wwbqbjQsmmb1xv9hGMb8yTsG7c62JuHEbtZyi6PPc6Uiuzi7+A4Xk
	qDUZJo6iuWqaPnNqlShDcKutX1YpKNoWr5G0EXUY8GJboPlzNIonCo130H/kJgsqTaDHz40cN54ws
	+NTGRI6chXkk3L9WJ7UQLHXWlOkdTIDQdG0Ap26rzEdKy3R5ItJth9/fbjnpW5fDc58uuoT1jzytD
	w3QtUgeNFx6o6eNPJwlyW8KZhapE/BVTCa68pj4kJDNtU7/nv25ti3gtAaaDDe3x0qSSgjVYWOc4K
	Lmow8hB7LK8ZK6iqZzUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbEc-0062Cf-Hc; Mon, 30 May 2022 08:58:46 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbEW-00625n-0G
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 08:58:42 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LBTnM2CPRzjXGm;
	Mon, 30 May 2022 16:57:27 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
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
Subject: [PATCH bpf-next v3 6/6] selftests/bpf: Remove the casting about jited_ksyms and jited_linfo
Date: Mon, 30 May 2022 17:28:15 +0800
Message-ID: <20220530092815.1112406-7-pulehui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530092815.1112406-1-pulehui@huawei.com>
References: <20220530092815.1112406-1-pulehui@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.115]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_015840_242592_D516DCED 
X-CRM114-Status: UNSURE (   7.11  )
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

We have unified data extension operation of jited_ksyms and jited_linfo
into zero extension, so there's no need to cast u64 memory address to
long data type.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/testing/selftests/bpf/prog_tests/btf.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/btf.c b/tools/testing/selftests/bpf/prog_tests/btf.c
index e6612f2bd0cf..65bdc4aa0a63 100644
--- a/tools/testing/selftests/bpf/prog_tests/btf.c
+++ b/tools/testing/selftests/bpf/prog_tests/btf.c
@@ -6599,8 +6599,8 @@ static int test_get_linfo(const struct prog_info_raw_test *test,
 	}
 
 	if (CHECK(jited_linfo[0] != jited_ksyms[0],
-		  "jited_linfo[0]:%lx != jited_ksyms[0]:%lx",
-		  (long)(jited_linfo[0]), (long)(jited_ksyms[0]))) {
+		  "jited_linfo[0]:%llx != jited_ksyms[0]:%llx",
+		  jited_linfo[0], jited_ksyms[0])) {
 		err = -1;
 		goto done;
 	}
@@ -6618,16 +6618,16 @@ static int test_get_linfo(const struct prog_info_raw_test *test,
 		}
 
 		if (CHECK(jited_linfo[i] <= jited_linfo[i - 1],
-			  "jited_linfo[%u]:%lx <= jited_linfo[%u]:%lx",
-			  i, (long)jited_linfo[i],
-			  i - 1, (long)(jited_linfo[i - 1]))) {
+			  "jited_linfo[%u]:%llx <= jited_linfo[%u]:%llx",
+			  i, jited_linfo[i],
+			  i - 1, jited_linfo[i - 1])) {
 			err = -1;
 			goto done;
 		}
 
 		if (CHECK(jited_linfo[i] - cur_func_ksyms > cur_func_len,
-			  "jited_linfo[%u]:%lx - %lx > %u",
-			  i, (long)jited_linfo[i], (long)cur_func_ksyms,
+			  "jited_linfo[%u]:%llx - %llx > %u",
+			  i, jited_linfo[i], cur_func_ksyms,
 			  cur_func_len)) {
 			err = -1;
 			goto done;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
