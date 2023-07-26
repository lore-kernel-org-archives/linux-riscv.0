Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E8AC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 18:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m20v8i+fc+xWUESvYwyexKJ+tqwX+0GoofejDceFYok=; b=JsUvjEQHqa1S/YI7o4dqosN/WA
	x7KMLvOvip8qp39Rnv5zluTXxXvkBvoAzLauuHaKumNy4Xh/iqXt62igNv4NHqDOLMmM1eeZGeOqz
	011kCNCnCWoieCKbdTFV7Ja2yNoltnyj01TCCG5ECsB0DtRZUHN0Qci0iNQYdDz4wBu6GB8OZEwdN
	E1hC06wo1BPmTSmIqljbIsniL6ZFfDmzrvZVHAZgickRK8jzOx+fVjVVF17AWSY4/JX8CjfT6hAJp
	IGIBoqFSJ+ZM8WXUA/Zf1wcmUfCFp4jB8e3c167jG6CFxoOWhASBp/UcYQ3KlSpip3lvEPghg1lFt
	Qa3U8KJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOjPj-00BIEr-0I;
	Wed, 26 Jul 2023 18:39:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOjPg-00BIEM-0i
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 18:39:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8649C61C0A;
	Wed, 26 Jul 2023 18:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05377C433C7;
	Wed, 26 Jul 2023 18:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690396747;
	bh=8+Om66fq5vH8tTHbxMnZl3lSxX9EY3u29MUPAIlkj84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pcFaUgXV1kHXiX7vgQq1Vy2wMUSpdmjcQYRGg1zsYS1vPNqpSMDCFhhHX6dYgBITi
	 gKlGm+3MfXne6+gZbeugaMbLIjH5+dAxJQ0zl211dlkISYCM3mHG+hBTnGb5DeWCad
	 vfHSerbTRld4mxk7L7Nmwrbipy01CLWxyvCW+HI2XdDSJ80jhMdALIaUSgHNrkQ57k
	 yZx9anXUd2RXVX8khe82v+Yf5U6ULW9N8USB/KcpRY5u1BJLyJK+jUJjpbgGKiUSac
	 g2ZipnOZTMepRWHv+b0EGr1Uh+ZJzto55erMHFF85IvWvQmOpRBrs0/uHlQ6UFSjxA
	 KtTmdLjo8IYHA==
Date: Wed, 26 Jul 2023 19:39:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>
Subject: Re: [PATCH v2 3/3] MAINTAINERS: add reviewer for T-Head RISC-V SoC
 support
Message-ID: <20230726-brutishly-skeptic-7aa83d27f359@spud>
References: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
 <20230722-upstream-beaglev-ahead-dts-v2-3-a470ab8fe806@baylibre.com>
 <ZMBmalZwaRCiy2BG@xhacker>
 <CAFTh7p3m+4kLxPV+NXJWSRW-ZDZv930z=SbfuELmgcZFnQ4fig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFTh7p3m+4kLxPV+NXJWSRW-ZDZv930z=SbfuELmgcZFnQ4fig@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_113908_320137_76B06283 
X-CRM114-Status: GOOD (  21.50  )
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
Content-Type: multipart/mixed; boundary="===============1329616290432006649=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1329616290432006649==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k6PL8mYmCJJPogle"
Content-Disposition: inline


--k6PL8mYmCJJPogle
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 06:38:16PM -0700, Drew Fustini wrote:
> On Tue, Jul 25, 2023 at 5:30=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org=
> wrote:
> >
> > On Mon, Jul 24, 2023 at 10:20:40AM -0700, Drew Fustini wrote:
> > > I will maintain support for the TH1520-based BeagleV Ahead board so
> > > adding myself as a reviewer for T-Head SoC patches.
> >
> > Hi Drew,
> >
> > Thanks for your interest in maintaining the SoC support part. However,
> > maintainership involves active reviewing and maintaining the whole SoC
> > support part and not just specific board part, although currently, the
> > SoC support in mainline is minimal. I'd like to see your patch
> > reviewing, testing and so on.
>=20
> Yes, that is understandable. I was just adding a Reviewer entry as I
> am supporting the BeagleV Ahead and I would like to test patches
> related to the th1520.  But it is not too big of a deal as I am also
> subscribed to all the relevant mailing lists that would receive
> patches.

You can always add a new MAINTAINERS entry that matches only the
th1520-beaglev stuff, if being added to the main entry is not
acceptable.

--k6PL8mYmCJJPogle
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMFoRQAKCRB4tDGHoIJi
0q2XAQDcF6byw5/+G+if5307AhUC2ZglmdVuLxyzt3Ow6vPuIAEA473xXpj2wcsH
NZ7yhpYCDCv4MDPGyecFaUSXBdCDiAs=
=y1tX
-----END PGP SIGNATURE-----

--k6PL8mYmCJJPogle--


--===============1329616290432006649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1329616290432006649==--

