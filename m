Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47AD5C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:41:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2679820870
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:41:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pno4P2gW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E1z1MHi/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2679820870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F6v++zeGHX/ccWoK+3NitwrjGndQM/f8ue93A0j5mNs=; b=Pno4P2gWixQ/c1k80zy9UIYmq
	ADi9vkBBlfdpnCeyMaoz7T/uoYTYxB+hK7ue9iJjQXaVm/GGnbBN7tXKalkq/wY+w24JDnTmUynEj
	m52qBq9kT5H6W1M0KdzUBZXYrMCuG+C7FKLoMN0gIHgXw3QjUO+y9xPGcIAohxqgEcEtduydDXiif
	bRKo8Div4nH+VGfKrcHJU3+EJIOAN8sDh6xGNxoZ6ICOxH4FWNEi13+JeeXGHQI/rdPVzG+qwamiJ
	sRokh15Zw469AMd07Iw6ilv/HG6v/NdQvKnfh179a+YxXlMg5J995nvyMCheuGzbXiTbg/SfFJz7f
	dJMxK/V5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gP95V-0005pC-LC; Tue, 20 Nov 2018 16:41:21 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP8lp-0001i9-Hx
 for linux-riscv@bombadil.infradead.org; Tue, 20 Nov 2018 16:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HGIluDdODRSm7vU6icQBXk9BsbnZMsqaLnqoCymvcIM=; b=E1z1MHi/HSrD93CL1m97DVMxo
 SaiXlE50FbUS4rc8f4ntfY2Agmo664Jnt37eA+CT1cyvZhZdmn3MXS80rA3l35lJ4HKHAsAKcEiaj
 MVP5odu0WndN8e9h+4A3YqLSMw5GodDRJ6bYfeoFBawU2rgKkj/Q85OnVLKQH4AFQucszX12NIGFK
 trDkM3/gnNx9DAwr120zRHFUI4qmU/2KBDfMHn4OfrVSpWqz0RLmX29dkzNd8+JEK6+08ixRLjZJl
 7sLICKwuy9zW/ImW9jyvjbkaI+rY1jpPOuS1by20fTLeZyNoou93AhYlVm0rPeXd2I7GWSXAaW9mY
 Cpsg1+ztA==;
Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP5xm-0002Tb-4X
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 13:21:11 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 90A05206D8; Tue, 20 Nov 2018 14:20:59 +0100 (CET)
Received: from qschulz (aaubervilliers-681-1-13-146.w90-88.abo.wanadoo.fr
 [90.88.134.146])
 by mail.bootlin.com (Postfix) with ESMTPSA id 4BF4A20510;
 Tue, 20 Nov 2018 14:20:59 +0100 (CET)
Date: Tue, 20 Nov 2018 14:20:58 +0100
From: Quentin Schulz <quentin.schulz@bootlin.com>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
Message-ID: <20181120132058.l3g37jpmac7ltclt@qschulz>
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <20181119151057.GC26852@lunn.ch>
 <mvm4lcdaynt.fsf@suse.de> <20181119152830.GE26852@lunn.ch>
 <20181119154005.GA8367@piout.net> <mvmzhu59idl.fsf@suse.de>
 <20181119161204.GC2393@lunn.ch> <mvmefbgm0zc.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <mvmefbgm0zc.fsf@suse.de>
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_132110_212903_4ADED87D 
X-CRM114-Status: GOOD (  18.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, f.fainelli@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 allan.nielsen@microchip.com, thomas.petazzoni@bootlin.com,
 linux-riscv@lists.infradead.org, davem@davemloft.net
Content-Type: multipart/mixed; boundary="===============8491579530452739019=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120132058.OyhRKRLuW6_AOVI84JclufIwZP2FSJ0nDVWE9tEtCb8@z>


--===============8491579530452739019==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="czv2zz26jygm5w43"
Content-Disposition: inline


--czv2zz26jygm5w43
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Tue, Nov 20, 2018 at 12:39:51PM +0100, Andreas Schwab wrote:
> On Nov 19 2018, Andrew Lunn <andrew@lunn.ch> wrote:
>=20
> > I still don't see why that would cause a hang.
>=20
> [  996.370000] [<ffffffe0011d7324>] mutex_lock+0x22/0x2a
> [  996.380000] [<ffffffe001039ba0>] mdiobus_read+0x36/0x60
> [  996.380000] [<ffffffe00103b82c>] vsc85xx_config_init+0x4c/0x1e2
>=20
> vsc85xx_config_init is calling mdiobus_read while holding the mdio_lock.
>=20

Thanks for reporting the bug. However, it could be nice the next time
you report a bug to give as much info as you can, such as the device
you're using. Architecture of your platform (or the board itself if it's
a DT in the Linux kernel), the MAC and the PHY IPs (the Microsemi PHY
driver now supports 6 different PHYs that do not work the same way so I
can't guess the one you're using), they all matter and help to
understand your bug. Also, if you could give a full bootlog of the
kernel and how it's possible to reproduce your issue (.config of your
kernel, on which commit on which branch you built your kernel).
Otherwise, you might not have any answer or considerably slow down the
bug identifying and fixing processes, which is annoying to you,
the users, the developers and the maintainers: a lot of upset people :)

Could you try something please? I'm pretty sure I found an issue (I
don't know if it's fixing your issue or not, but it might be).

Please replace in vsc85xx_default_config() the phy_read and phy_write by
respectively __phy_read and __phy_write (note the __ in front).

Let me know if you need help with this.

Thanks,
Quentin

--czv2zz26jygm5w43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXeEYjDsJh38OoyMzhLiadT7g8aMFAlv0CjoACgkQhLiadT7g
8aNnkhAAkWuXup/I0+f8mysVgLfrZQkkOUEtuPebOR9jTjeK7kdNORamUy4SZ4Pb
/YLRXOWuXuPW79o6E1onCkCwnqjWJVk8LphR73PW3mSSIZDDaFtuab3xsGTRNJQG
B8PGEhO+I9jaPW6k4MIIAk+9s6j75IUi9x3+/2SfjEVxTuKkCtPQ1Ep6S24cHCkW
txfnw9I474T8hl4TBCRNCLSO3It52onf/SaHMaxZft20uIBB+M1TLDo2BZ79rhI1
IkoMAJcDaSz+Iuvs9B5bc/O5h2J4xW0mD/m3qtTcn0Vln1tSs27pH/kuH7fISFzV
8+2Fb+1nVMzTU0lD6l2HJeLo9Hud4fSm4DFpCJrkxZ0DMnRmuLUW9vCfAkU1Loud
XJ+RfcJcTTJkxP9ZDHd0PN3TW42jUSWPYMJYNAEC1mh7N7bH8xlG6kiXkqjH/b5V
kVPMIUPRCkyqFkcAFsGZ5XqzAHSsFS/mEBN55SFzLwJ4bE/KVCZY1RRHWiNpVGWW
XN4aAPQIaFJLCYw/FHMN1bZxizqBfwKk1vwlJRlzIFvwt05fNvbakm9vPUIh2pV2
1r5m2sFwyB/F+dzutPDkSdIQZODRkvY3spnnm/xmHbx/PhT6K1aTf4xixrlLik5r
Nt2vPXEGBQ9/kb09Gxo8WDeuW6ubwRR+SRW99MAwLX6P8QozCnQ=
=cN5n
-----END PGP SIGNATURE-----

--czv2zz26jygm5w43--


--===============8491579530452739019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8491579530452739019==--

