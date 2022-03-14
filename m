Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B73C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Mar 2022 20:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z4s73tHzElxeawAc/D9ixDAZiL9k/N5uGc5iMJuOjpM=; b=bjP4MA8oMqKEF0
	bekg/rv+epixVp4wdu1DUpNJtkxqvOKP8KJijiBq4pmUDHM5eryipiE54ih6lnQ8WrtJ3kJBjXsME
	forSqxH6s2MHAeeSEFz2BmIrmGAJO+wR6Uhel/smgvxTdhbaZ3qb7Is34Kx3QwndU9130PgqZhuJn
	wd3IIvfvwOFoERxtdlvgltOX4DSaBqEk5cxX54Brqr2IPyOGLuClPj4n5pdD552n2hgByuL+2WpFW
	bfiVhchUN+X3QirZRtjY5/nUBq8S+KWr3fSo7MJ+J7iGGCEwBncO8zJ0TOx27qikgYvybtfn4S3fb
	ifx+Ycz3dTH1i41Z8HSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTrT6-006oq7-S3; Mon, 14 Mar 2022 20:39:04 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTrT3-006ood-6E
 for linux-riscv@lists.infradead.org; Mon, 14 Mar 2022 20:39:03 +0000
Received: by mail-qt1-x836.google.com with SMTP id i8so2324738qtx.6
 for <linux-riscv@lists.infradead.org>; Mon, 14 Mar 2022 13:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6w3smz0Oju2eB1A2qrt4ZKtokvH1F+OKqqamdL7L7P4=;
 b=pdMnUTk+FxlOr0gcR6zu3Q3yrpEn5lHgpsJ7lD6tENqImWy+nWDQ07qXGibnvAZczi
 W6tj7yTDQv1Ba/F7OQUNHNehdhKHCuw3xUJxj4SIaMvSARglSlK7TFbieFmzMdMMIE63
 vivff60xvi2SY4dAPo8Whzm0S1NtIjb5NwzSuPWk4XhVHGZ2fYCoQE0+GroYxBaR/r+H
 Rg4dQprmKpEKwAGYNlkkTjxqyLZTHR5pWxX4bOtYj07JrjnUlHFsoZMDglcnFGHNrsmn
 fIq42izBdQmHAGMMbHbjyhFaGvKtJ5ibxOsaLaNyJKjP4RglNZMQTCCIYNUJqonJVPUB
 2ETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6w3smz0Oju2eB1A2qrt4ZKtokvH1F+OKqqamdL7L7P4=;
 b=4TpYRSqyUpZbwPyFO/PklpMxF3ycAnOjuQyPtnKn6kG8czoPAJoqI5vtX6CfWTn6Vr
 kg026u5w3UX+d3n2HzpG2KWeAC+iPW+R3QtfCbzkB3srAa+2X52042z3Svjo8I6pcnSx
 X6WRcfV4B3jp3VHoZcyJtkAsU3tFh5i9XrFNSMV4w/B/aLD7Vn4GvQdNMZMYLYrTruUa
 z0dvRINk7rvwjEoRto2DA6Ry7DbX2vUcgJrYpaTXUWq4zcybhVMv4Uxo/xDAbz7FVwW5
 kZVTc7gJWbBe83kFipguaaw44HlPeP6l0+bfi4cQYIdPfAVU356hVMy3zzBVXGEtBavI
 0PmA==
X-Gm-Message-State: AOAM530CCVzNtd+SKHhkwhJBK0HMc9XLkdhzmobYthXwsk5m/iX3qMNv
 vs19hPrQq36K7rF6L0gW6nPcBw==
X-Google-Smtp-Source: ABdhPJxyW2l2usP1ZOY52mIonUGrofBK+pSm3Mhgd20xiZA5yLrupJH1m3OokcczYouwyYK0t92Xqw==
X-Received: by 2002:a05:622a:1647:b0:2e0:6f65:c54d with SMTP id
 y7-20020a05622a164700b002e06f65c54dmr20443570qtj.193.1647290338403; 
 Mon, 14 Mar 2022 13:38:58 -0700 (PDT)
Received: from rivos-atish.ba.rivosinc.com
 (adsl-70-228-75-190.dsl.akrnoh.ameritech.net. [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id
 j188-20020a3755c5000000b0067d1c76a09fsm8597023qkb.74.2022.03.14.13.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 13:38:57 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v6 0/6] Provide a fraemework for RISC-V ISA extensions 
Date: Mon, 14 Mar 2022 13:38:39 -0700
Message-Id: <20220314203845.832648-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_133901_320070_BB85F4AC 
X-CRM114-Status: GOOD (  11.81  )
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
isa		: rv64imafdch_svpbmt_svnapot_svinval
mmu		: sv48

processor	: 1
hart		: 1
isa		: rv64imafdch_svpbmt_svnapot_svinval
mmu		: sv48

processor	: 2
hart		: 2
isa		: rv64imafdch_svpbmt_svnapot_svinval
mmu		: sv48

processor	: 3
hart		: 3
isa		: rv64imafdch_svpbmt_svnapot_svinval
mmu		: sv48

Anybody adding support for any new multi-letter extensions should add an
entry to the riscv_isa_ext_id and the isa extension array. 
E.g. The patch[2] adds the support for various ISA extensions.

[1] https://lore.kernel.org/all/0f568515-a05e-8204-aae3-035975af3ee8@irq.a4lg.com/T/
[2] https://github.com/atishp04/linux/commit/e9e240c9a854dceb434ceb53bdbe82a657bee5f2 

Changes from v5->v6:
1. Changed the isa extension format from separate row to single row that follows
   RISC-V spec naming standards.

2. Removed the redundant extension detection log.

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
arch/riscv/kernel/cpu.c        |  65 ++++++++++++++++-
arch/riscv/kernel/cpufeature.c | 128 +++++++++++++++++++++++++++------
3 files changed, 195 insertions(+), 23 deletions(-)

--
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
