Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3576C982D7
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 23:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0H3rUzb6kKLxKfPzJEQBTuXvprOyQcS0td2DT8iL8SA=; b=ucBzHiddZp6gEZ
	yxvTUkvUDXoOYFFJ6pCbQaCJP+hRE+D80mn+GEG/K8sK7T6JYdK/9QzMU5Ph2LLzPiqasvZdCifsW
	skMMgwNtz5/aT1fjVT9GX0pG+n2Qc+obAwghqcKpfctCyejzr7ZoiYhEmqHY3jaDVJQxyGV0tHUpM
	K+jvgdI1qv63lIxMendaVTnB0qIdo0G9LgY8oGGS1lTr8TpyIBMcGFbvcI6LBT/7oe9YSlzYCFptC
	j6AmshIr7yBirxKB6vT3WjbZjMC3dWmMONLQIHqt5kpFiusxROQbCeGLfWh8luH4IllrwreUmHrCJ
	mf5u3pPsgpzp4DNi6xFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hbk-0000000FgV6-3U8C;
	Fri, 18 Sep 2026 23:03:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hbj-0000000FgUy-03yv
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 23:03:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 625756053B;
	Fri, 18 Sep 2026 23:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F621F00898;
	Fri, 18 Sep 2026 23:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789772582;
	bh=jHNs6AiLAnXjxOSEL4ZlVQ0PBlGJFDV35U3GfJhTtpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rip47fgogMqlbmNb1qqYNEe1XC8JTQFskqccQH4DQ3hrtax39/kAK5gQ8Q56UI6FL
	 sQJH+YDyD8kMcis7lAibglrAjR4s/saQiI243scxL+bvbj+WRw3wGk+EGvnls25qfT
	 isCEYLfiMsuyJvHExcULWwGwGWTYKzqYipnNxAkSCl/Po8ZROss4DXGL7H+WurwH5/
	 5w7Sqx+Hxab9L/LEULxkYCwwzG+EQxvhd1ge7iWilmgb2kZ2AV/1g1mt9wEBQN5Xbn
	 ZsP+unnf2M+BBSbgb8wVRqRpQmHEbPYXI4wK5fsNwzH9t97EVMM8PGINSOlWQuNZFm
	 ramiBSZCkLo5A==
Date: Fri, 18 Sep 2026 23:03:00 +0000
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jennifer Berringer <jberring@redhat.com>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] riscv: dts: spacemit: k3: Add UFS support
Message-ID: <20260918230300-GKD297024@kernel.org>
References: <20260916-08-k3-ufs-support-v5-0-1f5d71f1027d@kernel.org>
 <20260916-08-k3-ufs-support-v5-3-1f5d71f1027d@kernel.org>
 <20260918-belligerent-succinct-kraken-7fa592@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918-belligerent-succinct-kraken-7fa592@quoll>
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

On 11:07 Fri 18 Sep     , Krzysztof Kozlowski wrote:
> On Wed, Sep 16, 2026 at 02:59:55AM +0000, Yixun Lan wrote:
> > Add UFS Host Controller support for SpacemiT K3 SoC, and enable
> > it both on Pico-ITX and CoM260-IFX boards.
> > 
> > Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> > Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-com260.dtsi  |  4 ++++
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  4 ++++
> >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 22 ++++++++++++++++++++++
> >  3 files changed, 30 insertions(+)
> 
> Please do not combine DTS in UFS patchset, because it might end up taken
> by SCSI/UFS folks and it should go via soc tree instead.
> 
Ok, will do in next version and send DT in separate series

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
