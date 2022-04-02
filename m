Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32569C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 05:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3QGLFprss1KFMFto5QrogEp8BVRmNdvoJGTcTMyn4w=; b=NQfkeiLZe5QMXm
	JzRi7NHp0nsPaxU+zjkb3j1YM3/IgfOXTIuvokcuGzq8tARsK/jMm1D9d9mM0ZQUfIHf1dyBn04JM
	4wx0uMKah7IQpZg6gCqhmDR9aOOCzjdm6dl6P3SMLyKvMVi9+sVXFuyqg0KcK7N5XID2Lmezm50WS
	AWBPoxu3ht3EizZoKwj6+Gx5qt9a6jgnRNzC/qM/bAt8dqSjhk8KSecujfvBouThHkp7lLuVbqVCB
	orMO6Omp8QZ5t+FBVX9sbVKOFvBM1xfg7kQ1IxUurxTdM5N3tY6q5N1xwvfMFGPTsSrU7+gCK7O4S
	0C8rkLxePGTE9D6Hh43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naVvk-007zhV-IR; Sat, 02 Apr 2022 05:04:08 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naVva-007zda-Ub
 for linux-riscv@lists.infradead.org; Sat, 02 Apr 2022 05:04:00 +0000
Received: by mail-pf1-x430.google.com with SMTP id z16so4397461pfh.3
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 22:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=MOEc80EVu9LfPpN54gEHoEdN0FMqafE5/jJyB+b2mcQ=;
 b=jhrejZOdnoC3eyhsTj3pPDaw6LbO/PRUtVHyrItKfu/Hxp9RzGdFirr0W/I0tAJzd0
 mMjap3JgxYJgaFwpQ17fzCS+xLQgKSGj9OkIijYfvQaTPIKQmCI2S4gQMYAuKDfgPGvM
 oaYgqZLnRyyevysIfQO3LAH3EbF5I2NmQhcS5v1asdrgFTZqWb54rMjwGF+azI/uvh/a
 NLsoHR0z1lwC+C9d1qaN6P2KhMzf1QvrqYa/hK6h/j/96ThM0XZdFtLq7qG6afqM0S+o
 hx2h6oXYH11QU6oqmg/466YiTwH0MfGR78NXsKNSkH0Y2ovlVXpFRb1+oy0v2yoTjAQb
 i2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=MOEc80EVu9LfPpN54gEHoEdN0FMqafE5/jJyB+b2mcQ=;
 b=KjcJTXcVV6zKm8kQD/jiz2wj8eJhgs7PJRr1TU7Fmr+INoYABNyloMu3ocbiLEaDhz
 er4MEJwVioHJwm+ZTyIupQAYp5iNQwFrlLCLTMR+ap8n9PSosLWvfp9TCeCv/rIOfhjk
 SSvwGatwTpcvNEYU3XaxVMPRcQ/tKQLBrqn7VGv9T5dWqC07VKFqB0YaAmPQW5DrY0zy
 Za6bUNGvBAAuMjDsmkCXZggduzO/+GSJqr+TyTYLLI5po5kW9fz7dj8xDinhMsYQA4f4
 gBKWxC/T1qlM/TiCTR8WBtlfPdLd1G8KM6FXF6wqMsOxDIZ3O7A8jv87Iw8Mw3XAGzo8
 g7rw==
X-Gm-Message-State: AOAM531iTWqurRTc0IfpKXV61JP9UJbdT1hXNLWxyOrgeAWVM/KCq+CU
 5+OfB9F+BW1H4RE7pMpS1Cg3DZwmYYUa/PDH
X-Google-Smtp-Source: ABdhPJzjE4F5YlDo9VkfroSgEXumyc5+9wPltlUAM1k1EEn2FDmR+A5Gu8mTDmCCERRgBRQ+C5t9IQ==
X-Received: by 2002:a63:4c6:0:b0:385:f757:1e65 with SMTP id
 189-20020a6304c6000000b00385f7571e65mr17993384pge.453.1648875837535; 
 Fri, 01 Apr 2022 22:03:57 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 y30-20020a056a001c9e00b004fa9246adcbsm4376917pfw.144.2022.04.01.22.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 22:03:57 -0700 (PDT)
Subject: [PATCH v1 5/6] RISC-V: Add the Zicsr extension
Date: Fri,  1 Apr 2022 22:00:40 -0700
Message-Id: <20220402050041.21302-6-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220402050041.21302-1-palmer@rivosinc.com>
References: <20220402050041.21302-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-sparse@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
 linux-riscv@lists.infradead.org, mkl@pengutronix.de, aurelien@aurel32.net,
 Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_220359_060364_B68FFFC5 
X-CRM114-Status: GOOD (  11.61  )
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

Recent versions of binutils default to an ISA spec version that doesn't
include Zicsr as part of I, so Linux has recently started passing this
in -march.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target-riscv.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target-riscv.c b/target-riscv.c
index 5076bbaf..afd6fafa 100644
--- a/target-riscv.c
+++ b/target-riscv.c
@@ -17,6 +17,7 @@
 #define RISCV_EMBD	(1 << 9)
 #define RISCV_FPU	(RISCV_FLOAT|RISCV_DOUBLE|RISCV_FDIV)
 #define RISCV_GENERIC	(RISCV_MUL|RISCV_DIV|RISCV_ATOMIC|RISCV_FPU)
+#define RISCV_ZICSR	(1 << 10)
 
 static unsigned int riscv_flags;
 
@@ -34,9 +35,10 @@ static void parse_march_riscv(const char *arg)
 	}, extensions[] = {
 		{ "m",		RISCV_MUL|RISCV_DIV },
 		{ "a",		RISCV_ATOMIC },
-		{ "f",		RISCV_FLOAT|RISCV_FDIV },
-		{ "d",		RISCV_DOUBLE|RISCV_FDIV },
+		{ "f",		RISCV_FLOAT|RISCV_FDIV|RISCV_ZICSR },
+		{ "d",		RISCV_DOUBLE|RISCV_FDIV|RISCV_ZICSR },
 		{ "c",		RISCV_COMP },
+		{ "_zicsr",	RISCV_ZICSR },
 	};
 	int i;
 
@@ -128,6 +130,8 @@ static void predefine_riscv(const struct target *self)
 		predefine("__riscv_mul", 1, "1");
 	if ((riscv_flags & RISCV_MUL) && (riscv_flags & RISCV_DIV))
 		predefine("__riscv_muldiv", 1, "1");
+	if (riscv_flags & RISCV_ZICSR)
+		predefine("__riscv_zicsr", 1, "1");
 
 	if (cmodel)
 		predefine_strong("__riscv_cmodel_%s", cmodel);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
