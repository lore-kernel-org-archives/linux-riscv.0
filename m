Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260ABC53219
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 10:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=14jW9bP/2WVNqmgDc7l04pTo8vbbcvE5uor+diXvH9k=; b=b08ZfAIfDCwIul
	GrqScCeKPNuRpNQNaqrPyzePdglalbCZT6rvIMpey/gB6swTFDwjoX2O0ovlCrSU8yMPgQb/g3u7d
	vzJWy8cgYGNVVhH23QH3HRidc2jJRBd488bqZ2/AiQtGS8FiMHngizWKR2Bc8KBl/uAiYYpCYw3FK
	2A74PEJY415oaP8XXVrEWs8OA7fUyvB8tvLTT3+u0v9KmYXvPLgKupnHNX5xxis371JlxzH29Q54R
	y1N32nrh88IlRpOr97jGOBIbgL/bwFBeMiAL3PqXW/1bPySouV7oO9GGN/umiYxsQfb8g4D5qqwtw
	LSEULKTxeFSkRFHd9iCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIBd-00000002QVa-2IHs;
	Mon, 27 Jul 2026 10:03:53 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIBb-00000002QUj-0FKM
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 10:03:52 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785146626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1JECqE2j+Efv91DAAQek78q3zql2QWbA0frMLUQL9XA=;
	b=qTKGdjcIp9aZF/hclVdp59Sfh/YstssqvApHleialGYVkfPnwTkX7CQhx8pn27QFjuswcl
	3P6YeBfCdo1dFg5bhHIJgIuetkoVy7caoUtN2mAKeaBSsM8owg+0dqGrFqQqWEj3O9upgG
	V+idvuBSIv1hX0xoqCaFRh9h3TGyRNc=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Mark default_power_off() as __noreturn
Date: Mon, 27 Jul 2026 12:03:39 +0200
Message-ID: <20260727100339.410466-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=645; i=thorsten.blum@linux.dev; h=from:subject; bh=5jHu//ywN0BbUZ5M6hodDpm+RJ0bQjtgOxJBAW2OaZg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnpOr/bY6p88tKNbCZOzlu2arv77lssVTe6jjYEffN5+ 7jtio96RykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzkTTcjw+S+owGZLffflpV+ lTQ7bMY+7b9ac5xoWt1heefX562vH2ZkeN+3QSNJVW+W3vEpJZwOyW7J8gdOh2udvNL/ru3Zg91 n+QE=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_030351_249474_A0C2E8ED 
X-CRM114-Status: UNSURE (   7.42  )
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

Since default_power_off() never returns, annotate it with the __noreturn
attribute to improve compiler optimizations.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/riscv/kernel/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index 912288572226..2ae2e724f385 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -6,7 +6,7 @@
 #include <linux/reboot.h>
 #include <linux/pm.h>
 
-static void default_power_off(void)
+static void __noreturn default_power_off(void)
 {
 	while (1)
 		wait_for_interrupt();

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
