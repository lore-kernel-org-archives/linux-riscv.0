Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC307C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 15:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0ZIz9p1W1TOpJPC0BjE5actmh+UttGMLgLV8qfxZHk=; b=mZ4EtXFazgUb9m/rwGehncm25i
	j28lml8rHY6gRyJbEzRrUHqVjI5TVUk5XTW7jHIfXRvhWGxZ3DN/Q2E9xC6cv9ugjLb+ONY61S9d+
	X/Y4HecDx6uKOP2ASTTutodylI9vjnufyu7Fcoo8NBZyR/VYHOoYzY+/+v3glqN4dILk/U+nUnNFe
	8aS7IXEufiBtklOzVaBFLyfgqmguGOG4ORRPVOt9Jgxk/eKiWivzjIxCqmwFkKubdqnBRZ0R8FQpM
	tkHYI299y939v2orWD7tevxjqA2z51fRCKfTUsGL2vaKdCxCG0Qszxnr9xSnDT9TO/BMfWmjAlvc5
	TqPjEn6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfL8-00DHk9-2J;
	Thu, 18 May 2023 15:14:50 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfL4-00DHhj-32
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 15:14:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzfKl-0007Kv-DE; Thu, 18 May 2023 17:14:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzfKk-00172Q-Kt; Thu, 18 May 2023 17:14:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzfKj-005gmx-Rx; Thu, 18 May 2023 17:14:25 +0200
Date: Thu, 18 May 2023 17:14:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v18 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <20230518151425.fy45t6brs7a7rmdm@pengutronix.de>
References: <20230518-reactive-nursing-23b7fe093048@wendy>
 <20230518-dandy-bless-fbd1e2c23dd0@wendy>
MIME-Version: 1.0
In-Reply-To: <20230518-dandy-bless-fbd1e2c23dd0@wendy>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_081446_977738_2FB83F64 
X-CRM114-Status: GOOD (  10.60  )
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
Content-Type: multipart/mixed; boundary="===============5098322793955595224=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5098322793955595224==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f6ksgjaxmglv7ul5"
Content-Disposition: inline


--f6ksgjaxmglv7ul5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Conor,

On Thu, May 18, 2023 at 01:29:20PM +0100, Conor Dooley wrote:
> Add a driver that supports the Microchip FPGA "soft" PWM IP core.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for perseverance,

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--f6ksgjaxmglv7ul5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRmQNAACgkQj4D7WH0S
/k6F4gf9ErdZXnexbDjJIiWItWNzb5YEKF8FvwDv6ibeULwG+RIOcaLbam21AmFT
913r69IaAWh68bdBNkf4BhUs6BmOUPOre2egQP6eKBby01RmcMjoh4Cxq1aPqdDT
AL6gZ+Z37mXc3agps6hJgZHBOx0Es3GRUEeQdixjnZsccj03sMqC5+Zbj5VqLrOv
HWJ+sTaYv03wlTlx4cefJKWuQX8N0eFyrW3gZxkr/QwhU5UailbEI56E3pHxuBd7
yCeg+/K2tQ7dqAfv3xefMT2AmsOqNJ3dhfUsjZD22CnYMQUnM4Ec2Zzc2MK6AQeU
wSOH7akI53F68KvFOWv3QFV2N7xVTA==
=IEww
-----END PGP SIGNATURE-----

--f6ksgjaxmglv7ul5--


--===============5098322793955595224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5098322793955595224==--

