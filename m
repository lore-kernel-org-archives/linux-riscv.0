Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A19C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 22:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVDFE1bOznATVlefYkoE5XChUXCVA80nyrHw4YBtv68=; b=aYqJe8HKD0T3zN
	upXb8oeFtloqIk4dws34X/EZXdF+zqJDRbpBmjEvf0B9cA4sz0wpKVxvscSjPa6O1QS0XHqVCkZl5
	x949wqxYgsSlpwX+5aj5WHHq4dRwDlg0BtDa+AhjqyR6GCRb1P2mpdQNCN0Hu4tKnh5tkaqbSnlZa
	jTioK7T12yaz7G9D1P8aaHtr2GfZ0Ej7abd3Qqeyti4fisaLnZAwkFjF/5IU7Cg47rVFDy/cBCQ7O
	7i9+oS/7DX2oSQA6fdauyOfneeg/dikFYp8KunweX1xjdagSt2DJG5f2qdfTWZ+FcsfrPaUyNph/N
	ez9im418GKdb1utBXT0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcZmw-00EczJ-3B;
	Wed, 15 Mar 2023 22:40:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcZmu-00Ecye-1d
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 22:40:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DEA061E7F;
	Wed, 15 Mar 2023 22:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE12C433EF;
	Wed, 15 Mar 2023 22:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678920002;
	bh=Dqgr9v54cHrkJKhuRh+AiuRaYdqJV1Qe+/QF6NsU5r0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NIfBEAyYIYoM2nZPpROk+29khoFR2Alq5hnLpj0EIF6SuIG6BcXUC36rQZSTTf5Bz
	 PsNMAvGX+11izw7qQvEDcqB64o3Y6d9063NqJcwBAkZMBZkRFCdIi3lca25LgRO+55
	 ezVeKQqO7KttwW2fNMKnq+xpS2MP/QmrDYKcyoRhl1aZ11P2z3i6gXWRkvRS3n61np
	 +wIJOb6EGKakn5OVpOLZwhedfFhjoGrLT9oxnHPqYvM2uDIoRktooFU6mdshyhz3dg
	 +JwIfYJk/rB09CEqb0q/72Hb+eIyBB+LFVmutlvMLQaZcvIWDLuPkqeLOgdYJ9jiIq
	 P2mdHcRqfznWw==
Message-ID: <e24f9d404c5f9830c9606e4635dc6431.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <e895fea6-e13b-450f-97e8-34ecfe075691@spud>
References: <20230314124404.117592-1-xingyu.wu@starfivetech.com> <de14f63beb2b3e424ec2375187c8087f.sboyd@kernel.org> <729b1b69-aba6-4623-cf78-b08562d30d76@starfivetech.com> <e895fea6-e13b-450f-97e8-34ecfe075691@spud>
Subject: Re: [PATCH v3 00/11] Add new partial clock and reset drivers for StarFive JH7110
From: Stephen Boyd <sboyd@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>
Date: Wed, 15 Mar 2023 15:40:00 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_154004_586678_E48EC6AB 
X-CRM114-Status: GOOD (  25.01  )
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

Quoting Conor Dooley (2023-03-15 01:14:06)
> Hey Stephen,
> 
> On Wed, Mar 15, 2023 at 11:44:00AM +0800, Xingyu Wu wrote:
> > On 2023/3/15 8:30, Stephen Boyd wrote:
> > > Quoting Xingyu Wu (2023-03-14 05:43:53)
> > >> This patch serises are to add new partial clock drivers and reset
> > >> supports about System-Top-Group(STG), Image-Signal-Process(ISP)
> > >> and Video-Output(VOUT) for the StarFive JH7110 RISC-V SoC.
> > > 
> > > What is your merge plan for this series? Did you intend for clk tree to
> > > take the majority of patches? We won't take the dts changes through the
> > > clk tree.
> 
> FWIW, I've been waiting for the "main" clock/reset series [1] to be ready
> to go, before suggesting that I take it (the main series) via the soc
> tree. This one is kinda in the same boat, with defines in the dt-binding
> headers that are used by both drivers and dts, so splitting the two
> doesn't make all that much sense.
> 
> As Xingyu points out below, this series depends on the main one, so if I
> was to take that via soc, this one would need to go on top, or be
> delayed.
> At what point does that become too much to go via soc and some sort of
> shared tag become needed?
> 

Platform/SoC maintainers either base their DTS file branch on some
branch made in clk repo that has the bindings and drivers they need
(clk-starfive probably), or they send a pull request to clk maintainers
with the bindings and clk drivers. Or they don't use the #defines in the
header files and use raw numbers in the DTS, or they simply apply the
patch that just has the #defines in it to their SoC tree and we
duplicate the commit in the history by also applying it to the clk tree.

Let's try to keep things simple and not use raw numbers.

BTW, clk driver code doesn't typically go via soc. Not sure if that's
happening but please don't do that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
