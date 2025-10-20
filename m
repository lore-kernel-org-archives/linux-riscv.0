Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADF1CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfeFEtT+16i9dcFKDnRHGVIRYcD+fsBFi3lf9Vug6lo=; b=wzVwFAL2l1HHWQ
	p9GF5CkytKFTxG5gNojSuWck6ZqZPF1S+9mU/1Mb77tGE64NRQ1UeeWGn9I8zLeGF7lh4XwbCsTG+
	e29XoZ/A7OLnnCs7H+m+C8UoIzvCEIjSdDA4FMY24JkkDz/zRUAKu59CtNLUv8UPXnJyYQ7CrqZzp
	OmN9Je6zTmo9BCs06Bq+lpz8chuwMcvTep9QrNvyCzYi1DPPI0epSo+xJj+p7kZ4yk0His19dBUlR
	+MXrOL7QjKvjxooowvzzt1e/I/UcHrx32ZpheP2ipj6Efc4Pg556CL8MlnZqlXck3FliZFv4GbUT0
	5Zj99u06CNnewn22urNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAowS-0000000DOpT-3sKa;
	Mon, 20 Oct 2025 12:24:48 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAowP-0000000DOnW-0HCZ
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 12:24:47 +0000
Received: from [127.0.0.2] (unknown [114.241.85.109])
	by APP-05 (Coremail) with SMTP id zQCowABX+RLoKfZo2ywDEg--.13259S4;
	Mon, 20 Oct 2025 20:24:08 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Mon, 20 Oct 2025 20:23:56 +0800
Subject: [PATCH 2/2] riscv: tests: Make RISCV_KPROBES_KUNIT tristate
MIME-Version: 1.0
Message-Id: <20251020-riscv-kunit-kconfig-fix-6-18-v1-2-d773b5d5ce48@iscas.ac.cn>
References: <20251020-riscv-kunit-kconfig-fix-6-18-v1-0-d773b5d5ce48@iscas.ac.cn>
In-Reply-To: <20251020-riscv-kunit-kconfig-fix-6-18-v1-0-d773b5d5ce48@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nam Cao <namcao@linutronix.de>
X-Mailer: b4 0.14.3
X-CM-TRANSID: zQCowABX+RLoKfZo2ywDEg--.13259S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw18CryxJFyrAFy5tF4UCFg_yoW8tw4fpF
	4DGwn09r4xG3WDG343A3s2g3yxG3WDGw43uF1UC348Gr47Ar45Awn2g3yDXrn2grWqqrZ3
	Cwn5urZ8KryDJa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUbH5lUUUUUU==
X-Originating-IP: [114.241.85.109]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_052445_489531_EE22EED8 
X-CRM114-Status: UNSURE (   9.72  )
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
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This disallows KUNIT=m and RISCV_KPROBES_KUNIT=y, which produces these
relocs_check.sh warnings when RELOCATABLE=y:

    WARNING: 3 bad relocations
    ffffffff81e24118 R_RISCV_64        kunit_unary_assert_format
    ffffffff81e24a60 R_RISCV_64        kunit_binary_assert_format
    ffffffff81e269d0 R_RISCV_JUMP_SLOT  __kunit_do_failed_assertion

This fixes allmodconfig build.

Reported-by: Inochi Amaoto <inochiama@gmail.com>
Fixes: f2fab612824f ("riscv: Add kprobes KUnit test")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/kernel/tests/Kconfig.debug          | 2 +-
 arch/riscv/kernel/tests/kprobes/Makefile       | 4 +++-
 arch/riscv/kernel/tests/kprobes/test-kprobes.c | 3 +++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/tests/Kconfig.debug b/arch/riscv/kernel/tests/Kconfig.debug
index 5db4df44279e..40f8dafffa0a 100644
--- a/arch/riscv/kernel/tests/Kconfig.debug
+++ b/arch/riscv/kernel/tests/Kconfig.debug
@@ -31,7 +31,7 @@ config RISCV_MODULE_LINKING_KUNIT
          If unsure, say N.
 
 config RISCV_KPROBES_KUNIT
-       bool "KUnit test for riscv kprobes" if !KUNIT_ALL_TESTS
+       tristate "KUnit test for riscv kprobes" if !KUNIT_ALL_TESTS
        depends on KUNIT
        depends on KPROBES
        default KUNIT_ALL_TESTS
diff --git a/arch/riscv/kernel/tests/kprobes/Makefile b/arch/riscv/kernel/tests/kprobes/Makefile
index 4cb6c66a98e8..df7256f62313 100644
--- a/arch/riscv/kernel/tests/kprobes/Makefile
+++ b/arch/riscv/kernel/tests/kprobes/Makefile
@@ -1 +1,3 @@
-obj-y += test-kprobes.o test-kprobes-asm.o
+obj-$(CONFIG_RISCV_KPROBES_KUNIT) += kprobes_riscv_kunit.o
+
+kprobes_riscv_kunit-objs := test-kprobes.o test-kprobes-asm.o
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.c b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
index 0716c88bcec7..664535ca0a98 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes.c
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
@@ -54,3 +54,6 @@ static struct kunit_suite kprobes_test_suite = {
 };
 
 kunit_test_suites(&kprobes_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit test for riscv kprobes");

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
