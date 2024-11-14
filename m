Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4767CD637DF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 03:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACoNzfBU7JKVVNDQqPDxuWF3LyEYq986ucxUTvhl6gw=; b=QKYz27wVjS2qcF
	xK0Z9QEXFKYEaGMfvmIq3C3EDfZBeXA6UVfgh8w02T271GX8dCeMjz1P5O3LFU/cZdeXSUlDy6K8r
	eTsQMRgbE1493hWvKd2T781y23QYf96lZXqgS7pRMz6Wr0lSpRtzvokFBaY4NAtarzT5W7gCfBbZ4
	lo9/IOuXnWmnSXW0oyZSxPEKUadTYd8Zy0YHTe0rjoAOsH9k/gqMr4Pj697H+Ljg30so6WgTGF2sP
	/DVu8Mx9y0XlfkaLbN6JcJzEGZdh5WhTNhToZd/cI6s1lK44qvtsDpNKju0+B/pJlzojDIxtM+c4c
	EJZo2lSb3XKVEsIkaP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBQaP-00000008gEL-1M8k;
	Thu, 14 Nov 2024 03:32:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPUY-00000008WjN-35PH
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 02:22:00 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20c805a0753so792865ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 18:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731550913; x=1732155713; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqDTg1KZkB7odLaldwlsY3X0o5v8+LahAUJDMrZrWAI=;
        b=RcBEcx5KzRyrCglIkphoDf9WVZRWi6AkXA1L110nGCz8lO/DJFyeq0/2qaSO6QcG7S
         vUmK9Ac7NON2SzSiP+flbPo5KQkGaRBI8fhJCDLk7E9TIMVE/5JoSYVZ1Lk1zIWdpsHI
         CelB120Bb3nIbow7aPcmZl1L5I8+rs4M1hcmYBNsAX0kRxq4JE1LvEBrv5HH9uIJi+0r
         1OsUz0ZBYGwVL7LhDhBeR3fxQEPnLcNcc6O3aM37rvOJ0lFESGPt9YhUupIcVB+0fsuh
         /Ie3g1U+uzQ2Kpdt4qEulGQ/qBB2FE4g2Pa1WaVYt5b6fl4NPs7lewaFR0cDMZjK0/8f
         mEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731550913; x=1732155713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqDTg1KZkB7odLaldwlsY3X0o5v8+LahAUJDMrZrWAI=;
        b=Eg+8BPzsARbX1m2iCDByji5TlMhPafi7KzIfprKHPadT/ozLcZ9isekJ51xDi/n1w2
         slrgL6NEzxsrPtBDpnRb8efnz0kjj8K0GRPmnLDbUI0X2ty/C43JlpyAacwFS+zuAKzT
         aW2KbOAPv8+67IeAEaWpApyL+unLCF+maSsM4LmTjfh7R4s7SEdmuxf1zzkFS5ZB07s7
         okZr5BreNnEGW/+wZZEjkVNHsLTS/GNJecE2ljay8WKntSepRm0Cx+jZJtaISNpQ+S3H
         LgsrmRhwuUAnZkAXpXqA+O/cSEzk8nuhoxl7QVniBwuU4syw1BXHRHG/MRs8Iducp1RJ
         2eGg==
X-Gm-Message-State: AOJu0YzoaajGHg3FmSnyOU2sfD0X/XP+KKFH72B+WekK3Xx/ydyOpbfM
	8jUZwYxV3uL4VibRbQi6jQrjsSdwbV2vIwIeH4RRJJgep1E2zxRUcq2xTUGdJ9I=
X-Google-Smtp-Source: AGHT+IFm8P5gQRIsex2aGKwaijclDQhZLDLqCUSJxuaYbddepl2T/jxyWcTLByELALqocZS7LjJ4oA==
X-Received: by 2002:a17:903:110c:b0:211:6b37:7e66 with SMTP id d9443c01a7336-21183d1b72cmr310091305ad.17.1731550913319;
        Wed, 13 Nov 2024 18:21:53 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c499c9sm406875ad.68.2024.11.13.18.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 18:21:52 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Nov 2024 18:21:17 -0800
Subject: [PATCH v11 11/14] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
MIME-Version: 1.0
Message-Id: <20241113-xtheadvector-v11-11-236c22791ef9@rivosinc.com>
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
In-Reply-To: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
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
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Yangyu Chen <cyy@cyyself.name>, Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=TcqhLbjZS94rab3lMFuoSS5guT4Dq12UlcROgKWQAqk=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pp3KITMZ+Y2BS2evyNn8SgyPJ1Zmmh9dmf1hKpPhu53
 xi9fl7ZUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwERW1DL8D7da3SP/YNHbBu/j
 Qr7l2tvN3ObHr/lro6v4JDB066ba64wMW/XWiTLlHKswqle0vF2z/Fx5NIu7nkOZm+EW2cNaHxe
 wAQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_182155_207741_05849657 
X-CRM114-Status: UNSURE (   8.68  )
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

Document support for thead vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 955fbcd19ce9..f273ea15a8e8 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -293,3 +293,13 @@ The following keys are defined:
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED`: Misaligned vector accesses are
     not supported at all and will generate a misaligned address fault.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
+  thead vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * T-HEAD
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
+        extension is supported in the T-Head ISA extensions spec starting from
+	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
