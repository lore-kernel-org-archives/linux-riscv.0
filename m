Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9D1F4BB62
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 17:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5+8+vbr3fz7ldUZ2jcbXpN5mI182rKfastxcpO/JiE=; b=OwYEmzw8V6y/1UgldcsacIZXd9
	bh5CxrrNWGFUcxZkhK2UoiAfu7xwPVUG9L791Z8YsFZenE9q2uOv1rgWeRoinxjyt7UdOOayll+4R
	ZEKS163JTNIyFeJnARN72J9Cl/7RxHas6siK8J0NsYjHpxmDRy3eF1jFnF+mves+S1PJq5A4sXNIB
	YjRdutgz0U3qZLqgjiVE6xYulawfxqJMWDTyNCZVKngiSScZBu2wcHhxWgUYH28LSq1zafwBTfZ4k
	6HKrPgyWt3MlLyixzGqIhXRmiYBZwJZf/Kra4xVO5jpQ/MuYdiUu/0x23/joTRqYg/7mtnZdf4QaN
	16cSUypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuw6M-00000002UFg-2qym;
	Tue, 24 Feb 2026 17:21:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuw6L-00000002UFN-17eA
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 17:21:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D79C340B09;
	Tue, 24 Feb 2026 17:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AE9C116D0;
	Tue, 24 Feb 2026 17:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771953696;
	bh=hKcvMugV9CPhS4iyHTJvyrCkZUeZHcDYBMrFdgjRVnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGmi35yAEaRicTCcakwerXleGB8jK+1/DmOyph+zxATNFzz8gohfVdcDa9k7dUiwI
	 4NrDnYuB32m0Go4BCsXa/wcQky5bzNlwHeMumkbFDluctAzrOAhvuw1o9NopBac6i+
	 2kwBO8hM6R3crxX5uUW7oJVcuuHAWx7Z2RQZELHq4q5rFlP98eLmu8/ad8uep/cih2
	 V7Gasd4ceF8vnDTOkFYlSv82bTniL9sJ8MHa9q9mZQ/3DOBdyRWb8Z3bSmzJuurhen
	 MAupEBTE+k/nyEnGEe1M0VCU8jDwP3CLTCXOuDHq3FDS0+Hvcljj5E1uBAK0Yd1HPU
	 NepuPcevFhGzw==
Date: Tue, 24 Feb 2026 17:21:30 +0000
From: Mark Brown <broonie@kernel.org>
To: David Hildenbrand <davidhildenbrand@mailbox.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Ron Economos <re@w6rz.net>, wangkefeng.wang@huawei.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, ziy@nvidia.com,
	jackmanb@google.com, jane.chu@oracle.com, hannes@cmpxchg.org,
	willy@infradead.org, muchun.song@linux.dev, osalvador@suse.de,
	sidhartha.kumar@oracle.com, vbabka@suse.cz,
	claudiu.beznea.uj@bp.renesas.com, akpm@linux-foundation.org,
	pjw@kernel.org
Subject: Re: mm: Regression with v7.0-rc1 on RISC-V
Message-ID: <fef1758e-c123-4253-8fe2-aa510992c977@sirena.org.uk>
References: <1b17c38f-30d3-4bb4-a7e1-e74b19ada885@w6rz.net>
 <13b8d60d-1209-4650-9fa5-982381c53512@kernel.org>
 <1966378802.577797.1771952827516@app.mailbox.org>
MIME-Version: 1.0
In-Reply-To: <1966378802.577797.1771952827516@app.mailbox.org>
X-Cookie: An apple a day makes 365 apples a year.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_092137_334722_4518E8DF 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7438617917405042807=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7438617917405042807==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H+q4jLH11yLXxqL4"
Content-Disposition: inline


--H+q4jLH11yLXxqL4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 06:07:07PM +0100, David Hildenbrand wrote:

>   <div class=3D"default-style">Thinking again without my computer at hand=
 =E2=80=A6 isn=E2=80=98t the call completely optimized out without CONFIG_D=
EBUG_VM?</div>

Pinged David off list about the mail being HTML - this was the new
comment for anyone else who's mail client just showed them the raw
HTML...

--H+q4jLH11yLXxqL4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmd3hkACgkQJNaLcl1U
h9Btxwf/WGmUPQHWy5O7GBCN+C37Glhe0kkbEmWgfeOPzVmJdbhpbOQcHOE3ykHJ
HjgXjJomrOb+rZdEvfBKMd/gs7kVpVcBi3OFTyFIct/dhy83OvHAss2Je2+4bf7J
kxhYIMDkHjVhK6J76Bo9t3stGpQbSCH4qHwlCaFB0iqbx9zILHaT8x6KbIv1iGJn
BFr32xQmuKqrNuE0l+/L+ZgbPqJyLCkCSsRVV2o8J/pjV4rJGvdB69//ZBABLc6y
a06SiTkBn3ur05Un3O7H8s1iZpp9wA8clIJME5h84HaKiw8GC05SOp2GX62OOWQ5
xseHJHf9gC2kr/hXSmCE3c4nLU3pHg==
=l2JT
-----END PGP SIGNATURE-----

--H+q4jLH11yLXxqL4--


--===============7438617917405042807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7438617917405042807==--

