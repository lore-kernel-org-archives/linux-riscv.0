Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE72C982FA
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TxNlQyJ58rHZF2ZXRMr8WFB/B8M4dJeInqfFAoTErUM=; b=c3hChHhWNvBI/z
	4OeLxVLTav9RryBp0hi26RBjxTXcGpbpiBqKXaGL4hCsq9bCzuyHeD4YnfzcwJXKCg6hAYaawLK6J
	Y986TRLH+EAcyuae7/dUbQGOF2YITR/ycIgId9HdwpUvAJuSENBlUdFc8yV6yiZ/vSam+9/dlnf7g
	Nr0plW8Qv+JU8PsRnjvjpScjBijQiItODC4sCvBD35PgT7APacle+LtnxzGPTM0QY8J8y8En4SH9f
	YqcqNmzp518dEURZOCaDGqs6kK1L4AQMFiqpJWXBlQAiHCUxF4Sd9yjpG+6T8q4JWLVTvpXPbyTgn
	3E6Rvfkl22Z9K72Fx3GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wtB-00000004vzk-3Ozx;
	Tue, 22 Sep 2026 09:34:13 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wt8-00000004vyY-3Gy8
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 09:34:12 +0000
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hpw0F2sx0z8XrrZ;
	Tue, 22 Sep 2026 17:34:05 +0800 (CST)
Received: (from root@localhost)
	by mse-db.zte.com.cn id 68M9Y2eC015972;
	Tue, 22 Sep 2026 17:34:02 +0800 (+08)
	(envelope-from sun.wenhan@zte.com.cn)
Message-Id: <202609220934.68M9Y2eC015972@mse-db.zte.com.cn>
Received: from njy2app02.zte.com.cn ([10.40.13.116])
	by mse-fl1.zte.com.cn with SMTP id 68M9JSH7006374;
	Tue, 22 Sep 2026 17:19:28 +0800 (+08)
	(envelope-from sun.wenhan@zte.com.cn)
Received: from mapi (njb2app06[null])
	by mapi (Zmail) with MAPI id mid205;
	Tue, 22 Sep 2026 17:19:30 +0800 (CST)
X-Zmail-TransId: 2afe6ab248228bc-51163
X-Mailer: Zmail v1.0
Date: Tue, 22 Sep 2026 17:19:30 +0800 (CST)
Mime-Version: 1.0
From: <sun.wenhan@zte.com.cn>
To: <pjw@kernel.org>
Cc: <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <sun.wenhan@zte.com.cn>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <liu.qingtao2@zte.com.cn>,
        <lv.yating@zte.com.cn>, <guo.chang2@zte.com.cn>,
        <deng.weixian@zte.com.cn>, <hu.yuye@zte.com.cn>
Subject: =?UTF-8?B?wqBbUEFUQ0hdIHJpc2N2OiBhbGlnbiBwY2llIGJ1cyBhc3NpZ24gbG9naWMgd2l0aCBBUk02NA==?=
X-MAIL: mse-db.zte.com.cn 68M9Y2eC015972
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-TLS: YES
X-ENVELOPE-SENDER: sun.wenhan@zte.com.cn
X-SOURCE-IP: 10.5.228.131 unknown Tue, 22 Sep 2026 17:34:05 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AB24B8D.001/4hpw0F2sx0z8XrrZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_023410_974023_475DDA7D 
X-CRM114-Status: GOOD (  10.80  )
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

From: sun wenhan <sun.wenhan@zte.com.cn>


RISC-V currently relies on the asm-generic default of
pcibios_assign_all_busses() returning 1, so the kernel always
re-assigns all PCI bus numbers and ignores the bus numbers already
set up by the firmware. This has two downsides:

1. As UEFI 2.8 has brought mature firmware support to RISC-V servers,
the OS can trust and inherit the PCI bus enumeration done by the
BIOS, skipping a redundant re-enumeration at boot and improving
the boot time.

2. The unconditional re-assignment causes bus numbering conflicts
during PCI rescan. When a root port that is not the last one in
the hierarchy is removed and the bus is rescanned, the kernel
fails with:

pci_bus 0000:01: busn_res: can not insert [bus 01-ff] under
[bus 00-ff] (conflicts with (null) [bus 02])

as reported for the same generic code in commit bd8cbe66c01d
("PCI: Make PCI bus renumbering configurable to avoid rescan
conflicts").

Define pcibios_assign_all_busses() the same way as ARM64,
so that RISC-V also preserves the bus numbers assigned by the
firmware by default instead of always re-assigning them. This keeps
RISC-V consistent with the other major architectures.

Signed-off-by: sun wenhan <sun.wenhan@zte.com.cn>
---
arch/riscv/include/asm/pci.h | 5 +++++
1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
index cc2a184cfc2e..b2f91abebd61 100644
--- a/arch/riscv/include/asm/pci.h
+++ b/arch/riscv/include/asm/pci.h
@@ -15,6 +15,11 @@
#define PCIBIOS_MIN_IO   4
#define PCIBIOS_MIN_MEM    16

+/*
+ * Set to 1 if the kernel should re-assign all PCI bus numbers
+ */
+#define pcibios_assign_all_busses() (pci_has_flag(PCI_REASSIGN_ALL_BUS))
+
#if defined(CONFIG_PCI) && defined(CONFIG_NUMA)
static inline int pcibus_to_node(struct pci_bus *bus)
{
--
2.27.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
