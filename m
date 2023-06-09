Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0F6C7EE2E
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17mqWBjGt40w6hk86sPyCX1yjWGws09i3+9TClUVK10=; b=XxIuVI3xGt319t
	Ny2iRrUYDFHmxqwAG/fOO0h3ONS1JPlw36Gqxri2NNPpRkKdvY61cFucJszcSJx4G1G+XHjKNGtpY
	rLhFiu28G9+rAAr39p4w4VN4sba8tkh/kbI8sVKzZZJYJZONAM4Wlww26XHV2jPqeSMognhK7v+Iw
	md5r1pguSNJNYDl+BFSZiCEYrDdAFMhElREDeVPsnod5/wHrNwORwOwFWuh74XmS26dQ8TrcVt98M
	ecb+eGQQno9hgE7y+QLztt9JYVUSBYAyhIamuOkYnUf/QjeOExvW8ZcfRmRigcONVaxrrz2tQBKp5
	RGKQnFoWN9qtTj+A3zOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dRh-00DKXz-0E;
	Fri, 09 Jun 2023 14:50:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dRd-00DKWU-2G;
	Fri, 09 Jun 2023 14:50:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD71060FDE;
	Fri,  9 Jun 2023 14:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10975C4339C;
	Fri,  9 Jun 2023 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686322228;
	bh=Nn/01o7I0aVw4MTKlFdYuagk2aYV5y/tHfOUoSVHBx4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rKgW1rtv1jdX1vycZBtrCW65EiO7PtV5BcAmfWPGd3Ls4oagJX5F8i57AGF59j+BA
	 wS2VzG0ofupbmiRY9GJLWLiANRHfCid+o0c9C5xNEYpSicKmM19D9f7edu1Ha3/hiZ
	 D4dqkMrTvTrMNCMJS8LMN5VFCiMvP88VrtKy4eNfVc9JgcwYyY3RjrOd0Yyra2BXOf
	 y0KjpUi/o/IDPxBC5sW5ZzSi2WfZ2mnVGBtuq62WHWuneTX/Ey4oV5a1sjBs/0rfLW
	 ZYmsTODq/FysocmZjeNkC06a+v0RNz+FbWWhxoT2cw+cXw+Xmc4xePzljSKhzYRgTZ
	 oPcmdWuqn103A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DE47AC395F3;
	Fri,  9 Jun 2023 14:50:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next v21 00/27] riscv: Add vector ISA support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168632222790.22856.6029833581193982930.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 14:50:27 +0000
References: <20230605110724.21391-1-andy.chiu@sifive.com>
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_075029_834522_CF2B56D1 
X-CRM114-Status: GOOD (  14.88  )
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

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon,  5 Jun 2023 11:06:57 +0000 you wrote:
> This is the v21 patch series for adding Vector extension support in
> Linux. Please refer to [1] for the introduction of the patchset. The
> v21 patch series was aimed to solve build issues from v19, provide usage
> guideline for the prctl interface, and address review comments on v20.
> 
> Thank every one who has been reviewing, suggesting on the topic. Hope
> this get a step closer to the final merge.
> 
> [...]

Here is the summary with links:
  - [-next,v21,01/27] riscv: Rename __switch_to_aux() -> fpu
    https://git.kernel.org/riscv/c/419d5d38ac5d
  - [-next,v21,02/27] riscv: Extending cpufeature.c to detect V-extension
    https://git.kernel.org/riscv/c/dc6667a4e7e3
  - [-next,v21,03/27] riscv: hwprobe: Add support for probing V in RISCV_HWPROBE_KEY_IMA_EXT_0
    https://git.kernel.org/riscv/c/162e4df137c1
  - [-next,v21,04/27] riscv: Add new csr defines related to vector extension
    https://git.kernel.org/riscv/c/b5665d2a9432
  - [-next,v21,05/27] riscv: Clear vector regfile on bootup
    https://git.kernel.org/riscv/c/6b533828726a
  - [-next,v21,06/27] riscv: Disable Vector Instructions for kernel itself
    https://git.kernel.org/riscv/c/74abe5a39d3a
  - [-next,v21,07/27] riscv: Introduce Vector enable/disable helpers
    https://git.kernel.org/riscv/c/0a3381a01dcc
  - [-next,v21,08/27] riscv: Introduce riscv_v_vsize to record size of Vector context
    https://git.kernel.org/riscv/c/7017858eb2d7
  - [-next,v21,09/27] riscv: Introduce struct/helpers to save/restore per-task Vector state
    https://git.kernel.org/riscv/c/03c3fcd9941a
  - [-next,v21,10/27] riscv: Add task switch support for vector
    https://git.kernel.org/riscv/c/3a2df6323def
  - [-next,v21,11/27] riscv: Allocate user's vector context in the first-use trap
    https://git.kernel.org/riscv/c/cd054837243b
  - [-next,v21,12/27] riscv: Add ptrace vector support
    https://git.kernel.org/riscv/c/0c59922c769a
  - [-next,v21,13/27] riscv: signal: check fp-reserved words unconditionally
    https://git.kernel.org/riscv/c/a45cedaa1ac0
  - [-next,v21,14/27] riscv: signal: Add sigcontext save/restore for vector
    https://git.kernel.org/riscv/c/8ee0b41898fa
  - [-next,v21,15/27] riscv: signal: Report signal frame size to userspace via auxv
    https://git.kernel.org/riscv/c/e92f469b0771
  - [-next,v21,16/27] riscv: signal: validate altstack to reflect Vector
    https://git.kernel.org/riscv/c/76e22fdc2c26
  - [-next,v21,17/27] riscv: prevent stack corruption by reserving task_pt_regs(p) early
    https://git.kernel.org/riscv/c/c7cdd96eca28
  - [-next,v21,18/27] riscv: kvm: Add V extension to KVM ISA
    https://git.kernel.org/riscv/c/bf78f1ea6e51
  - [-next,v21,19/27] riscv: KVM: Add vector lazy save/restore support
    https://git.kernel.org/riscv/c/0f4b82579716
  - [-next,v21,20/27] riscv: hwcap: change ELF_HWCAP to a function
    https://git.kernel.org/riscv/c/50724efcb370
  - [-next,v21,21/27] riscv: Add prctl controls for userspace vector management
    https://git.kernel.org/riscv/c/1fd96a3e9d5d
  - [-next,v21,22/27] riscv: Add sysctl to set the default vector rule for new processes
    https://git.kernel.org/riscv/c/7ca7a7b9b635
  - [-next,v21,23/27] riscv: detect assembler support for .option arch
    https://git.kernel.org/riscv/c/e4bb020f3dbb
  - [-next,v21,24/27] riscv: Enable Vector code to be built
    https://git.kernel.org/riscv/c/fa8e7cce55da
  - [-next,v21,25/27] riscv: Add documentation for Vector
    https://git.kernel.org/riscv/c/04a4722eeede
  - [-next,v21,26/27] selftests: Test RISC-V Vector prctl interface
    https://git.kernel.org/riscv/c/7cf6198ce22d
  - [-next,v21,27/27] selftests: add .gitignore file for RISC-V hwprobe
    https://git.kernel.org/riscv/c/1e72695137ef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
