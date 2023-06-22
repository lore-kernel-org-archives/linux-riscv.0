Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36F8EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 22:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tW+hUUZ1xF+T3LEbcsRcoKd+RFdwot7l9y9wXGSxJzQ=; b=4Jt3KRUirPtWuG
	2uIL9k5aXM44GKZLl48lvyJT9H2HIdH3a9tzstBHePrNhIoaRH8ykCcF2oX/Nf/dOkp4EitEHgcDy
	Z9SiXn7VDukJ5b+wwIzdalSkNNApO+xnx7fF1VRf7080KToorlhpb5zGnLWbKxlC8P88B5yZHEuJk
	PM/CS8QkJGbmqbivUqXqAj9lCz1XHSXRbJv2VfCtf9v55JtYanuYEG4wmYiGp3BcXbuJecQOCjmNV
	9gBPZWn16rymW27BJZ7AiD9lPnSi4OdcJluFFuDkuyuiY/UN5Msi7aKaTuXpSb6dhfUMmClga5WaC
	RuU6ywiHpIUNRLlsWxsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCSeF-001wYS-14;
	Thu, 22 Jun 2023 22:19:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCSeC-001wXd-1y
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 22:19:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC96861917;
	Thu, 22 Jun 2023 22:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251F9C433C0;
	Thu, 22 Jun 2023 22:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687472362;
	bh=A9VvNykLz9DrO11Maf8GL49zew+dosNugH7pJY2QwrE=;
	h=From:To:Cc:Subject:Date:From;
	b=e991ei1In0uHAR/xWW6uM623ROOVIugv1+cPXJREVhIX8XswtkIIY0JmxG8Ma1gjG
	 pPdUwHs6N0McwRsdMI5JT10UjBFe9r4zzWGnsdsnqsPRNqMHdtsLrxvwr8WGH1hFDz
	 TnaGikX3ZwvzYJC8YqlbWEvm2WQzciSH+vMO4GDvRy+zU4SXQa990vznphb2uQDaUW
	 4cwoyaSHf6i5VXYi7/bWfucoRAfaG1WT6P/Qir/OBqZ7tEzmQIcJGfisMXrkPp6FWb
	 8DYLTy6N8PCD/FxA4eD3JzSysAPTZbMNRDtlLLhLPF1J3u+MX7M6vlXjjQR8P4k+U+
	 aadjCjNV3IIHA==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: fixup ISA string parser merge conflict
Date: Thu, 22 Jun 2023 23:18:43 +0100
Message-Id: <20230622-smartly-gauntlet-a68b523e2dc3@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2097; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=3trQSbECpghQxSbQGd7W5O6RyNfC698+/q2PvU96QWk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClTTux/+jpIzPHqpxV7cl7sePhRXkBpj2d4uy2TShKn/ 7pL+rHbOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRVzYMv1mcPh1n2BpQdWbP DtmnGkaac8L3XlC9rSbfuyBAx8ZrijTDPx3W52+Enxt0CXt5nS/4Nu9Tt8Nj64+fZdgnisYc+hO qzwkA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_151924_710260_A9BD40BC 
X-CRM114-Status: GOOD (  10.47  )
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

Commit 6589450fa2e3 ("Merge patch series "ISA string parser cleanups"")
has interacted poorly with commit 16252e018a30 ("Merge patch series
"RISC-V: Export Zba, Zbb to usermode via hwprobe""), as there were some
semantic conflicts between the former which added more users of the
"this_isa" bitmap which the latter removed.

Fixes: 6589450fa2e3 ("Merge patch series "ISA string parser cleanups"")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
As promised, feel free to squash ;)
---
 arch/riscv/kernel/cpufeature.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 8ecd6f0af213..bdcf460ea53d 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -131,7 +131,6 @@ void __init riscv_fill_hwcap(void)
 	for_each_possible_cpu(cpu) {
 		struct riscv_isainfo *isainfo = &hart_isa[cpu];
 		unsigned long this_hwcap = 0;
-		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 
 		if (acpi_disabled) {
 			node = of_cpu_device_node_get(cpu);
@@ -162,7 +161,6 @@ void __init riscv_fill_hwcap(void)
 		 */
 		isa += 4;
 
-		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
 		while (*isa) {
 			const char *ext = isa++;
 			const char *ext_end = isa;
@@ -323,8 +321,8 @@ void __init riscv_fill_hwcap(void)
 		 * Linux requires the following extensions, so we may as well
 		 * always set them.
 		 */
-		set_bit(RISCV_ISA_EXT_ZICSR, this_isa);
-		set_bit(RISCV_ISA_EXT_ZIFENCEI, this_isa);
+		set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
+		set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
 
 		/*
 		 * These ones were as they were part of the base ISA when the
@@ -332,8 +330,8 @@ void __init riscv_fill_hwcap(void)
 		 * unconditionally where `i` is in riscv,isa on DT systems.
 		 */
 		if (acpi_disabled) {
-			set_bit(RISCV_ISA_EXT_ZICNTR, this_isa);
-			set_bit(RISCV_ISA_EXT_ZIHPM, this_isa);
+			set_bit(RISCV_ISA_EXT_ZICNTR, isainfo->isa);
+			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
 		}
 
 		/*
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
