Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B9FC25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 11:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ray5p6jDVk5GBl1qifbyrQIU91dRn61lpvFJSJIW5+I=; b=d/MjV+0aIQTVeIgNjKybz/T3VF
	25lFoWuzps9eOzfjSzvv3xNhwg9MPjRAcCptm3kL+ipCbfu8pKhqoI/ejIoXxv6Z1WdyGGGhFGfmq
	Hex6niw80WbQkAoOSU2zj1v17oDWL5rhyq95YlPpkTT8Gl/Tm1IBoK00JAEXYu7muKA35NDgQGLYU
	51BHPKxdMRq6OsLvhAVmkjYTIv0SEzkFkth/rOthYftBilvxfwIDs0U2HfvZ80O5Cg7vORSKt6nqK
	I4ojJR0AZbfd0TtObjnXEqlg8ikqA5hoL3/uKj6N0TCuPpnV2tzz8YkuXPCehzb7ALzOnrKokpROt
	gEB4mgcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9k2B-00000002leo-1R47;
	Wed, 22 May 2024 11:21:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9k28-00000002leN-2RMw
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 11:21:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B635F62481;
	Wed, 22 May 2024 11:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68AEC2BD11;
	Wed, 22 May 2024 11:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716376883;
	bh=6LFpisAJ3P2zL/wDbYfaPPwjur7WX2IAIulJ4g4PAAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iqoFvCWhL06a+t3NwIiHw7f7YkYWr6An8TRv4o2dAlkTeFZh0noWkl8eHYPTJ7/L2
	 TbYkFtaSP/IxDAkggFuA7DKY5bcZ8xT8qT4RVKbVJ9gdUQj9VrIdQqwiwRrEXLsqdA
	 wwyDT+5UTEQj/NZLNW0BfAxrgiC0oXA0JtJYoD5IWAvOZ+Hm7CWjxwkEJtxqrBYgLo
	 nWePa0mTUVjoCIZAWcNj7VvrxBbLdGB0OYgAeCBR/quUErwE7SWWeoscdX0UkNVTGN
	 z6woD/4Ji2GtDcuFgtx1+D7X5zz1NYYsVcAVcd8paZo/ykOopjL94IV7OfzK2D7O37
	 7LyBbaoe1ptyA==
Date: Wed, 22 May 2024 12:21:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Edward Liaw <edliaw@google.com>
Cc: shuah@kernel.org, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Kees Cook <keescook@chromium.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-team@android.com,
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH v5 02/68] kselftest: Desecalate reporting of missing
 _GNU_SOURCE
Message-ID: <94b73291-5b8a-480d-942d-cfc72971c2f5@sirena.org.uk>
References: <20240522005913.3540131-1-edliaw@google.com>
 <20240522005913.3540131-3-edliaw@google.com>
MIME-Version: 1.0
In-Reply-To: <20240522005913.3540131-3-edliaw@google.com>
X-Cookie: Bridge ahead.  Pay troll.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_042124_906370_459E29D3 
X-CRM114-Status: GOOD (  12.62  )
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
Content-Type: multipart/mixed; boundary="===============4885830271356608625=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4885830271356608625==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WIFHs1Yh6LyJ3Qfq"
Content-Disposition: inline


--WIFHs1Yh6LyJ3Qfq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 12:56:48AM +0000, Edward Liaw wrote:

> to make stopping builds early replace the static_assert() with a
> missing without making the error more severe than it already was.  This
> will be moot once the issue is fixed properly but reduces the disruption
> while that happens.
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> ---
>  tools/testing/selftests/kselftest_harness.h | 2 +-

You've not provided a Signed-off-by for this so people can't do anything
with it, please see Documentation/process/submitting-patches.rst for
details on what this is and why it's important.

--WIFHs1Yh6LyJ3Qfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZN1SkACgkQJNaLcl1U
h9ALrgf/W2wyJyKvxhDmFrYgFJhxqTL7kAvJooFztcjGspGzZ11XMWpg5qCx0HHS
CMQ056M6KjXP56PoyIJZUlgKZS/iTbNbN16CdgfzNjmm+bVoyI7RnHG5VU5ynmuC
BgqlUZvPgjjEyxrdq3VZTEnGRMkOhSyGofvXfHkmTyxG6iPMEQP7oBAiYyKitqw1
p16mfKVsFOWMVIa4Pz7N6DrB/DYMdLs+nmaueOfuqShFo4LwGkaP5f0ey5OFLqk4
RSB8dbe74T8sqtlAiC+2eAHk4PIT7tsmiyAK1n80aE2bf+JBR4hWjhrniS1JKSoW
znqrGa5yeQ/laQLifd57Xg0iW8mesw==
=umSn
-----END PGP SIGNATURE-----

--WIFHs1Yh6LyJ3Qfq--


--===============4885830271356608625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4885830271356608625==--

