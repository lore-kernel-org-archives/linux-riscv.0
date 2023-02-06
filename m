Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BA6C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 09:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uCUwd3dKK1nzHMSnd3e1X5TmC79twRuxNpMAEkkHl0E=; b=LIk+yq9mCoRbJz
	fOJBFPIjAckYL/qxPilIihDZb3EzT68hUbe3dBEy1tGCpI7Te5ev6Nx3JjYVGkkyic8LcN2+qKWgn
	EcaCmAmaH7nLU+EMJGvZxNgqTqsZga4xOXqHwBykZSoWnxXVeH2XmEWF0ST70GWnMnJiYNK+fDuWE
	GOPqfv4eWXUMCIVOh/UKB52NNMo08znNvaJhAVgR2GRp0meUsYRulAKT55Oe91+fqMuA2HDtM4U0q
	VU8FnXAFkcWrFC/+HxVMhWW4/j0y0eYEz170Sl5qqtryibLh+zQhcfUFZEnp/X7j5I4LDcNGT2vEi
	q64IKgkjP2S/lkcHZQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxQm-007mgA-0b; Mon, 06 Feb 2023 09:04:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxQj-007mfp-0H
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 09:04:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 94FB360D38;
	Mon,  6 Feb 2023 09:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1236EC433EF;
	Mon,  6 Feb 2023 09:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675674291;
	bh=Ip3VDTZXdwcZk64rGGwgeWdelFU51lDl/YMAUsnvUpg=;
	h=From:To:Cc:Subject:Date:From;
	b=aFS05FMGfh3qQ5LM4bNqbd67zVrlY9Upy/BEiDO2/9TdeEG1XziYDqzA6e3OIVCtI
	 yS+dMQqizHqN/IMeLsT/kfgM7VQsvkE2KcmqVzT8vBJ+PTRKX7mn/JYLcUW4ebCMow
	 TYuy1sgdq1zcqotD/ccoQgomQ064AqgHd6bza4RZ1T8xMidmOsVVv6JgD4EkTku/JI
	 +OqdOES1nP1YcxQ8bqNO1lFa7amS8CP6+cWasE2NkcJOz+mtWyH1DhWv9ENTu0VT6m
	 sVvKhLmZMTsWXenpHuNSMqhjkmr0hv8YOOVShfy7KgCIvIoDs173YqNWfOBKDipMtN
	 cOPu93je5gDzA==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mhiramat@kernel.org,
	conor.dooley@microchip.com,
	penberg@kernel.org,
	mark.rutland@arm.com,
	jrtc27@jrtc27.com,
	andy.chiu@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	bjorn@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] riscv: jump_label: Fixup unaligned arch_static_branch function
Date: Mon,  6 Feb 2023 04:04:40 -0500
Message-Id: <20230206090440.1255001-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_010453_126580_76C52C12 
X-CRM114-Status: GOOD (  12.39  )
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
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
This patch is independent from:
https://lore.kernel.org/linux-riscv/87pmangqpt.fsf@all.your.base.are.belong.to.us/
---
 arch/riscv/include/asm/jump_label.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 6d58bbb5da46..14a5ea8d8ef0 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -18,6 +18,7 @@ static __always_inline bool arch_static_branch(struct static_key * const key,
 					       const bool branch)
 {
 	asm_volatile_goto(
+		"	.align		2			\n\t"
 		"	.option push				\n\t"
 		"	.option norelax				\n\t"
 		"	.option norvc				\n\t"
@@ -39,6 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
 						    const bool branch)
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
