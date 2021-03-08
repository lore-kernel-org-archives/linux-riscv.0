Return-Path: <SRS0=HQWJ=IG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD54CC433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 03:58:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 446D664DE5
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 03:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 446D664DE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gILvIqNy80iB9s7x68bKGjas95dNx6UTK137d9x78ks=; b=byIujCzU8QN9/hd3J1qR951jna
	xTd/jncNEvkgNYtT0/UGEdSkODo+Av2TbfMZyb/9rqgl7vlnpLrwl54oJKAMaAK0K7zDXbnnfgmG/
	iHLlK3Vu45ZvHTfwCAMN+w6dvCbcV8tZ3SUmhvs1iLuTaAljMx5bOD6pBn4ktZ8gIrAjxa1KMZ2IR
	WJG4mjtS4is9oZhfwILFiWgbn0WxVzNsA7rpyvXT9LTbS9u2MVWKB2wH4CIt16Yy41IhiMkACmLL6
	7C0GY/AZQkvwS9sHJ3PTbrTT1aR7+YpLCV7SKuH+c68vUXKmJBdzp8UOig1+waSiPIU19lpAFH+AO
	tGOjBTJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ72R-00EyhI-GX; Mon, 08 Mar 2021 03:58:35 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ72M-00Eyf6-MN
 for linux-riscv@lists.infradead.org; Mon, 08 Mar 2021 03:58:32 +0000
Received: by mail-pj1-x102d.google.com with SMTP id i14so2283273pjz.4
 for <linux-riscv@lists.infradead.org>; Sun, 07 Mar 2021 19:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=4NlXlWjo22G7ByN9+BE2dTZE0HEpBdiMnyD1rUZ3fJA=;
 b=iLMgPH6wDOJRebc8JMBvzyk1QLsOeJrURQtrTcmiR1sSQjTrGT0Xv7fE2fwd/OtS66
 WrbxCGfGlqa6yRyCaGkcQGs0LUtCb4cijBC4mkQV/hyp4W4lTGYR8r4kOofl4gc5YgSV
 esMfvg6Nh0ePTjyZrX3VEVxlJz4Bq0NSH4Q4VY4eaBgcATCssk8hwnFAl4nxkKEOxshk
 XyyeW3ZDbwcLTQlu3H1ug72E4U0ynbUM6wwZiztjGEdUlNWbln9VhkiiIzk6ZJV66uPC
 RNYBmfAw1SfTN91TfnmKRL4DNXwXhQ6LRdCJR/j0uTfNmawj8PiF2zZxgoRIJU9zUX76
 z2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4NlXlWjo22G7ByN9+BE2dTZE0HEpBdiMnyD1rUZ3fJA=;
 b=Iw7syNoogxHxIHt5nGWk1uO/f8Nk2pxhLOItPJZvHph5PODVdWyRY4I9YSa9h9EYVt
 hwsUrJEzZCnYrXtQb5sVThCSlxX9sWoFPYazLvstAXUObTI/N7nLx86UVgCpivDfY7eU
 34mDO+zLT3Rj9IN9dpgX1xlNEIjefntijoiKZ/+Kmz7lU2Bs5Qq0WUv46dU2UTrHvIsK
 D9utYOQI6Ck7qeQSXTtIt2f8lxyVmY7PgX6RaFHu2e4yOm4WRaUCpnlI30nWzidoTqnS
 t8sddVcKx0v/cJE6d0uquI6Ly3n9ZpiSHh8MrUoTEMJCyYdw17NEIrqOVCr0q61N7Woj
 falQ==
X-Gm-Message-State: AOAM532jYBOZqoRUIpJm/PzoITeNuJ7TWV1/1Jkum2vpk692ns6cmBDJ
 7KWrNm17eBP5N4XZHTvXwJEPZU0z3gGQk6wI
X-Google-Smtp-Source: ABdhPJw88li88V7ARseT3vFjICg+ZH26ycSvyxI8dRleP88zUrXteUujnmZMTdCSKXBAlIBux6jc2A==
X-Received: by 2002:a17:90a:9f4a:: with SMTP id
 q10mr23175051pjv.129.1615175908252; 
 Sun, 07 Mar 2021 19:58:28 -0800 (PST)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id v3sm8394307pff.217.2021.03.07.19.58.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Mar 2021 19:58:28 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: Frank.Zhao@starfivetech.com, atish.patra@wdc.com, anup.patel@wdc.com,
 guoren@kernel.org, alankao@andestech.com, paul.walmsley@sifive.com,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [RFC patch 0/4] riscv: introduce alternative mechanism to apply
 errata patches
Date: Mon,  8 Mar 2021 11:58:13 +0800
Message-Id: <1615175897-23509-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_035830_988302_E6FAA080 
X-CRM114-Status: GOOD (  18.49  )
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

The last patch is to apply the SiFive CIP-453 errata by this "alternative"
scheme. Therefore, It can be regarded as an example. According to the
results of running this image on the QEMU virt platform, kernel does not
apply this errata at run-time because the CPU manufacturer information
does not match the specified SiFive CPU core. Therefore, this errata does
not affect any CPU core except for the specified SiFive cores.

Vincent Chen (4):
  riscv: Add 3 SBI wrapper functions to get cpu manufacturer information
  riscv: Get CPU manufacturer information
  riscv: Introduce alternative mechanism to apply errata solution
  riscv: sifive: apply errata "cip-453" patch

 arch/riscv/Kconfig                          |   1 +
 arch/riscv/Kconfig.erratas                  |  32 ++++++++
 arch/riscv/Kconfig.socs                     |   1 +
 arch/riscv/Makefile                         |   1 +
 arch/riscv/errata/Makefile                  |   2 +
 arch/riscv/errata/alternative.c             |  69 +++++++++++++++++
 arch/riscv/errata/sifive/Makefile           |   2 +
 arch/riscv/errata/sifive/errata.c           |  56 ++++++++++++++
 arch/riscv/errata/sifive/errata_cip_453.S   |  34 +++++++++
 arch/riscv/include/asm/alternative-macros.h | 110 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/alternative.h        |  44 +++++++++++
 arch/riscv/include/asm/asm.h                |   1 +
 arch/riscv/include/asm/csr.h                |   3 +
 arch/riscv/include/asm/errata_list.h        |   9 +++
 arch/riscv/include/asm/hwcap.h              |   6 ++
 arch/riscv/include/asm/processor.h          |   2 +
 arch/riscv/include/asm/sbi.h                |   3 +
 arch/riscv/include/asm/sections.h           |   2 +
 arch/riscv/include/asm/soc.h                |   1 +
 arch/riscv/include/asm/vendorid_list.h      |   6 ++
 arch/riscv/kernel/cpufeature.c              |  17 +++++
 arch/riscv/kernel/entry.S                   |  12 ++-
 arch/riscv/kernel/sbi.c                     |  15 ++++
 arch/riscv/kernel/setup.c                   |   2 +
 arch/riscv/kernel/smpboot.c                 |   4 +
 arch/riscv/kernel/soc.c                     |   1 +
 arch/riscv/kernel/vmlinux.lds.S             |  14 ++++
 27 files changed, 448 insertions(+), 2 deletions(-)
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
