Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AD4C38A02
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 22:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fm8VO/RgtHmI/qO737q5V2W9CVPciGiJ7/mBsIo4S8M=; b=OU9BXpvDQfQngJ
	ywNQxFxQ7CvGaUGCqbAeIv60SxridnPpMBxovIVfxagAVqtdA9LL8nId4r4dqR7YlD2hCS4tiEUVj
	x9WV0mGqoH8bqeb9ucWiL89W5njQ0GgC3aPzjLxIcVZ8f0rzqqWtCy3+u+BGfBMbK6AB97fylNRwe
	/RdKYjrYhRs58Fyqa9R9Ak0+bPugyukoH2LR2jjQ5iYzX7ZQvDGcTBwObhkiwgosX9sihnc28FCB8
	Vj6e9pDDh2MtSjlDpwjy1QLtlLk+FPKY+KaOeFGJ0ugJX5KszNCqSvT1KSOA7FeXdSUaK3SXbvi/t
	hxi2T4hp1QAFoBfPbybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opGyB-0040tf-Gr; Sun, 30 Oct 2022 22:39:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opGy8-0040pI-OF
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 22:39:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC38660F7E;
	Sun, 30 Oct 2022 22:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7722FC433D6;
	Sun, 30 Oct 2022 22:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667169591;
	bh=fi2z2xdBZG+ZUhsFZgwdsYmEXIU71T3LaQVeEQbiMY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GFYkSOB4+cqCBr4ZCjAsldhFCevfK7SLcO21fyHIB7T9Gc0zTrUK1m6fljfkLI9BZ
	 tp4nArWbcQcsVL98IYR/6mRqaiIYdh86GMmwf7NrfpCD2DbxQkjtjrLysW8zSR5DdC
	 EJLmL4fBIOEi3oM7+O5cjgN9xNjF+iCLi41Aopzw5B+P0Ot+rHSzS1l1f/HX9wp9pP
	 bpqofbGEkee+Shkrwdc+y3nzdY/Ja2jvwhRQfF5Pt838BZfG7BN6TufWtuVXwAGK/D
	 JyNxOovUYiZXujAW/pR16ZGoF1a2ldNHeq6lhGZFjM31wUiBUUAkBA5N7VXzc7cPHa
	 Z9nR4bT2mdgQw==
Date: Sun, 30 Oct 2022 22:39:44 +0000
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 4/7] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
Message-ID: <Y179MD6Jupj9n4NA@spud>
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAJF2gTQPU0FGmeVt9jrNfOAQSA=04Vcm4U_wcC_dGMc5X2Bo7w@mail.gmail.com>
 <CA+V-a8vBkHhTtq6Veb2vn-6o4S5Ter==yN6TFhYQvxko_Bk2LQ@mail.gmail.com>
 <CAJF2gTSQH0q4PoucBgr3abWWA+XCdxm1tk1j8Sqydt_XyCq2RA@mail.gmail.com>
 <Y16/YQTOW3DuQvo9@spud>
 <CA+V-a8vCNx-bqjeOa13LewaEJOGW-0ypqJTvZo7om6XcM4T7UA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8vCNx-bqjeOa13LewaEJOGW-0ypqJTvZo7om6XcM4T7UA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_153952_842574_3DDAE20E 
X-CRM114-Status: GOOD (  18.60  )
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

On Sun, Oct 30, 2022 at 10:27:17PM +0000, Lad, Prabhakar wrote:
> Hi Conor,

> > > You could just move the below part to the second dtsi patch. Then
> > > compile won't be broken.
> > >
> > >             clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
> > >             power-domains = <&cpg>;
> > >             resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
> >
> > The makefile for this directory is not added until the next patch right?
> > The compile shouldn't be broken here since it therefore cannot be
> > compiled?
> >
> These nodes are already present in the kernel [0]  so the makefile
> change in the next patch if made here still won't break the
> compilation alone of SoC DTSI (included in dts).

Yeah I know, I did actually build the dtb ;)
I was just confused as to how Guo Ren had found a build issue with this
patch that the follow on patch would fix, when this dtsi is not
buildable in this patch.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
