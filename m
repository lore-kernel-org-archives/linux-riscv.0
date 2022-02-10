Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D762CC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 21:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=scni6Fk/pcOaufwKlSFNMLa24HVQhSn9ctEPBTPyK+4=; b=Vg+amu74R16edu
	96h2c7pDQvmARSLI/KDetKMT99pDnCMMRGgaeei3BDHNVGSzg1mAce95gZtdwhshPFAmIsNFi8cX4
	lALK5Y1lKjqePTvqNieleGMNJSiQ/umvig/LZr3eTjsIULxJDIUkhKGmtnP7n+ku3SNx4ByyFXKCR
	Uetso43k4lqMWY8FB9/+JV+kPuAolY5r4anf4n7sD5flVyQHRVXADLxeHdFYKrGaNWh5D5HJoLFWn
	7lPsXyDCPc2CEoe079Hacjhry80BQ6IapCpjNEnm0N9V4xEduRRczDjXqIsxSKqFztBSrYc9Zdpyg
	qoe0spLkogeQ08asUVBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIHB7-004xDO-9l; Thu, 10 Feb 2022 21:40:37 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIHB1-004xAY-Cu
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 21:40:33 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id
 p190-20020a4a2fc7000000b0031820de484aso8003818oop.9
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 13:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sYxNbm3oeGTvOZBjs/cPB3osaO0SDrWrhLkY+LP7ILU=;
 b=mXt7X2fqMXlhgBdk2hQKdn+EPzT3nfrG298GNRe+727egR9dlEBR0Q3Xr93bBxgAgU
 BV/wjgb6Ro/lOB8MDyuCy3w5SE+V5PRgO0IYRriAhXqHpGLGyHxAtNHTH6rHP+CYJ/I+
 ZlDAw8G4Chdvvicn+kKxX61+BzJRBJen+FaAQjo1sMAM7EEH/anqxQIKN6SA3YIy+ol6
 L7cDclRNMEpauUUJt6IxQxQZZBwBJr1/1Q5Quzv2AmMuBjSisQuXMN8Gi2yryJffeDX4
 aKqF62yXhDffpfKKXAFuiq/5mJL8rvzrTpMmkuEmD4yqWoF37X4xIT7TF3K7J/fFB40I
 5P1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sYxNbm3oeGTvOZBjs/cPB3osaO0SDrWrhLkY+LP7ILU=;
 b=h/F1JpNBjn4sORoy/1lixyqypIPqzo/YBR2RqiBZwKiiI4i8eklwTaMQUmfJXXhrlr
 fAItBCewRSmG8+FRtmPy9QcRob2ScyZGmooSW1ylsJt7b0JN9RrBVfElG5zE9Fa7nPvh
 dPxcRUe3IytmjsINI2mjk0QKHZ8ow304GybM/lF/WJExWBecCJIlOjs8dnT/lIUi5Y8E
 vLnEo0tAyNqYHJJB2uNFyOp9lOM6WDi3YQIaUciQOb3iyuknz6s+iSqsNi4X038ZQUa6
 KasAQ4DmDLvLzqVllBVND0WG9kx+c0QRSiWY5491mtlADfo5NYnh8xU4MUzVYLuoNf8E
 2Ztw==
X-Gm-Message-State: AOAM532OrCknSDKLBqmvPTiBhpRgwP1oiTLAAvALJRRpzclj3/F9IQXd
 IjOKwXL4aeEG2C5YK4RxH/gMcA==
X-Google-Smtp-Source: ABdhPJyNy85sqXA9jkFA6VdYAx9vnjI1G5u4976z/UV8JDAiyvnszJFiLyt6VW/DI+LwnbfYF54FWQ==
X-Received: by 2002:a05:6870:e743:: with SMTP id
 t3mr1394603oak.265.1644529228715; 
 Thu, 10 Feb 2022 13:40:28 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id u5sm8700000ooo.46.2022.02.10.13.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 13:40:28 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/6] Provide a fraemework for RISC-V ISA extensions 
Date: Thu, 10 Feb 2022 13:40:12 -0800
Message-Id: <20220210214018.55739-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_134031_508045_589BE602 
X-CRM114-Status: GOOD (  10.81  )
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

This series implements a generic framework to parse multi-letter ISA
extensions. This series is based on Tsukasa's v3 isa extension improvement
series[1]. I have fixed few bugs and improved comments from that series
(PATCH1-3). I have not used PATCH 4 from that series as we are not using
ISA extension versioning as of now. We can add that later if required.

PATCH 4 allows the probing of multi-letter extensions via a macro.
It continues to use the common isa extensions between all the harts.
Thus hetergenous hart systems will only see the common ISA extensions.

PATCH 6 improves the /proc/cpuinfo interface for the available ISA extensions
via /proc/cpuinfo.

Here is the example output of /proc/cpuinfo:
(with debug patches in Qemu and Linux kernel)

/ # cat /proc/cpuinfo
processor	: 0
hart		: 0
isa		: rv64imafdcsu
isa-ext		: sstc,sscofpmf
mmu		: sv48

processor	: 1
hart		: 1
isa		: rv64imafdcsu
isa-ext		: sstc,sscofpmf
mmu		: sv48

processor	: 2
hart		: 2
isa		: rv64imafdcsu
isa-ext		: sstc,sscofpmf
mmu		: sv48

processor	: 3
hart		: 3
isa		: rv64imafdcsu
isa-ext		: sstc,sscofpmf
mmu		: sv48

Anybody adding support for any new multi-letter extensions should add an
entry to the riscv_isa_ext_id and the isa extension array. 
E.g. The patch[2] adds the support for sstc extension.

[1] https://lore.kernel.org/all/0f568515-a05e-8204-aae3-035975af3ee8@irq.a4lg.com/T/
[2] https://github.com/atishp04/linux/commit/dfc9b0d16f5a6e4695f0b3ca2f6e3f99654992db 


Changes from v1->v2:
1. Instead of adding a separate DT property use the riscv,isa property.
2. Based on Tsukasa's v3 isa extension improvement series.

Atish Patra (3):
RISC-V: Implement multi-letter ISA extension probing framework
RISC-V: Do no continue isa string parsing without correct XLEN
RISC-V: Improve /proc/cpuinfo output for ISA extensions

Tsukasa OI (3):
RISC-V: Correctly print supported extensions
RISC-V: Minimal parser for "riscv, isa" strings
RISC-V: Extract multi-letter extension names from "riscv,isa"

arch/riscv/include/asm/hwcap.h |  25 +++++++
arch/riscv/kernel/cpu.c        |  44 ++++++++++-
arch/riscv/kernel/cpufeature.c | 132 ++++++++++++++++++++++++++++-----
3 files changed, 180 insertions(+), 21 deletions(-)

--
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
