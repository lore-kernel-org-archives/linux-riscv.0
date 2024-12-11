Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DC4E77183
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFMDZ8GNJ+u0N5DUIWm+wkdDRFwictxz36cxQR0kk5Y=; b=OU3uZMuCx14MvK
	3iOuFJGej5+XDTEt6p9NTVZc+GwL+dfdZHZ1JYQIGpaxPLj7hz0QXNBCZJEEcC5y7ejgpeIYFu0jJ
	dQUJ6rX4pedzcr4nQHCVVUA7Ns3TeOCzqtOL3f8bzeXvCtmZtz3VnoqsPfmPElmmuWbaFAzgde9Ku
	nf18kO80qUBSDq92AykXkb4yKJTudtj2B5Yulmd//b35nTDgvtZXMMvV0DwbkKwfrC3EjnoKc6w9O
	3wVE+jzw6UlLFKAfkvvvsgvnxtBEnQj479W45vM0Qu9LIGx3rOmbgAERxB9hHAu7Ui+pwV4M7ssI9
	kviaTxqpayiuafkAqFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVM4-0000000GMuD-1lra;
	Wed, 11 Dec 2024 22:38:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGA-0000000GKg6-1ma8
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE5F25C6474;
	Wed, 11 Dec 2024 22:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79A4C4CED3;
	Wed, 11 Dec 2024 22:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956366;
	bh=obLml54yrC6BtPAvZAw6oHrG+DacnU6UkXbWYex96uQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=f3Y1qtdQGdMFCfSboCawizXobcUgw2E7uyX0u9TS6LZTranNNUaLvizV5M/uf4JVv
	 6wdmmp8rH+8i5m7TDTkpBHaE/I70OTc9JhThdUfSx3tMET3XZRz3zgJx4jSrVXJ6HK
	 dTPyhioPrnGp6zxdsD3eF4F8YZQ3I5CjQKcrRg4ZBz9eHhfjQUrDsJPYq9LRO/KTCg
	 T7m+GxeewLN/pL8waq9uyekOdC5ANOLUDgb9UavzspL2WMo2wy06I2tG4Z/xQIBh4E
	 z0ntxLpzXUXPJVxWipK8pwZUYY/lL+bSO3CqM3XaUNyCzVMe2gbJnloJauVfuRTHGa
	 jdVL399dsPxRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CCE380A965;
	Wed, 11 Dec 2024 22:33:03 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/10] riscv: add initial support for SpacemiT K1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395638199.1729195.1529576042123666894.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:01 +0000
References: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
In-Reply-To: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, cyy@cyyself.name, daniel.lezcano@linaro.org,
 tglx@linutronix.de, samuel.holland@sifive.com, anup@brainfault.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, lkundrak@v3.sk,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, jesse@rivosinc.com, conor.dooley@microchip.com,
 inochiama@outlook.com, zhangmeng.kevin@spacemit.com, jszhang@kernel.org,
 matthias.bgg@kernel.org, kevin.z.m@hotmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143246_529778_F2600F82 
X-CRM114-Status: GOOD (  11.01  )
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

This series was applied to riscv/linux.git (fixes)
by Conor Dooley <conor.dooley@microchip.com>:

On Tue, 30 Jul 2024 00:28:03 +0000 you wrote:
> SpacemiT K1 is an ideal chip for some new extension such as RISC-V Vector
> 1.0 and Zicond evaluation now. Add initial support for it to allow more
> people to participate in building drivers to mainline for it.
> 
> This kernel has been tested upon Banana Pi BPI-F3 board on vendor U-Boot
> bootflow generated by Armbian SDK[1] and patched OpenSBI[2] to enable
> Zicboz, which does not in the vendor dts on its U-Boot. Then successfully
> booted to busybox on initrd with this log[3].
> 
> [...]

Here is the summary with links:
  - [v5,01/10] dt-bindings: vendor-prefixes: add spacemit
    https://git.kernel.org/riscv/c/7cf3e9bfc63d
  - [v5,02/10] dt-bindings: riscv: Add SpacemiT X60 compatibles
    (no matching commit)
  - [v5,03/10] dt-bindings: riscv: add SpacemiT K1 bindings
    (no matching commit)
  - [v5,04/10] dt-bindings: timer: Add SpacemiT K1 CLINT
    (no matching commit)
  - [v5,05/10] dt-bindings: interrupt-controller: Add SpacemiT K1 PLIC
    (no matching commit)
  - [v5,06/10] dt-bindings: serial: 8250: Add SpacemiT K1 uart compatible
    (no matching commit)
  - [v5,07/10] riscv: add SpacemiT SoC family Kconfig support
    (no matching commit)
  - [v5,08/10] riscv: dts: add initial SpacemiT K1 SoC device tree
    (no matching commit)
  - [v5,09/10] riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree
    (no matching commit)
  - [v5,10/10] riscv: defconfig: enable SpacemiT SoC
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
