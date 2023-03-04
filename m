Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F03C678D5
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Mar 2023 17:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GvpmA4sXahWVpoFhGY49iG4nOGdeFO6FnDazRUaafc=; b=s4s3e3eq7p5Gc7sQWWSBGkK37Z
	PvHAfFqNZJiyspDN2TH4mQcqWso8N0KGWNmtpKA6U6glQXTq7TUrqOn5ze6a6o20P5GdVWe3JdX+/
	5aOzYZCRZDp/haIhuPJl37ooyf6qRC8W3nf4Z8gQH+wLiRCZMaXKbvIaHX5Zy/mQ3jh9GJl6/PNZH
	9vYF5R1Lzitwe3Z2APiW8WkogqKOs8EXiT13WBsWou3T5Dki+x0qiZQJd9/cjIh3Ix+LVG20/FbRm
	KjIk117dNQBn19Eg9eWMLSgynUGkqDWnb3HD8hdGvf1ESmcSkOyCPOykYX6lf2JS5GEKibEBEyo0z
	/2/V0zuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYVGq-009HmG-3s; Sat, 04 Mar 2023 17:02:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYVGn-009Hkh-Gj
	for linux-riscv@lists.infradead.org; Sat, 04 Mar 2023 17:02:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 383B1B802C4;
	Sat,  4 Mar 2023 17:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1FEC433EF;
	Sat,  4 Mar 2023 17:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677949318;
	bh=57oPXRjQ+3tAP3ItxEgo1dN1/TWnvl0SjzZfl9niEcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlLX4+RKCzHM8WJjTRz/pa270WCZvESldBVgdFhdmzvE2CREodYlbM9TnKLCGrPJh
	 OQZ5apM8tCI98VKofbJtsu0X2l8/BFyRgpmtqAVqtbgDj4jZoOaa6+98v2EtyQ2IV8
	 WKOpIELXS2pIV/siBUttUXAqiP2YiZ7ysxlvZVg/Fw41N5zTZ+G36W/n8JD9aVx8UI
	 AIqNpVJHO8Qr1MDCVRMhficer/m2EsdtOmcZTM8Dppmv/+gi7guzL6BnqhjNaWArR6
	 eQfqIOOdOSDdtpSlaUJfusu49EhrTA3exXj6RKnua1v7F35nhns0ZRKHY8OXMxjKEm
	 qqApq9NmTSX5A==
Date: Sat, 4 Mar 2023 17:01:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Xu Yilun <yilun.xu@intel.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: Re: [PATCH v1 5/6] fpga: add PolarFire SoC Auto Update support
Message-ID: <59750d1a-de31-4e89-b8a9-d97ef66aa5f6@spud>
References: <20230217164023.14255-1-conor@kernel.org>
 <20230217164023.14255-6-conor@kernel.org>
 <ZANz6NLgSja2pfYa@yilunxu-OptiPlex-7050>
MIME-Version: 1.0
In-Reply-To: <ZANz6NLgSja2pfYa@yilunxu-OptiPlex-7050>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_090205_886024_122D9D58 
X-CRM114-Status: GOOD (  34.53  )
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
Content-Type: multipart/mixed; boundary="===============5370020814453755621=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5370020814453755621==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OcVmO8cg0uVjSPRD"
Content-Disposition: inline


--OcVmO8cg0uVjSPRD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 05, 2023 at 12:38:00AM +0800, Xu Yilun wrote:
> On 2023-02-17 at 16:40:22 +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Add support for Auto Update reprogramming of the FPGA fabric on
> > PolarFire SoC.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  drivers/fpga/Kconfig                 |   9 +
> >  drivers/fpga/Makefile                |   1 +
> >  drivers/fpga/microchip-auto-update.c | 495 +++++++++++++++++++++++++++
> >  3 files changed, 505 insertions(+)
> >  create mode 100644 drivers/fpga/microchip-auto-update.c
> > +	/*
> > +	 * To verify that Auto Update is possible, the "Query Security Service

> Why verify the possibility here, if Auto Update is not possible, the
> Auto Update device should not be populated, is it?

Good point, I'll check this in probe instead.

> > +	/*
> > +	 * Populate the image address and then zero out the next directory so
> > +	 * that the system controller doesn't complain if in "Single Image"
> > +	 * mode.
> > +	 */
> > +	memcpy(buffer + AUTO_UPDATE_UPGRADE_DIRECTORY, &image_address, AUTO_U=
PDATE_DIRECTORY_WIDTH);
> > +	memset(buffer + AUTO_UPDATE_BLANK_DIRECTORY, 0x0, AUTO_UPDATE_DIRECTO=
RY_WIDTH);
>=20
> I'm wondering why the image address should be written for every
> updating? Seems it is only related to the flash size, not related to
> the to-be-programmed bitstream.

Yah, it doesn't need to be. I'll check it against the expected value &
only write it if needed.

> > +	dev_info(priv->dev, "Running verification of Upgrade Image\n");
> > +	ret =3D mpfs_blocking_transaction(priv->sys_controller, message);
> > +	if (ret | response->resp_status) {
> > +		dev_warn(priv->dev, "Verification of Upgrade Image failed!\n");
> > +		ret =3D ret ? ret : -EBADMSG;
>=20
> If verification failed, what happens to the written flash? Auto roll
> back?

Nope, that should be left up to userspace to decide what to do. I've got
some improvement to do to the mailbox driver that sits behind
mpfs_blocking_transaction() that I thought was not allowed by the
mailbox framework, so should be able to report better errors for this in
the future.

> > +	}
> > +
> > +	dev_info(priv->dev, "Verification of Upgrade Image passed!\n");
> > +//	/*
> > +//	 * If the validation has passed, initiate Auto Update.
> > +//	 * This service has no command data and no response data. It overlo=
ads
> > +//	 * mbox_offset with the image index in the flash's SPI directory wh=
ere
> > +//	 * the bitstream is located.
> > +//	 * Once we attempt Auto Update either:
> > +//	 * - it passes and the board reboots
> > +//	 * - it fails and the board reboots to recover
> > +//	 * - the system controller aborts and we exit "gracefully".
> > +//	 *   "gracefully" since there is no interrupt produced & it just ti=
mes
> > +//	 *   out.
> > +//	 */
> > +//	response->resp_msg =3D response_msg;
> > +//	response->resp_size =3D AUTO_UPDATE_PROGRAM_RESP_SIZE;
> > +//	message->cmd_opcode =3D AUTO_UPDATE_PROGRAM_CMD_OPCODE;
> > +//	message->cmd_data_size =3D AUTO_UPDATE_PROGRAM_CMD_DATA_SIZE;
> > +//	message->response =3D response;
> > +//	message->cmd_data =3D AUTO_UPDATE_PROGRAM_CMD_DATA;
> > +//	message->mbox_offset =3D 0; //field is ignored
> > +//	message->resp_offset =3D AUTO_UPDATE_DEFAULT_RESP_OFFSET;
> > +//
> > +//	dev_info(priv->dev, "Running Auto Update command\n");
> > +//	ret =3D mpfs_blocking_transaction(priv->sys_controller, message);
> > +//	if (ret && ret !=3D -ETIMEDOUT)
> > +//		goto out;
> > +//
> > +//	/* *remove this for auto update*
> > +//	 * This return 0 is dead code. Either the Auto Update will fail, or=
 it will pass
> > +//	 * & the FPGA will be rebooted in which case mpfs_blocking_transact=
ion()
> > +//	 * will never return and Linux will die.
> > +//	 */
> > +//	return 0;
>=20
> Why comment out this code block?

It was meant to be removed & must have snuck back in a rebase. This is my
test code that initiates the update from Linux, rather than at reboot.

I'm going to take a look at Russ' driver before I submit another version
of this (and the underlying mailbox stuff also needs changes).

Thanks for taking a look,
Conor.

--OcVmO8cg0uVjSPRD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAN5gAAKCRB4tDGHoIJi
0g2nAP9j2ObA+tq/YlDOio7Uggfuittp658IFX8AuugEjpWtBgD/eDXvX76aNYQ8
kMbqt6dnVaIEKqVvQ7SWtwvceu+1nQw=
=pvCA
-----END PGP SIGNATURE-----

--OcVmO8cg0uVjSPRD--


--===============5370020814453755621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5370020814453755621==--

