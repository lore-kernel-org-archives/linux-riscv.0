Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ADFC04A95
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P2vUTN7O4R2C/bMXZyH9/lzoLCZsWs6MU06k+6qBfSE=; b=nHHp1aUDlH83yb
	6Jd0GpOHoQIUG71Orx1FT3dOGR+IpTNlFemlbD3PqlhEdNkaQOtOGdGvwEPnHffLna+YcFlE4ikNP
	3mfQkH+unyYQvnuKpSZSKg7vuzWK84YZGe4A8WS4wi24gmq0H56NbutmbPm2kkoMiVYg0Z95/56i1
	ArAHOcO8tM17Whr8GQfpxKQQ5c5qF6sAaXxICy3d8ZPJBNCihD9UmPo0p7PQwjY9ma478XbqRjkiY
	FO7lzTmLhLNYY/+C74a6YXB6p6u7pjf9cPG2sUugCTYp41FSmUvOA7CnNo9rGWTPf4wsd5+r2YtPz
	qz+ZAhPpeRK+jT1jlC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnsc-005RPY-Iv; Fri, 23 Sep 2022 18:58:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obns0-005Qo7-8o
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3DB561EBD;
	Fri, 23 Sep 2022 18:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465A4C433D7;
	Fri, 23 Sep 2022 18:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959471;
	bh=yXC2j3Vix5LkO9bZ4oc4ylLAEAeBsGDDV0shgoGVr9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n6bde8GbKM+SVMINP6H2fNrIGftCa92VCrKZB6LVzQXzmsGGLGfzTCQGeXZU0AZeA
	 3R2sBp1Xb2gewpiNN08RWcjejuiZZtvIGA/Xl8kqyK+9nXXrKvtUqNPc5v4qLVySBD
	 10Fc7PTj4lczC/R9dZ46FITPmbkkvqhochCN50gHCg8jHQB0fWRT+40oIdHd7QFJAO
	 dETqYaSAMuXdht48opSxuSNCbwhMNHZxLPMWO5gEBdT1iCL8y8UyVna9qL6GOJb5j9
	 Vo1c4upwreuLlHL6cIkVtdW+fLVrZg7YZaD4UJeZjo9ikFQgyDI6QuF5ud0HxeHqbZ
	 A3r92XaZsAb6A==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 19/27] kunit: tool: rename SOC_VIRT to ARCH_VIRT in riscv's QEMU config
Date: Fri, 23 Sep 2022 19:55:58 +0100
Message-Id: <20220923185605.1900083-20-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115752_382746_5342AB2D 
X-CRM114-Status: GOOD (  10.62  )
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

From: Conor Dooley <conor.dooley@microchip.com>

At LPC we decided to convert all of the SOC_ symbols in arch/riscv to
ARCH_ for consistency between "incumbent" vendors and those with a
legacy from other architectures. To that end, swap SOC_VIRT for
ARCH_VIRT.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 tools/testing/kunit/qemu_configs/riscv.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/kunit/qemu_configs/riscv.py b/tools/testing/kunit/qemu_configs/riscv.py
index 6207be146d26..ab24b5b1be38 100644
--- a/tools/testing/kunit/qemu_configs/riscv.py
+++ b/tools/testing/kunit/qemu_configs/riscv.py
@@ -17,7 +17,7 @@ if not os.path.isfile(OPENSBI_FILE):
 
 QEMU_ARCH = QemuArchParams(linux_arch='riscv',
 			   kconfig='''
-CONFIG_SOC_VIRT=y
+CONFIG_ARCH_VIRT=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
