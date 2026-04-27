Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA095FF8868
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 19:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=28X+jUtJktO9ZVkMdwJO6oyXRTwzVsaY00PoU1rUR5Y=; b=bNnlB3wokNAowF
	o958DRxuqqFJ8uBBzEAExDbw8sF7OWuLv1Tm2tWiby7IcqMshx5meZXd+pzF1fXQg4ga4wkWyt3sV
	9yjFvGnaWxD/FVSWvtqmBoiSiHHhBH6cJWY7aaqssq600bPN825Mw+a6ssD9NzX6fUlC7H3e/qPZz
	ZgqjfydeJ2caAjfEd+k5xo445prkuvTao1Tybkx0KmaEeghQjKtyle2SrhR0VdvOaSypYuUh9S0RS
	ABNfbrZKLibJ/wf5zAW3ap18mSBHK3avMAFYiUiQOchnwBcUGOsUZZMK9dK01Oot1FGXpZJgOChFv
	xzxH0ESX3C1JnTsbblug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRP8-000000002ax-3usT;
	Mon, 27 Apr 2026 19:14:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRP8-000000002ar-0HqV
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 19:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 809E060138;
	Mon, 27 Apr 2026 19:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C36C19425;
	Mon, 27 Apr 2026 19:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777317241;
	bh=FNoY1C0U6boXclOEA8AD1sZ7Ixfc5mVFp0nECyezhGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ifxkMyCUqNLKS7bPGeOXGNZhFevu5edwAj7O1Ig9HeAwR8DnvPJq2EpbkejRmTmok
	 mBMC/No/dpGsWRMx1KUoMD16UY08744MqqNxtL/58ysOrWLzohcy1m8Bs8Q7iuZLtv
	 TdyLu4MPqRs0neyfcVmM/bv5XBjFwYM0W7NCQs+B3sNkfjn1C8iuEMIxODF2LOsUbk
	 g4Dy/3+OnA9QWEMotMjQWjGYZWsjYoUpoFxf/wtY23yJ464yd15do3H/hzVAbG9EoD
	 tQY2MnZsEZwWHuUIQSYz7rb4VeyMkO2FBFeZ2/nQn73Nfiz/ZgTM2gYIr5IJUZY9Lb
	 IwqJh+B7L7K1Q==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: microchip: fix icicle i2c pinctrl configuration
Date: Mon, 27 Apr 2026 20:13:54 +0100
Message-ID: <20260427-ambulance-mushy-f159dd1abcec@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420-blinking-unselect-955dfecfa26c@spud>
References: <20260420-blinking-unselect-955dfecfa26c@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Dg4dywRqTrnpI4j+vS3SL6FZpIx3omqFNmOsxnBKuXQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnvtxbyy1f8Tjn6r+zwPZPpd3bLXOExcZji+sg45mrah CJzp49WHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIdCNGhlepFXKnVwWtua5q VSxYvMhS/W/T6cKj/afWnJl47VB5Rx/Df+evCXc0i9cz1srFvf08YeN743X60eLf9HI5ly9b5Mf CyQYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

On Mon, 20 Apr 2026 12:14:31 +0100, Conor Dooley wrote:
> Unfortunately, an erratum with engineering sample that I was not aware
> of was exposed by adding pinctrl configuration to the icicle kit.
> When routed to MSS IOs, i2c signals are never anything other than tied
> low. Being an FPGA, a Libero workaround for this problem was created,
> that involves routing i2c signals to the FPGA fabric when the MSS IO
> option is selected in the configurator and then back to the intended pin
> using the debug "fabric test" capability. This is invisible to user
> facing information in the tooling and not mentioned in reference designs
> documentation. It manifests solely in the .xml output from the MSS
> configuration that the HSS firmware uses to configure the device, which
> Linux now overwrites using the pinctrl information. As a result, I never
> noticed this.
> 
> [...]

Applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: microchip: fix icicle i2c pinctrl configuration
      https://git.kernel.org/conor/c/0df8aa2b9aec

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
