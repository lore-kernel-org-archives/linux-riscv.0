Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0553C61D97
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Jan 2023 06:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eW8jTuQ/ngu2cs0l7nrptpObLnwLUpKDzW4VduVShrI=; b=RfZocgpnou9chZ
	K2HIqIzZZxtwc1ijXAwlP2sFhQKp5inL5lKVYW0O7uN6F+dckJrHo0eplXtEou8dsHmUt7ga1+ame
	2kH3zKd0E8cpVDpdt5iZ14eIvcX+VCM5StSIyHigPwOn4r2G2bNViNsbYdjVW/XQYqTTHULRjHB6I
	dpudmvwq5FAVpcFiz9aheNvTRQgo5Pl9/9631C4rdoSBhoSJqM+EtckVgboKdhvFJ81e9KkiIhRbS
	2wWdnxFHiyvxryjFsims4D+3g+BopGlmB3XVfl7j7FON7BcXjI0/jgFFXlJSZwEU02j78BvFEb5om
	xCNHWJm85RMyBBxqNH3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM1Wd-00179G-5e; Sun, 29 Jan 2023 06:50:51 +0000
Received: from m12.mail.163.com ([220.181.12.196])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM1WY-00178g-Vx
	for linux-riscv@lists.infradead.org; Sun, 29 Jan 2023 06:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=6uU3j
	oumwcYBcrqjjyAlKZujZbS6wTE38W4riMu4ql8=; b=fA8ERx8rPzhplQswwnABe
	e20o2orl92hPcZOEd511wENbbnbhTaKkgVLWYrzMmKbS5VQN6FKZlN9N2rpbd71C
	lbLyNq/wwFkSBQCVcUGNzm4/36age2s8M+hGoair2zuWZoLA0JwMvCUK/H6Txd3Z
	R3gPr94FtPyx5PZo2UqBZg=
Received: from whoami-VirtualBox.. (unknown [223.104.39.183])
	by zwqz-smtp-mta-g0-2 (Coremail) with SMTP id _____wDn6bkWF9ZjinBACA--.17232S2;
	Sun, 29 Jan 2023 14:49:59 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	yuzhao@google.com,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	guoren@kernel.org,
	tongtiangen@huawei.com,
	anup@brainfault.org
Cc: akpm@linux-foundation.org,
	falcon@tinylab.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH v1] riscv: support arch_has_hw_pte_young()
Date: Sun, 29 Jan 2023 14:49:56 +0800
Message-Id: <20230129064956.143664-1-tjytimi@163.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CM-TRANSID: _____wDn6bkWF9ZjinBACA--.17232S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyxWFy7Gr43AryUKr1fCrg_yoW8ZrWkpF
	s8CrnYkFWftF9akFW3Z3srCr1rJ3ZYgay3Kry0k34UXrsrArWSvwsxKwn3Xry8JFWxXrWf
	CrZa9F1Duw17Xw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR_cT9UUUUU=
X-Originating-IP: [223.104.39.183]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbiVhMGeFqzwK5hhwADsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_225047_462460_1909353A 
X-CRM114-Status: UNSURE (   6.82  )
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

The arch_has_hw_pte_young() is false for riscv by default. If it's
false, page table walk is almost skipped for MGLRU reclaim. And it
will also cause useless step in __wp_page_copy_user().

RISC-V Privileged Book says that riscv have two schemes to manage A
and D bit.

So add a config for selecting, the default is true. For simple
implementation riscv CPU which just generate page fault, unselect it.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
---
 arch/riscv/Kconfig               | 10 ++++++++++
 arch/riscv/include/asm/pgtable.h |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..17c82885549c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -180,6 +180,16 @@ config PAGE_OFFSET
 	default 0x80000000 if 64BIT && !MMU
 	default 0xff60000000000000 if 64BIT
 
+config ARCH_HAS_HARDWARE_PTE_YOUNG
+	bool "Hardware Set PTE Access Bit"
+	default y
+	help
+	  Select if hardware set A bit when PTE is accessed. The default is
+	  'Y', because most RISC-V CPU hardware can manage A and D bit.
+	  But RISC-V may have simple implementation that do not support
+	  hardware set A bit but only generate page fault, for that case just
+	  unselect it.
+
 config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN_GENERIC
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4eba9a98d0e3..1db54ab4e1ba 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -532,6 +532,13 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	 */
 	return ptep_test_and_clear_young(vma, address, ptep);
 }
+#ifdef CONFIG_ARCH_HAS_HARDWARE_PTE_YOUNG
+#define arch_has_hw_pte_young arch_has_hw_pte_young
+static inline bool arch_has_hw_pte_young(void)
+{
+	return true;
+}
+#endif
 
 #define pgprot_noncached pgprot_noncached
 static inline pgprot_t pgprot_noncached(pgprot_t _prot)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
