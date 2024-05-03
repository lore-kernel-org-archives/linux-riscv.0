Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95160C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 18:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3wKwrLcFwyUZ+gRtqqvPnkMBCIGBPb4zRTfFMAiAy2I=; b=KxT9DMAfHBOje0
	MrMYQqSMHUzyMDe+cf/MAixJakn7OmxIN/RHoOqdEU0dQSZUePrV2uTBJWt9Vn8zF1ww9N9LbXGfV
	Z/cz9myas/OsvMD9zQv0SPhe294KmUPOEqUkIrIOgmAMvXJh59KOE3U2Ulgh6lv3DrNJqgbL8cYUS
	Lkk3+08N2IzPoqMJO/ECaNtS2wn4LGAgymXiGdBQse6H/JM21Lv+hxaBT8u+cwqIIZ9y3dUJrr+o9
	ODyv3+SHN+WEA1X/zrwye0ieX6EIW5pKZSOAElkjoRCJ2DPuFBG2xaQ4gOGLGwl6fAJP0GMHrP1AU
	Eg0eCzKHPM7BOM60RCDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xVW-0000000HXTo-1ZZ7;
	Fri, 03 May 2024 18:19:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUy-0000000HX3K-0E20
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 18:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=; b=K6WFjaJmEDzN0rjPBN7/FGiVyC
	OVbb3MSqll2R1jou37kWg8aCxBjfSukBtH9i0oMoQ5Nlbu7op6dM8oxmSRGUgHodcvuEQZulBp8lJ
	m6UVmEhAdgGQxv2ugAl2YjT5b1PSUmHJXATwjXlrw9XrgL1y5qnvtjNpmUj+uJ/cZJQxgpzmKKrHv
	KfZi6q2Rb9t0Ol9UogJht5UB+ON+zNgpUzOw43LGjGgxoDb36xPuVcTBULOccjagO0JYSI9Ym2Kqw
	4l72RhsJZfM4q776FcX8nNenJ+hGZCBiHwPyP6+vLjgAMzHYkSUkLBY62EkssPYszIUuZZ8bQWMfV
	I0+tRBbA==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUu-00000000duy-46Qq
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:19:06 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6edb76d83d0so20004b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760343; x=1715365143; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=umfhk5U4LhoQcYAqNhY/U8HPlC/gnqKjhmdruqovo9ydMK7UCpkzgwDCeD3shjUkJG
         hHKI15xQC/qMZS0tJ08mpGsWpZ4HTeXsh5MUI814Snkbo7Swnlwx17bk5QZaCrfJYX8E
         sdicLapgUe+Dl3GQwBc9X9r7MdHul5IThQsQcJ3YRsknr/+/2STnVth3u7kYHUdx/1KW
         BmsN3kGgLNbqBqtPxwuZCvk/pkaaDuD2W9WGeChkGy4ywTIfbr4FneUaTG3JgtDXNYNA
         QKdGjvlG5bUyZAx50WRGzcFFKBIDhwWckoEYU8qAhjoE0eHq30iWpJ9t3bYvgQja4xcR
         DnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760343; x=1715365143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=aiFQc0aS/VlfKchRdr2j8clhXsoFJg/qK3SjAeJ20RnnAWejA7yXr+tp6gIQcWg58Z
         rf294aImF+llj/wj6MN8s4iAyAEbkMPcYYnABlgqCYfrfs7Gru+O2e34s1L4esI9Ei8M
         RlmjvhdlkSLPeAhgM37IGxW9BtUgI5jywJomlv/BNtIkXcUJGg9RX+6sWblcVLIZlmfe
         Olpfms0gTY9ZvItedKonWAMd3MX4SEWd9Ci6+5GW0Wxh2agM5g+0BOFe7uMeeE2AUz6R
         D989BL4hMDSYzfSTB0nwnTWHL35c6HvPwR/WT2lCVNdt5F/xk1tweGlIAY3MnFQU7Joo
         Nijg==
X-Gm-Message-State: AOJu0Yx76CqrdGDLJMxi+9DiV8YPRYCmfq3EgjbuICRo/QGF2tVE/xoG
	BjNVaWYnInw0hHdYuvaw2bTTTFrgYdL7cvhVkCqLuz8B7z6MQFNLfJD2idleiOA=
X-Google-Smtp-Source: AGHT+IF7gftC9fEPBK3Bggf4eQiSggGKhcVSlVmTLAC1VCCJYp1g2BuCN/OUrXEqJOUkjFfaFq/CxQ==
X-Received: by 2002:a05:6a00:a1a:b0:6f3:368d:6f64 with SMTP id p26-20020a056a000a1a00b006f3368d6f64mr4353833pfh.2.1714760343431;
        Fri, 03 May 2024 11:19:03 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:19:02 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:25 -0700
Subject: [PATCH v6 10/17] RISC-V: define the elements of the VCSR vector
 CSR
MIME-Version: 1.0
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-10-cb7624e65d82@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760319; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=C7F1c584ODJM4qF9TPT5kMoM8fDlOPYyEMw6010Mea8=;
 b=QAfri3k8PmVP8oWnQJb1YOL2NJYh4cui2R3V9rrymRbcl7uWQRGXqUcdkbJemfvjyjiKlMNx8
 hUbYcNkff72Ce8B0MIDoDdfDtiaumUjXLUkJ+tfHlem018s17zddUrA
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_191905_108421_35C322B8 
X-CRM114-Status: UNSURE (   8.70  )
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
