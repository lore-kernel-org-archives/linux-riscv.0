Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CC2C76196
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 15:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3y/UC4tZuPU1Kvpx1IVBzU9ySmEjPyAXMO7VSu+qNU=; b=F+wivSw49fzoyj
	KId7eK0igu3S9S3VgolWmuHe7FQ2gHpl34yX0GQR55JX3BVFPUbrSNw4NbIFukCZuU13UMFeOfz0W
	M9JIrohA3Nj/1TiPeqPBvmqplMPtvQmQH1JdzDxAXM6Ga2Mv1YdWALuQEm/yGn8G3AonYQpYeaGrA
	Fdg9vRPfG2lJnPVx2HS7cYUSxYhx8elP0P/9/icCtPMdcEoAy0FW3m0Yx4YT0fPNIREIA1Rfpl1/o
	vlicJpVmviXAGY/Mmcz9QSfwxtkC9+P9nIrEpxH7v4Aze1r1lxevKUX/P0aQPIHSiAegm0I5tyxw5
	gvjAp535p90ZP3Ig7VMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMQ1-002Gg2-0O;
	Thu, 23 Mar 2023 14:59:57 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMPy-002GcT-29
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 14:59:56 +0000
Received: by mail-pj1-x1032.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso3496819pjc.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 07:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583591;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PnQ1gM/aEBoZbxhfb57ZLXc6ZOM+cLTwn6NQvrPI9A8=;
        b=in9L72Bq1wyyyCu5Us/d2fWoyH5i9lIDbJZuj0vsYeySOsINiL7P0D/RCfG5TfBXmj
         S1OLjKNr+cT37kDSBYmYW4HtRGIr123Fm6izH4Cl6/LbPiuvZIDdoHAkhscgqRy6SIv4
         FmEb3HsM5N2OVUfSrnPgRTsG3eE/JmLmgHehgDKxIT81xZc3eHOTLcYXzhCs8LLT833U
         /YxuN07sT+10IrOGVr8Vchp9kmYDgXNIfTOeXmIfqoSdpSJUOky270eCw8KvkcN9Wf9Y
         1kz8IDzvOmksd7cwqYAEzXcPwuld+70QohDxInOBcVHCv0LI5hxHaBw2SJnaOSeGTo0a
         jQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583591;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PnQ1gM/aEBoZbxhfb57ZLXc6ZOM+cLTwn6NQvrPI9A8=;
        b=3GjM0k3b5dWXz6qaTEmGXkfZevw6AIFMVx4K/4nIcAIQoWq42CsY5QZCoVdLRkhHde
         agCa19J3Quha70JNe6J88lZQsgYd8HTrZwIBeor56Qrsg5rVBZNAB3K3IzzCWq0NDgOi
         JD6DazZdS2XxAgl4G50E4aJBm4XRNXXo+mdOYhgTNakNL7FqU0tT0q23nEalb6nRZokC
         j714ZjjkHKIPM4+Rdr4nDGebH5gC6svbJkYr1s2Caoa9Sz0WW2cntzfDDFbUNqcfohci
         0xPnv41YrA++zLELbmNObFiUxLgzOvdvHP17764k35se3Fec9SDw/2TEcUJEhnepu44V
         rNnA==
X-Gm-Message-State: AO0yUKW65ggMKWmJScKNlX0DJvfN48V49ujCWLPQ1r4ZYO8dzc+mDZud
	u/3mbtbo6DilyvFaF94I/fvpP/l9HttqTW0PwjTIHgnq1caivB0YjbsuvHTJwsq6JjS6CY74STl
	ZtMBTjcGyC7wQ8o62Az9WzQnXpwU92b4Vn1HEgBBBTk0P1aZSqGdkYKg9rFe+4/RekTP9tMofzZ
	4fVq8eiU0BXVpC
X-Google-Smtp-Source: AK7set/F8IoD8xsNa6gXIltPvxqTiGdqc94EgYvU4CAtCYhWyJCGJeZQfhZAwa4DW9aCaz6SjLNrCQ==
X-Received: by 2002:a17:902:d1d1:b0:1a0:48c6:3b43 with SMTP id g17-20020a170902d1d100b001a048c63b43mr5334195plb.37.1679583591224;
        Thu, 23 Mar 2023 07:59:51 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.07.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:59:50 -0700 (PDT)
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
Subject: [PATCH -next v16 03/20] riscv: Add new csr defines related to vector extension
Date: Thu, 23 Mar 2023 14:59:07 +0000
Message-Id: <20230323145924.4194-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_075954_706924_56091987 
X-CRM114-Status: UNSURE (   8.31  )
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
