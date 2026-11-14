Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4060C606A32D
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 22:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z8Ltavca;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hq7PPnof
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=icRvgpy6ncqsYiBm4rM0x6tlb9EEQwmoVuszO5wUi2s=; b=Z8Ltavca4qTCJ7wg+dphTk0GIW
	s5tBgEIsXB/c22QCqji/nSNyhSCXPn3AXunYB/tBtQ9szwLzV7TUS0tWi/z1AMPn/3I9EsLY2Q/DE
	FS6kk/P1Ht79Ryi+g8kB/KRqpRzrfO50V6cPdXA9NZjxguyXUsJgZJkKA8wZbt/RjNid0875aY9im
	sgLfP/PAc8S2yCnqPLF81CXYYZY9PEjudAP376wf89Lsjoz8HybqGbXh1WgxpDN9v7fIAP+9aRTxE
	pdx9UK7AXv1745X0clM0NyRFihGuP0p2u2Iwlh71MN1NHPMChpalHZDXKIaVPgJW84l5gwN/+BKMM
	UXerRtvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSLtK-0000000GoHn-1Rk8;
	Sat, 14 Nov 2026 22:06:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSLtG-0000000GoGt-2L6l
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 22:06:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F09766129F;
	Sat, 14 Nov 2026 22:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D0A1F000CB;
	Sat, 14 Nov 2026 22:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794693989;
	bh=/P991hrat8Oyo1ahF3nHLHjy0OXonyBVwBgHfyd5wwc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Hq7PPnof6aKGxFU54DamFrHCpwhepSLvkDH8tDojH6S7CE1d/d1aSaAKsEYLApdYS
	 DZkV+z31y6qHtNId5jquSgNfQEOBbSyovtfxTXLGN00eqLiIiweyoasacp/kS1u3To
	 qz+sliGgxkFEb688FWyJRKAThIAD7CEQnDbJSau/z/6JkdlXjgS4B+y+5nj/7EIoxJ
	 ZTItr4KEsvYuU865gbQXYLLUl9cfVzSXQPi9yEg1YbgWi1i6N/ee4of7z8OCN/hQxh
	 dZTzXgzY4KcwoCzooF2OqjRX2BgAsXskY1Tu5LzniIg6L87Rx7SDA1CQGOKLsHNSxy
	 N19+c+YNLzArw==
From: Drew Fustini <fustini@kernel.org>
Date: Sat, 14 Nov 2026 14:06:23 -0800
Subject: [PATCH v12 3/5] riscv_cbqri: Make RESCTRL_FS available on RISC-V
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261114-dfustini-atl-sc-cbqri-dt-v12-3-6ef1f627072d@kernel.org>
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
In-Reply-To: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sunil V L <sunilvl@oss.qualcomm.com>, Tony Luck <tony.luck@intel.com>, 
 Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
 Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389; i=fustini@kernel.org;
 h=from:subject:message-id; bh=Kg6rpxTlJdkSj7yuiDdY4vBL3H2eoxbKJOWnbQ1hQmc=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWT9uJ0smt2dHL2wT3clf3Ykp23bz9vzp5pEJvSEbpU2s
 nr7OFeso5SFQYyLQVZMkWXTh7wLS7xCvy6Y/2IbzBxWJpAhDFycAjCRjL8Mf7hLQ9b9Ssx8FKm8
 Wuz4oeaIHfOmm7tl1729suxFraiZvjAjw+VtblJrhEUOTa0T2LTldK+4540lfFEa9g+Xbyo5vOK
 yOR8A
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enough CBQRI support is now present to enable ARCH_HAS_CPU_RESCTRL.
Have RISCV_CBQRI select it so that RESCTRL_FS can be enabled on
RISC-V, and default RISCV_CBQRI to y. RISCV_ISA_SSQOSID is default n,
so this only affects kernels where the user has already opted into
Ssqosid, and on those the CBQRI support is what makes the extension
useful.

This is a separate patch so that no commit makes RESCTRL_FS selectable
before the resctrl glue it depends on exists. Enabling the resctrl
filesystem itself stays a user choice under MISC_FILESYSTEMS.

Tested-by: Chen Pei <cp0613@linux.alibaba.com>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
Tested-by: Zeng Heng <zengheng@picoheart.com>
Reviewed-by: Zeng Heng <zengheng@picoheart.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 drivers/resctrl/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
index 0d7ca2dec308..ed2e4bedb21b 100644
--- a/drivers/resctrl/Kconfig
+++ b/drivers/resctrl/Kconfig
@@ -35,6 +35,8 @@ config ARM64_MPAM_RESCTRL_FS
 menuconfig RISCV_CBQRI
 	bool "RISC-V CBQRI support"
 	depends on RISCV && RISCV_ISA_SSQOSID
+	select ARCH_HAS_CPU_RESCTRL
+	default y
 	help
 	  Capacity and Bandwidth QoS Register Interface (CBQRI) support for
 	  RISC-V cache QoS resources. CBQRI exposes cache capacity

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
