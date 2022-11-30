Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17090C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9zCVTlIgYjD+FHCgmC/B/oS97KApbuwQqxRURtHFGU=; b=EaZ7YdX9J2ddQH
	7WPijX1BV6cfeO2njG2H1wVjQdPctKGekyPeuMw5TtmXs3/KDoKcd4sitW6nBAEtlwrRxb5okgFdf
	cCXxa7r7sfOJnmqbb+xLZuYYLE7pn4tud9HGjoFO3dPiKtd7o2nkCKOOwTqmiHfip4Mqhb5kTddq7
	Kc3SmadfObUkVbs8vRWRRkgKUU7khG4/R3PKhnWgZvuebCGqDk2EL3iNTbCL6AVNcJ5QllK2dj8Se
	yk8O6FVPZYZOBWLI9z6ilgidgHcMkzKYRuzBB0zK33hA6hx0pyEtOMhp3O+G8vm24FREXhmlbLsuV
	v5PG5M8QOOb8KzTf8vAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0XBI-003X34-3C; Thu, 01 Dec 2022 00:12:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WiL-003JoC-7G
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:42:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 84A88B81D59;
	Wed, 30 Nov 2022 23:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4780C43146;
	Wed, 30 Nov 2022 23:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669851722;
	bh=B0la+6RJs6jm7uimz2FZajJBMnUH9FoBQuI76+kXtl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YtBDJB10K9UQhIScS5VPIjV21O/fMZFvs8VBNbVsqhX03H25iyKCeM7s3i+NZFjAU
	 bmbBBqWZ0zzQ+v9UA7nXQIbkOkrj+2CijSK8khQ4qHE1WnXwOxLFI2pASuSSr9mMHc
	 2QRNvyEyJBEr+uOzLcB+JEJ+hsTHyv4uJmhOQdI3B7vyY3v1aZARRIMs98/CL1bGaq
	 Qd4NKWdsQid2GnrZM6wI1uqUqlw2b97ljZHi/IrpCaj/Ikd1ItLa/YdR8TjcTu8Qh7
	 Ev128+zppZt3D/f8xCzCJ5gvumY6KavECn1g5T9kuh4fCxR/m9lEf6dvxJ4+dRsQK6
	 eezkFeuVMyLHQ==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	conor@kernel.org,
	corbet@lwn.net,
	guoren@kernel.org,
	heiko@sntech.de,
	paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 2/3] RISC-V: resort all extensions in consistent orders
Date: Wed, 30 Nov 2022 23:41:25 +0000
Message-Id: <20221130234125.2722364-3-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130234125.2722364-1-conor@kernel.org>
References: <20221130234125.2722364-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_154205_609349_5A3CFE69 
X-CRM114-Status: GOOD (  16.00  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Ordering between each and every list of extensions is wildly
inconsistent. Per discussion on the lists pick the following policy:

- The array defining order in /proc/cpuinfo follows a narrow
  interpretation of the ISA specifications, described in a comment
  immediately presiding it.

- All other lists of extensions are sorted alphabetically.

This will hopefully allow for easier review & future additions, and
reduce conflicts between patchsets as the number of extensions grows.

Link: https://lore.kernel.org/all/20221129144742.2935581-2-conor.dooley@microchip.com/
Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I could not decide between adding an alphabetical comment to each
alphabetical site or not. I did it anyway. Scream if you hate it!

I also moved a static branch thingy in this version, but that should not
matter, right? riightt?
---
 arch/riscv/include/asm/hwcap.h | 12 +++++++-----
 arch/riscv/kernel/cpu.c        |  4 ++--
 arch/riscv/kernel/cpufeature.c |  6 ++++--
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b22525290073..ce522aad641a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -51,14 +51,15 @@ extern unsigned long elf_hwcap;
  * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
  * extensions while all the multi-letter extensions should define the next
  * available logical extension id.
+ * Entries are sorted alphabetically.
  */
 enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
+	RISCV_ISA_EXT_SSTC,
+	RISCV_ISA_EXT_SVINVAL,
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_ZICBOM,
 	RISCV_ISA_EXT_ZIHINTPAUSE,
-	RISCV_ISA_EXT_SSTC,
-	RISCV_ISA_EXT_SVINVAL,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
@@ -66,11 +67,12 @@ enum riscv_isa_ext_id {
  * This enum represents the logical ID for each RISC-V ISA extension static
  * keys. We can use static key to optimize code path if some ISA extensions
  * are available.
+ * Entries are sorted alphabetically.
  */
 enum riscv_isa_ext_key {
 	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
-	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
 	RISCV_ISA_EXT_KEY_SVINVAL,
+	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
 	RISCV_ISA_EXT_KEY_MAX,
 };
 
@@ -90,10 +92,10 @@ static __always_inline int riscv_isa_ext2key(int num)
 		return RISCV_ISA_EXT_KEY_FPU;
 	case RISCV_ISA_EXT_d:
 		return RISCV_ISA_EXT_KEY_FPU;
-	case RISCV_ISA_EXT_ZIHINTPAUSE:
-		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
 	case RISCV_ISA_EXT_SVINVAL:
 		return RISCV_ISA_EXT_KEY_SVINVAL;
+	case RISCV_ISA_EXT_ZIHINTPAUSE:
+		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 68b2bd0cc3bc..686d41b14206 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -161,12 +161,12 @@ device_initcall(riscv_cpuinfo_init);
  * New entries to this struct should follow the ordering rules described above.
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
+	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
-	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
-	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 694267d1fe81..8a76a6ce70cf 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -199,12 +199,13 @@ void __init riscv_fill_hwcap(void)
 				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
 				set_bit(*ext - 'a', this_isa);
 			} else {
+				/* sorted alphabetically */
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
+				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
+				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
-				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
-				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
 			}
 #undef SET_ISA_EXT_MAP
 		}
@@ -284,6 +285,7 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
  * This code may also be executed before kernel relocation, so we cannot use
  * addresses generated by the address-of operator as they won't be valid in
  * this context.
+ * Tests, unless otherwise required, are to be added in alphabetical order.
  */
 static u32 __init_or_module cpufeature_probe(unsigned int stage)
 {
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
