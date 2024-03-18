Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B0AC54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JuKD5aazNuPpZMhL1j2VrtzAFLEhQc78z6BSWVic9U0=; b=n0acpQvuI6lFoq
	FM6tmtgt8RcEcR4DMyPalmtdJGo19gTrVrrqO7ybgUNIAUgZOrN8EN4MIzK22eWjm7cdsmPZ25AZI
	WT0HDMEAHo7Ou1/nl9yz9pGX6dE1CiEmlC2boCBvRAGVT6DUdPnKC3cTSLHzMxJcew+H3NMf+RtrW
	8eIZmbVhJRqniBFtbEKUJ9xKRvkOVUNCo19LclokNmhJO2qu3fZTBelXv3m/dyhES0zA7p8+ZfhAL
	YLA1OH4eALabyqVjUWioxYQP1XQDjlqNUX4bxWgVmbeb58o8iHcHp2JjgnLkt/kdAmaRtJE+AedFN
	5119b2ATh3CzsasNdkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAPY-00000008Avc-3bSl;
	Mon, 18 Mar 2024 10:40:08 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAPU-00000008AuU-1J4A
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 10:40:07 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e6b5aa0b52so3493088b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 03:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710758402; x=1711363202; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ID0p7f2CL6yvEozBjg6sfwc1IPzOU4d80fq7ceZnco=;
        b=ff/BEGl9RWrD6ZxMPqTbLvfElVzvfEp1XPI5TMfGganS7Boc3pZ7hrWe4ByNKTVL8w
         gRGEsb5swa9HALyll/rYnMM7K/dvA/DFcj6wVzZhqKeyM4wVQhDX0CS/rFgrHpI2XrXR
         VKBFahD4SaQTEmqUfkGmVU3bxNCKYLN3UmRltduAn+HZvh5bAwirW0vOLHmCsxzEjhSN
         8M4/YwdS/+xHOT/0WGnz5YXI5rjpMK+XkLNXsK0lVL4XD8NyROkyPCP/5/V674VGZ+/L
         rYshEbQY6D10/2EBbrkHfQPmEQE6pd/TMWVvFzgnOMIgRFu/doo7Hl9B/3SWHqWVFaOc
         q3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758402; x=1711363202;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ID0p7f2CL6yvEozBjg6sfwc1IPzOU4d80fq7ceZnco=;
        b=mrpdDMQKfwaP952h6pQOYA7Hx5qiNSia+FYtlo9HCnsgy7IXFVp0GRrUjQWiaUVMTO
         39S+LKMY4kePkbbFpFD2bzC0EQ2MmHsLXJAE9inrG4Vy3Okbq1TgFmLQfAlUENNOOpsu
         aKeRjanNso46y041gAEYLqsEbK3vbEGlXMsw5NDQA6lSlyM0tHdFrTFNHSRGcOqFHkV9
         KP7m/eG4PId/0/SAji6H+teTgWJK0/YSqHea92zi7i+kSkqlNBQqsOsOgfvP3fDnl/yY
         wonFZrOKy2hGyVG4rWjpRFJ/vvKnntp5Zi5TZrAshRYrUmlqOmSisr3H+l8CA8c1d+v3
         o5MA==
X-Gm-Message-State: AOJu0Yw4ZU4nWj7q0v4xm1tKKz/vWSC6d8lwh5LNFMZvtv/IXBE+tBOC
	kK15vxpPJPanxbKamj8sjMefLoMy7eODsI2PFIRq+hN7q+oD355CVMJvhJ1+Q9Y=
X-Google-Smtp-Source: AGHT+IFybbfcMxdPeEklAEm0VGt4DQEXS5sWv1NO8Ih8hC+93i804/jYj2EHmREofX0BM04dNDwUXA==
X-Received: by 2002:a05:6a00:23d2:b0:6e6:9cea:69e7 with SMTP id g18-20020a056a0023d200b006e69cea69e7mr12433497pfc.29.1710758401876;
        Mon, 18 Mar 2024 03:40:01 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c11-20020a056a00008b00b006e647716b6esm7838969pfj.149.2024.03.18.03.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:40:01 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH v3 0/7] Support Zve32[xf] and Zve64[xfd] Vector
 subextensions
Date: Mon, 18 Mar 2024 18:39:53 +0800
Message-Id: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPkZ+GUC/03MQQ6CMBCF4auQWTtNO7QirryHcdG0g8wCMG0lK
 uHuNq5cfsl7/waZk3CGc7NB4lWyLHNFe2ggjH6+M0qsBtJkdWtO+FkZIxcOpS7RaaOPkaJ31EH
 9PBIP8vr1rrfqIS0TljGx/69YY8lZUqbvXYcG/RzfKozyvGQZZGUVlgn2/Qs5CNDYnQAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andy Chiu <andy.chiu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, 
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_034004_518163_BE9081B0 
X-CRM114-Status: GOOD (  15.91  )
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
the commit 099dbac6e90c ("Merge patch series "riscv: Use Kconfig to set unaligned access speed"")

[1]: https://lore.kernel.org/all/20240228-vicinity-cornstalk-4b8eb5fe5730@spud/T/#u

v2 of this series can be found at: https://lore.kernel.org/all/20240314142542.19957-1-andy.chiu@sifive.com/

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
Andy Chiu (7):
      riscv: vector: add a comment when calling riscv_setup_vsize()
      riscv: smp: fail booting up smp if inconsistent vlen is detected
      riscv: cpufeature: call match_isa_ext() for single-letter extensions
      riscv: cpufeature: add zve32[xf] and zve64[xfd] isa detection
      dt-bindings: riscv: add Zve32[xf] Zve64[xfd] ISA extension description
      riscv: hwprobe: add zve Vector subextensions into hwprobe interface
      riscv: vector: adjust minimum Vector requirement to ZVE32X

 Documentation/arch/riscv/hwprobe.rst               | 15 ++++++
 .../devicetree/bindings/riscv/extensions.yaml      | 30 ++++++++++++
 arch/riscv/include/asm/hwcap.h                     |  5 ++
 arch/riscv/include/asm/switch_to.h                 |  2 +-
 arch/riscv/include/asm/vector.h                    | 21 +++++---
 arch/riscv/include/asm/xor.h                       |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h              |  5 ++
 arch/riscv/kernel/cpufeature.c                     | 56 ++++++++++++++++++----
 arch/riscv/kernel/head.S                           | 14 +++---
 arch/riscv/kernel/kernel_mode_vector.c             |  4 +-
 arch/riscv/kernel/process.c                        |  4 +-
 arch/riscv/kernel/signal.c                         |  6 +--
 arch/riscv/kernel/smpboot.c                        | 14 ++++--
 arch/riscv/kernel/sys_hwprobe.c                    | 13 ++++-
 arch/riscv/kernel/vector.c                         | 15 +++---
 arch/riscv/lib/uaccess.S                           |  2 +-
 16 files changed, 163 insertions(+), 45 deletions(-)
---
base-commit: 099dbac6e90c620d8ce0bbf75bbdc94da1feb4fb
change-id: 20240318-zve-detection-50106d2da527

Best regards,
-- 
Andy Chiu <andy.chiu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
