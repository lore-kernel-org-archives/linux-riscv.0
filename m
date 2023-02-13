Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA44C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvOm1tstckQYjgvdFbzMmRTPfZ59b602axdHThadM1A=; b=kqKWH+Q3pgOhG6
	wT09SNMhhoIOQu8rdqr/9VYiy1JyfbwfAbg7Esa1LjSjTzI/T+4Hz6HHm3QC0vaSKDLENkkWgQh9x
	Gv06dxbAPOjF+euBL8rSEIUBMhmHeZq0B//4+/JPuE0JY8gN6RbtOLumPkusgpXYbY4+V35BOXnlX
	nviUf+XnISrngGTPFjm5wCxJxwMAhft6WxC+eJnOSHRUvjlgZ6I5oHvKW2fmCVWiU0iV6dcjwqlD1
	rx71PYXIyOI5PPTDbjxioS5Yo976N0GSaJRP90HYSVyEVv8SxTayc68ecOW3QNFkjTDkSSXcKgrQQ
	+Dy6Zwr07HmorX5QZTTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQqz-00D9LD-Vj; Mon, 13 Feb 2023 04:54:14 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQqt-00D9HY-A0
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:54:08 +0000
Received: by mail-pj1-x1030.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so11042764pjp.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbXUylyxKACc1XsVanFRl3U39rfU1yL9GfB2/5jAyl8=;
        b=qbWZJ8BsHCNFWj0dg8uujRetqC6jzLF98Qdv/TY62Y644xrA0UjPgnfpO72jXiPyG2
         qA0e0Qb0k4kUsZptcYNMqeekJ/ZNdE/ea06joo5oBBO3u8UyiQQzx8gt7XiQozyObdBT
         5S1fOKKeN6iFkPWI2/K55e5jV4CcFHx5d7+ztaIAS8Z/Xi2kVLIGMcO4+Og2jvtq4jPz
         RAzoR5jMvKxs+ewm1EgSWtxGFnJPdFTNlkKbcbfqa4+0ug61NJ9vJ3Wxhy+/QMypQuHt
         qlafd9m4kLvgvu8Ky98yI56IFExsd6VsJfAjUwdMf7xFelnAdTSwalMV6EmXiGgX4z4w
         oECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbXUylyxKACc1XsVanFRl3U39rfU1yL9GfB2/5jAyl8=;
        b=154H65ypIcAcx/JMtqNa6JuWLrAh7nue9H8u1Tc3Lu3traJ4juSX4vMTbc/K6HncCO
         s43IfRtW5iP1vByhrLPD9xmYvGXWhRHHD0iw7IUwwKyPl/qgX2a1u3Z77h75wdPWhDqK
         D2O8DFyNa8kfx+YwYARa4eZ+3teKpXvVfezR4MtRXTzZfa6kCONIGGZBBw2RxffprUI5
         sS9gTu0+NHkg6ZjMmD4/EOFhTRQvdjK20prqbniudXYYPhvZOye7twDTHS7AjakypPzK
         DXgX6ClctbT7bF1FQzjzHk0lsyg0i2C+QWifTJicAZrVGuQiE4ix2RS8EFgxjghURpUi
         jH7A==
X-Gm-Message-State: AO0yUKUIAmLXVj1Mdm0plYHRkwr7M2R9MFTiUAP5SmT0P1MEMKtx5Uzk
	cmEGVja8F0ioci5Eu1zE7Pnjow==
X-Google-Smtp-Source: AK7set/lnkp4iEiPCYd0MC6ThFVrqXatwksChXVC+p44Jl/pjrdhLlhohkg3HazCQvlzxn0/m8o7Lg==
X-Received: by 2002:a17:903:11c3:b0:195:e2cc:6f35 with SMTP id q3-20020a17090311c300b00195e2cc6f35mr24707652plh.59.1676264046112;
        Sun, 12 Feb 2023 20:54:06 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:05 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 03/20] riscv: zisslpcfi extension csr and bit definitions
Date: Sun, 12 Feb 2023 20:53:32 -0800
Message-Id: <20230213045351.3945824-4-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205407_366156_547070F2 
X-CRM114-Status: UNSURE (   9.03  )
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

zisslpcfi extension extends xstatus CSR to hold enabling bits for
shadow stack, forward cfi (landing pad instruction enforcement on
indirect call/jmp) and recording current landing pad state of cpu.

zisslpcfi adds two new CSRs
- CSR_LPLR: Strict forward control flow can be implemented by compiler
  by doing label match on target with label generated on call-site. This
  CSR can be programmed with label (preserving current abi). New instrs
  are provided to place label values in this CSR.
- CSR_SSP: Return control flow is protected via shadow stack. CSR_SSP
  contains current shadow stack pointer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 0e571f6483d9..243031d1d305 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -18,6 +18,23 @@
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
 #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
 
+/* zisslpcfi status bits */
+#define SR_UFCFIEN	_AC(0x00800000, UL)
+#define SR_UBCFIEN	_AC(0x01000000, UL)
+#define SR_SPELP	_AC(0x02000000, UL)
+#define SR_MPELP	_AC(0x04000000, UL)
+#ifdef CONFIG_RISCV_M_MODE
+#define SR_ELP		SR_MPELP
+#else
+#define SR_ELP		SR_SPELP
+#endif
+
+#ifdef CONFIG_RISCV_M_MODE
+#define CFISTATUS_MASK	(SR_UFCFIEN | SR_UBCFIEN | SR_MPELP | SR_SPELP)
+#else
+#define CFISTATUS_MASK	(SR_ELP | SR_UFCFIEN | SR_UBCFIEN)
+#endif
+
 #define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
 #define SR_FS_OFF	_AC(0x00000000, UL)
 #define SR_FS_INITIAL	_AC(0x00002000, UL)
@@ -168,6 +185,14 @@
 #define ENVCFG_CBIE_INV			_AC(0x3, UL)
 #define ENVCFG_FIOM			_AC(0x1, UL)
 
+/*
+ * zisslpcfi user mode csrs
+ * CSR_LPLR is a label register which holds compiler generated label that must be checked on target.
+ * CSR_SSP holds current shadow stack pointer.
+ */
+#define CSR_LPLR                0x006
+#define CSR_SSP                 0x020
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
