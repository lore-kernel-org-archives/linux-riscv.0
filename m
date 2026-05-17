Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534E1CD37AC
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 06:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFZomi4TCV/nCIhEyoieSYr7vc2BBSC5ZqVzhtjXjU4=; b=Nd+9vro4T1nU+c
	WSnC7YgJgwj2+jSO7sW2rGBgNG/BnJpufQWghgQS629tovs9x2I96OoDFFXxrKmgIxnjaPbna4i3Y
	zxRwQnhUBWm3TXpbLxlbaaSfAIZz0liPeP9RU0inH/b1ARbf6CiOHcqr+Dunea/gXIOmobkpEF24e
	WY7b4+jh6EJkOXrsfgi8P1a0LaQCLjg2nHdbv7ArxCZSRhHCPBebZAHqkfQNYwckaSlYUV5Hc6NBB
	APGPgupURXk3q3wItNkeLsntqcg3yvWwA5HE02IMhgiQqUvwmkKcMFSXuIbclKJP3VT+QsWZvHAH3
	CK6CqYZvz1RfrN1NvGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOVQO-0000000CFkZ-0KwU;
	Sun, 17 May 2026 06:56:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOVQL-0000000CFjO-3u6G
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 06:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F09A240464;
	Sun, 17 May 2026 06:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B4DC2BCB0;
	Sun, 17 May 2026 06:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779000987;
	bh=WfJI8//0rNc8Gw4ik+Cx70cFrQE8E/tdr3m42LSQEVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJRNQK/oQM8kuyyNA4wjJHym5YtDnZVlBwMOJyxzo8aM+fFZojqbCm/sHxzKbdYRh
	 qcBaa4t7pshXyYaAdUJLWt7yiPWaK4qbb5b32PRpQFjm6zY1kYMN53mf2Ch4irsbWq
	 J5NhJWN99E9piS/PziKuUJMwAWsl36pJ3bJdWezBf/hQrUcNPj836Z/rSYIltA0NTR
	 d+K1QCW04pAMjTXfAybV0udAhC1wL9MHUJVSpdfkrQV2QGPTcRP23GEk9kcd7Wt3im
	 Ro3Ar4duQrLvB4uO6wN5i4vVsEgikrveNInZ0mUAIGXvu4asFOcBLJXN9WiA70zvxt
	 6JTTj+f6tfE1w==
Date: Sat, 16 May 2026 23:56:26 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 18/18] riscv: enable resctrl filesystem for Ssqosid
Message-ID: <aglmmkHKTlt9nhwq@thelio>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-18-eb53831ef683@kernel.org>
 <20260512225649.4A949C2BCB0@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512225649.4A949C2BCB0@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_235629_988990_4180A4BC 
X-CRM114-Status: GOOD (  17.33  )
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

On Tue, May 12, 2026 at 10:56:48PM +0000, sashiko-bot@kernel.org wrote:
> This commit updates the RISCV_ISA_SSQOSID Kconfig option to select
> RISCV_CBQRI_DRIVER. It conditionally selects the driver only if
> RESCTRL_FS is enabled, aiming to keep the filesystem as a user choice.
> 
> > RISCV_ISA_SSQOSID selects RISCV_CBQRI_DRIVER, which in turn depends
> > on RESCTRL_FS. Enabling the resctrl filesystem itself stays a user
> 
> Is this description accurate?
> 
> The driver configuration shows that RISCV_CBQRI_DRIVER only depends on
> RISCV && RISCV_ISA_SSQOSID. The filesystem integration is decoupled into
> a separate silent config, so the driver does not actually depend on
> the filesystem.

The commit message is wrong. I will rewrite it to describe the actual
wiring.

> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -596,6 +596,7 @@ config RISCV_ISA_SSQOSID
> >  	depends on 64BIT
> >  	default n
> >  	select ARCH_HAS_CPU_RESCTRL
> > +	select RISCV_CBQRI_DRIVER if RESCTRL_FS
> 
> Could this conditional selection lead to unexpected configurations?
> 
> Because the driver does not actually depend on the filesystem, if a user
> enables the SSQOSID extension but leaves RESCTRL_FS disabled, the
> underlying hardware driver will unexpectedly not be automatically
> selected. 
> 
> This differs from platforms like ARM64, where ARM64_MPAM unconditionally
> selects ARM64_MPAM_DRIVER regardless of the filesystem configuration.

The 'if RESCTRL_FS' guard is wrong. I will drop it so that enabling
SSQOSID always pulls in the controller driver.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
