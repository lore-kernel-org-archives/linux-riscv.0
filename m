Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FF7CD8C92
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 13:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xt3A7lRC/uKqlxGgUtrNVOqgMNygs2YcLyzLFsE9f2w=; b=RmuxptdDUVHBYJ
	kxItjkw4w+tMVCKzbxPcMD/85XYHRl5Iig09l6q2xkNLwdJ9sJ2Ynwk4a35dneLZ5IvaDq3qNbKqh
	ODxnzzcRmIRWDteIEW+R84h+zyDaIr/AhEPhc/GAKhj+us07jL5NjFIfjs6tmdAVXc588XBtAjGzN
	Y5PyX5p3+1K6rd8tDtViSDVgVyuWO2IUsAn0zJ5VxVlJPivEMWwihaf3MkHzPo1yYTuPkOYBrtBrw
	VOOgFsf7jZmOaPj2CVcr2ApWNIiLT+nHJ27jEm/PDmaIg3mwRhwi/eHutfu9Z11n7Yv0gtReuiep5
	xuv81BsSCFwmmEnXk0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwSU-00000005eP7-19xD;
	Tue, 09 Jun 2026 13:25:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwSK-00000005eMj-35ut
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 13:25:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C9724601FD;
	Tue,  9 Jun 2026 13:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFA21F00893;
	Tue,  9 Jun 2026 13:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781011523;
	bh=B6TkRhG5+Ds3utEFEpay7wCt0CilVZNJBgxZkSf2JNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BHyWudfKEQ5HKfEsW28NY7tSb9PYXVdivTFpunDHbLxVPSIxiOh4a8JONaHdlM7g6
	 8bE5kARvXLX99UKuBnXFEisOYBHBiC9WqMFwIYK8NSYFvEB35Yl5/2AFdljZbBorUC
	 JSWNpU1Yhbckk8uPtaRGcrPdmIKr+KALTvVWc7HeQeKqY5Belz4JRGQ9rO4FWRGDml
	 W+z2u6CABSxTR66AJrRulk6qt3phnOwtbnp5CXDggv3el7orB0ZrrKLAV+qdZjuBp3
	 /gO13JdV3Y0kHmUX0VzxB/S9bSAQtatmhk22TBFoac5C+wgMn6WV6dlpX0TuZeK0Iz
	 mmQAUy5jsS11g==
Date: Tue, 9 Jun 2026 13:25:20 +0000
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.2
Message-ID: <20260609132520-GKE3727415@kernel.org>
References: <20260602070257-KYC5031219@kernel.org>
 <20260609-pompous-imposing-dragon-fc18cb@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260609-pompous-imposing-dragon-fc18cb@quoll>
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

Hi Krzysztof, 

On 14:00 Tue 09 Jun     , Krzysztof Kozlowski wrote:
> On Tue, Jun 02, 2026 at 07:10:07AM +0000, Yixun Lan wrote:
> > Hi SoC Maintainers,
> > 
> >    Please pull SpacemiT's DeviceTree changes for v7.2
> > 
> > Yixun Lan
> > 
> > The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> > 
> >   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   https://github.com/spacemit-com/linux spacemit-dt-for-7.2-1
> 
> Please switch to kernel.org repo. Github is not really a trusted place
> and you have kernel.org account, so not sure why Github is still there.
> 
Ok, thanks for the reminder, I could do the switch in next merge window

For reason why I still use Github, mainly because I got kernel.org account
after taking the maintainer role, then never change the repo address..

> > 
> > for you to fetch changes up to 793cc54475b49b5b558902b5c13e4bfe66530a50:
> > 
> >   riscv: dts: spacemit: enable PMIC on OrangePi R2S (2026-06-01 06:32:42 +0000)
> > 
> > ----------------------------------------------------------------
> > RISC-V SpacemiT DT changes for 7.2
> 
> Thanks, applied
> 
Thank you!

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
