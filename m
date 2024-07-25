Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AEDC3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 04:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJg6XHBjO5z82nAxUFSt3lgv/35imd3NGP07Jn9V+Fo=; b=yqxtbQALkb6DDR
	yDouRjqOKUabOdegSeIOqLsmYHhPZG7Ya5soNOu/Pc5qd/SqF3+VodmE6cfnw6uyikQGoTuPi4Hz7
	9PT8bzjy0Vj5JPVgt9jzmtKAiK91aXK0x1AcmRowuqLRBCcYHi4RfKpA7q5DMziNOTqakXqCMD7ck
	yEZODi85N2t5iQal01Y4MtsSnEo5hkOrgz5FS7naz3CXL4DUMVpwhV57PDMv6UzzU64hvsZKYBfxr
	NKHBz6lPt9eiW090JYTeYqGbv0cfNxCCNM/8Px26dzQP0rFP9fgyXd/CJs0kPbmTGIu8gDgsot7pc
	QGYRh2EKCk1uaePsVWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpuY-0000000HIZ2-1abe;
	Thu, 25 Jul 2024 04:17:02 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpuL-0000000HINp-0icY
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 04:16:53 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-70d18d4b94cso409832b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 21:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721881008; x=1722485808; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=vmeOqGZ5gjOAL/+pIrTeicrOPankGW6WNNpbJzCWQn0Jr0w+9B4vlVuJSPHrcRtWg8
         qhVzEZGd4tqntgA64wcf4gYjbXpc1HyzG4lWaEHCXyBHEGkqAEHO3A/86Vj7oofYlLjW
         9Iq/TUsnG29Aqeam15nrXnLskf0YT1W2fyNEE5HzcNylX0FV6iV8TDvkjmz9LhAIsWC3
         c6NNOqYGCpkl6ksgptCXFeLbngQ2Mr13k7xy0gMA7P2XxbOgcH05tH3vC2widqKjVwVE
         g33HB1d3YzurF1CfTme2hKfa7nG8hVz2xqvSsWM9n8ZGhFJdZE34ZvimehNKz6C7RsrN
         MUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721881008; x=1722485808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=NjV48d/fgK7GlYu/9QZb3MJ8i5Z/jWJPxfAz6Gje386kVDcUWiI9EOJYbZCNaHuqmG
         WOVOgUiO6X3xmxaMdR3G/MHiIDRo9jv3O1eRPXy9CIM5Tx1i8U2o9b+IsVvZJFH8RBI9
         AXWQDa8hb9o7beJJCc7GNbBRgZncTi5z0z8nvNMjWf4q9os7VSlKmYR2LWMOTPpeWDHF
         063PXwMwIbaiEzEDERcGQf8IIrTKZlrgDzEGtCBO+cm3XrjXzAT6x46EMysTDnNBU9sb
         TKP8/LAHIszqgC9kLkLH9Of4lGm8aHANlndVWmlkDWxPVCZYmnnxy9weUqQLJCgFykeK
         2KOQ==
X-Gm-Message-State: AOJu0YzG3VqsLCqD2PvX4FwaElDVPlVV6EwV5YjaBNoUDDaF7t5dMSLM
	goD4nH6+T/APMaKvWi90AhFuc9b6uSdHJSp4tjF6UGzK3UkYTRh2qRieq9l5yRw=
X-Google-Smtp-Source: AGHT+IELFiGNwGGv7BR7vYWVLsiKiV4ZaPKzv5DoyOE6vOqbQlIXSrJhQprJhQfqNRbBaTkdXj3ZOQ==
X-Received: by 2002:a05:6a20:432c:b0:1c3:b1b6:5066 with SMTP id adf61e73a8af0-1c472893397mr2419803637.13.1721881007915;
        Wed, 24 Jul 2024 21:16:47 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2b80bsm3781825ad.205.2024.07.24.21.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:16:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 21:16:23 -0700
Subject: [PATCH v8 06/13] RISC-V: define the elements of the VCSR vector
 CSR
MIME-Version: 1.0
Message-Id: <20240724-xtheadvector-v8-6-cf043168e137@rivosinc.com>
References: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721880993; l=930;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=0jkC45FH0LUvSVfvCEJuCBZ027fqPbAipPAnc4zFoN4=;
 b=XoiS1Ep8clInqZ7ahG0jkemQdoRrDU7bl84W8H28OTMlrx89tCkebW1m05ZpUpyXPXMGRWIyU
 Fq/qygjnv8pA9unHDFBhSb8y5j5eJkXw3j05S6lI2uSroDPOkH6rML3
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_211649_312991_11B44017 
X-CRM114-Status: UNSURE (   8.87  )
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
