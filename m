Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA4EC4321E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 17:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8huytCswKgWIOxkqEBpUcGZPd0XyZN8l3n9mzw5uug4=; b=PYxDjrLnXBwCcL
	KTt1x4Ly5GhR9p9eCfTjmJvfnEZrLDfefntovPEvBxWBQNWCHd34brZlfWDiCrYvKkcnY9ZZX6GFz
	MCnElq03DU+ctVLk8+8z6RjazbHo0NEQZbsno/b03pWI+BseNZuf5Bkf9U1Z03+OWKqWcYPnWhmqZ
	VYK+zpJAPPDFwSkR/V4Nn5FhLGcpuuOapdPOT7Xqz0XIOaRvC4kUuxhbeolO0H7S19Yzj5UdGrdBE
	lRVIYRXQhpJohDB+WD0GkDoQdqnkHr1DNd4wlhF1rltKMtWN5j5ta/SipQaolPGWb2/5zFotTdjFV
	zti3TPoF0COpxHMtw8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFwV-00AR6E-8S; Thu, 24 Nov 2022 17:23:19 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFvz-00AQir-I0
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 17:22:50 +0000
Received: by mail-wr1-x42f.google.com with SMTP id z4so3378277wrr.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 09:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kf4MkbDtYqPHkzp1NQggOVlfAtAYmGWu5F6jTUCxlB8=;
        b=qYafnLysxGBAXMN4EjaffIZ65qJZh+y5w1H1fYwJARO8HEQdUwBlR1K0NUxbEqLcMq
         VbJ/DpIJwHYlfO2p/BdkFL3/ulkBdcTj5mODYt0ZQKAvS6srKRc1A82jXkYC9g4M7epZ
         0fbTKvJSfjSwFfWdbL5y1Cmw5HaQqg+ANmz7X8DlqXaRD/vfHruQLAIwWQE+d7vGSYWT
         cH/x18lKJYMlsWozqfjUGaMv3UdipMKGJIozGN21DcGb1Hj8NMZ2+Q1N6KjdQwN0XHPE
         U333xrUw7VTwFUkFK2pi/ftm6G12v9S0odXONtKjTRTtH5M9QOkjmpHG0Z1N1X8KsbWl
         j6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kf4MkbDtYqPHkzp1NQggOVlfAtAYmGWu5F6jTUCxlB8=;
        b=1EKj2X0/XPX0YR2VrvgpwlMBGTv5kqIiuuSksxCDC9JURKW7cGv+ajgIW48oV1Zba3
         k2SZWesLN6IZ9bZ5DrjMYTMMuw/D9bElqP5u1Ih5thrhkjoAxAQpwBsDQrdVqUaGxnAZ
         jeN+8/FyRMUYSwyjCLNmtg2yjW2pDqgiHhU/cp27E9PaDWx77TP9n2cq8bF5ZC27KKCZ
         WZHiMrPSF0611Zq6Qz10SkE+65OtjanumgW/WGpz8A7FmED9PKXjHbDpSrW3T3Hyzz+G
         Tm43osIL4fo5gR125XwEgj3ipQB1DUSQo11e3K1EYruqgq3IUcS3SWqNMiLTYH3VTsLw
         Uh8g==
X-Gm-Message-State: ANoB5pkY+N5wteIRf+209zVG3PlT8YQqhqoVpqHhB2T0Z5PZpF8+4v36
	Sv05UpkV0mjY3IaBz1fLww0=
X-Google-Smtp-Source: AA0mqf53uMvA9midyy+RxAuGlfEqI9h3gmkfBfuFydND+Sko1oOZNqSfyk3uBDaUm8F2FOuZHmJJGg==
X-Received: by 2002:adf:fdc7:0:b0:241:d7ab:db8f with SMTP id i7-20020adffdc7000000b00241d7abdb8fmr12173981wrs.285.1669310563686;
        Thu, 24 Nov 2022 09:22:43 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:89ee:3f5d:1c99:35d8])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003c64c186206sm2698086wmn.16.2022.11.24.09.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 09:22:43 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH DO NOT REVIEW v4 4/7] riscv: errata: andes: Fix auipc-jalr addresses in patched alternatives
Date: Thu, 24 Nov 2022 17:22:04 +0000
Message-Id: <20221124172207.153718-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_092247_623775_46CB37EC 
X-CRM114-Status: GOOD (  16.21  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This patch is added just for building purpose, as patch [0] will export
this in its next version.

https://patchwork.kernel.org/project/linux-riscv/patch/20221110164924.529386-6-heiko@sntech.de/

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, as Heiko will be exporting riscv_alternative_fix_auipc_jalr() function
so that it can be used other erratas Ive just included for compilation.
---
 arch/riscv/errata/andes/errata.c | 71 ++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
index ec3e052ca8c7..4061ad4983bc 100644
--- a/arch/riscv/errata/andes/errata.c
+++ b/arch/riscv/errata/andes/errata.c
@@ -13,9 +13,80 @@
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/errata_list.h>
+#include <asm/parse_asm.h>
 #include <asm/patch.h>
+#include <asm/sbi.h>
 #include <asm/vendorid_list.h>
 
+/* Copy of Heiko's code from patch [0]
+ * [0] https://patchwork.kernel.org/project/linux-riscv/patch/20221110164924.529386-6-heiko@sntech.de/
+ */
+DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
+DECLARE_INSN(auipc, MATCH_AUIPC, MASK_AUIPC)
+
+static inline bool is_auipc_jalr_pair(long insn1, long insn2)
+{
+	return is_auipc_insn(insn1) && is_jalr_insn(insn2);
+}
+
+#define JALR_SIGN_MASK		BIT(I_IMM_SIGN_OPOFF - I_IMM_11_0_OPOFF)
+#define JALR_OFFSET_MASK	I_IMM_11_0_MASK
+#define AUIPC_OFFSET_MASK	U_IMM_31_12_MASK
+#define AUIPC_PAD		(0x00001000)
+#define JALR_SHIFT		I_IMM_11_0_OPOFF
+
+#define to_jalr_imm(offset)						\
+	((offset & I_IMM_11_0_MASK) << I_IMM_11_0_OPOFF)
+
+#define to_auipc_imm(offset)						\
+	((offset & JALR_SIGN_MASK) ?					\
+	((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) :			\
+	(offset & AUIPC_OFFSET_MASK))
+
+static void riscv_alternative_fix_auipc_jalr(unsigned int *alt_ptr,
+					     unsigned int len, int patch_offset)
+{
+	int num_instr = len / sizeof(u32);
+	unsigned int call[2];
+	int i;
+	int imm1;
+	u32 rd1;
+
+	for (i = 0; i < num_instr; i++) {
+		/* is there a further instruction? */
+		if (i + 1 >= num_instr)
+			continue;
+
+		if (!is_auipc_jalr_pair(*(alt_ptr + i), *(alt_ptr + i + 1)))
+			continue;
+
+		/* call will use ra register */
+		rd1 = EXTRACT_RD_REG(*(alt_ptr + i));
+		if (rd1 != 1)
+			continue;
+
+		/* get and adjust new target address */
+		imm1 = EXTRACT_UTYPE_IMM(*(alt_ptr + i));
+		imm1 += EXTRACT_ITYPE_IMM(*(alt_ptr + i + 1));
+		imm1 -= patch_offset;
+
+		/* pick the original auipc + jalr */
+		call[0] = *(alt_ptr + i);
+		call[1] = *(alt_ptr + i + 1);
+
+		/* drop the old IMMs */
+		call[0] &= ~(U_IMM_31_12_MASK);
+		call[1] &= ~(I_IMM_11_0_MASK << I_IMM_11_0_OPOFF);
+
+		/* add the adapted IMMs */
+		call[0] |= to_auipc_imm(imm1);
+		call[1] |= to_jalr_imm(imm1);
+
+		/* patch the call place again */
+		patch_text_nosync(alt_ptr + i, call, 8);
+	}
+}
+
 static bool errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigned long impid)
 {
 	if (!IS_ENABLED(CONFIG_ERRATA_ANDES_CMO))
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
