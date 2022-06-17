Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40654C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3BQ7LEaqYgE5uXg8vFVwb5tiaa8F+vbbVu1xDhy92Q=; b=vv1f/XNejO409p
	m8iTdWFQELo7+MTlOWYFf4yMBDk/BozSm/Xljoua03QNQwudvD24hJNcu/0mbOuzKBMYIBn4mdJS4
	2lj5pdgygi5C5BiRcz4N7g6RerUa9P4eNMinx+e5CEp0KaTFyxRvYR/mMveazt+euz4GMvQz6/rmw
	yS4W8f8LZXpAXx+xpBgYnFF3CYXaURx21pNGJO1s242TOEKIUG+x0BpHxAj6enTiujcohqdepaK8X
	ocZuNBlTyZ1pkvl8HPEvLtpVPLnNqfqlT566haodJM9syI3PoJZ6gmnrMHt1yzbZF0p9mhv/sLKPV
	+jVigUwfGEASxYtiynEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27Nc-006K7D-P7; Fri, 17 Jun 2022 08:31:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27Na-006K4e-Gk
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 08:30:59 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o27NU-0003My-Jd; Fri, 17 Jun 2022 10:30:52 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Christoph Hellwig <hch@lst.de>, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com, philipp.tomsich@vrull.eu, samuel@sholland.org, atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr, robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, drew@beagleboard.org, Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 2/3] riscv: Implement Zicbom-based cache management operations
Date: Fri, 17 Jun 2022 10:30:51 +0200
Message-ID: <16237654.geO5KgaWL5@diego>
In-Reply-To: <20220616121157.GA11657@lst.de>
References: <20220610004308.1903626-1-heiko@sntech.de> <2041345.KlZ2vcFHjT@diego> <20220616121157.GA11657@lst.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_013058_599157_B562EC91 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

Am Donnerstag, 16. Juni 2022, 14:11:57 CEST schrieb Christoph Hellwig:
> On Thu, Jun 16, 2022 at 02:09:47PM +0200, Heiko St=FCbner wrote:
> > My guess was that new platforms implementing cache-management will want
> > to be non-coherent by default?
> =

> No.  Cache incoherent DMA is absolutely horrible and almost impossible
> to get right for the corner cases.  It is a cost cutting measure seen on
> cheap SOCs and mostly avoided for more enterprise grade products.

ok, then we'll do it the other way around as suggested :-) .
Coherent by default and marking the non-coherent parts.

DT people on IRC yesterday were also open to adding a dma-noncoherent
property for that case.

Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
