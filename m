Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892B5C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Pqk7RjnOyVzosikVhc6AxXZEhFF7JpnjZdP+MRn61E=; b=iFFGVrabihs4YBRhTLvlIyDrLi
	nXANYA92Ik7sU1OQwmqLOn7Em2mEGyoXntdSGKZ8Ps0So7hAdp8OL3vg8OpZ6IvkLe3Y7f+c9tyuF
	R/feaowxVPlobT7kSHJXgAUCS42Rra7mTkdFKSzWESdKR0R5lB8hbYsYPDNG7m7a1PqavWC10v0fO
	IQoEH9zEWOq3w/OONHsJqt644TzXQvm0WLJ+ZS/769W1RQvW5xhxTPMUUazznKh29MmvCEzXpzV+v
	VTsEislU3Oi8l7fFPEJ40kh1O3EnhHKJDgrS6ClAhJaaXHo2vuDIPk/wW73+GzErFLtZM+sSj1bMO
	K5kx1moA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0q7-005pZr-0A;
	Wed, 19 Jul 2023 06:39:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0q6-005pYy-0w
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ft0pZeRGcxSCLViSj0gpccBQLxFThl7+npAOY8U0YXk=; b=lcC2jlo+omSp/+oIpe0HKEziOh
	s+IHZwToE/kMgLDykNDeo6GdGr8Yp7ft9/c0F5lMs4CRex1ebhMiqSxXPdzjg1NhKTNG15IyvvVb8
	0c8Juxo4ucLuU7mKBnCN+koSezNjx2lIoAScUGdOR/OUgPunBu5jwQ8SL9F1v1/Zr+UxW/pjw3c/L
	HhCSrNI/Z3SfwWGyAtv1G4glryZP0XQwyMRcIW4Zh4Oe4nqPO1JThh2MKXYd2m6mlefMFO2HKDoxV
	xyAuZGeEux0mvWurjuUWDR6b0RTBXxWqmX5Y4TrI5PpIA1+7BdCMlF5aiPqmf9sAVWa8ti1DKJQIS
	ZYNt219w==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLtLP-00C9rU-35
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 22:39:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 987DD612C5;
	Tue, 18 Jul 2023 22:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD43C433C7;
	Tue, 18 Jul 2023 22:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689719933;
	bh=ft0pZeRGcxSCLViSj0gpccBQLxFThl7+npAOY8U0YXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qbLHYHwJ16vjba/YKmSZ6+kQdtrhywcnd7NEm1UhXFKhq28m9ej/cfF1oAHVOozqp
	 tHVNcbCaznUp2eCrx+NeRljdoOXCoHWB+0sRJQOiSVTFcQDr3GAcnKR5xl8GofAP45
	 OtFqPxllJ8SxO/OYH7qAXozA/25q1J8BQ0FvQEAGGVrG8YHhL68LucWtSVQiFuALn4
	 70Gvu2MFWVna7T99qYIjf3EYdpDSMk/HtZw4RwO661Ih8VN7WXwRrIcnnVXJISPHUS
	 0C7MJz2/kzrzMJ7Zpl24pdn8nOqOGJmBR7WK4TtX0oIQoKdFBfgseu/Va8voylNbET
	 4FUA7b0nETmpg==
Date: Tue, 18 Jul 2023 23:38:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Jookia <contact@jookia.org>,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 0/4] Add support for Allwinner D1 CAN controllers
Message-ID: <20230718-matron-backlit-ddf56c391f8a@spud>
References: <20230715112523.2533742-1-contact@jookia.org>
 <96641e09-c676-2702-149c-885002f45a64@codethink.co.uk>
 <20230718221504.GA2015343-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230718221504.GA2015343-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_233900_320740_F0759017 
X-CRM114-Status: GOOD (  16.19  )
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
Content-Type: multipart/mixed; boundary="===============1944197308753228829=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1944197308753228829==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cqqc/lv3UK4SVqTX"
Content-Disposition: inline


--cqqc/lv3UK4SVqTX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 04:15:04PM -0600, Rob Herring wrote:
> On Mon, Jul 17, 2023 at 09:00:47AM +0100, Ben Dooks wrote:
> > On 15/07/2023 12:25, Jookia wrote:
> > > From: John Watts <contact@jookia.org>
> >=20
> > It would be better if you sent your sending email to be the same
> > as the from, I think you'd technically need a signed-off-by from
> > "Jookia" as well.
>=20
> The email needs to be an actual person. 'contact' doesn't appear to be=20
> one.

I don't think it is that complicated, a cursory check of the domain
suggests that "Jookia" is a nickname & there's surely nothing wrong with
not having your name in your email address.

--cqqc/lv3UK4SVqTX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLcUeAAKCRB4tDGHoIJi
0gFRAP97y0ufNPfdKPAqRJk0x2B640Tp0m/2UvKiv1Kb+/FzHwEApZbMd48vDPFx
97j93TdvKGT2uC1XqbKlFQL+p1TpFgw=
=VWl0
-----END PGP SIGNATURE-----

--cqqc/lv3UK4SVqTX--


--===============1944197308753228829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1944197308753228829==--

