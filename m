Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2946C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 09:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=84Mj43EOdbXgUDtjUYqJrVKIUTO1CspqcMXot3C48H0=; b=JRVLYYC7q+yVoK
	SwKWChmo4/o3NGrll6meO7y3ZZHPb8J295KI/VFHbeCJSLBsC6zf9zjii4r3y6On0ipx3REAwq6cc
	F1hu01eCoNh4Zjs27Fp+KM3PIMSE/obD477BOLisw+3s+Y82CwrRvxI24XItrZ8Kd+c9+PIoI38Nh
	4wZdzMQ1vnwZ9e2aZF50kaaKkTtCOwhOTWs6NgwQoaAm0zpWkoWAfmL/zWyB9+fB0ydij3ehdjiIe
	IiBHRWp9AQfa98JmXTPE1cfXJKwfvbZWiIeRRik1got39m1qHRrULPkHAs/WC5w6UgPTIKB8G1vqd
	LzYfHHkBCNYVNPE5TXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtjM-001she-Lb; Tue, 15 Feb 2022 09:02:40 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtjG-001scy-2V
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 09:02:36 +0000
Received: by mail-qv1-xf35.google.com with SMTP id o5so17069214qvm.3
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 01:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94zuPq2u7S7IuvdQC3T3gt4sxQz8uNo1pA51T1QzfOM=;
 b=oXqITTtyvfd9bHj1UUEuwmPenKxCQ5523q9nzwEO8w5VJCBGzM9ghj2KUA5i0TjLFx
 Ys12W+pBymEITarI/Mt2wWZlxCb9r+0ZbJvahV7goHiEwztoJzjZz9HkbhU2/y1ZxjWm
 Gkdakdeo+UKhfCbL99UQyRy8XK6Llrpv53n8cHI/rydrfz8IUoLPxwbcIYaU0abEiWxF
 hmub8pVPRIS05ocu3J/0jpsILbBMGht6GEGMypdtGG13zkdEl41Ec1rqHilNUq8bkYo5
 fx24g/02Shkj9e9P0tG8RgjqGp1EX1yEi815/fkcBpz3DlTF3/k+KqTilxk7w7qm4KRH
 Rg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94zuPq2u7S7IuvdQC3T3gt4sxQz8uNo1pA51T1QzfOM=;
 b=6mxV2juaN0aTkVr2iCvwQvkU67v2bp5tSwUGk+1C9+93VcrarGgK2yv6EHfBOic9eA
 wwiRDMlRpK2sGdVf8X//h2Trm/OsTkFa5X5pQ/rs6GVXv+I1YX32fpZS4IDvXOO7mZ2P
 cLZOVO4vxZZ0f+dsCaOddlEWIyja/O023iq2whGRenfmiDUaWCeDzYDGijdS8Nd9OG7c
 RCIVCG8RusgrBm1fDBr5YgGAy0Jmv/9EuhP5K33kFJzcQS16SGufFJ9lovZN4lgBw2Gy
 GGIqmuX8yOxGMOHv9ZOLy4WBT7BKuKHbYN1qdaeMQ2qOdb0/V+clGFBspr8WCRdELB1G
 Zb/Q==
X-Gm-Message-State: AOAM531ewPvRi2jcL9iPVgtCi6JuNrixZ3bS16RV7BAQ9rDHULjkcpAb
 nZwTZyVazdHFMNSOaa7vPaR7Ag==
X-Google-Smtp-Source: ABdhPJwdwNZpshpGezRK0j6kwzSGlQR6i2H2/tl7sT0mgs1i5UvXYIdnGb/gj8f0ZjhiTY3Ommk/rA==
X-Received: by 2002:a05:6214:21a5:: with SMTP id
 t5mr1975944qvc.51.1644915750023; 
 Tue, 15 Feb 2022 01:02:30 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id w4sm17711158qko.123.2022.02.15.01.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:02:29 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/6] Provide a fraemework for RISC-V ISA extensions 
Date: Tue, 15 Feb 2022 01:02:05 -0800
Message-Id: <20220215090211.911366-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_010234_184880_B13B6F92 
X-CRM114-Status: GOOD (  11.87  )
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
E.g. The patch[2] adds the support for various ISA extensions.

[1] https://lore.kernel.org/all/0f568515-a05e-8204-aae3-035975af3ee8@irq.a4lg.com/T/
[2] https://github.com/atishp04/linux/commit/dc6f9200033bb5a72d8fd1a179bb272c6ade17e6 


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
arch/riscv/kernel/cpu.c        |  44 ++++++++++-
arch/riscv/kernel/cpufeature.c | 130 ++++++++++++++++++++++++++++-----
3 files changed, 178 insertions(+), 21 deletions(-)

--
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
