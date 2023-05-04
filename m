Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EC8C7EE21
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 18:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lWwzBAPhFx2srh0ohfeFeom4NQV0IL+9NpQp9amu+k=; b=MxYE8xeQdlDT72
	DN0tIiX7LabImI1lEPj+sN0L2FcU6QgYHCSQXkCkvXCZN0cJJPjmXdm6/Y8DCBW7OW6RLm+7caVI+
	ZLVUjJZOYNi7JmHZypW6q1Pu1PDzzP0ITZ1nxaNcExuocLYr3m8eneXU1C29Uz22x1rVJbkwiU10j
	b6GIGH8oAeubgwh8BV6VQ7RWDO2Apcp9Zxua+v+W5DRIPXUbnGDWzGpXaJ6ZZp/f31lfU/FcCkgvV
	urZNhCwwCszLlWCtwyqGn8ieOjMR5Hc2CKz4eaVSO7fiyaHOF02ZCCFusfRkJhYnMaPV9t+u8+rhv
	+jAOgRW6OuxuqqCPmBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUZ-008VTa-1t;
	Thu, 04 May 2023 18:15:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUW-008VSc-1z
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 18:15:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3D44F63529;
	Thu,  4 May 2023 18:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED156C433EF;
	Thu,  4 May 2023 18:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683224143;
	bh=mfu+QSUbslnmYoxIsk5xdCAJ7L+WSuozBh83epLLhqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ML3X2/JjcNg00WvHLLe1QADOhK7LysuajvoLcDWS1NAYqfu8ryV3Wuv/xQowqzBJg
	 1A3NJe5DxBuX14Fx1kv8j12c1eoJ2ioSZ3geoqNbwTo2rWKjawLrfAjDOewW022dht
	 /90Xg+AJAt2qWxWfD7MfL8hND61AQ/FoOSMpeApjWUVmptPjT3pF7+2WJRzENWr0vg
	 s9EdWUJBmhfTIPZHu0YNX6zDvvJniFcelgBqkbm86+fS7id9fuRtAUXqOaIUyutoS2
	 9U7dawJv/G3eP+VNVg8pp7cu+/OsxG+A//U1ZWcVtptZULmnifq9SgFKV8L+iATF/r
	 cklrvCWc6fmbQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v1 6/7] RISC-V: remove decrement/increment dance in ISA string parser
Date: Thu,  4 May 2023 19:14:25 +0100
Message-Id: <20230504-barrette-engraver-df0392651854@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2887; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=RkVJHyeWNPWhbzSEHH1wjwVOmkBTxCXrBd5jxA5fagQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnBX//36Exldj15rKe/VKCuSLSxP29+bvWk/h/L5Zim5 q40DgzsKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwESKzjIy/Htb9Kj/8O8MUW9z ocgb+hyLnb4/OfKu81+6+66yC6/5ghgZnk1K45rc9fP+j9yrnX+ne/+5sF1dqLKiuzEr4fxpUZY 6VgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_111544_727487_52641821 
X-CRM114-Status: GOOD (  20.10  )
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

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2fc72f092057..b425658bbf08 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -139,7 +139,7 @@ void __init riscv_fill_hwcap(void)
 		isa += 4;
 
 		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
-		for (; *isa; ++isa) {
+		while (*isa) {
 			const char *ext = isa++;
 			const char *ext_end = isa;
 			bool ext_long = false, ext_err = false;
@@ -253,14 +253,12 @@ void __init riscv_fill_hwcap(void)
 
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
