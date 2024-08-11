Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84821C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Aug 2024 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UfRs80SKMV5YrO5Ce14pw3zAbWA5oKe0IdFR3278hVQ=; b=hiUiWADRRW9JpJ
	FDoNJhqM74SEq/JpDabzDV+mxSgXW4i5rXs62R8eMn4vtZS9HmO97sZt2t4vyeIjBG3WMRal/NL9f
	Il5/tw/14S8HctmivFUC+cNoB2gVoNHWdEnr0WdY/LgQHkFkrbcgsscBHjXW0FJWQHY43rTeafG2f
	0+tksqNBn7Ph+ArvY+FJ2vQVihZ4Z4H3fMHkINC/GIfbHFWNBdEDaU/DrscKMroLdJCxiaHi8BbW+
	hQ/bTd6LEXm+azyvht5FZmalh8RG6n2XY6lG0s0TNG3kPhvHnBcELNyKGvijEsNybsr0xh+3D17+A
	Xtc+03/vWTuQ6+kb14EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdA5d-0000000Fi9p-3otr;
	Sun, 11 Aug 2024 15:02:38 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdA5a-0000000Fi9J-3gvP
	for linux-riscv@lists.infradead.org;
	Sun, 11 Aug 2024 15:02:36 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2f189a2a7f8so36712541fa.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 08:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723388552; x=1723993352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dPwjDhi7KuLfP5w2qSCJy9Pe3ty8wsK+Of52u0lxUqk=;
        b=msHrKN2usC/x4zl9xsh8QGBvSyvQeWAw+hMuV2y3JWEPP2car4VAn3Y79a9XQl0zV0
         g3G/Z5K0ImNT2ceN6iRszVcANJYFEt3NxRIDA4BLrMLSSxABAEGOFFWZfeDkFiX4R6l/
         Y1rYPsyVAfqDX1ypzfgUz7DmgejSfng7NjJyUTlFp47cve/WQeJiGWLa6+o42i2uvIcX
         DqIANOWzhOS6kUq1CErz2fTmBqDZCl0QBLuPR4GN3kp40hPh99L/eGsy4eLtVCADAzEH
         NPmBBGE63cI1Lif4tz8vd6JPl6SaXlyNfto6JmVB+Xs/kJbxxN6BBpJL5DjF6XUo6N6w
         DHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723388552; x=1723993352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPwjDhi7KuLfP5w2qSCJy9Pe3ty8wsK+Of52u0lxUqk=;
        b=QtbDwR5ZZzxrHuWPwVX1jGcJ2iVGXdaBV0NSS3IYfBVGyY1C8fL8/ORFGSyQ9vhq3A
         k/D7PWRk0cBT/JUyCm9gvAxmyM58NelN0y11/LZsV6kMD7ameJDL30BocmZKO9lknRs5
         4oeJTUEi20VA3UdVk5lIMLW6FU+13vUEuLVfvckD6PJMMAI+AOzbHPweSggqJw4HmJt6
         EJ+OM4M+j/MwmOqyXnae3GqmSyJD3n6oEbWf96iCO0sEAeBdtiXfMbv/e5msp4ICytJA
         3sQzeaoJHfA6wv9CkT2XZG2v1qxalosJ6BYltpsD+cbKFpT2b9hUBhIhDHspLk2FuV3N
         8Wzw==
X-Forwarded-Encrypted: i=1; AJvYcCVDADh95ulBtSIS5vOxIodYsS6YElpEghxa3itZa8fMNMWO4Wlk0mXnEi29ewbsjDLkgxm3JqE8YQaBL8jXHGl4RoiOEfidWuKJtYerYhwa
X-Gm-Message-State: AOJu0YxhGvuhXO4h7vMayx0AuNw7CQ0crrYIpKGDozVTi8CQsVApL2/y
	mCORwfIWn9M1fOG32oDeeUp5mgYBfFkgwSeD4WIBuq6cwhgLcD7XVa5LnheqyaQ=
X-Google-Smtp-Source: AGHT+IFvk8ykrXwv5JN7Ut+OBiNYWgGRWCFMRTpXj8rPw95TTv9BOxj1UW1uuL24C6SjPGc/jTFePg==
X-Received: by 2002:a2e:f1a:0:b0:2ef:2c87:3bd7 with SMTP id 38308e7fff4ca-2f1a6ce6ea0mr45870891fa.37.1723388551654;
        Sun, 11 Aug 2024 08:02:31 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738e01sm152901205e9.11.2024.08.11.08.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 08:02:31 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -fixes] riscv: Fix out-of-bounds when accessing Andes per hart vendor extension array
Date: Sun, 11 Aug 2024 17:02:29 +0200
Message-Id: <20240811150229.82321-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_080235_124080_44F6C045 
X-CRM114-Status: GOOD (  12.13  )
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

The out-of-bounds access is reported by UBSAN:

[    0.000000] UBSAN: array-index-out-of-bounds in ../arch/riscv/kernel/vendor_extensions.c:41:66
[    0.000000] index -1 is out of range for type 'riscv_isavendorinfo [32]'
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.11.0-rc2ubuntu-defconfig #2
[    0.000000] Hardware name: riscv-virtio,qemu (DT)
[    0.000000] Call Trace:
[    0.000000] [<ffffffff94e078ba>] dump_backtrace+0x32/0x40
[    0.000000] [<ffffffff95c83c1a>] show_stack+0x38/0x44
[    0.000000] [<ffffffff95c94614>] dump_stack_lvl+0x70/0x9c
[    0.000000] [<ffffffff95c94658>] dump_stack+0x18/0x20
[    0.000000] [<ffffffff95c8bbb2>] ubsan_epilogue+0x10/0x46
[    0.000000] [<ffffffff95485a82>] __ubsan_handle_out_of_bounds+0x94/0x9c
[    0.000000] [<ffffffff94e09442>] __riscv_isa_vendor_extension_available+0x90/0x92
[    0.000000] [<ffffffff94e043b6>] riscv_cpufeature_patch_func+0xc4/0x148
[    0.000000] [<ffffffff94e035f8>] _apply_alternatives+0x42/0x50
[    0.000000] [<ffffffff95e04196>] apply_boot_alternatives+0x3c/0x100
[    0.000000] [<ffffffff95e05b52>] setup_arch+0x85a/0x8bc
[    0.000000] [<ffffffff95e00ca0>] start_kernel+0xa4/0xfb6

This happens because we unconditionally use the cpu parameter to access
this array. But if -1 is passed, that means we should not and we don't
need to access this array, so simply prevent accessing the array in that case.

Fixes: 23c996fc2bc1 ("riscv: Extend cpufeature.c to detect vendor extensions")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/vendor_extensions.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index b6c1e7b5d34b..01dc79b1d17b 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -27,7 +27,7 @@ const size_t riscv_isa_vendor_ext_list_size = ARRAY_SIZE(riscv_isa_vendor_ext_li
  * @bit: bit position of the desired extension
  * Return: true or false
  *
- * NOTE: When cpu is -1, will check if extension is available on all cpus
+ * NOTE: When cpu is VENDOR_EXT_ALL_CPUS, will check if extension is available on all cpus
  */
 bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsigned int bit)
 {
@@ -38,14 +38,15 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
 	case ANDES_VENDOR_ID:
 		bmap = &riscv_isa_vendor_ext_list_andes.all_harts_isa_bitmap;
-		cpu_bmap = &riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap[cpu];
+		if (cpu != VENDOR_EXT_ALL_CPUS)
+			cpu_bmap = &riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap[cpu];
 		break;
 	#endif
 	default:
 		return false;
 	}
 
-	if (cpu != -1)
+	if (cpu != VENDOR_EXT_ALL_CPUS)
 		bmap = &cpu_bmap[cpu];
 
 	if (bit >= RISCV_ISA_VENDOR_EXT_MAX)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
