Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53D610A3D96
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 02:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UxRixR9hd2SEnm8wLRPTqaguNpNen1jpP9LXoCeS3qY=; b=kPSoC7PGvXs0nb
	mmVHR/voSI29pK0iwzd8RN5kxPus1pJPV4pr0x5wr5hSpflEj1exbZ9eLYNtad3lxZOrpBqU5E0/M
	GPlPds0bmUE6o1QmusIooLlzFRs/MUbsBXSfJoNvneoxSe179ny+ysjKbeXNvQdth8A5ek8wlZeOH
	NG3qg04zLHi0ET2CKp/1jbcB4cmJ+fWGvUnQOK8aJOx5rwLOGZNIdeuEWORl/esWxOjyixFOyRl4S
	++bbKKSHE+54Sn5GV/fc0i9g0LSdsnlSdB05xUOj4Z2LfQ2attUDJgliN6KFxrFLcWh4f/pBouykM
	Qt7oJQyo50Hz0bYfRuIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wa4-00000006WGz-1qlU;
	Fri, 27 Mar 2026 02:05:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wa2-00000006WGe-3fO0
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 02:05:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E44843E29;
	Fri, 27 Mar 2026 02:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C77C116C6;
	Fri, 27 Mar 2026 02:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774577145;
	bh=I3+vM76RROlsr5DE3W8ojD/qPlnILtB5bMHYIL9PoPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTwid/KSiNHM4qXkkQl/gCuBOZeRmvMSv38BMxA3i2PvATL2v4Y5RTZ/4rcSRzluu
	 YUXJqDp/INBj1YNOskVBKEvdw/f8fUr5OyKdrnqdFMzS6Yt8dfqwiuF0y5c/rUsiny
	 qnrV/GwY0+M9xNlw38WFPuSVp0mMRyEaN5PLJ1Ksrk8aK5l7BlprDLvNPwibICKJIV
	 ADszaELnHkRhgaf887LQCsokOwoJYwR19t0JyjtQ0Ql1A8viLIfRFAW3ghuTRz0SjJ
	 rSx6MajniJ6CeN6+6T84p5FdZRSugiDW9K4jvP2kRsGQ42DTpOuSLyEtPztUeT7qKe
	 knNLwxccB16nw==
Date: Fri, 27 Mar 2026 10:05:43 +0800
From: Yixun Lan <dlan@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dts: riscv: spacemit: k3: Add i2c nodes
Message-ID: <20260327020543-GKA847041@kernel.org>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-2-78f29c83d9ac@kernel.org>
 <acWxJNK_vZca_xCZ@zenone.zhora.eu>
 <acWx_31uT2ffcaSN@zenone.zhora.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acWx_31uT2ffcaSN@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_190546_932828_DB3D971C 
X-CRM114-Status: GOOD (  15.55  )
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

Hi Andi,

On 23:24 Thu 26 Mar     , Andi Shyti wrote:
> Hi agagin,
> 
> On Thu, Mar 26, 2026 at 11:22:31PM +0100, Andi Shyti wrote:
> > On Wed, Mar 25, 2026 at 09:49:25AM +0000, Yixun Lan wrote:
> > > Populate all I2C devicetree nodes for SpacemiT K3 SoC.
> > > 
> > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > 
> > this second patch does not apply on my i2c branch. I'm missing
> > some other patches on k3.
> > 
> > Can you please rebase it on top of my i2c/i2c-host branch,
> > otherwise I will need to wait for the merge window to open in
> > order to take this.
> 
> sorry, this has to go through some other path, I'm going to take
> patch 1.
Right, I will take care of it, DT patch should go via SpacemiT SoC tree.


-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
