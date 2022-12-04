Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA38C4321E
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YE2UfehE1qVSXiALafVPzoBOiYAx4LNe0bdffhiEacg=; b=srsTsx6TAyy5/z
	4atLJ2tP4ud6/tQkffs0rXQFjG6Old59aUZvPt4p11iZXsuAoRki7si9tDeilRWkNqcP3zPLyTmOZ
	74E2NWIM/h1KS7AtZYGbcfNWDlQ9bq2hOWg8e0ySXf7BsDCpP8bzrjrK/1Ud7ARVMKcT0wmAKxnw/
	hBa9R7hp6EOO5kisCAnyRwKvONBGCkXSwpePDR4V8/b0GjAeMazmqk7mJNpV1BZUyknhndYWcks5m
	MYh7Oii2Cs55Y8H4+of/4kTFdxcM9cQslWrN9WEs/cpNlLI4iTCaLVWcOH1PE4fHGAvdfSGdU8/2e
	QAePRQlhcZL6MfUQ0LXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tHW-00A7Qw-G2; Sun, 04 Dec 2022 18:00:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tEB-00A6a6-KC; Sun, 04 Dec 2022 17:56:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DE90260EDC;
	Sun,  4 Dec 2022 17:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AE3C433C1;
	Sun,  4 Dec 2022 17:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670176594;
	bh=fe+rWTyCxIwY8YD8KSMdWS0pSxqRhYgvbXdkNjgs9OY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qlkv4uXf3AD/XR9sC10WHAIjCMtDerWOO6CkKtbUWHyNS4ujHHfTJrXzdCGqnEoP7
	 22hCY4ESqYcZvC3NRNNGz+NfuKXs0a2C9t0v2U5cZ1TlQ3V8kWrdjDvBd85HqzYSlz
	 T3XYOuoDkl0XfFcicx+JBJy/aQg31bH9lbPmxlNApP+v1HuDafLEcr9aV71NKCdaj+
	 AzELuwk7YPPY7XZ/VoYUq+0soK3cTAGA/oZH2ZuySnBPENe2w1HUlsqtqw3vE/xeNc
	 6nx2wktQUufPGMOLw81Fw3zeqAW3E2TG7D43NFk9H6Vwa2ajACgm+qcc17xeVtL3K5
	 112P9BeASq84g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 02/13] riscv: move riscv_noncoherent_supported() out of ZICBOM probe
Date: Mon,  5 Dec 2022 01:46:21 +0800
Message-Id: <20221204174632.3677-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221204174632.3677-1-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_095635_717984_FAEAEE94 
X-CRM114-Status: GOOD (  11.43  )
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

It's a bit weird to call riscv_noncoherent_supported() each time when
insmoding a module. Move the calling out of feature patch func.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 1 -
 arch/riscv/kernel/setup.c      | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c743f0adc794..364d1fe86bea 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -274,7 +274,6 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
 	if (!riscv_isa_extension_available(NULL, ZICBOM))
 		return false;
 
-	riscv_noncoherent_supported();
 	return true;
 }
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 86acd690d529..6eea40bf8c6b 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -300,6 +300,8 @@ void __init setup_arch(char **cmdline_p)
 	riscv_init_cbom_blocksize();
 	riscv_fill_hwcap();
 	apply_boot_alternatives();
+	if (riscv_isa_extension_available(NULL, ZICBOM))
+		riscv_noncoherent_supported();
 }
 
 static int __init topology_init(void)
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
