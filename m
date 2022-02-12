Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A657C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Feb 2022 06:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gNS/LXGwvZ0s5LQfH8mKJT9Is98yq2aiDg8ZWigmmo=; b=WUIspJD1NetuQo
	WWJTRqF1LQNP8I0Kaxk3Zpv+Fwg1tz9XfOkq3gVcDqiV0Y8Qhm0wJ5FqzGtEt+Ilke1MxZEbU4C5l
	OiVjdJZ/8tR5OrpdlTfLjpoc/kRYzmeVXe1HOLi86IKQ3OpuqKpDrhJLfB0WoaTFs2Bs1/ZaxfthZ
	D74d4v6KS7zQ8ESlY0ow05Mr8eEGHZ92fR+/jw8mCB6nEZ8eWxjF2Aw57sEgBG2SrKAypXsauBDdw
	v4O4Vba0x4ypie1oa+Zu7YZ4l8tvuOHwNY8SD7osYHNI9Ab0cH3AyW4UXoema4R2p+XC5UhKETrBc
	ezcpkzLAGtfVkgqZ+Prw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIlvQ-009UjL-Df; Sat, 12 Feb 2022 06:30:28 +0000
Received: from mail-sender.a4lg.com ([153.120.152.154]
 helo=mail-sender-0.a4lg.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIlvN-009Ui8-Iu
 for linux-riscv@lists.infradead.org; Sat, 12 Feb 2022 06:30:27 +0000
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Authentication-Results: mail-sender-0.a4lg.com;
 dkim=permerror (bad message/signature format)
To: Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 3/3] RISC-V: Extract multi-letter extension names from
 "riscv, isa"
Date: Sat, 12 Feb 2022 15:30:01 +0900
Message-Id: <7677a6ab686d9edcb0c09b56d8323c76008ea8a5.1644647398.git.research_trasio@irq.a4lg.com>
In-Reply-To: <ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com>
References: <ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_223025_772875_17D79817 
X-CRM114-Status: UNSURE (   8.93  )
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

Currently, there is no usage for version numbers in extensions as
any ratified non base ISA extension will always at v1.0.

Extract the extension names in place for future parsing.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
[Improved commit text and comments]
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 38 ++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 9d5448542226..cd9eb34f8d11 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -119,9 +119,28 @@ void __init riscv_fill_hwcap(void)
 				ext_long = true;
 				/* Multi-letter extension must be delimited */
 				for (; *isa && *isa != '_'; ++isa)
-					if (!islower(*isa) && !isdigit(*isa))
+					if (unlikely(!islower(*isa)
+						     && !isdigit(*isa)))
 						ext_err = true;
-				/* ... but must be ignored. */
+				/* Parse backwards */
+				ext_end = isa;
+				if (unlikely(ext_err))
+					break;
+				if (!isdigit(ext_end[-1]))
+					break;
+				/* Skip the minor version */
+				while (isdigit(*--ext_end))
+					;
+				if (ext_end[0] != 'p'
+				    || !isdigit(ext_end[-1])) {
+					/* Advance it to offset the pre-decrement */
+					++ext_end;
+					break;
+				}
+				/* Skip the major version */
+				while (isdigit(*--ext_end))
+					;
+				++ext_end;
 				break;
 			default:
 				if (unlikely(!islower(*ext))) {
@@ -131,6 +150,7 @@ void __init riscv_fill_hwcap(void)
 				/* Find next extension */
 				if (!isdigit(*isa))
 					break;
+				/* Skip the minor version */
 				while (isdigit(*++isa))
 					;
 				if (*isa != 'p')
@@ -139,20 +159,20 @@ void __init riscv_fill_hwcap(void)
 					--isa;
 					break;
 				}
+				/* Skip the major version */
 				while (isdigit(*++isa))
 					;
 				break;
 			}
 			if (*isa != '_')
 				--isa;
-			/*
-			 * TODO: Full version-aware handling including
-			 * multi-letter extensions will be added in-future.
-			 */
-			if (ext_err || ext_long)
+
+			if (unlikely(ext_err))
 				continue;
-			this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
-			this_isa |= (1UL << (*ext - 'a'));
+			if (!ext_long) {
+				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
+				this_isa |= (1UL << (*ext - 'a'));
+			}
 		}
 
 		/*
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
