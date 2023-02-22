Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B712C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sg5ZT0iFHEVIQ5KLtz/fiZbY1GbjH55SmaR4Um05kys=; b=KvUOLlS5C6hEyd
	G1DW79p8BDKo3y+cVOQ/usGTpgUp9I273qsO+s0SoZv69dGO2lfahUqK+uvFbY5Vp1AoxIzzZPEc3
	vxNeCfm+4D8rMHbbwJsjDBXVwSDdEIWG7rE5zB4jynTOeipjMlRLpMVrY7PzLvT/XacZusrLLgjbd
	etZ+bHd3N+CqP7XTDPZgfnLe3zm6dEZPMcUaKOrls2+tXk4sHnUMJp2vHXiYt4g5XC/ig7dFe3BkE
	DRXUiVkLAD95S4p3ty6IkPkfJe4mfrRc9g3DNfjZwwwmXZBo+RKg8v2OfMF9zwiq6J6q2iW043Lgr
	IijVxTFhOcfLqsonJmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbj-00CmB1-TP; Wed, 22 Feb 2023 15:00:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbZ-00Cm58-9T
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 15:00:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F328EB815CC;
	Wed, 22 Feb 2023 15:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30970C433D2;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677078022;
	bh=Yi3u5Nak6osibQzcfwjNbC7RplCrm3Sc03yEPeaYTPY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YHoxUi/oxGi3akT53+zNV7IFx8pNNqOa2WMcuRqjlMjxepTxHm8oYyfBFHIHpfkHN
	 6ZDH/l6NLrG2nCkGtST9QJCGEs8gf8tjFTaO80KGYadLy0awP0V/tDbT6f0/czvMz8
	 MMc5WLsQB6NcYB33Jj8oCXS9QAe/4gmyoIH+vym4Oq9N2osmBjZ1Drt656AT9jiwl0
	 IYrCjT+7XZuxiPP08rqtFjRD5ffDVR99j3+w9HjOgnHIqtew09Wjqu0O2ZiAFPwDrK
	 Z5M3La1yONKs8K/wBI4G0E3CAk/EZZh9GgK/k6s6VnO9V8vVNoiMQzF1hML/29YAbq
	 QYRiDETqoxADg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0C1E6C59A4C;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH RESEND] riscv: jump_label: Fixup unaligned arch_static_branch
 function
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167707802203.24438.3366600866397687013.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 15:00:22 +0000
References: <20230206090440.1255001-1-guoren@kernel.org>
In-Reply-To: <20230206090440.1255001-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, mhiramat@kernel.org, conor.dooley@microchip.com,
 penberg@kernel.org, mark.rutland@arm.com, jrtc27@jrtc27.com,
 andy.chiu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
 bjorn@kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_070025_487899_81A40E1D 
X-CRM114-Status: GOOD (  11.03  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon,  6 Feb 2023 04:04:40 -0500 you wrote:
> From: Andy Chiu <andy.chiu@sifive.com>
> 
> Runtime code patching must be done at a naturally aligned address, or we
> may execute on a partial instruction.
> 
> We have encountered problems traced back to static jump functions during
> the test. We switched the tracer randomly for every 1~5 seconds on a
> dual-core QEMU setup and found the kernel sucking at a static branch
> where it jumps to itself.
> 
> [...]

Here is the summary with links:
  - [RESEND] riscv: jump_label: Fixup unaligned arch_static_branch function
    https://git.kernel.org/riscv/c/9ddfc3cd8060

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
