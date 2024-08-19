Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3942EC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 18:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=43S2cCBuEtPdqNHsIwCeDvDkJIFu7kUbljX6/feU6ZA=; b=0YVAXj8aJ7P7DV
	g9k/9ug33xwq0g3jQDI0CMOI3E5xIUyGh9ucjaZg4HHPFWKiKIupk2gfz68bnae7LPiyE3I7rZRVn
	TV61fKql+p1rsy13lErSEElY+i2TYNExYLbL6F7FIjovI8+Ohfr2wJjaFxygBrfNVohZR3Rx+s9al
	PsFTDYwzs0g1kJV61w9ffDwKZb+bLT+xqCOewzvgM1/A/9NFAqVPy21s33DtPVv5E2oT53TYn1zv0
	TQR/mMfPhKX8gy3PC+Cm4+PduKTJXB54phXMZagMpVuqZ4lh6h1p/Qlpe89EXEBmC0JbDH/ZzMLj6
	ZiqKXj0T2CwWDxtz8BqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg6kN-00000002Uzi-0pe2;
	Mon, 19 Aug 2024 18:04:51 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg6kK-00000002Uz2-0k9m
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 18:04:49 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7140962ac9eso30178b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 11:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724090687; x=1724695487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oRCst/mJFl2Z5sGmOEBBU5/Fl/39H0BD6NmUA32/Xac=;
        b=WBc3vUxlI74ZINnDdSmFKtji2BpKy4cZgDS7FY6Fa/WFrythnTIE2n1O0pyEJBo1t+
         +/ZbD/vWVukfzH+/7oNurz5XC3XP3Qp2vXon9pw8IAaM0R3lhsNt7dTFG+OabCzTp3u6
         bNBJBKIq8s6UXZpbnC3KbQjck9YJC51jNx6yJe0Pxxy5HS3PJVGAsiAnaL+SAWYoStxn
         Fqbyn2/ZzQOzQ3l3ju4SJOImb9oqmvsyUQY631GvbixedObPIdzIn6QlEwhU3nX770hX
         21qjoSY8OYXuxI+m1wVZdaWWprXXGp/4kGtEC29uFvyhkjjMwZrSKuat0Uud/+J/I5GE
         OYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724090687; x=1724695487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRCst/mJFl2Z5sGmOEBBU5/Fl/39H0BD6NmUA32/Xac=;
        b=o8c7+PzjJIcoxmFr25iFByBD5sQzgIaVSF1UclfUZ8PW9NH1KOQz028XqRcy19eV1L
         fpGP/lCl9d7Vz+44EJlp5OCACd0cWavCnWrlYv5GAGPzv6k7s3lo4thJCaA/aXKBYenT
         rXRFtFO/01GBKJckeR1X/F++bLuGJ0TXOuv82PbMXARxdzSMgNaI2CxSme11qk+d9zR5
         vUTHlHdlZhGo341beYVxxaZMQiLOPWXw2Zy7lgK//0z2/YW1neKADCkeIez96cYtPcjQ
         R8mtRI0pMfeY6VHgY+nNKOGq2Fykj2Oz1yXMpMXPPEN9a5WFNdwhrTqyuyharxDVX2kh
         bH9w==
X-Gm-Message-State: AOJu0YwH3Bsz0Q+SRBUqfMkQnxP1wSIHWZ+HuvQt9QhjX55GNGCpTu1I
	MSJ6Ln68hqMBk8bcw7M73mten3kKNwPtIA0te7PwWGqCMGrWhek0eQ+p68WMbZZUkNTYS1ZBglL
	t
X-Google-Smtp-Source: AGHT+IGxAiLTim6Ov8tR0HmBj/x1W1FepMhWEnzMwXhbeDlv2es5Fx4JZULBVKA0Tici7M3baSfe8g==
X-Received: by 2002:a05:6a00:3cd2:b0:706:aa39:d5c1 with SMTP id d2e1a72fcca58-714081b6755mr593351b3a.8.1724090686862;
        Mon, 19 Aug 2024 11:04:46 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127aef5457sm6846498b3a.127.2024.08.19.11.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 11:04:46 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] RISC-V: hwprobe: Use BIT macro to avoid warnings
Date: Mon, 19 Aug 2024 14:04:43 -0400
Message-ID: <20240819180443.1774641-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_110448_238938_5BE54E23 
X-CRM114-Status: UNSURE (   9.06  )
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

In uapi/asm/hwprobe.h file, (1 << N) is used to define the bit feild
this causes checkpatch to warn. Use BIT(N) and BIT_ULL(N) to avoid
warnings.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 102 +++++++++++++-------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index b706c8e47b02..d0874ff2fd37 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -21,57 +21,57 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	BIT_ULL(0)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
-#define		RISCV_HWPROBE_IMA_FD		(1 << 0)
-#define		RISCV_HWPROBE_IMA_C		(1 << 1)
-#define		RISCV_HWPROBE_IMA_V		(1 << 2)
-#define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
-#define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
-#define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
-#define		RISCV_HWPROBE_EXT_ZICBOZ	(1 << 6)
-#define		RISCV_HWPROBE_EXT_ZBC		(1 << 7)
-#define		RISCV_HWPROBE_EXT_ZBKB		(1 << 8)
-#define		RISCV_HWPROBE_EXT_ZBKC		(1 << 9)
-#define		RISCV_HWPROBE_EXT_ZBKX		(1 << 10)
-#define		RISCV_HWPROBE_EXT_ZKND		(1 << 11)
-#define		RISCV_HWPROBE_EXT_ZKNE		(1 << 12)
-#define		RISCV_HWPROBE_EXT_ZKNH		(1 << 13)
-#define		RISCV_HWPROBE_EXT_ZKSED		(1 << 14)
-#define		RISCV_HWPROBE_EXT_ZKSH		(1 << 15)
-#define		RISCV_HWPROBE_EXT_ZKT		(1 << 16)
-#define		RISCV_HWPROBE_EXT_ZVBB		(1 << 17)
-#define		RISCV_HWPROBE_EXT_ZVBC		(1 << 18)
-#define		RISCV_HWPROBE_EXT_ZVKB		(1 << 19)
-#define		RISCV_HWPROBE_EXT_ZVKG		(1 << 20)
-#define		RISCV_HWPROBE_EXT_ZVKNED	(1 << 21)
-#define		RISCV_HWPROBE_EXT_ZVKNHA	(1 << 22)
-#define		RISCV_HWPROBE_EXT_ZVKNHB	(1 << 23)
-#define		RISCV_HWPROBE_EXT_ZVKSED	(1 << 24)
-#define		RISCV_HWPROBE_EXT_ZVKSH		(1 << 25)
-#define		RISCV_HWPROBE_EXT_ZVKT		(1 << 26)
-#define		RISCV_HWPROBE_EXT_ZFH		(1 << 27)
-#define		RISCV_HWPROBE_EXT_ZFHMIN	(1 << 28)
-#define		RISCV_HWPROBE_EXT_ZIHINTNTL	(1 << 29)
-#define		RISCV_HWPROBE_EXT_ZVFH		(1 << 30)
-#define		RISCV_HWPROBE_EXT_ZVFHMIN	(1ULL << 31)
-#define		RISCV_HWPROBE_EXT_ZFA		(1ULL << 32)
-#define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
-#define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
-#define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
-#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	(1ULL << 36)
-#define		RISCV_HWPROBE_EXT_ZVE32X	(1ULL << 37)
-#define		RISCV_HWPROBE_EXT_ZVE32F	(1ULL << 38)
-#define		RISCV_HWPROBE_EXT_ZVE64X	(1ULL << 39)
-#define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
-#define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
-#define		RISCV_HWPROBE_EXT_ZIMOP		(1ULL << 42)
-#define		RISCV_HWPROBE_EXT_ZCA		(1ULL << 43)
-#define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 44)
-#define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 45)
-#define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
-#define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
-#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
+#define		RISCV_HWPROBE_IMA_FD		BIT_ULL(0)
+#define		RISCV_HWPROBE_IMA_C		BIT_ULL(1)
+#define		RISCV_HWPROBE_IMA_V		BIT_ULL(2)
+#define		RISCV_HWPROBE_EXT_ZBA		BIT_ULL(3)
+#define		RISCV_HWPROBE_EXT_ZBB		BIT_ULL(4)
+#define		RISCV_HWPROBE_EXT_ZBS		BIT_ULL(5)
+#define		RISCV_HWPROBE_EXT_ZICBOZ	BIT_ULL(6)
+#define		RISCV_HWPROBE_EXT_ZBC		BIT_ULL(7)
+#define		RISCV_HWPROBE_EXT_ZBKB		BIT_ULL(8)
+#define		RISCV_HWPROBE_EXT_ZBKC		BIT_ULL(9)
+#define		RISCV_HWPROBE_EXT_ZBKX		BIT_ULL(10)
+#define		RISCV_HWPROBE_EXT_ZKND		BIT_ULL(11)
+#define		RISCV_HWPROBE_EXT_ZKNE		BIT_ULL(12)
+#define		RISCV_HWPROBE_EXT_ZKNH		BIT_ULL(13)
+#define		RISCV_HWPROBE_EXT_ZKSED		BIT_ULL(14)
+#define		RISCV_HWPROBE_EXT_ZKSH		BIT_ULL(15)
+#define		RISCV_HWPROBE_EXT_ZKT		BIT_ULL(16)
+#define		RISCV_HWPROBE_EXT_ZVBB		BIT_ULL(17)
+#define		RISCV_HWPROBE_EXT_ZVBC		BIT_ULL(18)
+#define		RISCV_HWPROBE_EXT_ZVKB		BIT_ULL(19)
+#define		RISCV_HWPROBE_EXT_ZVKG		BIT_ULL(20)
+#define		RISCV_HWPROBE_EXT_ZVKNED	BIT_ULL(21)
+#define		RISCV_HWPROBE_EXT_ZVKNHA	BIT_ULL(22)
+#define		RISCV_HWPROBE_EXT_ZVKNHB	BIT_ULL(23)
+#define		RISCV_HWPROBE_EXT_ZVKSED	BIT_ULL(24)
+#define		RISCV_HWPROBE_EXT_ZVKSH		BIT_ULL(25)
+#define		RISCV_HWPROBE_EXT_ZVKT		BIT_ULL(26)
+#define		RISCV_HWPROBE_EXT_ZFH		BIT_ULL(27)
+#define		RISCV_HWPROBE_EXT_ZFHMIN	BIT_ULL(28)
+#define		RISCV_HWPROBE_EXT_ZIHINTNTL	BIT_ULL(29)
+#define		RISCV_HWPROBE_EXT_ZVFH		BIT_ULL(30)
+#define		RISCV_HWPROBE_EXT_ZVFHMIN	BIT_ULL(31)
+#define		RISCV_HWPROBE_EXT_ZFA		BIT_ULL(32)
+#define		RISCV_HWPROBE_EXT_ZTSO		BIT_ULL(33)
+#define		RISCV_HWPROBE_EXT_ZACAS		BIT_ULL(34)
+#define		RISCV_HWPROBE_EXT_ZICOND	BIT_ULL(35)
+#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	BIT_ULL(36)
+#define		RISCV_HWPROBE_EXT_ZVE32X	BIT_ULL(37)
+#define		RISCV_HWPROBE_EXT_ZVE32F	BIT_ULL(38)
+#define		RISCV_HWPROBE_EXT_ZVE64X	BIT_ULL(39)
+#define		RISCV_HWPROBE_EXT_ZVE64F	BIT_ULL(40)
+#define		RISCV_HWPROBE_EXT_ZVE64D	BIT_ULL(41)
+#define		RISCV_HWPROBE_EXT_ZIMOP		BIT_ULL(42)
+#define		RISCV_HWPROBE_EXT_ZCA		BIT_ULL(43)
+#define		RISCV_HWPROBE_EXT_ZCB		BIT_ULL(44)
+#define		RISCV_HWPROBE_EXT_ZCD		BIT_ULL(45)
+#define		RISCV_HWPROBE_EXT_ZCF		BIT_ULL(46)
+#define		RISCV_HWPROBE_EXT_ZCMOP		BIT_ULL(47)
+#define		RISCV_HWPROBE_EXT_ZAWRS		BIT_ULL(48)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
@@ -85,6 +85,6 @@ struct riscv_hwprobe {
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
-#define RISCV_HWPROBE_WHICH_CPUS	(1 << 0)
+#define RISCV_HWPROBE_WHICH_CPUS	BIT(0)
 
 #endif
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
