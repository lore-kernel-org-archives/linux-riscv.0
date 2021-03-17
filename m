Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602A0C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 09:34:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD83A64F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 09:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD83A64F3C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LvoApNTF3hD6IpfMoEKIqHC/GkcvsE2LRKUH0mavCYA=; b=pOdE6MrOGZ5ooXeYUm6+sBHoIX
	omP52i1iysLctd+DkykDWPlSzPepQiv+QvmbvwSeXOsYRJFM+so4EnvuO2CCJcudQ4JXfZn4LFemo
	xv69t0AFrhV6w7y4wKTgWR5Q2p8aKtjfRCnQFSHUMyJRySKzkpBTb0lKiXCMeudR2+oR1bQSDpWvi
	SMLRpwqY3Lf2NdxK647rrkJH6Lr3LDWiDNpbKzbKnsOjUWx3Lwxqtxc6zpdLMnei4/V4qk0GxJnM0
	uGdz6dQUlZQU33TrZ1RSGpcd/lYVs6s+7gm8KTAD0HK1XNvH/D2ef56b9aXNrCxSXVY+iWVp7nQkT
	ehci1cIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMSYn-002rKP-7K; Wed, 17 Mar 2021 09:33:49 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMSYi-002rJV-KB
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 09:33:47 +0000
Received: by mail-pj1-x102b.google.com with SMTP id t18so778502pjs.3
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 02:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=/5c+8nyXtqQ+267pEWb8YcnqMrtGFm2RxWYqeah68ng=;
 b=gQx72TzvWfUdrMNWKJI7eaFAdE7p9JEfyZ72OQIksX0vvid3ISK3d43vV3yHgAuGdr
 JsJypf49rf0Il8qOigBTvI01yX0lDVLrzsfqiHT5xU8uvVa0J4b0VoLlP1Oy5RrcTD0R
 w8OQh8aIOIxGxztARzY5CLH1YdAMPurSOdBoljwnORwCUX/8P4xSLB6zEgY6ki1M4sUa
 zVzs54yU4ZalfCZBPMw51y9G4l3A1v6lRwBAv+3jbuwU3mP7MT6glwzbJRz2FL3rM2TW
 csOF/YOIFQbHyjgM3pmMw8LszLLGw/d/1IoO57TpKW//WyMd8NTEkdYBvUwaponO0B5Z
 BZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/5c+8nyXtqQ+267pEWb8YcnqMrtGFm2RxWYqeah68ng=;
 b=SOv7cVGF49C+pRhoeASYtctb2ue0lz08FNy8OkaF5sNtnKx5ntWlaTfJra6tfjCHLw
 VT+RCKfeU/dBayQNunB31wQifFbeIBdECLNNSvxveALXYo59uXoCDQkmANi6s1fhC9Kn
 8yFg6rpV+5C8ng88kfJgjcbbtPfW7nBiudN8bJX77SXianrIbnMBbapbxuJKMLdnhI6E
 VktiPS5UfTS0mRBymiyDjxCOqLvqV/sYgBFbD8mBLLDdGkm8aLejX9AzLk2gbolKSwCJ
 U0NNprZiWW9DzIfqBtCnFy7v+QtQ1Qo5z7jnPVjaXhGY3c2Pv7FE7dIdRTF+H1oJif/b
 KsZQ==
X-Gm-Message-State: AOAM533Qc5Voc55vetyD5p81f4syMw+b75lV6ybw2MFURhDqirHZFUbj
 UKtVFsaSIpyndySvGUlJEz0kT5kl6UNRqB/t
X-Google-Smtp-Source: ABdhPJzviBC3z2/WiLf6NeWbRstzHXshAoTh30bHY3RTq6JgGdySQehMJKcmwATPohVqSlup0LyWLw==
X-Received: by 2002:a17:90a:7e8b:: with SMTP id
 j11mr3674155pjl.11.1615973622942; 
 Wed, 17 Mar 2021 02:33:42 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i14sm2149508pjh.17.2021.03.17.02.33.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Mar 2021 02:33:42 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: Frank.Zhao@starfivetech.com, anup.patel@wdc.com, atish.patra@wdc.com,
 guoren@kernel.org, alankao@andestech.com, paul.walmsley@sifive.com,
 ruinland@andestech.com, david.abdurachmanov@sifive.com,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v2 0/5] riscv: introduce alternative mechanism to apply errata
 patches
Date: Wed, 17 Mar 2021 17:33:28 +0800
Message-Id: <1615973613-22364-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_093345_116534_23E87B93 
X-CRM114-Status: GOOD (  18.86  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

With the emergence of more and more RISC-V CPUs, the request for how to
upstream the vendor errata patch may gradually appear. In order to resolve
this issue, this patch introduces the alternative mechanism from ARM64 and
x86 to enable the kernel to patch code at runtime according to the
manufacturer information of the running CPU. The main purpose of this patch
set is to propose a framework to apply vendor's errata solutions. Based on
this framework, it can be ensured that the errata only applies to the
specified CPU cores. Other CPU cores do not be affected. Therefore, some
complicated scenarios are unsupported in this patch set, such as patching
code to the kernel module, doing relocation in patching code, and
heterogeneous CPU topology.

In the "alternative" scheme, Users could use the macro ALTERNATIVE to apply
an errata to the existing code flow. In the macro ALTERNATIVE, users need
to specify the manufacturer information (vendor id, arch id, and implement
id) for this errata. Therefore, kernel will know this errata is suitable
for which CPU core. During the booting procedure, kernel will select the
errata required by the CPU core and then patch it. It means that the kernel
only applies the errata to the specified CPU core. In this case, the
vendor's errata does not affect each other at runtime. The above patching
procedure only occurs during the booting phase, so we only take the
overhead of the "alternative" mechanism once.

This "alternative" mechanism is enabled by default to ensure that all
required errata will be applied. However, users can disable this feature by
the Kconfig "CONFIG_RISCV_ERRATA_ALTERNATIVE".

The last two patches are to apply the SiFive CIP-453 and CIP-1200 errata by
this "alternative" scheme. Therefore, they can be regarded as examples.
According to the results of running this image on the QEMU virt platform,
kernel does not apply this errata at run-time because the CPU manufacturer
information does not match the specified SiFive CPU core. Therefore, these
errata does not affect any CPU core except for the specified SiFive cores.

Changes in v2 patch:
1. Display a warning message if Kernel finds the required errata is missing
2. Provide sample code for a vendor who wants to append its errata
3. Create a new patch to workaound SiFive errata cip-1200
4. Code refinement

Vincent Chen (5):
  riscv: Add 3 SBI wrapper functions to get cpu manufacturer information
  riscv: Introduce alternative mechanism to apply errata solution
  riscv: sifive: Add SiFive alternative ports
  riscv: sifive: Apply errata "cip-453" patch
  riscv: sifive: Apply errata "cip-1200" patch

 arch/riscv/Kconfig                          |   1 +
 arch/riscv/Kconfig.erratas                  |  45 +++++++++
 arch/riscv/Kconfig.socs                     |   1 +
 arch/riscv/Makefile                         |   1 +
 arch/riscv/errata/Makefile                  |   2 +
 arch/riscv/errata/alternative.c             |  74 +++++++++++++++
 arch/riscv/errata/sifive/Makefile           |   2 +
 arch/riscv/errata/sifive/errata.c           | 105 ++++++++++++++++++++
 arch/riscv/errata/sifive/errata_cip_453.S   |  38 ++++++++
 arch/riscv/include/asm/alternative-macros.h | 142 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/alternative.h        |  39 ++++++++
 arch/riscv/include/asm/asm.h                |   1 +
 arch/riscv/include/asm/csr.h                |   3 +
 arch/riscv/include/asm/errata_list.h        |  39 ++++++++
 arch/riscv/include/asm/sbi.h                |   3 +
 arch/riscv/include/asm/sections.h           |   1 +
 arch/riscv/include/asm/tlbflush.h           |   3 +-
 arch/riscv/include/asm/vendorid_list.h      |  10 ++
 arch/riscv/kernel/entry.S                   |   6 +-
 arch/riscv/kernel/sbi.c                     |  15 +++
 arch/riscv/kernel/smpboot.c                 |   4 +
 arch/riscv/kernel/vmlinux.lds.S             |   7 ++
 22 files changed, 539 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/Kconfig.erratas
 create mode 100644 arch/riscv/errata/Makefile
 create mode 100644 arch/riscv/errata/alternative.c
 create mode 100644 arch/riscv/errata/sifive/Makefile
 create mode 100644 arch/riscv/errata/sifive/errata.c
 create mode 100644 arch/riscv/errata/sifive/errata_cip_453.S
 create mode 100644 arch/riscv/include/asm/alternative-macros.h
 create mode 100644 arch/riscv/include/asm/alternative.h
 create mode 100644 arch/riscv/include/asm/errata_list.h
 create mode 100644 arch/riscv/include/asm/vendorid_list.h

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
