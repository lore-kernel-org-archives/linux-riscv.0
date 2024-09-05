Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366D2CD4F5E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 08:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qRZCcGA4YUknnX0LPaVeWM3MopGqHG307KRAluVuHz4=; b=NEQQYBZk0Rah2P
	MRD3Tez/YM05NmMljPHFKMOxIB0TFwJlvXkjifMWrsix8oIUHrr+N2RIFoL/MUjseBxRwKNrZV5qU
	Kxq4hCQzAWeoeFMh4Oek/w2hmAuUXCACX4Eg3mh6vfcoCiYWa9w+ePTBjKKK83r/XcvzyY6Dya46w
	DSaG88Jcn8AQPRyeEA+vz5Ny6VWAHPr0IToIFLRqZ961OQN6MKmUvoDqiSJq2Y2k6NqVr/g8ge83m
	C5BpHjd/QIKyaJEjfX4UP3x5dFUySHwtgoOWZcC2SMdZOOmhjb/KaRC2oBMVWYBdO1qfO8Y0tvu2d
	b8uBtH45TDA7bSX9scAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7dB-00000007Vo3-1aYl;
	Thu, 05 Sep 2024 08:14:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7aj-00000007VFB-1jun
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Sep 2024 08:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mxNquD0xa7j9ta6MnaE0n2i8pS6y3sXEBOC5jYCOLSo=; b=bE8m9gBHfB9K9uYOCMZO+wDyZD
	mcZLwjRo1BglV/Nck7pgNvW8kFhtk1M8BJ444SecrIxmIjGPi2V9UO8g2r3UGKJIAjgkje+/WndAC
	rLO2c1lFqRKAfGqzOXEm+vAJsBu30Hp+X8FE9YV+JxYK2VMB3esibb1vcbHqLeMlJMYCN/JyQBX8k
	gOB97vlv5adnOAB10E29zYeGRNhmfRZ4aP1dXQA1OheDHQPYxdINHjY3DFSVI8DejW0qovwSSKSAh
	Xz3i3w92qYOvugsQLQur/q66yXVqEimM7Stxlyh5c+Vf9y+CZ5GLmfnXwOh3JwiyjmfkErBklnGeZ
	+q4dSJZw==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sm7ac-00000000QLW-0e73
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 08:11:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WzsWB4Gxxz4f3l1v
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 16:11:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 7F4181A15D7
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 16:11:18 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with SMTP id cCh0CgD3Ii+gZ9lmMQ7AAQ--.26932S4;
	Thu, 05 Sep 2024 16:11:18 +0800 (CST)
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
Subject: [PATCH bpf-next v3 02/10] selftests/bpf: Rename fallback in bpf_dctcp to avoid naming conflict
Date: Thu,  5 Sep 2024 08:13:53 +0000
Message-Id: <20240905081401.1894789-3-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240905081401.1894789-1-pulehui@huaweicloud.com>
References: <20240905081401.1894789-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgD3Ii+gZ9lmMQ7AAQ--.26932S4
X-Coremail-Antispam: 1UD129KBjvJXoWxCFW8GF1fAF15Zr48ZrW5ZFb_yoW5CF4kpa
	4kZ3yYyF1xJFW3Jw17GrWqgFWFkws5XrWYkan7Wr15Ar17XryxWrs7KF4Yga9xWrZ5uwnx
	Aas2g3s3Ar1kZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jI
	sjbUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_091139_394894_1FFD4FDA 
X-CRM114-Status: GOOD (  12.05  )
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
