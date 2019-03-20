Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9C5C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 23:48:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 502B0218A5
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 23:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VKUGu6L6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="CDQO+GQG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 502B0218A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1l5G8jiJvvkwbALXZVJ7Tn2WmunsURbAVVyv1fBFtgM=; b=VKUGu6L6ep8x51
	LOQATXx+Xd5CqUSvkqa0IrFzjFfje3kOOH5rUrEGYotcPwCaaogzFPJLwpOrfIy/+phDOGL45wK7x
	92oToqQq01NUDKztMfHAuevK3Qf8tpBcjB1VaFwAq9VHBPQIbEqAaGog6uOcgU5Udme7Zlbl8Chn/
	di+f7uzfg32W7OYc9OBXWeayBcI+EeaOSkdCbpO20IhSQmFUsfOMPqJsjQrdVw1+bou6W9ZeBakwT
	7Rohu3/fiHKmE3QfpmiRVCBrO0B5PeYI7XVdJb4u54HcWQdXWjLq5u+MLCwsgWvQqdkbZ4On7lQ2Z
	kxCAAaQV/tYoDdEwbHCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6kwV-0001PX-30; Wed, 20 Mar 2019 23:48:19 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6kwT-0001OM-4L
 for linux-riscv@lists.infradead.org; Wed, 20 Mar 2019 23:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553125697; x=1584661697;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MXoKOqnmh4glr82XcmuusqJSAAOR3fVo1vwmgG/zsgo=;
 b=CDQO+GQGVCzM81YwTy161NQc4kHdj0lqJ27SR8vd9vaiXCvGj0J7CvJO
 0A83a0nriuWKk/ZYatwF+x7mMJVIZF+Z3qGyUoivsrYbl+9HRV5d6OK+7
 lWT/M0QcguzVvNjAMQ9jLDz716wRMYrnYG1OaY8vlaRiFkTkAF/eFYhgX
 hz75aJ7FJKgy9lZ7+fWV5s9FEK3YnbnPtvsWnfXsipPak2aMx8B9t6zA0
 YBckG34Iom6q9kzISvM38W5DcZPzrRleb/CQpEhALGsu1NyJU/U/Jow5y
 r2/KC1azgNRGPftEuaUtV0cBXQg8n99QgWOgy1co7rEcHX/SLXsTbMqV+ A==;
X-IronPort-AV: E=Sophos;i="5.58,498,1544457600"; d="scan'208";a="209432738"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2019 07:48:14 +0800
IronPort-SDR: 9zW6b1385Kfu+5V6mdgD9hmjRbqw1Zg24pv+RtJOlIiMts5CddRL1bBa/rTtQKhYTR1R2CbsID
 0nfCd52JUfPA1UXjQv4Th9WmCd+oT7AAp9bbAVA3oh8nyUWbaPIJGZGDzi2Q93ppsbKYku47Za
 NNK0HNpR6VuAc8/nG1BTBx0CcItVnX/Ry/iv7Fz1DFXyVsNPGM4GOKrGY5pZwC1N0G1Izo0wJw
 CF27eGRbYqlTtq/ZBL2JUBy895EMwNfniydv6kKzWkyyxEH+5QfVdKimn7BiiXR3Lm2tvWOhGy
 qjTtu2UBXwBwnweyIhKreKh7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 20 Mar 2019 16:27:51 -0700
IronPort-SDR: IhuVAZBifJqI9IKuS0jMxBGdTiTGwyls+8KLoVoQxR+MZbq17NQMJCS0zCKmfv0FIyjO5ER+xU
 uKuBwqw/ciq7haWhaHEIk3iVr3tST6zhbS0LPkrpPy5EeDNgiqX3bVX278b8DCIcf+TvF8yB8P
 od3lJ8UVXt6YkRV6SQonasIb1Py4zUs+W0nWwynSyOsV5qt3dj3wBaQRQ4ULYfxBfcrLk4MgDr
 GcCUZHd/G16Iswe9a6I/0aEFqnhvrprV/s/sj7igbIhsMn3J1LW6/qV9jVc8tkJm/NekKVyY4o
 Fr0=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Mar 2019 16:48:14 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT/RFC PATCH v3 0/5] Unify CPU topology across ARM & RISC-V 
Date: Wed, 20 Mar 2019 16:48:01 -0700
Message-Id: <20190320234806.19748-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_164817_290585_5287FF4F 
X-CRM114-Status: GOOD (  14.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Johan Hovold <johan@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Otto Sabart <ottosabart@seberm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The cpu-map DT entry in ARM can describe the CPU topology in much better
way compared to other existing approaches. RISC-V can easily adopt this
binding to represent its own CPU topology. Thus, both cpu-map DT
binding and topology parsing code can be moved to a common location so
that RISC-V or any other architecture can leverage that.

The relevant discussion regarding unifying cpu topology can be found in
[1].

arch_topology seems to be a perfect place to move the common code. I
have not introduced any significant functional changes in the moved code.
The only downside in this approach is that the capacity code will be
executed for RISC-V as well. But, it will exit immediately after not
able to find the appropriate DT node. If the overhead is considered too
much, we can always compile out capacity related functions under a
different config for the architectures that do not support them.

There was an opportunity to unify topology data structure for ARM32 done
by patch 3/4. But, I refrained from making any other changes as I am not
very well versed with original intention for some functions that
are present in arch_topology.c. I hope this patch series can be served
as a baseline for such changes in the future.

The patches have been tested for RISC-V and compile tested for ARM64,
ARM32 & x86.

The socket change[2] is also now part of this series.

[1] https://lkml.org/lkml/2018/11/6/19
[2] https://lkml.org/lkml/2018/11/7/918

QEMU changes for RISC-V topology are available at

https://github.com/atishp04/qemu/tree/riscv_topology_dt

HiFive Unleashed DT with topology node is available here.
https://github.com/atishp04/opensbi/tree/HiFive_unleashed_topology

It can be verified with OpenSBI with following additional compile time
option.

FW_PAYLOAD_FDT="unleashed_topology.dtb"

Changes from v2->v3
1. Cover letter update with experiment DT for topology changes.
2. Added the patch for [2].

Changes from v1->v2
1. ARM32 can now use the common code as well.

Atish Patra (4):
dt-binding: cpu-topology: Move cpu-map to a common binding.
cpu-topology: Move cpu topology code to common code.
arm: Use common cpu_topology
RISC-V: Parse cpu topology during boot.

Sudeep Holla (1):
Documentation: DT: arm: add support for sockets defining package
boundaries

.../topology.txt => cpu/cpu-topology.txt}     | 134 ++++++--
arch/arm/include/asm/topology.h               |  22 +-
arch/arm/kernel/topology.c                    |  10 +-
arch/arm64/include/asm/topology.h             |  23 --
arch/arm64/kernel/topology.c                  | 303 +-----------------
arch/riscv/Kconfig                            |   1 +
arch/riscv/kernel/smpboot.c                   |   3 +
drivers/base/arch_topology.c                  | 298 ++++++++++++++++-
drivers/base/topology.c                       |   1 +
include/linux/arch_topology.h                 |  36 +++
10 files changed, 453 insertions(+), 378 deletions(-)
rename Documentation/devicetree/bindings/{arm/topology.txt => cpu/cpu-topology.txt} (66%)

--
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
