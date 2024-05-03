Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E964C10F16
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 19:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDzex8MTeNej+Xf932wHKboV2iqZ77NKVondmPbaR3M=; b=lC06eRAL1cX4Fp
	q7lYTw3KboC/jAxRAnbfryOulPexp9c5KASGBzH68ALHTX+euojDFmu/ZnNymd3gEwUSGVevVYMjg
	qe0wPACpXoew7Zi46ICHHBLDiU6K8+Mpo31ke20U+4fKfF0rKv0f3Gesh8FHLec+ecCz2RppZyniD
	lZ54QXtE0rbIlIpOCsetjtt+fOjkgzWyi7ELDtU1porlaVrte29VFrIunaol1DNLu6zfBcOhpMAVK
	pHf1Hby7mPtkEW8EOHFyK0EqDFUU5+KdtZMYfhAPyk3TZvORWS3b3UZOZgaB6t3UUl26wdinFbXJI
	k4zBEICN1rk+4PiK695g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ydE-00000000Asd-2J3T;
	Fri, 03 May 2024 19:31:44 +0000
Received: from mail-pg1-f181.google.com ([209.85.215.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUy-0000000HX2r-0iJq
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:19:19 +0000
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5e4f79007ffso6151399a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760345; x=1715365145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=MrSPBOTjbPaC1YzuO2eBQkUK3WhGH4V1cPVEgcSKe8hD16bD9OY9H+54/NL3oZNZnk
         QIc+Sz3IaNWzN/ZRsJrz4z9tDbMfhDssVZYHqxw5b7S5VNGIV5exNgRnTs2ubg8ISAfN
         XmHLl2yM8UWw60EULgWypvllItC1oicgvDPYcwtP+kJ5hIzR9pvbs1YCpji5uE8AqX3F
         wV4rmdP68GyZG6wAKtZUvsadBTH65KqH7lsVVicQ43iUVPxadcZA4W/zWkL2SdUBsZVv
         0tGWgLKp72ptrSCJSqs5Y4sdB+/tvplfNN5UjjWfFWcyRzzYguvpB8EfxfZSAOp2+PNG
         N1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760345; x=1715365145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=oksZNz684lziTpPZJ72qsnv/HJiGanMOPVbuCqtrYm9WYcahLgzFprZWRtrPmp9vIK
         eLqZzEk9lQr0i4gf5vQ6V+p/WwhoNew1sSFVkPTovsfa0UMRJEr6UDjDAZFFwtK06JI5
         ABPLw8ESpWSgcrvRhhMr/hSnzHOVBY7gyjz7oKhGr6PS6dl15w+y3pJq9hebQAYaP6Jv
         Vi/Mw7kR3z7Q/lhMPWMEuarg4m2BadotfhrQZfqZ8rYiVw6mcr2p+FHcTMa9AOSjV3pb
         bnNNnb5bmMEUWeAiM8nETkO5HohUCKZqCcFgVBzSIB3gon9v3vQ35yqkGATtudEftGdx
         hlsA==
X-Gm-Message-State: AOJu0Yy/g3P7DY4Jh+F73NtHXQSfozy3qNh/rmxA7s9jLY4XMrkqGXsQ
	INlsIQ9OQsH9dGeQgZE4VqNedxt0n1UYhK5X0d4o8QW7i7X19+hEy1OuzwnaOBw=
X-Google-Smtp-Source: AGHT+IEECXDZSf9I/4Q4n/a/t5WUm0gDjrNDmbYOkTcO7Anz+US34Ny/ZTMIDCzrSKUNOSSeVGrVKQ==
X-Received: by 2002:a05:6a21:4847:b0:1af:41d1:7334 with SMTP id au7-20020a056a21484700b001af41d17334mr3513429pzc.27.1714760345646;
        Fri, 03 May 2024 11:19:05 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:19:05 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:26 -0700
Subject: [PATCH v6 11/17] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-11-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760319; l=706;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
 b=jO0upAGaW4yuaVS+QlmhSO1SYHS4tq4RK3E0NqLTsJFEwtmVkVPPV6aSesGjkRDdJkKI3AOlD
 MqQ3qvdB+I6CCD8RbUq5POKhniZRS/torEK3drvyLlOJzCwBIrIBFcL
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_111908_532839_5B230533 
X-CRM114-Status: UNSURE (   8.74  )
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
