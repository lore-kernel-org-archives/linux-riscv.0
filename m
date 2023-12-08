Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76F4C10F04
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 05:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4MbBiD08wQXjGAMrYaAlG9kCFXAm7sxcWWR31RTmRM=; b=nwERmgMq+n9mJI
	Zkz/p2D46neDRoySQtH4GQULYreFnpeYr3Wv40E+1+84lB/Os9aulhBBnVSbgp2Oz/e/lSt5x5eKJ
	DCVSU5cHFTQAj6Rva/0AQ56aw+HmY5nBbLC1TMEn1TQK3Hs2W8ZnnUR2aMoiZc70uTY6hFX9qZzV3
	OkaJ0zLBMukgjvQQfdbkBPlYewAkuXY+R7rvTzo1wWq24sEKaubbelijYg/IrgkXqVwhoC6H6X+Zg
	IlSlKtDyLVYeAsds3xfMzN70S5dVvNbBFeYGi94crY7NvJdxWsoU79XB7DjTkPXwO2LYISwF7PNJq
	kr+wi8FZ3SWSMmUh6eeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpa-00EnhS-1L;
	Fri, 08 Dec 2023 05:55:22 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpM-00EnPN-0g
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 05:55:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d06d4d685aso12922615ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 21:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014906; x=1702619706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqG7sh4TEQnomN1Pb8iughMffScuejFKYmgaMeTCLmM=;
        b=DWo62Mz4F+jdqgnw8cwlBDvcj39TOuqKuIaPniv+Lt2X7g02FbotNtmiwBIr3eY8WQ
         ytWX8Tey3e2LPXnN1lKJFT2II/KfLKEEDFRkZXTYgU0t1QF7WNofk89s4WhXrg9pt0Ix
         FL2GhRB4MwzZfFV0ukM/bXvhz5HBn7gyPTYjge3JIOlps4mSYJeVVjQMdOcRw/O3jwxS
         P55nv8qwHkfhj2sEGzbFVZnfsH3IL7gUHTUsq2uCBCYYs1+SqUpJfdGuphRZB0t3HQu0
         FpN0W6LMfDJfgNYkt+aK4HeJNkRFgt27UdZ20S9Cvf26H9KAHuzlcJsmTatSbKpIDoT/
         c12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014906; x=1702619706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqG7sh4TEQnomN1Pb8iughMffScuejFKYmgaMeTCLmM=;
        b=W5LPWej8HB4Rm+QoNykG7Ec/NktzBaRfRG/01k6IIXit1MXitShfXn0/OFbNfCAKxI
         GQuDl+0FhWbCqL+Oj85BRiPx4HbrStIPWFltHd0qAl3abot3faKDuCsHfL6ALLINArQL
         T3ARGtXeng/XHvnzdaCZcVnfJD0pH6ZXpi3NtURXUtFnyd8qPLyBXfz2EyyDxa2N98ky
         YjaoiPNxBwiGJ5ttOvZVEvDQtYQMUJV+CUGp2PPfOGoKC2qtREmJ/AL/1cudP7AC5Jgz
         uDFfs1pZD74S1s7HQgSRn0jdhgFksJv92jNhEKyQ3VVOKliCaL6oSwsX15sIjs8Glmuo
         47yw==
X-Gm-Message-State: AOJu0YyJss1PWa3HdoLQggYg6kIU6kAWGy+ysmmMuA2rogNLiH3gH5z6
	y5kRxsErGi7E9J/B1ey+PN1q4g==
X-Google-Smtp-Source: AGHT+IFmoFC5Jy7QDutaZzebMhgROVCbFnFB+FkSDZrKf0b9QQV81pWWj0y7Aq09xAemAJ7UXgVmYQ==
X-Received: by 2002:a17:902:ee45:b0:1d0:6ffd:f205 with SMTP id 5-20020a170902ee4500b001d06ffdf205mr3064563plo.91.1702014906581;
        Thu, 07 Dec 2023 21:55:06 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:06 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 03/12] ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Thu,  7 Dec 2023 21:54:33 -0800
Message-ID: <20231208055501.2916202-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_215508_268780_C334EC49 
X-CRM114-Status: UNSURE (   9.70  )
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

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/arm/lib/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index 650404be6768..0ca5aae1bcc3 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -40,8 +40,7 @@ $(obj)/csumpartialcopy.o:	$(obj)/csumpartialcopygeneric.S
 $(obj)/csumpartialcopyuser.o:	$(obj)/csumpartialcopygeneric.S
 
 ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
-  NEON_FLAGS			:= -march=armv7-a -mfloat-abi=softfp -mfpu=neon
-  CFLAGS_xor-neon.o		+= $(NEON_FLAGS)
+  CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
   obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
 endif
 
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
