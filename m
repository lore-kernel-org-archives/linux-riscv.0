Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DF7C5478C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 11:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gcfrxt5H57y7I/7FBGALMkDnN/ogJW/perGL/7Dj7SQ=; b=SUKoWredjNaANf
	6CIOmm/jA1MR6HgJJ9Rc7fSqITBj0HoI/pHkpwT1BhWNA2+YzTeKJrA1Lyr/9YYlM4JYsj+BEaLBi
	Bb7sBRj1Cp5VBNu2lHjPiQCpyCuinYytZ7dXS00lPgQg8USbJjAifhNLXtKJTn4PmkyIU2UdqQZkR
	2rImh3FOLIgoc/bp0J2sDUHmTDI57KyWxGoz6FSl8c04ofm1QOcRvu3F5m10LuS/jx41dJuQZy93G
	iW5uEzJdK3vFRfVHu1uGV7Tpu1tmuMgfTwjh/an8ur5NDQzn62jKdalq3qc1nojIu+Bip130hJ80o
	90MHJ49qeFTNZjBi6GzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdTnI-0000000982v-02ID;
	Fri, 23 Feb 2024 11:32:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdTmW-000000097zZ-12kE
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 Feb 2024 11:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=yo5YjkxAsdQjIHa2bOI6SGJdLU7u/Gvcaay8e2n15vU=; b=EjXt8bASACOPIk/szd4zoAqOHI
	UVunQ6OU3haBRqoOWqFXsWYvTK3lO5RYnfbMhmi5HeVL3C4JdmCjrywhPfOqsIs5GxSLAZbknJjNZ
	HOgHc1H8PmPCtT6pnlteBSLVIMwL6iQunTfY2QO3Wg6eBx3GIXZkVAbpxNVn8sVRpOrHUJbsbNH8v
	nHrH81atLMJlSJVKQKaMDDYRxAJio8uqOsWSL2G86hmkYqN/Mju/o1cQ/Rfz5as6bIZBPiK4wRkqW
	t8vOpxlVSss2Py6WH2GIhsRP69UQAZ0b+mbkM6joI63LHHB4YrHHYFM3NYLYcz9sn7VjdI9uPFPN2
	qG+l69yQ==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdTmP-00000006qnu-3Lq9
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 11:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 19F34CE0AFE;
	Fri, 23 Feb 2024 11:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1CAC433C7;
	Fri, 23 Feb 2024 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708687902;
	bh=+ykDauAPgu4nsYPReCTQhW1EzY/h584s3CXC4OTSHZw=;
	h=From:To:Cc:Subject:Date:From;
	b=Kw5eMDedqwPd5fm1THu7PwcO6N2aqZ+w3fn9gK7B4R2IELsLRCS6hOiLBJb4BERWY
	 tL1aXBZL9aaQBFDi8On87sq+vbSkMA0yIN+MXeDTZPYrhzpC9R54L5mQlSOsneGgQH
	 I3JRl9P+UbCzC3uktpWG4abMtbsMHrb0mchEMfjSV3zpNWVDr1h+4fDMWKitRS/4bX
	 6ZnXYggC+f1PrzAg0tdYkDRvV5fjRhmaK6DNZRckNFtlsBGymjZuu6pCveT1h9EDHJ
	 dS/9H5jTc4yz7OcDo4Em3LpHC4kzbByW+m+q//nYEl7y4VvSo9HQzPNLp6BWQL79dp
	 Z0QvsPcxUWvcA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	charlie@rivosinc.com,
	palmer@dabbelt.com,
	guoren@kernel.org
Subject: [PATCH v3] RISC-V: Ignore V from the riscv,isa DT property on older T-Head CPUs
Date: Fri, 23 Feb 2024 11:31:31 +0000
Message-ID: <20240223-tidings-shabby-607f086cb4d7@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3425; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=0aloUhejevM2QGLo+D0YdTrhD45VzCfjr27GffhjM90=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKk3moS2vBC8Ki31e0rBh1DXO8IBp5ctyJ+8SzDFY7a8z gNDi/MKHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIXisjwwKNNVoOMsY5Cb0B V36vLTZ8cOlnunjXs2md7o/iJ1zY+4+RYUuu8NWf3Xs/Vtf0Bix5NGfaQ/OwF+3hiYz+DVMe6q2 dwgIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_113150_498891_A0867E18 
X-CRM114-Status: GOOD (  16.15  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

Before attempting to support the pre-ratification version of vector
found on older T-Head CPUs, disallow "v" in riscv,isa on these
platforms. The deprecated property has no clear way to communicate
the specific version of vector that is supported and much of the vendor
provided software puts "v" in the isa string. riscv,isa-extensions
should be used instead. This should not be too much of a burden for
these systems, as the vendor shipped devicetrees and firmware do not
work with a mainline kernel and will require updating.

We can limit this restriction to only ignore v in riscv,isa on CPUs
that report T-Head's vendor ID and a zero marchid. Newer T-Head CPUs
that support the ratified version of vector should report non-zero
marchid, according to Guo Ren [1].

Link: https://lore.kernel.org/linux-riscv/CAJF2gTRy5eK73=d6s7CVy9m9pB8p4rAoMHM3cZFwzg=AuF7TDA@mail.gmail.com/ [1]
Fixes: dc6667a4e7e3 ("riscv: Extending cpufeature.c to detect V-extension")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I'd forgotten about this patch, the plan had been to sit on it until
someone actually reported encountering this, but Palmer asked me to
resend this as part of reviving the attempt to mainline the basic
support for vector on these devices.

I guess the riscv,isa-extensions support actually landed after the v2
was written, so v3 is less complicated since there's full support for
parsing the new property and all we have to do is block V in the !acpi
case when parsing riscv,isa now. As Guo Ren suggested, I decreased the
size of the hammer further, so that the c908, that does implment the
ratified V extension, can set "v" in riscv,isa. Other than that, what
changed is just a rebase on top of the changes since July. v2 is in the
Link: tag above.

cc: charlie@rivosinc.com
cc: conor.dooley@microchip.com
cc: linux-riscv@lists.infradead.org
cc: palmer@dabbelt.com
cc: guoren@kernel.org
---
 arch/riscv/kernel/cpufeature.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 89920f84d0a3..3a05af7be510 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -24,6 +24,7 @@
 #include <asm/hwprobe.h>
 #include <asm/patch.h>
 #include <asm/processor.h>
+#include <asm/sbi.h>
 #include <asm/vector.h>
 
 #include "copy-unaligned.h"
@@ -538,6 +539,20 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
 		}
 
+		/*
+		 * "V" in ISA strings is ambiguous in practice: it should mean
+		 * just the standard V-1.0 but vendors aren't well behaved.
+		 * Many vendors with T-Head CPU cores which implement the 0.7.1
+		 * version of the vector specification put "v" into their DTs.
+		 * CPU cores with the ratified spec will contain non-zero
+		 * marchid.
+		 */
+		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID &&
+		    riscv_cached_marchid(cpu) == 0x0) {
+			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
+			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
+		}
+
 		/*
 		 * All "okay" hart should have same isa. Set HWCAP based on
 		 * common capabilities of every "okay" hart, in case they don't
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
