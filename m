Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDB8C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Dec 2022 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ct8uMQUnhLca6spjTynk5DhY00pfwtl0D79Ad1AXjd0=; b=UzbB7MPVaJzWO7
	1XIkaLcWAY2NipdlAPQOWAkNTCluUQB4u4teUP3RnALHWirsbu7NYfeweT9jFS3JmiGFg9qu15Cty
	P1J1hoqMLPxe4PGuhazbmsfyNAjk4mR3q0O3uEb+dsxx7TxBRkmNaP/910NHLoSxYHhBZUh4J/Pc+
	uH1mo2QapCdxvtzK6g6D/ZQ+egwVdUQXOg0s7VK3laaWhDpmA7svVm7piHUMa3vzt4Gd5iu0f+QQ/
	HhBL6/3NuACRR8G2GqxfdtZ90fz0nCryZlCEqzA60gcQxyjqWy90ZcH03NqvJRz67OiGjCJRYDsQd
	wY6rkb2MZoh+oOsZaMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3wnq-00G9Ij-HM; Sat, 10 Dec 2022 10:09:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3wnj-00G9Cd-Mc
	for linux-riscv@lists.infradead.org; Sat, 10 Dec 2022 10:09:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 73ADEB828C8;
	Sat, 10 Dec 2022 10:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D155FC433F1;
	Sat, 10 Dec 2022 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670666984;
	bh=K/60DtPvcZdUEbYVaryyiSYpmJ4q6k25bcoqeghcm6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c1gonYSltysNYBdWo1OiUPJAX6nQDNh2VBFXTKSWFvM4XLcSZWi9uw4vkUCo33oHp
	 5ZwvePgedJRPeibXPM0DauEBUHlHvkKFI1hkkSiaoA4CI8NYysWcKH0GeIzNJzMH0K
	 eehfNuQZYYOYTqErRq0nT6cIuz/rX7499UcL5Pj+t5WNJngiN+R4ZPAvpEpWWaWZla
	 Rpimacv6DCkQwRj/sAXAJi9linKUxlj0lBc90p56MGv2xWgZREJX/UbY3YlYobrN7u
	 5HG5IF2K70DLgBga9GBvDLq/WLcwif82wrH8b8mCXyuTmFrC8aAKyZvSITaCVzKR8I
	 kZDPj/QyGxU0Q==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	conor.Dooley@microchip.com,
	guoren@kernel.org,
	andy.chiu@sifive.com,
	greentime.hu@sifive.com,
	paul.walmsley@sifive.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	jrtc27@jrtc27.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH -next V2 1/2] riscv: jump_label: Fixup unaligned arch_static_branch function
Date: Sat, 10 Dec 2022 05:09:26 -0500
Message-Id: <20221210100927.835145-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221210100927.835145-1-guoren@kernel.org>
References: <20221210100927.835145-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_020947_930325_A1F9F224 
X-CRM114-Status: GOOD (  12.02  )
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

From: Andy Chiu <andy.chiu@sifive.com>

Runtime code patching must be done at a naturally aligned address, or we
may execute on a partial instruction.

We have encountered problems traced back to static jump functions during
the test. We switched the tracer randomly for every 1~5 seconds on a
dual-core QEMU setup and found the kernel sucking at a static branch
where it jumps to itself.

The reason is that the static branch was 2-byte but not 4-byte aligned.
Then, the kernel would patch the instruction, either J or NOP, with two
half-word stores if the machine does not have efficient unaligned
accesses. Thus, moments exist where half of the NOP mixes with the other
half of the J when transitioning the branch. In our particular case, on
a little-endian machine, the upper half of the NOP was mixed with the
lower part of the J when enabling the branch, resulting in a jump that
jumped to itself. Conversely, it would result in a HINT instruction when
disabling the branch, but it might not be observable.

ARM64 does not have this problem since all instructions must be 4-byte
aligned.

Fixes: ebc00dde8a97 ("riscv: Add jump-label implementation")
Link: https://lore.kernel.org/linux-riscv/20220913094252.3555240-6-andy.chiu@sifive.com/
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/jump_label.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 38af2ec7b9bf..729991e8f782 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -18,6 +18,7 @@ static __always_inline bool arch_static_branch(struct static_key *key,
 					       bool branch)
 {
 	asm_volatile_goto(
+		"	.align		2			\n\t"
 		"	.option push				\n\t"
 		"	.option norelax				\n\t"
 		"	.option norvc				\n\t"
@@ -39,6 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key,
 						    bool branch)
 {
 	asm_volatile_goto(
+		"	.align		2			\n\t"
 		"	.option push				\n\t"
 		"	.option norelax				\n\t"
 		"	.option norvc				\n\t"
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
