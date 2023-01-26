Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D76C05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 17:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RiP9pw4wQ9QDnBmgChWSnYo06yoGOrbISzAPyxkFrSE=; b=HPRIcJMVOhk/4D
	fvVq2kj7F6JQMnJIVAcmh3KfC3ZOOIyXpMPMYjPew17l21y1f2Dx0eO669/zpt3PjajtE+JnmmMk8
	n3D+BCtUv1FGfzHwfFsNICNS+o1fNtV4EPDLqxkGW4jQxy8iaBn24FFBTQfJJtdtp2JPYt/VwfUBn
	Q98b3d06KRECx1E4kvyLREHEsaXQ6nClVFqsuQkSSbiEZ9a7407GHzgd1A9QcmVEgETPkfZIrrM5F
	OzwCrB0LEprmA71dUPfBQdEkjiVn96E00sXyGd1nD7kv37VwFTkB4GjSX2dJL5BOEQFUUHNfQj2qt
	wm1n00h+1p88nWziF8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL5hj-00Bxik-F6; Thu, 26 Jan 2023 17:06:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL5hf-00Bxgi-L3
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 17:06:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D484E618F9;
	Thu, 26 Jan 2023 17:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7439AC4339B;
	Thu, 26 Jan 2023 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674752782;
	bh=ZvStsc5ZtEWBoYSz9j8G0L0vCieAFt37Hxf2WaPKWWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rb/s6IV3YcxZ4VRJQvCzKHhmseUDBTzSjrE4vMAt2T4RfuOHyH99josgXNwDAZjk4
	 1n5ppRrKyBdEeLEItArSfRfL6vt0zUqPslv/sjyaNQ3aZErHap+aFy6ZdotoNNvoat
	 QwlhZeArvCbJIUdm73XaXSsSQhDQb3MRgN6kcBHAtHRPvIyGr1c2DnKfQaO80IVr+L
	 j/OiOfCE8Ot4T9ULk2AvtHmiLQIFvtCiUuBV5Hg1G/V0GKIucx7skHdI7+9cnVwuuy
	 ECWwGY51kbg8gm6e1YjyOi5bALvymqIfMByitwME+oq9LKdcrCw4ONNLkt69NeB62n
	 qWp/MSASdtLdw==
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
	zong.li@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greentime Hu <greentime.hu@sifive.com>
Subject: [PATCH -next V3 1/2] riscv: jump_label: Fixup unaligned arch_static_branch function
Date: Thu, 26 Jan 2023 12:06:06 -0500
Message-Id: <20230126170607.1489141-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230126170607.1489141-1-guoren@kernel.org>
References: <20230126170607.1489141-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_090623_760059_8BFA5BFB 
X-CRM114-Status: GOOD (  12.97  )
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
