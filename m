Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4AEC25B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UH8W6kqPJYh5tpQC+z/YAoYSiDuMO7XcI+HHD6zv9cw=; b=Pw17h1wZwV8TLt
	3P65eAYXLzVSX8Xwv7GtLABz+nnkKI+dajP5m4gQexJ6TwMSiFYWnmNAAY6BB3Bl4b2UIgyDXSFsS
	zdv3YdctU1cwqHF53ngS9dcEVhpEjn5A9cLkwswG+4hQZYTvk5+SP9IfI1G4yQJlKX52VpvvH6wzM
	g0E79855NKyY3QCF0PIW9FoPvO1tF17Y+eTixdphuyWIorQJdVRzwdaVIPPsZKJJ3OMkObvSB5D+n
	ZJQACof5LXf5merA2J9D7SF2deUXjRYOAl6tiQTsPXl8pTlV1adbzr0QERS0Dz+g321Yce5lsbXaT
	Asxqud0E7fgDAj29KoYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vRv-00000004Rd8-3Gfc;
	Wed, 22 May 2024 23:32:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vRZ-00000004RRi-2MBA
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A68D62BFC;
	Wed, 22 May 2024 23:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5D32C4AF08;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716420743;
	bh=kpKPeLWBCjE5fgd+5cOKsD21nksUdXEMnnTmcz5+9NM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sHwzCwRNVkYZxwlprVtZrnp3/dsj9O9SfyPmCrFUvdoemahb42MxmJbr4Q62RVlU/
	 DXRYmKoTLfgyAdBv5rM/uENXk0rr/jzybEPmP/d+92DkkvhI1zQdbf8eAgAW7fF2ae
	 njUMhdcDMAs6I+aqvk0SCNCZvkmzo84aTLIzbGIEbqr/F54VXk6wQiHo34C2OIMKft
	 biV8uX8Xcon8i+loWX6K5f5ogbMgp+gEAg7y16IU+YYtx56CpxTCW7C/1AZ/O07Db1
	 EWxCcu1m+fpCU/zZG7bnJGkDlbFoVRWiCf+tjAX0OCrrR58w09KPPTvPg2IKrKtthz
	 edzoNxZUaSQXQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 99E31C54BA0;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4] of: property: Add fw_devlink support for interrupt-map
 property
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642074362.9409.8597055988913469203.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:32:23 +0000
References: <20240509120820.1430587-1-apatel@ventanamicro.com>
In-Reply-To: <20240509120820.1430587-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, saravanak@google.com,
 devicetree@vger.kernel.org, anup@brainfault.org, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com, atishp@atishpatra.org,
 ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_163226_081939_BA7C0468 
X-CRM114-Status: GOOD (  10.68  )
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

This patch was applied to riscv/linux.git (fixes)
by Rob Herring (Arm) <robh@kernel.org>:

On Thu,  9 May 2024 17:38:20 +0530 you wrote:
> Some of the PCI host controllers (such as generic PCI host controller)
> use "interrupt-map" DT property to describe the mapping between PCI
> endpoints and PCI interrupt pins. This is the only case where the
> interrupts are not described in DT.
> 
> Currently, there is no fw_devlink created based on "interrupt-map"
> DT property so interrupt controller is not guaranteed to be probed
> before the PCI host controller. This affects every platform where
> both PCI host controller and interrupt controllers are probed as
> regular platform devices.
> 
> [...]

Here is the summary with links:
  - [v4] of: property: Add fw_devlink support for interrupt-map property
    https://git.kernel.org/riscv/c/d976c6f4b32c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
