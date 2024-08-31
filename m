Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988B4CA101E
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2024 02:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrQFIDWG2Q1L3Nwc6LpElL4MLEFjAhNR+7rK0gOkUXY=; b=QxhJo4nthVRQy1
	p3EqwDLIhMK+7j10wurnVyW2FrKfADWjLWwUXFMvjoNfqgGj+vIz4zBUVXgXcBc/RgZUztf5MtM2N
	U8ZiOnYt203RuZzf+cg11qvc12FbQBseCak7lvJ3prZ7A0JXxICzITNUaGR3vFBn5LahRKo2/gvYF
	SPctYG7dyMsZUeAn/O/CUg1RDFCb3JAbl9SYbV8+HDmRUYjqWB/pclXYhbF3XnooU1hN4IJbvJ5MP
	ndWQyWfwPr9S8sKG+/Li0QVXPP+ll2GxD5sig98ss3fSkPEAptgOOQGQ6Yfh/KdyDcuRkHL6OP//j
	TgMdw0shHsJ8zopIvu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skDwY-00000008L0X-0vgf;
	Sat, 31 Aug 2024 02:34:26 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skDwS-00000008Kvt-30A9
	for linux-riscv@lists.infradead.org;
	Sat, 31 Aug 2024 02:34:22 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4WwfGT2jkhz4f3kF8
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 10:33:53 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 21ADC1A0568
	for <linux-riscv@lists.infradead.org>; Sat, 31 Aug 2024 10:34:08 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgDXSYAagdJmoPLJDA--.24950S4;
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
Subject: [PATCH bpf-next v2 2/4] libbpf: Access first syscall argument with CO-RE direct read on arm64
Date: Sat, 31 Aug 2024 02:36:44 +0000
Message-Id: <20240831023646.1558629-3-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240831023646.1558629-1-pulehui@huaweicloud.com>
References: <20240831023646.1558629-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgDXSYAagdJmoPLJDA--.24950S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uF17Zr1rWry5Xry3CFWUXFb_yoW8XFW8pF
	WUCa47Kr18Ww4jkasrKF4avF13tws5twsrJF97WayS9FWUt393X3W2grZ0kw4avrW5Gw4Y
	vr9Fkr18G3W7Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxV
	W8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIID7
	DUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_193421_301909_8BDFE584 
X-CRM114-Status: UNSURE (   8.95  )
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

Currently PT_REGS_PARM1 SYSCALL(x) is consistent with PT_REGS_PARM1_CORE
SYSCALL(x), which will introduce the overhead of BPF_CORE_READ(), taking
into account the read pt_regs comes directly from the context, let's use
CO-RE direct read to access the first system call argument.

Suggested-by: Andrii Nakryiko <andrii@kernel.org>
Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/lib/bpf/bpf_tracing.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/lib/bpf/bpf_tracing.h b/tools/lib/bpf/bpf_tracing.h
index e7d9382efeb3..051c408e6aed 100644
--- a/tools/lib/bpf/bpf_tracing.h
+++ b/tools/lib/bpf/bpf_tracing.h
@@ -222,7 +222,7 @@ struct pt_regs___s390 {
 
 struct pt_regs___arm64 {
 	unsigned long orig_x0;
-};
+} __attribute__((preserve_access_index));
 
 /* arm64 provides struct user_pt_regs instead of struct pt_regs to userspace */
 #define __PT_REGS_CAST(x) ((const struct user_pt_regs *)(x))
@@ -241,7 +241,7 @@ struct pt_regs___arm64 {
 #define __PT_PARM4_SYSCALL_REG __PT_PARM4_REG
 #define __PT_PARM5_SYSCALL_REG __PT_PARM5_REG
 #define __PT_PARM6_SYSCALL_REG __PT_PARM6_REG
-#define PT_REGS_PARM1_SYSCALL(x) PT_REGS_PARM1_CORE_SYSCALL(x)
+#define PT_REGS_PARM1_SYSCALL(x) (((const struct pt_regs___arm64 *)(x))->orig_x0)
 #define PT_REGS_PARM1_CORE_SYSCALL(x) \
 	BPF_CORE_READ((const struct pt_regs___arm64 *)(x), __PT_PARM1_SYSCALL_REG)
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
