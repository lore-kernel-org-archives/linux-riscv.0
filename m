Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317DBD3C52B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 18:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPSc/6Skn2qk+0/yABFJSPPTLLT24TPyUeikbD+yvaE=; b=z9KVcrGXkeMo9j
	dImmHgj5BKVrQtagIepFN7M1TwpoVn8Ac+CABpHNGVbmeR+Hqhw37XgwDePD+IeRy0mlSuB+fCBQx
	jwosnRKL7jGHp2WnQuwT+IV15JmIgziYITyxFSbFOG610ruNanEYvi6efZi+1DXQFh0qb0SXZHYWZ
	NUujrMyxHWrgNFKZUbO6RO/BWogKjBq8MqWxYXgYlPAxAX/9geTAwr9gKfOmwDEFSdZqW70ihjXw3
	tqzyFbXPQAIGeCJecrosZlzYhlGgjzBdw0zXowAkVm2/sg3z/cg6esdMtpxU0BTdWedCFdm1GdkZu
	MQrk0hd/CBUqTXes0kLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1VR7-0000000Fu6t-249C;
	Thu, 17 Oct 2024 18:41:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1VQ9-0000000FtyE-3eCP
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 18:40:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D94095C620E;
	Thu, 17 Oct 2024 18:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E4EC4CEC3;
	Thu, 17 Oct 2024 18:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729190425;
	bh=qvjSVmXApt+OQE+H6lxGBFGUUTSaK6dn4kka0YcowlY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o0idI10Y6PzhF/59mHZK4P3tIy3NWvTXiPz07YYePq5m2LxamnIhYdD/fusCC1faH
	 t+NFk5tGOaExoXhrmt2yMx9gBMnpdbEMOGqntReTaUHH4OaI6XpvFVDcZKAhanGPQe
	 CdyzBqsh9uMwSf9097SutPMl9M+4sS7o4IYiQVOO8DdFtr+NDlucWLR8i18t/WHzpD
	 fnvzjisoNpNbwoW1/EdzWi5bnUXy3inv4svdui8Hh8edE2BpUk9dEuMS6k5swXhjOs
	 nGfHJ6Q0blhBqsQgCuq4f+NorFtV243Qk0pOsXmnCAZ+pyWOIDmFFYIL+1XB+RxrGy
	 WUiAzV48vYlBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCB43809A8A;
	Thu, 17 Oct 2024 18:40:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: defconfig: enable gpio support for TH1520
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172919043053.2569783.17192374033073504253.git-patchwork-notify@kernel.org>
Date: Thu, 17 Oct 2024 18:40:30 +0000
References: <20241014205315.1349391-1-drew@pdp7.com>
In-Reply-To: <20241014205315.1349391-1-drew@pdp7.com>
To: Drew Fustini <drew@pdp7.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@outlook.com,
 heikki.krogerus@linux.intel.com, apatel@ventanamicro.com,
 hal.feng@starfivetech.com, geert+renesas@glider.be,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_114025_997951_75BC7D25 
X-CRM114-Status: UNSURE (   8.61  )
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

On Mon, 14 Oct 2024 13:53:15 -0700 you wrote:
> Enable gpio-dwapb driver which is used by TH1520-based boards like the
> BeagleV Ahead and the Sipeed LicheePi 4A.
> 
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - riscv: defconfig: enable gpio support for TH1520
    https://git.kernel.org/riscv/c/5fb0ecf73e7a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
