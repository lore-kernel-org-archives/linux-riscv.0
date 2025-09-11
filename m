Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5338ACA1016
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 06:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HKD/b/mwc5OU843/6GfyJPcXKPp75Ch65QBeI28mpVg=; b=k3e4ge6r0bkQsr
	WJGZ0s/1W/VBMvWc1w6xrJYHihIRvI8JdejLxUvevzig65t10GhCSMWaoIDrf3r5nGTvpe/22TO9+
	pw9AiiaMWCpOeQlRzIl6+mbGg1G+kBL0iiJ6NgYP/vw9uuMnVkk9DaZ8KAsW0mmKSpodE93rZ8Gbe
	SBXsXmSQellBMd4z/U8GJ5quiPruYG6SSBDNy7ODBGwzIMcFbGrQPMy1rdBj9aebSNggO7/naGXpA
	srsX6tB8zHG7gYh6BOPx10pyxHWaqxbrDtdA1nSBnBjq8to+PYdaiEXrDpt04h/KCPa1ydyUyr0Ba
	tzwF6L49Wi+YwF6RPzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwabY-00000001BKL-0GjK;
	Thu, 11 Sep 2025 06:16:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwabV-00000001BJd-2Hby
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 06:16:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7639B447E2;
	Thu, 11 Sep 2025 06:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E425DC4CEF1;
	Thu, 11 Sep 2025 06:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757571380;
	bh=ROX9J4DVISbZb0WSpNLVp5LK08+J+x9wXLeyIYlyDEU=;
	h=From:Subject:Date:To:Cc:From;
	b=S4dw0eOz3n22Yeeki35UO5y88R0ejc6uP0MsjXcRYh7aEhnIJuBQePwu2Du0gkZkA
	 oFINonXgj6kvCTF6UBQ4Clm9Fko74Kfh+ExQM3qGrP2bA+aU78c5fYkq9lPmIkfJoj
	 JBcdYEUd7dzf3YNeBsA6MGKglmZQx9BGywOKkTaIzegzRDRSfNjWAv2V6V1wMehfw3
	 iGpqZAeQPAEVsd2uNKv9jJkNsQvSzq326IOZVpwbtCxdBqXGufcCzXCjSincx5loKL
	 iHbg1DUp7Tp1GaHu2OR7ES7OXUOtWzEok8t/3uKzrpNDXYQvqd11zThGwy8LOcL9p2
	 KZnEQiTna42Ew==
From: Drew Fustini <fustini@kernel.org>
Subject: [PATCH 0/2] RISC-V: Detect Ssqosid extension and handle srmcfg CSR
Date: Wed, 10 Sep 2025 23:15:28 -0700
Message-Id: <20250910-ssqosid-v6-17-rc5-v1-0-72cb8f144615@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAABpwmgC/x3MPQqAMAxA4atIZgOxoFWvIg61TTWLPw2IIL27x
 fEb3ntBOQkrjNULiW9ROfaCpq7Ab25fGSUUgyHT0kADql6HSsC7w8Zi8i1G72npemfJGSjdmTj
 K8z+nOecPLhFm7GMAAAA=
X-Change-ID: 20250909-ssqosid-v6-17-rc5-fcc0b68a70a2
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>
Cc: =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 James Morse <james.morse@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, guo.wenjia23@zte.com.cn, 
 liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <fustini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3783; i=fustini@kernel.org;
 h=from:subject:message-id; bh=ROX9J4DVISbZb0WSpNLVp5LK08+J+x9wXLeyIYlyDEU=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMWQcytRQ2qlr5vAsuW/a9ksyU3e+fLIvJXdybo6HbuHku
 UqVXz7ndZSyMIhxMMiKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAm8qeMkeFluFDnK66aH98/
 Fs2ve/Py3sx/M7Yk+O36WS48PWcj/00Zhv/O1xqNv4cb993yXV3tEC4z7Xu9+LL4DUFHtXRyF0Y
 dDOcHAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_231621_635652_F276D5EB 
X-CRM114-Status: GOOD (  14.29  )
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

This series adds support for the RISC-V Quality-of-Service Identifiers
(Ssqosid) extension [1] which adds the srmcfg register. This CSR 
configures a hart with two identifiers: a Resource Control ID (RCID)
and a Monitoring Counter ID (MCID). These identifiers accompany each
request issued by the hart to shared resource controllers.

Background on RISC-V QoS:

The Ssqosid extension is used by the RISC-V Capacity and Bandwidth
Controller QoS Register Interface (CBQRI) specification [2]. QoS in
this context is concerned with shared resources on an SoC such as cache
capacity and memory bandwidth. Intel and AMD already have QoS features
on x86 and ARM has MPAM. There is an existing user interface in Linux:
the resctrl virtual filesystem [3].

The srmcfg CSR provides a mechanism by which a software workload (e.g.
a process or a set of processes) can be associated with an RCID and an
MCID. CBQRI defines operations to configure resource usage limits, in
the form of capacity or bandwidth. CBQRI also defines operations to
configure counters to track the resource utilization.

Goal for this series:

These two patches are taken from the implementation of resctrl support
for RISC-V CBQRI. Please refer to the proof-of-concept RFC [4] for
details on the resctrl implementation. More recently, I have rebased
the CBQRI support on mainline [5]. Big thanks to James Morse for the
tireless work to extract resctrl from arch/x86 and make it available
to all archs.

I think it makes sense to first focus on the detection of Ssqosid and
handling of srmcfg when switching tasks. It has been tested against a
QEMU branch that implements Ssqosid and CBQRI [6]. A test driver [7]
was used to set srmcfg for the current process. This allows switch_to
to be tested without resctrl.

Changes from RFC v2:
 - Rename all instances of the sqoscfg CSR to srmcfg to match the
   ratified Ssqosid spec
 - RFC v2: https://lore.kernel.org/linux-riscv/20230430-riscv-cbqri-rfc-v2-v2-0-8e3725c4a473@baylibre.com/

Changes from RFC v1:
 - change DEFINE_PER_CPU to DECLARE_PER_CPU for cpu_sqoscfg in qos.h to
   prevent linking error about multiple definition. Move DEFINE_PER_CPU
   for cpu_sqoscfg into qos.c
 - renamed qos prefix in function names to sqoscfg to be less generic
 - handle sqoscfg the same way has_vector and has_fpu are handled in the
   vector patch series
 - RFC v1: https://lore.kernel.org/linux-riscv/20230410043646.3138446-1-dfustini@baylibre.com/

[1] https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
[2] https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
[3] https://docs.kernel.org/filesystems/resctrl.html
[4] https://lore.kernel.org/linux-riscv/20230419111111.477118-1-dfustini@baylibre.com/
[5] https://github.com/tt-fustini/linux/tree/b4/cbqri-v6-17-rc5
[6] https://github.com/tt-fustini/qemu/tree/riscv-cbqri-rqsc-pptt
[7] https://github.com/tt-fustini/linux/tree/ssqosid-v6-17-rc5-debug

Signed-off-by: Drew Fustini <fustini@kernel.org>
---
Drew Fustini (2):
      RISC-V: Detect the Ssqosid extension
      RISC-V: Add support for srmcfg CSR from Ssqosid ext

 MAINTAINERS                        |  6 ++++++
 arch/riscv/Kconfig                 | 17 ++++++++++++++++
 arch/riscv/include/asm/csr.h       |  8 ++++++++
 arch/riscv/include/asm/hwcap.h     |  1 +
 arch/riscv/include/asm/processor.h |  3 +++
 arch/riscv/include/asm/qos.h       | 41 ++++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h |  3 +++
 arch/riscv/kernel/cpufeature.c     |  1 +
 8 files changed, 80 insertions(+)
---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250909-ssqosid-v6-17-rc5-fcc0b68a70a2

Best regards,
-- 
Drew Fustini <fustini@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
