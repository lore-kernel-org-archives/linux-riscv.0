Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0265C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 13:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLcqfYfAiV+ULBR1Omkva3R2gbTk/RdkTIgpqiASmdw=; b=FqAftJ6l1p+sJs
	NCoQdAvxbFJymswIWA6BoN+6BerzoRk+937fUL9ZkzQPUWXiUrKCXpcLo49gZXiJuyXT7X+9M9N85
	1k329tZ7NzZZ4gBHssLsdYBDOU/PhA8wOuZ2VtEfGEoCgtTu0oRjDoHh6rJkFObEutIb2r5rciNWG
	cq8Gf2ebdtlrgiz1hAaCgKL6fmYwQg+XvXLA4uu4vdT+atsqFRcrCx2CaUEzjsBBfsxf/72LuWwxQ
	4cqMJhV24dBylUVJOHPJNgDQLPv29zFokEuU3WZ3RGRdRIRVmeucSPkggFmJobwwsFWGlQfmMdYF3
	LMV+lzjO9sNw+VzqwkIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWwn-0000000AZe1-3L9p;
	Wed, 10 Jul 2024 13:01:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWwk-0000000AZd7-3DjQ
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 13:01:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3B22DCE1676;
	Wed, 10 Jul 2024 13:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B113C32781;
	Wed, 10 Jul 2024 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720616479;
	bh=+4x3HRyWwx+Xd8R65nc5F3s+t/8WKeREvJg/+hwigNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hd+c2OS3wlylXNCVcq2IWuf7/W4hQGqA5CKbwW2oSTLsIClLVvBY937ugu+/OeyZ+
	 kbM6jbPjPdZNxPiXHMPD1v8PbAdnNeWuAJcUWfn6YWehhOkMDO+Do3jLFhXpJTE45k
	 ZB2xGkPcUILyGfvyTohqxZl2E0QwrW/+Ixxi0lDfCDFaEgHLOZNPwSgFs4I5+QdPBM
	 vtejH6Edjgwfg/BZf1cb74pKymF25Ic2waFtmftEamj1Y7NXeQuBPTyfz7z7fTC0Ps
	 +KqdMxV2kXcwCs4OBI4+WFSoATis5UTvY4QsJnWuH37tKIp9Q2QDnWK/mUFs2eW803
	 k53IfmUiUItVg==
Date: Wed, 10 Jul 2024 15:01:15 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Conor Dooley <conor@kernel.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 0/3] Add I2C support on TH1520
Message-ID: <7kki7gjcvt2z23cd2t2p5jmy7plxazlcu37pchfxkpifm76jjz@qtb6rqhngclp>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
 <172059771094.2294116.14777114514280404581.b4-ty@kernel.org>
 <6374ed31-3832-4b17-9d80-f668c419a016@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6374ed31-3832-4b17-9d80-f668c419a016@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_060123_274000_CCD46678 
X-CRM114-Status: GOOD (  16.26  )
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

On Wed, Jul 10, 2024 at 10:21:57AM GMT, Krzysztof Kozlowski wrote:
> On 10/07/2024 09:48, Andi Shyti wrote:
> > Hi
> > 
> > On Tue, 18 Jun 2024 09:42:37 +0200, Thomas Bonnefille wrote:
> >> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> >> and a default configuration for the BeagleV-Ahead. It appears that the
> >> TH1520 I2C is already supported in the upstream kernel through the
> >> Synopsis Designware I2C adapter driver.
> >>
> >> This patch depends on the clock patch from Drew Fustini
> >> Link: https://lore.kernel.org/linux-riscv/20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com
> >> and the pinctrl patch from Emil Renner Berthing
> >> Link: https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com
> >>
> >> [...]
> > 
> > Applied to i2c/i2c-host on
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/local tree
> 
> Something got odd in the git repo above in your ty letters.

yes, I also noticed that sometimes b4 ty is not able to resolve
to the right repo. I haven't had the time to check what goes
wrong.

Anyway, thanks, the right repo is:

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
