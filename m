Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23215CCF2C4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 20:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eX0B+IM6GxGC8aEHwy5Vkgw7oyT9ATDEzpsz374KiCg=; b=36aOUhmV5XVR6c
	Vc/lZmB0OZmXUYdFMiaw/J+MlucZzIr2rCyZpAroaPxlujeYSwQApJliD1XSHZ5orpsIm/PTDFrqZ
	NfxmAsVIBr/RcyWG0THf80Y8iTxkaN8GqcyLGv/Olu06EFnw56wz5/YJWDTV9+5FVZm31vtk4mWPI
	oKgh1ttpFL01xvBF5G6lHg2Z+dB3ifH00s/UDZdyWFALKstOz/RgVWNMUy7JrQnq+8E09WvjugST/
	TbKYyvnGL3XBn47EWOHwExPwjvXSf07D/bCvilKI5R/G1MHgcojSsySWIg5oqX2bfyTQYV7J3T/nX
	KEo1eEN++czGytlwq68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHoa4-000000040HZ-3tP7;
	Fri, 16 Oct 2026 20:31:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHoa2-000000040GE-1sh9
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 20:31:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so3291125e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 13:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792182664; x=1792787464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iop2qi+eFNESEc9uZHVm2CGO5WQwDSDngrKC7a0NKTs=;
        b=crwpUon9XHGt52pxWjeph/ZWW/HpsIWi4UhVV93DWVu29fh4Cqcab6JPcNn3ftBOwV
         LZk5cm8/yY0Li/dHD22n37DS852lTdZpk4GLYqqrPN0kOW3GkglUGmEJS9yHBfT5St0a
         6aZWEbF/vr07ZlBxQLuoymd0J2X7soksF+sK7c6xAa8U8oeeGw03CZmqpPNnZTAncAKd
         tXde2JsydCauzDxSKcPh4ZGXFappAtvh1jn/wE0OQgjBOYNDst0QmkwVJ7L0D1k9ObiA
         VFkNcelDIS3rZn8jlTa0O8zP0TeOHZ0y7ukDIABr4/BtyesavLlSNz1HfSSIhfjHK9AO
         venQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792182664; x=1792787464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iop2qi+eFNESEc9uZHVm2CGO5WQwDSDngrKC7a0NKTs=;
        b=LFHpDI6BIMMd/Tb50LcSH8tRTa6Lcs0d0rgBvZ6aoAWA09NUcJS+CfHWWnkRuYA+33
         8qbrPyuqcGceDUz7IkdkpiWqOweaAFBMAWHmtEwUePKNwVzdbgLG1crIj5aY0ChBGYfL
         N7bpM4p3FFuyuBep6i/8hBAZmfBf8eaTpPV6wZLMmdfuGSh+A+E8r/wOU1v3B/Ij8AGk
         BXhm0hslBUr3rLXdzkSxxRhn4vrPHVknL0DhK/kq49NlKDiCaV6czWHolOIsWr6NN49U
         JW/vkOsRBQBcz8tW9XiQJ1BJni6t1oaW6M/J5Xh0yT724uXoI6zeSwTmgLcInj9YDyKj
         MMpQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+m1Hobu+SU0uYDntfxL1rI4KG8+qalzj3RSjWLZOjRAhP6aGZw6E2PUWjULn209yqvn6msVZ2B1nclg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJA37Dgw7vG9PbYLtk4pe6DYEeA7NMmNmJaRmUAlqQe8f7PWssx
	gGvxrrVQAu3i3QBOLkvNwf/SWi9FPRoe79yjSCrQ62gk5uZlGq9cAHg8
X-Gm-Gg: AYBFou2v8stCGe+H1rgZ8tME//nKnH6w9dSqqOLaIsqkyk0x8jLwvQrz4nuCADD5jBL
	YiCpm2LBUfpl88HLuUJQjsFp8EvE3qReGA1jkXsiT3hXcp9xojaMpSH+3RLldNxf5x1Qwe7uD5o
	70tsnTnh6oHMyUJWJc/49joRF9lb9fdpZSqYC4Wr5y5sj3s3KapWzCfJ4WGQh1FgBw8iYnPVrgu
	5z7JVsZRcYK1aEnGnJwblXxG1V4nWfgAf3sAn8sBUUz7wdxJkA1UMgLp9/C5rE3Q2r1hLBg3fqZ
	z1Z1mYke1oq/wPn3UzZ21x3dA7NYoYfGgrP7Iz8DfFLpj7u1IZQc8WPsg3jaDOhHQ1O/W5+LzoP
	H0ajcd/d3v6E/Lp08rtnup2+E2u8Y91DpMlOfCNir60U3qfnx1rlKDn2icCak9W0Z0uzcwtjGmb
	whng8iO6qtmo635Raca+nETh+Uc5jDtkABqWeevI2GYolU5UHzSL68Ejb/DdpvOtD9r9RoHoKtJ
	rr1RLZ9q+6CPdVGbmIewogntSSxLt14kHWrYdI9SHjbE/8S/84Ewa5anZGla6ZCMUIpgqWQlLbj
	vF2c6uMx/XFVshQjcSedCXPTLbGTIs9rcJ2nAU1NcJfx9gTVveNsQeJqb+HKRvoa8KRXxhWdq82
	EAw==
X-Received: by 2002:a05:600d:864c:20b0:4a1:cdd1:5144 with SMTP id 5b1f17b1804b1-4a1d7616470mr13719675e9.21.1792182664215;
        Fri, 16 Oct 2026 13:31:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm7177387f8f.2.2026.10.16.13.31.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 13:31:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Michael Neuling <mikey@neuling.org>,
	Raj Vishwanathan4 <rvishwanathan@mips.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFT PATCH] riscv: errata: mips: Skip vendor extension lookup during early alternatives
Date: Fri, 16 Oct 2026 22:30:52 +0200
Message-Id: <20261016203052.2026-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_133106_846050_3B4F012B 
X-CRM114-Status: GOOD (  10.49  )
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

When an enabled erratum selects RISCV_ALTERNATIVE_EARLY,
apply_early_boot_alternatives() calls the MIPS errata callback from
setup_vm() with the MMU disabled. Each enabled P8700 probe calls
riscv_isa_vendor_extension_available() before rejecting
RISCV_ALTERNATIVES_EARLY_BOOT, although neither workaround is applied in
that stage.

KASAN instrumentation in __riscv_isa_vendor_extension_available() reads
shadow memory with satp=0. On QEMU's mips-p8700 model this raises a load
access fault, and the temporary trap vector parks the boot hart. The guest
prints nothing after the OpenSBI handoff.

Move the existing early-stage rejection before the extension lookup in both
probes. All later stages retain their existing lookup and patch selection.

Fixes: 0b0ca959d206 ("riscv: errata: Fix the PAUSE Opcode for MIPS P8700")
Fixes: 2cf0b2992203 ("riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with mips.pause")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Based on RISC-V for-next commit a5ae1bf65cee.

Tested with QEMU 11.0.2, virt/mips-p8700, four harts, and generic KASAN:

- The parent reached the OpenSBI handoff but produced no Linux output in
  120 seconds.
- The patched kernel initialized KASAN, brought all four harts online, and
  powered off cleanly.
- With a DTB advertising xmipsexectl, all 414 PAUSE and 6 WFI sites in live
  kernel text contained mips.pause.

QEMU does not model the physical WFI translation erratum or P8700 PAUSE
behavior. This was not tested on P8700 hardware. Please test with KASAN and
both P8700 errata enabled.

 arch/riscv/errata/mips/errata.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/errata/mips/errata.c b/arch/riscv/errata/mips/errata.c
index 6e71555274501..9bb1c3de9504e 100644
--- a/arch/riscv/errata/mips/errata.c
+++ b/arch/riscv/errata/mips/errata.c
@@ -18,10 +18,10 @@ static inline bool errata_probe_pause(unsigned int stage)
 	if (!IS_ENABLED(CONFIG_ERRATA_MIPS_P8700_PAUSE_OPCODE))
 		return false;
 
-	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return false;
 
-	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
 		return false;
 
 	return true;
@@ -32,10 +32,10 @@ static inline bool errata_probe_wfi(unsigned int stage)
 	if (!IS_ENABLED(CONFIG_ERRATA_MIPS_P8700_WFI))
 		return false;
 
-	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return false;
 
-	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
 		return false;
 
 	return true;
base-commit: a5ae1bf65cee84bcc121d659e7e22a767853f5f5
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
