Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9AFC7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWE0WNTDcIJGT/EIxnpE8HahZhonS2BjUM7ROH4ynOU=; b=x5HnvvX8HYL1Kg
	j31jxk+Ffm3iQhAmtoo087irRPpAI23wL0IY0UVdC4QLcWjN0N2Uz9X//o0amDWAOYcecPcz/rX+c
	xxTucY+T8ReYdSYLhtvzw8dsQ7PlYsHgcpU+C5LOGcKseg9/W98S54g/9jX1PlL1Wa7Hixl7hxfPO
	uK3CHfQCiRZ3U1qG1q493VIlnJsxrjv5hIM9NXnRW3UVqBAV12bpjFWdcl+ui25XPAPS2/L3Eyzof
	CM88bxdICMLurBuvPTLsk55mEGFC5Qwxgnc1HHl+Z4UQP7Xt+jY3LBRUSHQZA3ZCRbTFd8P7aZcSb
	CjeGrg9Uukw5Blc6YnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJS-00Fyhz-2q;
	Mon, 05 Jun 2023 15:40:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJP-00Fyfx-2H
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:40:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b0201d9a9eso35952585ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979603; x=1688571603;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d1t0mcJTBhtsZBYqWTjUk/5U+5ffoYMHXYjoCjqrD1Y=;
        b=KkDBrzsVTXjJSlITJUCo4tj7VbW9qS357vD5P+gVhnWDxE71n+Tc+Im5MlhPimeD/V
         OoVsmX2fbbHAQfKk8oKbEkjshrqbqhqyjwkaSEhxMVaT750fG2XPlrw04hXWIBe99HGI
         2qjHYQqhiGT0DIpxuvn3o5ztZqegGYepDTovsThwJ5iRwmXG0uQCNVPCUN5zpGcpcABV
         n+1XYPb4f6Xb1y1Yx9eB5VUdBQFyCXwq1/DzQvn+g09u1pbPtHh1XAz6fe1OKdRSnJFR
         6SUtqFkAcvZ4f2Vzm+4cH4NQOyK8p8BvQ3ExUi/n+SjuUaX7yNIaRyz//o14ytKiIc1T
         CwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979603; x=1688571603;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1t0mcJTBhtsZBYqWTjUk/5U+5ffoYMHXYjoCjqrD1Y=;
        b=HiX1AykF+pQSVyyi4oGn1II+gZu6OXcdgVZ6d/qiIqtfZjUuXgBIz/XNgB17JA/s7u
         QvUPbTFA5IAT1DLszFdPgHlbcVTVupsEWFA92yQN08U0tRLZH9gz/zT/U5dq07lC73in
         lJ5hoMIXJHLeUKQ68ol1qj7Z53H45jKAwk8KwgVfl7kpTgU6Prac7qOgRZYGe7SFD6Dz
         XbuuCTNzsP+f0iuAo7P1uF2cLeDuaW6cLQBvjqEu5eoiQTg8WZdYOChLMfMy6RYDrv1e
         lY+m2HqnA80E58QE+7eyFXB2UDxo6Gbc1OkRYnMKhenDJnqoDNmscVVOV/igB3aiWnlT
         +niA==
X-Gm-Message-State: AC+VfDw6clKjeUBJgwYxqqnUTGI5qqxs3GWIFmDXE8Q+sd+CM8WwojvA
	QRgwC650aEHxGr4fbb/4IQANGm9Pf5EwI9wlWEVMyUSeos0SePgUzu1L5g4kEY9JJn8mCx2pHrN
	7p1LTvFddnRAg1doX/cYksA+Ihx45iIBEbc8NANJNHiwl/3bkphOL1RD5Ghofl0cyXfpCBGJgP8
	PeibPIA4FX1oeNkW8=
X-Google-Smtp-Source: ACHHUZ4biNRG8kD3a9Fs8sx7VC+IQ8g8hB5i4oIU0XWsT6nRq3hDin/sLuRVSx2ZBcuwL9/OkWm9jA==
X-Received: by 2002:a17:903:189:b0:1b1:76c2:2966 with SMTP id z9-20020a170903018900b001b176c22966mr8471125plg.20.1685979602723;
        Mon, 05 Jun 2023 08:40:02 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:40:02 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH -next v21 04/27] riscv: Add new csr defines related to vector extension
Date: Mon,  5 Jun 2023 11:07:01 +0000
Message-Id: <20230605110724.21391-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084003_746017_BEBEBC66 
X-CRM114-Status: UNSURE (   8.27  )
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
index b6acb7ed115f..b98b3b6c9da2 100644
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
@@ -375,6 +383,12 @@
 #define CSR_MVIPH		0x319
 #define CSR_MIPH		0x354
 
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
