Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4061FC25B5C
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 01:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y24y2pffgg4HJpZ4bHkIM/Gg9cOjXtZQimRADs4J1EM=; b=frh6vmDjD0aI8b
	h8b7tWXy+NFVdrW8MS6O8rnDEKsxcRZUuU3wdSOJrZEAXGJ0bf4EiyGXUTFcm+5MbobUIjwns7ONp
	tML+f2fcAUdj/oJFOna6YIxvwz+6Yktxpbbp9ppQLXbaqfOaAch8XMD+H7IgmSKoNK5S4nxJA5SoV
	Tnnuzqm/HnJYDy0AXZ2sfBoiI0LKxRzW1OLJsOUuc578Yu8f+X2SV7rKJrhvbrbsO968JDR6zVtLn
	NNM0AjmrI3eEBQRcfJ2r7JmPoS4ekcAd5rgj/DuGr3qllxgreQLF52CzZ63AXE4OEu4aIjM3mkJZr
	GXs58Ht+2YoEZBY1Xgkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49r5-00000009H55-00zK;
	Tue, 07 May 2024 01:42:55 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49qz-00000009H0Z-3IBL
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 01:42:51 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5e42b4bbfa4so1430406a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 18:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715046160; x=1715650960; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kmnHN/SbAxxSeuYauq4GFP+atQwPE2aK0TJawlfr8WY=;
        b=0KvitYdVaBHOjbb87fnEpkgoUJRH+cPC0TPSz+5okqzGfMmmtbKGQml2hxj5FFQIGz
         qgvHV6hZWTNkoZt3nyRoO4SM1O9up4fxXeZIG80/zkmSf7VgkoplvdAYb1F9B7M+1HKA
         He70ZI1006aiU2PfIUGQsmRBkG8X3BD7aALl0sQn1+rx65bEMho6HUtHxHp+75IeBJxe
         O7UQR/7xDaNHz8lMLehMg7UVEaWpchPNurHHnyXaWrkVu8x+GhhJI1Ldhwh83kFbDDDX
         1N4nypW4MJiWl2QnA1/jiRIXgFBpydFkq/nSJYdAWhVsS6GT4skS/m3m64hSuGNFMsoj
         oH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715046160; x=1715650960;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmnHN/SbAxxSeuYauq4GFP+atQwPE2aK0TJawlfr8WY=;
        b=elN/wjXOu1OwkAwpPTGQQULpAkgAMR50ykkJe+4OaZDD/Z9f6l2egvO8fhQM3SwZB1
         5Dt7W0UJvfBOVxPcncS93Gqtq/y5i+agxUN6BajIaLt5zAdsFu1kse10c8S3wXN5r13L
         ppp51l62gNj/1DGwt0G7SiYleUvrOZSv6S9v4zezy1azGXgUBmGlfiSClbibhwK727bJ
         zvs42hjeQvZv5PVH1kQW8uP3Y0ujDJQ/6/jmLFxKiOqkDu0RdCbmMoKCo1ZnERLViZ/Y
         gtyLHTmqTGVB6UAh6/Ls7LK676pBjUMkw0N15Nm4T8fzxU25NnDS3T38ZLNXAtAbpRyW
         u+Vg==
X-Gm-Message-State: AOJu0YzMZnjQvKmY63/Blb9aoy23UlGO1cOC3DYYzj04mudnWj5dAZB/
	4cG2AIni+znNEhEaltNE+vi9gQKSsWtmHfVd6UC6DP5FHVYW42eILrfnhmQt8fk=
X-Google-Smtp-Source: AGHT+IE0M9Ne2m5CBxBpp6YYkoWQr4AJkn2GuDCP4nYJ95FEwyKQnMMDfx/AtsUhX+F61kOl4bttmw==
X-Received: by 2002:a17:90a:8b06:b0:2a0:86b6:2e9 with SMTP id y6-20020a17090a8b0600b002a086b602e9mr10020425pjn.12.1715046159681;
        Mon, 06 May 2024 18:42:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902dac800b001eb3f705ddasm8915311plx.255.2024.05.06.18.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:42:38 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/8] riscv: Support compiling the kernel with extensions
Date: Mon, 06 May 2024 18:40:41 -0700
Message-Id: <20240506-compile_kernel_with_extensions-v1-0-5c25c134c097@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJqGOWYC/x2N0QpAQBBFf0XzbIvBA78ibbIXE5Z2hZJ/tzyeu
 ueemzycwFMV3eRwiJfVBkjjiLqxtQOUmMDECedJzqXq1mWTGXqCs5j1Kfuoce2wn+lVycaEZWY
 yLiicbA69XH+gbp7nBagfprBwAAAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Song Liu <song@kernel.org>, 
 Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715046158; l=2314;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/eyv0Uh2ao8q/bbCKgaJAmKK76ClX1vXa+kTgtkDk4c=;
 b=7D+qgX0wTyxP5R4CiXE4WQlV8S07UxtizOQpdZPXGhFlYIF6E1TQkJdxRfTACJNmPgOoZ+540
 Fzf+vg3R3/8D+wfd8q6L1LW0Zaga53p6QxlWTgyYdVzaxd39POjVVAZ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_184250_255576_D4A4EF37 
X-CRM114-Status: UNSURE (   9.14  )
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

The kernel currently has the restriction that it can only be compiled
with the extensions that are hardcoded in arch/risc/Makefile.

Any extension that is not listed in the Makefile can still be used by
explicitly writing the assembly and using alternative patching.

This series introduces Kconfig options that allow the kernel to be
compiled with additional extensions.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (8):
      riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_C Kconfig option
      riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_V Kconfig option
      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT Kconfig option
      riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_SVPBMT Kconfig option
      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBB Kconfig option
      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBA Kconfig option
      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBC Kconfig option
      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBS Kconfig option

 arch/riscv/Kconfig                    | 135 +-----------
 arch/riscv/Kconfig.isa                | 393 ++++++++++++++++++++++++++++++++++
 arch/riscv/Makefile                   |  15 +-
 arch/riscv/crypto/Kconfig             |  14 +-
 arch/riscv/include/asm/arch_hweight.h |  33 +--
 arch/riscv/include/asm/checksum.h     |  18 +-
 arch/riscv/include/asm/pgtable.h      |   3 +-
 arch/riscv/include/asm/simd.h         |   3 +
 arch/riscv/include/asm/vector.h       |   3 +-
 arch/riscv/kernel/cpufeature.c        |   3 +-
 arch/riscv/kernel/head.S              |   8 +-
 arch/riscv/kernel/probes/uprobes.c    |   2 +-
 arch/riscv/kernel/process.c           |  14 +-
 arch/riscv/kernel/ptrace.c            |   6 +
 arch/riscv/lib/csum.c                 |  48 ++---
 arch/riscv/lib/riscv_v_helpers.c      |   1 -
 arch/riscv/lib/strcmp.S               |   4 +-
 arch/riscv/lib/strlen.S               |   4 +-
 arch/riscv/lib/strncmp.S              |   4 +-
 arch/riscv/lib/uaccess_vector.S       |   2 +
 arch/riscv/lib/xor.S                  |   2 +
 arch/riscv/net/bpf_jit.h              |   8 +-
 22 files changed, 511 insertions(+), 212 deletions(-)
---
base-commit: 2f47357557b7aa98d9d9002688aae480864ca3f6
change-id: 20240429-compile_kernel_with_extensions-92dd2403d325
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
