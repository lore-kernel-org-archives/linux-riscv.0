Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB43EB64D7
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jun 2023 16:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeNwaAG06rEUUlF7Seu0gty8Ev+xVMMWy+Ci7SvutT4=; b=Yi0pLG54RHu3XG
	0VPSxnJBaesTZbYunz0IVYstV/vCAB6q9EIDXSn1biDxh7MaBj0m9KtQEMl/SJ+AV2749UAkOAwXM
	1pVaR9ZrceXbqQSi54b0X1ArIn62gr2Cpefial2hTJj8zCizKKMp3lEItIp+JOuBKb7cM9h5DTRE2
	FCo3LREOsfQ5nHTM1WgcE2t/Fsu/o2D39rnAzgkC8VITsfbc51DtQ5atAgyQlb8mID1/mIYSh9SMf
	0IL5uknuPzlaihDWwNZsJdfS/u7EV2Up08OjKtobWqIlc2Symlcd7P2BKrTED5P4RH7Vy1fTkfEM0
	2/3SC8hmSj5PWN1rHBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAvP0-006Gkm-36;
	Sun, 18 Jun 2023 16:37:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAvOx-006Gk7-2a
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jun 2023 16:37:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 214B26123C;
	Sun, 18 Jun 2023 16:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B690DC433C8;
	Sun, 18 Jun 2023 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687106238;
	bh=w5PergY9kTafyHYJcsbULa8KpRsHMRAQs38wpv8pc2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XxtxqqZ1BylOXZ6vM0IDIbW89aCFhJu6iTrCaRqs3PoJZpmQE1b+ohIEKQ/G5asLz
	 6UKGIk8oJ7jNzLWdTzXBUSy/cL+TAadIjJxsfrFwS2rYsNwZjgrrBvAfR5N+Lx/+Lg
	 459laYz3dmVfL3mlLafjZ3yLAhaZZGY2C4vt1w4lw/b0DFn8jJ4Xcp6n4mlnLDv5rs
	 Ja8ypN7xOhsxEJzUmjMxk1ldu7/dxkdoOhbMUQ1h4fqj4/+ev8kEnrJv4VbHb79/r+
	 daNbkGHp9Ck0bfmt6Fs/AIYp3bxUKqax7uPgb3TZXxzZxiUg/kh1uS8W1JtqdzPGSW
	 DtqA+qP7OlT4g==
Date: Mon, 19 Jun 2023 00:25:54 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, arnd@arndb.de
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
Message-ID: <ZI8wEp52bpqaCHAl@xhacker>
References: <20230617161529.2092-1-jszhang@kernel.org>
 <20230617-duress-phantom-3da79e33f204@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230617-duress-phantom-3da79e33f204@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_093720_172698_E22E134A 
X-CRM114-Status: GOOD (  22.37  )
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

On Sat, Jun 17, 2023 at 07:20:43PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On Sun, 18 Jun 2023 00:15:21 +0800, Jisheng Zhang wrote:
> > Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
> > module which is powered by T-HEAD's TH1520 SoC. Add minimal device
> > tree files for the core module and the development board.
> > 
> > Support basic uart/gpio/dmac drivers, so supports booting to a basic
> > shell.
> > 
> > [...]
> 
> Applied to riscv-dt-for-next, thanks!
> 
> [1/8] dt-bindings: interrupt-controller: Add T-HEAD's TH1520 PLIC
>       https://git.kernel.org/conor/c/a04cc7391d88
> [2/8] dt-bindings: timer: Add T-HEAD TH1520 clint
>       https://git.kernel.org/conor/c/413c24b03f4e
> [3/8] dt-bindings: riscv: Add T-HEAD TH1520 board compatibles
>       https://git.kernel.org/conor/c/89b0186ab532
> [4/8] riscv: Add the T-HEAD SoC family Kconfig option
>       https://git.kernel.org/conor/c/da47ce003963
> [5/8] riscv: dts: add initial T-HEAD TH1520 SoC device tree
>       https://git.kernel.org/conor/c/8e396880a864
> [6/8] riscv: dts: thead: add sipeed Lichee Pi 4A board device tree
>       https://git.kernel.org/conor/c/5af4cb0c42c5
> [7/8] MAINTAINERS: add entry for T-HEAD RISC-V SoC
>       https://git.kernel.org/conor/c/1203f584fe66
> [8/8] riscv: defconfig: enable T-HEAD SoC
>       https://git.kernel.org/conor/c/318afa081204
> 
> I'll send it to Arnd as a "RISC-V Devicetrees for v6.5 Part 2" once it
> has been in linux-next for a day or two.

Thank you so much for helping the PR this time.

> 
> Going forward, who is going to pick up the patches and send the PRs to
> Arnd? I wrote a document that should be in v6.5 about SoC tree

Here is what I thought:
From next development window, 

If we see a heavy development window, IOW, the patches size is big, I
will take the job of picking up patches and sending out PRs.

Once the development calms down, the patches size is trivial, I will
explictly send request to you by repling the patches to ask your help
to directly take the patches and send PRs.

Any comments are appreciated.

Thanks

> submaintainer stuff that is worth reading:
> https://lore.kernel.org/all/20230606-escapable-stuffed-7ca5033e7741@wendy/

The handbook is a wonderful document, thank you!
> 
> I'll do it if nobody else is willing to, but I don't want to be
> responsible for applying patches for all the platforms that pop up,
> especially for ones that I don't even have the hardware for ;)
> 
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
