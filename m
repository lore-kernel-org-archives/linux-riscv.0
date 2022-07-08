Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C40C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 05:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Qorvps0ZEQD50+7310DNDQsY2UTfjDevTZVO3rvVTQ=; b=MCh019iSPqgP0A
	+nvBBDPWWiiB5JtdqxNGhmJzUNCcmXCOSHoxZlSZtJKMzLw11q6BFqo45mfimH0z8TkKGG1tQdltv
	FBqRQTe2rfBeedrQKh6Q5nlGq4pvy5l9iQOpAm5Qur0BefQahCWFX6qjdng2u3fL2BNg/l+PuVyzK
	cPWdvdfrTUsfQGllf0hTN81ZrulesAbm20JY0UB3DPBtvv09Z3/s/xEhcRE128mDtXTYNaX1y0jMe
	Y1NRCDBijbiOOahWDGAoIUiNdWDpNRAh9XGcnJYS7N9pGrcIZ5w7yMg65W6Ae+mVrws+O8IB+4Zy5
	fLpuzK+c2OL/YcJt0sCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9gKn-001nw3-1I; Fri, 08 Jul 2022 05:15:21 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9gKi-001nt9-K0
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 05:15:18 +0000
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1o9gKC-00FpLV-D8; Fri, 08 Jul 2022 15:14:45 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 08 Jul 2022 13:14:44 +0800
Date: Fri, 8 Jul 2022 13:14:44 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Conor.Dooley@microchip.com
Cc: palmer@rivosinc.com, palmer@dabbelt.com, arnd@arndb.de,
	Cyril.Jean@microchip.com, Daire.McNamara@microchip.com,
	Lewis.Hanly@microchip.com, aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org, kw@linux.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, lorenzo.pieralisi@arm.com,
	mturquette@baylibre.com, paul.walmsley@sifive.com, robh@kernel.org,
	bhelgaas@google.com, sboyd@kernel.org, wsa@kernel.org
Subject: Re: [RESEND PATCH v4] MAINTAINERS: add polarfire rng, pci and clock
 drivers
Message-ID: <Yse9RGTfRgqzzknt@gondor.apana.org.au>
References: <20220622225822.2166305-1-mail@conchuod.ie>
 <a39bad24-d2bb-ef3e-d57a-2ac4fa1156ef@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a39bad24-d2bb-ef3e-d57a-2ac4fa1156ef@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_221516_695555_EE0F7B16 
X-CRM114-Status: GOOD (  13.57  )
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

On Thu, Jul 07, 2022 at 01:30:27PM +0000, Conor.Dooley@microchip.com wrote:
> On 22/06/2022 23:58, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Hardware random, PCI and clock drivers for the PolarFire SoC have been
> > upstreamed but are not covered by the MAINTAINERS entry, so add them.
> > Daire is the author of the clock & PCI drivers, so add him as a
> > maintainer in place of Lewis.
> > 
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Arnd, Palmer:
> Does the SoC tree make more sense for this patch?
> I am missing an ack from Herbert (but I don't think that's blocking
> for a MAINTAINERS update to my own entry?).

I'm not sure why an ack is needed from me since the entry doesn't
intersect with crypto at all.  But FWIW

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
