Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70471C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMdWyHosNsIWvWpXwc07sifFVtQucu3HdHlA5RzCb7k=; b=pj7MRvDFfcUKWw
	lK9pfMKs9N2TKB8jFdYP29nb8xDnuLdqgFG7c+UEn9mFO7k/htRl5hvoYD0wz7QSjWuwJv9H/lPnS
	El5aDCZrtIGWAgZiMPPtnOAY2OZOOl1WQg6daMiWYWpTQzqoo84rTQJXek+BoP+uvQEd/QENHYJVZ
	KJo2nXZ1GDHA3WtphdQ0+y10cvaZgqGvsNNsPNY/6x4MyRaoK9Cw3cAFwvpAuyRSKLOMgIkNZkbKn
	Hp+0Y9DLlF/zErAS1J/A6dd18xUpnvk7mK0Q2erLadKLBq0AE0ZQTUbQFrW7OnLukzZdTLObku0W/
	GHyqxDJCeeufxo+9wxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgeS-007VBe-1v; Wed, 25 Jan 2023 14:21:24 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgeP-007V9O-PL
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 14:21:23 +0000
Received: by mail-pl1-x633.google.com with SMTP id jm10so17954320plb.13
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LEmGChUVnZQOmwfi7xG4k4V6O37t39G64IbOwnQqBms=;
        b=Mgb65GpuK9yJrPVkx4kQ2Ci8WktzW+IO7bEtBhRcPRo9HeerGgLhDi59MSIyKjx2va
         p8uCYA+B0qdtfqTUAnRoQ8RLNfzx+jQA57SakCY61y0EoPrxTbFCtM+clv4CNbkbHuIE
         dQ26JEziH2FAV8tL6For36tiiWbDz9eMJ0SBm/0cgCQ09tQZWJQvQDgKaUJj4CyzQOII
         upV2AoKzkCxnMHMGLoOvlyYaO9o+/ZJ6sO0tQC5qVmTaWbRyYSPjxzphkHj+7BV8Y00Q
         wOG9flapF4qwbIiarQrWQ46DdMcVbp79JiTMrwcaWE09mo50Og6q/o2lIL9b6QRPbckS
         vflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LEmGChUVnZQOmwfi7xG4k4V6O37t39G64IbOwnQqBms=;
        b=clqvNGFDBHFMAfxBx+nHiSHgSZkN0Cgf7rGCP5a1Wc8eGPP6JEZJDSha/niqNf6FrO
         aFwVcL3zK2YwuPpRYin2K3an0boUjnFRdenmJUvbqH+33OTkHiKAuz7cP5gwZZmUW37V
         e5ywmHqbec7vtFpNrYE7UdnoRAiu6xwbRzo+5OauEq2iImmiurtltFeF1OgHlFwPVBvg
         o2YgyXsoaeKDAYeHsT1H22Yru3tMputetOI1IJsI5RsMTH0lCZuwyNzMMZ7d7u6mdDgP
         GxA3+6G+ywx8jnNJyiNYXgljDi2m2GW1+VY3XDFfZZVycvAgO0zYF8UnoPHbq0oFqu+D
         ZK7g==
X-Gm-Message-State: AFqh2krRg0H48WSjXDS7ib90Ma+bNY3HGqBpiLfvk0VABcaAjdj2ag0R
	gfzMHbIgP1i+QHlwd+MmircVRGQFpsONbO0501X3BNM8j8sdu8vcghjpmPqXvnvrq86W9LgAJ0Y
	vJooj4MpjuNuNyFXQPtcpMZo56dL/p+/fCDZLWKMGCxSzY8fNapmDseePl79mw+1A/Q2xnzYu7P
	C3Z/EAJxoB6w==
X-Google-Smtp-Source: AMrXdXsk2JUgDD+qVk9IAT4BHytMQ3y+Sghwgj5N2J+EbXRUuhk8YMB5VLjL8ceNGGJL630ZWx+hwg==
X-Received: by 2002:a05:6a20:1b21:b0:b8:ad30:717c with SMTP id ch33-20020a056a201b2100b000b8ad30717cmr31941568pzb.9.1674656479111;
        Wed, 25 Jan 2023 06:21:19 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:21:18 -0800 (PST)
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
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH -next v13 03/19] riscv: Add new csr defines related to vector extension
Date: Wed, 25 Jan 2023 14:20:40 +0000
Message-Id: <20230125142056.18356-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062121_872053_F589F6C1 
X-CRM114-Status: UNSURE (   8.44  )
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

[guoren@linux.alibaba.com: first porting for new vector related csr]
Acked-by: Guo Ren <guoren@kernel.org>
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
[andyc: added SR_FS_VS]
---
 arch/riscv/include/asm/csr.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 0e571f6483d9..add51662b7c3 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -24,16 +24,24 @@
 #define SR_FS_CLEAN	_AC(0x00004000, UL)
 #define SR_FS_DIRTY	_AC(0x00006000, UL)
 
+#define SR_VS           _AC(0x00000600, UL) /* Vector Status */
+#define SR_VS_OFF       _AC(0x00000000, UL)
+#define SR_VS_INITIAL   _AC(0x00000200, UL)
+#define SR_VS_CLEAN     _AC(0x00000400, UL)
+#define SR_VS_DIRTY     _AC(0x00000600, UL)
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
