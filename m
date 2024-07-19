Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AE1C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NC8SNeEQKm4fyl6DPhD9yxO4sYAc/5eHpADjOTa6ug4=; b=0m5485R7V303eu
	W9/o+SGR1LrizCPgOSqcK09MBT1piXJmXC2n7D78yPuEG2I1Ttp4rOAf5p576TcKIww8IeiGaEf8i
	BlzcKwBJY+wPV6iGXrPOqsuajcbQSrXxm5if0gIcsE7gvXtPXHVHfNVB1zf2wojm0deLnTz1PR2ou
	5IT0e9I8yq51qvrDxd10ew6dHO44lFrz7lm3/Z2a9u90pOJppzMc/UYzSMCENfuu2udGgSWLJHIHu
	cfe8TNA+5V+BMyX/xLzHCxhKOca4LUJjpPNLQWbOYCoO3efyceEN+Cl760izNP/8ggFzUHmARxqLE
	bAGyeEir7UV1FEH3tGOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqKR-00000003EoN-2PRZ;
	Fri, 19 Jul 2024 16:19:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqKL-00000003Eia-2LGf
	for linux-riscv@bombadil.infradead.org;
	Fri, 19 Jul 2024 16:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=; b=njpDpKWn4GnH1fz57qS1u2ZD96
	FjrrJVWG4z3L29PlTqTYO3/XAnM4VNU5sZdI80mLKu0ObsNhv9x+3NhwofXyw83cIzdS5AimLIIY+
	bHX5usUKmW7Gxj5BgMysQMYusAENF/LIg8MhCf2A3O4W7C7IGMlJx2UJ7p8QFjJWxd5ybbZdLL+NF
	dHpSCBkJa1RgCfOTu6U07ChVMC1CjtZZS8cB/Un2lwBY8cMPEBs1qC6w0U/IjW9NMrrP5dEsVWSyJ
	eESRmOe6sCv47XtJOXHY6+T7mYVs6wLZRSh0R+Wqzhy7txZR1Tiy4m1S/fFinWO+Jr+MZxCvzqxAK
	iuSBZ6cQ==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqKI-00000002qN3-11nU
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:19:24 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fb3b7d0d56so13818435ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405959; x=1722010759; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=YBWsdqmj8AZvXsp1irP9qPyan6/1rrmDhZ1fcO5z+iW7RRxZ0D/bCFX112e4i3YOqM
         YAVJVIL+bNrVWw81s2Dw0425xjCOHG4NhfdaOHgNvo0KMw8KfioQ9gqJd5gqinxaSWoS
         1jzEURe/PVKRaXdKRdKRbc/iOS+qmGOQFi1bYBoUIx3a332optyu7jHDmVnuJEvZDm/U
         YrrfDtC7DNeVykhogNZJz+O/H6O/Im/9sv8TQimKX06VcVd6O2lxY2rdWugdq7zPgxmF
         wUncFDShH8gTrAfGiACGhs6EaQO7Te7CN6y8JgbHbYurvRXLSHoFw4P1hvbS3vZ2v1Vn
         C4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405959; x=1722010759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=OJWWI0tK30Apx7kTZE8oqYh5hTiBC8Mp5x5GKujNFMSXKEnBsN3QnmGwSd0o/GLViJ
         IMocE35z8AbbuObJrB62ANMuFGYdp6cwdsnUcv0McP5dd1/PC+/di6j9reAkiguJ/6mZ
         CGIvEQjvYCyRzXk1FNPVOlBuNU/KX1pCAQz20BIx266dI0h3r8ZQ4hO4ApJPj7bHrIsF
         130zdk5cM+DeRD3Tn83GaFH3IQaSCsyZrh4Wu6SHxHDH2ub65wDRCFNEZUyvtbq26TEA
         3Fx7HAAu/PcIvSa9Gkd2NA6AxmZSX9agdtIAPGnf1llCwx67R+HDQMGinkeWQBKUDOCU
         HVLA==
X-Gm-Message-State: AOJu0YzSsZQ6Pzyhz/g7BDhnkcUyoWKqzlo04HYF9HKk538ovXTKsZKu
	f++Z4BOYWtoP63lruFeksnosqQV2cr2PXEeHdofEFFQhCc940IZJrNIWFNxbnLo=
X-Google-Smtp-Source: AGHT+IHQAe6O+cJbWh30lRbS6fU+uPb7cUyHdN7YYYoHVFpFhiHM0/KCIscA223+WHZBsMAZXm0o0Q==
X-Received: by 2002:a17:903:32cf:b0:1fb:19d1:707 with SMTP id d9443c01a7336-1fd745735edmr3496045ad.11.1721405958836;
        Fri, 19 Jul 2024 09:19:18 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:18 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:19:03 -0700
Subject: [PATCH v5 08/13] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20240719-xtheadvector-v5-8-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=1957;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=L3aaRS2j1B7ly0GhgM86XDS3MRCOslmFg/ArzwGxzO0=;
 b=46volz7D510nYpV8b8G8sEL+MfKDxkahX1p7p6VUtGEmp9hohd4dHxtouCXjKTmXgbf9vIiF1
 wq3zInJRmH+A/hFLdwwNWrSgDojxtU74mzqmsjOmzA+vh2qEoz9yX3B
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_171922_466304_2E940511 
X-CRM114-Status: GOOD (  10.57  )
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

xtheadvector uses different encodings than standard vector for
vsetvli and vector loads/stores. Write the instruction formats to be
used in assembly code.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vendor_extensions/thead.h | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
index 48421d1553ad..27a253a20ab8 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -13,4 +13,30 @@
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
 
+/* Extension specific helpers */
+
+/*
+ * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
+ * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
+ * vsetvli	t4, x0, e8, m8, d1
+ */
+#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
+#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
+
+/*
+ * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
+ * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
+ * the call resulting in a different encoding and then using a value for
+ * the "mop" field that is not part of vector-0.7.1
+ * So encode specific variants for vstate_save and _restore.
+ */
+#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
+#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
+#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
+#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
+#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
+#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
+#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
+#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
+
 #endif

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
