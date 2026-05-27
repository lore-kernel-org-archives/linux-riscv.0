Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4864BCD5BD5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 13:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5K6UEnB0pxM9rS4h5XfwMZPerA5qg7HIizN1cYB2Gk4=; b=OPn753sjWqNztt
	L8hoqXYflaF3uPIczb0wPqHIFmFt7ccJi6lEAKpEMFFFUPlJtB4960voUKUZxhU7dy2Lh8FkNn5Up
	MphF0hA0g9zST/m3mmAvGcvXgDLP5HKn3OSH5V+IsKMx5n37a8A64cA1rE5V81v3iw+SoGnsRfQtK
	Nng3tBwSLLWC5MziKVDQR5YQmKXWOVvSvMBfJ8vJwwHhKJtvKwDwhHyXTn68U4U3Rg6ulgvlqaIu3
	v9+sS893Ir99l/oODmBR7UPn79XJ9pKiskyopXTA1ZevqPIPBgTyds412Nw5YKtTwTRb+JQ1B+FMW
	F3dgnSuXaR7Zic9pXQxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSECf-00000004BC1-3MtU;
	Wed, 27 May 2026 13:21:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSECd-00000004BBV-1HXB
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 13:21:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 432E3443C9;
	Wed, 27 May 2026 13:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A58B1F00A3D;
	Wed, 27 May 2026 13:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779888101;
	bh=FDMDIrmcq3pN6ji+eFw3Bj7u92MwtOzZi6x4Puo1g2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KmrgDbXyfxohnsGvaizzjntmJ5IgbFcGGHTsKOVxLVZhzz0Kcwe/FkXbB4oqv8k+k
	 R/OdKQDGkHBE7ocAMrIM0xF14w5KnYDeTfedljOTTBCkrokOG4JaaNkxjMKL3oXOSJ
	 5AfJBw6M2c1FT+Pb0VoxX0C57QyYCMEs2poijuK/9qcxYnO9qTqV3LUiJTY+FM0DHE
	 ePGEPZKdL/BwqQ+8qJRYjBRD7/QkFpogBaUurEWc/we4ZmGMUG/N4N8CxbAwITqaXc
	 A65SJ1zMWZhVADhbBdA4neHHnF/PERbqd5OGP1cfv008V9ULF9cnizVJh7axVQEquy
	 5KXfSSqhr0TQw==
Date: Wed, 27 May 2026 15:21:35 +0200
From: Drew Fustini <fustini@kernel.org>
To: MoeLeak <i@leak.moe>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] riscv: dts: thead: Enable Lichee Pi 4A WiFi
Message-ID: <ahbv36NnoOiUnM9S@gen8>
References: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_062143_370273_D7D6B220 
X-CRM114-Status: GOOD (  15.48  )
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

On Fri, May 08, 2026 at 07:44:12PM +0800, MoeLeak wrote:
> Enable the RTL8723DS WiFi module on the Sipeed Lichee Pi 4A.
> 
> The module is connected to the TH1520 SDIO1 controller, while its reset
> line is controlled through a PCA9557 GPIO expander on I2C1. Add the I2C1
> controller to the TH1520 SoC description first, then enable the board
> specific I2C1, GPIO expander, MMC power sequencing, and SDIO1 wiring.
> 
> Thanks to Drew for the detailed review and for pointing out the missing
> commit message, recipient list, revision notes, and patch split. This v2
> series follows that feedback.
> 
> Changes in v2:
> - Split the TH1520 I2C1 controller addition into a separate patch.
> - Add commit messages describing why the changes are needed.
> - Add revision number to the patch subjects.
> - Add MAINTAINERS-derived To/Cc recipients from get_maintainer.pl.
> 
> Signed-off-by: MoeLeak <i@leak.moe>
> ---
> MoeLeak (2):
>       riscv: dts: thead: Add TH1520 I2C1 controller
>       riscv: dts: thead: Enable WiFi on Lichee Pi 4A
> 
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 47 +++++++++++++++++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi             | 11 ++++++
>  2 files changed, 58 insertions(+)

Both patches have been applied to thead-dt-for-next [1] [2].

Thanks,
Drew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=2f60e351633044dee88b63fb1600e284d2476e9c
[2] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=a20241c08385c875c4d0deb6c8ffc15f13f5b388

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
