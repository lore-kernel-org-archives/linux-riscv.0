Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B2CCCD1A5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSMsMiu2lfWj005WN29Y5JG8EhNylaeMS/bnqGFxWiA=; b=CU75cKxZQ/3SgN
	3qmttfRM6Nmbt9w/smurYGH2grNQF0zHzuo6ZqCJx8YLPX4Q32UOBGP3UIjlf6vm3lLyYG4S9LhKY
	vw1O9OpHPlP8fZLMY9zJRatRnapnAJmdzM1ca3GPOydp/SN6M+iG++ZhpruzoaJHNgDyowJBY4u75
	ASZ+oWf/xHisfHquUyAQT6snERQV5qgJB1IknVHShU7y3Kg+r0gIKQ/jesFq+XMW4FUHjYnbm3FWE
	alkzrCrO8N74XOku1tdXe3v5qI04h8opvwWxKfsTDHunA0zwpnrgB1msGfBthX3yB3SMy2VBfZDRG
	VkAU/qo+l6WYQesFNvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAowS-0000000DOpP-2e3P;
	Mon, 20 Oct 2025 12:24:48 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAowP-0000000DOnX-0GZS
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 12:24:47 +0000
Received: from [127.0.0.2] (unknown [114.241.85.109])
	by APP-05 (Coremail) with SMTP id zQCowABX+RLoKfZo2ywDEg--.13259S3;
	Mon, 20 Oct 2025 20:24:08 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Mon, 20 Oct 2025 20:23:55 +0800
Subject: [PATCH 1/2] riscv: tests: Rename kprobes_test_riscv to
 kprobes_riscv
MIME-Version: 1.0
Message-Id: <20251020-riscv-kunit-kconfig-fix-6-18-v1-1-d773b5d5ce48@iscas.ac.cn>
References: <20251020-riscv-kunit-kconfig-fix-6-18-v1-0-d773b5d5ce48@iscas.ac.cn>
In-Reply-To: <20251020-riscv-kunit-kconfig-fix-6-18-v1-0-d773b5d5ce48@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nam Cao <namcao@linutronix.de>
X-Mailer: b4 0.14.3
X-CM-TRANSID: zQCowABX+RLoKfZo2ywDEg--.13259S3
X-Coremail-Antispam: 1UD129KBjvdXoWruw1rGr15urykGr1xuryUWrg_yoWfGrb_C3
	WUtr93ur40yFyjqry5JanayFs3tw1xKFWrJrnxtry8Jw4UGF9Ika1vgr1Ut3yrWrZ0gFW7
	Kr47W34qva15ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbk8FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E
	0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67
	AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48I
	cxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxw
	CY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
	A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73
	UjIFyTuYvjfU8T5lUUUUU
X-Originating-IP: [114.241.85.109]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_052445_507785_000A014B 
X-CRM114-Status: GOOD (  10.11  )
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

According to Documentation/dev-tools/kunit/style.rst a KUnit test suite
normally should not have "test" in the name. Rename it to follow the
style guide.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/kernel/tests/kprobes/test-kprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.c b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
index 6f6cdfbf5a95..0716c88bcec7 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes.c
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
@@ -49,7 +49,7 @@ static struct kunit_case kprobes_testcases[] = {
 };
 
 static struct kunit_suite kprobes_test_suite = {
-	.name = "kprobes_test_riscv",
+	.name = "kprobes_riscv",
 	.test_cases = kprobes_testcases,
 };
 

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
