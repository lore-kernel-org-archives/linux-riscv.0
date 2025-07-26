Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05431C87FCA
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 12:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4NULaUKFsL/6CQ80H0f50BR40Lk7SGvYgLuVdhiIhM=; b=ZdJ6YnYNJf4agz
	Ro72kD5DB6e243lJUAaOTDghaqF1jc6O6LBx7XWbQkx0y5yDPNmgorwI5Vn9SJ3fbzpUirSKJPy+U
	U6aVgFZ1ZCW55n0/NxmjsCfdvoGt2AOr9oeJwXUmXrddfr564/385lZhl6SLiFXjkwWpOKiwfPKlL
	OC55F8FSZLWPVZPiH+95p95Xm7UvJUdvI0CIEWGIY0io0mdSKvLDwMcbnHzB4Zk9pvsWy7nQnsacV
	ODPDSTdYfLaoObqS4Zw9Xb3Aovq2fLP5JGN8bMx2XLCdjJ5VDy2WyM3gPcF7WfrfGqAO+4A5Q+f0q
	WbdItsCN9gQ8E9R+RGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufdkD-0000000BR2u-25O0;
	Sat, 26 Jul 2025 12:11:17 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufdjL-0000000BQz1-2Pys
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 12:10:24 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D284A341004;
	Sat, 26 Jul 2025 12:10:20 +0000 (UTC)
Date: Sat, 26 Jul 2025 20:10:14 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, sboyd@kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: spacemit: fix resource leak in
 spacemit_ccu_reset_register
Message-ID: <20250726121014-GYA756241@gentoo>
References: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
 <ed5fcfec-6330-46e8-a302-5cf1d8b3a9ce@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed5fcfec-6330-46e8-a302-5cf1d8b3a9ce@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_051023_642566_2D07E9C6 
X-CRM114-Status: GOOD (  25.20  )
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

Hi Christophe, =


On 11:16 Sat 26 Jul     , Christophe JAILLET wrote:
> Le 23/07/2025 =E0 15:25, Hendrik Hamerlinck a =E9crit=A0:
> > The function spacemit_ccu_reset_register() allocates memory for an
> > auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
> > these resources, resulting in leaks.
> > =

> > Fix this by using the appropriate error handling path.
> > =

> > Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
> > Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> > Reviewed-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > Changes in v2:
> > - Properly place the Fixes tip.
> > ---
> >   drivers/clk/spacemit/ccu-k1.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k=
1.c
> > index 65e6de030717..5bb85e32c6cf 100644
> > --- a/drivers/clk/spacemit/ccu-k1.c
> > +++ b/drivers/clk/spacemit/ccu-k1.c
> > @@ -1059,7 +1059,7 @@ static int spacemit_ccu_reset_register(struct dev=
ice *dev,
> >   	ret =3D auxiliary_device_add(adev);
> >   	if (ret) {
> >   		auxiliary_device_uninit(adev);
> > -		return ret;
> > +		goto err_free_aux_id;
> >   	}
> >   =

> >   	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
> =

> =

> Hi,
> =

> I'm not sure this is correct.
> =

> auxiliary_device_uninit() which is called if auxiliary_device_add() =

> fails should already do the clean-up.
> =

thanks for your review,

auxiliary_device_uninit() call put_device() and will trigger release callba=
ck,
which then call spacemit_cadev_release() and do the ida_free()

> So I would say that this patch adds a double-free issue and should not =

> be applied.
> =

I agree

> If I'm right, note that Stephen has already added a "Applied to clk-next"
> =

Stephen, can you drop this patch? or simply revert it if too late..

> CJ
> =

> =


-- =

Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
