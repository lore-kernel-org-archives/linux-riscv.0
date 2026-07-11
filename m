Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66517C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 07:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUgh+CKMR7FO2NdGfW7GnaiexjBSKFv807IVAtxT74E=; b=r/oSSfJ9BE9E4u
	HxEJvN1wRY0IL23HJXs/CBwCjYAVw/JXw6LlA8cb1UF09hzSOmGuRsab0Iu7z35KGt0ASOWYdb508
	AjMrrFA11QmvrGvwgpQtbvrKYKuhaumv8TT1hPozp5bIS0B/igTKSANW7eFEKg/Wv2HxSpNTxe9OL
	NX5p/5KVN5xacrJDSpy5A/etvp+rtwlK6sbkCJYWXr7dGIfSZ1rXtqG4anT66nsuUC7QNxIpaEFkT
	/wMaD32s1JdABeGFlKynkzy2Xb3nqlksFVAVs7vJxx06JlV1tZ0Hxq0XNLsbL1LuR9QY+sTTfmDK3
	BeUbY6j3CL1xXygOp3uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSLJ-00000006KQV-0j41;
	Sat, 11 Jul 2026 07:41:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSLH-00000006KQJ-3PTe
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 07:41:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 08117600C3;
	Sat, 11 Jul 2026 07:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE311F000E9;
	Sat, 11 Jul 2026 07:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783755702;
	bh=FfSritx/PtEBrsGP3lbGQMekJE8MmJCr9d3EgkR1zwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KE1e5R5MLRMZ5mWs3Dpq4fi2fB/ZDPPgUTHy12YnFJdhMG9l4FWItXwYpe2hKDf9X
	 SyP1C1klHJNrWx7NqlynSXTbvkrVo0Lz3DAqoxpnU71g6r/uTsDpfM+xlWY6849GfR
	 qfuoYiBbeGk9bAr3/m9iWEb4MDb+4AOC+CTYkrGzamkhBSdyKBMRFEgKAio5lZ1FMJ
	 xUZuhN8S24XxCVR6uny9gWtiIZYlJRebNoMGHNwt1TazQNcaHIQoea0ZQITPMCqjpj
	 xYu/w4axLIUFOlJb4SpjwXVhx3CQ/HKPj0Z03126qxD+INTkI41wqGE2v5s+jFbzWK
	 HKnDpxyjuAKog==
Date: Sat, 11 Jul 2026 07:41:39 +0000
From: Yixun Lan <dlan@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Shuwei Wu <shuwei.wu@mailbox.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] cpufreq: dt-platdev: Add SpacemiT K1 SoC to the
 allowlist
Message-ID: <20260711074139-GKA36656@kernel.org>
References: <20260626-shadow-deps-v4-0-bba9831f2f1d@mailbox.org>
 <20260626-shadow-deps-v4-1-bba9831f2f1d@mailbox.org>
 <7x5mgpk3z3aiebifhxto2v7m5yrikj52lwf5pzegzhk5aiehhj@jqm6opm6nrub>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7x5mgpk3z3aiebifhxto2v7m5yrikj52lwf5pzegzhk5aiehhj@jqm6opm6nrub>
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

Hi Viresh,

On 10:28 Mon 29 Jun     , Viresh Kumar wrote:
> On 26-06-26, 16:10, Shuwei Wu wrote:
> > Add the compatible string for supporting the generic
> > cpufreq driver on the SpacemiT K1 SoC.
> > 
> > Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> > ---
> > Changes in v4:
> > - Drop the K1-specific cpufreq driver and use cpufreq-dt again
> > - Add spacemit,k1 back to the cpufreq-dt allowlist
> > 
> > Changes in v3:
> > - Add a K1-specific cpufreq driver for the shared-rail, dual-clock topology
> > - Add spacemit,k1 to the cpufreq-dt blocklist
> > ---
> > ---
> >  drivers/cpufreq/cpufreq-dt-platdev.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> > index 25fd3b191b7e..e262394b56f9 100644
> > --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> > +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> > @@ -81,6 +81,8 @@ static const struct of_device_id allowlist[] __initconst = {
> >  		{ .have_governor_per_policy = true, },
> >  	},
> >  
> > +	{ .compatible = "spacemit,k1", },
> > +
> >  	{ .compatible = "st-ericsson,u8500", },
> >  	{ .compatible = "st-ericsson,u8540", },
> >  	{ .compatible = "st-ericsson,u9500", },
> 
> Please take this via arch tree.
> 

Ok, in this case, I will take it via SpacemiT SoC tree along with DT patch [2/2]

Reviewed-by: Yixun Lan <dlan@kernel.org>

> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> -- 
> viresh

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
