Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50567C54EAA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 03:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pINp/oPRXXUWcu/qktPbHc3XbZNYSv7tex4d2gnug8M=; b=BG1JjeUURPAjku
	9jOgE1DDC/t8mgHltm+4c3tCR5OIBaU1xN9xUnG411zuy89yqXpar52sIiNuv4loUtvYx7U9w9kSN
	Is9gVKsGBoYJOhYXWoVMJPgWeEq2oBL6XJw2NJq7froOUQ/YPRSm5XHrdxkZjt2mukigC4hTExE2q
	FPXB7aIjJCpIODHMqHD5tAR7CIypzLnpVBbLYptZqn8BZzu6dCOE2r6LX82yTQilB7cspJBoKVcZG
	JXg7otPu94W5Hz2asso8YPUMv+hHiZfDSJ6V91Lt986+31DD2AAi2+Opis253OEnuygEGgpUsTeA9
	RJexjriRwIun4QNbBTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnp-005x7H-BE; Wed, 25 Jan 2023 03:50:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnj-005x2t-UX
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 03:50:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D2386141D;
	Wed, 25 Jan 2023 03:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9869C4339B;
	Wed, 25 Jan 2023 03:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674618619;
	bh=BCBDe2HEosCx/RXMsseb3rVkQJqJhwtOnUSgRqYzqRQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cncpx4FVgJNTVUcIusX6I5guPvbp0fWLxhE6k4zu1C2Umh4ByA3oDAMgwhCCVKnad
	 HtR25VMLDpZy4DM14mNm+AilF8GlAlTTOVt3HJ8hJymDxTfZS5XZ0nuRdhL+IjRoJq
	 CL0vZVP3tS31J5tPKk3SS/JO4EhPa8WIms5DSZIRJ245E0J/dZS9OLQcpxpLQSwLTZ
	 SdcEIyqn8vzo7zrusHPExTgA6nAAbPuO/28WBUztPJqAqSHTBhjxWHezt8pY7K9WHj
	 Wz7F5vz+CCt9NDBUlGjOLXUmoi90PFrd1UhWMmXV4pZ14pMrrWH1MUebthIdmEjO/P
	 8dWHy1goEmVlw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CE269C04E35;
	Wed, 25 Jan 2023 03:50:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: fix jal offsets in patched alternatives
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167461861884.411.2959496781990472362.git-patchwork-notify@kernel.org>
Date: Wed, 25 Jan 2023 03:50:18 +0000
References: <20230113212205.3534622-1-heiko@sntech.de>
In-Reply-To: <20230113212205.3534622-1-heiko@sntech.de>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu,
 ajones@ventanamicro.com, jszhang@kernel.org, heiko.stuebner@vrull.eu,
 conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_195020_045850_7558ED00 
X-CRM114-Status: UNSURE (   9.72  )
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

On Fri, 13 Jan 2023 22:22:05 +0100 you wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Alternatives live in a different section, so offsets used by jal
> instruction will point to wrong locations after the patch got applied.
> 
> Similar to arm64, adjust the location to consider that offset.
> 
> [...]

Here is the summary with links:
  - riscv: fix jal offsets in patched alternatives
    https://git.kernel.org/riscv/c/9d5567ccf96f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
