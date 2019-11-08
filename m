Return-Path: <SRS0=zeqi=ZA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AC6C5DF61
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2019 02:21:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8055F2084D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2019 02:21:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="li5RU0M3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U4rtQaWy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8055F2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LK/QM1Yamk9rIN4peCh8ILHeVw6ajEFwjd3/RJFmx9c=; b=li5RU0M3nx9UhLz+0iWxJJtX4
	Z6pnaXN5Z9XCw9BQaK23HKA6nVSXB77wmOg0qOE7Zb31toRDihL0XWfucVVLgkIX8gc9Rl7D2m8IS
	0TIa4ALEkgVDqa5qOilfqU2Bv+qtFyaFKaMpnYnXFAlOkHnLiCAClM983e5/wOk55t5vsNN+TP24i
	qLxSc7EOulOD/tUIpR51vFMAqKnFAftrMF6JFdjPPjcEi10HRMrQ4fOxfWakeQwua0WufI6ekHF8T
	t8QM6vm78q+f/FBWgekEpEGfaFLe3vRK6PxCM+HobI866Em5cYnruIVXA/pvVYtvlEx4TImTjWdc9
	lCZ56OgKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSttl-0005cB-Aw; Fri, 08 Nov 2019 02:21:17 +0000
Received: from ozlabs.org ([203.11.71.1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSttE-0004sd-OC; Fri, 08 Nov 2019 02:20:46 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 478PBS3PfSz9sPV;
 Fri,  8 Nov 2019 13:20:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1573179640;
 bh=S6Hvp/X50jZ7EFZZYb6XjoD8DIp7pBL6EOxbI/Y+OmY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U4rtQaWysYr5ul3hUzj3tXyGWA+dGyTSnc3y2qfDAh4w887T0Hzfb8DdEqQP21j78
 bLKePda8G55isteH/DTvpPd03ZK9+vFIP2iUGpxiv+3xIK9OuZtjmN/RAIpP15dfdj
 0Ld5faxNX3hXehfbb36CbglNc4LqiXGpHLudhhFf9471GTQ/nh4M9Ia5iSSIjnNJxu
 63CUKpyBsz0dhmHgaL3lh9b0hx4Rx9HV9YWgOC91UBjeJRdrNX18Qn75Ld9VMLlUVV
 mTc9cTLqYFj2lbrszxLu+sBzbYPOLWb8hL6IZrY3G9dxk9CJ02Ie/8JWe6/omQo4Sy
 vyjmwU0AmsEPQ==
Date: Fri, 8 Nov 2019 13:20:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: generic-iomap tree for linux-next
Message-ID: <20191108132000.3e7bd5b8@canb.auug.org.au>
In-Reply-To: <20191107204743.GA22863@lst.de>
References: <20191029064834.23438-1-hch@lst.de> <20191107204743.GA22863@lst.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_182045_027033_4126968A 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: multipart/mixed; boundary="===============5698636969386706776=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5698636969386706776==
Content-Type: multipart/signed; boundary="Sig_/cPVZY9JpGW.gARWJr=rYvJb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cPVZY9JpGW.gARWJr=rYvJb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Thu, 7 Nov 2019 21:47:43 +0100 Christoph Hellwig <hch@lst.de> wrote:
>
> can you add the generic-ioremap tree:
>=20
>    git://git.infradead.org/users/hch/ioremap.git
>=20
> to linux-next?=20

I assume you mean the for-next branch?
--=20
Cheers,
Stephen Rothwell

--Sig_/cPVZY9JpGW.gARWJr=rYvJb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3E0NAACgkQAVBC80lX
0GwJFAgAgWvXVOBZdx5Do4eCmZ0ZSFyBsTuUtYHPbtNtwQy/iB3LV9BkCAPS767N
fkEYwRYkqSzUXOA/WIHUXJad89wLVEs1LjxmjeEqJQ2TvsUFGO8vjnTPyXDrfB3W
VTmeqX0QVqJIwGn29lL9S3UqJ1r1FZVLCcSFLOZQzyRCWmgT+sF9Hofg/5Lwv6xV
2c+V3LdCr0cTLB+ZHFOz0toYCQMeXlRJM82WAUPhV+jYc53MqEM2VxmJ2G51xIJm
YEIGyjw5cgDkdJhgj0f+iXPoG7BZ7OM6KPpEVZHEv6pdVP2bcuz37swC+XmbpMAX
PVoofTbgfmgGmqZ8GiRY+i/KHc43fg==
=dI/j
-----END PGP SIGNATURE-----

--Sig_/cPVZY9JpGW.gARWJr=rYvJb--


--===============5698636969386706776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5698636969386706776==--

