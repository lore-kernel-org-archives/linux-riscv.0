Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DDB606A319
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 08:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i33uRb4D;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UlwMq3tf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yk5S8bLuz98FQwlTwKreDfC0dsHRzGoWGY+9QiO4mGc=; b=i33uRb4Dl8k5/g
	zfT94a4YSV1WC7wgw2t16RL/OHOtTJ6NditVMmri/6el2qFgVzsvFITLA3PQzEl4GkmVI/lExH99v
	2KLK7sXREGLx6nPMJnu21qmG8obOYYWd+V+QGLnuaOMHUCsFsmfa3YW8FFloT2lnHYUlTWGB3Ianc
	Sx23qyyUaVvSkU3US/nRoAwHammLU6q++ajS+rKUjggP/j1wlGRngMEEzFNBLHmUku/y2NdH28H/D
	mLaM2Lumopxia2UYaO9a4RS8laDxljt8ubHbi5jce28dqasPL4V8uAV1TlfwnzdZuNpU0BVI9s6gX
	ZyNKnMsuzbCQeCt3htkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRmH-0000000BO02-1ho3;
	Wed, 21 Oct 2026 08:34:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRmG-0000000BNzh-1Ibh
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 08:34:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7138940A98;
	Wed, 21 Oct 2026 08:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D641F000C9;
	Wed, 21 Oct 2026 08:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792571667;
	bh=uu82sUWMY3UO2S+B1frGUyiwgloHLDcTt9LHkabvWD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UlwMq3tfgNeCGm0knE2NHd1H1nC/VHez6eYOyAov1+G7J3SJedstaNa8dWk1vi05/
	 DEVumOnzn4CUZr3JDoP/IWTw9vXaAAG0YxBV9evnOJcloOXZQX3y8wdqQ6NnBY4Hy1
	 +3o8Oiu4AP6++UxF5QL1CtdWk2MlGFk39buC+KJ8ib9Bni/PhRSLFOFU65rDvK2jS9
	 XSkuSn7WicBJyPromfIVJylErxjSc3M454U11yP28jjRjPHT/cUrZN2NPeYxmwXf1l
	 49bBPnPOmSCPUmS1PS8nXiqbGgsVkCuP3nEvOuWRoZYeLEaqJ8//5g/dyDLXVomaud
	 Pq27au8iHAKrg==
Date: Wed, 21 Oct 2026 08:34:25 +0000
From: Yixun Lan <dlan@kernel.org>
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: E Shattow <e@freeshell.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: mark K1 board boot devices
 bootph-pre-ram
Message-ID: <20261021083425-GKA125937@kernel.org>
References: <20261017180141.3477743-3-alan.tseng.cs@gmail.com>
 <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de>
 <20261019141752.2077207-1-alan.tseng.cs@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019141752.2077207-1-alan.tseng.cs@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Hung-Chun,

On 22:17 Mon 19 Oct     , Hung-Chun Tseng wrote:
> Hi E,
> 
> E Shattow wrote:
> > Does BootROM configure the EEPROM peripheral for access? If not, I
> > think the justification is weak here to include this.
> 
> As far as I know it does not. The EEPROM is only read to tell the
> boards apart, so I will drop the i2c2 and EEPROM tags in v3 and keep
> the PMIC, whose rails are set before DRAM can be brought up, and the
> SPI NOR flash, which the BootROM can boot from.
> 
I've confirmed with vendor, the EEPROM isn't configured or accessed in
BootROM phase

> Yixun, is there a public description of the BootROM boot flows, or of
> which peripherals it sets up in each? That would give a clear basis
> for which nodes to tag.
> 
The ever closest docs is 
https://spacemit.com/community/document/info?lang=zh&nodepath=software/SDK/buildroot/k3_buildroot/device/boot.md

but for bootph-pre-ram, isn't it about the DT nodes which needed before DDR
initialization in SPL stage, and should have nothing to do with BootROM?
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/bootph.yaml#L70

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
