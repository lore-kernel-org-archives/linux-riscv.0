Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCC6C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 19:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3praiwrDC5NtrDPqNGx8ZWps+wyL+fCCHI9r/EcNfL0=; b=FW6n08vxRpNACXgBJV3XneyKCZ
	PqtiYOQCv2LObUh4c/N2gHPlXwNa/8VDVH3ZeAMNgBOuMoExqTh//WgU0jF2/+VEgvL3z+uc6OUif
	fQu44RvNGcHHcgGQLemzhzktc3Mm8YOoDVxDXNR0wESVufbzTSxoBB3YWRbwKgSvJSJp4nQegC+Bo
	MSMYM+yB7gnVSU8BR2KCb1aV7x6vN/Wktm89q7lt6TC5arANxa6lw1wGGhIERTu8/uvRW8yURVxik
	4Kw0qfJe3lcJP+xH7bmET28YdT9j/eIj+sUQQ9zZi5mJ1gz/PX8tqSlJOMMCzDwNaqCOrnSng0TP4
	wXVnuNSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxB6B-0000000HNzF-1YcE;
	Wed, 17 Apr 2024 19:37:39 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3006::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxB64-0000000HNxF-2HpS
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 19:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=C7UOGz4cfMuUlgzQCx0ka8A1vycTIcJZk/BYF5U5pwA=; b=HC2IFy++2Z/KFfCvOBBSgz0+YU
	Qh6O1lghVKnLxii3U72e6jpyeMAPzt1C4cih21Ms9FAz+oAZrzva931eMyUdIifIe48V5UhCczHGi
	LDNuDcOOk5DvF9Doj7KCkE3gGcreOYjuS2xoUo4hVLh1Csy4PxvS2fCJJSZ05SLFdlVac331ZLVH8
	EvQejIVV5iNYw6SVppD9wz/vtMerqeIJFbDZR6X9TZUP/N0Pec6v8E1ykfPk+W/dakPk+h7h6Jm0n
	d5M6+/7/dVthAWw6eS0EvfXAw/kOR8XOZvK3k3Np2F2PHyKNStU1kvBmpBkFzWmsYkGtfL6s/sfBE
	KDch3bAQ==;
Received: from [2001:9e8:9e8:6e01:6f0:21ff:fe91:394] (port=58278 helo=bergen.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1rxB5o-001R6W-V3;
	Wed, 17 Apr 2024 21:37:17 +0200
Date: Wed, 17 Apr 2024 21:37:08 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] kbuild: buildtar: add comments about inconsistent
 package generation
Message-ID: <ZiAk5Ikh-UFZ2554@bergen.fjasle.eu>
References: <20240414174139.3001175-1-masahiroy@kernel.org>
 <CAK7LNATqLwewFaMNEy6yDguv5mNoGZJus9p4kbyMOGV9T+yopQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK7LNATqLwewFaMNEy6yDguv5mNoGZJus9p4kbyMOGV9T+yopQ@mail.gmail.com>
X-Operating-System: Debian GNU/Linux trixie/sid
Jabber-ID: nicolas@jabber.no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_123735_409996_417377DA 
X-CRM114-Status: GOOD (  14.40  )
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
Content-Type: multipart/mixed; boundary="===============0233745604866082842=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0233745604866082842==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9IC+ahEzzWfG8TN+"
Content-Disposition: inline


--9IC+ahEzzWfG8TN+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 16 Apr 2024 11:07:48 GMT, Masahiro Yamada wrote:
> On Mon, Apr 15, 2024 at 2:42=E2=80=AFAM Masahiro Yamada=20
> <masahiroy@kernel.org> wrote:
> >
> > scripts/package/buildtar checks some kernel packages, and copies the
> > first image found. This may potentially produce an inconsistent (and
> > possibly wrong) package.
> >
> > For instance, the for-loop for arm64 checks Image.{bz2,gz,lz4,lzma,lzo},
> > and vmlinuz.efi, then copies the first image found, which might be a
> > stale image.
> >
> > When CONFIG_EFI_ZBOOT is enabled in the pristine source tree,
> > 'make ARCH=3Darm64 tar-pkg' will build and copy vmlinuz.efi. This is the
> > expected behavior.
> >
> > If you build the kernel with CONFIG_EFI_ZBOOT, Image.gz will be created,
>=20
>=20
> The correct sentence is
>=20
> If you build the kernel with CONFIG_EFI_ZBOOT disabled, ...

Thanks, I appreciate the detailed descriptions and comments.=20

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Kind regards,
Nicolas


--9IC+ahEzzWfG8TN+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmYgJN4ACgkQB1IKcBYm
Emm0+Q/5AaKrBHVyleIlKiQPc4+aVIWSJxINp1Rz8+XO54115MSL2/9lnUvVKzO9
/cDZfsC/lFwPRtICfXww9fqPgNWKeDpKRlIKH/KcfUpS8igt5gFSx+PbOO8lfKib
67FFL/WTN3reNzMt/aRTWIoSmtz8euPWFBV2534sHwtigniZGULmfwCzAMgFIMZe
glW8iGGOddQCo4veXdLLiOspuEis1NAeNLD0ziAcREud4LF7z3XBOfMRzng7vQwk
RavQoqTJWCdVo3ROuCYkeS+T56RyzibuVZB2CNhCLZ9pjfgr2ghf7hgE3grGfakv
BnPsrKaY5HDjOKgee1kR3CNSFZF0/7hgaOkqGzLjndwEWcxcKYhXVxrs3gpIkojX
2uvEJ5o23chY3odVNNKGJ+sM0MbuRHN50ewj9rZY0zFFpEnEyXMW63/GbV0zyH13
QWjwG0taC2ur6q7CqVIFUGszTlhfoEBw6i0dBhL1URvzkvpBHezOzMWQPpU8zMgd
nKp5V1EhvYUNcFSumykYwaFUZfW37WQrQoAV4YDmXiEOBZSDrWftnOHFzZ1nPUbB
Jf7QfvTFX/Y06w+nk7JMK/3zPZ4W0Hema5YzJI31rwAnDZ3tsoPLN8DdrT782QwM
UVwML0pd5QAuHCcj8Y/98nHKWxMxS8b2dLR8gZmi7Cn3bI3Jkrs=
=bEWj
-----END PGP SIGNATURE-----

--9IC+ahEzzWfG8TN+--


--===============0233745604866082842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0233745604866082842==--

