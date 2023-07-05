Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F39FEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 23:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLjvBoAidXZixU73F8nn1vaEs0bW1tilguW5D7MWtHQ=; b=RBXkiOektj+EuK
	ZlgSilbzvE4N0isk0kMRtMWKUvEP37WILMpaoZLseNZzrKpxnoYI4P4gnKYUKNYCRFFrUyxELLous
	JPWrugulMp6KOrRHJ21jINUVgv5voON8wmc7KRUmacfbgbNJHY9GSw7FvtvG4/PLMjrKRlDljBDwS
	uTgdNSwoFM2/FCtld5PHMR+qqffIulfETsl6Tu3VEod28SxZXtbi/KSZneNQJHtAA5pjzqKfP3DFF
	F0jxKF1TLO5b2RwPDGHWLpNQyqgySJc1fbQKCXOHj/obLPrIdmAdhaJvStqVn6cONqgasr0QWh8N+
	BJ3i7wZY0RaQkyZEn9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHCGV-00HOO8-1G;
	Wed, 05 Jul 2023 23:50:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHCGP-00HOKT-2x
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 23:50:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CC27361824;
	Wed,  5 Jul 2023 23:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC4A4C433C9;
	Wed,  5 Jul 2023 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688601022;
	bh=BgODPXLPTsaU0wj68dFe2wWU/mnAmoYudmtTIg9uug4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aq+2KA2q3s3qQaEOMbkSETl+1X+mfs637M/CazsUgB4O2lm21KaVSxkSNcAwixCc0
	 SgTYm68ui15/f0GFRRZ++yRyK17iqs/kqqD5nA8yrFC1a70mI5Ygp+GD5az4U/ujdB
	 sD4uRZffzhEmiHhAs1dK5nZiLkXRW8/sjPpUXcM6iqk9AzpP1fHH6wip8FMHFhgjRg
	 yUo71RvQ0qEbMIqqrbWyMCnGjxv3mKTFek7KrCyi67lX95wy3H+WPsLbKXkIm9iKQr
	 mLWia703Eh0HuzmJQXjHEe2hp8A7k+dPBDvHFsp4mPfpgvlirV2iFg/w5IKxaY/5JG
	 wXxvj9iQvk2iA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9B68EC6445A;
	Wed,  5 Jul 2023 23:50:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5] dt-bindings: riscv: deprecate riscv,isa
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168860102263.23922.9146715518598128204.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 23:50:22 +0000
References: <20230702-eats-scorebook-c951f170d29f@spud>
In-Reply-To: <20230702-eats-scorebook-c951f170d29f@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 conor.dooley@microchip.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alistair.francis@wdc.com,
 ajones@ventanamicro.com, apatel@ventanamicro.com, atishp@atishpatra.org,
 jrtc27@jrtc27.com, rick@andestech.com, ycliang@andestech.com,
 oleksii.kurochko@gmail.com, qemu-riscv@nongnu.org, u-boot@lists.denx.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 palmer@rivosinc.com, robh@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_165025_999039_696C59CE 
X-CRM114-Status: UNSURE (   9.35  )
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

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun,  2 Jul 2023 00:10:01 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> intro
> =====
> 
> When the RISC-V dt-bindings were accepted upstream in Linux, the base
> ISA etc had yet to be ratified. By the ratification of the base ISA,
> incompatible changes had snuck into the specifications - for example the
> Zicsr and Zifencei extensions were spun out of the base ISA.
> 
> [...]

Here is the summary with links:
  - [v5] dt-bindings: riscv: deprecate riscv,isa
    https://git.kernel.org/riscv/c/aeb71e42caae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
