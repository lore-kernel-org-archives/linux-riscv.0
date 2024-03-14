Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1910CC54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=He6mbnoFI6FOpVsUIGCih6cwVeCGZNlp52BVusl3ea8=; b=yQToq8AZyV5JZJ
	vtjNzrIoml+NxfVdIAJHa96dLURyI9JniBxvy8PC5Td2yvPVpVRMBEVt1mmKh4sHXIUHSbasnhaxO
	RqNDKfz4oXITIA1MfaY/VSrhA2wqeUsVcM8kfYp6wY5Y2tVti0s+CMkbT7swzSMwN2mhBmzaLnu+w
	BaFmhDytV/BJ10HvwQmAw4kOJRI09RUHAludAQ+Kbu5cSkmWPDlngjuCU0Ov6f86UGhuTLOHpTurY
	ATNooG6t6LcOt5RvLUOaKfJ0tXe48WwYT4YwJtt37HNMSDZ+czamfPIeDgjxkxPoVZZbMHdnKX88H
	kvuiKdp4Dl2tEvO26gwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm2A-0000000EcvP-0jUH;
	Thu, 14 Mar 2024 14:26:14 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm26-0000000Ecu9-2Y1S
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 14:26:12 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e6c0098328so915188b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710426366; x=1711031166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QS3Ky0cdnfKECYbr6pIUrtKiSI8akdn/bBFQyUzwiMY=;
        b=ENdJkinVvzYO/Sidjpzra0uXB9uqgM6Ey1Mpg5i4XAfHI+1YDRhO6u9bwIzZRedrtF
         oa3+DX2aZ4n+gJX+e7pVEWG3VbkYUnrjaEKitNhKZx6gR0P2teHJdFsnFszEoQptwNAx
         CVLolTxfaupzIDKEp1gV1IuQ6zyQLKyVIdXS8d6eDfZJUg1Rek9SVAwMPRJIUfPOwSNK
         lJzDXbluPcRw8h+sKfT1RvOCdTr4r9UGt2gu/uwESkyr7dVIs5GUnffJ+CBS7KGB12kg
         karlPOAwFtJUZcmMfHL3Jy+sJdz6bnOACRDd2u0hbXGd3Y+5WmRBifzWzrrmdFlKe2gY
         JpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426366; x=1711031166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QS3Ky0cdnfKECYbr6pIUrtKiSI8akdn/bBFQyUzwiMY=;
        b=Tb+HQ/K9VGQXlukhRlxadml5+vOaepRSszPKtGf/L8FmQ1lmCbk5htUgOolZVjyTLa
         Z3O1mg0DvvKE3mAFvueDfz/dJ9GkYphbTqWRb5lAyIK3eGGznkBTwNGkq+z3DduxUn5l
         zNwKJ+5psTtjNp4yxGWp6CgBZ882f/qT3PJBniwxG2vcsxgB+J7djOpWnwf6kRbGzkPw
         T2B+UHADcVpM06tW9SwtsmgCqg3a90ihX4ETKXvwcsaTBw/9UeRZ223nvD+0d2Yj6KPY
         ymBjkqk3CahJB/618cpI00N2YOnkfCfCg+bD9R+OFNpXtla3KYbUJCFvCQK+KZOm8wUP
         1BKw==
X-Gm-Message-State: AOJu0Yx14Lvk+j5XVCgij/V2ugvc0UtzCyszMQ/4J/y2Exes+Ftm2oKo
	7V+0mJCafrHvXmBiwfpX0b4SYEFpEz0wDsYBIN1wnySl4Re8KWH85dBbBLUTFoE/q8dRK4/glmo
	qmGPxFUIVpvdiy8Vs8mwYI02+8q+u6MXzbmnQSSDQoXK1RC8RKt5cW/YQ1bd3xB8bmCxXMfowLY
	6KZaBndpO4KEF3g0jY7oxdQ5ESgrQgIuyJYgRqk2HVSFWAKsCV5iIJ
X-Google-Smtp-Source: AGHT+IFCq7kOQlcmhgj6AJDEv4q8NqWmDRuVCHKeGtGSIlP4j/r2laVyBNgZiTwIEMQqKIev/anmZA==
X-Received: by 2002:a05:6a00:1142:b0:6e6:9c79:87e9 with SMTP id b2-20020a056a00114200b006e69c7987e9mr2059743pfm.34.1710426365978;
        Thu, 14 Mar 2024 07:26:05 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y9-20020a62f249000000b006e6854d45afsm1556435pfl.97.2024.03.14.07.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 07:26:05 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: [v2, 0/7] Support Zve32[xf] and Zve64[xfd] Vector subextensions
Date: Thu, 14 Mar 2024 22:25:35 +0800
Message-Id: <20240314142542.19957-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_072610_979150_7558E0CA 
X-CRM114-Status: GOOD (  14.17  )
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

The series composes of two parts. The first part provides a quick fix for
the issue on a recent thread[1]. The issue happens when a platform has
ununified vector register length across multiple cores. Specifically,
patch 1 adds a comment at a callsite of riscv_setup_vsize to clarify how
vlenb is observed by the system. Patch 2 fixes the issue by failing the
boot process of a secondary core if vlenb mismatches.

The second part of the series provide a finer grain view of the Vector
extension. Patch 3 give the obsolete ISA parser the ability to expand
ISA extensions for sigle letter extensions. Patch 3, 4 introduces Zve32x,
Zve32f, Zve64x, Zve64f, Zve64d for isa parsing and hwprobe. Patch 5
updates all callsites such that Vector subextensions are maximumly
supported by the kernel.

Two parts of the series are sent together to ease the effort of picking
dependency patches. The first part can be merged independent of the
second one if necessary.

The series is tested on a QEMU and verified that booting, Vector
programs context-switch, signal, ptrace, prctl(sysctl knob) interfaces
works when we only report partial V from the ISA.

This patch should be able to apply on risc-v for-next branch on top of
the commit 886516fae2b7 ("RISC-V: fix check for zvkb with tip-of-tree clang")

[1]: https://lore.kernel.org/all/20240228-vicinity-cornstalk-4b8eb5fe5730@spud/T/#u

v1 of this series can be found at: https://lore.kernel.org/all/20240312123627.9285-1-andy.chiu@sifive.com/

Changelog v2:
 - Update comments and commit messages (1, 2, 7)
 - Refine isa_exts[] lists for zve extensions (4)
 - Add a patch for dt-binding (5)
 - Make ZVE* extensions depend on has_vector(ZVE32X) (6, 7)

Andy Chiu (7):
  riscv: vector: add a comment when calling riscv_setup_vsize()
  riscv: smp: fail booting up smp if inconsistent vlen is detected
  riscv: cpufeature: call match_isa_ext() for single-letter extensions
  riscv: cpufeature: add zve32[xf] and zve64[xfd] isa detection
  dt-bindings: riscv: add Zve32[xf] Zve64[xfd] ISA extension description
  riscv: hwprobe: add zve Vector subextensions into hwprobe interface
  riscv: vector: adjust minimum Vector requirement to ZVE32X

 Documentation/arch/riscv/hwprobe.rst          | 15 ++++++
 .../devicetree/bindings/riscv/extensions.yaml | 30 +++++++++++
 arch/riscv/include/asm/hwcap.h                |  5 ++
 arch/riscv/include/asm/switch_to.h            |  2 +-
 arch/riscv/include/asm/vector.h               | 21 +++++---
 arch/riscv/include/asm/xor.h                  |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h         |  5 ++
 arch/riscv/kernel/cpufeature.c                | 52 +++++++++++++++++--
 arch/riscv/kernel/head.S                      | 14 ++---
 arch/riscv/kernel/kernel_mode_vector.c        |  4 +-
 arch/riscv/kernel/process.c                   |  4 +-
 arch/riscv/kernel/signal.c                    |  6 +--
 arch/riscv/kernel/smpboot.c                   | 14 +++--
 arch/riscv/kernel/sys_hwprobe.c               | 13 ++++-
 arch/riscv/kernel/vector.c                    | 15 +++---
 arch/riscv/lib/uaccess.S                      |  2 +-
 16 files changed, 162 insertions(+), 42 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
