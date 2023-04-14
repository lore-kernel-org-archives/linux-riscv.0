Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138B2C77B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 15:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elXZOFJP8tWFggNBA0Iqfm8ZX6NVNQfyLblxA8T/tDw=; b=EhtyUY/SR0kNy0
	xgeX8+d+fi8rFQ1iFBhFLCPxJWN//nKmzUvKemCNwDtV19KoMfRpzY5EFwL0IaF0DcZzQn9EEpn6z
	eUBAEW3OM6KhsFaiieoPh5Ja4Hi1lm2nvl5PR6eAApnEbsJoFf23Fp86Kfiozub22ehfD4lc8ToSB
	LaeWaDTQe9lAdJHCe5v+aavuY+PgUKQ0G6IjbNwy8lJRGUOpK7PNUbuXriG2bZs9pOJka4bu0HHd3
	ThvORnbBXFT/LS2jAYOlncMiybeYveX0HoR+9e2GosRn8ayPgzedS23z2eInSOn/yDT8FB3XLvvkt
	62vzNTsE11S/0KYmqGyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpT-00A1XN-1Z;
	Fri, 14 Apr 2023 15:59:15 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpQ-00A1RX-13
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 15:59:14 +0000
Received: by mail-pj1-x102d.google.com with SMTP id cm18-20020a17090afa1200b0024713adf69dso6560212pjb.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681487951; x=1684079951;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q1Z9F1WWwWuoKVJ9t2cYpsn8ieMzUKF7G5wAxvaa99I=;
        b=lJSZ+Yo8VhC9W/LYpyoV2wpRLacsn0bF9TUYh/9nkCO4lhjkZByNRGRG1LeA39hSvi
         5H5NFhDBuDEqmFhZE4pDGeGmjHCRPfF98HaFcpIVG0osVtXBXGQGy+Ej8jqiez1WROlH
         tIfqMHPgjJ0754QswUVwTlRNMUn11dBiyXxYj4kWv+/feLZWqoUa/vQt7Xiv9o1i9nQq
         CyltCcy/feV6x6S8e/+A/58IXp7zImBDmp/8MZwS+4AmX6Vk1PSxd+uibr4KfzLJLrio
         anXne7kv4KJbFwqUjpxxgDhlu1InzmZLou8i5GIzXGaIMu8JUEFxa80CK0tPgQBuQPLO
         uDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487951; x=1684079951;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1Z9F1WWwWuoKVJ9t2cYpsn8ieMzUKF7G5wAxvaa99I=;
        b=ZQCdZBWNsFrDAaL5onsrNdMYCmrOx2SXNVDmpCfPeJ7rOUfo5C4SMM1JFVhbYZI2CD
         UJQ8c3Mm8U8ok0C+ozazv2QtgshgBHy6F4IVYpROcYtGMoUhnqkR2eEGJpTOeXRkxQK6
         dBTT0DfR4lCgpqSZBswzS8PjM/VAJtDrQaQMXXWTdA3rUzEI+ICYBkFF04RZQBI6moVb
         ePoSwOroZlbRmkAJTjwON6k5SRGO9rMeQKTIwAqnftl+i8lgnCDxdcKst9ByZA4EjIx8
         Z7p0Sd8HMvEmucZEsHZn6qyEIkWevD5yPtQWvwpQm2wM2qwLBRGmhWJCROOsl6KkTdJT
         C4Yw==
X-Gm-Message-State: AAQBX9eVztbZiY/XVaroxwinOe0H3H2WKp7/cZ9N4139wuGa0tKrWJMI
	NPKv3RXSvPB+LkfDb5L86T082d4rZXjmxmDJG6OChSJGMGhT7gPuXzTeKTzLtQ3mJ4440WHsMKv
	OsSuMxthGM/Upn8pGuLa80NcNWAL5TfC4W3j0KL9txsdHx9iZPAXf1P38Q+kqMKNcYQU37vZ3e3
	2yhJi1RgMntaCv
X-Google-Smtp-Source: AKy350bprE0+W3CBUSvvYObjUvXLMYFHaBAzhudwABw1qf28V38FrSV2m24wt8iLQdpiZ/P8N9+bZg==
X-Received: by 2002:a17:90b:70a:b0:240:9ccf:41ff with SMTP id s10-20020a17090b070a00b002409ccf41ffmr5501300pjz.49.1681487951281;
        Fri, 14 Apr 2023 08:59:11 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.08.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 08:59:10 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH -next v18 03/20] riscv: Add new csr defines related to vector extension
Date: Fri, 14 Apr 2023 15:58:26 +0000
Message-Id: <20230414155843.12963-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_085912_363501_221C6773 
X-CRM114-Status: UNSURE (   8.29  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

Follow the riscv vector spec to add new csr numbers.

Acked-by: Guo Ren <guoren@kernel.org>
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/csr.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 7c2b8cdb7b77..39f3fde69ee5 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -24,16 +24,24 @@
 #define SR_FS_CLEAN	_AC(0x00004000, UL)
 #define SR_FS_DIRTY	_AC(0x00006000, UL)
 
+#define SR_VS		_AC(0x00000600, UL) /* Vector Status */
+#define SR_VS_OFF	_AC(0x00000000, UL)
+#define SR_VS_INITIAL	_AC(0x00000200, UL)
+#define SR_VS_CLEAN	_AC(0x00000400, UL)
+#define SR_VS_DIRTY	_AC(0x00000600, UL)
+
 #define SR_XS		_AC(0x00018000, UL) /* Extension Status */
 #define SR_XS_OFF	_AC(0x00000000, UL)
 #define SR_XS_INITIAL	_AC(0x00008000, UL)
 #define SR_XS_CLEAN	_AC(0x00010000, UL)
 #define SR_XS_DIRTY	_AC(0x00018000, UL)
 
+#define SR_FS_VS	(SR_FS | SR_VS) /* Vector and Floating-Point Unit */
+
 #ifndef CONFIG_64BIT
-#define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x80000000, UL) /* FS/VS/XS dirty */
 #else
-#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
 #endif
 
 #ifdef CONFIG_64BIT
@@ -296,6 +304,12 @@
 #define CSR_MIMPID		0xf13
 #define CSR_MHARTID		0xf14
 
+#define CSR_VSTART		0x8
+#define CSR_VCSR		0xf
+#define CSR_VL			0xc20
+#define CSR_VTYPE		0xc21
+#define CSR_VLENB		0xc22
+
 #ifdef CONFIG_RISCV_M_MODE
 # define CSR_STATUS	CSR_MSTATUS
 # define CSR_IE		CSR_MIE
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
