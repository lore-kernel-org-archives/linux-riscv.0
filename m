Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68B1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 11:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTsF+twq8n9X0g4vtBm49ufazwth/y7+JIndj1P6g54=; b=LSqwuWQIB4XwITCZBPvFqWl/8a
	wjHRdnGAEQ0XCx5fOnYlbr8sMvDTQL2cgnCvqXwDCjzK0fIJ94iCJjguQ7wwVA6t4OcyeysAtVkEo
	vcyAMS74tEM6vNte76nD8gs3QVStE13DVZ+rHN9S+UUSq1OyDCX0kShc3VugM8PjcomErKl3OkQvK
	UaRD6wykTYBH8GiqGeZSEieWxilk2WK9LIRIIgZcTZc3raZSVXsnZCHXygnqRz9adJV707LwiYhn+
	qA4BLnuWhOWip8JldHffYa/YmYGj//jvYLJOq00Dt1nPYva3d/bx5kZ1660jeCut2fN/cwh3CpBIV
	jxw/P3og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1RO4-00EE4K-KE; Wed, 15 Jun 2022 11:40:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1RO2-00EE3k-38
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 11:40:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8548617C6;
	Wed, 15 Jun 2022 11:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5434C34115;
	Wed, 15 Jun 2022 11:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655293236;
	bh=c9LwFamlPa1D8V1sZLBEkf4pM/MqJNHV89bpUyEU7uA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+RFRPppcy1a28sljuQ1Co2c9ibvyU/sWSg8nlItYnctF1OdfXwHftQhEs+qFAwQW
	 IGEFDOvp7Muc1EKOwaR4zPtdq1pS+sXGX3purxr9xPgU5TzmfRc7vdhl2Os7wHryOM
	 8fcLT6SxChIT0uAcvgWkn9hturu1pOi5lnfB+cG3lHQOvcRw9QCOHv6GbtVlYLPqXl
	 lu5AMgm/2oBwOBbZoJ8fAPAkaDk8J1ymmO4QfdFL8kOC2pjA1GX//v/RTYsS0qCu/s
	 l6Gof/hBx2UWum6V5+L4S/z4nY9Wcv+r91/ZHexP8N1lGwKaMW7zWGmpupu6mZPUKk
	 PYnfJbqhg/GwQ==
Date: Wed, 15 Jun 2022 12:40:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Lewis Hanly <lewis.hanly@microchip.com>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] spi: microchip-core: fix passing zero to PTR_ERR warning
Message-ID: <YqnFLCbvrTxNbG1+@sirena.org.uk>
References: <20220615113021.2493586-1-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220615113021.2493586-1-conor.dooley@microchip.com>
X-Cookie: byob, v:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_044038_235127_5AB3DC19 
X-CRM114-Status: UNSURE (   9.70  )
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
Content-Type: multipart/mixed; boundary="===============6380836084730418456=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6380836084730418456==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8+J4iCROf2wQYOpl"
Content-Disposition: inline


--8+J4iCROf2wQYOpl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 15, 2022 at 12:30:22PM +0100, Conor Dooley wrote:

> -		ret = PTR_ERR(spi->clk);
> +		ret = !spi->clk ? -ENXIO : PTR_ERR(spi->clk);

I think you're looking for PTR_ERR_OR_ZERO() here?

--8+J4iCROf2wQYOpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKpxSsACgkQJNaLcl1U
h9CxIgf/ZBgBD/a8d3ZYTzeipg8kZos1C5nMoiIH0fuch+YgZYCYBW0Icy3Vp34p
skKNBOlfkNEIRJ6TsbBSdPYsw6nIa3VNBfEDZxhEw06al/UOkFtgJS37koJ84AqT
C5RPaINztbs/cty23aLR2d3HTTzhpGJn0u/87wR924y6XA7RimsmcXXfxn6dVzq9
n7qlX5OV/XQaaeNkR0h1vhCHipEr2TmUroJnzPliCLUk5/wqIiRO3SDMxr/dhAae
QnxfgMXFjfmoKwAuAKyn8Q9FbeOe2jsUqvk06EWMEgeQXGm4ucvMMT8dDXDoFoDD
9lVReVb05x71sJsOhIkMp9Fz/tIQaQ==
=N5A0
-----END PGP SIGNATURE-----

--8+J4iCROf2wQYOpl--


--===============6380836084730418456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6380836084730418456==--

