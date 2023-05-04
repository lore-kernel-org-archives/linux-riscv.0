Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463A0C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 18:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iy+xjypgiqNQIdE0ltygqM8zJH3WGY5VU51CaW9yQZw=; b=RvlhPyqum6o++L
	3Mi6G29RXyxwrkLVJ/DxW8K1S4iFbLIro+jy8X9A7CHBr0jpJSr2JX21vf5NpJV4hyDvRkKdlw+8r
	rCxQDBj1pevVFmJBtG5RmF5+nFvVBRWBcOpevQPAfZ4YjntCzvGlo+S+dHhdro05nLAW+F4unv9vK
	YdrFYM8GivOc2w/LKUqQTwm9eBdfWIV5MUSpzvO+O9G0AQFGFxgPouAbG7Zn719Pv5zQQf6bphBa8
	cmN1CNFz5ATun3Su1zmRfbkLRXsm8FhS5zqd2Qi6o/Yop0QBhaj7fIfsLa/6Fd6B62vPmDwtdddis
	bsLJGYTjsXvDEMUQvfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUX-008VSr-00;
	Thu, 04 May 2023 18:15:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUU-008VRq-1r
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 18:15:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1E57D63582;
	Thu,  4 May 2023 18:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7B2C4339B;
	Thu,  4 May 2023 18:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683224141;
	bh=TvakAFbPcrD7hCAm+Dg/e0/oiiwwCFYHsXJHt4QwDVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aYV8cmJ1Nnhh/W+VHZmFjvwGW8ajy5UhBaGSd4K9KMTU1m6WEd22OZhJwTmWLCiUS
	 /U47uDUQP3thiwl/0X7ZtePbL+S4zjkN2WPV5yPwQ+x2mdxxCs90pUJshkoFkczN/v
	 DZtwEPSIbnbiDu2NB7rhWgiz8ziid6xaVk9udcUah6kT8kZ4GhB5o+HrPZz+YuaOfH
	 kc3pZSiVN80atvP/0wPQYuPNJ0HYlWBxpHL9LgmkWQj0Hs+rtVbfXE1KVohmfLX6rb
	 SpnoXIy/NFeHXG8WuP3TQKZZ7RO68D8aqChYHrh69IyDI9gGrAzB6biJwaAtVf5ro7
	 CiGROdaUwKlhQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v1 5/7] RISC-V: rework comments in ISA string parser
Date: Thu,  4 May 2023 19:14:24 +0100
Message-Id: <20230504-never-childlike-75e2ce7e50d8@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4630; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=tEHbqETiBb82U3DYdAGcDcmKm/YUwFV3nz4D77zk+xA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnBX/8FOB89s3/6Pg6x5TZTo7U3ZxXKFLhecdTK7E+fI 91RH2rZUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgImYnWNkmBj0WG/eIoaSG7vY 8tznzfxw+J/wggmtak+axIQFZ+++vYnhn4FiQmuD/3xfO/WYHIO1Xd1BrXr+4vF/iyzKD7U62cU wAQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_111542_685979_DD7AA688 
X-CRM114-Status: GOOD (  23.81  )
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
Cc: conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

I have found these comments to not be at all helpful whenever I look at
the parser. Further, the comments in the default case (single letter
parser) are not quite right either.
Group the comments into a larger one at the start of each case, that
attempts to explain things at a higher level.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 71 ++++++++++++++++++++++++++++------
 1 file changed, 60 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index a79c5c52a174..2fc72f092057 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -146,7 +146,7 @@ void __init riscv_fill_hwcap(void)
 
 			switch (*ext) {
 			case 's':
-				/**
+				/*
 				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
 				 * No need to set the bit in riscv_isa as 's' & 'u' are
 				 * not valid ISA extensions. It works until multi-letter
@@ -163,53 +163,102 @@ void __init riscv_fill_hwcap(void)
 			case 'X':
 			case 'z':
 			case 'Z':
+				/*
+				 * Before attempting to parse the extension itself, we find its end.
+				 * As multi-letter extensions must be split from other multi-letter
+				 * extensions with an "_", the end of a multi-letter extension will
+				 * either be the null character as of_property_read_string() returns
+				 * null-terminated strings, or the "_" at the start of the next
+				 * multi-letter extension.
+				 *
+				 * Next, as the extensions version is currently ignored, we
+				 * eliminate that portion. This is done by parsing backwards from
+				 * the end of the extension, removing any numbers. This may be a
+				 * major or minor number however, so the process is repeated if a
+				 * minor number was found.
+				 *
+				 * ext_end is intended to represent the first character *after* the
+				 * name portion of an extension, but will be decremented to the last
+				 * character itself while eliminating the extensions version number.
+				 * A simple re-increment solves this problem.
+				 */
 				ext_long = true;
-				/* Multi-letter extension must be delimited */
 				for (; *isa && *isa != '_'; ++isa)
 					if (unlikely(!isalnum(*isa)))
 						ext_err = true;
-				/* Parse backwards */
+
 				ext_end = isa;
 				if (unlikely(ext_err))
 					break;
+
 				if (!isdigit(ext_end[-1]))
 					break;
-				/* Skip the minor version */
+
 				while (isdigit(*--ext_end))
 					;
-				if (tolower(ext_end[0]) != 'p'
-				    || !isdigit(ext_end[-1])) {
-					/* Advance it to offset the pre-decrement */
+
+				if (tolower(ext_end[0]) != 'p' || !isdigit(ext_end[-1])) {
 					++ext_end;
 					break;
 				}
-				/* Skip the major version */
+
 				while (isdigit(*--ext_end))
 					;
+
 				++ext_end;
 				break;
 			default:
+				/*
+				 * Things are a little easier for single-letter extensions, as they
+				 * are parsed forwards.
+				 *
+				 * After checking that our starting position is valid, we need to
+				 * ensure that, when isa was incremented at the start of the loop,
+				 * that it arrived at the start of the next extension.
+				 *
+				 * If we are already on a non-digit, there is nothing to do. Either
+				 * we have a multi-letter extension's _, or the start of an
+				 * extension.
+				 *
+				 * Otherwise we have found the current extension's major version
+				 * number. Parse past it, and a subsequent p/minor version number
+				 * if present. The `p` extension must not appear immediately after
+				 * a number, so there is no fear of missing it.
+				 *
+				 */
 				if (unlikely(!isalpha(*ext))) {
 					ext_err = true;
 					break;
 				}
-				/* Find next extension */
+
 				if (!isdigit(*isa))
 					break;
-				/* Skip the minor version */
+
 				while (isdigit(*++isa))
 					;
+
 				if (tolower(*isa) != 'p')
 					break;
+
 				if (!isdigit(*++isa)) {
 					--isa;
 					break;
 				}
-				/* Skip the major version */
+
 				while (isdigit(*++isa))
 					;
+
 				break;
 			}
+
+			/*
+			 * The parser expects that at the start of an iteration isa points to the
+			 * character before the start of the next extension. This will not be the
+			 * case if we have just parsed a single-letter extension and the next
+			 * extension is not a multi-letter extension prefixed with an "_". It is
+			 * also not the case at the end of the string, where it will point to the
+			 * terminating null character.
+			 */
 			if (*isa != '_')
 				--isa;
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
