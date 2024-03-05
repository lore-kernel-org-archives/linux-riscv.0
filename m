Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79929C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 18:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CAZWxQQh6xl8WMd9QMyBpPz2TgY6/w7Qy7WsYCYpjZo=; b=IEs7CO/LpBKKfL
	HI80tWE9gtXcs2fivdoN86/Vqh6A2+cOZrWw8cUXmPHHxahLWqscIHVQYr0zDfxT271KlBaIhdnLT
	yJLQdOcB+qIscmoDpyxJ3hiLVuT5SNBOWRlUJarN18CZYaPUiTau8pPKhkPnbyu7ki1tz/7xXmCsh
	hQSKoEzpIvjENLbGbzpF4CKIEXt0PtazjEOwFuOgHb7ihL6dWH2MiuqGH8hNTbfBB4mTTz6SuN4zl
	PexxO6rEPfXjIIhqJpK4/oZroPBX5ipWhr97OCLiYYLodMfWBIF7u5lmlMzxSFxk8kqs2U+LxNH7u
	yzANOhqYmCOQ61zBYkFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhZgD-0000000EsgF-3Czg;
	Tue, 05 Mar 2024 18:38:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhZgA-0000000EsdY-2XPZ
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 18:38:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BEEACCE1DF4;
	Tue,  5 Mar 2024 18:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A844C433C7;
	Tue,  5 Mar 2024 18:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709663891;
	bh=Qvezb1qrdamuG9xcPUPJNIpdId4nIvMHCKBp3bs3C8g=;
	h=From:To:Cc:Subject:Date:From;
	b=nV1/mXbRTqzIPYNZBTXlh4VxwKZd0ArbtgsY2WeJBPy3wsA2fL9hj49pJMF7btlcC
	 +M8hoN1p0YtJlko3jR6LD8fvofNJ5Qzg8+kmfajD1MVX00c39ZT5vm0L8HCcRS+gfc
	 asojmmZAl/dXkjOSeA8eeJNklXKkeCGEMO95JgM8319NTrUp15t3DBCmpHXaxgPvf4
	 iFRR+1KtOGDxcGXeek/Pw28gxnP7+A8qq+oTNk7KJawgGOFrxSSuA1eaIVjFVrN9J8
	 DTFVWiBwYA19n2ZkRTD2NXkNG6w4O3zksj/X36WxFIpRu4hGZJtxlmkqo6wRtTpqqf
	 KNMG0GiNVn7oA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] RISC-V: drop SOC_SIFIVE for ARCH_SIFIVE
Date: Tue,  5 Mar 2024 18:37:05 +0000
Message-ID: <20240305-praying-clad-c4fbcaa7ed0a@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=SM7nOTJXX+qrLLcvJVgdRw4VuMgbiO6iZuP9vGJ6kMI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnP0wK/781xqwiKfHr2oYbbxcOP4ybP39nz9mf/osxbf 7XPa9yc0lHKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJXD/E8L9gm5x2R5FURVvY kYPVgql3Z6yfE36gYWdp9oSmJK+/XHMY/kdyfVqbqP/hk2PGcs9Kjp4ZV6evmhL6qdlfd6r7mrp pQYwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_103818_836973_571FF662 
X-CRM114-Status: UNSURE (   8.72  )
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

From: Conor Dooley <conor.dooley@microchip.com>

All the users in the kernel are gone and generated .config files from
previous LTS kernels will contain ARCH_SIFIVE. Drop SOC_SIFIVE and
update the defconfig.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/Kconfig.socs      | 3 ---
 arch/riscv/configs/defconfig | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index e08e91c49abe..e85ffb63c48d 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -14,9 +14,6 @@ config ARCH_RENESAS
 	  This enables support for the RISC-V based Renesas SoCs.
 
 config ARCH_SIFIVE
-	def_bool SOC_SIFIVE
-
-config SOC_SIFIVE
 	bool "SiFive SoCs"
 	select ERRATA_SIFIVE if !XIP_KERNEL
 	help
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 89a009a580fe..ab3bab313d56 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -27,7 +27,7 @@ CONFIG_EXPERT=y
 CONFIG_PROFILING=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_ARCH_RENESAS=y
-CONFIG_SOC_SIFIVE=y
+CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
