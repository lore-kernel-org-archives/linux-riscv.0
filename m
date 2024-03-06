Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29C2C54E49
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 00:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCyYSb/6s7KasblUIcVtU7K9PSsvQ902fXV5iVPwU9M=; b=Rr3ESiGu5EzaDW
	TpCpq7/tBLd+EtZjkfSGIV4R36Qm2hDEVK1rgUvJE5JC/juHe/VtkHefTeC4lPlzYUaI3Oduyo4yi
	+cLlHNxm8s8h1f/8rf8GKDx2ghCK1Dlgou/sj0OYOgx3CllMiBusX9oZFXDurFQJUtmfAyJL2tCEb
	yTwfpUf5A4b1YPnFuAel8WYUprzeDRcVOn87hc8qWjRFI3whLMT17YlcSqtw/6ZGGnQPDWJp5kJzR
	+XKntd2Pi6N7bxSooBEK/4k2KY2ArJcZwJfWbxwMhye91ocUJWfGFBxJM2Tkb83h8PMYmXsi3Vsjc
	QvQIbIMt8BtSd+mX82bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rheqn-0000000FiqU-0ErN;
	Wed, 06 Mar 2024 00:09:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rheqi-0000000FinJ-1a0k
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 00:09:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D42061794;
	Wed,  6 Mar 2024 00:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA51FC433F1;
	Wed,  6 Mar 2024 00:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709683768;
	bh=2fa03Fx+MikuXDNEGUr3zWcS95fwkTs88Gg/2cdTurE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YtQ+bhiXVoEHKwIYSWA1+tfojkSFU+2ViRWsMEekRaUsZ3tJ/JaglwUq5yc1oACYe
	 tzqC1M6SZqn2XgParwIU3ZqG0a+F1V2GtTg4y5BNThNuxqEV0eo/Ii5LLaLDK3/esT
	 wcj7/ZuK6RfvKibeDIbOWszBjaKDpV2IPbZ4vhM6uSYxQGQTQ+OVMYyE8XF0KqiZYq
	 mqDDT5br2zA40qtqM1wAkVKUDmu4ObPQtczwlZTWfr791U0Pk6mK/1AaOjz+a2i71N
	 aRbAsMnxDCDjR0nsH1mS8+Nz9HTlakoj4KcR/cCmWvuRjBU9boqf69xg8NqQ4K2qsR
	 xPC8rBknV+1+w==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Yangyu Chen <cyy@cyyself.name>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3] riscv: dts: Move BUILTIN_DTB_SOURCE to common Kconfig
Date: Wed,  6 Mar 2024 00:09:19 +0000
Message-ID: <20240306-daringly-exemplary-defc8d51f0b6@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_88FEE0A2C5E0852436A2F1A1087E6803380A@qq.com>
References: <tencent_88FEE0A2C5E0852436A2F1A1087E6803380A@qq.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=908; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NlED+MmuKp0K0tdEJC4UOM/foaT2Vdyi4yXugOQ8erg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnPtxhcONulHshobbr6nGnuZ7V1T/QXNiXWzjcsiJT7v 6T+3fXvHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjISQGG/7nXVpxIzfvravsx +47UCZkbMx7w7exZVHavZOLZn9dNWD4wMhx5/P+U4KtHjpwH5lQxBYos2vnkfcelMFUBwyUbXf+ 2d/ACAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_160932_636306_ED288EDF 
X-CRM114-Status: UNSURE (   9.36  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 28 Feb 2024 16:52:54 +0800, Yangyu Chen wrote:
> The BUILTIN_DTB_SOURCE was only configured for K210 before. Since
> SOC_BUILTIN_DTB_DECLARE was removed at commit d5805af9fe9f ("riscv: Fix
> builtin DTB handling") from patch [1], the kernel cannot choose one of the
> dtbs from then on and always take the first one dtb to use. Then, another
> commit 0ddd7eaffa64 ("riscv: Fix BUILTIN_DTB for sifive and microchip soc")
> from patch [2] supports BUILTIN_DTB_SOURCE for other SoCs. However, this
> feature will only work if the Kconfig we use links the dtb we expected in
> the first place as mentioned in the thread [3]. Thus, a config
> BUILTIN_DTB_SOURCE is needed for all SoCs to choose one dtb to use.
> 
> [...]

Applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: Move BUILTIN_DTB_SOURCE to common Kconfig
      https://git.kernel.org/conor/c/2672031b20f6

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
