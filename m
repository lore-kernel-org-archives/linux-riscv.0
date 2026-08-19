Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2678CC5DF6D
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 08:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hd0Dtqw0bgxjwO1bYv+bbHvmum6ube3HaEOLSxNxH9s=; b=uKAE8AWE8jme3n
	R7JywjnXHOGZ4EVeEjszN/X6fGtd7sg81TuvPZWL75bsrkxt1geoFXIzdjRoP/YUqQ5SrMXd3649K
	AyyseGgi1PQ8kgKCJreye5uFZwCO5e5N8ZUVwcOSachtxfDvGIEAqQNmu4k/V53HzriycY5/zFTG7
	GcQodfMrCj+ko9HTB0ed5dwN/zfvsAWjnSE3X7P9pgMmUNg00B/Y86NBKjlz0Nissl0zr3zW8mAbi
	alxyWEH6u6RedgIKnz2FCy0jO+KI6Dhvs6yj6E5cd8lrTgAM8sSDTFFHhpDYaeXGCO2I5XolsR2Rc
	BzeE/zg1bNfHAJRFLh9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwc3B-00000009LY5-1rU5;
	Wed, 19 Aug 2026 08:53:33 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwc35-00000009LVH-29Up
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 08:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787129605; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=ZCkwrG5UaWoJEzEsbaTN0x0VxiVzO2j77PibIF7G8XU=;
	b=Fi8A6jH5QBLvC4i/+9h0Jfsdv4z9b977qkZwY2KESQmsntWpXXTGhMWmOn6KroQNJeHu1YTo5Elr+UyGUJDoEa81yAmzcwV8j3cpXbgVZganqsTIJPG+07nxYwrrAKOganQPVPcOCVO/KyG6Tz+AgAwYJuBct4awsOaNQUV3K9g=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X9G1g-1_1787129603;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X9G1g-1_1787129603 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Aug 2026 16:53:24 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,
	eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 2/2] selftests/bpf: Enable arena LDSX tests for riscv64
Date: Wed, 19 Aug 2026 16:53:16 +0800
Message-ID: <b31c252625e16db62b87b8301b79bf6cc7d7ffac.1787128322.git.cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787128322.git.cp0613@linux.alibaba.com>
References: <cover.1787128322.git.cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_015327_805791_08CBB3BD 
X-CRM114-Status: UNSURE (   5.95  )
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

Now that the riscv64 JIT supports signed arena loads
(BPF_PROBE_MEM32SX), enable the arena LDSX tests on riscv64:
add JIT disassembly assertions for arena_ldsx_disasm (arena base in
s7, add into t2, sign-extending lw/lh/lb loads) and run
arena_ldsx_exception and arena_ldsx_s8/s16/s32 on riscv64.

Reviewed-by: Pu Lehui <pulehui@huawei.com>
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 .../testing/selftests/bpf/progs/verifier_ldsx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_ldsx.c b/tools/testing/selftests/bpf/progs/verifier_ldsx.c
index 41340877dc9d..ed0a0f159bc1 100644
--- a/tools/testing/selftests/bpf/progs/verifier_ldsx.c
+++ b/tools/testing/selftests/bpf/progs/verifier_ldsx.c
@@ -286,6 +286,19 @@ __jited("add	x11, x0, x28")
 __jited("ldrsh	x22, [x11, #0x18]")
 __jited("add	x11, x0, x28")
 __jited("ldrsb	x22, [x11, #0x20]")
+__arch_riscv64
+__jited("add	t2, a5, s7")
+__jited("lw	s3, 0x10(t2)")
+__jited("add	t2, a5, s7")
+__jited("lh	s3, 0x18(t2)")
+__jited("add	t2, a5, s7")
+__jited("lb	s3, 0x20(t2)")
+__jited("add	t2, a0, s7")
+__jited("lw	s4, 0x10(t2)")
+__jited("add	t2, a0, s7")
+__jited("lh	s4, 0x18(t2)")
+__jited("add	t2, a0, s7")
+__jited("lb	s4, 0x20(t2)")
 __naked void arena_ldsx_disasm(void *ctx)
 {
 	asm volatile (
@@ -317,6 +330,7 @@ __description("Arena LDSX Exception")
 __success __retval(0)
 __arch_x86_64
 __arch_arm64
+__arch_riscv64
 __naked void arena_ldsx_exception(void *ctx)
 {
 	asm volatile (
@@ -338,6 +352,7 @@ __description("Arena LDSX, S8")
 __success __retval(-1)
 __arch_x86_64
 __arch_arm64
+__arch_riscv64
 __naked void arena_ldsx_s8(void *ctx)
 {
 	asm volatile (
@@ -369,6 +384,7 @@ __description("Arena LDSX, S16")
 __success __retval(-1)
 __arch_x86_64
 __arch_arm64
+__arch_riscv64
 __naked void arena_ldsx_s16(void *ctx)
 {
 	asm volatile (
@@ -400,6 +416,7 @@ __description("Arena LDSX, S32")
 __success __retval(-1)
 __arch_x86_64
 __arch_arm64
+__arch_riscv64
 __naked void arena_ldsx_s32(void *ctx)
 {
 	asm volatile (
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
