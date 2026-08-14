Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B30C5B572
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0hT//yz5aKRFqdMoROW2znCSonUyiQZG9Ml76lH8PYE=; b=TYi3quVkVFeB+m
	0P5ptyt+MS9yk3C7kqoIrNDRwb0TS5HRSmvkRzyzw6xaS7VbufsCvwDeWJnvX+wS4HVBlF76X7pG4
	KB3BlCgcbZhYV/kAMLgyo0pEvazmXUVJOsNEJn6V1txZYFfmoFBkdZ6pNbfB6dlWHPgboe7bfG3AB
	0G4gnso2TWMxjav6xeAgYki0hUPOcoALIb+rqm2X3C5LGt41TYp/gseFD9In+d7+Noskjc5ZKTaoa
	IQ7BMmimQL6MCSTxePu2RugOUmAL5orhUJmckMhvBjsMUvRbrHMGCRXMmqx65F6GfOKEFJSoELBFd
	44ZTBNv9Nz9qEVaTGVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunHV-00000002HMG-0PA9;
	Fri, 14 Aug 2026 08:28:49 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunHS-00000002HKl-0b2l
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 08:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=aU
	p4toCDNHUBUim2j2yZWOkOE7XI6BPSPqqJrZpDCbE=; b=QUr94w0ex09qcRTXMg
	chJN5PWzESDZdfSPfrqX2B3UBXEzha5X00rJAB5ovZ4XvnUeDrcnQ4bwk0Liozun
	xw37ycomZx8v0EHKnWyW+LOz9hxR0FyAC/HMYPvvN3NQFBPIZqrOgquCS/OxKA0r
	vU/KH4Byt1fSkMJS6N91VDTGA=
Received: from Ubuntu.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3dIl_0X5qdVL2Pg--.57693S2;
	Fri, 14 Aug 2026 16:27:44 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	Klara Modin <klara@kasm.eu>,
	prabhakar.csengg@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiaofengmian@163.com
Subject: [PATCH v5 0/2] riscv: fix text patching on minimal kernel configs
Date: Fri, 14 Aug 2026 08:27:40 +0000
Message-ID: <20260814082742.148403-1-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wD3dIl_0X5qdVL2Pg--.57693S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryfZw18JF1UJr1xKw1ftFb_yoW8Jw4kpr
	WkAw4Yy3y8Xrnay39rCw1qkryYyws7CrWxGF18Jry3Xws5CayUXrn2gw1avF1kG3WY9w47
	uFWSyr93u348t37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-Originating-IP: [39.144.122.80]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbC5gDO0Wp+0YAYTwAA3r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_012846_536262_99027601 
X-CRM114-Status: UNSURE (   9.16  )
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

This series fixes two related issues that break kprobes and kernel text
patching on RISC-V configurations where CONFIG_STRICT_MODULE_RWX is not
available (e.g. CONFIG_MODULES=n).

Patch 1 makes the EXECMEM_KPROBES range writable when
CONFIG_STRICT_MODULE_RWX is disabled, so kprobe instruction slot writes
do not fault on read-only executable pages.

Patch 2 makes patch_map() skip the temporary fixmap mapping when the
kernel text is already writable, i.e. when CONFIG_STRICT_KERNEL_RWX is
disabled. The module text path is still gated on CONFIG_STRICT_MODULE_RWX.

Changes since v4:
- 2/2: gate the kernel text fixmap on CONFIG_STRICT_KERNEL_RWX instead of
  returning early on !CONFIG_STRICT_MODULE_RWX. The v4 early return broke
  configs with CONFIG_MODULES=n, where CONFIG_STRICT_MODULE_RWX is
  unavailable but CONFIG_STRICT_KERNEL_RWX is still enabled and the kernel
  text is read-only, causing a boot-time kernel panic on BPI-F3 and RZ/Five
  (reported by Klara Modin and Lad Prabhakar).

Xiaofeng Yuan (2):
  riscv: mm: make EXECMEM_KPROBES writable without
    CONFIG_STRICT_MODULE_RWX
  riscv: patch: skip fixmap mapping when kernel text is already writable

 arch/riscv/kernel/patch.c | 2 ++
 arch/riscv/mm/init.c      | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
