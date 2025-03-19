Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22802C35FFA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 18:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IRcEPWnJEs6I7IJu/bGixzc4ik2u1+S968cWMtYxoas=; b=s0t3ebY1ACDhb7
	hZMcgIrorxiof5ldoFOIxKVfZOVzqoIFIwrFJ32lNU/k0JPwBUDHm8oUDu7Fdf6kT1cN0WomgT5jF
	ZLrhZaUWrAuO4LeO4cw6cdtlMcSjAbfQWcbszHeIY0B7jNlIa8RRUROgHpLIyGwqG8FG6k7a+rdUI
	Ml/O7T6h6gxcZZYab8Uzsckzfd+qsv6h6iy1pQ8YJawCp0W2ov8gi0nQG3ZcBgHvp1vlsh20kAK69
	0kpAb+l4h1bovutIrwJtIOP/ngpa3uB8BgfP6iVvd85hYDE86+JjDwE3fANPKdXwxWi0TYLjuzyxS
	+d6ejbgS00mIHL46k/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyGL-00000009qgi-2PYl;
	Wed, 19 Mar 2025 18:35:33 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyGI-00000009qfH-2GNe
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 18:35:32 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-223a7065ff8so62246315ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Mar 2025 11:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742409330; x=1743014130; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QLB94k0pWwcNjDTf4HpckyyyYqaKP2kOAdvgI5dwRD0=;
        b=HR2KIJPDTh8jOF+MgVGGcG5lARnCROPuOOGMjpI01kqs01LcHPz2fLWlPq1/+az1rI
         YQvfTewtZdfZ7QoST18vW33THv6c6UIYLrJbKZREFwrf0jQWs8ibMP1PtXsb7OE0ilH9
         a91/izpHSI7AxIKXilbcgipftZvdCnNEtgZ4Rvrv3raIlEIDnXeF00bR06yPsdYTQRur
         gUAVq0/YXl3ZIzK1l+qbVISfMBYs2Y0v0HssGfoCAkZkF2F79xNF5iHoB8Q1kFT/xUPk
         V8MdfzBPQYS6uasKfIiflC0f5YQQUgkXtRBUnDfXVKN0TPPO1mxIDerINMt/KmdovB1f
         Mnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742409330; x=1743014130;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLB94k0pWwcNjDTf4HpckyyyYqaKP2kOAdvgI5dwRD0=;
        b=GAI4cmbAUaN8iYi2DuqpaGzX04KUp+EdGikWvbBFxol+JVjqUcekfafMZsoJtWVSCg
         rnHg7esh9dIHDUfV+W1ITGLPlr8ZBJEyexK4MS6KMiuZ9Q8PE6cb6+CiCy46OUUfXLvU
         14z+bCAmYJkBLFDSoiquVhm4zdxLg4IUVpqmgIvZjS/nfE9VH7V/RL7l3r47MABRctlf
         WDNU21DAdn9g4jRQtIXd/hf7yII3+EN7B9ZQdpO9/aDVRh1zlxAI054VUp3C8z98huW7
         6AjNj/d1ETh2W8jnLG9kyCPBrP5HVRwPEpp5wZUW3ivEL+uEL3qlbYMH1EFhpWvKE7RP
         5+5Q==
X-Gm-Message-State: AOJu0YyBYxB5HFfv6+WtyJeFYRUNZ20iKXqcLEHzdY8CGTZqXDe/K3US
	FjGV3TvF7XpyRBN5OYo5sWubd267H+qlG7sO0vFLe5RLLfFGDfznFM+npH9tcyg=
X-Gm-Gg: ASbGncuYTCfT71rivrix+MNqE32q6H4lV3MpfvUSzhijD1efNUBjbzzMzGbWT//fzO/
	BgV3MFjFCd24jyEc5415aHPDodIF7DXJ3pOQvbUm+fX1c1uzilL4eivqomBImW9eT1UV7lrrGXo
	No6FHppdIqrgU5PnaXTa+2CzpMqzIyQ7+f0hZsTFjbOjkrqkgBJllsV6a7dcUgRt9mytvtS+l53
	RYk728rxvH8AaaSFMrwMXRe3hmjwKTaMmTdp5zwymoXX0K8rpKSXOvoQMV4U2TuEdj3QqkpyUdG
	AvFOZOhyXRN/xh01/Be6jdRbs3IUaswTB+B0+3FMn6UBvyFN3SJNA6DloHu1
X-Google-Smtp-Source: AGHT+IFVencsDHsxhBLdjviuxV/nTve4fWCDhTlSSgoJ73p52e8QK2ha6x6mXRahaOg9bIfOX//V7Q==
X-Received: by 2002:a05:6a00:98f:b0:736:42a8:a742 with SMTP id d2e1a72fcca58-7376d631f92mr6684951b3a.11.1742409329749;
        Wed, 19 Mar 2025 11:35:29 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371167e109sm11993844b3a.115.2025.03.19.11.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 11:35:28 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v10 0/2] riscv: Add runtime constant support
Date: Wed, 19 Mar 2025 11:35:18 -0700
Message-Id: <20250319-runtime_const_riscv-v10-0-745b31a11d65@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGYO22cC/43Q3UoDMRAF4Fcpe20kk8mvV76HSMkmE5sLdyWpQ
 Sl9d9OCdJEUvJwD881wTlOlkqlOT7vTVKjlmtelD8AfdlM4+OWNWI49mAQXioNAVj6XY36nfVi
 XetyXXENjOkSrJJGwYKa++VEo5a8r+/La50Oux7V8X680uKS/nhl6DRgw49TMBZIXfH4uua01L
 +ExrO/ThWziH4zojFOeTEjOeHQDBreMHTPYGQAnhLOORMQBIzcM8jEjO9O3dZAwm9mFAaNujOD
 jrpvqzBw0GNQe+08DRm8YEGNGdwYpcZB6RhhWbLbMnW5MZ0giGI2gTEoDxt4Y5GrM2M4kr3VCq
 W30o27chrn3jWOcxRhRoYxIlv4w5/P5BxAjYmzyAgAA
X-Change-ID: 20250123-runtime_const_riscv-6cd854ee2817
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ben Dooks <ben.dooks@codethink.co.uk>, 
 Pasha Bouzarjomehri <pasha@rivosinc.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3346; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=W5HAab9oDLuYRICYvlEMdiuN+/zGZj7GP8xToCVp9CQ=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/ptvowLqtdfbshw2Xz1884ba15c+cgRezlkuu4FO1W36
 aKfreM0O0pZGMS4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZiI/VaGX8yPm1Yw+srpR2+S
 UOWcsf+wpuWmw5vrDrFWLjRsbTNQ38/wv3jV4Q3lDLNsDe/Lzp8W9W1yyZLzYlciOiulzndtmG5
 lzgsA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_113530_778348_22EC93BE 
X-CRM114-Status: GOOD (  16.42  )
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

Ard brought this to my attention in this patch [1].

I benchmarked this patch on the Nezha D1 (which does not contain Zba or
Zbkb so it uses the default algorithm) by navigating through a large
directory structure. I created a 1000-deep directory structure and then
cd and ls through it. With this patch there was a 0.57% performance
improvement.

[1] https://lore.kernel.org/lkml/CAMj1kXE4DJnwFejNWQu784GvyJO=aGNrzuLjSxiowX_e7nW8QA@mail.gmail.com/

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v10:
- Use _AC() instead of just adding U to the end of a constant
- Link to v9: https://lore.kernel.org/r/20250318-runtime_const_riscv-v9-0-ddd3534d3e8e@rivosinc.com

Changes in v9:
- Fix bug where stale register data may be used when an lui is replaced
  with a nop. In the following addiw, add to register x0 instead of the
  stale register to resolve.
- Add locks for text_mutex before using patch_insn_write()
- Link to v8: https://lore.kernel.org/r/20250305-runtime_const_riscv-v8-1-fa66f3468dac@rivosinc.com

Changes in v8:
- Rebase to linux v6.14-rc5
- Link to v7: https://lore.kernel.org/r/20250218-runtime_const_riscv-v7-1-e431763157ff@rivosinc.com

Changes in v7:
- Added benchmarking info
- Added CONFIG_RISCV_ISA_ZBA and CONFIG_RISCV_ISA_ZBKB to check that the
  compiler supports the extensions.
- Link to v6: https://lore.kernel.org/r/20250212-runtime_const_riscv-v6-1-3ef0146b310b@rivosinc.com

Changes in v6:
- .option arch only became officially supported by clang in version 17.
  Add a config to check that and guard the alternatives uses .option
  arch.
- Link to v5: https://lore.kernel.org/r/20250203-runtime_const_riscv-v5-1-bc61736a3229@rivosinc.com

Changes in v5:
- Split instructions into 16-bit parcels to avoid alignment (Emil)
- Link to v4: https://lore.kernel.org/r/20250130-runtime_const_riscv-v4-1-2d36c41b7b9c@rivosinc.com

Changes in v4:
- Add newlines after riscv32 assembler directives
- Align instructions along 32-bit boundary (Emil)
- Link to v3: https://lore.kernel.org/r/20250128-runtime_const_riscv-v3-1-11922989e2d3@rivosinc.com

Changes in v3:
- Leverage "pack" instruction for runtime_const_ptr() to reduce hot path
  by 3 instructions if Zbkb is supported. Suggested by Pasha Bouzarjomehri (pasha@rivosinc.com)
- Link to v2: https://lore.kernel.org/r/20250127-runtime_const_riscv-v2-1-95ae7cf97a39@rivosinc.com

Changes in v2:
- Treat instructions as __le32 and do proper conversions (Ben)
- Link to v1: https://lore.kernel.org/r/20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com

---
Charlie Jenkins (2):
      riscv: Move nop definition to insn-def.h
      riscv: Add runtime constant support

 arch/riscv/Kconfig                     |  22 +++
 arch/riscv/include/asm/asm.h           |   1 +
 arch/riscv/include/asm/ftrace.h        |   1 -
 arch/riscv/include/asm/insn-def.h      |   3 +
 arch/riscv/include/asm/runtime-const.h | 265 +++++++++++++++++++++++++++++++++
 arch/riscv/kernel/ftrace.c             |   6 +-
 arch/riscv/kernel/jump_label.c         |   4 +-
 arch/riscv/kernel/vmlinux.lds.S        |   3 +
 8 files changed, 299 insertions(+), 6 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250123-runtime_const_riscv-6cd854ee2817
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
