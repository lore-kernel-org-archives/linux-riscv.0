Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125EFC54EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 22:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8hYWx0c7gE7k6usJs0nG7NeOrfk7EP1sLFRNp0/xjg=; b=qgQqz6ofZMlJnHHSd+DSgG6p2P
	XtZBYQFpdpbdaoZJDexFjCFaGkHfHdUZwRQzLSoDw+m0oy2MjvN11CZUr+S/cQAygaANNNtYnXTcz
	Kvfb6XpYRIKgqJioS4gb8yyaZCDhC8DV7gFvfVEvQBRi63jFQJsehqvbDMl5E6qA3Q/EZDVKrnlVD
	xHWg9bhYwtqgVqFcLOD6XlE+biUTSWbpYtA7xQv51ZxGiyBp+hHHFSUazYmo4cxqh4b6twxRHy1ny
	5x/5pnCY2TXn5fNd2jXaO1RRa9x5NJQPVyKj22k0d4PWMgAxyw/XYuFe9UueBLXxwPApPXEHJjBln
	DmLi6N4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFN7Z-008mGh-8Q; Tue, 10 Jan 2023 22:29:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFN7W-008mGC-C4
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 22:29:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C740FB819AB;
	Tue, 10 Jan 2023 22:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBB3C433D2;
	Tue, 10 Jan 2023 22:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673389763;
	bh=cpgoneEESoOwYTW63FIfGWY9WzxbekrB8D55/b/kfIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kd4HGDcs9C0uAx6fe2A493YJOR7w9F4QlCL8Ku4XgZPEZP/jtG3FWIAUBpYqVNZe/
	 eDkNZKNR5GxTsZivPORvZadd/r/UKYZjAoQZQLf+UHK8de0WnbOrp8B9zpKiv+7LhS
	 BSGQM+SFRsOBxLpbWBpUTqNo9u1aWk2AGqI72jgK/1J5wk0M5nmdItfGgcLBRYk4bO
	 7uu8SXKplxwOyDjET47CjR6ni5nonPFDCS65hO1tXZszrU94pXnwy9VmsRgVlgy3iJ
	 qt2dKUEXvcwpygvNSTmGdlll+NMUghywsYzYqLNAvrjRYEa+U4zcXuUmIe+9i4Oh3t
	 KWpvlT+jL5gJw==
Date: Tue, 10 Jan 2023 22:29:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	palmer@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Guo Ren <guoren@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>, linux@rivosinc.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: elf: add .riscv.attributes parsing
Message-ID: <Y73mvsYpEv8FxXPR@spud>
References: <20230110201841.2069353-1-vineetg@rivosinc.com>
 <Y73g/nkDe7Sfp9ps@spud>
 <dfffd3ab-d607-9b1f-92a5-24a798807849@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <dfffd3ab-d607-9b1f-92a5-24a798807849@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_142926_584438_0D0BC872 
X-CRM114-Status: GOOD (  14.20  )
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
Content-Type: multipart/mixed; boundary="===============6781514654574609561=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6781514654574609561==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L63ZHz58XQpsN3NV"
Content-Disposition: inline


--L63ZHz58XQpsN3NV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2023 at 02:16:58PM -0800, Vineet Gupta wrote:
> On 1/10/23 14:04, Conor Dooley wrote:
> > On Tue, Jan 10, 2023 at 12:18:41PM -0800, Vineet Gupta wrote:
> > > Reported-by: kernel test robot <lkp@intel.com>  # code under CONFIG_C=
OMPAT
> > You can drop this, even if it reported against a private branch AFAIU,
> > just like its complaints about patches. As Greg would say, LKP didn't
> > report a feature!
>=20
> OK. Personally I tend to add Tested-by (vs. Reported-by for the same
> reasons) to still give them the credit for finding some issue.
> I can certainly drop it.

What I've seen Greg say is that you don't add "Reported-by" if someone
tells you your patch doesn't compile, so why would you for the build
robots.

--L63ZHz58XQpsN3NV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY73mvgAKCRB4tDGHoIJi
0tZTAP99tuxoONk5ydeoUofcmIhHXlE5ss8pWF5xhgPOorhkbwD+KJmwouKAHnWD
UpDk8UVqqi884haUuMJ2BoA9BDW86w0=
=+V2V
-----END PGP SIGNATURE-----

--L63ZHz58XQpsN3NV--


--===============6781514654574609561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6781514654574609561==--

