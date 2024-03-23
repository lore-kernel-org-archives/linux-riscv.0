Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A310CD11BF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxrb79hB0wvIVG7rt8vRGb5fC+Uz4a6eTIFrquTEdis=; b=udyeiBJ6N8rB9O
	CqwC33X/v2xdbxMi6zSv2uOM2MBZoY8EqCYmVjKDJg05U9xfdyOU8xLLDytTZmQUMhM2So8fRUR/h
	wKUlM54wZkPXde7oaocjQZgAgcK3Yfa4wh8w+9nUMck5LfJlM/C5bPw4+gt5P2L+RJ7SpuFCd7Sw1
	xxYVv4+ZJ8Yr2n5Tvn2AglsoDfrLT4zmSBPKekVokNYXmIbEpinUYbdrDQhhZhx9O82KI+/4RZDtJ
	jdmr4Svaly6JDQ9hjJmv6Axo3NJZT3Bwa/NUg+RT6GecoEnMSRMWReY9z3UtWipjbGTbxlYqLdvmu
	mq8M/KEIp/O78U/EUt7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0FG-0000000AKi6-1kb4;
	Sat, 23 Mar 2024 12:13:06 +0000
Received: from out203-205-221-190.mail.qq.com ([203.205.221.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0FA-0000000AKcl-2Igo
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 12:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711195972; bh=5MpYpfT0eNaGtEdlbvizvrZCBY0mWQjBXe0Ac37Um0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ekilKsN1Kmwni40C5x3g5mWmfqzTx2z/QyJ8cCGowm4lj+5cXXD6I8iyJsBdGC/XH
	 UMYlWZSgDvaTSfSJm6rmbJ95PV1l1sOnSNfFbaiack0hixbM9qwc3lWat3F7fAoN30
	 RBUFbxZUoRWj9G+dOp/6kDGL1f/EVTUhUP4842WY=
Received: from cyy-pc.lan ([240e:379:225d:8e00:b91:b2e7:7c69:8554])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 32594C7F; Sat, 23 Mar 2024 20:12:37 +0800
X-QQ-mid: xmsmtpt1711195969tpfdvk5ux
Message-ID: <tencent_F208A26B5338C6E14AC6648730368AF0FD0A@qq.com>
X-QQ-XMAILINFO: MyIXMys/8kCtun29cR78Yys0AwmqeM/v0G+9hjwKHKZ+XZCcWoA7laQgQFc7Hy
	 BA1slHKuzjwLNC3wTl3ktEYZYOb3H762Ci8JDR63DKdGBqKcH0IbYfGT4ihZdl4ETu2UdqFpEjYR
	 wS++nVOK/7CRT2O8Y89nQ3MiPCUjp0ZU9Eqa4MERanDXWCFAyhzMZ820RMD5eWio5w9baVeJMRwS
	 yUN3ItLKXkeWXpdANmBoTySpZTVPAaUuAnekb9P2HQLKLzcjIJ68n6RBVnIJcsawmwPzGsBl7FIh
	 3SC1nhsacLPq+UUAquvjTJUzX+JhHDde5h0VmFFf9CrdgiNt+XpoiFkx1JOFy7HQigl1VSwl/JXE
	 DpHsQx9oCddbAqLoEsUme5d1nMMwwj1oRkApwQBuKB/4INOlANAyjK1KU/iKllTUaGSG1rqxqRjf
	 azpgMzWS9eGckijsNwMwPfmA8C1vSjSld7muix5V20ww/ptnBGqt0jAfmBaZv6ACTqMNOk8r79L4
	 KkP73aqCSNKsvDXV4VEtbEUYnyHciHRhFgYJzqdgDvcaGPNYwVX5esaAlLG/9MPYEMdvEktCYCWj
	 lL48cmSqcYGicA24LHSSV5Q+YWfPOxNiOYGWdtfVzMB9kUskeJgPg5ZJuklcmMcvuKvhgfZ1KzNr
	 WnhDu5SRUMrqw5MWQhkFba02RHDI4G9u3u41XxBwLyHvARJos/WLU2x6lPwVWNFe1ee4q9RfngJr
	 p/nbZkCaIV/p3NAHS8qO5b8IM+zFqrQ7+p59pMNmAquUPc8RIiEYq2UZTop5F58cX7X/ZQH25ZSw
	 hmHjFxk9tFIuEOyvMxpDFdIGgLHk1XTK8i9Gslqmi10LsIIj+S8p1H338lFOpXPK+Pk7aG3SqOMx
	 HxYaHbjWTcWmJ78iUlsShJ/QHYKbBnLP7GkwJxdpFCQcJOGsf+YepPP39DbmWsLYf3SARzRQbL8Q
	 z27u7NB6ipGnDYK7xqb2rVDjRLUQ6KCJyO8peSaiuBzodVpzORnPkFMnLWu9LZDfnRmkbB9PcWWe
	 5Z4VvfjgMM6vxv2YcpJw8gAY1XuC8pF1lBRL2nIA==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v6 05/11] riscv: Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210
Date: Sat, 23 Mar 2024 20:12:17 +0800
X-OQ-MSGID: <20240323121223.1729328-5-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_051301_100588_3162E6C7 
X-CRM114-Status: GOOD (  14.68  )
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

Since SOC_FOO should be deprecated from patch [1], and cleanup for other
SoCs is already on the mailing list [2,3,4], we remove the use of
SOC_CANAAN and use ARCH_CANAAN for SoCs vendored by Canaan instead from
now on. And allows ARCH_CANAAN to be selected for other Canaan SoCs.

Then, since we have Canaan Kendryte K230 with MMU now, the use of
SOC_CANAAN is no longer only referred to K210. Thus, we introduce a new
symbol SOC_CANAAN_K210 for any conditional code or driver selection
specific to the K210, so users will not try to build some K210-specific
things when MMU is enabled and see it fails to boot on K210.

[1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@kernel.org/
[2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0a@spud/
[3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c46bb29@spud/
[4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb8655a4d@spud/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/Kconfig.socs                        | 8 +++++---
 arch/riscv/Makefile                            | 2 +-
 arch/riscv/configs/nommu_k210_defconfig        | 3 ++-
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 3 ++-
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 623de5f8a208..5710aee456ac 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -72,11 +72,13 @@ config SOC_VIRT
 	  This enables support for QEMU Virt Machine.
 
 config ARCH_CANAAN
-	def_bool SOC_CANAAN
+	bool "Canaan Kendryte SoC"
+	help
+	  This enables support for Canaan Kendryte SoC platform hardware.
 
-config SOC_CANAAN
+config SOC_CANAAN_K210
 	bool "Canaan Kendryte K210 SoC"
-	depends on !MMU
+	depends on !MMU && ARCH_CANAAN
 	select CLINT_TIMER if RISCV_M_MODE
 	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0b7d109258e7..294b2b3e8e6a 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -149,7 +149,7 @@ vdso-install-y			+= arch/riscv/kernel/vdso/vdso.so.dbg
 vdso-install-$(CONFIG_COMPAT)	+= arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg:../compat_vdso/compat_vdso.so
 
 ifneq ($(CONFIG_XIP_KERNEL),y)
-ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
+ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN_K210),yy)
 KBUILD_IMAGE := $(boot)/loader.bin
 else
 ifeq ($(CONFIG_EFI_ZBOOT),)
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 7e75200543f4..2552e78074a3 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -27,7 +27,8 @@ CONFIG_EXPERT=y
 CONFIG_SLUB=y
 CONFIG_SLUB_TINY=y
 # CONFIG_MMU is not set
-CONFIG_SOC_CANAAN=y
+CONFIG_ARCH_CANAAN=y
+CONFIG_SOC_CANAAN_K210=y
 CONFIG_NONPORTABLE=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 0ba353e9ca71..8f67fb830585 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -19,7 +19,8 @@ CONFIG_EXPERT=y
 CONFIG_SLUB=y
 CONFIG_SLUB_TINY=y
 # CONFIG_MMU is not set
-CONFIG_SOC_CANAAN=y
+CONFIG_ARCH_CANAAN=y
+CONFIG_SOC_CANAAN_K210=y
 CONFIG_NONPORTABLE=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
