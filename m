Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD75DC4707B
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Dec 2023 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j75i7oppd+P1FUYtiuXVZ6Hw2oYtZWTk3uj0p6uL+VA=; b=1m5/3ulIbBdDcc
	SXm2U9jsL9Enm0YHIYrk2x2meSiA99ss/vAtSI2NCLGgYauE2VSag1Xz2dI0GfQXMZkaeioQjn/Pp
	Tv/s2PVUv/eqeO+wrWbWnbElfNtPpc+qzcRtMUBsRllB16pYf90PK4T1XPzSlCkMKR2ArFrw5yPQT
	5a0LxdDFEdnH4uDkY0dR1ec2X+a+QNaheYrSD469j3T7OyXyxpkwQmK9/sIMpcrI5OACTP8v+dU25
	RmugPgOqkevCpdTOCnT1mBRQ8DBtK7cb+NWC6beH0BLy+Mb25UY1TKmE4i3uYQkVhNIhTlfKcIBaC
	W5kMMha9L/EsakIFUyUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJxjV-004mSQ-09;
	Sun, 31 Dec 2023 15:28:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJxjQ-004mPu-0c
	for linux-riscv@lists.infradead.org;
	Sun, 31 Dec 2023 15:28:05 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d3ed1ca402so63153825ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 31 Dec 2023 07:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704036483; x=1704641283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuCoCK+SW4zawUSFFv0erKPf4OwGQ3cihPvdb62nAAQ=;
        b=ZoVDp4WLvqWSdxTafwrGNZYmMHC+JnoBWBKgfvnVRnImbVfTMFPySjxS47bY0QF+Ja
         ekyXl4RY+Clw8rqvMf38bLwf/gfkYvwhGd4NvvWuLpdPLWmKooAVAdNV3aE0RdKd6oRe
         OGKzNGvKdeDk6so3c55K5RyaisooyVYJ30fSqnzVfXiNmD20YBgoQfivRR6Zuu07wvrS
         bs1erOP+dCmGypq9QtGQG3GQlwVLV4Bg8034moE8Udg/BLLaXPp1dWTpJ8DTdr+Rx3Yk
         VfiUZumfo7ulVpo4YaoaRec8IhMlj56Cz9LyqXswlvrlEL3UYBmyV4ySiAvBvXxJFc4F
         Dxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704036483; x=1704641283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuCoCK+SW4zawUSFFv0erKPf4OwGQ3cihPvdb62nAAQ=;
        b=l9prNiOCl39q4sjchWJ1I8Iax5+BdeJBeByEPX67f3KhKa2joQGbtLmyNL59dUDeuG
         8fzBZTZUVAYqs038FkrOY3TDEUUAkJq0haNaHaXnBnnb0L60hVnNHUp1Xgdshhb4jK1p
         nDpH1v3jC/TGfzBRqED9TX0wvZAujZ+BvvfZj5h7qteMw/ghOff8mbpHi/8WFj51Q+pN
         3mFF3HJpjvMTQwB27QybyNlXBOQ8G++eJHnQIMwnup+1uknWlkoH50c+ep5Ya4Po7Mh/
         Y9prsHmFbTVpOzxP/MOjNUJWfVHvFC+8jFIaVKGYS77z+jg1oxJwGDZPJuBgLELTuT7O
         r5gg==
X-Gm-Message-State: AOJu0YzwRbSG3x+8iXNfB6SMjVINmDq5X9dWJQ9CvbFs1sJZZ9MVfzyW
	Ey9zy+3MUWbp+4LBKCsgm9vCd6avuE8fZg==
X-Google-Smtp-Source: AGHT+IFrXdhgAdCMZNHHFRjvOLoIEeS5k4qN1vslTS4fA+aVRSXmXy/wbfSG12vHdQUE2i/D13D4aw==
X-Received: by 2002:a17:903:1ca:b0:1d4:25ec:5975 with SMTP id e10-20020a17090301ca00b001d425ec5975mr20365331plh.10.1704036483091;
        Sun, 31 Dec 2023 07:28:03 -0800 (PST)
Received: from localhost.localdomain ([49.216.222.63])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001cc3c521affsm18624430plf.300.2023.12.31.07.28.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Dec 2023 07:28:02 -0800 (PST)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	ebiggers@kernel.org,
	ardb@kernel.org
Cc: heiko@sntech.de,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH v4 03/11] RISC-V: add TOOLCHAIN_HAS_VECTOR_CRYPTO in kconfig
Date: Sun, 31 Dec 2023 23:27:35 +0800
Message-Id: <20231231152743.6304-4-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20231231152743.6304-1-jerry.shih@sifive.com>
References: <20231231152743.6304-1-jerry.shih@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231231_072804_287220_0D0783C5 
X-CRM114-Status: UNSURE (   8.56  )
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

LLVM main and binutils master now both fully support v1.0 of the RISC-V
vector crypto extensions. Check the assembler capability for using the
vector crypto asm mnemonics in kernel.

Co-developed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
---
 arch/riscv/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0a03d72706b5..8647392ece0b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -636,6 +636,14 @@ config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	  versions of clang and GCC to be passed to GAS, which has the same result
 	  as passing zicsr and zifencei to -march.
 
+# This option indicates that the toolchain supports all v1.0 vector crypto
+# extensions, including Zvk*, Zvbb, and Zvbc. The LLVM added all of these at
+# once. The binutils added all except Zvkb, then added Zvkb. So we just check
+# for Zvkb.
+config TOOLCHAIN_HAS_VECTOR_CRYPTO
+	def_bool $(as-instr, .option arch$(comma) +zvkb)
+	depends on AS_HAS_OPTION_ARCH
+
 config FPU
 	bool "FPU support"
 	default y
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
