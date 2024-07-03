Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4E9C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 05:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMvfiyZmK03K841JEn54kVYf2nXjvG7mWZMBAHqspVQ=; b=y0/2i4rPpt6zEU
	2Rich+cXwLVdvdDf9lqc5tGFsp01WrgmbBWX2mwWV7/ZQHAaxFLGzwn0yJj84a/bs4i17jI7uoUqq
	DYxunOVouLnTMPDHG0ZKDDLMJd2OXHc47Y2OHcnmxLcXeyKSWQghK2mFCOsxaxSjzUB50yl3ordAx
	CFBEkLC8z+k/YARk7pM8ZqVBK6D5xp+ED9x1RKaB7JRFxQpJuYEVmi7vPeSJtqAvqt1+gNnm36hVt
	99DlWmVECGLzDUQN6P0o7fclMLqLSqlVqUxK7qz3MhlvxeIgl5C+2IKn6HHca+Ckg9pEi5MoXSYst
	A9a/Rk99CVg8Too3Aa6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszm-0000000983e-2Pu6;
	Wed, 03 Jul 2024 05:57:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszj-00000009803-34Hq
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Jul 2024 05:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=; b=n0CbT9jMTSkxk48ZIsUzXG8ILA
	NdpXeeMqp49ReSNRckbpZ2RfjikfEwAtHB3BO+LOjpkmUDzsZF7XZFXanvUJPzOvIHmWJe4Rq60tC
	S2S/2XNZEX+jV41y3EOuqhfLp+DJkiZva5dMkOD7+rk18TViznm3Za+meAbXfuVWbKpNOts3MOd/b
	SZy2Ea3EXrr/FTT50DILupBEi9bINPj86niCcmeLZVsVd/GZHJJM5eWovH05EOL2USFfg+BErkebg
	eAmgS/BZDSDgHmADkcmffad1BO6sAtNfzt+hKYImlZADQ/3biFs0ZZfYWclQjHccwaokzFb3frFFw
	ZEGdjY2w==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszQ-00000009veu-3E9N
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 05:57:23 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7065e2fe7d9so3840357b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 22:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719986230; x=1720591030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=b2rfp5sEcXDAvVQZyi0mS4dsUDAP2nBFz/7YRx6SFtNOhvMUb/c9cZ4bt364Z+wJsA
         aEDZK4hrlMYXy9tUjdI9G7q3ZbWEVwkAKSlCogTlbWrFKSSmv5gvz723cyCwF7yNaXAU
         6kR/MH8UXAvSgNT/Vl8BF6a+l3+H/l06YoM0MWYR5B67f0nUequh76wyCnN03huw+Nfw
         5qxQDWM3CgZ2VuVT2KszmRATSUh2hkQPTudxOJfj5FdBauBxMIp0Jem5yTpqBZfoczdL
         IXb1glS2pOF5VkpB4JJfuAi1x3UZD9tE7vS5Re52brIf56y3tQNO9LhuxlzuHHDush3o
         6x1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719986230; x=1720591030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=T+PYzaXTrFvvy2GcpRQyaenZfrznVnGnJImrf3aU42OPI4HpiRWU357cEm4g0Y7RtR
         dFzqP5Ur+HlEty75IPz45XtdLBNvFIDdyaE4v5wiH4QVktGyb8IMd1f/PbOv2pvMkXcv
         Nbqllv9UM7lqTe2C25hIoRM6qoXWtvraPgRQ1JdAwAm/49Y6MDPfjW2UGpb/LjQA6Q+I
         JQMexqHLaEnq0fsxMH19ijkpz5q/vtfYHRdYEseoxg9TQLBy0NBlNQP9LfoBZwdJyx9Z
         MJ1aHPsCv0IlWfBciVzZI0U8Gku77xrN2G8UcRMc5XSWnPAJOtbhNK/Ph3Ee6HfOklMY
         DxRQ==
X-Gm-Message-State: AOJu0Yz49ZAW2hka5wWxr7W5Fd3Zfm55IJI527q1cQtGRp3tagZDx8/+
	ICA8py0yCriAJ95mzDe9VTJexmLCqtJgKlxd82+5buUtibD6JNyeVXBAossDQe8=
X-Google-Smtp-Source: AGHT+IEEOvAClCf+D8jqc3HA5XX0lKWGJyAbGfLfUAzrMU05v/GLAX8L7Ddg2N6pGOzgcSszWGeIkQ==
X-Received: by 2002:a05:6a00:4b50:b0:706:74a6:b1b3 with SMTP id d2e1a72fcca58-70aaad3ad81mr13485637b3a.14.1719986229916;
        Tue, 02 Jul 2024 22:57:09 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a89fc9sm9514103b3a.212.2024.07.02.22.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 22:57:09 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 02 Jul 2024 22:56:27 -0700
Subject: [PATCH v4 07/13] riscv: csr: Add CSR encodings for
 CSR_VXRM/CSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240702-xtheadvector-v4-7-2bad6820db11@rivosinc.com>
References: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
In-Reply-To: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719986213; l=1045;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/awdvkpT37Pcv9l+R6WHhK0Ytr8TrWH5wurC23dujZY=;
 b=r0lQ2nGY3x0Mcx8SKT/4LzbmTA5HnSD2IgV5/PU35TdaU0JlDQ7BO5FbDx3YPdegM6BxY438G
 /CWwFwKT7DnBXqRidTdMn/WMnwbGCEyh1lXd50/bxzbQyx/nwcb1FZa
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_065713_958710_095BC45B 
X-CRM114-Status: UNSURE (   9.09  )
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

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 3eeb07d73065..c0a60c4ed911 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,9 +300,14 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
-#define VCSR_VXRM_MASK			3
-#define VCSR_VXRM_SHIFT			1
-#define VCSR_VXSAT_MASK			1
+/* xtheadvector symbolic CSR names */
+#define CSR_VXSAT		0x9
+#define CSR_VXRM		0xa
+
+/* xtheadvector CSR masks */
+#define CSR_VXRM_MASK		3
+#define CSR_VXRM_SHIFT		1
+#define CSR_VXSAT_MASK		1
 
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
