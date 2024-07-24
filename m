Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA36C3DA61
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 19:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMvfiyZmK03K841JEn54kVYf2nXjvG7mWZMBAHqspVQ=; b=OtzCBifbPuU0xD
	+50bqP0nzFV7j5/patn65n/xU2npoMSJJSxYHXtX2E4+9uLuMwIfKVNRXBolBa9y4wWXEjVK4BZXk
	KyXJYsePZTxCmOstMwviYdbL1BBWLHhOn38iDSGqEV9+UuzMZPaiYLwhulxNw7fbo2hh5FoEDR804
	A8DDfEtDDiZgKn9NWJ3UQAAg9YsjXWi6LtR7NMws0K+HdpG9BGewT4op4XTLlm62AnlXhnNvGfKB2
	PvI21P0y9wUVpuxs3i/YMfvKwUht9BRtaxUqfp2eYIBwJ6YmS2a0zqvO+GGjodKqwb3/rzZ91P3jh
	2JsIpsmKG/uES25u79PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWhRU-0000000GIp9-1UP4;
	Wed, 24 Jul 2024 19:14:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWhRO-0000000GIkA-0uWs
	for linux-riscv@bombadil.infradead.org;
	Wed, 24 Jul 2024 19:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=; b=Ik97GNgTNdvzHjc0uCJNQFs3jg
	N4Kw3j0ZCf2qOeEIbgRQfv2E1yzDuCwvAL3ESDDIDi/Vp5DcAcl5fLomjdsYZAgfJs32IKzfnMBV0
	siWBiaK5jpgM4jsJC/uo4VXXfJZUl+QfBc1lcxPzbWHG3Ot6xocOt0dTp2EgjyRYRR9MyOGz1ZyCO
	zCNG1NY7esoih5uJRhPTM9ywSFi6XU1W46ViBE8CpkOz/1Ej81ZmKaXG/h5JTeY5d3FTil+d50sMX
	kVaoB/e82w0xNCr89GsqgrXZGyTOSA4UIWsOTeYWem46kTrMmSKr7MYxMbGGMNCZMOAX4muXgodDO
	d1wmG7lQ==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWhRK-00000003sYC-31uD
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 19:14:20 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2cb5deb027dso127858a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 12:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721848456; x=1722453256; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=VcNCtMv7BBGBPdrmzCpmaR14oKGw4YzpH/VZChQCBTNvKnL8RMEyRGBVhX4fL27HUW
         owmYcDZSKQlxyeFBFn4/CDrGPfbWXUtHiDkV11Vhh3KQDufQTrNSqq03diVsrAZX55ou
         eqEzox87aXgy6LAqGQsfFLzpYbO43tSDxVnPbH8PDNOP4MlWdy7UN1Y5f3tRYLUBRD6/
         xaq7DzdPGfRuJAfQxd7wJ01lqISjtgw7ncFpJZ6E+pSuVMCHw77b8HRCdh3SLQetsfHu
         XeaondEtfQ+gL+9G8m3bszVjFcIvDjGJUsMfoYqFezl8gyr/K1K8gXuUOPOp+lJBrgXb
         vB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721848456; x=1722453256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=Ow7QHO5UThw4GsZIlmtXR6dhOH3kwnO3NzXiqCzPsue19VDs1Dh1Tm//cZ9suGX+Rp
         Lqtd64llsEyZnflHn7AQQIUh+y+ioiw8ap1ONdxCF5qRPRjBnhgaDaUgHRx4zjc89oMW
         ITU0Rbbu4w3d6zZksBNBwljhZtDMVCgvce0KxRFopjZZHWNaLPMwBGbSgPG8x04MMQDe
         FDQnSo2BqqMr9Aj7khVHJERHGrzOjgmFYqEiQ60aDvFvPVwUr+y2c1XAIDJZhUFh2YIS
         q6igQBLnWjLgHpFbxFXtPNLApvj+CG5gmoRjyM4GbSFyN0u0KjyxhNQcibW16VbdjDry
         lcSA==
X-Gm-Message-State: AOJu0YwYsJqF67DWgCWCo44IHJEZTJ+uOIwUpntaoAjoqlm3h9k+taf8
	T4V+6ZzhqCzkiygMRUXvmu7PwqTpZTcbbObYTOPzsPiDPXQ3vno9kBgMLRyVCWI=
X-Google-Smtp-Source: AGHT+IHM6DqXQtPEXppJ3aycA0czFjz3SvIwtqm0HVLAzyK2dKWOJoAUvM42Mr9lb2mEpm7qNAw14A==
X-Received: by 2002:a17:90b:4b08:b0:2c9:5a8b:ff7e with SMTP id 98e67ed59e1d1-2cf2382423emr637505a91.25.1721848455838;
        Wed, 24 Jul 2024 12:14:15 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73edecesm2022359a91.32.2024.07.24.12.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 12:14:15 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 12:13:58 -0700
Subject: [PATCH v7 07/13] riscv: csr: Add CSR encodings for
 CSR_VXRM/CSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240724-xtheadvector-v7-7-b741910ada3e@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721848437; l=1045;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/awdvkpT37Pcv9l+R6WHhK0Ytr8TrWH5wurC23dujZY=;
 b=mFNQM462PKZEuSW3HptdZK6/CQsO67lOD5RsetDVD+WRlhwpK+vODv/EyhBnqV5liMBBS393P
 nw9B/WYHqviD1ErzwhdLGYADQyi6xtbrp6tRku2blFzOw6KqtMxtyIb
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_201419_097543_088150D4 
X-CRM114-Status: UNSURE (   8.91  )
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
