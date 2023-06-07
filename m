Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71698C7EE25
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 20:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTyDZiE7O5F1EhJivvWO4CCZ1O07DJpH0blcWo87TYo=; b=t5j3QPo247dp+K
	hlZLlRYIeMMQ8jU6wd2+EmABwdVol3TTWLNnxKI50VgRSJqVc09gwpFx2YNUBhz7l6wHMtL8JqVhA
	m+6Cj4/6w6vSl+8Z+/KCnln0BMx28XM9prXQiFfzgKqezupU0kU/68NLaO1gvCbKXeojNqwMIqUkc
	1mrsVjJrmQW8nwiZrLExwj9LM213vo14y5uuwZKAzRyOhgnarYMybPHclf3WiI5UGDPAb/6icktFu
	ioHMtC7ATq1u1u5A3LfNIayFIub45UomxggsArHztHjkRoo9M/tpRZxweZ6Q5nhZHiORR32kVdpFG
	ZJIy746KRrkygMjx78dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zm4-0077o2-2C;
	Wed, 07 Jun 2023 20:28:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zm2-0077mc-0A
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 20:28:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A418D644BD;
	Wed,  7 Jun 2023 20:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8C0C4339E;
	Wed,  7 Jun 2023 20:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686169733;
	bh=eY1UqwYJntMLMU5Yd8lkw/zWfSR41OHe1x/9kSmW+Ek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ApBq1xCZHN18wc0R9zdT9eYGRLFkA6Xtg9RKeBK1uqlfn1dqJN+WMxfBH91SyGYTU
	 /vFDACsUiC8E8iX1AIZIDOc37VngXOCJ/B0e8EDXAZlbApb038tasCxdrsE+XidvPP
	 wuljKsHEZbxxrepFeDqdWN70kGasU4E9lB1jqWrzTzQHU/DS5/loxvZSwGFZyeJpct
	 OBgimt/NtihYGQ6rJXJ4USE3mQJxPqtV2LLh7apiRo2yB8AMnQ2ZuEEDsrI9oyvWZW
	 noxfeEw4wDNkjFqtvkdLS0EcvMSmYJXUIJPVouAPjvUgtrflsL0RQQO3WfGdHZKUqT
	 PRmKof92hqkFw==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v3 4/7] RISC-V: rework comments in ISA string parser
Date: Wed,  7 Jun 2023 21:28:28 +0100
Message-Id: <20230607-headpiece-tannery-83ed5cc4856a@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607-audacity-overhaul-82bb867a825f@spud>
References: <20230607-audacity-overhaul-82bb867a825f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4612; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=pRBb9rN0x8kEbAvR9LC8Ni1TdOFEl8xAcaZ/+5Mew2g=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkNLzKrH83bnrv7k1D3pvfXf7RpsX4parjaJSAX6fKFS bRs4RrvjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkaycjw15Wta0lkdNa3hw6 6c02eRH7ooSZby/tLf9ZX2t168zRu8KMDPs8Aq+taBd6dN7yyJLFgVFSqrp9833L92+Q4i6e2n5 mAyMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_132854_129923_F415ABF3 
X-CRM114-Status: GOOD (  24.80  )
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
index c3851c8cfa9c..7dd4589e79a4 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -164,7 +164,7 @@ void __init riscv_fill_hwcap(void)
 
 			switch (*ext) {
 			case 's':
-				/**
+				/*
 				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
 				 * No need to set the bit in riscv_isa as 's' & 'u' are
 				 * not valid ISA extensions. It works until multi-letter
@@ -181,53 +181,101 @@ void __init riscv_fill_hwcap(void)
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
