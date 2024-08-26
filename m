Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC946C5321D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 16:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AzxVMn4Y2J1Ay3x6PoK1fvuA8Pju4i0hOPKiXd6UnE=; b=Vo65Pxt+gfRZ32
	dr1p2NNrSZSi6KQT46E3wawqO51SNojMF9Q9843qZmTRjLSSp+0HfS48kRcxlZR2CtcGCffNWXsob
	gDw8mLm5d44XskbeV1XpCXpjvwxiC9WkvjAkMT7B31MysGPDnDIOHfMQH2V/fkoad7DXfuHMlL+Q6
	0mWdHnQa5RPGf+byWa+ULisFpWMYc6JrL/mstUFwhT3xgqAGaadeADtYH0jqe9OWPB+9FjHegGVuc
	pvZqyAKgTQWAhf9gYBbsVu4GbLLSJ8weOg9GtubSCD/RND/WUvEtxDXlBDbwpEYXxHA2oL2qZhxaF
	jzE/H1SjUosl0Sxffmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sicin-000000082As-1zMA;
	Mon, 26 Aug 2024 16:37:37 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sici8-000000081xP-3Vuz
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 16:36:58 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7bb75419123so2940983a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 09:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724690215; x=1725295015; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwEY/VtoVmU+E8jst/8XYF4V03csuvmXOzOLHGK9FuU=;
        b=gtdPC3fteEduYc+etNfCZPrCB8o3h3drdhpuLwBtfp2L7e88GVEHxYez3EbLjz62uB
         av0R5szpBdSZnsDYvRabzWB0peU0hIlEFJfTsMPf2RrRS2lNLrjjfxdTKreIeuVrl9E6
         3wOaQ33J+3v1yvrxr9WQ9vvcQG2MNo0p8iZLjb8cuAN/QvwHiihSPeghn1JMcLTRe/bM
         mQnW6O9+DTcS9TxP8thjQwfAS7V0fNiwspZzL06TzSJwuzHMVSOoAi9ELXQn7lC9WsvJ
         Ku4bjzJSCMZaszXyRRo2BZn63JtGdMJtlX1INad70W4wAP7/354ybiv7O5tPkLF81zIJ
         5gKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724690215; x=1725295015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwEY/VtoVmU+E8jst/8XYF4V03csuvmXOzOLHGK9FuU=;
        b=K1yATBdLaHt9xV6INUWswUrqoLcNb8H/uePIlNHTlr+VXFVDcjfsUPeS0daKmUiftR
         9cOWgB528oNfn853vgMh5mtN6Ls7e4eDogKhAaNOoyYhV9bsJ9sEKVreKOSXKXM4PCfV
         nnCs2htdbxLJ44kb/33t3sq7Wnex06LBNrbS/fl9xhL3yLK9M8VadbNUq8oEFvBXjOkb
         mQT5RKSEwZi1w5Iem9zNJEn385l0u71i9aSH29J2V5nX4ZB6nW0Qn9aCIi2yH59i/dHS
         lczOCe8mv6hYOcsWzxnFNwXAtmJoIETWwYWh87qipHfwyMsleqHBafaIv8jctdR9qgyU
         70DA==
X-Forwarded-Encrypted: i=1; AJvYcCXzhoQdUZ06Reb2tnSxOWgVNCCm7YrQoPL9l9C/XBDOzu3DlrsnH9vRqLNpJMNKuZJxg5SfksxrGNQinw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEaQoYYa68N5Qixrb6opI8KskmVoM1nujf5v0Vxou71XEnsppQ
	AL05CYxH/2TO7OS+jsm9n3sxllrksAY2P6W/WBjCEWKOB3Rk+qNZhMkQB0G+a/s=
X-Google-Smtp-Source: AGHT+IG8QhmkiiyjHn7CNuzuO3cKEPwPnStUmNniRFxIT45XKmbFcpuLujqkeUl+VhROGvvkE85iNg==
X-Received: by 2002:a05:6a21:3401:b0:1c6:a777:4cfa with SMTP id adf61e73a8af0-1cc8b475035mr8486714637.13.1724690215233;
        Mon, 26 Aug 2024 09:36:55 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143434052dsm7174708b3a.217.2024.08.26.09.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 09:36:54 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 26 Aug 2024 09:36:45 -0700
Subject: [PATCH 1/3] Revert "RISC-V: mm: Document mmap changes"
MIME-Version: 1.0
Message-Id: <20240826-riscv_mmap-v1-1-cd8962afe47f@rivosinc.com>
References: <20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com>
In-Reply-To: <20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
 Levi Zim <rsworktech@outlook.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=XqOUkInmaOdlhgabGcz+808CcLq83Htv813NZMtziMU=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qZ9crHD5wOM37Qun7plPRMb+9NoTsZH2gXqZrrqPotV
 QpY5a7UUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwEQstzH8lbiy35Wr1fNig5vi
 i2+/j7/w4mc/YXtzUcOKwzUz5Mqf2zP8s8kSC61Yeb3Ztl4vi8N6j4Pw6Rm1q/s5plxPsLT+t/E
 EPwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_093656_918219_01A5D5B0 
X-CRM114-Status: GOOD (  10.46  )
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

This mmap behavior caused unintended breakages so the behavior has been
changed.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/vm-layout.rst | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
index 077b968dcc81..eabec99b5852 100644
--- a/Documentation/arch/riscv/vm-layout.rst
+++ b/Documentation/arch/riscv/vm-layout.rst
@@ -134,19 +134,3 @@ RISC-V Linux Kernel SV57
    ffffffff00000000 |  -4     GB | ffffffff7fffffff |    2 GB | modules, BPF
    ffffffff80000000 |  -2     GB | ffffffffffffffff |    2 GB | kernel
   __________________|____________|__________________|_________|____________________________________________________________
-
-
-Userspace VAs
---------------------
-To maintain compatibility with software that relies on the VA space with a
-maximum of 48 bits the kernel will, by default, return virtual addresses to
-userspace from a 48-bit range (sv48). This default behavior is achieved by
-passing 0 into the hint address parameter of mmap. On CPUs with an address space
-smaller than sv48, the CPU maximum supported address space will be the default.
-
-Software can "opt-in" to receiving VAs from another VA space by providing
-a hint address to mmap. When a hint address is passed to mmap, the returned
-address will never use more bits than the hint address. For example, if a hint
-address of `1 << 40` is passed to mmap, a valid returned address will never use
-bits 41 through 63. If no mappable addresses are available in that range, mmap
-will return `MAP_FAILED`.

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
