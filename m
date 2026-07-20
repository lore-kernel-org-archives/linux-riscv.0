Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA87C44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 03:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LynE5FDwrMdaiy9oUo54S4TF+kss6iZvQ180P0a1Y8=; b=HcOrxV3jhDrrYp
	Hji3A733atZr1U9h7lsSNUpygShVTrP3+fmOU39JlFApe7o9ute/WSh0cYO2knhjhBwM1Difn+W5B
	4rlo0+2BunDgeQRQqJ7IGQFhaC9yMQak2vLXuXAW5lwni9+v+7+EUT0qMTotY2882EbiDPTMhcDp0
	1WbCrGs9b0Hy9ODiBQ+k090w1cz2xxT+nsLSXGgZ0UoVRxq5SLjnOiOFLdQ2LJQH6L86nMo7Kiq4R
	zTActNLDDhIXohsx5Z/vnKpDiCxEDfaOY+r1rT3hqMPK5qBPiEoTgXBLfFi+5meCCK4TH/2gBgtDy
	zgVDQPOUb0gsCAmCeEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlebh-00000005l0F-3xfI;
	Mon, 20 Jul 2026 03:23:53 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlebe-00000005kyV-2uOj
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 03:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=CQ
	bEMG8C6NQudrZtH6JGNGhbxssqV+FTapBCimwsn+Q=; b=J2Mzkjz/31UW6MGAf0
	5uv8veLaUDyDenbNUovT/xUqMzwiYoIqg1EnK5N96yV1GZbYWBJc/y7VO1GtvZfy
	NmkTGPIWEE4IZKCsUW9ypTudj881tdAj+OcSOPkhxvLqGz55psvWJqBJ0dHeoRQN
	i+s1wFnPOtoXryP7b45XnpTTM=
Received: from Ubuntu.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBH+wKTlF1qrd2XIg--.2654S3;
	Mon, 20 Jul 2026 11:23:01 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiaofengmian@163.com
Subject: [PATCH v4 1/2] riscv: mm: make EXECMEM_KPROBES writable without CONFIG_STRICT_MODULE_RWX
Date: Mon, 20 Jul 2026 03:22:56 +0000
Message-ID: <20260720032258.5188-2-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720032258.5188-1-xiaofengmian@163.com>
References: <20260720032258.5188-1-xiaofengmian@163.com>
MIME-Version: 1.0
X-CM-TRANSID: PigvCgBH+wKTlF1qrd2XIg--.2654S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Xw43Cw1DJF43uF15XrWrZrb_yoW8JrW5pr
	ZrAr45ZFZ7Xr4Yk3y7u3y8ur4DAanIya13Jw1jyryYq3yjy390qr95Zr1xXry8WF1Uuayx
	ZFna9r93Aayjka7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi7UUUUUUUU=
X-Originating-IP: [223.104.164.77]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbDARU8P2pdlJU6HwAA3E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_202351_376019_054BDE3D 
X-CRM114-Status: UNSURE (   6.33  )
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

When CONFIG_STRICT_MODULE_RWX is not set, execmem cannot create
temporary writable mappings for read-only executable pages. In this
case, the execmem ranges must already have writable permissions.

Currently EXECMEM_KPROBES unconditionally uses PAGE_KERNEL_READ_EXEC,
which causes kprobe instruction slot writes to trigger page faults
on systems where CONFIG_STRICT_MODULE_RWX is not enabled.

Fix this by using PAGE_KERNEL_EXEC when CONFIG_STRICT_MODULE_RWX
is not available.

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
v2: use CONFIG_STRICT_MODULE_RWX instead of CONFIG_ARCH_HAS_EXECMEM_ROX (per Nam Cao's review)
v3: add commit description
v4: fix indent alignment (per Nam Cao's review)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5b1b3c88b4..7951d72a12 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1457,7 +1457,9 @@ struct execmem_info __init *execmem_arch_setup(void)
 			[EXECMEM_KPROBES] = {
 				.start	= VMALLOC_START,
 				.end	= VMALLOC_END,
-				.pgprot	= PAGE_KERNEL_READ_EXEC,
+				.pgprot	= IS_ENABLED(CONFIG_STRICT_MODULE_RWX) ?
+					  PAGE_KERNEL_READ_EXEC :
+					  PAGE_KERNEL_EXEC,
 				.alignment = 1,
 			},
 			[EXECMEM_BPF] = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
