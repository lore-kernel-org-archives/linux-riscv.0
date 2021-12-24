Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52408C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Dec 2021 21:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ja/SttJGNFWlWPpNdg2kGXhrTVoca5LRvr6Ehnis2wI=; b=gwxJpH9RKvpqu3
	A48kriMJja7Vs9q9HQADRcJnMg/lObNNC61aZGntzhuvJwsIAUa9VPcyZ0eHkrDoDYfHbyWIsK30Q
	lmROa1DtuLEATDsGs6nprwGLXRD1PbECerCDaxFrF+o32aOBaAzACiBK+Gi8f/53cAPYqLSrVdyg/
	3MioRGTxMl7BtYML0PgnVOiMXn9vuotzZMLxwh/XFgeF5+yejwF9ReLkUfW5syagiAcqHpx4KXBLC
	nxWfFkR2DGUicBe3h1L9qEPvcQgDSjzGvVAq+0cXKPhnEbuaP34Qo2CopSJyTOKZh+OjumWz221GE
	ZNslZL/EiRi1gVqGUpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0rvo-00EU1M-7u; Fri, 24 Dec 2021 21:16:52 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0rvk-00ETzw-Gd
 for linux-riscv@lists.infradead.org; Fri, 24 Dec 2021 21:16:50 +0000
Received: by mail-qk1-x732.google.com with SMTP id de30so9242396qkb.0
 for <linux-riscv@lists.infradead.org>; Fri, 24 Dec 2021 13:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AhdazWj7E7mP5lpQoH/Hlj6un/O7qxYC1hCrM4oG9J4=;
 b=mT9uij2tqEoq8C1DWMJWrz6FiHUEhP4vS4/RipfbDrcoEtaNu1JmX2fGlpJ91b6YMc
 1UDUDgVJl3VsW95/VIGAcjp+GVv182dDzIAGuBh+PmK2OIl0fH//dX9uKSAYzoz6RxPv
 UrOTdvCxGgmg6mEQXYwCeNVdlpSiKrnsm7bWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AhdazWj7E7mP5lpQoH/Hlj6un/O7qxYC1hCrM4oG9J4=;
 b=uEpa2rOqDONTRFQiu+s3juGH1Ku0cG0o2K397aEiJ4d/Lvj/y/pMv0HNukpQ0yOL8S
 Mr3dZG0qRBeoyYrTrEUI/Pf2jVP2DNpPNVr/uZOGdlLsFLNyodQBjxSlPvx7urqc9GR3
 W1XvzbYn9zSn/JKLYiPNl4XrX7KXkv/js4KHTx5by4i2gGfAatQILveV3gh26zDgQI/d
 rgzlCvHOiQdvE8Vi7kdRTufZV0pZdBoOYmhy9b1YdscFCAhjwmrnxdEHUzhH6wbdryDy
 mpSL1ugKZ+Mp73KDH68Xasi49N6tRyuEduLNiwtV0be92PXpOZteIGCfuRB/3D8yqtcl
 JDYA==
X-Gm-Message-State: AOAM5315repH47oE6aylmAg2QcdjA5N35dYzL1SzWmjy7fU+H3ox6RMV
 xlVsPJssBbYDjoQi8t7jNhy+
X-Google-Smtp-Source: ABdhPJz65i5I0vRRJZRYggvczL1rK5geWBE650taAK2VtqLZTwr+BIm+WLoqvaWXZvHF8ett7iAUCA==
X-Received: by 2002:a05:620a:318d:: with SMTP id
 bi13mr5833578qkb.279.1640380605615; 
 Fri, 24 Dec 2021 13:16:45 -0800 (PST)
Received: from fedora.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id m15sm7661069qkp.76.2021.12.24.13.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 13:16:45 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
X-Google-Original-From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 0/2] Provide a fraemework for RISC-V ISA extensions 
Date: Fri, 24 Dec 2021 13:16:30 -0800
Message-Id: <20211224211632.1698523-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_131648_669528_7C735A52 
X-CRM114-Status: GOOD (  10.42  )
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
extensions. It introduces a new DT node that can be under /cpus or
individual cpu depends on the platforms with homogeneous or heterogeneous 
harts. This version of the series only allows adds support for homogeneous
harts as there are no platforms with heterogeneous harts yet. However,
the DT binding allows both. 

The patch also indicates the user space about the available ISA extensions
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
E.g. The patch[1] adds the support for sscofpmf extension.

[1] https://github.com/atishp04/linux/commit/a23157264118d6fd905fd08d8717c7df03078bb1

Atish Patra (2):
RISC-V: Provide a framework for parsing multi-letter ISA extensions
dt-bindings: riscv: Add DT binding for RISC-V ISA extensions

.../devicetree/bindings/riscv/cpus.yaml       |  9 +++
arch/riscv/include/asm/hwcap.h                | 31 ++++++++++
arch/riscv/kernel/cpu.c                       | 16 +++++
arch/riscv/kernel/cpufeature.c                | 58 ++++++++++++++++++-
4 files changed, 113 insertions(+), 1 deletion(-)

--
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
