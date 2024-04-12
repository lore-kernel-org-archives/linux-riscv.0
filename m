Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F564C04FF9
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 06:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CHf4TF9CSDU+JmbQpF5ioZ9aSuDB/GJrpkSsfI4cn80=; b=W0pYLKmMG0/iuu
	LzO/9xLpkWh40uMED7ECsfKk4gDM8SmvCmaOWphdx2BkeiwcFkkEeYJAZ1WL1O5S5KkposTNNlJ14
	WckoyDZhmnWK1zPYEoay0NiwNmqppZ98eU9RB+RlIp0jWmVoV3Uk7MTV6qJz3b4gRgv0WdqzFp/L5
	ezpLzLtmF/XSY5Tjfk8zagel1MQhaEAOsbgb+tphQ7iS1gtmzoiFRd9SJ4/9jZCIkgMHpcMSA8r+D
	aCWKdsSRlRZTLHgXSNer8/omTq89TKCsl/NSiCefyQV+vXUX//WEhu3rSBMLvDDO4uoo9PJIUXxli
	aPMM8/GfGympa4tK+OiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAih-0000000FdGP-3kkj;
	Fri, 12 Apr 2024 06:49:07 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAie-0000000FdFr-3GU8
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 06:49:06 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e3cf5b171eso5388265ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 23:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712904543; x=1713509343; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=USfQfM+UR81v7lHRAxHQQ1oLkFkV+dRc3UOcjHi01P4=;
        b=BnbjXZzR8IaXPE/ZCAhCh/E01ZJaCPZsbTI8ccXn7W4Ph0UD+B9FMBq5D80fcKL1Bq
         XIWrhSOVexQzsiJiupN/bnjOVv5p6PKBul8JF4ZNlBg3VQ2sNSnBSWuYz5rxRPHLI0BU
         tt1yIiBbExT+akb1DXAl0iRx7mkZfHQV3Z5sNcHos80T9LxRswgm8+ahTXlNEUhIzAxf
         IrnyC20LuZOHWy75O2HtyYi8qSbURvOwhsrBHlwBqGQ6PlGH7F2XzHTOB7Si0bP9Qw7j
         lgArhBgNG8P1StirKzCLSTukNRfCSOpQFzZTXJBxYITpmU53pL5M0iAT1Ffd02AWBu2S
         jQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712904543; x=1713509343;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USfQfM+UR81v7lHRAxHQQ1oLkFkV+dRc3UOcjHi01P4=;
        b=dprpvtFdK6Y3UNrwLZPCyc06WOOXkzBKE3BDBkWOuWKGTPSmUnBCUsrSNBdMAyEqF/
         BAw3Q/S0fvcfkNN6Z3djqD9leG/UqVjbpK68wfGCGEvE4sOr8OwXwd/Rofc0S2VidLQf
         GESUBotB0c9G1qz487qv7RHN/cZgXvJzFSLcvDGdunmkpCjqhAGEXsC2mrNyiaF9nii+
         q0JNujCbVAI2gfytf8TIzB6PpveMebpOnXt+1Y5VxQP4mngM3fN5kSl7rCnK52WiiE+9
         BN4qCIJsiKhWKzFNOQJinOtrAwLHc0XCiUXIkb5n2yZhpELQzYIrrk4bNxfe81As19+B
         k6bA==
X-Gm-Message-State: AOJu0Yym+n6VMMkzf66Q0IEdpF/xJkk90d598YtDfgAWZe0rWiMhbqDE
	lESP9AvyR1YP/Vda9+ka3dRavrsic1GTU/Idkk7NlAAYYqd0MtFobYeK3Tw0HVk=
X-Google-Smtp-Source: AGHT+IFGt59LZRrXTn7Yc6vTc14Z01BARI2Go5M4fYmzWCSl9LbWjZdfj71Auc/wFDqRBDgRn+JM8A==
X-Received: by 2002:a17:902:d50c:b0:1e4:e5fe:ce0 with SMTP id b12-20020a170902d50c00b001e4e5fe0ce0mr1931056plg.43.1712904543043;
        Thu, 11 Apr 2024 23:49:03 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e107222eb5sm2258818plr.191.2024.04.11.23.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:49:02 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH v4 0/9] Support Zve32[xf] and Zve64[xfd] Vector
 subextensions
Date: Fri, 12 Apr 2024 14:48:56 +0800
Message-Id: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFjZGGYC/3XOsQ6DIBDG8VcxzD0DiFU79T0aBwJHvUFtgJJa4
 7sXnVw6/pO7X76VBfSEgd2KlXlMFGiecqhLwcygpycC2dxMcql4JVr4JgSLEU3Ml1Bzwa9WWl3
 LhuWfl0dHn8N79Lmdn0eIg0d9VpRQslayFF1XNyBAT3YpzUDveyBHCUszj7s2UIizX45xqdrNf
 ztSBRxQSKuk4I3T7Vnqt237AUdoMbbpAAAA
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
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_234905_026602_38929DB4 
X-CRM114-Status: GOOD (  17.81  )
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
programs context-switch, signal, ptrace, prctl interfaces works when we
only report partial V from the ISA.

Note that the signal test was performed after applying the commit
c27fa53b858b ("riscv: Fix vector state restore in rt_sigreturn()")

This patch should be able to apply on risc-v for-next branch on top of
the commit ba5ea59f768f ("riscv: Do not save the scratch CSR during suspend")

[1]: https://lore.kernel.org/all/20240228-vicinity-cornstalk-4b8eb5fe5730@spud/T/#u

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
Andy Chiu (9):
      riscv: vector: add a comment when calling riscv_setup_vsize()
      riscv: smp: fail booting up smp if inconsistent vlen is detected
      riscv: cpufeature: call match_isa_ext() for single-letter extensions
      riscv: cpufeature: add zve32[xf] and zve64[xfd] isa detection
      dt-bindings: riscv: add Zve32[xf] Zve64[xfd] ISA extension description
      riscv: hwprobe: add zve Vector subextensions into hwprobe interface
      riscv: vector: adjust minimum Vector requirement to ZVE32X
      hwprobe: fix integer promotion in RISCV_HWPROBE_EXT macro
      selftest: run vector prctl test for ZVE32X

 Documentation/arch/riscv/hwprobe.rst               | 15 ++++++
 .../devicetree/bindings/riscv/extensions.yaml      | 30 ++++++++++++
 arch/riscv/include/asm/hwcap.h                     |  5 ++
 arch/riscv/include/asm/switch_to.h                 |  2 +-
 arch/riscv/include/asm/vector.h                    | 25 ++++++----
 arch/riscv/include/asm/xor.h                       |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h              |  7 ++-
 arch/riscv/kernel/cpufeature.c                     | 56 ++++++++++++++++++----
 arch/riscv/kernel/head.S                           | 19 +++++---
 arch/riscv/kernel/kernel_mode_vector.c             |  4 +-
 arch/riscv/kernel/process.c                        |  4 +-
 arch/riscv/kernel/signal.c                         |  6 +--
 arch/riscv/kernel/smpboot.c                        | 14 ++++--
 arch/riscv/kernel/sys_hwprobe.c                    | 13 ++++-
 arch/riscv/kernel/vector.c                         | 15 +++---
 arch/riscv/lib/uaccess.S                           |  2 +-
 .../testing/selftests/riscv/vector/vstate_prctl.c  |  6 +--
 17 files changed, 174 insertions(+), 51 deletions(-)
---
base-commit: ba5ea59f768f67d127b319b26ba209ff67e0d9a5
change-id: 20240318-zve-detection-50106d2da527

Best regards,
-- 
Andy Chiu <andy.chiu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
