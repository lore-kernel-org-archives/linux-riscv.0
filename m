Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27992C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 16:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gruBTV8/ljz0AzKfL8dQNejngrlTm19oohCPLt8sidU=; b=wHX+3RzpptzHD1
	JbRAQqDr5LphkVihX5/RhfQO5wWRFG6Qq7661Yixz1a3VNiWq86/lVGEBEevBoaXemEfo0YgQI/Ol
	QLHgY8KJeI/YDeP/YAHLLdgrEr29FYqcZw068iAGYFu0wE6baU1BZNW8ZB3Ewb5BzeVTQ/Q/Kv7lV
	8ak0oQscPyfTu7uwvQNoIBv3XSFsRgLcUaSpr9dq1RzYg+V4+tyFNIM6SokMq2UDQoxVynLSrGCqb
	bir7LE+nz4pGfOw2sG8FvyaB1dgLRPivnJQkjJb+3bgq5RMdEoaaOKX3mbpFYK5pRXZVmoGTeaEdC
	Z3xQotesXiNRl0LJIBrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cD-000000022Fu-3wJJ;
	Thu, 09 May 2024 16:27:29 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cA-000000022E4-2YIR
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 16:27:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1eeb1a4c10aso6924695ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 09:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715272043; x=1715876843; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T6MVJPZDpjbEi2OtO01WoKmeHaM3uIeI4GUPcfpFRJE=;
        b=b7PeUfgmpPhxp/oB396TtKs84WcHBMyjv+OD4tnK/sGRo3mGuoaTK8dhf5dAWRvE00
         0F3YaNuH6YDLE1H1FsfbRglTZI4lRaRcaoghwR9H1V/q+EX3l0HtfpfOvWKz+vEIbDdi
         i19G9pkZOx62fraf8obvMf38xJvvyvM8jMWifClSpj5qJRaEfX82TxGCSrd5w1/9Ae9s
         xq/O3I9JEPzuViyWwoausC/keBOYb/70RALC3SlhAko8sFH3Dx0nM1O/THQ0Whbg66/N
         37WpT4t/O0YVrm8syYhy1hV28u9/Gh4gvvYrHlnBjVlsKE+r3YbcBU52ZVa5cy3hrYMW
         scmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715272043; x=1715876843;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6MVJPZDpjbEi2OtO01WoKmeHaM3uIeI4GUPcfpFRJE=;
        b=JR6fxnLrtDSmI4CyFMgMqDdlF4nzlQvLPTtcQA4WzepOUK8xp/B32w2AY8oI1I/vj5
         UAcBcYf/vdYAIzxR6xELP5grfz/Hc+w4Hr1C6+LnPiNSgAyc1rIBBtSOekJEGKpC3qiB
         FawsSVFTr7bSp8TewWcRIShosEKo4VKoAe/E7qxl0rLuijWbpkL99H+Euyv879E6hGFI
         fl6HQDg3NHyNsIcYGl8ZCwBFVMYYy7m9iRdTQ/L6x9frb8sJQrCK3UcuMLWV5GXmwx6J
         6NBdGHC+mJ4iqiVQ3UeE8Ms4Esgt123qDgrHuOTLX19zDPQoawXxzKjvWS/k/CI59Lt4
         /epw==
X-Gm-Message-State: AOJu0YzPM3pOoAXV1ebnMeZCz44R8FxPkGIRsgunM/omd0/by0FJMkFi
	DZ+aF2TeXiIS3mNSHvofKzp1CAiCA/YavxR34gOLZl4xMELnZuPmkNYa+cCGOnE=
X-Google-Smtp-Source: AGHT+IHyYFQ4n9Z2BCpwxAFocKmxELbS3p4H6chMEDQiYGq6rWVxVhmmrCJ6qfgUPoSE1gevGgRE3A==
X-Received: by 2002:a17:902:bb17:b0:1e0:115c:e03c with SMTP id d9443c01a7336-1ef43f4ce9fmr1318985ad.53.1715272042621;
        Thu, 09 May 2024 09:27:22 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13805asm16210285ad.264.2024.05.09.09.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 09:27:22 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH v5 0/8] Support Zve32[xf] and Zve64[xfd] Vector
 subextensions
Date: Fri, 10 May 2024 00:26:50 +0800
Message-Id: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEr5PGYC/3WOQW7CMBBFr4K8ZiJ7MibQVe9RsXDsCZkFCbJTC
 4py9zrZNEVi+aT/nv5TJY7CSX3snipyliTjUMDud8r3brgwSCisUCPp2hzhJzMEnthPZQlWG30
 IGJzFRhXnFrmT+9r7Ohfu4niFqY/sthUyhJawMqeTbcCAG8Kj8r18fybpJHPlx+tS6yVNY3ys5
 3K9NN/9yDVoYIOB0Oimc8dtaTmS6U8ng686Lbr2ZNv20KKt/+nzPP8CamGCNCgBAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Yunhui Cui <cuiyunhui@bytedance.com>, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_092726_741871_3CF3BFFA 
X-CRM114-Status: GOOD (  19.56  )
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

The series composes of two parts. The first part Specifically,
patch 1 adds a comment at a callsite of riscv_setup_vsize to clarify how
vlenb is observed by the system. Patch 2 fixes the issue by failing the
boot process of a secondary core if vlenb mismatches.

Here is the organization of the series:
 - Patch 1, 2 provide a fix for mismatching vlen problem [1]. The
   solution is to fail secondary cores if their vlenb is not the same as
   the boot core.
 - Patch 3 is a cleanup for introducing ZVE* Vector subextensions. It
   gives the obsolete ISA parser the ability to expand ISA extensions for
   sigle letter extensions.
 - Patch 4, 5, 6 introduce Zve32x, Zve32f, Zve64x, Zve64f, Zve64d for isa
   parsing and hwprobe, and document about it.
 - Patch 7 makes has_vector() check against ZVE32X instead of V, so most
   userspace Vector supports will be available for bare ZVE32X.
 - Patch 8 updates the prctl test so that it runs on ZVE32X.

The series is tested on a QEMU and verified that booting, Vector
programs context-switch, signal, ptrace, prctl interfaces works when we
only report partial V from the ISA.

Note that the signal test was performed after applying the commit
c27fa53b858b ("riscv: Fix vector state restore in rt_sigreturn()")

This patch should be able to apply on risc-v for-next branch on top of
the commit 0a16a1728790 ("riscv: select ARCH_HAS_FAST_MULTIPLIER")

[1]: https://lore.kernel.org/all/20240228-vicinity-cornstalk-4b8eb5fe5730@spud/T/#u

Changes in v5:
 - Rebase on top of for-next
 - Update comments (1, 7)
 - Reorder the documentation patch to the front of patches that it
   documents about. (5->4)
 - Include ZVE64D to the list, which single letter V implies (6)
 - Remove ZVE32F_IMPLY_LIST (5)
 - Change the semantic of has_vector() thus rewrite patch 7
 - Remove the patch that fixes integer promotion as it is merged else
   place (8)
 - Link to v4: https://lore.kernel.org/r/20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com

Changes in v4:
 - Add a patch to trigger prctl test on ZVE32X (9)
 - Add a patch to fix integer promotion bug in hwprobe (8)
 - Fix a build fail on !CONFIG_RISCV_ISA_V (7)
 - Add more comment in the assembly code change (2)
 - Link to v3: https://lore.kernel.org/r/20240318-zve-detection-v3-0-e12d42107fa8@sifive.com

Changelog v3:
 - Include correct maintainers and mailing list into CC.
 - Cleanup isa string parser code (3)
 - Adjust extensions order and name (4, 5)
 - Refine commit message (6)

Changelog v2:
 - Update comments and commit messages (1, 2, 7)
 - Refine isa_exts[] lists for zve extensions (4)
 - Add a patch for dt-binding (5)
 - Make ZVE* extensions depend on has_vector(ZVE32X) (6, 7)

---
---
Andy Chiu (8):
      riscv: vector: add a comment when calling riscv_setup_vsize()
      riscv: smp: fail booting up smp if inconsistent vlen is detected
      riscv: cpufeature: call match_isa_ext() for single-letter extensions
      dt-bindings: riscv: add Zve32[xf] Zve64[xfd] ISA extension description
      riscv: cpufeature: add zve32[xf] and zve64[xfd] isa detection
      riscv: hwprobe: add zve Vector subextensions into hwprobe interface
      riscv: vector: adjust minimum Vector requirement to ZVE32X
      selftest: run vector prctl test for ZVE32X

 Documentation/arch/riscv/hwprobe.rst               | 15 ++++++
 .../devicetree/bindings/riscv/extensions.yaml      | 30 +++++++++++
 arch/riscv/include/asm/hwcap.h                     |  5 ++
 arch/riscv/include/asm/vector.h                    | 10 ++--
 arch/riscv/include/uapi/asm/hwprobe.h              |  5 ++
 arch/riscv/kernel/cpufeature.c                     | 60 +++++++++++++++++++---
 arch/riscv/kernel/head.S                           | 19 ++++---
 arch/riscv/kernel/smpboot.c                        | 14 +++--
 arch/riscv/kernel/sys_hwprobe.c                    | 11 +++-
 arch/riscv/kernel/vector.c                         |  5 +-
 arch/riscv/lib/uaccess.S                           |  2 +-
 .../testing/selftests/riscv/vector/vstate_prctl.c  |  6 +--
 12 files changed, 151 insertions(+), 31 deletions(-)
---
base-commit: 0a16a172879012c42f55ae8c2883e17c1e4e388f
change-id: 20240318-zve-detection-50106d2da527

Best regards,
-- 
Andy Chiu <andy.chiu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
