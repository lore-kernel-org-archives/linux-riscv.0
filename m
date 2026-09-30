Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCA5CA5FAB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFR8E+3P8G9rj5ZKMbfCB/HvOrOE9esxrvcQH9fvTqU=; b=xrZR9PSjMKqpa2
	cDVnM6IHRV3MFj0me72XjfUfZjJfTdxKNk7rkLXXPUqT8t7NvH6k+1hwSv9GftnzDIayF0N3Lkepb
	PvkaeMP2TK8VwmXMIgaxbhDpyxFO1lDNINkW7tw0LR84tj6RbipZtrk0tMK2wC9W3y90WlENG+3/F
	3ljSbYPxIauYezg7CvL76kIy7jJ2zGjurmuaRZRv3WORGqXacFIgql+8huGm30nf0Yd0stCoUcHQr
	Z4GZwHGlgJrBLCZiKz+CI3i459wHRP05WYSrjMqP3xa4G0/WPiYCzjoIKjRVRLE6Qw0p1Sx+uJ8xT
	2npKHJH/cSgTp779lGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo1P-00000005B3w-17vz;
	Wed, 30 Sep 2026 06:42:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo1M-00000005B1o-0nBs
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 06:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i2iFHVFHafuAODVGBq1jwbz5bJVxJZSi8pHMYtot00w=; b=fMcVQJvsNzUgH3X7hSSZMovtH4
	/0FiTkLYbrTFsPlqCxKiV+6CPM7NrCHZbI2dAOEz48MvDLL2EiDJzlymSjAVX9eUD5Ksm+2Ng/axH
	teTRmN5X2IABiX9ZMPjRyy7psfWsFABdR/BL5NnaDD2YkcCO8NXASwTnlowv7eQB6EPNJ7XmJLfvS
	TddIPEA2Z3QcJt7Ehd1ysyatHjIAUdYj5KE3CVT4W3Th8G3RuXWQnK/p87fUBj4agqO15Law7FfQY
	hvqYf285pjrsXFoAg3Mp5v3SHRoekb3nY+ExjrRGKcVENW5gW+acYzIcXi4cl8JKK2CRTjeAq/Y2X
	5B2lKllg==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBo18-00000003QVt-23go
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 06:42:26 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hvlnW3zWNzYQttV
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 14:41:35 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 12A2A40574
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 14:42:04 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgD3xSg2r7xqwDvcCA--.7693S6;
	Wed, 30 Sep 2026 14:42:03 +0800 (CST)
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
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v2 4/4] selftests/bpf: Update DENYLIST.riscv64
Date: Wed, 30 Sep 2026 06:46:07 +0000
Message-Id: <20260930064607.1908864-5-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930064607.1908864-1-pulehui@huaweicloud.com>
References: <20260930064607.1908864-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgD3xSg2r7xqwDvcCA--.7693S6
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr17WrykZFy7tw4DZF4ktFb_yoW8Wr1DpF
	ZIgw1Yk3s5XF4avr1xGrWDGFWFvrWkZFWfJw48Xry3ArsrtFW7uan2gayftrn3urWUW34a
	yF1Iy345uryDJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
	3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
	x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
	JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
	ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIY
	CTnIWIevJa73UjIFyTuYvjTRNdb1DUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_074215_578310_8303F162 
X-CRM114-Status: UNSURE (   8.97  )
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

Both probe_user and stacktrace_build_id fail on riscv64 due to riscv64's
trap-based kprobe handling.

For probe_user, kprobes on riscv64 are handled via traps where the entry
path invokes irqentry_nmi_enter(). Because bpf_probe_write_user()
rejects execution in NMI context, the test fails. Upstream discussions
regarding NMI semantics on riscv are ongoing [0] and will be tracked.

For stacktrace_build_id, under the kprobe trap context with interrupts
disabled, bpf_get_stackid() obtains a valid build_id, but the queued
irq_work is deferred. As a result, subsequent bpf_get_stack() fails to
acquire mmap_read_trylock() and falls back to BPF_STACK_BUILD_ID_IP,
causing an inconsistency between the two results.

Since stacktrace_build_id is already included in the generic DENYLIST,
only add probe_user to DENYLIST.riscv64.

Link: https://lore.kernel.org/linux-riscv/20230702025708.784106-1-guoren@kernel.org [0]
Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/testing/selftests/bpf/DENYLIST.riscv64 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/DENYLIST.riscv64 b/tools/testing/selftests/bpf/DENYLIST.riscv64
index ca1beae7fe8f..75a9690fb2f2 100644
--- a/tools/testing/selftests/bpf/DENYLIST.riscv64
+++ b/tools/testing/selftests/bpf/DENYLIST.riscv64
@@ -1,2 +1,3 @@
 # riscv64 deny list for BPF CI and local vmtest
 exceptions					# JIT does not support exceptions
+probe_user					# kprobe hit in trap
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
