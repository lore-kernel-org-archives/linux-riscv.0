Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB82C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 10:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rhn2mWLaN/LFxYPr42eegR/bfFLbWYJEkQNN/MrJanw=; b=wNER/KBnI2GkHq
	QyIq/zFgZw/7+zzmHKTHrkauXiSr9JycWpdPafQn9SZEDj+P6wda8aTIoo5IABntRx406Xi6/RBrC
	RUBU8of1A0JD7zYI0pXAr5f/Yt29NSXVXU51zXp1nIQz2E1jJBPKK0gqw8Rev6Eh2dy8Jy/lIdIaA
	4jT0GZdHqYbT8YBTNh6I893MRTBN5YPCM+ROs7gL7kUN3/1l5ziYxsCzLStF2rQg+KWV6JDbsoF/9
	W5K01t3qJ2QLDWdU5gVIeOdcSlCKPmEFg+axcaWYrN09F/w4JvuTRlbbJhi+9mcAeqxD0TySirTr/
	akEomOP2w7fcYrPiWABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqBiW-0072Hc-Lu; Thu, 25 Nov 2021 10:11:00 +0000
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqBiR-0072E5-Oq
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 10:10:57 +0000
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Authentication-Results: mail-sender-0.a4lg.com;
 dkim=permerror (bad message/signature format)
To: Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 3/4] riscv: cpufeature: Extract extension names from
 "riscv, isa"
Date: Thu, 25 Nov 2021 19:02:54 +0900
Message-Id: <cb0f6782c7b7a3784335f0e4a461bb018ec7c72d.1637834060.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1637834060.git.research_trasio@irq.a4lg.com>
References: <cover.1637834060.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_021055_938698_9BA7BBD4 
X-CRM114-Status: UNSURE (   9.99  )
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

It's possible that we only need extension names implemented but not
version numbers.  This commit doesn't parse version numbers but does
extract implemented extension names.

`ext_end-1` points at the last character of the extension name and
`ext_end-ext` is the length of the extension name.

Beware that the extension name is **not** null-terminated.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 arch/riscv/kernel/cpufeature.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 93b436addd90..61bc326d15b0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -102,6 +102,7 @@ void __init riscv_fill_hwcap(void)
 #endif
 		for (; *isa; ++isa) {
 			const char *ext = isa++;
+			const char *ext_end = isa;
 			unsigned short ext_err = 0;
 			bool ext_long;
 
@@ -115,7 +116,21 @@ void __init riscv_fill_hwcap(void)
 				for (; *isa && *isa != '_'; ++isa)
 					if (!islower(*isa) && !isdigit(*isa))
 						ext_err = 1;
-				/* ... but must be ignored. */
+				/* Find end of the extension name backwards */
+				ext_end = isa;
+				if (ext_err)
+					break;
+				if (!isdigit(ext_end[-1]))
+					break;
+				while (isdigit(*--ext_end))
+					;
+				if (ext_end[0] != 'p'
+				    || !isdigit(ext_end[-1])) {
+					++ext_end;
+					break;
+				}
+				while (isdigit(*--ext_end))
+					;
 				break;
 			default:
 				ext_long = false;
@@ -144,7 +159,7 @@ void __init riscv_fill_hwcap(void)
 			 * TODO: Full version-aware handling including
 			 * multi-letter extensions will be added in-future.
 			 */
-			if (!ext_long && !ext_err) {
+			if (!ext_err) {
 				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
 				if (!ext_long)
 					this_isa |= (1UL << (*ext - 'a'));
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
