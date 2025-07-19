Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9BAC83F3D
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jul 2025 09:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSHq7B7J18DvAWlrm4sfVZAUBMBwbskJtbK+wAlNLnM=; b=gxUc8aKfmyhKDV
	qA4nvQs4Xw5Z7S6sYZEIWHNIO20JyFCkbXv8EZzLujSwF7dJusUnVg59LIMp3lgRS4aOZvg+kiA6+
	5NalfW0bSx2v9EUOLe5PkaNnlgoYLdu1u4nHriLULs79m3Llhh7nXBTRj9Yj5UcpMAanQCbj76h+L
	ko5EH7dnOD74dNpSy+/z0irFVvqxTpD//jkASNmFcQDyxqq20h7WeOaWRhspeWSsGaahsnVCAWFtb
	52vP/HfnGvYKsIbLUdM/dSLBpE77MVHQkb7+hOKD7pSreBZDtMJwMM1/vsnznGkATKU4Q9+imyhwx
	EC3ZHIZkYjwe776VAl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud3eX-0000000E4hS-21ie;
	Sat, 19 Jul 2025 09:14:45 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud3eQ-0000000E4Z3-0TOD
	for linux-riscv@lists.infradead.org;
	Sat, 19 Jul 2025 09:14:39 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bkgw15PytzYQvFt
	for <linux-riscv@lists.infradead.org>; Sat, 19 Jul 2025 17:14:25 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 7D5651A10F4
	for <linux-riscv@lists.infradead.org>; Sat, 19 Jul 2025 17:14:24 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgCHURLuYXtopCAYAw--.54295S12;
	Sat, 19 Jul 2025 17:14:24 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next 10/10] selftests/bpf: Enable arena atomics tests for RV64
Date: Sat, 19 Jul 2025 09:17:30 +0000
Message-Id: <20250719091730.2660197-11-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250719091730.2660197-1-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgCHURLuYXtopCAYAw--.54295S12
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4DurWkJw13ury7Xry8AFb_yoW8CFy5pF
	48ZF98ta4Fgr42kas3tF4UZr4rCws5ArWUCFWqgw4DG3ZrJ3yxKF92ka98ArZ0ga4S9ry5
	Aw10q3sI9r48Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPvb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
	W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUI-eODUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_021438_494323_EB35F746 
X-CRM114-Status: UNSURE (   7.44  )
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

Enable arena atomics tests for RV64.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/testing/selftests/bpf/progs/arena_atomics.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/arena_atomics.c b/tools/testing/selftests/bpf/progs/arena_atomics.c
index a52feff98112..d1841aac94a2 100644
--- a/tools/testing/selftests/bpf/progs/arena_atomics.c
+++ b/tools/testing/selftests/bpf/progs/arena_atomics.c
@@ -28,7 +28,8 @@ bool skip_all_tests = true;
 
 #if defined(ENABLE_ATOMICS_TESTS) &&		  \
 	defined(__BPF_FEATURE_ADDR_SPACE_CAST) && \
-	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
+	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) || \
+	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
 bool skip_lacq_srel_tests __attribute((__section__(".data"))) = false;
 #else
 bool skip_lacq_srel_tests = true;
@@ -314,7 +315,8 @@ int load_acquire(const void *ctx)
 {
 #if defined(ENABLE_ATOMICS_TESTS) &&		  \
 	defined(__BPF_FEATURE_ADDR_SPACE_CAST) && \
-	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
+	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) || \
+	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
 
 #define LOAD_ACQUIRE_ARENA(SIZEOP, SIZE, SRC, DST)	\
 	{ asm volatile (				\
@@ -365,7 +367,8 @@ int store_release(const void *ctx)
 {
 #if defined(ENABLE_ATOMICS_TESTS) &&		  \
 	defined(__BPF_FEATURE_ADDR_SPACE_CAST) && \
-	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
+	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) || \
+	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
 
 #define STORE_RELEASE_ARENA(SIZEOP, DST, VAL)	\
 	{ asm volatile (			\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
