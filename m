Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2308C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 21:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDzex8MTeNej+Xf932wHKboV2iqZ77NKVondmPbaR3M=; b=pZ083zO80Hp0xG
	5LteA4338dnrNBjC1YWlMcDf69DmP19z/Lfyjit3zJrx4DcY41lPDZWnOz0suKUF2xVurM7oYGPis
	PqRwTxfcYyVix5EbpFe7UpUZY+fqmgaM8Z6nRjlguY/7BRd54NQRfj9ojeVpEtAtYHWg+iMExWCJm
	LDj2iytCienXoveZkWd0aWYR4VU6jieIgmUB4PHmPSq+Gd5/kv/Ki6iUKJ0jIssWsvLdXc+1Y9ZaG
	SkVt4NVNViAcMcrFPiyfjVAKmwD6YT2sBpahDpHUdLsBSp4byINz64S14ia7/13leTWz1jtWU9HBo
	mqK7h0St2B/qo/66emCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0TFr-0000000E61Z-2AKw;
	Fri, 26 Apr 2024 21:37:15 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0TFp-0000000E60d-0dGj
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 21:37:14 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e2b137d666so20533925ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 14:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714167432; x=1714772232; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=LxJDsG8Kbc8AEVO4DV2/XRpJlc6z05c6Sfa2ScOuYQUtAdwMA9g9RceqyebeYUk1ve
         AsQOyS+AibrARPeRAZ3DOTbMyi3kLo7zZQx6Mm/bBiVInjwJiQRjhaTUs1g+QeBGugI1
         uoXdnRjy2H2bkSnermdbXUAtfw4KSeclbj1VcR6dzt3dEQYbEgO9CQBzN+Mc4eNwXzI+
         VsODxp+MwM2XJx0AYdj0zKmis4qYaLULpeXW3GEqIKk8rRxUPmQ5agaqzfCt7pFcEBqp
         8anN49d7j+JADSQjQ07ALwwT4P3owj9khPhZ9coypGs9znMFFS9LT4EHzlU2iNXsp/Ix
         seYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714167432; x=1714772232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=GUedsEyKq4t6NhesVNzAu4nV0azGy2Ki1bU6n5Nbko7iU2KNri7Wd3u5oGDDPTWtRw
         tvxaevuvm/5hPZQKMDpyUqMqo/S+eTfTuLrelZuBh5LNcJHqGtkwdIjV2aTN3XUtyOVt
         e9m7kipoYWYjY1ZcrDbndh4X5LKpCFOec1mQxyHS7RsaBx3FYlfGvEB7Nh6N3G/kgWv+
         iZoNq4J4HFgfuNO7tKt9tJzXO5YkJtwuz3zhF1CrXrGwWZ3SMzC5RQbgZ/E0a12mosnf
         tiBi4p0MJ827c5+uYiE2lU4wwdImrrd3Z2tKO/4Buq6pNfZDncjR7z5SSlMGHR/w7+mP
         iVdQ==
X-Gm-Message-State: AOJu0YzddLJa/0WoXth5DtX42z+igdFsIp+wAOhLtjJfAP5a03bBhGGy
	yjt2JnDsok8ddmQkXeq2ky49aTBpZDu+ciraQosdSc5wBYnA4eD+8Ys3dHN3X54=
X-Google-Smtp-Source: AGHT+IGWJI3Gl0PGwdn7TcVlWGE2rPngkQ66IMWTkljKx0O39R28QRi6ZTG+h6s5DI5TOnMGruv3HQ==
X-Received: by 2002:a17:902:768c:b0:1eb:2fa0:c56f with SMTP id m12-20020a170902768c00b001eb2fa0c56fmr2018706pll.35.1714167432656;
        Fri, 26 Apr 2024 14:37:12 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id k4-20020a170902760400b001e2936705b4sm15935701pll.243.2024.04.26.14.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:37:10 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:37:05 -0700
Subject: [PATCH v4 10/16] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-10-5cf53b5bc492@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714167425; l=706;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
 b=Lr2jnO/RRrFVYUUrx3W1heVv5x1j/2KK50JOmhJOqBV6IIu6PicoBjuEuMhY9FYIXioM7ltUg
 eYjbnSGCa28Bpn9mbqy9DcPdjt/TDlijUpAGzsTJXxmd0QnM2NpCbxD
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_143713_230548_1590CA7B 
X-CRM114-Status: UNSURE (   8.50  )
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
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 13bc99c995d1..e5a35efd56e0 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -219,6 +219,8 @@
 #define VCSR_VXRM_MASK			3
 #define VCSR_VXRM_SHIFT			1
 #define VCSR_VXSAT_MASK			1
+#define VCSR_VXSAT			0x9
+#define VCSR_VXRM			0xa
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
