Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D842FC05027
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 18:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6poBRLS3BZ2vOacsXh+atn+k4e6ZgOrRut+XfpOG0w=; b=hRrfe8CPCwQosogZUScYBSvc38
	xArBtaB+tWKZ+9sWHUlDc1jC0Pe6fm6+a2QGFcZS42f4dUQbwru032m90EAFKpzdHs7xKbADu8pS5
	HmqcnfHugqHmnApXToyRjrnCqu9kr9lgmYknfnDCY3GZ0w+uDV/+/wFgSMdap22V3P3HFske4P1gB
	NA3/wXIaps27RRzDyNWIWEFMR/wXl18NkgcHSYn4UwkW0ldq94EwWIhQ3pKl5pv9lI3SG0xrrDOWk
	cgOymMeL3etzqSsSDKun5LnmRY1MDVtt7Jy2EVb6fqMl+jiUvwuIyJK8zU0QY+uwfVx8aML5eQVoM
	/z2hXSpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRGjx-00C2Fb-C4; Sun, 12 Feb 2023 18:06:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRGjs-00C2EM-Ob; Sun, 12 Feb 2023 18:06:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A302360CA0;
	Sun, 12 Feb 2023 18:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C830C433D2;
	Sun, 12 Feb 2023 18:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676225169;
	bh=lp88wKQLqiF3Hiyw44dr0tpOeS79utafc+HLRjWlnYg=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=raJG3DXHPsmVeD91Ru+9mmbE/4O4IYRntyJ3WTHhIqt2KY2fmSrEnXz2x5bq8NLps
	 pbLRXwK3BiBMN1LQNpUmZCcOYpPg4GlwJVZGv3W1Etv/r+cmPBQvo/yc5vFInIaF9b
	 Aie6WTLql1XOemrAWDJjniRKO6aD23VkBeEQaZ5XAfmnB9/NOML93vi5Zp3aNbLeA9
	 ykexNiySadnHumXTDovz1HQUOmqPcZYSSJhMLjkIS7tqhzIw7Ea6MPcVJYWuyDJk/L
	 inx7/PxQvnaZ7X3yZ/28faDwVb99ZToMT7ZkoRcFGuHtZ6v5zzyxCZqO26gp2fMHwV
	 UQfnSLYUISkLw==
Date: Sun, 12 Feb 2023 18:06:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
Message-ID: <Y+kqi8bQE+8hLfOF@spud>
References: <20230128172856.3814-1-jszhang@kernel.org>
 <20230212154333.GA3760469@roeck-us.net>
 <Y+kM//nuDv29Z9qJ@spud>
 <Y+kU9nDBTttZRLLq@spud>
 <Y+kcgcncQO/2DNLo@spud>
MIME-Version: 1.0
In-Reply-To: <Y+kcgcncQO/2DNLo@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_100612_884247_8B9B27DD 
X-CRM114-Status: GOOD (  15.50  )
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
Content-Type: multipart/mixed; boundary="===============1282200074689488654=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1282200074689488654==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GmLjP+yv5qcdEtuf"
Content-Disposition: inline


--GmLjP+yv5qcdEtuf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 12, 2023 at 05:06:09PM +0000, Conor Dooley wrote:
> On Sun, Feb 12, 2023 at 04:33:58PM +0000, Conor Dooley wrote:
> > On Sun, Feb 12, 2023 at 03:59:59PM +0000, Conor Dooley wrote:
>=20
> So as not to lead anyone up the garden path, let me correct myself:
>=20
> > Hmm, so this appears to be us attempting to patch in alternatives where
> > none actually exists - seemingly F & D.
>=20
> And of course that's not true, riscv_has_extension_likely() now uses
> alternatives as of:
> bdda5d554e43 ("riscv: introduce riscv_has_extension_[un]likely()")
>=20
> From a quick look, it just happens that the only users are F & D.
>=20

Samuel pointed out that this is a lockdep splat on irc.
There's a patch on the list that removes the lockdep annotation
entirely:
https://patchwork.kernel.org/project/linux-riscv/patch/20230202114116.36957=
93-1-changbin.du@huawei.com/

So ye, no surprises that it was config based!

Palmer posted a "better" fix for that lockdep warning a while ago:
https://lore.kernel.org/all/20220322022331.32136-1-palmer@rivosinc.com/

So we'd have to duplicate/reuse that for cpufeature/errata patching.



--GmLjP+yv5qcdEtuf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+kqiwAKCRB4tDGHoIJi
0vcsAQDNCg9J+6Vcsh5GKfX2XL35m7Wf0yDTU5M28FIiLYqBUgEAshGaQIbqzGuw
8lC8srYQoSDY+hH/TPM6ZvHj9k1AqQY=
=Vm7y
-----END PGP SIGNATURE-----

--GmLjP+yv5qcdEtuf--


--===============1282200074689488654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1282200074689488654==--

