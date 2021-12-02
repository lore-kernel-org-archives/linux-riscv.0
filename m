Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B2AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 01:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fyrMf/r2u4pzVoEulCFFNGgTnEcxmlGApGAji5atjDs=; b=WDs9bIFdOHBY9r
	3xuZd3oddtgx/GAimlm2Jj6rIU4nppmFXp4R991D5nV/ZbKSfHbf+fOct5wlL0zgaYSl3tPgtNIcF
	hvGBoNnqyo2B7nyNNOSPlz4mGD1BtO2FS+o0zYwBH4SzsBS0cVKJ2yHYCw9SKaje2DImdDdKQuJRY
	p3pGW+l6xQor8dpS39IpH8GW9Cd9nG9MkL5Drlyi5kCQmr7jEJKEk4DCNOTtIbZc7T0QDC5jcFiz2
	Q4UScZbEYNWWUAGUupvJ9v2YLNV3gIe4sDo5/N11BH5NCbvZaU7RxjKOS8V5WejEiOtlCCGa7v5i1
	wo8ajsiWNd3PyhczCAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msb6H-00AYHg-QA; Thu, 02 Dec 2021 01:41:29 +0000
Received: from mail-sender.a4lg.com ([153.120.152.154]
 helo=mail-sender-0.a4lg.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msb69-00AYDr-3y
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 01:41:22 +0000
Received: by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 8562430008C;
 Thu,  2 Dec 2021 01:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1638409278;
 bh=tCMBtDoyFd+IH9AraQVrUP8QPKlxc09CeUEG/VxdJsg=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=LlGb91mI06Lq9AR7g4wpjb3Izl6Iocj8RUy6u1oFe8QBTUnPBh5teKOK2bby4kFZW
 Um2ArvC3zQIqUwvC4yiWL7SUAQckPV4l0VbKnrko5XSFHgTaHnRHjPzMA18kGnk0Ia
 pGdmhrfppoa0KXsO+iTFq6qi6GyaqIbV9DojC0SI=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 3/4] riscv: cpufeature: Extract extension names from
 "riscv, isa"
Date: Thu,  2 Dec 2021 10:41:12 +0900
Message-Id: <b89e73d6a178d04e447ae9d142477731b1f8998d.1638408984.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1638408984.git.research_trasio@irq.a4lg.com>
References: <cover.1638408984.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_174121_323795_F269DAA6 
X-CRM114-Status: GOOD (  11.36  )
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

Beware that the extension name is **not** null-terminated.

Use `MATCH_EXT` macro to match extension name (the argument is
lower-case constant string).

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 arch/riscv/kernel/cpufeature.c | 35 +++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d4ff704db53b..f52e15488a70 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -102,6 +102,7 @@ void __init riscv_fill_hwcap(void)
 #endif
 		for (; *isa; ++isa) {
 			const char *ext = isa++;
+			const char *ext_end = isa;
 			bool ext_long, ext_err = false;
 
 			switch (*ext) {
@@ -111,13 +112,28 @@ void __init riscv_fill_hwcap(void)
 				ext_long = true;
 				/* Multi-letter extension must be delimited */
 				for (; *isa && *isa != '_'; ++isa)
-					if (!islower(*isa) && !isdigit(*isa))
+					if (unlikely(!islower(*isa)
+						     && !isdigit(*isa)))
 						ext_err = true;
-				/* ... but must be ignored. */
+				/* Find end of the extension name backwards */
+				ext_end = isa;
+				if (unlikely(ext_err))
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
-				if (!islower(*ext)) {
+				if (unlikely(!islower(*ext))) {
 					ext_err = true;
 					break;
 				}
@@ -138,14 +154,15 @@ void __init riscv_fill_hwcap(void)
 			}
 			if (*isa != '_')
 				--isa;
-			/*
-			 * TODO: Full version-aware handling including
-			 * multi-letter extensions will be added in-future.
-			 */
-			if (ext_err || ext_long)
+
+#define MATCH_EXT(name)  (ext_end - ext == sizeof(name) - 1 \
+			  && !memcmp(ext, name, sizeof(name) - 1))
+			if (unlikely(ext_err))
 				continue;
 			this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
-			this_isa |= (1UL << (*ext - 'a'));
+			if (!ext_long)
+				this_isa |= (1UL << (*ext - 'a'));
+#undef MATCH_EXT
 		}
 
 		/*
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
