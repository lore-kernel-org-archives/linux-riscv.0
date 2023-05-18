Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30F3C7EE2F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 22:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++TlDcXbi7BcyPtGNHAEckrL02bilY5T54eHMKne6Vg=; b=N9St1y0+wiFF27
	KWd+azZECrcNiqd6Bcusno0NfbLeJ294Rz1tG8kYA73tcdiQXSG0+0XQqDuhVuseBDGDvWF7K4oc4
	cK/YXHc9Lj0mqNGphK9kRczYvMpRTB03oe93CIL/GZGwFicUoUO41QaTGVSAj1wXwDInI9qIicQeH
	8vATTCu3L/k/HvaJ+I9bBTV8EhwZ9krxKXY6jy7hNvw3PyCPuIZvdNBUwVbLkkzc8W8OuNL//oOUI
	v0MtFMQr7GdcPOrCs5UcG+Y2ojyMOK3ODkj7+qNRqZc1yWGTGSVFdVmLcFWKYK6CDdKyziYLtG2Fd
	zDqlEE1jEkaKGiyNL71A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmI4-00ENMM-0h;
	Thu, 18 May 2023 22:40:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmI0-00ENLO-0b
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 22:40:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C6F7B65290;
	Thu, 18 May 2023 22:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEF2C433D2;
	Thu, 18 May 2023 22:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684449603;
	bh=0iyL9k1Jaj64q4oxVb6SvqoQrp+wDnfG/2eO7QyZsgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=orfkk0dIDs0uERDJ62xbr2p1Pks35ZbpWpfqb2RMnxs2lSeqTYO6DOdWxnJhcq6HW
	 f2UHqN1EGUfz4pXXjVX1ksqKyKUS27qJ5Si5LUG15IdA2W6OQPEVEzWm/Pl/vWvTmA
	 7JPP7Fm+938J1ddpX9Y7MWkNWFBeKICZkxkKU4TLxotii9dHrGQDvA0HZ7L9LkYCOe
	 JyvnGYYdHIsiy2a+MJQjSL21bVjnOzH4TC/mGA5aSNMUceI9KD3NI7QvBw+2steXcD
	 dLH7wA/oEAwNggef6MVjV4j91ahlSlYaRWyevbqS3qDAHKp7YFM2oeo+NAWY3pFfRb
	 NT5fzpqjCTRCQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v2 1/8] RISC-V: simplify register width check in ISA string parsing
Date: Thu, 18 May 2023 23:39:02 +0100
Message-Id: <20230518-resale-slashing-b84875213dc6@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518-moneybags-rebalance-1484db493d6a@spud>
References: <20230518-moneybags-rebalance-1484db493d6a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Aq4T7VznL+Hvu6R8rvm8DMqHfewRhohUdvadLXgTZkI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClpK9nzj3nY7C1eue77v6tXvRbpWN2a/Xf240tsDa+FR A1nZ8c5dJSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiG1kY/inJ9VxKXVcalBar cTRF68W0V1stn0tIM/1d/OZ+heN6NiOG/yW2nRcqn3Dy3Ff9LeN3U1baSu2vrtZkmxcqZ7eUvol 6xggA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_154004_260851_827AC756 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Saving off the `isa` pointer to a temp variable, followed by checking if
it has been incremented is a bit of an odd pattern. Perhaps it was done
to avoid a funky looking if statement mixed with the ifdeffery.

Now that we use IS_ENABLED() here just return from the parser as soon as
we detect a mismatch between the string and the currently running
kernel.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index cb32658180da..00df7a3a3931 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -115,7 +115,6 @@ void __init riscv_fill_hwcap(void)
 	for_each_of_cpu_node(node) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
-		const char *temp;
 
 		rc = riscv_of_processor_hartid(node, &hartid);
 		if (rc < 0)
@@ -126,14 +125,14 @@ void __init riscv_fill_hwcap(void)
 			continue;
 		}
 
-		temp = isa;
-		if (IS_ENABLED(CONFIG_32BIT) && !strncasecmp(isa, "rv32", 4))
-			isa += 4;
-		else if (IS_ENABLED(CONFIG_64BIT) && !strncasecmp(isa, "rv64", 4))
-			isa += 4;
-		/* The riscv,isa DT property must start with rv64 or rv32 */
-		if (temp == isa)
+		if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32", 4))
 			continue;
+
+		if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64", 4))
+			continue;
+
+		isa += 4;
+
 		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
 		for (; *isa; ++isa) {
 			const char *ext = isa++;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
