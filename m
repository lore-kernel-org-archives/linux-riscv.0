Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A77FC72C4
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Mar 2026 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fSYAJnfII8or2zP3n4N8dfqdP7OLg76aW4RTOaDSPXM=; b=eDGCScXE+5fw/p
	3R8C0Wrvob/7t2LLbhYbmplyBm/3wxp4aaolePrPwlPTYZsOqQMuwCBCfAp+wqWIlvnKrmQC9N2gi
	ulfZfKvMDux51n5BBny6zJrQwg12uGkFVHa739DutDKAiuHADUrD/+L56iVHho7oav4qaC57noxK7
	cP+VlR6dKG2liF1MB6SzCzdDHBXq499Co0Tm56f0eLLnwE0o8cP5Krfgx5HJE45ybvY7C6hGfA5eR
	HVzeLvbc/me7m9c4uJsc0tsTyNdo0cIz3mPsvDVbEhqUQud9Ia0VHNFY//52UqOQyugLp/F+qTHf2
	ysfaF8rv2oawJ/ejA0SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4LFF-0000000FU8f-10tT;
	Sun, 22 Mar 2026 16:01:41 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4LFB-0000000FU7r-2kvW
	for linux-riscv@lists.infradead.org;
	Sun, 22 Mar 2026 16:01:40 +0000
Received: from yzs (unknown [115.192.255.131])
	by APP-01 (Coremail) with SMTP id qwCowADnkGw2EsBphWbRCg--.24488S2;
	Mon, 23 Mar 2026 00:00:55 +0800 (CST)
From: Zishun Yi <vulab@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Nam Cao <namcao@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zishun Yi <vulab@iscas.ac.cn>
Subject: [PATCH] riscv: Reset pmm when PR_TAGGED_ADDR_ENABLE is not set
Date: Mon, 23 Mar 2026 00:00:22 +0800
Message-ID: <20260322160022.21908-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnkGw2EsBphWbRCg--.24488S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4kWr4xZr4rur1kXFWrZrb_yoWDZwc_ua
	1rZrnrury5JF4DXFyjkw4rGr4Yqw18KF1kua10vryIyrW5CrWav398tFySqrn8XFZYg3Wx
	Xw17trZrCw12yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [115.192.255.131]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwsOA2nABVwPNAAAsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_090138_060742_C5B7CF4E 
X-CRM114-Status: GOOD (  10.28  )
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

In set_tagged_addr_ctrl(), when PR_TAGGED_ADDR_ENABLE is not set, pmlen
is correctly set to 0, but it forgets to reset pmm. This results in the
CPU pmm state not corresponding to the software pmlen state.

Fix this by resetting pmm along with pmlen.

Fixes: 2e1743085887 ("riscv: Add support for the tagged address ABI")
Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>
---
 arch/riscv/kernel/process.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index aacb23978f93..5957effab57c 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -347,8 +347,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
 	if (arg & PR_TAGGED_ADDR_ENABLE && (tagged_addr_disabled || !pmlen))
 		return -EINVAL;
 
-	if (!(arg & PR_TAGGED_ADDR_ENABLE))
+	if (!(arg & PR_TAGGED_ADDR_ENABLE)) {
 		pmlen = PMLEN_0;
+		pmm = ENVCFG_PMM_PMLEN_0;
+	}
 
 	if (mmap_write_lock_killable(mm))
 		return -EINTR;
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
