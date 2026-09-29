Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ADBCA5FCB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 15:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JvAzOt8wsaOqHP8O58H7Dwlelm81q4xJuqr/GgFxyFg=; b=XfHp+jrHbsMpJC
	+RW3nodcCkpJbCR+ZeoYNVfQMQn2uaLv+grQm5Nj68EuP+fMFC5TiT0zSU47mMfrbwAVI+p9KZ4OI
	KOEXpOrnzGnE59C+2g5rO0a6O15aVosngYdCNhbsZgfnIKV1AMwPOsXKhAW/tNeH+/jN2uQMX0+O/
	pyVu32ASfQW2QnT/0ITLM0XBqM1IUYbzKwCBRb62bBpQm8/zdCLmy7WLORSgn8xgy3QGBFCUcThCX
	bmTy+q749DSAwj+p53WitKuq6lAGmltZSdg+F3wpbbeU74OKTK2aAOPoVDTP9ikW9prfeihBaYVnT
	cRLIDJ6t75AQx/r1EEqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwAR-00000006UCT-0F9Z;
	Wed, 30 Sep 2026 15:24:23 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUB6-00000002xrH-2LKN
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 09:31:14 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hvCbb2Cz8z5B101;
	Tue, 29 Sep 2026 17:31:07 +0800 (CST)
Received: from njy2app01.zte.com.cn ([10.40.12.136])
	by mse-fl2.zte.com.cn with SMTP id 68T9UosI001485;
	Tue, 29 Sep 2026 17:30:51 +0800 (+08)
	(envelope-from sun.wenhan@zte.com.cn)
Received: from mapi (njb2app07[null])
	by mapi (Zmail) with MAPI id mid205;
	Tue, 29 Sep 2026 17:30:53 +0800 (CST)
X-Zmail-TransId: 2aff6abb854def5-521b0
X-Mailer: Zmail v1.0
Message-ID: <20260929173053186td0a5D4tn7cNBN-R8JyEp@zte.com.cn>
In-Reply-To: <c8bd7448-e9f3-72fc-9c91-db0c2525a3a1@kernel.org>
References: 202609220934.68M9Y2eC015972@mse-db.zte.com.cn,c8bd7448-e9f3-72fc-9c91-db0c2525a3a1@kernel.org
Date: Tue, 29 Sep 2026 17:30:53 +0800 (CST)
Mime-Version: 1.0
From: <sun.wenhan@zte.com.cn>
To: <pjw@kernel.org>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <jianjun.wang@linux.alibaba.com>,
        <liu.qingtao2@zte.com.cn>, <lv.yating@zte.com.cn>,
        <guo.chang2@zte.com.cn>, <deng.weixian@zte.com.cn>,
        <hu.yuye@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSByaXNjdjogYWxpZ24gcGNpZSBidXMgYXNzaWduIGxvZ2ljIHdpdGggQVJNNjQ=?=
X-MAIL: mse-fl2.zte.com.cn 68T9UosI001485
X-TLS: YES
X-ENVELOPE-SENDER: sun.wenhan@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 29 Sep 2026 17:31:07 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6ABB855B.000/4hvCbb2Cz8z5B101
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_023112_751943_6C92CCD8 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 30 Sep 2026 08:23:38 -0700
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

RISC-V currently relies on the asm-generic default of
pcibios_assign_all_busses() returning 1, so the kernel always
re-assigns all PCI bus numbers and ignores the bus numbers already
set up by the firmware. This has two downsides.

As UEFI 2.8 has brought mature firmware support to RISC-V servers,
the OS can trust and inherit the PCI bus enumeration done by the
BIOS, skipping a redundant re-enumeration at boot and improving the
boot time.

The unconditional re-assignment also causes bus numbering conflicts
during PCI rescan. When a root port that is not the last one in the
hierarchy is removed and the bus is rescanned, the kernel fails
with:

    pci_bus 0000:01: busn_res: can not insert [bus 01-ff] under
    [bus 00-ff] (conflicts with (null) [bus 02])

Define pcibios_assign_all_busses() the same way as ARM64, so that
RISC-V also preserves the bus numbers assigned by the firmware by
default instead of always re-assigning them. This keeps RISC-V
consistent with the other major architectures.

Signed-off-by: sun wenhan <sun.wenhan@zte.com.cn>
---
 arch/riscv/include/asm/pci.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
index cc2a184cfc2e..b2f91abebd61 100644
--- a/arch/riscv/include/asm/pci.h
+++ b/arch/riscv/include/asm/pci.h
@@ -15,6 +15,11 @@
 #define PCIBIOS_MIN_IO		4
 #define PCIBIOS_MIN_MEM		16

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
