Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4BEC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 06:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3wKwrLcFwyUZ+gRtqqvPnkMBCIGBPb4zRTfFMAiAy2I=; b=pRKKZZhp2rFNd2
	6OyOIkFQVtvtLThgoGekvEfnCS5v0n724ry0Nn6ExTx0d0EBYr9Fy9ZRbD5jtb/98ieFV0N017rUv
	dButvdxKr1Ybu3mVkGTIr+CP0ZMbLHtg45SqOfiZYwRyOLxW7yUEBPDQTc61dEtgjrCnkHt18lzJm
	yJl1mhSjYMdiYQMWZoPb5/H3nTWYQ5ksXe7uepQCvDjPE8d8NOjAfiEbqNfCgnwlI4P1/6PvKwFGI
	yNO/QibWSgvbDEu52ywY7Zug9xOlP8zDPE4IaMfJMhDWoXtilh9UrYPwSwZ0c49C23yimQZT93P1T
	qJBXKEAAomJQy8L8BYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2lz1-0000000FEPM-3ww9;
	Fri, 03 May 2024 06:01:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kpE-0000000F1gx-2IAG
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 04:47:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=; b=HOUrz3UPLnJETLCWebDZgF+/ZL
	WdGrJyPaHCAaokwoPpHLsXQ+WOkmdk/eLy6EBcHYmiNyagmYQfrd664Jqnm9mVhEJWQ3voAjx0uIa
	cpyrs6uWIg/fhY7n/cvUp8M2Ts8gORF9SvdjIzf/QAUCAMczbVyTjoQltArJ2g+OfCStLPoPm2/RY
	nCbeECCZ7JhZwzYDAjwe8JNRFh92RwCPcZmYjUgF/19xqX9lL+3lHTiuTise3Zgc6Qtyalfuyo+TG
	UIIHW6MJQQqV59KEk0Yj2VQ6qYRw/OKmFfugyFadj0qWcRyDJaPorYOECiRWZvDZvJjzWlvH9t+of
	XkdCwSew==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kpB-00000000Q14-0mjj
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 04:47:11 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ecd3867556so17297445ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 21:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711625; x=1715316425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=mCoPxSIGvvMc2hePyVXL1fvrY8cXoRpch+jvXWT+VxspyKiG42ZuQ+Vs5gs0X1Gy20
         bzhyOxAIHrGJf37rEet42UJ0GGFuhmug9yoMUS0RcL/hHrynt/VoO8fo7rJGn06EPVAy
         d2t3XqG/chG8cX6HKhV/c6OCgFU6iskHkIqbIfcWhGQcQZfn0Y+/jS3A72LIzq+GN831
         PanbIOpx4woDUyv3NtzjnQtsfhgP1VAi6FljQrb738ACRq/ST1zy8Ehmhb1st65NfxLh
         sT6idCW1qLsUuHkRTbN/nJSG3T6SivAy9iji9vudgdiOHxf0Y+jRN8FDGJt8f/EC79U7
         pRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711625; x=1715316425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=IPZHZIMPa/J8xCZCDxA/1H/MSM8hy4rjziOFQfXiZILKaeRAJZbOwbexY+cv3TlfjG
         GWuZZApL+l81g7xx/04mUBHE26tRb+LS2likLO2YenRilfm/TyiMP18+W6x54lCuYbbA
         0ggWT15Sp2emT26TJ+lB3k+q0LFABN/Wyygv4NymMcQdkpTb9vwBYh7JQ6udV9r6492m
         jTmRtSAv22lOGm/2g9xGyIuKGmBTQwREZyN2L27oEy1OHuuAs/nJZ6XKkfFU4f2Pr/+b
         5NthGUb75BZQq+IZJUTwMHE0uT72fU+12rZEHbgQBqXf/kiVemrpihgkqOx89zBySvzI
         fEGA==
X-Gm-Message-State: AOJu0YzZFOMqoiCiA9mji8u7DUN8Zex3H7VDnHC8NIhMJpMXjN4XhkPt
	XMAyVDzAuTMveuQE3Mury5JxJXYD94tuhb+DMz9u7zqHpYlWMshRQRupWxP9wjg=
X-Google-Smtp-Source: AGHT+IEsLo+sJPSi2a0Hv7lEXXuplTtHBmjvJGQqJ+J4Qga0XMWmIW/w+sEAMQqk0rkMrnR+elhy8A==
X-Received: by 2002:a17:902:6bc1:b0:1e3:e242:4dc9 with SMTP id m1-20020a1709026bc100b001e3e2424dc9mr1627010plt.33.1714711625059;
        Thu, 02 May 2024 21:47:05 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:47:04 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:45 -0700
Subject: [PATCH v5 10/17] RISC-V: define the elements of the VCSR vector
 CSR
MIME-Version: 1.0
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-10-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=C7F1c584ODJM4qF9TPT5kMoM8fDlOPYyEMw6010Mea8=;
 b=hL7t9YD70TVJ9RCYIa7iCFmk1VSkj7KUU8JdWDeJG/jxY1JZSDl/mWwHtuMDQBiOJ0PIZdgaR
 iKOSKxqaBWZA1yRAFkHEI4kLmPLYbdTrOUVL8YrpVvOwp9MjfHRvnF6
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_054709_501839_7E5791B6 
X-CRM114-Status: UNSURE (   8.59  )
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

From: Heiko Stuebner <heiko@sntech.de>

The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].

Define constants for those to access the elements in a readable way.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..13bc99c995d1 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -215,6 +215,11 @@
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
 
+/* VCSR flags */
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
