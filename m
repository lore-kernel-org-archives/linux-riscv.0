Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE2BC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEuPUnp4l2/+essfhGfLnOAxI3ArwUEYL8gzaftSqwQ=; b=KUc6D9aLHgi9x0
	dsFgu19xJSS+NGwPNhZaAMbudi5aEtqvLwFPv3n3GSRpwnkiOq9FK8tv3RGijVgBB2rIRWVHqs6LM
	VyUzCzvDVa1KXByYjBfURrz+4OIkJ/8ZjlJ65O0O5fky+an0BClBqbJf41vpEG0vVkVVrXZmzlA5z
	fVIiadYR0pSW6QZSmGpGax/FFgtoYXLXPp6U+vdT5aWqwvMEEy3TW3NBHDm+MLC//Y6lI7sYYdBvR
	Vimfj1GFYcXeQ4C247Ll+IRbvi/A5swl9C4XhpmGzTdXBaAol91rUyWZbZ/v9DQUB5hFUnTpCONpx
	dk7yo/La0itE0KX3aU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdSf-00D3L1-06;
	Thu, 18 May 2023 13:14:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdSa-00D3JA-1n
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:14:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2433A64F4C;
	Thu, 18 May 2023 13:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03258C433D2;
	Thu, 18 May 2023 13:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415663;
	bh=AwoQnmBHOr8wX0BVa478M177ccT62CL+qVUXJhTICuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WGfQ4mTsDn9k0q6IINE7XDk0tKpDcaHJHIxootwL5i8ZJ0N7q3ng58l2ZjEY516m9
	 FKQw5tQCYBZakdMpIBAXpl2tc5W2YLS5RMM1pzt/wdz6TubznYeCa/b00k6pTNsDmR
	 sc6hIPHQvtW9muFdbki2SUqga9mE3IzTx9htIZf3NlWlEZ4PQum9xN95fiZrmzSEZ9
	 7OkUxnDfttaUxZJhhF2ZPadDhwpxojueC1k4ARxqVNlNJGOAruHtt4FtqbP1fMei9I
	 dF84cS/k70zpGSTYTyErDjUgaKm43y7gCp4bHwDDt79Ejta9aJeaugb8egsLEIIwzm
	 CL8SNUms7jvfg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [RFC PATCH 19/22] riscv: Cleanup rv32_defconfig
Date: Thu, 18 May 2023 09:10:10 -0400
Message-Id: <20230518131013.3366406-20-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061424_634000_44C1C644 
X-CRM114-Status: GOOD (  11.25  )
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

Remove unnecessary configs to make rv32_defconfig have a minimal
difference from the defconfig. CONFIG_ARCH_RV32I selects the
CONFIG_32BIT, so putting it in the file is unnecessary. Also, there is
no need to comment on CONFIG_PORTABLE; it should come from carelessness.

Next rv64ilp32_defconfig would like:
  CONFIG_ARCH_RV64ILP32=y
  CONFIG_NONPORTABLE=y

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/32-bit.config | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/configs/32-bit.config b/arch/riscv/configs/32-bit.config
index f6af0f708df4..eb87885c8640 100644
--- a/arch/riscv/configs/32-bit.config
+++ b/arch/riscv/configs/32-bit.config
@@ -1,4 +1,2 @@
 CONFIG_ARCH_RV32I=y
-CONFIG_32BIT=y
-# CONFIG_PORTABLE is not set
 CONFIG_NONPORTABLE=y
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
