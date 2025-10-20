Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D6CCCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XLnFVrQ5GJ+ndySlJ+60FC4URMiSYxhjKamOfxi37eE=; b=AlYb1rOYUIF3Cv
	yNQUOMzfbn7+3pKnHwO5k6bBZeNvJGt3P8WUFxorBARNfx1cb5l77Fo8eq89HZ1rTLTtBO790WBrS
	/eCFUzn/u4QJthNeUvk6xnz5E/5p/UGpDFYmqrhWAROdvKA/megTUN+Cw4Z2umkyg0JYcmr2Y0M7U
	P+1fISGYRHMtSE3Rguv4k0YL22/vVfLqwgs4LPYcIT0p38FElY1frBS3NACSFf+aou034B0DaVlcD
	jWIad7Z+BbXZTbdS/jNDUo/VuKvzTfnwR6hxOXgPOWtd26HzFgnKwg8zesFe0b54/xoI2Is6rLIOH
	LtCD3Hqnd5AQVcQ27zwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAowS-0000000DOpH-1Q3Z;
	Mon, 20 Oct 2025 12:24:48 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAowP-0000000DOnV-0HeK
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 12:24:47 +0000
Received: from [127.0.0.2] (unknown [114.241.85.109])
	by APP-05 (Coremail) with SMTP id zQCowABX+RLoKfZo2ywDEg--.13259S2;
	Mon, 20 Oct 2025 20:24:08 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH 0/2] riscv: tests: Make RISCV_KPROBES_KUNIT tristate
Date: Mon, 20 Oct 2025 20:23:54 +0800
Message-Id: <20251020-riscv-kunit-kconfig-fix-6-18-v1-0-d773b5d5ce48@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANop9mgC/yWNQQrDIBBFryKz7hS1VEquUrIwdpIOIdqORgIhd
 680y/c+vL9DJmHK0KkdhCpnTrGBuSgIbx8nQn41Bqvt3WirUTiHivMaueAcUhx5wpE3dGgeqM0
 YHA3eOXODlvgIte2ff/YnC33X9lJOCYPPhCEtC5dOVXdtEQkG+uP4AXA1YsybAAAA
X-Change-ID: 20251020-riscv-kunit-kconfig-fix-6-18-01fc6eba6613
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nam Cao <namcao@linutronix.de>
X-Mailer: b4 0.14.3
X-CM-TRANSID: zQCowABX+RLoKfZo2ywDEg--.13259S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr1kWF4xGw48XFy7Kr1rZwb_yoWfAwc_Cw
	4IvrykGa1UAFyqkFyYg393XFs5t348KFy3Xr1rtrWxGr1xKr9rKa1kur18C3s5u398XF13
	t3yku34qvF12qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [114.241.85.109]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_052445_492092_93903E23 
X-CRM114-Status: UNSURE (   6.04  )
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

Fix an allmodconfig warning on v6.18-rc1:

    WARNING: 3 bad relocations
    ffffffff81e24118 R_RISCV_64        kunit_unary_assert_format
    ffffffff81e24a60 R_RISCV_64        kunit_binary_assert_format
    ffffffff81e269d0 R_RISCV_JUMP_SLOT  __kunit_do_failed_assertion

While we're at it, rename the test to remove the word "test", in order
to conform to the style guide.

---
Vivian Wang (2):
      riscv: tests: Rename kprobes_test_riscv to kprobes_riscv
      riscv: tests: Make RISCV_KPROBES_KUNIT tristate

 arch/riscv/kernel/tests/Kconfig.debug          | 2 +-
 arch/riscv/kernel/tests/kprobes/Makefile       | 4 +++-
 arch/riscv/kernel/tests/kprobes/test-kprobes.c | 5 ++++-
 3 files changed, 8 insertions(+), 3 deletions(-)
---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20251020-riscv-kunit-kconfig-fix-6-18-01fc6eba6613

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
