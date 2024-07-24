Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB85C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 19:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJg6XHBjO5z82nAxUFSt3lgv/35imd3NGP07Jn9V+Fo=; b=37T31s5jdp7ql1
	teZog2fFw9pprjvs30yIwnIkpUeofSxum3nnh/vDCoP0scsCJGkE26UNCRtkhFAoNZAHe80lnbXY/
	+K6WFZygglVaj3jiBQUFABNI3mmohx6w7MGPvYA5KjgeM587MQ2jwa7cOxU7C5ZQlLs9TP/qlJnK6
	el7JQD8MME0JiJHbYrIk2iLQsfWiaxYnRIVy+QXnVhxSZ6EjNEs1lYUnLYJvIDuefBdiAcYEtIgrr
	PbgN3CFqIPHe4QxxPGaJU8f/7M8fjNaXyCWcxB4RiSHKMvY6J0suUXxQV9Sw+l1WbjOHd0TG6hJu/
	XKWfmP172PKzgppwqSGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWhRW-0000000GIqp-0GbZ;
	Wed, 24 Jul 2024 19:14:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWhRO-0000000GIk0-0vNj
	for linux-riscv@bombadil.infradead.org;
	Wed, 24 Jul 2024 19:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=; b=hOxvJ55VFk8PBeZvGnHZqZg6kT
	dLAOXjS1ZDpeFg6cWQsck6K977b0hsGsUyt6UMt4aPVmC4Zdj9Z4t1woUuuqa0zfs2HPpRUKqaeKU
	3TbzFdDv699XXZQLBWJmXjhs/LOP8EtnuTQk5xlW2aqcj1l3+T5t3Yhfx/3VvFqO3tS1O064Luudo
	mEjbIoc3eOAUBDCiWsMfMhjEEz516M2y8p+GodnDNhhvFrCByjT6SRwgnG5xKzTSIelDOh92M3OBf
	g9eQzyED475c62ODcktsS15swgGDKm6MhTxk3XM7gW0s3g8Qju+2ODMa3CNPN4x2RC3rmSFTkw3iw
	b2YNYt8A==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWhRK-00000003sYA-1Ah9
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 19:14:20 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7928d2abe0aso956547a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 12:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721848454; x=1722453254; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=Opczxz2BJqmawzrCFT582e7n0tLd3qlxWnEWGm86hGGsTZCVCAvMFiCFRg6EbI5zDc
         ogJPcFCThCQ/YJh6622yPJciuV1g/6aPAk/eD9zCjmRnQ/zeLG+rFl9SGlZI9sIzoRLK
         KR+j9FcmUNDNr67rp4PuEigr9qi/gc5iAYWmZsG+04RvjJSL6fJZuQTuzWD2DISgLAbp
         23whJwWaYLN3SunQGLZWKrCYQSnOSuHE3PlJNY10I6CNQv3OkPcD7iutan8PJSRl4UNb
         WgkhFD+8Z2Fdt/RXUlqpOiezmif4qwnkJw16vg2uYfi9nDyedCLoshlu1FywXalbG5ca
         Y3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721848454; x=1722453254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=Wvcfxu4eVYa3Puont6GQBzrKL/FIZE6RMAfYnG/Vg88JQo8/dEOPDlW3u1eCDj2GwM
         rWesydjnyO/BxehKfOzR/xoitdJbF6QSSciSXuxgcNNpYRPBP2wvl+spSR1exfzWSzjS
         rCjQSqVjfaxOHtfWISl7eT78sqEqE2Noej3Ni04Yl7CtmrwNBcjt8Ml2zI+euA16/8qG
         m0iMLWsjR59r8hMYaW2hwQXcNoHIQ8voq63NDijGgrTRggqGfxCtfq9ZBEs21ul9bTuL
         JV+M77bJTmvotGYlg8pk95/QSXDx8falNWPaz4/eaTfEP7XD3C5pdnaJfA30WOUf+a5f
         wrkg==
X-Gm-Message-State: AOJu0YzRBhCTsUkgdlx/hwe14D1AsX7p04GFcUWEtXvh05xLIeCcjhLb
	Ll1HURTulZNSMpuNo4TnC/FN1b8r3qf6RmwwoFKlr8lu3pjhKuj1MFf4a9f1NbI=
X-Google-Smtp-Source: AGHT+IGVQ/7s5Uji8FwnkBAQuZA/qnOTv5FeMuP75J/li0AlUiYDJ2mhYeKo8pOgLH04he5+PNiRJw==
X-Received: by 2002:a17:90a:5d11:b0:2c9:63d3:1f20 with SMTP id 98e67ed59e1d1-2cf21f4adafmr940219a91.18.1721848453700;
        Wed, 24 Jul 2024 12:14:13 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73edecesm2022359a91.32.2024.07.24.12.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 12:14:13 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 12:13:57 -0700
Subject: [PATCH v7 06/13] RISC-V: define the elements of the VCSR vector
 CSR
MIME-Version: 1.0
Message-Id: <20240724-xtheadvector-v7-6-b741910ada3e@rivosinc.com>
References: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v7-0-b741910ada3e@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721848437; l=930;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=0jkC45FH0LUvSVfvCEJuCBZ027fqPbAipPAnc4zFoN4=;
 b=J/NcqcR2Zv8a6Q1N9svQLwZ8l2WXzaUXYG1n5aBRx93oI5TyD5lMzQmTpTt6lA8RjBCPTvqeU
 Ot5+T/1v3eABmYm8fvobV7OXx8xYRPHSVfU1an1UkyUyoh3so89Gi5b
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_201418_690335_C0C2E646 
X-CRM114-Status: UNSURE (   8.72  )
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
 arch/riscv/include/asm/csr.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..3eeb07d73065 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,6 +300,10 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
