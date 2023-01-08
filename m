Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AB2C54EBD
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jan 2023 16:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isSA28+MIvWz97kExPj49UuOWEXDcHRIAIaqHS2TwGI=; b=mUs+AF4hC5eNOv
	yG0UIGlTCOrxR0LToBTFuxrpfSCbEi51LwE8bpMB1ySm4YVA9MeWjlNKGJ1oGGE1Xr/6DqPwAi25m
	80OFowf3ywDP670bJbKMtQXk7Lv7F3c8qjUqeV9nvfgLKvkpiot+hAEqcuOEdqR+23JuTJ4ufd9by
	PbvQcv7274ZUrlBQPBZsEmqJRXzSJBcwWN5bs0Eb1BQoLBDXValzXvN43ZHD8jd8fckuwIiqVKbAt
	F6xcuYR5AlsDQe5AIdhMdReNgZAAwZ8JoePlljz/93cJh8ncV4YS1Htnge9tZVrsmYZDgsPHGZPxD
	2eElTPw3GpI/kfEesx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEYd2-00EMYn-4L; Sun, 08 Jan 2023 16:34:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEYcx-00EMWT-29
	for linux-riscv@lists.infradead.org; Sun, 08 Jan 2023 16:34:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B8116B801BB;
	Sun,  8 Jan 2023 16:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC0BC433F2;
	Sun,  8 Jan 2023 16:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673195668;
	bh=tNzGcvrEpUUTCaU+avvscIqbkTKoFlaDy2MR8riCxj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QVtYDA3/7p5bWI0mk4pC6zwWunVUR0vuWjnQUkmXJZ5d181rWUr9tYYVrkj5L/Oae
	 kKbCi9PkIjoaxO+t/bVC216OOGpbbG7MvsuqFKjxC03n5PqbMWwg3twHd+UFpT15ht
	 vySpT/laUXPvaRPZXYaiGkxcFJx+9iGt37YYa3HCUrhi93+hEibheoT9Vj6xgPYY4a
	 lQv3ymgCyhXF8E9HCsnRXjH6oRlCdI5LGJli3BJSOFF8lLF+ATevwD4bfCqGIX/VFF
	 XzklPC4ILUcFKnB/keQQ1t690+18tXG20EJ538ga+wSnihh7SJEt3BHdlEgTjbLa3p
	 NYDnT5k0bocTg==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 2/3] RISC-V: replace cbom instructions with an insn-def
Date: Sun,  8 Jan 2023 16:33:55 +0000
Message-Id: <20230108163356.3063839-3-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108163356.3063839-1-conor@kernel.org>
References: <20230108163356.3063839-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_083431_310265_FF95D4AB 
X-CRM114-Status: GOOD (  12.66  )
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

Using the cbom instructions directly in ALT_CMO_OP, requires toolchain
support for the instructions. Using an insn-def will allow for removal
of toolchain version checks in the build system & simplification of the
proposed [1] function-based CMO scheme.

Link: https://lore.kernel.org/linux-riscv/fb3b34ae-e35e-4dc2-a8f4-19984a2f58a8@app.fastmail.com/ [1]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/errata_list.h |  3 ++-
 arch/riscv/include/asm/insn-def.h    | 12 ++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 4180312d2a70..b71e3ccd3110 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -7,6 +7,7 @@
 
 #include <asm/alternative.h>
 #include <asm/csr.h>
+#include <asm/insn-def.h>
 #include <asm/vendorid_list.h>
 
 #ifdef CONFIG_ERRATA_SIFIVE
@@ -125,7 +126,7 @@ asm volatile(ALTERNATIVE_2(						\
 	"mv a0, %1\n\t"							\
 	"j 2f\n\t"							\
 	"3:\n\t"							\
-	"cbo." __stringify(_op) " (a0)\n\t"				\
+	CBO_##_op(a0)							\
 	"add a0, a0, %0\n\t"						\
 	"2:\n\t"							\
 	"bltu a0, %2, 3b\n\t"						\
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 39f9e0893564..e01ab51f50d2 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -180,4 +180,16 @@
 	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(51),		\
 	       __RD(0), RS1(gaddr), RS2(vmid))
 
+#define CBO_inval(base)						\
+	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
+	       RS1(base), SIMM12(0))
+
+#define CBO_clean(base)						\
+	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
+	       RS1(base), SIMM12(1))
+
+#define CBO_flush(base)						\
+	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
+	       RS1(base), SIMM12(2))
+
 #endif /* __ASM_INSN_DEF_H */
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
