Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F415AC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 10:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fL9jd5cjwsNVRIMHMFA8KWFcOYNjE6SgbV444HIrZgk=; b=uuvJyx4T9AuQ34Jmi86aWIPKc2
	JyCYyYGRy5u4Q6SnaUc1nFtL2pfs1kQLUyBJW5V7AYHrK/f+iBrj9xFerBY/3npqWK17CI/m+sq46
	jSI79/sxsqYVrvXjycw35t5GnzPaYwvwVLqu7W+CTjglqYLaNbdC3ShRo9Kg1VIO3aysiByqu0vwk
	iUTa7sXdZKbbCjCfTXUmcC37iu2Xq1KlpzObukIlbiVoYcSvj+MY71GncUN3C4sAcZIgMf/6Pw47u
	TEpH4Z19XiIoUEuq5hlLyq5cRJ6CR7Zh+UICJ/c1ioyykzdVtt+IGYkR3SxPINA4qlZoO6WqG28L3
	Qbhvk/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzFp0-0019ho-S5; Thu, 09 Jun 2022 10:55:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzFox-0019gc-Kk
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 10:55:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D860461CFF;
	Thu,  9 Jun 2022 10:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE994C3411F;
	Thu,  9 Jun 2022 10:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654772122;
	bh=fFvXj5SRoTp6Hhi5ZcyQ5FroE/o0H8XmIrhJK4iz2Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pluRCe16VSHhiKwQqtHn/heSRjUJgv4phLQst9mzI3o5ksVNMtTXeElw1YZXgOaSO
	 oeQCNorZCg/CIJrivCpOc9Pfck+Ki3RfzaaJAehf9VVjkL7VoXs6QDDdkh11PNzUGa
	 +CQTjrwRAKgKG5AM7ci1iIWCanvmC32Kkm1NU6JxMW0C6H9aYkntKHoDR6uTLIau3R
	 bDLlTxHkGftnC9JWhUKyNBVaSFX6/imoNzF7C3/N/Vt0y6kSFuCRCWbd+M+63IptAV
	 HGxekt2l3LlK4UQXNRWbfNH7O9HUhUxEm9GEfgnvl8kCD/5lxDMyeFAPu7hTjI4vGj
	 DvqecRiM/KU/g==
Date: Thu, 9 Jun 2022 11:55:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: conor.dooley@microchip.com, lewis.hanly@microchip.com,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next 1/2] spi: Remove unnecessary print function
 dev_err()
Message-ID: <YqHRlaqy/UD0vDKU@sirena.org.uk>
References: <20220609055533.95866-1-yang.lee@linux.alibaba.com>
 <20220609055533.95866-2-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220609055533.95866-2-yang.lee@linux.alibaba.com>
X-Cookie: Space is limited.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_035523_794662_66C92A1F 
X-CRM114-Status: UNSURE (   9.87  )
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
Content-Type: multipart/mixed; boundary="===============1093428155600417611=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1093428155600417611==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0bXiklFNAPTpnN3I"
Content-Disposition: inline


--0bXiklFNAPTpnN3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 09, 2022 at 01:55:33PM +0800, Yang Li wrote:
> The function platform_get_irq() never returns 0, and the print function
> dev_err() is redundant because platform_get_irq() already prints an error.

Are you sure it never returns 0?  Note that 0 is a valid IRQ number on
some architectures.

--0bXiklFNAPTpnN3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKh0ZQACgkQJNaLcl1U
h9DOywf8CpYl578fRtjDaeqN5f0T9EqOZQtgYzfzILNoXGC066ucH53ffM+mJrOE
eEy3bPlm/63pb7NUyNfc3wqEK8lIXR00D7VmCw7xBcfvDKsoskfXiN8ipLE3cDS4
0wMY94olcidpbXmrZgghFqSy+J5+cy9Fqis1tw6qygnFnXyUpoFULOJFdujP7Pi8
VU3cunpin9zsBXJkGbJfgcSQBW9TwZnve7+Zi/aJ0wk+Xm49lO0easreafN2IRa4
0dw1Xfm4x2kIADe9tNbms7TqjbNfG55pnHWseFT2y6yOiz6MKGDDlJMoGehUV56J
SFjy59OdlizDGuu1EtBePOPim4CKPQ==
=bqmh
-----END PGP SIGNATURE-----

--0bXiklFNAPTpnN3I--


--===============1093428155600417611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1093428155600417611==--

