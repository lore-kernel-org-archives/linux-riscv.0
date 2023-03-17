Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2BBC6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 13:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T8n2syNvNf45D6G8zPYnyh+bO2hfbsSLljzxOeb6bLI=; b=U+O/jFkHSWe9O8
	LgwEYu+iJqpVjTOf1CEzp+TNXVhA9CGKCcd3i8IH8d8zwUW2fzeiiqi17TqAwtq1lJB5GdC04ohoD
	LpZVpLwVdSlcXrOgyzsNdr6/wUUTQV/p4vXfTFqQJnXcYDm2Odu8sODYClAE9OYjM6Wp9JAxXq8cG
	uNp73Hx+HuonnF7j06QAs7+VMeIaZS1czQw2xIN7yYJJ9bjNVTbBu3zMRkkQ7GNJXvWfae3n7Fkm2
	g2HP+objmVGy56Cp2JQ+3L56p6C/9RaNhYTD7JG1YO+7k4YiRML33xDquZ94Wxhev4M/VSiMGqXgI
	0zYYbIZ2JL/gV9JN9TaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdAOZ-002Mv1-0R;
	Fri, 17 Mar 2023 13:45:23 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdAOV-002Mtp-2W
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 13:45:21 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pdAOP-001qkk-C0; Fri, 17 Mar 2023 13:45:13 +0000
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1pdAOO-0014F6-3C;
	Fri, 17 Mar 2023 13:45:12 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	conor.dooley@microchip.com,
	atishp@rivosinc.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] riscv: say disabling zicbom if no or bad riscv,cbom-block-size found
Date: Fri, 17 Mar 2023 13:45:12 +0000
Message-Id: <20230317134512.254627-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_064519_821871_ED57084B 
X-CRM114-Status: GOOD (  10.59  )
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

If Zicbom is present but there was no riscv,cbom-blocks-size property found
during the cpu feeatures probe, or the cbom-block-size is not valid, then
the extension will be disabled. Make the print explicitly say this is
disabled to ensure that there is no confusion about what is being done.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kernel/cpufeature.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 59d58ee0f68d..c8b883827840 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -72,10 +72,10 @@ static bool riscv_isa_extension_check(int id)
 	switch (id) {
 	case RISCV_ISA_EXT_ZICBOM:
 		if (!riscv_cbom_block_size) {
-			pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
+			pr_err("Zicbom detected in ISA string, disabling as no cbom-block-size found\n");
 			return false;
 		} else if (!is_power_of_2(riscv_cbom_block_size)) {
-			pr_err("cbom-block-size present, but is not a power-of-2\n");
+			pr_err("Zicbom disabled as cbom-block-size present, but is not a power-of-2\n");
 			return false;
 		}
 		return true;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
