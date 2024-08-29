Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A76C83F16
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 13:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkbhnEnZXgYim3f192aRvEoG0sIMi0OhbvOLjBHAFBE=; b=e4OugCmVjoOfCa
	FQapkPg+k8+wKZ0qh9prUgZS4vdQNlWNEGj9svBqtOWBNeS2malxC2e+fneekX3mA+rX3Df3FE1++
	eW9XIomnoqjn0ey3EY+o8oPhxfdsPNuBW7Ej0wGpfBC6wpQGDj1loPSbWQSd3+9uAyGQMCEhzTETe
	vc3EYipgAHMsX9f/HBUNeC7u8H1PvHmk3oexA1MMdMygN9c4mwH2OOKWw8NRE8mWM/XqBuGtnIneP
	yCmnbS0cjNLAWubOYzqI5aq84x7qQV+jl8Bw+zPwtk+WPHWB879mfrSdC78VVTNlmqf+0KmYn9wLi
	XE2ORUg04cuxs+Mq+OQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjfEL-00000002BbW-45gt;
	Thu, 29 Aug 2024 13:30:29 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjfEF-00000002BXc-46Hw
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 13:30:27 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WvhwX6mpBz4f3l8B
	for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 21:30:04 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id EF6421A0568
	for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 21:30:14 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with SMTP id cCh0CgDHHE_jd9Bm48_bCw--.51956S3;
	Thu, 29 Aug 2024 21:30:14 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
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
Subject: [PATCH bpf-next 1/2] libbpf: Fix accessing first syscall argument on RV64
Date: Thu, 29 Aug 2024 13:32:51 +0000
Message-Id: <20240829133253.882133-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829133253.882133-1-pulehui@huaweicloud.com>
References: <20240829133253.882133-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDHHE_jd9Bm48_bCw--.51956S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr43ArWfCw1Dur47Zry3CFg_yoW8ZF4DpF
	W5Ca47Kr18Wr4Ig3s7KF4aqa13Kr15JrsrJF93Ww4S9FW8t39aqa429390yrsIqrW8J3y5
	ZFZrKw1rWry7ZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxV
	W8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jqYL9U
	UUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_063026_347102_FA1021CB 
X-CRM114-Status: UNSURE (   9.15  )
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

On RV64, as Ilya mentioned before [0], the first syscall parameter should be
accessed through orig_a0 (see arch/riscv64/include/asm/syscall.h),
otherwise it will cause selftests like bpf_syscall_macro, vmlinux,
test_lsm, etc. to fail on RV64. Let's fix it by using the struct pt_regs
style to provide access to it only through PT_REGS_PARM1_CORE_SYSCALL().

Link: https://lore.kernel.org/bpf/20220209021745.2215452-1-iii@linux.ibm.com [0]
Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/lib/bpf/bpf_tracing.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/lib/bpf/bpf_tracing.h b/tools/lib/bpf/bpf_tracing.h
index 9314fa95f04e..388f30cf7914 100644
--- a/tools/lib/bpf/bpf_tracing.h
+++ b/tools/lib/bpf/bpf_tracing.h
@@ -351,6 +351,10 @@ struct pt_regs___arm64 {
  * https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc#risc-v-calling-conventions
  */
 
+struct pt_regs___riscv {
+	unsigned long orig_a0;
+};
+
 /* riscv provides struct user_regs_struct instead of struct pt_regs to userspace */
 #define __PT_REGS_CAST(x) ((const struct user_regs_struct *)(x))
 #define __PT_PARM1_REG a0
@@ -362,12 +366,15 @@ struct pt_regs___arm64 {
 #define __PT_PARM7_REG a6
 #define __PT_PARM8_REG a7
 
-#define __PT_PARM1_SYSCALL_REG __PT_PARM1_REG
+#define __PT_PARM1_SYSCALL_REG orig_a0
 #define __PT_PARM2_SYSCALL_REG __PT_PARM2_REG
 #define __PT_PARM3_SYSCALL_REG __PT_PARM3_REG
 #define __PT_PARM4_SYSCALL_REG __PT_PARM4_REG
 #define __PT_PARM5_SYSCALL_REG __PT_PARM5_REG
 #define __PT_PARM6_SYSCALL_REG __PT_PARM6_REG
+#define PT_REGS_PARM1_SYSCALL(x) PT_REGS_PARM1_CORE_SYSCALL(x)
+#define PT_REGS_PARM1_CORE_SYSCALL(x) \
+	BPF_CORE_READ((const struct pt_regs___riscv *)(x), __PT_PARM1_SYSCALL_REG)
 
 #define __PT_RET_REG ra
 #define __PT_FP_REG s0
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
