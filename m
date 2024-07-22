Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663AAC3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 21:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMvfiyZmK03K841JEn54kVYf2nXjvG7mWZMBAHqspVQ=; b=JFS9T9PeMV3Qo6
	SBuJZ0odsVzaDTq5c+5Z+e7HC/TyOdcHPO3s4sicWdmolxLb+dqx6jX9oMWZapGGgohW5JycWwBak
	A5G8GYK9voISCPCuEXeiAW7Ug+8oA0/S9LLyE0TuOKbNCO+HEllW5nlJj9P44EdrUf5iwKJrOM+EN
	ooEhGPmFXPA7eVOUmkcBKNoZ/bB50ruj7oU3EsbuE4utzKmSItrgNw4eCgktSrUveyqJ1dsBwMBLx
	XY623PBqb9u7rR540VdIZ02J5G5x3FGpx6rGH74h116kmSaYcXtBsuMr+shGrfV90MWXEqrPJR5Mg
	O6L4uswjHtlmk8plzt+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW13E-0000000Afao-3Mzo;
	Mon, 22 Jul 2024 21:58:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW134-0000000AfS7-3kgz
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 21:58:28 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fc5549788eso36622215ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 14:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721685506; x=1722290306; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=XD/XBsN4aE35rFpFACIC9ahJqcMfcDEIX2Eeax+tV/4BoyCpfxkUydOpnT1wFjJagU
         3wf5niz70SyXvX6j8pBr5eC2PwRKm7yz0qt2adcqa14RB8mtO5qJV2ygvou7hqvu6QDW
         62LJLt7uOZyqCL6Ux6GWaUTSEsl5ujQs9YGqKUzlCyGX4kBJyEbHkQsSS/qc0wP6ssyn
         MO/Xychj08ITUjeCHwyKPe1UnkjJkS3+nrjNdpZDdALG3mYm/dW9/Y5UcxfIdtGSGidU
         amI2Rx0Gz3aCQntPBiJgDU1UlUsYtkGvZWHh9LTptG5urxnzVHHZTtyPkCip7NYWy2/0
         g/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721685506; x=1722290306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=xHn6VndU1ZCZmsRIGm9zup2STJQ4Zk1qpO9LLt0k499cYFbEEaWNzeaPW1exUduyDX
         WVR/egwOWgBTYGR3pXW60LC5E8IegJx7Zhor0Gphp+KCi9wkfzjfXHxW1szLpHlHLkWw
         cu9U6aSK+c+KXTT28zuY9dkkPkf2jP3iIbfLXC5JD0S0C/nJX3dfWvNXV40kpUMXkcay
         IFyf0Na2MQeIMegev5DN7edKsCreGxEPdaghzm1lNCw7IdJzp64M/kGCi/LR+6u6Il1f
         bQBgiUXEhgImpaW64A9IJz1njHb4RtxEr6udHk6GQ/L2ryDfixvltwTPhD987AbtJYG1
         CFtQ==
X-Gm-Message-State: AOJu0Yy8hw6wPbfrnEYY/k/87y9iCAmAEZCEAfZqweP8+dZjq+i2VPYX
	F4zygZ9SNKr+I9/RyQF9Xmx1sZYYGuKHjipBIHeubIoeVvi5JwuR9oD8xY0doNk=
X-Google-Smtp-Source: AGHT+IEhQYp1BZWLj9eFDI4F+59SR/8t3UUInGJ4gX5TJPVL1PbpSo7Q3rXHcGW/E8u/+YVve3sRYQ==
X-Received: by 2002:a17:903:18d:b0:1fd:9fd8:1b2f with SMTP id d9443c01a7336-1fd9fd82008mr51936315ad.8.1721685505924;
        Mon, 22 Jul 2024 14:58:25 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44f0d4sm59997775ad.219.2024.07.22.14.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:58:25 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 22 Jul 2024 14:58:11 -0700
Subject: [PATCH v6 07/13] riscv: csr: Add CSR encodings for
 CSR_VXRM/CSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240722-xtheadvector-v6-7-c9af0130fa00@rivosinc.com>
References: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
In-Reply-To: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721685488; l=1045;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/awdvkpT37Pcv9l+R6WHhK0Ytr8TrWH5wurC23dujZY=;
 b=HkA9GryhuoQSbrAEZ95j95Hqi2eIuaKpw8ZKsmN39SZQzbRBNWPE66zVFn20eiWNCV9omY0DH
 m+/5MZAQ7RODwQ/ViRBSsCcS8JUhXwkT+4tZRvwC/Z2ygfj/aiygn8J
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_145827_038475_5C8E1727 
X-CRM114-Status: UNSURE (   9.15  )
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
