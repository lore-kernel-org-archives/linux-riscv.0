Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9977AC433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 05:33:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5125464F55
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 05:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5125464F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FAfx5Xuu3/SVxF+rUmjJdevwH7EiC6/75I180Y8P5tI=; b=SMbve526+YyBsIYIUkcqqWOgNR
	hNeEvfxDshjTudHnx64PRgxaOE2C+e27NTy+SCFqIsa2y8+FI5cWadntBBh23qqJO2clj7wyhV+rR
	VuTC0ioWpJR+bVHodnT8Lcy4j6PjMlMNUGbHI5yX3IkK0Fyo8DleJKIX2eeThFJInVTBcXQqEFT3o
	CzId6XHTIlkRGGgVwRX4+Zlv2Nfm9DZtJ/hJzLPOtnYe8gK3QasIGBe9ufP/yNh/BCSAgXDgsttXu
	XdskhJ6byfTJujP/awFKnuzz0o3u+2bQ4cH6PDR/ltJ1Rpfm/SUbw/q5gR/DYc/pRg6j/YXJKRMg8
	OXJUdSUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7XGG-000666-K7; Thu, 04 Feb 2021 05:33:00 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7XGC-00063d-5r; Thu, 04 Feb 2021 05:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612416775; x=1643952775;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=20GUJPs0xyqN+1X8CUwsioLenuUNs3sUWwKF/m/Mk9Y=;
 b=OGj7KGgUfGCjM7pcO65qx/3j6P7fMBqraT20NdnlDXddM8w1cdbQP8DY
 UCQ668z+87kkxjhXzjTU3l4jACJqFbsEZnoa/0LS16odgj+CFnex55s8e
 HCDy3GzvheWRgmx76/oC8gHfWy27qSk3BAThwwxrZnOpcQ5HT49QNZiCe
 TUrenqcr7z3Oia2KMBMENBFVqZf1ikpre76++TLKfjbTjDL6bWlPbjjyf
 n8il5xfQs0Be9tzOwT07ofV4RHRHVdNw6qI5mFDKbhemEGfUuuaIGBO3T
 1AZ6fl1xfeeTifCSpjLVPVYl0T/LQjv7AV96VdHymHPcr3RwW+IldUk4p Q==;
IronPort-SDR: vt3gWTylZ58NM0jmyLskUn25JDlENcOZnczANteb4rn6JvFTkLZD03XLueb31cGTCj/KaDXxzz
 jLOGiXKvwB7Pe/xoOVIOY4yW07uWnVBsCmLTuxNTkq9JsH1Pro7dXy/ZOssnOV3Qa41OQSWNKM
 +mTrZM6Ea5YNfo9FPHC7m0x7paefCvrAZvr3AlglZOGEFIp+nQ7ngOe/AfRWkcJ1z67vdmuapf
 wc6GU/zFFqN/z+sLgh2765hl53UFTyp1VBjntwQZ+B2pqhoDhrqORfHbIybzfkjc3RgwRSPnOW
 Ij0=
X-IronPort-AV: E=Sophos;i="5.79,400,1602518400"; d="scan'208";a="159086428"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Feb 2021 13:32:53 +0800
IronPort-SDR: qZB8GrJzcO6quOMHhUIatHItYMcAfosyR3OfeGJ6Dpw7yDxe+ut5RBqxAN0PBhknoTew/e7uBU
 9EH4xo/LtHIhpiEPxueg7NFqpECbEy559YQ+qC+tGE9ikFz2dQekRyjvLcXlTUzC+7opszGiuD
 7dISnnB8AsVhx3vr9ERBr2qpetOJMLhQMSSoZKQJdqvY2ICj2/Nsd1MohqWt1dO+jhirvcIGkL
 vXhmasmXkMgH3i+1n4Ij66qBqShtwU2lAenhcaj25SJgp72qxvyUOJj8n8OD8In+nntex/62A1
 ZmecccJjtZ8JBibBGAzjCDkQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 21:14:57 -0800
IronPort-SDR: /PPwS0VvJF+wkXfdg85sqhiMnov/J2WUM+ZcZeMpj7Oy/VR1taKs8zTdU2Zgkbp0Qpag7T8Efe
 /FCe9i/YXycJ9hbVk3o2oJsLfVpqZTukVrhD8tCO9JxVV42JfdN/FK/GmODHyqo97074r/3K2L
 qdRk2b0AEUEWkl7JUuNHSiHNjmPAG0bK5ucvPOIV1by4hoQkxyQzc73hN38QAob/H18LO1n8nb
 fNzv9cMCSTcaUSbVKmYCbm46fkqNhD4uJLR7UYrnOVF4F4RNo2aeJZwhHLc1/2ZYq17W/oR8+f
 RTY=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO jedi-01.hgst.com) ([10.86.63.165])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Feb 2021 21:32:53 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] Add SBI v0.2 support for KVM
Date: Wed,  3 Feb 2021 21:32:33 -0800
Message-Id: <20210204053239.1609558-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_003256_407943_EE179006 
X-CRM114-Status: GOOD (  15.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Supervisor Binary Interface(SBI) specification[1] now defines a
base extension that provides extendability to add future extensions
while maintaining backward compatibility with previous versions.
The new version is defined as 0.2 and older version is marked as 0.1.

This series adds following features to RISC-V Linux KVM.
1. Adds support for SBI v0.2 in KVM
2. SBI Hart state management extension (HSM) in KVM
3. Ordered booting of guest vcpus in guest Linux
4. SBI Reset extension in KVM

This series depends on the base kvm support series v16[2].

Guest kernel needs to also support SBI v0.2 and HSM extension in Kernel
to boot multiple vcpus. Linux kernel supports both starting v5.7.
In absense of that, guest can only boot 1 vcpu.

Changes from v1->v2:
1. Sent the patch 1 separately as it can merged independently.
2. Added Reset extension functionality.

Tested on Qemu and FPGA with Rocket core design.

[1] https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc
[2] http://lists.infradead.org/pipermail/linux-riscv/2021-January/004251.html

Atish Patra (6):
RISC-V: Mark the existing SBI v0.1 implementation as legacy
RISC-V: Reorganize SBI code by moving legacy SBI to its own file
RISC-V: Add SBI v0.2 base extension
RISC-V: Add v0.1 replacement SBI extensions defined in v02
RISC-V: Add SBI HSM extension in KVM
RISC-V: Add SBI RESET extension in KVM

arch/riscv/include/asm/kvm_vcpu_sbi.h |  33 +++++
arch/riscv/include/asm/sbi.h          |   9 ++
arch/riscv/kvm/Makefile               |   4 +-
arch/riscv/kvm/vcpu.c                 |  19 +++
arch/riscv/kvm/vcpu_sbi.c             | 189 +++++++++++++-------------
arch/riscv/kvm/vcpu_sbi_base.c        |  73 ++++++++++
arch/riscv/kvm/vcpu_sbi_hsm.c         | 109 +++++++++++++++
arch/riscv/kvm/vcpu_sbi_legacy.c      | 114 ++++++++++++++++
arch/riscv/kvm/vcpu_sbi_replace.c     | 180 ++++++++++++++++++++++++
9 files changed, 635 insertions(+), 95 deletions(-)
create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h
create mode 100644 arch/riscv/kvm/vcpu_sbi_base.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_hsm.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_legacy.c
create mode 100644 arch/riscv/kvm/vcpu_sbi_replace.c

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
