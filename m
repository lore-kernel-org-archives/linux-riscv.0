Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B9EC87FC5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 22:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TqGFlJOhZP+Wf9OcVHiU30WET7NsBx0fXOq9GnKRhS8=; b=PZ/bRJxEUaM62Z
	JQwKyzkB6FyuwrQoMOHPV9pogRtjiUxcGPkleCXj3VAv5XacgwTev3FufbXnLAHKg5vEguX5nPB1s
	TcsOo4Kwk6avQ3ymOAw6P9eVnTmbZRhGAKmatcQwLAe1K4T4ProKnxub3w+xRvMjCjUajPYcavxz0
	0dGUVUjPfY9lQSPJ4helEuEXDFz/NTZgK0A7jbHUcXh1hBmbc5+su71BVblQbJtbazN12flP0sjth
	KkaB+xY506DL0PhX6b8OweLuclH+BZkFw3k6ODPDqhZrPKLaKB9l4Rmx6VoxU1fpIPsprKwskb50h
	Wh/R7JDGs5ZaX5+62bGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf47k-00000008YiH-2LRY;
	Thu, 24 Jul 2025 22:09:12 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf47g-00000008Yhf-3mLe
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 22:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=G1GIx/bTld7i3jsye2tQQaAkpBwO5F07jwxGvhnvPvo=; b=KJMRc2suV9oemaajHLxPMMOGLm
	qnIexYONwqIsa7DrXH7k3JRaSL3025hxN4tyP+8IUyAc6L7Mdomr11tbdcrM7tdtSDmHH/Mo8HMHk
	V655wS7asI5KIYt5TLhhCnrdypwarOK37XBFPywJaFArChP4uieK9W7OlSle+zyjdDTFJkCwjc8Cw
	vpVEyznQ3bnqTFTMBNu5TmtyDwrkQkUugxLLk47zYTn6mlf8/f+dIs+rvQQekljKpFxzy6GZQ/oS2
	suLq6bvms6guIufwl49pKPD/GLkzCwRs5i8kxcfQt9vI2LCzmzq6fFpeMe4fhsAZX4AItpgG7vAAM
	dxm1usuw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1uf47U-00DlP2-0d;
	Fri, 25 Jul 2025 00:08:56 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Cc: Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH] riscv: uaccess: fix __put_user_nocheck for unaligned accesses
Date: Fri, 25 Jul 2025 00:08:52 +0200
Message-ID: <20250724220853.1969954-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_150909_391995_7962FF74 
X-CRM114-Status: GOOD (  12.00  )
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

The type of the value to write should be determined by the size of the
destination, not by the value itself, which may be a constant. This
aligns the behavior with x86_64, where __typeof__(*(__gu_ptr)) is used
to infer the correct type.

This fixes an issue in put_cmsg, which was only writing 4 out of 8
bytes to the cmsg_len field, causing the glibc tst-socket-timestamp test
to fail.

Fixes: ca1a66cdd685 ("riscv: uaccess: do not do misaligned accesses in get/put_user()")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/include/asm/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index b88a6218b7f24..22e3f52a763d1 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -311,7 +311,7 @@ do {								\
 do {								\
 	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&	\
 	    !IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr))) {	\
-		__inttype(x) ___val = (__inttype(x))x;			\
+		__typeof__(*(__gu_ptr)) ___val = (x);		\
 		if (__asm_copy_to_user_sum_enabled(__gu_ptr, &(___val), sizeof(*__gu_ptr))) \
 			goto label;				\
 		break;						\
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
