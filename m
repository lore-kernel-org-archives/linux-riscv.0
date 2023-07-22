Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074D1C00528
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 06:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIpc2a3UxzzyvRCG5SbkUWJ/ZRlveMxVF3lyeZ0wrU4=; b=Ks6KNAqtXX0M8Z
	WCY3IXJdZfDtAkTR8HrwmyQjDD03uYs7M/VOg4x89iFLwBYlD5+D3VRB/fGHdZccd9aRZmbTR+Six
	rhbtt2KmuwfdKwu44ftSHK3CMW4Qooe3YgjCr/75ukZAcJuavDOpGBsMSpaXdljGaoiYOHqTnYFBS
	/wn3jk/YL8tQUA/xyoAIrC+aYu1KpCXVGPF1wtbnyRLxHo/ADeHeeu+s5wC2+moaSTiXjTD0olCz4
	V26SeBMlu2YakIqO2oPylQacQeFoIYVmHZ9Oxa2qTdxPecZYXguE53GdsFZW9X0VyUq2o7I0ManOj
	a4yMHQ9KLpT0bucR84mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN61C-00FwFv-27;
	Sat, 22 Jul 2023 06:23:06 +0000
Received: from mail-sender.a4lg.com ([153.120.152.154] helo=mail-sender-0.a4lg.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN619-00FwFU-2y
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 06:23:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id B2C86300089;
	Sat, 22 Jul 2023 06:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
	s=2017s01; t=1690006982;
	bh=lUweVX5Fqa2XFTWAwiXQMkEcrDujqhQf2tAAijZNpBE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Transfer-Encoding;
	b=o4rFtO40GUfJB85kq7gWrwTXnK76c41ceuBYJpXtfeuXRf9XUM/UWztuz9nB2hCnF
	 wonC+y0B9enaZdNFVwxSL+RJnouWNbHlQfQ2OgJ33iGRUh68ctx7N5ZNSR8/326P01
	 XTn0cZCql5HRBasBKZ4xOIlFjAEiLeu7K3zY9EAM=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] RISC-V: fix the comment for ISA string workaround
Date: Sat, 22 Jul 2023 06:22:38 +0000
Message-Id: <a7d3db75ba6f3bdd6185ff1574c9a71a14a95126.1690006695.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1690006695.git.research_trasio@irq.a4lg.com>
References: <cover.1690006695.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_232304_106537_817BE1E0 
X-CRM114-Status: GOOD (  13.58  )
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

Extensions prefixed with "Su" won't corrupt the workaround in many
cases.  The only exception is when the first multi-letter extension in the
ISA string begins with "Su" and is not prefixed with an underscore.

For instance, following ISA string can confuse this QEMU workaround.

*   "rv64imacsuclic" (RV64I + M + A + C + "Suclic")

However, this case is very unlikely because extensions prefixed by either
"Z", "Sm" or "Ss" will most likely precede first.

For instance, the "Suclic" extension (draft as of now) will be placed after
related "Smclic" and "Ssclic" extensions.  It's also highly likely that
other unprivileged extensions like "Zba" will precede.

It's also possible to suppress the issue in the QEMU workaround with an
underscore.  Following ISA string won't confuse the QEMU workaround.

*   "rv64imac_suclic" (RV64I + M + A + C + delimited "Suclic")

This fix is to tell kernel developers the nature of this workaround
precisely.  There are some "Su*" extensions to be ratified but don't worry
about this workaround too much.

This commit comes with another minor editorial fix.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 arch/riscv/kernel/cpufeature.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 63277cdc1ea5..91f1ef3e762c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -170,10 +170,11 @@ void __init riscv_fill_hwcap(void)
 			case 's':
 			case 'S':
 				/*
-				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
-				 * No need to set the bit in riscv_isa as 's' & 'u' are
-				 * not valid ISA extensions. It works until multi-letter
-				 * extension starting with "Su" appears.
+				 * Workaround for invalid single-letters 's' & 'u' (QEMU).
+				 * No need to set the bits in riscv_isa as 's' and 'u' are
+				 * not valid ISA extensions. It works unless the first multi-letter
+				 * extension in the ISA string begins with "Su" and not prefixed
+				 * with an underscore.
 				 */
 				if (ext[-1] != '_' && tolower(ext[1]) == 'u') {
 					++isa;
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
