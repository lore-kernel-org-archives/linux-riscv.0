Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C862EC6FA9E
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 19:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KlJU/XyPeLhrHt1iARehLOB7ErpNBdn7Pq15kTk4b78=; b=tGa4kn5t8lcbL1
	nQPsf6mSGlgTE/065M42i0OJOXpe8Ad+2I4Jg/sIifm//ftQqSx4HRuyC+84DTEmkQMBVEkmlkEPM
	EUmH+kA4ryunSG5qsRa/hhIrVTuu9DKZsU0OR6eKLjQJ0u6dxrwKj5z8XBifmmejrWvSqJgHEeVCk
	NNmfrF2gSAaohtqUxmfW7SYUGOtGkNgAKbf9HmiRoNJ5tmEfw27ES/NcuYNWF+/DFtgUX6jijrZz9
	KIYuNjOtn43K/OkifhpaeV8h+xyVSy0scbA3XlHeiFOjTbxyi6aTKf9B3ODzRwPZU+GjnEIA2qwPG
	HKo+R+1eS2sTZgZ8+OvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUY0z-009Usz-Pq; Tue, 21 Feb 2023 19:09:25 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUY0v-009Unm-Fa
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 19:09:24 +0000
Received: by mail-ed1-x535.google.com with SMTP id cy6so15896152edb.5
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4osRIfgfc/PJWrkiEk8uvxiS60YFQl6dW0F7YBTqgw=;
        b=gAvrC3LNGb+qHdRiFSZzwZK0m2H06A25ie41xRB/ncMl9netf2o3K5s9ChsSR/Y/oF
         HaqCQ/jpzPHDnVWmJO9Uz4NIalRiNqwUzzIZp52qNJri+A/JaOZBxn/QJQ9KPYZT/Vdq
         8/qffRty0sewNgIZAWhQWh43IqB2KBv6i9f6O9qqEtrr85wyoEVZaeUOQTgDRLbG7jlk
         hSZfQ1bK8Hdodo8mk8IicB+ouIQvo5uDL1xaTgjuvARFZQ+KJL4m/R30zW+SMLhAIMmx
         stHeiUWqLnwjZthNpLEAlahs18iivn/HmfKkivzjFpDwFrf1NMcfc9DXOxNkeMxhXQoK
         hCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4osRIfgfc/PJWrkiEk8uvxiS60YFQl6dW0F7YBTqgw=;
        b=kVdVgLJQhdrxh7FFhzsn3Y+yr7CAG0/L1DoOJ4lppnSGOnYVU9T0ls1plA/S4vwTgw
         kiGOdBPxLvhfS/djiiXlkqpoyaev3jl3BKu62Dd5xHEBwjnf8xAMU4TQU3gAgQ3ETfQT
         ERG7atLy9xqNGxKBLwEpK97GWwLeSQHmIVB5wmRg0fWmvKTL0QCB9SMJeFBnVY6wn1sd
         79+evnhyEqqwdCnFLEKvnRoTY3+fUEbG5QMn4ELiFRZ+j/NPAsB/SzijllUqEi6O+eni
         3iAEc8dfXMlyxg0Qppwlt8bExRphu6fsFo2OBSWzrthkmyDO/JFqp5iyCd62pZN/9mLL
         ue5g==
X-Gm-Message-State: AO0yUKVVcaJ1dovnKmjgpSHzzepIZRLngIxPot5HMP7a8RyQHt2k7Hcp
	H9wtx27SITiM6dI4DFAR6ov9qYmUDEz7sSY0
X-Google-Smtp-Source: AK7set9DSOQ0D1RA5pN9F831qu+ve+wz5+Hh7uzWGH6je+MzjLb6/GAhXhfyAHvVDRHyVwuh8wssgg==
X-Received: by 2002:a05:6402:658:b0:4ac:bd84:43d8 with SMTP id u24-20020a056402065800b004acbd8443d8mr6531376edx.8.1677006558175;
        Tue, 21 Feb 2023 11:09:18 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id d29-20020a50f69d000000b00499b6b50419sm2519977edn.11.2023.02.21.11.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:17 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: 'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>
Subject: [PATCH v5 0/8] RISC-V: Apply Zicboz to clear_page
Date: Tue, 21 Feb 2023 20:09:08 +0100
Message-Id: <20230221190916.572454-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_110921_559063_E500D617 
X-CRM114-Status: GOOD (  20.35  )
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

When the Zicboz extension is available we can more rapidly zero naturally
aligned Zicboz block sized chunks of memory. As pages are always page
aligned and are larger than any Zicboz block size will be, then
clear_page() appears to be a good candidate for the extension. While cycle
count and energy consumption should also be considered, we can be pretty
certain that implementing clear_page() with the Zicboz extension is a win
by comparing the new dynamic instruction count with its current count[1].
Doing so we see that the new count is just over a quarter of the old count
(see patch6's commit message for more details).

For those of you who reviewed v1[2], you may be looking for the memset()
patches. As pointed out in v1, and a couple follow-up emails, it's not
clear that patching memset() is a win yet. When I get a chance to test
on real hardware with a comprehensive benchmark collection then I can
post the memset() patches separately (assuming the benchmarks show it's
worthwhile).

Based on riscv-linux/for-next plus the dependencies listed below.

Dependencies:
https://lore.kernel.org/linux-riscv/20230221185603.570882-1-ajones@ventanamicro.com/

The patches are also available here
https://github.com/jones-drew/linux/commits/riscv/zicboz-v5

To test over QEMU this branch may be used to enable Zicboz
https://gitlab.com/jones-drew/qemu/-/commits/riscv/zicboz

To test running a KVM guest with Zicboz this kvmtool branch may be used
https://github.com/jones-drew/kvmtool/commits/riscv/zicboz

Thanks,
drew

[1] I ported the functions under test to userspace and linked them with
    a test program. Then, I ran them under gdb with a script[3] which
    counted instructions by single stepping.
[2] https://lore.kernel.org/all/20221027130247.31634-1-ajones@ventanamicro.com/
[3] https://gist.github.com/jones-drew/487791c956ceca8c18adc2847eec9c60

v5:
  - Rebased on latest for-next which allowed dropping v4's dependencies
  - Added a new dependency on an alternatives/cpufeatures cleanup series
  - Replaced "RISC-V: cpufeature: Put vendor_id to work" with "riscv:
    cpufeatures: Put the upper 16 bits of patch ID to work" since touching
    vendor_id is probably a bad idea [Conor]
  - Picked up an r-b from Conor

v4:
  - Rebased on latest for-next which allowed dropping one dependency
  - Added "RISC-V: alternatives: Support patching multiple insns in assembly"
    since I needed to use more than one instruction in an ALTERNATIVE call
    from assembly. I can post this patch separately as a fix if desired.
  - Improved the dt-binding patch commit message [Conor]
  - Picked up some tags from Conor and Rob (I kept Conor's a-b on the
    clear_page patch, even though there are several changes to it, because
    I interpreted the a-b as "OK by me to implement a Zicboz clear_page")
  - Added "RISC-V: cpufeature: Put vendor_id to work", which was necessary
    for how I wanted to use ALTERNATIVE in clear_page.
  - Fallback to memset when the Zicboz block size is too big for the
    Zicboz implementation of clear_page [Palmer]
  - Use lw without la in clear_page impl [Palmer]
  - Implement a Duff device for clear_page using the new 'vendor_id'
    alternatives support [drew]

v3:
  - CC'ed DT list
  - Improved commit message of DT bindings patch to point out relationship
    with cbom-block-size
  - Picked up an a-b from Conor

v2:
  - s/blksz/block_size/, improved commit message for "RISC-V: Add Zicboz
    detection and block size parsing", isa ext sorting [Conor]
  - Added dt binding patch [Heiko]
  - Picked up r-b's from Conor, Heiko, and Anup
  - Moved config symbol and CBO_zero() introduction to "RISC-V: Use Zicboz
    in clear_page when available" and improved its commit message and
    implementation (unrolled four times) [drew]
  - Dropped memset() patches [drew]
  - Rebased on ae4d39f75308 ("Merge patch "RISC-V: fix incorrect type of
    ARCH_CANAAN_K210_DTB_SOURCE"") plus the dependencies

Andrew Jones (8):
  RISC-V: alternatives: Support patching multiple insns in assembly
  RISC-V: Factor out body of riscv_init_cbom_blocksize loop
  dt-bindings: riscv: Document cboz-block-size
  RISC-V: Add Zicboz detection and block size parsing
  riscv: cpufeatures: Put the upper 16 bits of patch ID to work
  RISC-V: Use Zicboz in clear_page when available
  RISC-V: KVM: Provide UAPI for Zicboz block size
  RISC-V: KVM: Expose Zicboz to the guest

 .../devicetree/bindings/riscv/cpus.yaml       |  5 ++
 arch/riscv/Kconfig                            | 13 ++++
 arch/riscv/include/asm/alternative-macros.h   |  6 +-
 arch/riscv/include/asm/alternative.h          |  3 +
 arch/riscv/include/asm/cacheflush.h           |  3 +-
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/insn-def.h             |  4 +
 arch/riscv/include/asm/page.h                 |  6 +-
 arch/riscv/include/uapi/asm/kvm.h             |  2 +
 arch/riscv/kernel/cpu.c                       |  1 +
 arch/riscv/kernel/cpufeature.c                | 58 ++++++++++++++-
 arch/riscv/kernel/setup.c                     |  2 +-
 arch/riscv/kvm/vcpu.c                         | 11 +++
 arch/riscv/lib/Makefile                       |  1 +
 arch/riscv/lib/clear_page.S                   | 73 +++++++++++++++++++
 arch/riscv/mm/cacheflush.c                    | 64 +++++++++-------
 16 files changed, 217 insertions(+), 36 deletions(-)
 create mode 100644 arch/riscv/lib/clear_page.S

-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
