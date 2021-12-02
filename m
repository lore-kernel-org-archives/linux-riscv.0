Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCB4C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 01:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMyLxTu1Nuw7ROdEIuLSjm698RHE71shQpHFeNI46xo=; b=3/dCR/991P03ZJ
	QB+Ab2AAHsSrRkdxjrjLl3s5eDeSFrmKcM0du2cNHdnK0IaaAyQdZ3oZBHvBGMY8RSCssl9Cc0Jrn
	3tyXOUaFcyGJGbxVMmjuseoO9gTXNSUgerYl8EGsbAZb4ROAbQot03O05xK3tUXiISoU/uU83/bNq
	PpI6pA0z1Dsbx7aIl/UGh/dHh40AZ7oXftz16OZ0aXHkkd9NEivNsCKL1f/sWqUFJloIJSgCmZAYA
	8TrgHcx+F87v4yFExhFlxZER/5u8rdTNOzHMtIIOj49Dx3//AsbYhgs+CMf9Es2NZmOn3k4C/0bMH
	gCsZfGMYAfgFSC4fPEYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msb6J-00AYIv-Ql; Thu, 02 Dec 2021 01:41:31 +0000
Received: from mail-sender.a4lg.com ([153.120.152.154]
 helo=mail-sender-0.a4lg.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msb69-00AYDt-3w
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 01:41:23 +0000
Received: by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id D7BB330008D;
 Thu,  2 Dec 2021 01:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1638409279;
 bh=7m28+LuBhM5e7rQvW2rS3EYTOsKXkMFFoLQlpkav8Ys=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=csuKorBnghi/vvwRM4ISSgxu8C0NU1ydC2o+xMZ+KtE2W3PSkB/pg7aAVKgm9lZ9/
 yu51To3BARhBS/lCYlm9YkqBzUE2FQfiLBVUJoWKK+F+zBLJxXmFmM2Ct/6SoAkzEP
 4ZdjZbf10PtHqdYTFvNLA3E+TtT4aE2snKTNdKQY=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 4/4] riscv: cpufeature: Full parser for "riscv,
 isa" strings
Date: Thu,  2 Dec 2021 10:41:13 +0900
Message-Id: <531a8daa35d206315367b2997615ee0618b319d6.1638408984.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1638408984.git.research_trasio@irq.a4lg.com>
References: <cover.1638408984.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_174121_446940_C556A33E 
X-CRM114-Status: GOOD (  13.70  )
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

This commit implements full parser for "riscv,isa" strings.

We haven't determined how do we represent multi-letter and/or versioned
extensions in the ISA bitmap yet.  So, this commit handles only single-
letter extensions with no respect to version numbers (as before).

Nevertheless, it can be a foundation for our future work.

Note that major version of UINT_MAX represents non-versioned extension
(in many cases, they should be handled as 1 with some exceptions).

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 arch/riscv/kernel/cpufeature.c | 42 ++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f52e15488a70..a462ceb959d9 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -62,6 +62,22 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+static inline int _decimal_part_to_uint(const char *s, unsigned int *res)
+{
+	unsigned int value = 0, d;
+
+	if (!isdigit(*s))
+		return -EINVAL;
+	do {
+		d = *s - '0';
+		if (value > (UINT_MAX - d) / 10)
+			return -ERANGE;
+		value = value * 10 + d;
+	} while (isdigit(*++s));
+	*res = value;
+	return 0;
+}
+
 void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
@@ -103,7 +119,10 @@ void __init riscv_fill_hwcap(void)
 		for (; *isa; ++isa) {
 			const char *ext = isa++;
 			const char *ext_end = isa;
-			bool ext_long, ext_err = false;
+			unsigned int ext_major = UINT_MAX; /* default */
+			unsigned int ext_minor = 0;
+			bool ext_long, ext_vpair,
+			     ext_err = false, ext_err_ver = false;
 
 			switch (*ext) {
 			case 's':
@@ -115,7 +134,7 @@ void __init riscv_fill_hwcap(void)
 					if (unlikely(!islower(*isa)
 						     && !isdigit(*isa)))
 						ext_err = true;
-				/* Find end of the extension name backwards */
+				/* Parse backwards */
 				ext_end = isa;
 				if (unlikely(ext_err))
 					break;
@@ -123,13 +142,21 @@ void __init riscv_fill_hwcap(void)
 					break;
 				while (isdigit(*--ext_end))
 					;
-				if (ext_end[0] != 'p'
-				    || !isdigit(ext_end[-1])) {
+				ext_vpair = (ext_end[0] == 'p')
+					    && isdigit(ext_end[-1]);
+				if (_decimal_part_to_uint(ext_end + 1,
+							  &ext_major))
+					ext_err_ver = true;
+				if (!ext_vpair) {
 					++ext_end;
 					break;
 				}
+				ext_minor = ext_major;
 				while (isdigit(*--ext_end))
 					;
+				if (_decimal_part_to_uint(++ext_end, &ext_major)
+				    || ext_major == UINT_MAX)
+					ext_err_ver = true;
 				break;
 			default:
 				ext_long = false;
@@ -137,9 +164,12 @@ void __init riscv_fill_hwcap(void)
 					ext_err = true;
 					break;
 				}
-				/* Find next extension */
+				/* Parse forwards finding next extension */
 				if (!isdigit(*isa))
 					break;
+				_decimal_part_to_uint(isa, &ext_major);
+				if (ext_major == UINT_MAX)
+					ext_err_ver = true;
 				while (isdigit(*++isa))
 					;
 				if (*isa != 'p')
@@ -148,6 +178,8 @@ void __init riscv_fill_hwcap(void)
 					--isa;
 					break;
 				}
+				if (_decimal_part_to_uint(isa, &ext_minor))
+					ext_err_ver = true;
 				while (isdigit(*++isa))
 					;
 				break;
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
