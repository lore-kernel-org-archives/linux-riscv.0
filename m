Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A95C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 18:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VJyEXn/Lp53APl5Iwh3nd2KB0RU9BOhtXczi3TIYks=; b=jsOxTDyqRpJx8/
	Xj5Lc9RIJHPGGoFHDbeXPk7HSL8LgpFOaYM4n//ZqUZbWGA/aDw5UR0URyTzEZMvfwiXjyc0Blml4
	erHv235AQ2/AuXPQxl82j+IjlsMBAkGOk/ETQGEEO8PrC8rwUlYYifhfI+YOdhU5730NtbY/aYwSm
	GKuEk+JSTZg9jwRCV17XK4gCHtp2AXPRHJgNy0RRyGzE9TCnFyYhfVfdBaq38cuIVkMPdCV+E6LbD
	a2KrSrCCvyndYKIGNa1lzTyO0aC4dLQXE1m8Q1sv1gRRLI0BK4Q2CG7CTcFEVMH81OBgrgNYUcAl0
	k08/n6kGpiJ/Xi+MVFLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUb-008VU3-0P;
	Thu, 04 May 2023 18:15:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUY-008VTG-2Z
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 18:15:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E657630AE;
	Thu,  4 May 2023 18:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17584C4339B;
	Thu,  4 May 2023 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683224145;
	bh=IqaZ10/DC7yoaMpXc3z1iSfsNsTNIvDE77+MtWugYOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SdR+3qErEM3Ri2n5f38/TXd50BpKj1E02ozgRo3wJYn2juBpMpmRoADAUUN8oei4R
	 fpgrshnkepl3MlMskxSdow11/2BSoTzJub91/395EGP0IpuC8TC7GH2kc/Fp9eDPyW
	 bm9zMgNbpCrIrJaUYSH9L8WBf0FPbEs+MOwoxT7RLF2s3QL7qh4WvSoROImaaUr99E
	 xg8zTgMleWTi+qCYX876snfWAxdPVIY+D7aUtrT3k3jpLZThPe2qTvkc0MqspuUO3j
	 5sBGqFoSlp9y2rfs1LDOIV9Tj11asttBQNc3Uv2wSckiC0IRsARZNTvDX9dnWMamd7
	 5Dhzfr0mAPr3g==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v1 7/7] RISC-V: always report presence of Zicsr/Zifencei
Date: Thu,  4 May 2023 19:14:26 +0100
Message-Id: <20230504-oncoming-antihero-1ed69bb8f57d@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2372; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=wm2vukeUAK88wTVTWM3yrfpupCVbuR+rzgaQij/mlIw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnBX//HXbs4c+LMGRLZJ59oLnkrlXM08oKGcNcB2+TFJ d97/8r6d5SyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAigXoM/33tHDd4PxUxl644 PWdOe8YVi/euhqt4vLepCnepfjdSLmT4n8BweG3IzsnJeeV+v1gjPxa7/dj79f5Gl/g0xhiOnqu +7AA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_111546_907336_CC5DC8BA 
X-CRM114-Status: GOOD (  11.91  )
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

Zicsr/Zifencei were part of i when the port was written and are required
by the kernel. There's not much that userspace can do with this extra
information, but there is no harm in reporting an ISA string that closer
resembles the current versions of the ISA specifications either.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpu.c        | 2 ++
 arch/riscv/kernel/cpufeature.c | 7 +++++++
 3 files changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 9af793970855..aa61031f7923 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -44,6 +44,8 @@
 #define RISCV_ISA_EXT_ZIHINTPAUSE	32
 #define RISCV_ISA_EXT_SVNAPOT		33
 #define RISCV_ISA_EXT_ZICBOZ		34
+#define RISCV_ISA_EXT_ZICSR		35
+#define RISCV_ISA_EXT_ZIFENCEI		36
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index b0c3ec0f2f5b..0d5d580dca61 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -204,8 +204,10 @@ arch_initcall(riscv_cpuinfo_init);
  * New entries to this struct should follow the ordering rules described above.
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
+	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b425658bbf08..92f0e7b78eef 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -292,6 +292,13 @@ void __init riscv_fill_hwcap(void)
 #undef SET_ISA_EXT_MAP
 		}
 
+		/*
+		 * Linux requires Zicsr & Zifencei, so we may as well always
+		 * set them.
+		 */
+		set_bit(RISCV_ISA_EXT_ZIFENCEI, this_isa);
+		set_bit(RISCV_ISA_EXT_ZICSR, this_isa);
+
 		/*
 		 * All "okay" hart should have same isa. Set HWCAP based on
 		 * common capabilities of every "okay" hart, in case they don't
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
