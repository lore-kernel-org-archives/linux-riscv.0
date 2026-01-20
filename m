Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD8BD2ED11
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kysJ+Pg7mK3hh2tPV8aMt1VeJo18XtVKg55NdciE1LY=; b=skzx6dPZK8qBiG
	ENL9ARHOmNW7i0VnO1Oll8WExXXzm2JlA7MQPKa0gzXHUl0g+TOaytbNhMgjaRh8HX4mfX32Md+MP
	3uddpXPxI5AReqfMVnQyumCzkruwVxCAFQdnjB6gh/ZVQcV67QEkYP3dbj9oz9KYRMQGpogucR22e
	sZUDkDHZL1R25aH1gX/wlbrHsxRwje/5b1Kvq75kAmuZTv2asSxJgv8gThEV9svjrfjprKZKwLCIl
	4U5JIQtw1riFkysOt/qhd0pe9v6KNU2/PDyzp7f55TF0jFjxqLPCdCRbT/juZQzK0jHAb6Be8Fi/g
	7w3yVFR2t8icCnENiWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3Aq-000000039l7-2ohg;
	Tue, 20 Jan 2026 04:17:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39b-000000039O1-159X
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED3064454C;
	Tue, 20 Jan 2026 04:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549EAC2BCC6;
	Tue, 20 Jan 2026 04:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882523;
	bh=LLcYCf8E3m+c3NEGM6PLVB/b2aK0eRa7uHCxUc0B8eM=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=NjkctdjKUn0SLqbTQurxBFfLInhgoQWsPREXXMtKwABJ/gYwDhLfCUs8qJtBs06rc
	 EUaBhI2ahtDB8PBFbcHF5tCQl1GzV1TZdEqVEDdKoB4hJkz+LqtjEayxp6d+28gFE8
	 3ABLnRkLQPtnbfcmjEIIUs7xDEA+B4pluqyp1dkgwdmiqtqqtrMmERzCcuE3zeTV53
	 NoZia7WtAER7IlZZVsX/H+NT6nWzcWrp9vpmUzk7d0PbNOeq1moTRsUKI1lcK+6Vrh
	 /lpV9aJzxiRiuX6iEMy0eT/YDrf8e9SePo2PA9hEHQ7H7RV8fEx8GeUbuUfigHfv0v
	 G9hZ+ZbdjOglg==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 19 Jan 2026 20:14:48 -0800
Subject: [PATCH RFC 11/19] RISC-V: QoS: add to build when
 CONFIG_RISCV_ISA_SSQOSID set
MIME-Version: 1.0
Message-Id: <20260119-ssqosid-cbqri-v1-11-aa2a75153832@kernel.org>
References: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
In-Reply-To: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
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
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=738; i=fustini@kernel.org;
 h=from:subject:message-id; bh=LLcYCf8E3m+c3NEGM6PLVB/b2aK0eRa7uHCxUc0B8eM=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwbdjty3TG5LQAHrWZZdIf/E2jMXGsx4bdseHx+2s
 0fuqKVwRykLgxgXg6yYIsumD3kXlniFfl0w/8U2mDmsTCBDGLg4BWAii20ZGd6Wzr7z0Wshw7Je
 jeDaqElRHatnO7xLi2dY+6hi7mvPLzsYGc7V2kZWJvycdatwx5ufb6pO+ChkSX88qvOua0PZlo8
 +3/kB
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_201544_103716_F254AB2D 
X-CRM114-Status: UNSURE (   9.80  )
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
