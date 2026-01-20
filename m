Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5CBD2ED11
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4ASY5+u2S6iMO+SAQ93ls2Fd7Rug39uKjaOAm7wuv0=; b=qrYSVaWOAqjGt7
	JjKvMiCN2rKZ6buMibSop4JbDSeBN2T7y0r49GYJfwPl9lZGiipM719dDXV/D62TDsZWJjJVvdNp5
	09Ewrr/+jqr5gITy9es+RDsJv9G+akquvNjkfAAwQSg3hkiMWbtxD/8fIxeG1sfnw/1VkZlgTzOGD
	GVrH9QINYGwQwx6hQpmGVOYY8vQwqN0K4u0pmlX4kb4dyaVofnOYFlWRiYe+wiZgLa29kmpn8AQn0
	lGcuo9VyIWpcysQm6gO8TXjSVqV8vW7MgxWR4TcSs/GRobMJC8T/cchLtrLU1Lc9qA1AWeVEC2xHb
	G8lep4aQtcpOy5Pf7Scw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39t-000000039WK-43UI;
	Tue, 20 Jan 2026 04:16:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39H-000000039L3-0RtS
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB6CF4395E;
	Tue, 20 Jan 2026 04:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B54C2BC86;
	Tue, 20 Jan 2026 04:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882522;
	bh=SXrtFbN0ix7KxT0GqeIs7HkzT3FdlhgaF3gCwM+F2Mc=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=GYH/GKnNLch3a/BJWK/t9HsJfo8yJwJ8lY7anK+3t1lgejF14xSE5vjBl+eZ2y2gl
	 YXGprIBPMmUTYAC2ZXGTZyJnCGPoHXOhm99+FW9T7H2OVw6gymn605Uk36xJEr45nm
	 GX+WTIw77nHuCjhvhANGNUOfbVYNBU8VB/NWiGl6UnvSkddhmGH+O3fMHLnumhq1og
	 C9kp1hiBWNog7+TotNgmcsGHhM3N4CwuTDwIOpkuE5orkFYXbnjtEDQCHts1irrldJ
	 ISzpJKn7C0bszrkOEGFFkF8tTE1hE7Axc9yxk07Kxkt90D7CDtkgM6O2uthIHMHaRU
	 aIzdd7L32Q9OA==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 19 Jan 2026 20:14:46 -0800
Subject: [PATCH RFC 09/19] RISC-V: QoS: expose implementation to resctrl
MIME-Version: 1.0
Message-Id: <20260119-ssqosid-cbqri-v1-9-aa2a75153832@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087; i=fustini@kernel.org;
 h=from:subject:message-id; bh=SXrtFbN0ix7KxT0GqeIs7HkzT3FdlhgaF3gCwM+F2Mc=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwZF1c69f1YjasXrHwXVb9bd+FXizcnw+PAc2dmcu
 Zary9hedJSyMIhxMciKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAm8tqQ4Q9n1dv7n26Uf7Rl
 yRPlVYi+mRxfMc1G6Ezjx2WJM20EpXQZGZa1S74S4VUOkdFhtf87VyE3LbL7jFacEi+rbaKKT/U
 fNgA=
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_201524_771400_6B443C90 
X-CRM114-Status: GOOD (  10.29  )
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

The generic resctrl header include/linux/resctrl.h includes
linux/riscv_qos.h when CONFIG_ARCH_HAS_CPU_RESCTRL is set.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS                      | 1 +
 arch/riscv/include/asm/resctrl.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 31e536304972..96ead357a634 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22510,6 +22510,7 @@ M:	Drew Fustini <fustini@kernel.org>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/include/asm/qos.h
+F:	arch/riscv/include/asm/resctrl.h
 F:	arch/riscv/kernel/qos/
 F:	include/linux/riscv_qos.h
 
diff --git a/arch/riscv/include/asm/resctrl.h b/arch/riscv/include/asm/resctrl.h
new file mode 100644
index 000000000000..7d247d87dab9
--- /dev/null
+++ b/arch/riscv/include/asm/resctrl.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <linux/riscv_qos.h>

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
