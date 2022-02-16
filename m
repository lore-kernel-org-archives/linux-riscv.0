Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CA3C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 00:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TQ9EB0HBz1tZEVmTG5xbSOs/DCVGCi5LgUdum6RifaU=; b=ub5Nkz75QebCPC
	lqSSClxVgQdPtO/j0gVAABv61jF0ZLcQEkUpXmZMW0yKuULgcSY8cNNACO9fxLCjUALXOExHoh81w
	S+4+0F3imGY6cOubgoZM9vzd2BCQEIhY4yijyl+SF5rFBvS7D8FJ/i+rUpOeXzIEX4iRSGSAoSEaR
	ProMfcFlwfijtEnyX5ett065oweje0PXSfbpw7A/xUj4yL8W985Ubq+2UprWOW1iiZfvo8HHssoCh
	CAXkl0MxA2INF02V/w4HyP1F//bQMSseuSHr0zxcMXSk5BAh8LjA1E3T8jjuvulIw5p9nJh7c5zXd
	40jJGpsGZ6wTnX307rww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK8CC-0053w4-LD; Wed, 16 Feb 2022 00:29:24 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK8CA-0053uY-B7
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 00:29:24 +0000
Received: by mail-qt1-x829.google.com with SMTP id bt3so636487qtb.0
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 16:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t27W0lbEILJrau95kLpEzbRPsuMMyCdiCi9PRIKKX+I=;
 b=eQuqnBRjXks3RQAght3ysumGeCoEcge074hYULSJQ5BdL36eSTPwMH5s6+g7vkB9+3
 9xaXVngmy5BVOF7nQHPFp+ZMwNSi45WD5d5vRJEE86jQ4swP1l1ROwcpm6AjXLS+bfvH
 NjXOA8ONPR9TPYOpfdFqGO/ufNY3CRqYqtaIBJ2ctVI0x/fX39iHa6UglWgrGkua725y
 AFcht3eKhDr3jRvABwfhykU2YAKAD1JLRZDFzvmi0R+2tHF8wB9t+l7RNkxKUjlOG/O4
 ngy1yhUI3yubQ0sZVlFv0hbXWF+WoR6dN5YhShYMp0zN8ToccrsfbXAjt7+pOknbeodD
 HIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t27W0lbEILJrau95kLpEzbRPsuMMyCdiCi9PRIKKX+I=;
 b=Msxt7Z0dJSUFRwK7Wj5h5aBr4FC9vaoQ4oosUfZB2QS+LWEKuHizsbGRkodOejXUhQ
 VJx9tShwQb+p5EW/h8Z4cV6473ymbcaICEb7S4HYIqLWqzbqdLtk83EEqUXd7sygUfYf
 4pO3OAXoTMZmljxls1bSePHRuKmKkoCdrYb0QFg4JasCJLUhFdapwNgPSS8x8W/kpm4f
 UiwoPLuv9yV9dugHMAMDNq8kkDR/uD/yymuRlkGYaiBtogQWMeIaM9/qeF3Xnsafpr6w
 JOWzH8FYd+AcD9IMv+DBDuv3ecQ6461J0053xZH2CUgguJ+L4OxTTYZ2F1DhJvYuzrGH
 fz9w==
X-Gm-Message-State: AOAM533fRng11XgZtP56hkdldvwXASHeLO08EB7gErP2df2WPMQGKLEc
 AFDwolfZIl2o5t1lJNJkwsI/gw==
X-Google-Smtp-Source: ABdhPJz6iUpspGO34CrAyvWt5Q9xzqsyD/4nhf2iPphxkyF/qAVY0xVAe8eJ9Vf3s78QLWe7mqb9pA==
X-Received: by 2002:a05:622a:4f:b0:2c9:a3f9:debd with SMTP id
 y15-20020a05622a004f00b002c9a3f9debdmr385246qtw.689.1644971358926; 
 Tue, 15 Feb 2022 16:29:18 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id g21sm20882584qtb.70.2022.02.15.16.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 16:29:18 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, heiko@sntech.de,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 0/6] Provide a fraemework for RISC-V ISA extensions 
Date: Tue, 15 Feb 2022 16:29:05 -0800
Message-Id: <20220216002911.1219593-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_162922_394629_2A722376 
X-CRM114-Status: GOOD (  11.79  )
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
[2] https://github.com/atishp04/linux/commit/e9e240c9a854dceb434ceb53bdbe82a657bee5f2 


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
arch/riscv/kernel/cpu.c        |  44 +++++++++++-
arch/riscv/kernel/cpufeature.c | 125 +++++++++++++++++++++++++++------
3 files changed, 171 insertions(+), 23 deletions(-)

--
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
