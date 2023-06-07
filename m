Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9F5C7EE25
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 20:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLqp4x09ayX1lhrr56rRgQNKGME+fj4ZeDoexTz2LBQ=; b=Ui7rCHhcwjFaYu
	o7eYCU1kPrDfJ0VXkd1Wt38YvNH0P/JrdcBEt3P5Mffru2VOt7+uAWsCJ3FLrEfBfUi0h31JgKi8R
	tK0y/ctC4sjv+ycLy2OMZnaI245r0NU2QUwqvg/qvhIF0vYqtz4tE+dx8z+MOWZvoumbSrfJXH6Me
	uW4+RCvSQPT9pt+MSW/RRg1U/ZYBz7yMs1GFS7T8j8PV7cKcN62wv4NdpYshsaUmO8BhnZT29ij7q
	P8uvQ7SJejV8ekmH2laFOL2+i0UuehsLnXyvq2hH0D6yqR0fiKV/6uluY3w/rL42V3Ck0GOvQDoxU
	WGioTloKk6YrJ8IkTrVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zm7-0077pL-0y;
	Wed, 07 Jun 2023 20:28:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zm4-0077nw-2R
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 20:28:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4566B644C6;
	Wed,  7 Jun 2023 20:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82497C433A0;
	Wed,  7 Jun 2023 20:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686169735;
	bh=42Kr9DzcOlyMxwqIlPuzrYxXlGgPnmpJsSEXMJrIrpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JEUvlFkCHtsoStuAUAN1kg1abUypK2wAJ0nXv/XlOUUH+7v/E6fas34a6PfjK0xP1
	 AVd9JohTDay4aRP7CbeIdxjS+Rt9qaIoabwmjAChDHAHfmcl+8tMGlItmeVyUtiNnB
	 g4wsfdiQoy1wLwEOAwQ4rBgJOPknKVW5dqnH8o5cGR1JA5rEb8/gVvBg17eobBO/wF
	 HauNqFjHNykQ8IPtICGqHerhDYRjsKLDzejSlr07wru9Nm4wArMk5oOSx0aoDrYm0w
	 SMPz0VPufBX4tDDC6pcU04B9XApc+stdrHEOJ/aw9HwuNEPW7PkJui2OE6Ls9dfky7
	 n+EEV0/u6cy0Q==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v3 5/7] RISC-V: remove decrement/increment dance in ISA string parser
Date: Wed,  7 Jun 2023 21:28:29 +0100
Message-Id: <20230607-estate-left-f20faabefb89@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607-audacity-overhaul-82bb867a825f@spud>
References: <20230607-audacity-overhaul-82bb867a825f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2940; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=MU74K4Z8b6PROrfxVKK7QLzTi9OJvvgiRmgVU5FGIKM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkNLzKXrIpN0f6tv+Bou25zxfp7eQUeM/oEnXzmNP0+p VKta/ypo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPptmH4K58Zdr3r/L8+od4L PXa+zF3PXyR59QU4ZRwLFZkonOXuyfA/btcl4Y3qN38fzRdnTNz1Zvn90DnzpjyzKToc1BHy79U WdgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_132856_878002_3D61BA9D 
X-CRM114-Status: GOOD (  20.95  )
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

While expanding on the comments in the ISA string parsing code, I
noticed that the conditional decrement of `isa` at the end of the loop
was a bit odd.
The parsing code expects that at the start of the for loop, `isa` will
point to the first character of the next unparsed extension.
However, depending on what the next extension is, this may not be true.
Unless the next extension is a multi-letter extension preceded by an
underscore, `isa` will either point to the string's null-terminator or
to the first character of the next extension, once the switch statement
has been evaluated.
Obviously incrementing `isa` at the end of the loop could cause it to
increment past the null terminator or miss a single letter extension, so
`isa` is conditionally decremented, just so that the loop can increment
it again.

It's easier to understand the code if, instead of this decrement +
increment dance, we instead use a while loop & rely on the handling of
individual extension types to leave `isa` pointing to the first
character of the next extension.
As already mentioned, this won't be the case where the following
extension is multi-letter & preceded by an underscore. To handle that,
invert the check and increment rather than decrement.
Hopefully this eliminates a "huh?!?" moment the next time somebody tries
to understand this code.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7dd4589e79a4..84dc44a3e6e5 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -157,7 +157,7 @@ void __init riscv_fill_hwcap(void)
 		isa += 4;
 
 		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
-		for (; *isa; ++isa) {
+		while (*isa) {
 			const char *ext = isa++;
 			const char *ext_end = isa;
 			bool ext_long = false, ext_err = false;
@@ -270,14 +270,12 @@ void __init riscv_fill_hwcap(void)
 
 			/*
 			 * The parser expects that at the start of an iteration isa points to the
-			 * character before the start of the next extension. This will not be the
-			 * case if we have just parsed a single-letter extension and the next
-			 * extension is not a multi-letter extension prefixed with an "_". It is
-			 * also not the case at the end of the string, where it will point to the
-			 * terminating null character.
+			 * first character of the next extension. As we stop parsing an extension
+			 * on meeting a non-alphanumeric character, an extra increment is needed
+			 * where the succeeding extension is a multi-letter prefixed with an "_".
 			 */
-			if (*isa != '_')
-				--isa;
+			if (*isa == '_')
+				++isa;
 
 #define SET_ISA_EXT_MAP(name, bit)							\
 			do {								\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
