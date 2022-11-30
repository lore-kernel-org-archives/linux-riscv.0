Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7D2C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 19:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QO0hs1R4YfKj4ZBHLP4mAPAiHBhMxK9+Rw+A7fCk/w=; b=Fcsxe1xLTZjy+E
	zX28MuTWgwZrzzajzrU3mXKXIna7xDBokkdPQmpHkW0usfaugk+IJ1c4EaVE7MBi8ZyIyGkTlww29
	2QbC3v47bj75YOEHhCEo79/sQLOYWJneqL6WXP8TL3GYByHRWPISkGw1wlzkvYvhxdwYTAAfdiHGk
	O2km0OIydwS7v5RkKVr+hLKlbXdem6wc3G+Idppmp/y4F5iJwZ4TptgAT0yYPlrgoYr1yfD25W1qW
	UPuiLGXy/c8NkandO8BwHKLjST8EsiRoMQf/woYhBymVbFrQFYhf9KobrIthXG5y48rGEA7QXR+4G
	I2yBM6/YSJnFxSdmOiiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Sxa-0025ox-CD; Wed, 30 Nov 2022 19:41:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0SxX-0025nO-6o
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 19:41:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A5D59B81CBA;
	Wed, 30 Nov 2022 19:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DAFC433D6;
	Wed, 30 Nov 2022 19:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669837288;
	bh=C/U5fFhIaEdEwq+nxoTupBX8iAB8YolsvHb6V+wAFWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N00LbGODhlxewTz9rikMoxxvepiHAE9tgPCz251lEbgoa+0ztGLQhZDchO9P4MNK9
	 1VP9dBc/JScHg1viN0JeehuP61GAiN8o951jCDYYSow/ZUnUlm6ndoXd39AcHulAk3
	 i+lf5Cl1GIT9g5NPsU8y2bZMRhlfrc9qjV9h9itO5TMcOECHVxjreF7J2K2UhSt3WO
	 oFKbYIFO11u7XlKFNZVzSjihRvMlnQ0JupaSVuFZv2jzX6+hib/hqD2JrMu3wTNSDD
	 qxLH67U6+cuFG9i5eyntiRKh+7UQJv3otswCbS75N02cFhR0AXiZCQFA0ZpXrXvKE3
	 EnrVC3PPsGhVw==
Date: Wed, 30 Nov 2022 19:41:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com
Subject: Re: [PATCH v2 08/13] RISC-V: add U-type imm parsing to parse_asm
 header
Message-ID: <Y4ex5Mj0iezP0vwm@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-9-heiko@sntech.de>
 <Y4aX+KJ8sC2XRO1E@spud>
 <7518802.MhkbZ0Pkbq@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7518802.MhkbZ0Pkbq@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_114131_414717_6C2C263B 
X-CRM114-Status: GOOD (  17.45  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 30, 2022 at 08:27:47PM +0100, Heiko St=FCbner wrote:
> Am Mittwoch, 30. November 2022, 00:38:32 CET schrieb Conor Dooley:
> > On Mon, Nov 28, 2022 at 11:26:27AM +0100, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > >
> > > RISC-V: add U-type imm parsing to parse_asm header
> > =

> > Ditto.
> > =

> > > Similar to other existing types, allow extracting the immediate
> > > for a U-type instruction.
> > > =

> > > U-type immediates are special in that regard, that the value
> > > in the instruction in bits [31:12] already represents the same
> > > bits of the immediate, so no shifting is required.
> > > =

> > > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > =

> > How is this different to the patch I left an R-b for on v1?
> =

> Somehow with having changed so much for v2, it felt strange carrying
> over many of the R-b-s. Though yeah, this one could've made it :-)

Yah, hard to know what to do.. Worth mentioning it explicitly though I
think if you do drop tags so that people know where they stand.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
