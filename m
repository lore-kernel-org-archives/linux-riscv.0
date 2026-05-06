Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB7FCD3436
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 09:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwLXYkFS+Sb9lAkBbvHfsIueyy8obWEtRlb8heovGmQ=; b=OYw/PsgJE+zDZWqc6Ee6jq2CbZ
	g/4RAGrZIxbpUJlg7RDGwwHKWZsgbPvGahXRYYpT+eMiWodQCSiLRmYGfnclkKu428KVkwnWp/FcK
	WdIOIcceYnINpkUgttef32dNE96rT+aQSnDAdQe2/RXgi/BC8i4a5bSSqnxiZSKTsrLVw834WjMOS
	XS9CKzjUxta0ksEpFU4zg8mzvEQ6kn8ek1L2hs0hV0IXkP8gaJRmzcuZWjj7z2Ni3i4B25SutxINv
	QwnuxphHBztmCkFTVImATeu4Udxrim+ThdN9SdGZK8MhvITgadNwIG2oDu4tc4InMBTfpuhpc+y/N
	NNj0GddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYrR-00000000OiW-1Gwr;
	Wed, 06 May 2026 09:48:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYrQ-00000000OiK-0Duy
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 09:48:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C7D06012B;
	Wed,  6 May 2026 09:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47562C2BCB8;
	Wed,  6 May 2026 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778060886;
	bh=qErOzqaQMMAJY6k58Ykpwky/9HhgyaVOIcKlTW08gzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUN5Z6tojrMevg+I2BQfvG4PMFrXvCHacrTzljFmmpHdqbDjixhwCTgZgGfEEfoM1
	 yl4RwJfGcSsRYgugVPA9RW8g0NDSqb5uB6lHzVNp2m1WF266OnVfnPUCG8uDS+6bHV
	 bktRBjDg3sdyPBbp4VOdsZg1A6k6OgAG+gPfqFuhNn0PmEUTSFdvTO0dZUwXOddx4u
	 y06QAtlBSmudFVX9RK6HERiwBP3xNYJTf8geMadeVRiUxa53sZurfWyRFp8jg3Q33i
	 +DlwheDkJ7iNbhEyFYgAm/70NghxSl6OuuX5+1FKUkF/maWvBJiF4qd8cz5P2Z6lor
	 4qoykJruUBoNg==
Date: Wed, 6 May 2026 11:48:03 +0200
From: Maxime Ripard <mripard@kernel.org>
To: David Gow <david@davidgow.net>
Cc: Albert Esteve <aesteve@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
	workflows@vger.kernel.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Alessandro Carminati <acarmina@redhat.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v8 3/4] drm: Suppress intentional warning backtraces in
 scaling unit tests
Message-ID: <20260506-didactic-jumping-nuthatch-ed8b42@houat>
References: <20260504-kunit_add_support-v8-0-3e5957cdd235@redhat.com>
 <20260504-kunit_add_support-v8-3-3e5957cdd235@redhat.com>
 <47d78cad-0839-4602-9cb3-d1f672739e7e@davidgow.net>
MIME-Version: 1.0
In-Reply-To: <47d78cad-0839-4602-9cb3-d1f672739e7e@davidgow.net>
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
Content-Type: multipart/mixed; boundary="===============1162242725707665330=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1162242725707665330==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ikeusn7jscpsnzz4"
Content-Disposition: inline


--ikeusn7jscpsnzz4
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 3/4] drm: Suppress intentional warning backtraces in
 scaling unit tests
MIME-Version: 1.0

On Wed, May 06, 2026 at 05:38:50PM +0800, David Gow wrote:
> Le 04/05/2026 =E0 3:41 PM, Albert Esteve a =E9crit=A0:
> > From: Guenter Roeck <linux@roeck-us.net>
> >=20
> > The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
> > intentionally trigger warning backtraces by providing bad parameters to
> > the tested functions. What is tested is the return value, not the exist=
ence
> > of a warning backtrace. Suppress the backtraces to avoid clogging the
> > kernel log and distraction from real problems.
> >=20
> > Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Acked-by: Ma=EDra Canal <mcanal@igalia.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > Acked-by: David Gow <david@davidgow.net>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
>=20
> I'm happy with this either with or without the extra check for the warning
> count.
>=20
> Acked-by: David Gow <david@davidgow.net>
>=20
> We'll take this patch in the kunit tree along with the rest of the series
> once everyone's happy.

If there's no need for a new version, feel free to merge these patches,
I'm totally fine with it being addressed as a follow-up.

Maxime

--ikeusn7jscpsnzz4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCafsOTAAKCRAnX84Zoj2+
drryAYDFKQohrFhdIOfkAffAKzu3UtF0SD883nzuZ2hAiDMX/SQyJrA3L69XtETR
j46wkM8BgPm/YCKz+v4oTtL52E8WgdiXr5wZlA31A+MRWnnQBKYE6uXnkb2QRsYf
gZAJ0rj7Jw==
=FnnM
-----END PGP SIGNATURE-----

--ikeusn7jscpsnzz4--


--===============1162242725707665330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1162242725707665330==--

