Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C85C83005
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 20:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4gDQoCN7eaaouDl+rOQf1zaLI3DtmSU8f6VxuOOXNw=; b=DHnrbJc1Gxv7me
	X470lom550Iahlxz61u3Bf+8NY7Bw8gIJ+GHas8RTkOKcgJOFVrQtyMLtfRw5roN1GGEOHqYtgsK7
	Q/e5ej8Gv9PhisNsdJTnSupHUM7mpK9m1/acPUPIauFt4CO92J4e3nKsoKkwhzdtGzGTz1+3A4W/+
	LgcV8mEPlHfoXF8AW+g2AYv9XNXvH10RFXZfkE7AKBdqa0KL91vWPCp+TflFSElpZq8k7RCRqecAK
	1n3JLZc1YZMzM7jnSR9HfGc9o0uuSf1V/sTob6+0M4Sat++sXhyLtn6cQNK/kGiCxOsWEcQEZ1exj
	XTyzH5hIQ3D7nTV8KRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zlw-0077kg-2P;
	Wed, 07 Jun 2023 20:28:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zlu-0077jz-0i
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 20:28:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CAB4F644BD;
	Wed,  7 Jun 2023 20:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE06C4339B;
	Wed,  7 Jun 2023 20:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686169725;
	bh=0fKSDDjz3zPe0eu/yaZ/RlLyOC+XlCz4Pw01ZOSAsvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rTu8mvzuSW/lmWrT1Anj81+LAJjN/CDIiX6Iv1M47X5+VVlJBeHlCWROlicz/RuN7
	 3ASMq4Rj9WVTLa7lcMeFJX2wDF/GLOKUrBNP8xJYEBQK/WbRstI7dUPiCMWozWqg9j
	 urCR6w0hjUXOt2s8y45BIYUmdiVcIMsoQdivfrPsFZUAxtXnOPzKyjZO5Htzbp0MHZ
	 fYB+fqUniMSdV5UeTjQKfY5lazyz0GglXp6D5lmUpOHvqtnErNLY0LRNxuZ8FjCf/I
	 EP8I/nY7ospA0nEGaqjzzBH/R5vqQaJlzjPtmmcrLJg9Y6lfan/OkIKMGPRlLu3vax
	 ijka5yjkZCKPA==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v3 1/7] RISC-V: simplify register width check in ISA string parsing
Date: Wed,  7 Jun 2023 21:28:25 +0100
Message-Id: <20230607-splatter-bacterium-a75bb9f0d0b7@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607-audacity-overhaul-82bb867a825f@spud>
References: <20230607-audacity-overhaul-82bb867a825f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=wwT8xONix5hYlJl/8OtHK8R3MNUcN/a19lAVTTeA5Lc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkNLzI2ltWpT67dLMN27qTrbmWVi7eSNnTzXt7wSSNkw zon1Sl1HaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIzVaGv/Jl7fv+mNydtTGN 49CNzU7HRScdVel+Fr2naLXN6modGW6Gf+YF+7T3bWS1eLH4bEdbirvr5PImtSAb5XIBla3r2tK f8AAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_132846_305223_DA152693 
X-CRM114-Status: GOOD (  14.23  )
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
index e3324d661fb9..c8635211fc18 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -126,7 +126,6 @@ void __init riscv_fill_hwcap(void)
 	for_each_possible_cpu(cpu) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
-		const char *temp;
 
 		if (acpi_disabled) {
 			node = of_cpu_device_node_get(cpu);
@@ -149,14 +148,14 @@ void __init riscv_fill_hwcap(void)
 			}
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
