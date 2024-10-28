Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4678FD13570
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5o5sKb9IGSadXQ7xKJR3idq9/HZpBAeSYtwJA6r5kQ=; b=rklGnMnjZWhpvd
	HLqquWycQfws4CbwzC522aSQrtjABYFfDuFNVTjwt952S8G7yCM8hHuU+2FC6VdO2RMzW7jIJRd+Q
	U3QB7uh/arGdVDd2p7GkmVywzShleCRZ8B9MKrFStiJ5yObZ8uNauQYiouGcXIwZ6YBEXVP5Pbw/E
	NeQbOo5NjxvJ4msHsQ/xx2Wx6rlzS3m8td9HXzOonlJhgY0GdncF6BhluYkc/qAM1yDzl1kVNwFbx
	awLz7gCQN6nRR7pU6rbslV4yIg+iSYzdCoTazvAMAsLVkMxihAzQdPTW/cZVuKd4d9BR7W6MMZDmu
	Vgn1apuxAsIZF3/fzBsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5K1p-00000009qI0-0GzB;
	Mon, 28 Oct 2024 07:19:05 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5K15-00000009pqI-1A9v
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 07:18:20 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20c8c50fdd9so30600655ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 00:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730099899; x=1730704699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAmlP3w7cbuw4vs2LRWu6ikJXLe5vZx2U9ot0QY3nzg=;
        b=iX/vfBEn88XSyzIinKYJ08hNSEyKnRL8FLJEnBFRW9pYahjZouwcY/0pp45x+In2ct
         JB6wnXdhS2BVR6TK5tGBi8lrEWSZCHqsQm/+lCBtTosT2RLLpA1blbJ75mUnrYnXmovd
         m3P/EP2tZ7dZNgVD5ouh8SHZkrM6g4p2d9ufn7A7alzA8acRKk7sbkl24WOi4cku98H7
         MjfCDxfi/c0ebxrL4nlSrLv2S2GEhJ95sUlkXPXnFCrVeEIzWrHFTRDrZO2j3EWgaenW
         +VHQ7W9GoZWVRNGXTTYCdb6j4Ag4lv2Ontwjjmmqv8mKQ28PRjgOtDjkO66ErVuY6QHR
         3WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730099899; x=1730704699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAmlP3w7cbuw4vs2LRWu6ikJXLe5vZx2U9ot0QY3nzg=;
        b=XE+TVGhjyHJN1OeiHi0XbM0h7wSFNFYaZrKgjOSVFHPjdo44TWT9VQlrkbdgElfayp
         IP82b1IhaXtpKUeW+k9aU7/xz7T0SrS0Av2zZK+RHxW3+54nptOV/Urgh0empF+69QGD
         kuhGYHkd5HDXEDwKTljvafOtk4FhRAy9X+E+ry6MLqQL2DzBb+P6UjT4tkWgc5CM5a8v
         MHkIyJnJXq7uGqPRfDBpVu0ywQdyHl3yFc2lJPUJ2Nn60SmIOWY21ppGeNJ6EgEHDUjB
         kg1jGuUkdDwRgY+Gkmka7bGwJhVES2ezsZucsfxaifG9okfIQeUL19w3bxKP/E4xpIdb
         huGw==
X-Forwarded-Encrypted: i=1; AJvYcCU7/A9oE9VUCnIrTW+blF//E47EvYEiKXIrQ1YsOJfk+cpNSuw6Yl6vSFrM+y5M6BNhRThZT5ismbKMAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzO65k4Q9Ab0J7vgS8igFl7OyNQjitWbcNRKFL5jeXUGVB0Ja6
	lLafmX7dvxeEv/H1nWoBgtofpkTaroqZIWmcoCAYOFWZjOfVfEhj
X-Google-Smtp-Source: AGHT+IEUoa5ZbRgyUDvT5sSSexEjNU5hWJ5BN3DtO5DSUyaxLGN5Xl3CDpjSkdhit0QPMLIFVQ49lQ==
X-Received: by 2002:a17:902:ced2:b0:20b:5aeb:9b8 with SMTP id d9443c01a7336-210c5a7154bmr120474645ad.24.1730099898614;
        Mon, 28 Oct 2024 00:18:18 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf44550sm45265605ad.14.2024.10.28.00.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 00:18:18 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andybnac@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] riscv: hwprobe: export bfloat16 ISA extension
Date: Mon, 28 Oct 2024 15:17:43 +0800
Message-ID: <20241028071746.869740-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028071746.869740-1-inochiama@gmail.com>
References: <20241028071746.869740-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_001819_342137_F6F7496A 
X-CRM114-Status: UNSURE (   9.79  )
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

Export Zfbmin, Zvfbfmin, Zvfbfwma ISA extension through hwprobe.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 12 ++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 85b709257918..8c30dd06f3c0 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -239,6 +239,18 @@ The following keys are defined:
        ratified in commit 98918c844281 ("Merge pull request #1217 from
        riscv/zawrs") of riscv-isa-manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZFBFMIN`: The Zfbfmin extension is supported as
+       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+       ("Added Chapter title to BF16").
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVFBFMIN`: The Zvfbfmin extension is supported as
+       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+       ("Added Chapter title to BF16").
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVFBFWMA`: The Zvfbfwma extension is supported as
+       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+       ("Added Chapter title to BF16").
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
      mistakenly classified as a bitmask rather than a value.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 1e153cda57db..95d00a065b4e 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -72,6 +72,9 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
+#define		RISCV_HWPROBE_EXT_ZFBFMIN	(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZVFBFMIN	(1ULL << 50)
+#define		RISCV_HWPROBE_EXT_ZVFBFWMA	(1ULL << 51)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
