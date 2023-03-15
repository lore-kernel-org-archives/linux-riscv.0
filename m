Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125A6C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17V8lbXy2UHHohjf+K/1NCTWNTd28mgmAC/5vuor1Sg=; b=cLvVzygN/GY2GO
	DGbdSB9n7+JS3xP0AR9VQ1YvLpsgHMDe/9jmMoe3aNDMjopw18fJM+BIpZjxAECHomXOopyZql9LA
	5h5UPpumo8OY9N0/nVgp75+uh80u6j8lEtKkv+J9CIyjFmx135N420YJ2YE/wGmx88eCdIUrJ6Pmy
	COS8ZaeWrNCzbF2YoSiTZARoa2dnCn1BKCSR7JimrOdUhAx1hlVBYRIOxviF3vmSbQ7C0MZnLCG7e
	+PFDFga0+LTVfe+wAVrbKIKs8QjPKFwYK9xfgCmMYXAE4ITrEbgLpzV6LNhWRueUr7HKxJh3S8VMW
	nQm/XdDbs6rOnl06C50w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcZvX-00Ednl-1b;
	Wed, 15 Mar 2023 22:48:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcZvU-00Edmh-25
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 22:48:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D1BD461EA3;
	Wed, 15 Mar 2023 22:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A85CC433EF;
	Wed, 15 Mar 2023 22:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678920535;
	bh=iC8NtjPlD0VRfMIcs8JsUdxzmc0BBWrCOka5EaH6dOY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Z+K+RYH9IrYKl4dW5flp0qNvyWKTLyYNXUWFXkgB0CuS1DinHBwMGMeYZs/Fic+hj
	 9qSmTB0Of7tkQWE048Z+GcwNOAZGNBjwwgVHSc5LhRumjmUgMAP3l10S9Ck2WMfdvp
	 c/u5M8M2gKZKRNJ9yqSCG8wZYsB3yLDZwjAEUKpRnToOzJgVGfqPvBFT8t2TUu3WAz
	 pdL61mmZu76Nf5Opg2vTygZ2Z+txDjj5cjzumL7DMpu1yD3kIyyMxhEpp00Jo2TPhp
	 AVA45Hs9886s3aPzTkGdGS7+cJMEEgAeaQffUl0ANBuIqQdS6NdO46yFc3+D577axk
	 NZb6XzV5GKtyg==
Message-ID: <85856e5711813212bb4c04acbbe284b4.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <729b1b69-aba6-4623-cf78-b08562d30d76@starfivetech.com>
References: <20230314124404.117592-1-xingyu.wu@starfivetech.com> <de14f63beb2b3e424ec2375187c8087f.sboyd@kernel.org> <729b1b69-aba6-4623-cf78-b08562d30d76@starfivetech.com>
Subject: Re: [PATCH v3 00/11] Add new partial clock and reset drivers for StarFive JH7110
From: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Emil Renner Berthing <kernel@esmil.dk>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu <xingyu.wu@starfivetech.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Wed, 15 Mar 2023 15:48:53 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_154856_729326_34AB3FFF 
X-CRM114-Status: GOOD (  15.92  )
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

Quoting Xingyu Wu (2023-03-14 20:44:00)
> On 2023/3/15 8:30, Stephen Boyd wrote:
> > Quoting Xingyu Wu (2023-03-14 05:43:53)
> >> This patch serises are to add new partial clock drivers and reset
> >> supports about System-Top-Group(STG), Image-Signal-Process(ISP)
> >> and Video-Output(VOUT) for the StarFive JH7110 RISC-V SoC.
> > 
> > What is your merge plan for this series? Did you intend for clk tree to
> > take the majority of patches? We won't take the dts changes through the
> > clk tree.
> > 
> > I think Philipp Zabel reviewed some earlier version of the patches and
> > provided reviewed-by tags. Can you check if they can be added here? If
> > so, please resend again, or get those merged through the reset tree.
> 
> These patches add new clock & reset providers based on the basic clock & reset
> of the minimal system which Hal.feng had submitted[1], which are used in USB, DMA,
> VIN and Display modules that are merging.
> [1]: https://lore.kernel.org/all/20230311090733.56918-1-hal.feng@starfivetech.com/
> 
> Oh I checked and had not received any comments from Philipp Zabel in earlier version
> of these patches. Maybe it was confused with the patches of the minimal system.
> 

Ok. I am waiting for a resend on that series from Hal.feng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
