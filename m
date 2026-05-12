Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D148BCD343F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 22:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOKA4e+HG8bYe7Umi8sFudrNebceSKelVJl0uRoZcGw=; b=4VP6cwsMlxUJlb
	ertfKDzNTeqfsdnFDMaDvHNtNrJG/FX17RRHs1e6lQreE4gqcniTHCc55kkc+Nf60D+eC0nz1dBD2
	JyrpyzjsiDnOgO35E9k6FdRq3pQNsLo7PQSXRaTsBMGNlJ71LH7O6VYKKpavdNX4dFeZIpiqefjvi
	x2J5QlbsffIbkLrcdurlq3tk7EM+DA00fZJlcoH6uy0I/1kRU8/zOGNtzjnzLjNt0JbcVc6zzeau8
	DXPvtuEHeO3IwSTf/f3Gn1UJbdvjVZvk4zNNVQRCtckcknBkENZxK2wqhxu9bHxNwAC+Xr0S+dBIq
	PpSQvg57NOGm/pL9Ubww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvus-00000000dNS-3r1s;
	Tue, 12 May 2026 22:49:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvuq-00000000dMp-221C
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 22:49:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCBAD41688;
	Tue, 12 May 2026 22:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1CFC2BCB0;
	Tue, 12 May 2026 22:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778626167;
	bh=RWEoYL90bzVZvVW45ld5wXheGmJKScbYfaB+fYsV3U8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=OWEDOZECHVyJqPG+aU0Nm3YBqY4sRG1rPct0AmPVnHwsmmsLUMtHqMFZGMaHZMdCm
	 y90TatDejFsBHjE7PzCQdVoXPWoiientLzj2Eg8qbOm9eaYDOtKkv2Uqw2OvaIAbqd
	 9HcAJCtqGKjLcOIrE93b9HkzVM+E7M0ncInaZkuaOShO52CLxWMW0NYTL3N3p186wu
	 ZDvzTLsvHRwmrD17sHCrXtxNFrbI2srDCo5eAqLDlgsUbNBsGiaA/KGPngVvaF24r7
	 NUnRXgVMdgBrSW/Y/9EouJNuGb3tqFQoSvn3SqMosFyOPm5JgUtRXmwPRfNNX5x4ea
	 vkfmMtK0Pz/yQ==
Date: Tue, 12 May 2026 22:49:25 +0000
From: Yixun Lan <dlan@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-riscv@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>,
	Margherita Milani <margherita.milani@amarulasolutions.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v9 7/8] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Message-ID: <20260512224925-GKJ3624147@kernel.org>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
 <20260511-orangepi-sd-card-uhs-v9-7-ae48c0b2b2cf@gmail.com>
 <20260512054358-GKE3624147@kernel.org>
 <agNdTiFbwtllEw0Z@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <agNdTiFbwtllEw0Z@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_154928_540493_CA6E90BA 
X-CRM114-Status: GOOD (  15.28  )
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

Hi Aurelien,

On 19:03 Tue 12 May     , Aurelien Jarno wrote:
> Hi Yixun,
> 
..
> > 
> > So, how about let's make it convention here, first device is emmc, second
> > is SD card, third is sdio device (haven't added yet).. We introduced emmc
> > early before this patch, so it stays unchanged which is nice for end user
> > 
> > Please apply this alias idea to all boards although I only comment in this
> > patch..
> 
> Having a stable naming is definitely a good idea.
> 
> What about boards that have no or optional emmc, like the Milk-V Jupiter 
> board? I plan to submit a patch for it, so I wonder if we still number 
> the SD card as mmc1 even if there is no emmc.
Yes, please

For Milk-V Jupiter, it has emmc slot despite plug the module in or not,
so it make sense to name it as mmc1, in other words, the board do support
emmc in the hardware level

For future board, if the board has no emmc feature design in, then I'd 
be fine with name it as mmc0 or mmc1, shouldn't be much difference..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
