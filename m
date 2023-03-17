Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098B2C7618B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3y/UC4tZuPU1Kvpx1IVBzU9ySmEjPyAXMO7VSu+qNU=; b=IXjjr1YS8mkzvU
	CeR93zTTZInfSe8StLkkOEb/EG4MiFbB9YuKYWjzaZZZzjzKA9veTG0LJebdZQ7JN50X+9D08hZ0/
	gLr2SYNtaAObf6/o0m+yabKPnk2hhKZexWSSIoIW7qpgGJckbmZQfANaWaYDwcKylEjuyyHMqAjgg
	Sg1Klvbefz5xj4cxweGs1oE6Im3D1dua2prq8YklhD+9E8Yauq552iqmnrC5JIiVzdhKrkh+ICAVL
	TvvJCUWEqfOcqhIkNZ88nVzqAq93mzNg4i2Nvd9nVxZCM/kG9pRaHrTKBXj9PpiKYiyqRWFsU90FH
	qeUx15Jl4VlIB9SV4aVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8O2-0024zh-2b;
	Fri, 17 Mar 2023 11:36:42 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Nz-0024vV-2j
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:36:41 +0000
Received: by mail-pj1-x1029.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso7916618pjc.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679052995;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PnQ1gM/aEBoZbxhfb57ZLXc6ZOM+cLTwn6NQvrPI9A8=;
        b=Oy0CBErd4SmI31PHtxi9+waaP9FQhw9+CaIYpNH94FK34PKLdxB0iZ5u/kDsG4lJ1Y
         kFh0irvGf9AMbckUc+h6vhTx4SbzYd98yLwxix7KAIRdLbYzOWedOPW4UwJPqbiiMDA1
         qz1C+k9lKc+QRbQLROmph7RPt223+eAQvf9OwUJJj7qCVUZvZ/6e0+udzz5yfVT5iiss
         TuObLDNLvDu/B1jeMjJ1A82DRESJAPZkfazwNsFGMh0VYOAv4o+y3/rnlPAg2V+xPWJU
         HzZ2jVyMIPgWrmXeZtd0lpWd+oIk0+MKQb1t45oMY2AeOhRmjawRDj0P3w9njxqe7hYI
         MReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679052995;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PnQ1gM/aEBoZbxhfb57ZLXc6ZOM+cLTwn6NQvrPI9A8=;
        b=tDfabZYWaTdCaqs/QYMSyVesZ9g7exZ/NO84GtdH6vaMTS2IEWfUT11DEJyuzqfJVb
         RH2ClU7usIMdhb/c+qplKNIQAxX36tHPRC6Wv/tmd9cJx5dmAWjs0w4sd6ZdJdy/DASz
         WGs1xGPMQblao0OAn36Uqjsw5SlW74ihqEHmG/APvTTs7mM2f/BWtbW0IwqntuQs8Gzj
         MsYALMBnJdMmhhreVq98S24D9uFb3XiFtK8MerdDIzEsslmf7zxAxquoaH+F0jS/19kj
         /Gub00MGF0OT/WVEelSquHkgdBeBCZADULt2aXgGq3paJ2/OXLi8yDnRXJyhASlDEZe0
         34KA==
X-Gm-Message-State: AO0yUKXD1H93HoVXLGEo0ws5sbKTVnHCw3s6qu6ESbKDe5NwZa4S8qfI
	/eyea+l1LjSPAll+8dysaCB13B6HbnxBF9eT/shSooHRXysxWzd5ksOf6mDp7MtNhk9NM7ilejZ
	oCF8kXcOPyCFyiN4ef8W+LmSNkQ/ZkEuPR5Oa2AcLk1huG13/JrDz+/G1PoIjQDfWk+FoTZm/pv
	CXS+OdSOcc5MPc
X-Google-Smtp-Source: AK7set+IzWeKlVX+ExN48ut2Ryq1FxwrvcKWiE3E4NBI1pqmruGfj1KSQA1Uv7cOUsDMh86Sv32tkQ==
X-Received: by 2002:a17:90b:2242:b0:23d:4242:a7a5 with SMTP id hk2-20020a17090b224200b0023d4242a7a5mr7716456pjb.47.1679052995600;
        Fri, 17 Mar 2023 04:36:35 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:36:35 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH -next v15 03/19] riscv: Add new csr defines related to vector extension
Date: Fri, 17 Mar 2023 11:35:22 +0000
Message-Id: <20230317113538.10878-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043639_882013_1E947EE8 
X-CRM114-Status: UNSURE (   7.81  )
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
index 0e571f6483d9..c3b87a7d1241 100644
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
@@ -297,6 +305,12 @@
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
