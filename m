Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3A7C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 16:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjTgc+I/ukunZXtCkqgWVzmuubLfvGW24WubzK1+ya4=; b=TLCtGQEGwuutoh
	ReGbzeuK+LY/0uD+geJaDar/eC/vx1joYfACATsqF7UvVjMcxqUVVc/mP80CQ69qL/JwD6wqVu4HQ
	wvNOLwIsq28MGNbSY4ZYFagDf9FZdx8uDdZrrxFWICvOB9NOGrvNYB0KeiFjF8ZX7I20myKgdIEPJ
	YX2yN2Mu0h7jsla/gJIYukRgHehnq6mYJYNI5qMg5W7LEFeEsN76QqZnvQIOHIbBI6gTBF9lK3Dc+
	oIPL9JTCP2nWTV4tTmj7ho4JapEGD3FrxtwZMK1MD2MIb5C49W2svlrCuR72yp/s5GZrP/hKup6eO
	Ppe+Zj+qptC2bgYwhQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq2t-00Bl60-1n;
	Mon, 27 Mar 2023 16:50:11 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq2o-00Bl12-2P
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:50:09 +0000
Received: by mail-pf1-x42a.google.com with SMTP id g7so6125921pfu.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935804;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wxwN7g3H6Sw6hU6xeUFUVA8oVaitJPaamaFICOanx0U=;
        b=ddV9yf+Ej5SvPfEWDg02RLMqwomecI3qMrEVGh/489ozL+FbtvNWeB5Egzdce6DPzT
         SNdk/nyNvnaXpb/Wr/OZNUG3szjDDmTnI98Ey1KYmgCCqsSWPh+OzDfN3VhSpXtcB/Fy
         h+91EiWRFvP+I34noH8YmkXJBAl66SDJAC99ayt38GL8kf8VhbFsCarp5yaPA6pYHiK+
         zPGDHZGabPFF6S54c+Yo+ivQKK5r+wpDlkwRlslTJvHKdQThE7LLzG9L362VuYb1XvfD
         n8fk9LUdA8nSL51/snuo4AsyGxfxHKiWomOZOsdAsjK7ZSNQeXgVn9TIAxPRRkXGs2Xz
         cIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935804;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxwN7g3H6Sw6hU6xeUFUVA8oVaitJPaamaFICOanx0U=;
        b=oOiWhrNm3Xa3toJHWauJQgPysaZ5hjNhm8NLPSrytD2TYDUq8xCIuZtcHiX34VEpwE
         7L8Xm261Y+bN/Ey8ypBwa59PU0J9BCjGFe9VsbN4bQgbg6oekDBFGTzoA0J0NJhhDZ4I
         OIHW0StX9GFVmxYdeJjW8NypVW6EIkz67bwUcTYk0EGMltjsB2HsxDj+DPIT80bOzG90
         nyMQw9/x9Rd2tezgZmXyFA5LmXRWlYjuY2gPv1ZM7Wo0hvz7JvmIOPWGUD1afDTnmkMy
         7KnNY5Pu71pqhUN5hLCDKozc1qWNYRag3yW/OPKWx+zqAbqxc7872Vz3k4V4rFzF2ctj
         BB1Q==
X-Gm-Message-State: AAQBX9cUi5KE8Gvscd+6ByHLhME7L53Vz/Xfp2jn17hwBZ1Gug+fZHR7
	epKYZLBrm3lk0HFfN/ZlnzJRKmitPPeYL1BXKx2Tf7g4LQHr6ygK9VyEvscs7/BtmeuE6o4TaP+
	JkJyT67p00doRkV2tF6Z4oUac8WlwwypemRMakhwrE8ry6e5THYskc3FsMOsnwB7BnVsEsVlbvY
	Pvu+IiL7plxtH4
X-Google-Smtp-Source: AKy350bqYgUcs1CGvpZN85+lCPsdrnwLPwHuQVxFCsuTKyLVm9ww+/c9Hgu75VmL6DLbOYPm1hCZyQ==
X-Received: by 2002:a62:5543:0:b0:625:a012:a59c with SMTP id j64-20020a625543000000b00625a012a59cmr13619565pfb.9.1679935804570;
        Mon, 27 Mar 2023 09:50:04 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:50:04 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH -next v17 03/20] riscv: Add new csr defines related to vector extension
Date: Mon, 27 Mar 2023 16:49:23 +0000
Message-Id: <20230327164941.20491-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_095006_797496_5B83FCA7 
X-CRM114-Status: UNSURE (   8.25  )
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
