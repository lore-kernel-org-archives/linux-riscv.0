Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B859CD484F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 14:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qRZCcGA4YUknnX0LPaVeWM3MopGqHG307KRAluVuHz4=; b=H7UfEdibbEtp44
	ZUjvakSU9+lgy+MreesJoQz97pAfJFXo2j4TadpWNIpD5z2FLtHI40itJB/CJ9fLTeb+rHJ7b/NhN
	1sDtCu8oljknBFHYqY0wBrjhZdSpVuX2ay4gmkVDiUFTPR7jVdpe/K/hWuaZSG4pzPmW/L11qjDbW
	esMekZTXtdXMjeJKYyeVWLz3Sz57s3LY8cafF5lTfu2ytlLWT0NH5iQc2RJ4qSLC0L4AB9HcyNG23
	VZ09YzlqRro2yx21NxeKdIaVAusUDdg/cH1BnE4U6lUQkTq9lTM4uEnViq+OW59zSQTj4U2IZxkuF
	iyIKPkXC0mDXfqksXjdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqp9-00000004jdX-46TU;
	Wed, 04 Sep 2024 14:17:31 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqp0-00000004jUr-0k2E
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 14:17:26 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4WzPgq45xWz4f3jdV
	for <linux-riscv@lists.infradead.org>; Wed,  4 Sep 2024 22:16:55 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 967011A16CD
	for <linux-riscv@lists.infradead.org>; Wed,  4 Sep 2024 22:17:10 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP3 (Coremail) with SMTP id _Ch0CgBnvIjfa9hmXCB4AQ--.21574S4;
	Wed, 04 Sep 2024 22:17:10 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next v2 02/10] selftests/bpf: Rename fallback in bpf_dctcp to avoid naming conflict
Date: Wed,  4 Sep 2024 14:19:43 +0000
Message-Id: <20240904141951.1139090-3-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904141951.1139090-1-pulehui@huaweicloud.com>
References: <20240904141951.1139090-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: _Ch0CgBnvIjfa9hmXCB4AQ--.21574S4
X-Coremail-Antispam: 1UD129KBjvJXoWxCFW8GF1fAF15Zr48ZrW5ZFb_yoW5CF4kpa
	4kZ3yYyF1xJFW3Jw17GrWqgFWFkws5XrWYkan7Wr15Ar17XryxWrs7KF4Yga9xWrZ5uwnx
	Aas2g3s3Ar1kZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0I3
	85UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_071722_862499_313B05F8 
X-CRM114-Status: GOOD (  12.51  )
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

From: Pu Lehui <pulehui@huawei.com>

Recently, when compiling bpf selftests on RV64, the following
compilation failure occurred:

progs/bpf_dctcp.c:29:21: error: redefinition of 'fallback' as different kind of symbol
   29 | volatile const char fallback[TCP_CA_NAME_MAX];
      |                     ^
/workspace/tools/testing/selftests/bpf/tools/include/vmlinux.h:86812:15: note: previous definition is here
 86812 | typedef u32 (*fallback)(u32, const unsigned char *, size_t);

The reason is that the `fallback` symbol has been defined in
arch/riscv/lib/crc32.c, which will cause symbol conflicts when vmlinux.h
is included in bpf_dctcp. Let we rename `fallback` string to
`fallback_cc` in bpf_dctcp to fix this compilation failure.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/testing/selftests/bpf/prog_tests/bpf_tcp_ca.c | 2 +-
 tools/testing/selftests/bpf/progs/bpf_dctcp.c       | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_tcp_ca.c b/tools/testing/selftests/bpf/prog_tests/bpf_tcp_ca.c
index 1d494b4453f4..409a06975823 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_tcp_ca.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_tcp_ca.c
@@ -285,7 +285,7 @@ static void test_dctcp_fallback(void)
 	dctcp_skel = bpf_dctcp__open();
 	if (!ASSERT_OK_PTR(dctcp_skel, "dctcp_skel"))
 		return;
-	strcpy(dctcp_skel->rodata->fallback, "cubic");
+	strcpy(dctcp_skel->rodata->fallback_cc, "cubic");
 	if (!ASSERT_OK(bpf_dctcp__load(dctcp_skel), "bpf_dctcp__load"))
 		goto done;
 
diff --git a/tools/testing/selftests/bpf/progs/bpf_dctcp.c b/tools/testing/selftests/bpf/progs/bpf_dctcp.c
index 02f552e7fd4d..7cd73e75f52a 100644
--- a/tools/testing/selftests/bpf/progs/bpf_dctcp.c
+++ b/tools/testing/selftests/bpf/progs/bpf_dctcp.c
@@ -26,7 +26,7 @@ static bool before(__u32 seq1, __u32 seq2)
 
 char _license[] SEC("license") = "GPL";
 
-volatile const char fallback[TCP_CA_NAME_MAX];
+volatile const char fallback_cc[TCP_CA_NAME_MAX];
 const char bpf_dctcp[] = "bpf_dctcp";
 const char tcp_cdg[] = "cdg";
 char cc_res[TCP_CA_NAME_MAX];
@@ -71,10 +71,10 @@ void BPF_PROG(bpf_dctcp_init, struct sock *sk)
 	struct bpf_dctcp *ca = inet_csk_ca(sk);
 	int *stg;
 
-	if (!(tp->ecn_flags & TCP_ECN_OK) && fallback[0]) {
+	if (!(tp->ecn_flags & TCP_ECN_OK) && fallback_cc[0]) {
 		/* Switch to fallback */
 		if (bpf_setsockopt(sk, SOL_TCP, TCP_CONGESTION,
-				   (void *)fallback, sizeof(fallback)) == -EBUSY)
+				   (void *)fallback_cc, sizeof(fallback_cc)) == -EBUSY)
 			ebusy_cnt++;
 
 		/* Switch back to myself and the recurred bpf_dctcp_init()
@@ -87,7 +87,7 @@ void BPF_PROG(bpf_dctcp_init, struct sock *sk)
 
 		/* Switch back to fallback */
 		if (bpf_setsockopt(sk, SOL_TCP, TCP_CONGESTION,
-				   (void *)fallback, sizeof(fallback)) == -EBUSY)
+				   (void *)fallback_cc, sizeof(fallback_cc)) == -EBUSY)
 			ebusy_cnt++;
 
 		/* Expecting -ENOTSUPP for tcp_cdg_res */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
