Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665DBEE6451
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 05:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7TevFGdTDFJ1MbftTCXAmnfntNhBDr8S4L5Pvz2FPyA=; b=Vbw551RN+VXtdZ
	HM94qaO5nqg+/DMAD8ZIO0Rk0f+ztj/0/En7MIdJoLXZuCV8+gJmTPjIeweR6WFrl75OKvDpAJnE3
	kO/zMrmhSM/yeUEWoNI/1JGb0TGIV+2Ie20A9Dh0LfVvRGXyYk9jumFq09LPMWqyKh+ycgKc25S+j
	IhsNXyazGTEoQKrvMKd+XkC5MV3Cny5J4BSenVSyVoVYHDAYxMcqg4h3PvB6d6uPaHRvX4Q2db9XV
	les5gm4ken4+wvqFGRnOYdfQXIo38GfOLchWLWwq7+RZGwvaQxiInsjyLqKL8sW3bm/RVY1eRjRdn
	5iMm7Q9JWNvUMO73y2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1socoE-0000000Bw4U-0pH4;
	Thu, 12 Sep 2024 05:56:02 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1socoA-0000000Bw2X-2865
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 05:56:00 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fc47abc040so5868955ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 22:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726120558; x=1726725358; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QC5zCLZI62pAjh3MZXl2DmzWweDYeenNtUhW+BVEweY=;
        b=iGOk5d7TEpxrejd4vGQH8LkCpH3CkUP0ZXCirPZeZI/OSf27wMfSN2TzyaQNc8cEho
         o37WY5isy0jioW7Li+DklSiTbpiMsgpKoEoOe0wfceg+vsfKedsYzQkt6IFelQuSTPiA
         eH1Axwjsssoo3ejgZTikcy2zSsTvNM94aoKn+OGqomrwFV11j/MlEwKaDxl2kQO/O1Hx
         vi6NlQ79BHzMlPqhTPXa2CmA//d3J3vhLcy2USNdI6n9yxwzRX7aK7imjkkwesTQ3nxi
         bI6bcePDHWGnp+ebKT0PSuS6PYHHkwiqB5jNVvRXPuIgebjwExvS/Qd87aP50ZVDkSNY
         vnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726120558; x=1726725358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QC5zCLZI62pAjh3MZXl2DmzWweDYeenNtUhW+BVEweY=;
        b=H4wJv4t8Bjl7U0lL7/vfz/FPdgfloqx9e21TI7nxc7eGAQSr2luoj1ROQauqgvwxHA
         Z298MgX8YYvPRLSEQyMKXbld6uJLKT72fqpCQjiKmKAVunje9t0YryMYJqrkex1c5X0H
         b9ZFjdtFQ7CgRrAXqzTZ+EFSOHcN7bFilqMcLC4e/2Cw/7oqvl89uN2qooLAsy8Zivxj
         T5jd6MQ6srTQBcQJ36bmmlss13DDRUTJ9LvQo8nhdp6j4ZaRfCpcK966X7NEPi3tgTMc
         mLSeRiKEEbhcEQWtATSQp9X2NqWbV1OP9/eW7eHm/fb5HdsVCd3eM3m+mIwo+CONlM3P
         MqbA==
X-Gm-Message-State: AOJu0YytTGnWE+657kZIwyDKdDHtzc5qtGNtQlYV6P0YHos2ndou92mN
	ofKM0+hJ83qqsIt8OxAecLT9hjpECNfyA0GZrcgHbINQaeGiGvpfXh7CtFiIKWLHgyZGBN22OmU
	s
X-Google-Smtp-Source: AGHT+IGyDCzQZjkQHkJXtnWNtioMB6ctq+/3Xni39dhHW8vmk0vcTDkokS2omVuMqKCmz0Pis2iBfg==
X-Received: by 2002:a17:902:d50c:b0:207:1708:734c with SMTP id d9443c01a7336-2076e31f979mr25362825ad.11.1726120557914;
        Wed, 11 Sep 2024 22:55:57 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe99b6sm7870465ad.209.2024.09.11.22.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:55:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Sep 2024 22:55:14 -0700
Subject: [PATCH v10 06/14] RISC-V: define the elements of the VCSR vector
 CSR
MIME-Version: 1.0
Message-Id: <20240911-xtheadvector-v10-6-8d3930091246@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=930; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=DIdTxrF0tPCTSVf2TD2d8xS0VDMxpxf73XTxU8DNXFU=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qjpmjOUPYZ0uVTnX69zzU2OC36c3lXu8jeU+emTV3HF
 sS2tzW5o5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgImUnGb4H/6mcBlT+5PDddcq
 mEIs/EWF7tvNM/wy2bNfgf/E2QyRCEaGKRJ9P6slZRemCE29I+349qW70NMJUx7HqUctlvt859w
 2JgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_225558_909296_BAF4C17D 
X-CRM114-Status: UNSURE (   9.01  )
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
