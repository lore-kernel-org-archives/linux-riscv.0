Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D123C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSX9BeN7U1VNXv5UwQ00dsjjFya+lni72oA4xupfhXM=; b=BUSIvz9KUSdEeZ
	ltKN6MJ7EYG6ePTuommsQ6UxQ2CbCEF1sZ6JSrr23yBLfedQYllmaf3YD2U9gETHKLbjNnw+3g8t+
	Ea/BksTm/6eAYHpKoeHrXCf/YC4RrxKJaMmSDS84+SgE9fp4r4+ZxSzQYZwM2Gy/eHlWuAD7jzr31
	kQQ5d66DWagKz4YgwGpg8Y0KDPs2c/jg+IYr28a1mhxLogf7dtDUaZrHn95JoPh1cMR6wNAbaL/MP
	GfjRRbyTD3SGndH/dB9F+5Ej1Hjk+eb6CpBzf2DlvWmiw2hAieaOngd4y+eeHTL2twgsSSunCq6GD
	toRUUmN6DKyqZfOPgROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23o6-00BlHn-0x;
	Sun, 12 Nov 2023 06:18:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23o2-00BlDm-1y
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:18:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0612ECE0D85;
	Sun, 12 Nov 2023 06:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE71C433C8;
	Sun, 12 Nov 2023 06:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769928;
	bh=cuF9JM0r/gsp1vghHnzFT7BkfhIYwfHcWZhIf27n2xY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m3ZnNHPp3EJ0Y7agFTlRHB8X/PRo4qR3eYYHC7/GGu20rmlj22UU0PTGsvORZBD41
	 Z+EVPhN5T/bYe++fF/zfE0ELkpn3Rl+4JcZjYGnDj8dkve6+UH4nvo5DwIHyi5vocE
	 lEyIrJ7c07LGEPXju8fkDwtlWmfYYETHVZHKz0vDT4MojxgLB2IB9QAF+ZsLh63a03
	 pR2u2UEDc3ioOIihJNM3NSJpXwSI0R6vVBvEso2YO33TjSZPsiojurtrZ7sTarcJeo
	 6B4ZNSy9+D2Pazrrjl9Uf/Xtbmw46Z1+rZwN/cs4OQLG/0CrQeCn/UoGyKwwXBDYUl
	 mbwNziOgXRm7w==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 33/38] riscv: s64ilp32: Add rv64ilp32_defconfig
Date: Sun, 12 Nov 2023 01:15:09 -0500
Message-Id: <20231112061514.2306187-34-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221850_835579_89B517EB 
X-CRM114-Status: UNSURE (   9.84  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Follow the rv32_defconfig rule to add rv64ilp32_defconfig; the only
difference is:
-CONFIG_ARCH_RV32I=y
+CONFIG_ARCH_RV64ILP32=y

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Makefile               | 4 ++++
 arch/riscv/configs/64ilp32.config | 2 ++
 2 files changed, 6 insertions(+)
 create mode 100644 arch/riscv/configs/64ilp32.config

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3b1435bade49..d01f41fdf57f 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -205,3 +205,7 @@ rv32_defconfig:
 PHONY += rv32_nommu_virt_defconfig
 rv32_nommu_virt_defconfig:
 	$(Q)$(MAKE) -f $(srctree)/Makefile nommu_virt_defconfig 32-bit.config
+
+PHONY += rv64ilp32_defconfig
+rv64ilp32_defconfig:
+	$(Q)$(MAKE) -f $(srctree)/Makefile defconfig 64ilp32.config
diff --git a/arch/riscv/configs/64ilp32.config b/arch/riscv/configs/64ilp32.config
new file mode 100644
index 000000000000..7d836aa2fae7
--- /dev/null
+++ b/arch/riscv/configs/64ilp32.config
@@ -0,0 +1,2 @@
+CONFIG_ARCH_RV64ILP32=y
+CONFIG_NONPORTABLE=y
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
