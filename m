Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0BDCD129C
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2024 02:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v3wk5b0/UkJiB2r2HRlNGSx2ZSDCuVnl0LokuDR8NEA=; b=bvAPtmA1DL3ucS
	v0zOlvSE9W+ILONRStTm+51FjoabDYdoUFex2DrZQWuGYU7Kbl283j+NUcS2QWspF9b2bv18y5pH1
	Dxp2x+NkPirU3EJB0VSKIwa53V6pUnARKxQT4Qrzpld0/by+MbNBCZ3T/NDZQuRFGGthncsHCtK7t
	5TtimvCYiscIU6SojXpxFSlRdd3/Ql8XfpaKXYhbu1qu29XXDEa3Z/yk9gvwRk8noqGhQWGDb92Ri
	VP6EHMZOG7KJrvHMSb3JWQSz0RUy7PSTHR8gkUw3yUBckVQ3hZh/Gx9G+B060nTjmUo6bHVl5nJwN
	J7yg/X3LkGpkcgYEq59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skDwb-00000008L2g-1XwG;
	Sat, 31 Aug 2024 02:34:29 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skDwS-00000008Kw0-2J8U
	for linux-riscv@lists.infradead.org;
	Sat, 31 Aug 2024 02:34:23 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WwfGZ0y9Cz4f3jkY
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 10:33:58 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 38C2D1A07B6
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 10:34:08 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgDXSYAagdJmoPLJDA--.24950S5;
	Sat, 31 Aug 2024 10:34:07 +0800 (CST)
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
Subject: [PATCH bpf-next v2 3/4] selftests/bpf: Enable test_bpf_syscall_macro:syscall_arg1 on s390 and arm64
Date: Sat, 31 Aug 2024 02:36:45 +0000
Message-Id: <20240831023646.1558629-4-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240831023646.1558629-1-pulehui@huaweicloud.com>
References: <20240831023646.1558629-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgDXSYAagdJmoPLJDA--.24950S5
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr13ZF4UWF15tF1xKryDKFg_yoW8Gr4Upr
	y8Jw1YyF1fWr42ya4xWr42gF4rJF4DXr45Jr4fWrW3uFsruryUtr1Iga1UJ3ZYkrZa9wsx
	u34Syr95Xay7uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
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
	14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU04x
	RDUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_193421_120617_51F0A9BC 
X-CRM114-Status: UNSURE (   7.41  )
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
 1 file changed, 4 deletions(-)

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
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
