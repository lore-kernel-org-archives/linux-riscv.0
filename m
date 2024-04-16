Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397A9C04FF9
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 04:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EOKfOLFnrl7mdYbvMTqWtvAoYJczObP79M2rGQMDLqg=; b=hFy6rIIucQ9+OD
	xGT5nOL1tKiCM9Gu1q+qlw12R0r0GjP/cPdTa8Q9IHUoZ0zPxFJqLSmghmik8B1U4gTYlXphswpCO
	N9BcLDxhsf/LNpuXZIt56IS+pH06IrFT0+HNY8wlUH6FgE1QIS86GboapY+c2e2NGy/A9ur5HHNA1
	69Ju5TvgQmaxQa6xBS57XwKriVViJzCeolmkbZdzcj4A6ApLJOGibjqI6qlCTZhukn/Y/Jp8iNubU
	BVtwhmoVJSuHGASvH7CjUeIkxLPL+jKD/UAXcsbBLMz7eexs3kEE9+ZZUkgGw1RvxA5SkM2gACUCI
	9GC8Ed9cQoaXd3fUBqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaDv-0000000AmlI-1Ok1;
	Tue, 16 Apr 2024 04:15:11 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaB9-0000000AkV1-2vuZ
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 04:12:23 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ed3cafd766so3133472b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 21:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240737; x=1713845537; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lt9+WFFQa5ypEuNBueQsHraOx3Sw6YlRb9NPkxzQDbc=;
        b=gyfvOkcd1I3NcliQ3mfOr8CRessxN1iU/Wcu08g3cgxUe7SHo+9Tp9W3QjbePJr1ON
         IRedb9TAelUDvhGdZXgBer83zCtvxMMR6qfYAL1qryOb4UnYwaqmYEAYVtBAH1ES3fsj
         HH018uAH3g4skgMgdpbuIY0WNaZ9FzZTXIF8vsKZRTAgp8RbWixo/KUuBuQemrNh6zfd
         UuVan8V9ogqmUrZ+ijMij71ClaxUSs6Qfw52zGa5B4dMsxHDr5WaxbZ/YEVLwt7stKW/
         XU7TsptU/ceOVkYv0wYGV0BBp30oby/e/rJqWSjib+ifId9sXtnSc9olCZD/c4scbyIm
         Blww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240737; x=1713845537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lt9+WFFQa5ypEuNBueQsHraOx3Sw6YlRb9NPkxzQDbc=;
        b=ANCSUDOo5UJtGhx/m42E6sejW9C1rybBx/NouhPHrFBshi0ZbBFyDJ2P+lsPNMFDlb
         sSMCMpXrDr4thNaCNGRnejGUeHwQkfwR2f8o384+x42pJwNp2Gwmaxb5kj0RZRA1oB/c
         ixpWaqonBul2WgiYiOOSx1th4f5njQraqYJpuJTfhMwWY6ItBeSXVqhIAi0MypsFQ2tv
         QkY8cm5JXcCqdxnBDNUnKyvGtlT7sqfNb01qasAKRO0n8a4vrTrVK2731CgUTyzPrY2H
         uzmXs04qhOEZWWab1slq0wpwIyft4l/0b+2jvho19aY21/Ay89PtN9s31358Du5d9ODi
         VALw==
X-Gm-Message-State: AOJu0YxCcV4DjKEC+GPe5oBgJIuasMnuYNuln87OP+d+7MtozjBhYfkL
	xUPurEObTGw0VXcy8KWmsHkIq+qxP+0lg6JW6qtTm4ZHOxDLfPH/rzaW94PDWoRgAVK3kaoKrTw
	+
X-Google-Smtp-Source: AGHT+IHCNCA1HXhs7dCFTKMFTWnzq8i+GYhA6+4Dbcx+4s0UknMRIzl057VqWDeyJSsM3TdjS4r2BA==
X-Received: by 2002:a05:6a00:2308:b0:6e7:3223:4556 with SMTP id h8-20020a056a00230800b006e732234556mr11616992pfh.32.1713240735967;
        Mon, 15 Apr 2024 21:12:15 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:15 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:06 -0700
Subject: [PATCH v2 09/17] riscv: uaccess: Add alternative for xtheadvector
 uaccess
MIME-Version: 1.0
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-9-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=1060;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=pB2VSPvj33lI/8AQbCi/3smUxH+y5ljsCL7cqqiQMp0=;
 b=dG18cYHtMBrx7rXL/eDJ2J/MEkXppkdVPVqNGAzWfC+Il8JQEsduUE1vvr/F4ONbgf1PyHIwe
 CJzJ8zZcdQTAxXdraBfQwbJEfD2R9/JWH+8NHRtQIw3nfMBSlLS4cMj
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_211219_987527_50DD3F4D 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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

At this time, use the fallback uaccess routines rather than customizing
the vectorized uaccess routines to be compatible with xtheadvector.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/lib/uaccess.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index bc22c078aba8..1fe798666aee 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -5,6 +5,7 @@
 #include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
+#include <asm/vendorid_list.h>
 
 	.macro fixup op reg addr lbl
 100:
@@ -15,6 +16,7 @@
 SYM_FUNC_START(__asm_copy_to_user)
 #ifdef CONFIG_RISCV_ISA_V
 	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)
+	ALTERNATIVE("nop", "j fallback_scalar_usercopy", THEAD_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XTHEADVECTOR, CONFIG_RISCV_ISA_XTHEADVECTOR)
 	REG_L	t0, riscv_v_usercopy_threshold
 	bltu	a2, t0, fallback_scalar_usercopy
 	tail enter_vector_usercopy

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
