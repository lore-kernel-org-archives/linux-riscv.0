Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDE1D46BF8
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kysJ+Pg7mK3hh2tPV8aMt1VeJo18XtVKg55NdciE1LY=; b=sxBF3lC1s/dFUi
	VVQVpv8mdGYcdYXy6yBQiDd1E9w//4S4ELpxZBkbF6grvmyNnbENAZQCIeKHrXDumtRN8MH0TVjxm
	/SZVTlWeGP0IsytLzWkWzAXXX+iausosolkPX+Md+ah8NmMGXzqW866XI4GR08TI7YT02+22Ik3Dz
	C+v2ccDDgsZUDI6QaaVg8g5wKLoqDRO2kxy1XFgB67WZRJD2jCkscRzABTLNxUQ/NWd3Ddjb2YZkb
	fSLk7vRD+eq1UELt75BLFd/AAzKP+bmd+droPGPKpOQklgPGHrq0dXhrvegXEFqMGrAZCVTNO+g/8
	kfXLrt3WQvChF359wt2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC9M-0000000GkGe-0ngi;
	Wed, 28 Jan 2026 20:28:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC93-0000000Gk19-3rn0
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7504044561;
	Wed, 28 Jan 2026 20:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1AE3C4CEF1;
	Wed, 28 Jan 2026 20:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632089;
	bh=LLcYCf8E3m+c3NEGM6PLVB/b2aK0eRa7uHCxUc0B8eM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EhM4N6spWcTX8jUod7ooTwW2pQzTpXLDJHyiIXyOkD4SL+5HdLWkoDHTxDO7bi2Hi
	 nouUOXfo+YKMR401HXpQSubprm0j+3PBDaR6rPU7CLq6N7v0pZkPlzfXq2fhLHMnOe
	 2nyqkGoGBP4KBgvwQXVesod7EY73IMRZUoLVoYqtQlDKfdjDitDmElP82Sw1S3zryh
	 RdVtHPb0WPhPgT/+zPf7M1d6g0xF+bI2y8YsHzjwx/u8N+nstX++843GTr3WvoxfHf
	 d/aSBkVnT630pDlsxsfh8Ih3yaDVL+YbSQc9iCLbkosVJKqLpH4YXCwiaBX6lyjneb
	 RiLqcyeDSUL9Q==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 28 Jan 2026 12:27:32 -0800
Subject: [PATCH RFC v2 11/17] RISC-V: QoS: add to build when
 CONFIG_RISCV_ISA_SSQOSID set
MIME-Version: 1.0
Message-Id: <20260128-ssqosid-cbqri-v2-11-dca586b091b9@kernel.org>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, Rob Herring <robh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=738; i=fustini@kernel.org;
 h=from:subject:message-id; bh=LLcYCf8E3m+c3NEGM6PLVB/b2aK0eRa7uHCxUc0B8eM=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWRWFQbe/6ucKK+kJ+cks0JsRXbcirMiy68l1xwRNT3K1
 tBlwZPaUcrCIMbFICumyLLpQ96FJV6hXxfMf7ENZg4rE8gQBi5OAZjICwZGhmnTpT/+/Va91WWC
 CqNftv68qEeHueqaIlfyP5G4lTNr40NGhi1/sgQKKrgPf/3cVD3btpDnqvjKisscpzaViUdPjUt
 +zgsA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_122810_006095_F4C60BE1 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

Add the srmcfg CSR handling and the resctrl interface to the build when
CONFIG_RISCV_ISA_SSQOSID is set.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 arch/riscv/kernel/qos/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/qos/Makefile b/arch/riscv/kernel/qos/Makefile
index 9f996263a86d..9ed0c13a854d 100644
--- a/arch/riscv/kernel/qos/Makefile
+++ b/arch/riscv/kernel/qos/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_RISCV_ISA_SSQOSID) += qos.o
+obj-$(CONFIG_RISCV_ISA_SSQOSID) += qos.o qos_resctrl.o

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
