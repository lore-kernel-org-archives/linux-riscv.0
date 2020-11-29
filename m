Return-Path: <SRS0=QNeR=FD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F32C3E8C5
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Nov 2020 22:11:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC8272074A
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Nov 2020 22:11:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iBdalv18";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="XDpBE+Nc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC8272074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fldmSxD3kewYGr2Kmdzo2cHtdk9VtXEK9ahpqQ1mdVY=; b=iBdalv18YFkJTULbKHsSy8O8P
	H+GLnEOMkcKSbETGDRtIoiAF/B1jtRlkKdoLJ43Uq41Jd/kOP5xOykNm5wYRYSggJrruMtrNVE+Fv
	2ipikhwbYxxJRL+l6k/qJfyYnlbRt3nIAJPG3wioIkUH1CrCbRhamE76yqRM0GHS2u1SBiSy66zgY
	Os4qo6PvLl2/1MdorcDNCpE+tiKT480bi3C0R8XodWweur6DJE4H/C/dETLIPrqxCLTPMrwP9fTCY
	ZZljaMyieaEkhSglTppGWo8oWdaZJIyecofr0nw1oAYGJL2bmZhdsmoBTST3oMrrkM4/t3a/O/YOY
	iEBiJnU1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjUuS-0000gC-PZ; Sun, 29 Nov 2020 22:11:08 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjUuO-0000fp-NE
 for linux-riscv@lists.infradead.org; Sun, 29 Nov 2020 22:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1606687859;
 bh=iXkhSMriV5maLLXF4ec2emP2gdExku4QakTNWEWxKUk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=XDpBE+Ncm04FRwJ8vuODrGgKLku41S/SLjyJKexDsg8yKXkkz1nq4E0r8hWZmkYVa
 sBpJNwquAuFevwavdDte9KcxOQtU30m39ANkaqQ28WzThFVrCaEZIdi6bBGkog4oqh
 NxDUHpDDQvRiIFnkufGLiPnZYponASPII+rH28Ns=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.162]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNcA-1kARCk3xVg-00ZPKJ; Sun, 29
 Nov 2020 23:10:59 +0100
Date: Sun, 29 Nov 2020 23:10:50 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20201129221050.GH456020@latitude>
References: <20201127183003.2849-1-info@metux.net>
MIME-Version: 1.0
In-Reply-To: <20201127183003.2849-1-info@metux.net>
X-Provags-ID: V03:K1:3k7JLc2Hawk0Hil86ZD/XR/DnpRxdu29H+22sf1XPZsO3A3cFlf
 SxQ/j3JYOOj5W/6OrAzXx2V3O076zc9+NrzDyDM8AZ8wqGocU5aewHzEQInNuo92+4UlsDD
 B+dmWGwciIxLEEEY8/RzK2w4ZvuG/ZUrlNEM1WfjP/lYlfRxEUuSgC0+llkx1LTYcu8lE+t
 5QoHc123fP+9CRYN/+MfQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PPw4bc4Tusg=:mupDuzXAshUvS65GdN+8BR
 /rLiFI9/5Z0tUqMq/dJViG9x/bF6MH+06xhtAoJa4XdVbdXG9tF0yqZT2SrwnWJdWJc0O2V1y
 /8orh1WzXNoHT4PDDB6CxJr5GN/b9oPnZxkL15TSkf5daQMQuWAhJxE+URDXtXg7nRXI6yg9Y
 OHO9ZYljwUriW6RjUL97GZi3dfGfFTZ8LLNNqfy4MZiCC6eed4zuXrSMRa0Wmu3lLZ9Qozhcr
 KlO/RYtp7kbxVsi2EBOxH0qDUytd1D4dbAILaedAkTzDzEz+IpJ7q50RPYzhJti03COA1W7Vz
 H+FtdxZMc7y6Zf6sGh1m614l3EMkplr9YWk4fPWjNM/SgO7x0BEWzdg1ShVOM1uw9dBeaXZor
 HAIhZ8O1zZ52a0Y9dsuZkDLUwc4ijHvM+zvdtNCyMcxz8MFHbMz2sDfNw6voWfYJYE3oskXS9
 j+jB22Xgo+tFP2Goi23ChJgRfVkrpjo6OruoCK9JVA11U9YvcWkYQ3r/t0Xaod5Jlt22SOkRS
 +GTlzhdh6mgjtkXssxIYHDfFcn0+nIcmfJRXr+8SYreTE5WlMpasDD2bwINEp2rjWpYwYAuKt
 vU15CgqAhGOUGIl3saac33BVUO6+cZG9QIAoA5FCKsbdrCrJn5ue/PrMh9fcCzhUsuyDS4agE
 5w27uuRB/sM6SaHV0nk0L0PlheUy+BU5IZuhmB4OlEhluox3EGWNXTxWkSreqkGidHG8uj0cT
 J6uRwXLBB6ahsp/+cWSb9xQ16VzOeBv/23hmvrlbFvMPiV8UgvnvwTS0DjEUcN8+/h+5tlcpy
 E60TDZ70kJKQCg/v1fJCS0aVHce6fgkz6h7atHTyw9of9lFauyayNnkf8vt28V8znk0nTVxJT
 SwhCuFdz7xvXV2yUt3fA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_171105_202517_384D0E40 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: bgolaszewski@baylibre.com, linus.walleij@linaro.org, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 jasowang@redhat.com
Content-Type: multipart/mixed; boundary="===============7452211096507662425=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7452211096507662425==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rV8arf8D5Dod9UkK"
Content-Disposition: inline


--rV8arf8D5Dod9UkK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 27, 2020 at 07:30:03PM +0100, Enrico Weigelt, metux IT consult =
wrote:
> Introducing new gpio driver for virtual GPIO devices via virtio.
>=20
> The driver allows routing gpio control into VM guests, eg. brigding
> virtual gpios to specific host gpios, or attaching simulators for
> automatic application testing.
>=20
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

is there a spec of the virtio-gpio protocol available? If so, linking it
in the commit message and/or driver/Kconfig would be nice.


Best regards,
Jonathan Neusch=C3=A4fer

--rV8arf8D5Dod9UkK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl/EHGIACgkQCDBEmo7z
X9vgjQ/7BGdfYQq78KeC7gpheGKolr7itYaIjyPeiwVUbLBnd98RdTr2u5bLTMJL
bcE7IrgMjDos6NW2AvHqwS/n2McBo07w3mW2u0CcWPNn2T31cgjvMRPacVpm6SXk
jYQ2Y9Yu/12fBWd6Bqp/GZH7brS00onhkkdjwpLJ85Kmj4T3BtPDVdteSgNyNQ+9
q0T06QDzgstQCOUN8Rizjfmm/kP62VyV1H8fGeFIbqWyChIeNy3CpA1y1cNH2YOx
8Qfot8iwWzAWjSHsYVZk5Nkf+4kV4/qVRNbVPvAhPBfge7zGJfwEmAmReEND4N4d
6TOeEmEPDNLPHv3TynOtUWgGVB4RFblVh2PDqynP5cEvF+m7zhv2ZN14hJL8R146
mPCU2pfEldzCloaiYEquriAXG+fTc7872OI7eF3oSzF+UyEs0HuZpsYZS17TVbhi
cNT1JZ2unfZmcFOM5Xp1J+VrJ1zYGHp+9EPTX8Cp6DEDG+HL5zxv5Vaa7tjrmmIN
7krg65s3g61Jo839BQQlJtb8P5BLU+RLDQYpiBS3X2YR3iCqCH4r3UWQyiRl3tcn
Sa6qNES5SHMhTXWS8FFCelolQei7XVJ19aqN1mtz+zSS85I5U1kxbVOuMTFLgzu3
K34XZBYz5Gj7Glv1uIF48IifPI5UVo1wlUy3roHIGBh36W4+fv0=
=SCq+
-----END PGP SIGNATURE-----

--rV8arf8D5Dod9UkK--


--===============7452211096507662425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7452211096507662425==--

