Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3638ECD1293
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2024 04:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vSclyivPdJ89pCQFMwWoKO/euysyI3sm3PbmJlC+ppM=; b=IPotyuDbJudJtK
	wZ89bHFHZPer00pEnVFfbwdIhNHgR5WxD46/PCtWl+nE2kjTDlLrnAged08+idyFTleQQVgpBs3U6
	QkD2BTJPUVZ13w88cZqFmb2e1MkYCmznwfvuhROT8JK7Dozf8izx3skjIrs+5w0hWfE2Wbqa0C2zH
	Rmi9aZqkzKPhWrykCaXucfyTo5O7jiWBdhP28wGRVk7IOoFtyn2FWAbuA+EhVOQxrghYvaPINcwou
	o8ZEhn7JEn3p1NjLsIuehPCncu0fOlK+OAHndt4vEG9PKUpj6pNIwL8hZAr/tN1eOvEwBLPyuTtp2
	9gFesRsXExYH6ivmef6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skFXu-00000008UpW-32TT;
	Sat, 31 Aug 2024 04:17:06 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skFXm-00000008UmK-3qyc
	for linux-riscv@lists.infradead.org;
	Sat, 31 Aug 2024 04:17:02 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WwhY12TvBz4f3lDR
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 12:16:37 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id F247E1A07BA
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 12:16:52 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with SMTP id Syh0CgBnT74ymdJmoSHHDA--.65422S5;
	Sat, 31 Aug 2024 12:16:52 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Andrii Nakryiko <andrii@kernel.org>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next v3 3/4] selftests/bpf: Enable test_bpf_syscall_macro:syscall_arg1 on s390 and arm64
Date: Sat, 31 Aug 2024 04:19:33 +0000
Message-Id: <20240831041934.1629216-4-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240831041934.1629216-1-pulehui@huaweicloud.com>
References: <20240831041934.1629216-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgBnT74ymdJmoSHHDA--.65422S5
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr13ZF4UWF1xKF1rtF18Xwb_yoW8tr1fp3
	4kJa4jyF1fWr47tryxWr47WF1rJrsrXrWrJF1fJrW3uF4DXry8tr1IgFWUJ3ZI9rZY9ws3
	Zwnakr95Xa1xZFUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jx
	CztUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_211700_066222_0298BB48 
X-CRM114-Status: UNSURE (   7.85  )
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

Considering that CO-RE direct read access to the first system call
argument is already available on s390 and arm64, let's enable
test_bpf_syscall_macro:syscall_arg1 on these architectures.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 .../testing/selftests/bpf/prog_tests/test_bpf_syscall_macro.c | 4 ----
 tools/testing/selftests/bpf/progs/bpf_syscall_macro.c         | 2 --
 2 files changed, 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/test_bpf_syscall_macro.c b/tools/testing/selftests/bpf/prog_tests/test_bpf_syscall_macro.c
index 2900c5e9a016..1750c29b94f8 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_bpf_syscall_macro.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_bpf_syscall_macro.c
@@ -38,11 +38,7 @@ void test_bpf_syscall_macro(void)
 	/* check whether args of syscall are copied correctly */
 	prctl(exp_arg1, exp_arg2, exp_arg3, exp_arg4, exp_arg5);
 
-#if defined(__aarch64__) || defined(__s390__)
-	ASSERT_NEQ(skel->bss->arg1, exp_arg1, "syscall_arg1");
-#else
 	ASSERT_EQ(skel->bss->arg1, exp_arg1, "syscall_arg1");
-#endif
 	ASSERT_EQ(skel->bss->arg2, exp_arg2, "syscall_arg2");
 	ASSERT_EQ(skel->bss->arg3, exp_arg3, "syscall_arg3");
 	/* it cannot copy arg4 when uses PT_REGS_PARM4 on x86_64 */
diff --git a/tools/testing/selftests/bpf/progs/bpf_syscall_macro.c b/tools/testing/selftests/bpf/progs/bpf_syscall_macro.c
index 1a476d8ed354..9e7d9674ce2a 100644
--- a/tools/testing/selftests/bpf/progs/bpf_syscall_macro.c
+++ b/tools/testing/selftests/bpf/progs/bpf_syscall_macro.c
@@ -43,9 +43,7 @@ int BPF_KPROBE(handle_sys_prctl)
 
 	/* test for PT_REGS_PARM */
 
-#if !defined(bpf_target_arm64) && !defined(bpf_target_s390)
 	bpf_probe_read_kernel(&tmp, sizeof(tmp), &PT_REGS_PARM1_SYSCALL(real_regs));
-#endif
 	arg1 = tmp;
 	bpf_probe_read_kernel(&arg2, sizeof(arg2), &PT_REGS_PARM2_SYSCALL(real_regs));
 	bpf_probe_read_kernel(&arg3, sizeof(arg3), &PT_REGS_PARM3_SYSCALL(real_regs));
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
