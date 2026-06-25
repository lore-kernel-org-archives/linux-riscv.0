Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFCDCDE007
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 01:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGw/Ud8yQofr/Tu5nWGkzzwMrrJpP4WIpqr2vDnigTI=; b=HmOMS2F1CeNhe8
	zWgjRM/CX877ZNS3omBQ2wDErsgIMhrU6Rbs1R51w6sAdDMRcaxu9Ur1S98XG6rdVb6+fG7mvKXOd
	1jo9bszxy1Cd7tTPB42rX/Xph7l+iKTsj7OKsXv9DVKd+lS5tYJWJ8DAipS8bRLbFG/mE+l99Tso/
	0RAyCfgy7TGSiwssveknPdZzzFRzNRA2mtiSLDVTuidCw3JAj1ml6g62wFjUFyeUUfMJ9GuafnN6H
	u1dGhq+rc/f9TwJucV5EkjstnkuW11x26JFGCjjiN+J51ElJK0aI29nc80CJ33b24QtG7gjHLkfrQ
	JxHtHzeNc++atEgnSwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZ5L-00000008WQG-0RRJ;
	Thu, 25 Jun 2026 01:40:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZ5F-00000008WLi-2cJA
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 01:40:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 96F8B60220;
	Thu, 25 Jun 2026 01:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12B41F00ADB;
	Thu, 25 Jun 2026 01:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782351648;
	bh=we1gTaO0/mtl656AVrC6p8j+YxwIRlQ30Hze8NO4hO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kHHdih/CU4BYvohe7bZsMdnnuYPlL2wRO5CSPl9nFuBKnge5Gaah7uKJAIvb4pVsY
	 QpOPc3VJB6tKHPRe5tL4xM8bRykQ1D1zMX+1JyOz2DA7pMoVq76cuP9l1Fjz9Tezer
	 4lBxAcyk6V48uv+OePJKzkwKbuvCx/qQ783B8iWMhPFBHoZ5xjnDe/jD83nPf1Pj7/
	 0Kbl8ME19UFLp/RJ/XAUW8nAvayGSg3ik0gMZjPV4XoHCcSV0kojYJqqSycV9bTXgG
	 5cp5oRgaJqzlNL16vJef0f0qIU2R7uE7PYFZfclMJ/8dXryTN96t+bobD8CMS8XJK/
	 3AVV8UcmtpdYQ==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 24 Jun 2026 18:38:34 -0700
Subject: [PATCH v2 6/8] riscv: Enable resctrl filesystem for Ssqosid
MIME-Version: 1.0
Message-Id: <20260624-dfustini-atl-sc-cbqri-dt-v2-6-2f8049fd902b@kernel.org>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
In-Reply-To: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
 Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=991; i=fustini@kernel.org;
 h=from:subject:message-id; bh=+ionyFv9lurwwDiWw+ePTClCXdl69DtYgAkjTpcZ7Q0=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMWTZtEtLTP4s1/hc+fWGHXnXpZIdV244ylvzzPGWzZVr3
 T7scv+edJSyMIhxMMiKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAmso+HkeHbnV15VqETGC9e
 WP6q5JMUZ6Kf9G6BqT5M7EKcAQczDNYyMtz48p998wKmsDZV67Cu7CXT9zcrMSxyk7q2wdN+i+b
 8Ph4A
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
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

RISCV_ISA_SSQOSID selects RISCV_CBQRI unconditionally.

The resctrl filesystem integration is gated separately by
RISCV_CBQRI_RESCTRL_FS, a silent option that defaults to y when both
RISCV_CBQRI and RESCTRL_FS are enabled. Enabling the resctrl filesystem
itself stays a user choice via the standard fs/Kconfig MISC_FILESYSTEMS
menu.

Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ee586925f97227668c228b5481c05a2f914d928c..9c28bcbc29dc94fe9dd19b8a5c91816a2c75123e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -594,6 +594,8 @@ config RISCV_ISA_SSQOSID
 	bool "Ssqosid extension support for supervisor mode Quality of Service ID"
 	depends on 64BIT
 	default n
+	select ARCH_HAS_CPU_RESCTRL
+	select RISCV_CBQRI
 	help
 	  Adds support for the Ssqosid ISA extension (Supervisor-mode
 	  Quality of Service ID).

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
