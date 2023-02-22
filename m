Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7B5C64EC7
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KIHac3XdG0OUHpyVJw9QeMlaKCx/cSCi/Nw4bfAxwk=; b=BWrpNLUoQoaYAN
	N1pksryt5VwYu2SCqt4yi53yQB+yp5XIb8CcvgtxLOzd7SyVU0nTav0Y4+ffQOJwBxNpVFLbjSUs4
	Kl9qxnlNv1c+5WX6WTz3ClpGDMvkBxplvQ5G5vCl1P0S+iVk9tGHmWy/LTiZW7+Uszl7FwX1IZDwO
	sLd8FIuzv5QLRWM+0V3rXi5SyvVK4uYATJoojPsEkBZH7rJ/cPTgZ1zKa8cl/L8G49kEfYzC6/OuO
	u7JAwN0gjjLkvEE14X7M3Qf9ciQWxGgYW+bwg/QHwh+bKaAQuzIW9aM8x5TjaQLl8U7L8peb9rIwF
	aVGUXm0GwrgMc+mZluRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqc6-00CmW4-8c; Wed, 22 Feb 2023 15:00:58 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbl-00CmC8-PW
	for linux-riscv@bombadil.infradead.org; Wed, 22 Feb 2023 15:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WtYCVLbQm8neeYQ5TdiZJpKYlGHfnNKrqWs5ac11QSY=; b=cVRyqvLVwSkZJQ/BwFfqiJdGDI
	6qlO+mB+oW/Vf0Nj52B7g7RgnFGZj3DQlxhh5/PVV2xQZeXYUnimpMU7+LjcQlld1fPkef8+i6QjQ
	3/LGfhWVVjF12kxiekxF6Sp6OO8g21JJUvArOySm/wbvD+E5glalN9WVCTbSfQg/Zl6MMf3iskfq1
	QPJt+Sd2BMdty2rE27EHBZv7GYdpZEIiRF/0zfJ+9AbX6PNur9Z/9CGCCtUZkJpkCNVMJwIbBVKPs
	BR+v6C6OC7JL+/wZmAllDWCJAiV/kin8p4wpf+j91+ptQfKqXl/+1CpRcFIJImW31BwAHUpae6yY/
	GNOOZWuQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUqbf-00CZvR-20
	for linux-riscv@lists.infradead.org;
	Wed, 22 Feb 2023 15:00:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1BD35614C2;
	Wed, 22 Feb 2023 15:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B28E7C4332E;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677078022;
	bh=7r+PiGpQC/jPWvSvPp3U+a5U5bek3m6CH3EArNTd7Z0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hmj46h5FqsKYjWT0c+fkGLcvTAufr4S8vpNK/deuvZNA9+jLLfGAAofUmMDEAjDuH
	 v46t9i8z8Wb9tpwyMjB55ctt/t/8/aptG2rwtrkv9K76Sg2YsgXBiKmML3bcAwOVI6
	 P1LyhxpObORmoN/MaQ2+bpDmYCRtV+CfIoLD9Pkea7hWEYb77A+ROqAarvAhUCpL+I
	 lcX4fPDGaU1kh/w85WcXX5UOYwG4e+D+0/KFyVNKRKoRpThsf+zgYlyrImLE1ogxx8
	 KE6YYfdOm5BfpYRQBZrGjy9YX3l0MmULKSfXyTvrwWNbUUv0hA0t55/fScm5s9Oo06
	 kwB6hf1bTeOkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 93B33C73FE7;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Small fixups for the Zbb string functions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167707802259.24438.1077934966472416097.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 15:00:22 +0000
References: <20230208225328.1636017-1-heiko@sntech.de>
In-Reply-To: <20230208225328.1636017-1-heiko@sntech.de>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com, conor@kernel.org,
 linux-kernel@vger.kernel.org, christoph.muellner@vrull.eu,
 ajones@ventanamicro.com, heiko.stuebner@vrull.eu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_150032_291479_D69A53C1 
X-CRM114-Status: GOOD (  10.44  )
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

On Wed,  8 Feb 2023 23:53:26 +0100 you wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> I didn't manage to address Andrews comments on v5 [0] in time
> before the series got applied, so here are two addon comments
> that hopefully do his comments justice now.
> 
> 
> [...]

Here is the summary with links:
  - [1/2] RISC-V: fix ordering of Zbb extension
    https://git.kernel.org/riscv/c/1eac28201ac0
  - [2/2] RISC-V: improve string-function assembly
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
