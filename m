Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B356C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 09:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c0yhKlyf5PerZcqld/W/Y8LNy1xJWSNuex3fmj7b9Yk=; b=AYdQxkDtrvHaGW
	TpFKVE4vlqEj5QxWXHAknda2v2nheSwilTtzwVP1jE+q+1ZgaN2c6FXsL1UXEvROBLJ0ZsR7q2SL6
	QkbSYukFv+T7nkmgUPBSVJhL1rRpdOP6acNWT624YkEFp+r8FAH0hZ+RLVbAfyOYALmMogRM2LTVN
	hYSJcXbd0kniySrRL0zEDELXt+5IAJYXoOXgnygZ0OD5NG7mnrfSumNqiOBoY/LaV9EC7gDT5Rp6W
	kpqTswC3nRH0P5xW4l10VoesL/o+Y6DZrjGjuw5LErqFAWSG4amAK3KQTJe5scTk1GAOX0mGeIzVO
	16fYk6llQ5wFDz6fMCUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOcYJ-00BIJ6-1z; Mon, 28 Feb 2022 09:42:47 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOcYF-00BIGj-1K
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 09:42:45 +0000
Received: by mail-oi1-x22b.google.com with SMTP id ay7so12632571oib.8
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 01:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lqd+uM0+AsEqEUkgyYxAHY0Z5jtxbH0DOOxZpRbhWVk=;
 b=TscrhBaDAEepfdz5Z2ltBnhHnUV1g+rV3nLy4t44yc41fnNwqn0MmQhy7DT7B2Bk0E
 ZrjZXsjxfT3EFYOMxdq3t7n+Xlq9hVZwgJeC6KSd6RjMuT5m4rvuwS+cmQSvbw3mw3hO
 ZbntkGKhK2um4h+a2Mu71f3CQxokfd5GOyyKd9yfivfNnfaBHG1vuoewiJsA2D5tcHa4
 bfcO1OAsYYoeKqg35HK6i10PhwLPII6uhFR4vVsOWcyKUcvWQLRBceRiHLbckDoUpgsK
 W4oFhtbAZdO8XecA/Kdjgp/QqkpWzu/RYdrKqXTMbj4dyTQUPDeRlEF60V1huvRiL/VU
 xQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lqd+uM0+AsEqEUkgyYxAHY0Z5jtxbH0DOOxZpRbhWVk=;
 b=5O8mCFjDteNOu9pl8Mc84zwKU/xVcAb9r4JntKaYewVmvQzyHveQiSyzho8KSaOtvk
 yeJJ1Ym4vOqy5LXuLd8IgBbYiWNbFGDJlvr8SJCPaStNdn0PlTg7PVVQ1YMZYACCt4gi
 wGGUotS8oM7kmPI2qqBZKkaTjf/q4YvtrRLqXWhfqIrZjDQd3VGgB3ct3RTmBeG2TU+w
 k2OTUs4SPQVnv5wVVP/YpTg8xuE5NjCL8fmANg2MpoM3nI91VD0+9L9qLtxO8nEF9NJY
 1iA7Sg0bUoweiYdSLDsxEtjfucYE3LEol5QZjB24zfrUCWZbfrGCr0+rK9EWSm9VIY8T
 6rSw==
X-Gm-Message-State: AOAM5319CzvGPFpmQnb7iFnJ1CtVJOfnwMdI4k8YtdcA68qvuWVhQ59l
 CBjPPSK1inEifVH1C0bRMEoUfg==
X-Google-Smtp-Source: ABdhPJzGVSYPURjxwKVMmt98ELmUV/vmpESUrllO+pnCtr9uHHmokFZxrEV/7bQfqVedP7L9vtOWdQ==
X-Received: by 2002:a05:6808:56b:b0:2d4:5f04:f2fa with SMTP id
 j11-20020a056808056b00b002d45f04f2famr9813151oig.96.1646041362018; 
 Mon, 28 Feb 2022 01:42:42 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 bx10-20020a0568081b0a00b002d70da1ac54sm5936852oib.19.2022.02.28.01.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 01:42:41 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 0/6] Add Sstc extension support 
Date: Mon, 28 Feb 2022 01:42:27 -0800
Message-Id: <20220228094234.3773153-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_014243_131613_6767EB4F 
X-CRM114-Status: GOOD (  12.62  )
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

This series implements Sstc extension support which was ratified recently.
Before the Sstc extension, an SBI call is necessary to generate timer
interrupts as only M-mode have access to the timecompare registers. Thus,
there is significant latency to generate timer interrupts at kernel.
For virtualized enviornments, its even worse as the KVM handles the SBI call
and uses a software timer to emulate the timecomapre register. 

Sstc extension solves both these problems by defining a stimecmp/vstimecmp
at supervisor (host/guest) level. It allows kernel to program a timer and
recieve interrupt without supervisor execution enviornment (M-mode/HS mode)
intervention.

To maintain backward compatibility, KVM directly updates the vstimecmp
if older kernel without sstc support is running in guest. Similary, the
M-mode firmware(OpenSBI) uses stimecmp for older kernel without sstc support. 

The PATCH 1 & 2 enables the basic infrastructure around Sstc extension while
PATCH 3 lets kernel use the Sstc extension if it is available in hardware.
PATCH 4 & 5 adds the infrastructure for KVM to use sstc while PATCH 6 actually
uses the Sstc extension if available. 

This series has been tested on Qemu(RV32 & RV64) with additional patches in
OpenSBI[2] and Qemu[3]. This series can also be found at [4].

[1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
[2] https://github.com/atishp04/opensbi/tree/sstc_v1
[3] https://github.com/atishp04/qemu/tree/sstc_v1
[3] https://github.com/atishp04/linux/tree/sstc_v1

Atish Patra (6):
RISC-V: Add SSTC extension CSR details
RISC-V: Enable sstc extension parsing from DT
RISC-V: Prefer sstc extension if available
RISC-V: Restrict the isa field in config register to base extensions
RISC-V: KVM: Introduce ISA extension register
RISC-V: KVM: Support sstc extension

arch/riscv/include/asm/csr.h            |  11 ++
arch/riscv/include/asm/hwcap.h          |   1 +
arch/riscv/include/asm/kvm_host.h       |   4 +
arch/riscv/include/asm/kvm_vcpu_timer.h |   3 +-
arch/riscv/include/asm/timex.h          |   2 +
arch/riscv/include/uapi/asm/kvm.h       |  22 ++++
arch/riscv/kernel/cpu.c                 |   1 +
arch/riscv/kernel/cpufeature.c          |   4 +-
arch/riscv/kvm/main.c                   |   8 ++
arch/riscv/kvm/vcpu.c                   | 111 ++++++++++++++++++-
arch/riscv/kvm/vcpu_sbi_replace.c       |  10 +-
arch/riscv/kvm/vcpu_timer.c             | 136 +++++++++++++++++++++++-
drivers/clocksource/timer-riscv.c       |  22 +++-
13 files changed, 323 insertions(+), 12 deletions(-)

--
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
