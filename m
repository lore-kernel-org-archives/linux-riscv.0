Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42C5C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 20:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XSs5n9W95GYxZg169W0Glv2a6Rl+pqeB8GN9FqUgmp4=; b=T1kSEWtJW4Rmib
	xpcox5N9GQHw6XOxl6Q3tfpaEM3LnelDtsAsxpDISbnNOh2CuHIaNpqxQa3JhBrfjty0AYEjoUZrg
	h++z4wvEc1/WQzOLZNdYZl2efXYSXXsq3ijyDsEvWzsaJMAgT8Hm9gUTtJcIwEx0ONu4egJvlCSsR
	J5+GsDYrwVv+Ow5hVPMGOyn8QXC5IaQadrX0lr0FAqbYklHYcr+a03jAcEQ/QIIY57zfngbfBYu1a
	0NxNIt6vPQhhK5rnyRqyjP/ESTqUv+nPRs5X5CpuLpb8pYmYc6pSr26uFO6FCH+IYDevmIisDbkrV
	G7p5NMxEglzmbMGHn9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMc5D-00BZYv-W5; Tue, 22 Feb 2022 20:48:28 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMc5A-00BZXb-Jo
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 20:48:26 +0000
Received: by mail-ot1-x32b.google.com with SMTP id
 a7-20020a9d5c87000000b005ad1467cb59so10500421oti.5
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 12:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=abzbFZd3TPTA4Go+lX5G5nJcRHQv2voi7TDO266GTxo=;
 b=bE1/yeOloum46YlusWndmuMHyJDVbuCOKxi7LzM43W6kLZSY5/aP7dpw83JCFGjpbg
 MuLW8oE4pbJOIDJW4KhDlBpis+FdejzShVly+iPEsgn0mTmfZRjpFhNAbpvkGWlfUbKs
 tZ+1u40aGQmj4CxRPTp9j+YNTlwuC4zcWX6Xq6t31ETRqb/3yRIKyOdHDaA/pu5XYCCv
 4N22WUTc2cDJ2UDqJQ0kwC1KPCfNuXTnqAkdBenSH7X52JG1GCgGw+KzEKzEkDdYhvc6
 S3SRfKIkttpI6b5LohIIsYWvnDcOtjz6m8b/Zu1gtsMaxJpRWUBqMrH1mJHWLn1BWBgJ
 jv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=abzbFZd3TPTA4Go+lX5G5nJcRHQv2voi7TDO266GTxo=;
 b=WB5+HNhNDho45SmJ1VvOXhcVQ6DGOgIRlkBGs3/8QxsQYpsenb3GPGVTLzs0YrsCVV
 5sjHXHNfeq0cSfRf7ZTwkitZR+qYDa7VGpVAD/BJTI+sC4JzvqBA6w118meL2YO6OdFh
 N5aMScI4+P5GQrCUBB+OGcOyczxRd9XZGCd9ntZk/J9eETg/GMPDogkfPyz9oUM8gFYZ
 f95Yo7eV+r97cvRsA4IAeWXun1ap3vEbQn25QXJQWW/A4pXhZpkWVGGRdWWw+Ds5Aymd
 EizyEExXO9m1zsL0myd8BX7JHbA9G0zKgE12wlmpjRsuNcdS3yroCDEN0bJ9Q1Ci31Ii
 pBhg==
X-Gm-Message-State: AOAM531lCBi3+caVI7HmbNOG+USUQVHug3AIwu/q625QiKy115g99z5Z
 skAoeQHwZNaOfMXqvllx40TVwQ==
X-Google-Smtp-Source: ABdhPJwg12YQEEr0/64hFTYZhFiG9EZriyVRTIR/jLqxzfJ1/ovNNDL9pkKJyO2n8bLO2oKPpSFvqA==
X-Received: by 2002:a05:6830:2a05:b0:5af:1417:1218 with SMTP id
 y5-20020a0568302a0500b005af14171218mr5015956otu.237.1645562902530; 
 Tue, 22 Feb 2022 12:48:22 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id o14sm16508197oaq.37.2022.02.22.12.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 12:48:21 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 0/6] Provide a fraemework for RISC-V ISA extensions 
Date: Tue, 22 Feb 2022 12:48:05 -0800
Message-Id: <20220222204811.2281949-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_124824_738510_D4C9ED9C 
X-CRM114-Status: GOOD (  11.71  )
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

# cat /proc/cpuinfo 
processor	: 0
hart		: 0
isa		: rv64imafdch
isa-ext		: svpbmt svnapot svinval 
mmu		: sv48

processor	: 1
hart		: 1
isa		: rv64imafdch
isa-ext		: svpbmt svnapot svinval 
mmu		: sv48

processor	: 2
hart		: 2
isa		: rv64imafdch
isa-ext		: svpbmt svnapot svinval 
mmu		: sv48

processor	: 3
hart		: 3
isa		: rv64imafdch
isa-ext		: svpbmt svnapot svinval 
mmu		: sv48

Anybody adding support for any new multi-letter extensions should add an
entry to the riscv_isa_ext_id and the isa extension array. 
E.g. The patch[2] adds the support for various ISA extensions.

[1] https://lore.kernel.org/all/0f568515-a05e-8204-aae3-035975af3ee8@irq.a4lg.com/T/
[2] https://github.com/atishp04/linux/commit/e9e240c9a854dceb434ceb53bdbe82a657bee5f2 

Changes from v4->v5:
1. Improved the /proc/cpuinfo to include only valid & enabled extensions
2. Improved the multi-letter parsing by skipping the 'su' modes generated in
   Qemu as suggested by Tsukasa.

Changes from v3->v4:
1. Changed temporary variable for current hart isa to a bitmap
2. Added reviewed-by tags.
3. Improved comments

Changes from v2->v3:
1. Updated comments to mark clearly a fix required for Qemu only.
2. Fixed a bug where the 1st multi-letter extension can be present without _
3. Added Tested by tags. 

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
RISC-V: Extract multi-letter extension names from "riscv, isa"

arch/riscv/include/asm/hwcap.h |  25 +++++++
arch/riscv/kernel/cpu.c        |  51 ++++++++++++-
arch/riscv/kernel/cpufeature.c | 130 +++++++++++++++++++++++++++------
3 files changed, 183 insertions(+), 23 deletions(-)

--
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
