Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6D1D3C929
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQNTojHhb0Uyi9j8zWrWA0Fhc+QsAmITfEbisUHAFqs=; b=NJvxKWCliqPUr7
	PwKjoRfmF5AoUnN2bPJ+c/Va8/kHs1PoYpIyDopIrUu9tKzVjP0LCcCtzqzZFw0cphFOhkMqqJOvy
	q3fexLVwqEsGdnEx5G+IxuqIDGtCmxi/92T4lca2n4lG+VtHloycYb/4Fq8p1OBLbhv8XLgH7Wu6I
	tfCPWPSlxPYmrSXfjt1SjcMl7TGw2J01C/rXf6ODLftWYjrguV37Kd/KwnyNK3YF7TOvvIm8fIPbC
	IEt4YlVuBo5xkednS9Me6a+cp+af8Q2ApaNT5VcFv+nfTm09+S2lwC1wGCkOw2OHaHbrBvPR3GIAX
	/LkoNwzveEYfSB6u28gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpE-0000000Fc0Q-0CfE;
	Wed, 10 Dec 2025 16:14:00 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpB-0000000FbzX-2axC
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:13:58 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-11b6bc976d6so1441249c88.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 08:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765383237; x=1765988037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWzmybggo0M1zeutAuZC5Q3st2h/mif7NCT8uxT1eGQ=;
        b=RV4Hb8w1ux02iIlZB0lKf38JthvCRuoxOkQQCuUB1KItzwFj4fXBEg8GKXGjJtM3mu
         qJA94YDc2m11bnPbHr6dDIpmA7J3brYy+4uDdR6kU3963qThWJcIkPRIvKA/8RXcDjku
         wwXK/0Pnz3Yhv3vY4Cj/qd4f94GOo4F7rJK2LSGmsSAM82n7PwSy2HoUNN80n5tORwu1
         U9reEhhx7xQfHaDAtR4qjplwI9zfI+d2indNzqAulBX3pLrBr9O8R0YUrVRLdKVcLjqW
         dxo6hgOlrXVJke5COb9H3zOKwYwepgtIkjo3uLR3/gt8vFfYQrLFH8Qf+vqufcmLySGB
         yz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765383237; x=1765988037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wWzmybggo0M1zeutAuZC5Q3st2h/mif7NCT8uxT1eGQ=;
        b=U+owii2xuTFBhW+M9fEHm89DkyDjZPh+vNtwm0EhiHtWUQJiqSe1a7rbwbmSF5sKHn
         mBBuibILju4/N4mCh/aPcBGlE7yIf7jConZ3tb+nqWcXAiKV+vC2KmCQl29+FIsIcMP9
         xE8F0TQCuPrYCH44Cn/DynQyXN/k0xCghZK43cZXuggs3yEEX/TblWb+g7ishV1CptXp
         ubHCwo49IYmKZsq9yb+8EvNgbHrkNKPFamuxxR6B4IGuiiaJqOZEFh2LZbmvxRqvmkqt
         w44/J5Au6nL26/UgK25OF6aFPe1fwQ1mBZv6j0iNKkqSw7s5jUdM0X/WIAXKXzzxzTQj
         2bHQ==
X-Gm-Message-State: AOJu0YxnQ/ObGVh2/b0vGbIX/d31XKFlX29YaMr6sTPoyuIXkYBmVdv7
	g1CSdaEfQkhNUvMM4m5mPzh+fdxruX3i1xWaEmlCZs9Yo9RInqAtaVAzkjlkmIy37X4=
X-Gm-Gg: ASbGncvX/1g8COs1ngzMJ2DA1aQDTifDv38S3x5kcVD0nqzTUexDJdKRQcZflzhmpo8
	ivinjC7KhDHtFpkjicHgk4T8ywM4hji6LSPkIhKXECyarNQJ53KrSNFzsMSRvTy6tiGRluq6EKf
	8VAc1gP/EgLzWtRWa2r9pWIM1n5QKUEZdNzwQUQ0GWMeJDXorN6jClY7TGKNSBLHEQCRvATdiey
	4RC8aBc2gHbGCKTJSMjr31xTv68aS4xF2D5AUOuuhpKAnOxruoZsCh8rqFj48cR3VeYJChalGDE
	M30RYObUqyx3oPaDBpgLWNweyPnuVTa07L3zWhtANRI56SZ04V/78QWXPQEWA3nj45c9xW05n/V
	MMqc0JdfU5APHlgPDCMCxcl+3i1YN1/RvPAMp8n08C5WO4E1K1Il1fSdDZG0iUDbnZaI8FTe9C9
	32GSNrC1j2NlYfsTl/FIZw0All3HXYGl1gmOqThQSkqRM+Fzaqg4UwykcfgtkfenAGh4mYnui2G
	sLxGRN5U3oql3kIgvHTP54=
X-Google-Smtp-Source: AGHT+IEZ/ZblbzeycdWmXmR7XPXHy/xRULYyuv77HFDKV0gyn3kOSkitVSBj5J13oCBECvdvIiah2g==
X-Received: by 2002:a05:7022:441e:b0:11c:2632:b7c1 with SMTP id a92af1059eb24-11f2db87c53mr3479c88.0.1765383236687;
        Wed, 10 Dec 2025 08:13:56 -0800 (PST)
Received: from [127.0.1.1] (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4733sm10364600c88.17.2025.12.10.08.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:13:56 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
X-Google-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Wed, 10 Dec 2025 08:13:40 -0800
Subject: [PATCH RFC 03/10] riscv: kconfig: Simply arch selection
MIME-Version: 1.0
Message-Id: <20251210-profiles-v1-3-315a6ff2ca5a@gmail.com>
References: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
In-Reply-To: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765383226; l=1325;
 i=thecharlesjenkins@gmail.com; s=20240124; h=from:subject:message-id;
 bh=zzLBT9CTg0Wd6TsXf4wm0xzdyCWnbtQr2Yp154TelHI=;
 b=mT+yscPZblLBKxRJNA6HXDldsUZrXZ0JWLfUCnFeszlF9zTiyst2vR0PuOKcwCf+sYRUsaOH2
 1jU1OMRHGclA/9WQrx/nX/2sNQ06hJp7NTA843sGUBXNdk2bS0UjZWw
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=eVndo3OHViAjwuqHqbJB4ZtzJzzvk/r6fUf84tZ3rw4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_081357_693397_CF5A237A 
X-CRM114-Status: GOOD (  10.87  )
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

Separate out the base arch into kconfig so it's reusable as a string
variable.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/Kconfig  | 5 +++++
 arch/riscv/Makefile | 3 +--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 22a6fed0b216..ecf22223962a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -418,6 +418,11 @@ config ARCH_RV64I
 
 endchoice
 
+config ARCH
+	string
+	default "rv32ima" if ARCH_RV32I
+	default "rv64ima" if ARCH_RV64I
+
 # We must be able to map all physical memory into the kernel, but the compiler
 # is still a bit more efficient when generating code if it's setup in a manner
 # such that it can only map 2GiB of memory.
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 4c6de57f65ef..ef1a7b1bffe8 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -58,8 +58,7 @@ ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
 endif
 
 # ISA string setting
-riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
-riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
+riscv-march-y				:= $(CONFIG_ARCH)
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
