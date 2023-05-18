Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0455DC7EE33
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 22:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAmWFBpXq1i3PxV8HQ+9dRITlO+3JuCupSBpYkE7V7M=; b=fLLqCrbl0DDvfF
	ic9BX/b7v8FHKUOC1GVJlprpA6QjRpG9b4gErKR+LAxBGPr7Ynr/lKZIouBlybpGaL1ELuh3A+Abc
	/G4s3zx0nbWltbCjZcRk423mXwPn45NNT28r1NLwfJBcazpi4DaiSI4veyjEurAySrBTUmGADVpxf
	woCKbFUMAwSx50a3rtPNEVrSstVxuwTXOlpeY4mle8u69DWl4pWvsQCs/uldyLvKfKEdHyo7rFBjG
	maCPA45EHWh+CIlLLmp6p9ekfhcloNefldhoD+72ZFAI9NRstT875Vxp637ZzBwU7net6/+QPudzT
	+we52V4gLmm8a+bkUpJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmIE-00ENPE-25;
	Thu, 18 May 2023 22:40:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmIA-00ENO6-2I
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 22:40:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C71E652B2;
	Thu, 18 May 2023 22:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7611BC4339B;
	Thu, 18 May 2023 22:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684449613;
	bh=ypjNYLjW+D7UXqDeV7BW4n9xdA8f+pquBC6t0rUOM2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TRGgB1D9F10gnbSRtaCw0ZmGfoB8QCrg0UZgV0ymIOdAzKgnBBG4js8HxunGJRYPn
	 GQ85QjENjGd20j2UXV9OpeGyp7HY43yb4Iu2e8qZKPiBeLwNW7RLnWzvhiV8O5P44j
	 1a6TVbBXcpHB9tUZnqBMhmV/EbAIFIAK3x/u4yBYdbsXKgFW7dcEamYv5TEi5kGmgV
	 6ycrwJ5AvW3gE8GGGu7FENWINRvayfkY5Na3+ffMmYK6groHYd8Tbbg7Vn8LXRhOtm
	 H3jARotuWdHsOo3d/h4zw2w63SB1lGOGpLo/RlthYVhvKraIQFGQbmK5IEqmgefoRR
	 /MjLJyb93YDTw==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v2 5/8] RISC-V: rework comments in ISA string parser
Date: Thu, 18 May 2023 23:39:06 +0100
Message-Id: <20230518-tactless-ascent-6b74f1119336@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518-moneybags-rebalance-1484db493d6a@spud>
References: <20230518-moneybags-rebalance-1484db493d6a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4612; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=MzEbrG92FOqTlvRzWi1g8GTF0L/yzRwWLOI3UI52hnc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClpKzlYrNzSPpW1/Yy5Iymr2MD8JeDNjgdzfPbfSf07y d7x2qFFHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIBH2G/w52Rut/dXN9jql+ tuWN34mr0z1WLVnR0/pJKsk84sxS130Mf4Uei/fE3GT5mK824VRbX/G2k4YJLRYuW6QPM368+yA jmxMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_154014_837562_3BC11BA9 
X-CRM114-Status: GOOD (  24.25  )
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

I have found these comments to not be at all helpful whenever I look at
the parser. Further, the comments in the default case (single letter
parser) are not quite right either.
Group the comments into a larger one at the start of each case, that
attempts to explain things at a higher level.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 70 ++++++++++++++++++++++++++++------
 1 file changed, 59 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index a79c5c52a174..cc5189c7c64e 100644
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
@@ -163,53 +163,101 @@ void __init riscv_fill_hwcap(void)
 			case 'X':
 			case 'z':
 			case 'Z':
+				/*
+				 * Before attempting to parse the extension itself, we find its end.
+				 * As multi-letter extensions must be split from other multi-letter
+				 * extensions with an "_", the end of a multi-letter extension will
+				 * either be the null character or the "_" at the start of the next
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
