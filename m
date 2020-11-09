Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A1DC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:04:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A36620867
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:04:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CmOs/ejz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wRs15LHi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A36620867
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FK4T7kUmZXq8GaBHnSvLpuwJ0pndcZbXO6TFS46IIL8=; b=CmOs/ejzaworhNrbqs4+f2FsF
	Bg4dZTNMFjmkoy0oETB5LsX4R9qwXItS5b+wxXgYYjQUcKBoHvGresZa/kqyFi1eFKw02nfe/uRjk
	yQ6K8OsciGoK3YFpneTaNqSIS1bNm0BkyqY5rkJNgUUZNXsoeJS2d1vTx5nxS8QvSa97mr5WAOpvT
	W2nypIiuKQHPt5fPUCo3ZToysIK7PqBXTK8bJ6GnUbx5PxJOn88zaMFPUQURCVhasEtUGHQHT+vi7
	R4ir0dz5sCifSF1cVxt30W0/uYkyxY1hlANiSmIDHEV7Gc0nWr4jMm9dR//ybcwcHS2Y+jIy/iCSc
	y/F7b8/+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc7lw-0001XB-SU; Mon, 09 Nov 2020 14:03:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc7lu-0001WG-Q5
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 14:03:51 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A05920867;
 Mon,  9 Nov 2020 14:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604930629;
 bh=0qWoR1msH12ErNOfjXIHiUCH+yFjvnvefxpiB9RfPxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wRs15LHircWzvXOo5eAGcE1LTAtxbL4/0ZY88LI86gw7Ho0CwqdiuVsSEAQIGcUv1
 9I95eKzIRan+x1t7Duk9Jp1J5q71sIvNo0ijBwWxGhLnAcqvNWBnm09ukjE8xqjK7x
 RUnP9miyPzSp53rkkKslalwQownd4flZ5FKmtZ60=
Date: Mon, 9 Nov 2020 14:03:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 05/32] spi: dw: Introduce DW_SPI_CAP_POLL_NODELAY
Message-ID: <20201109140335.GC6380@sirena.org.uk>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-6-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-6-damien.lemoal@wdc.com>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_090350_962738_288330E8 
X-CRM114-Status: GOOD (  13.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, Sean Anderson <seanga2@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-clk@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============7897083048154078833=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7897083048154078833==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 07, 2020 at 05:13:53PM +0900, Damien Le Moal wrote:
> On slow systems, i.e. systems with a slow CPU resulting in slow context
> switches, calling spi_delay_exec() when executing polled transfers
> using dw_spi_poll_transfer() can lead to RX FIFO overflows. Allow
> platforms to opt out of delayed polling by introducing the
> DW_SPI_CAP_POLL_NODELAY DW SPI capability flag to disable
> the execution of spi_delay_exec() in dw_spi_poll_transfer().

This feels like it should be done based on something like a cutoff for
sufficiently small delays rather than with a capability - it's tuning,
not a property of the system.

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+pTDcACgkQJNaLcl1U
h9ANcwf/YmBAqrHq0UScXKCySZxkuvWStVH14/YdQZtvZPP/q+momYYX4pc3kd/c
TBpsNlmcayA1zutuPZnLrGDvbvZveMzTmNelO1tPR3Of2cCvVzxsg7ll9McnW0tO
lQH/+nQTFzmRa2VmkMwf4qOSjkmBmtTZxn7tEJeuXLHNzNXWuChhNxTaDe8nVW16
YgDEFpyJP4apsxGFPAbFEgvPmbdz38L0VIlKE7779QjJ+s2l2npzVFpB9kVAPYX0
InWN9ZugvH0NFUo1vP2s6Ap57nSDtx2uNiY8YC+Q2O9tJYEp8ayKAFvh2pMQaq1k
s9tHGmXcudhAm0qR5VH22WaH1cXUTw==
=zXja
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--


--===============7897083048154078833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7897083048154078833==--

