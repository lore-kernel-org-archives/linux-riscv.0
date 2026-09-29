Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265CBCA5FA7
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Row/HxDT9HVX77F8ussrg55iUKSsemQ7sjcvDjlyIg=; b=4/koQLlGm9r3EB
	D0nMjNMDEwDQ4izdNSzvuKoShv4h7qmFoqC8579HLNRncxlmvOt2mugZS+UVndaMYtCMhRvMcR9cB
	DEEtPzM0fnxI5wG1Op+QqFsy1k+wt46VMu3KSsiAJXlAIPBzdl2yTLKy9x9uCJnEw6G+FdbDP7B9J
	oY4zmqpili/zoT+z6OrrZ1xkj0lzqyWpWxwhP0EYfrh+0XEChxDfylGn5vuLXatH9YOtkcLGjpkwC
	58+TFa3OkkzXtIcWKidd8yh6e/nMeUaD5VRJetESl4xfBLTn11tx0Fx1XxBkDZ7UNTQmKDi3NYQ7Z
	2VdoeAQi5IoKDqkY/Vsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTJD-00000002nFC-3oo2;
	Tue, 29 Sep 2026 08:35:31 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTJ9-00000002nCJ-43D3
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:35:29 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hvBLf2vZgzYQv1K
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 16:34:50 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 560B140572
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 16:35:17 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgBXdShEeLtqhxloCA--.42471S4;
	Tue, 29 Sep 2026 16:35:17 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next 2/5] selftests/bpf: Set CONFIG_HZ_100 for riscv64
Date: Tue, 29 Sep 2026 08:39:21 +0000
Message-Id: <20260929083924.1851840-3-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929083924.1851840-1-pulehui@huaweicloud.com>
References: <20260929083924.1851840-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgBXdShEeLtqhxloCA--.42471S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1kuF4kGF47Zw17tr45trb_yoW8XF17pF
	4rJw1DKas5XF1fu39rCFWUWFWrKanrGrW7GF1ftr15A348KrZ7JFyIka1rtF9xua9rWr4S
	vasagF1a9F4DX37anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2
	WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkE
	bVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7
	AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wr
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	xeHqDUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_013528_338957_FAC29EC6 
X-CRM114-Status: UNSURE (   7.53  )
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

From: Pu Lehui <pulehui@huawei.com>

The setget_sockopt selftest fails on riscv64, specifically in the
TCP_BPF_DELACK_MAX and TCP_BPF_RTO_MIN sub-tests.

The test sets a socket option value in microseconds using
bpf_setsockopt() and immediately reads it back via bpf_getsockopt() to
verify that it matches. However, the kernel converts the value to
jiffies internally for storage, and converts it back to microseconds
upon retrieval. On riscv64, the default timer frequency is HZ=250 (4000
us per jiffy). When a value cannot be divided evenly (e.g. 30000 us),
quantization error occurs during these conversions:

  usecs_to_jiffies(30000) -> 8 jiffies
  jiffies_to_usecs(8)     -> 32000 us (!= 30000 us)

This mismatch triggers an assertion failure.

Let's set CONFIG_HZ_100=y in config.riscv64 to align with other archs
and fix this issue.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/testing/selftests/bpf/config.riscv64 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/config.riscv64 b/tools/testing/selftests/bpf/config.riscv64
index 655cb05a7689..de45a76fdbcd 100644
--- a/tools/testing/selftests/bpf/config.riscv64
+++ b/tools/testing/selftests/bpf/config.riscv64
@@ -29,6 +29,7 @@ CONFIG_FRAME_POINTER=y
 CONFIG_HARDLOCKUP_DETECTOR=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_HUGETLBFS=y
+CONFIG_HZ_100=y
 CONFIG_INET=y
 CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_IP_MULTICAST=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
