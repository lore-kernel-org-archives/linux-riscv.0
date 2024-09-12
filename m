Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DD7EE644E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 05:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tELmaWCG34GGOn9n80LEVUMkOEIgdr8ZZiIzM5JaEx8=; b=IhGHKyuU6V/yvx
	SaEnFp8YfVlxlCEF0wVPXM5a9a/EDncfZV2UG9hnLHAzXSTLdYoR0IRCEAS6c/hSw95F4xoP/yQfY
	a/1FuBGxYkKUufpf5VlmQmBDY2vMvqqQqwdaR1KyBtgpSid2DMT4lvRR6+8zGjUSK7HlHAbE2cCxb
	vimNjbik5+Oi0HnIWCH6URdHDXp9V+yPvU3k+6g83Q2X7XsqbESMcDcdU3qZwrxwbj7m2FgnMKmQC
	Va+24EW47HyuqRovdjPB7/VPHENL4+ml8Fu9t1P1ETlQUF3k3ffJ2IBUiJRci9e9K9V1wlbw8axGh
	WGnJ3+6QWK4SUVc2PqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1socoK-0000000BwB3-4Br3;
	Thu, 12 Sep 2024 05:56:09 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1socoF-0000000Bw4x-0x0w
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 05:56:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2054e22ce3fso6442325ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 22:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726120562; x=1726725362; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSL6WjjHpdqYO1H/eXwGFHcRmPD/KtF7kVjlnnuCHwE=;
        b=hfRD3G74N5HKUDmMdj6QDGATxkC45TBum/ToFwkTZgp9BH4bKqHm+jmKx0EwVxwzz/
         Q7qQ2dAHWmoWMGvlMqxItJP+a67ZmIc0Pay0MhFKQsNhhakzw4js47WY5a9A5FysEoBZ
         Nm++yTe9i71jw8h5p0ZuH6upsOHem8Fa2AemzGVPvfhn3pLP9g3q5Mj9o7F6YBYFt5D+
         LTHc4aaratVjp0AwC4VsaZgGoLDOa8HiteP6djs0ieFRuusnTyMAdUJZAuYMpQxR6wCw
         NIvY8Fk+YRKc266PuLl+4O69V82wC9qSHFrNsLPLubjAfsHc4FrgX4JVpFqRAcG3fEH1
         EGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726120562; x=1726725362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSL6WjjHpdqYO1H/eXwGFHcRmPD/KtF7kVjlnnuCHwE=;
        b=kQhkarRt1cjYck5ykYPqWwWQqvOeOLREhrryW1sP54JX2PHa7OABqtRc8M+a0Uhw0t
         +9DJMcsBRaJv9X9fceGEvZDmSoD83Y+sPlEDxIFKfrojSLQIEXUx1JNjq5HlMU1fdkSk
         Mi9k1yk1zPvcD/sVlOqX+sK6YDwMuofMOBWaegrEjfAnwUR6N3HAvjs2gTNAbaAhCakI
         5NHNqGFzt918OE/ARve6N8UBk6LPMTAfYxsDsGLRd5JYgH+PdCJhdE501UGWZ8WFxetM
         4lg1+12jHFZ9QHvw54SfD98wYk78xCRIz0xI7+xHdejiFsfcfivur9WWv6JJRSzXvkhH
         3QbA==
X-Gm-Message-State: AOJu0YwUaYDqxuDZ5XOtHL6fb0XUvzNnYWuIz9zPEbyk9s5x5k/rF7+E
	Q6F5n1ZL8O6iN0aVB+3zZNas9JTB7iXXtgiWhqO/ZTsH/47IouveYrAhNKSm9QU=
X-Google-Smtp-Source: AGHT+IECLV4z5WDlwOdbMshxCcr9zLYBzDjXvcLIsnzDjItc5dYHcznYBe2fAYb+H9t8yei2s9bchw==
X-Received: by 2002:a17:902:e94d:b0:205:5f36:ffa0 with SMTP id d9443c01a7336-2076e393a75mr23890435ad.35.1726120562132;
        Wed, 11 Sep 2024 22:56:02 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe99b6sm7870465ad.209.2024.09.11.22.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:56:01 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Sep 2024 22:55:16 -0700
Subject: [PATCH v10 08/14] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20240911-xtheadvector-v10-8-8d3930091246@rivosinc.com>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1954; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=JFu+LGCqiNnapZxee6sXBtAHc3I5ntU7jWhjkky+nXI=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qjppjtbE1Gn1/GLT7Y32OjauP5VlT7/OyP+W09k2cLq
 n7awmDcUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwEQYyhj+Z6bdPced43yXUW6D
 orbittf5dpOX+Kz9zpP0a76w9fHN7Qz/dA4YC3+u/hnRdmNK36wKUf6il72pz5yflxyZyXomrly
 LDwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_225603_394130_636D06DA 
X-CRM114-Status: GOOD (  10.69  )
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
index 190c91e37e95..118aa0f82c82 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -19,4 +19,30 @@ void disable_xtheadvector(void);
 void disable_xtheadvector(void) { }
 #endif
 
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
