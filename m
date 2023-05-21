Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482C5C77B73
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnS7NauF7nJHCYGeja/hifY75Zt/d6XywC2wKXxBRig=; b=xJ1FalGHmm+UXJLROqV+qsaKTP
	cma+oi4xqtjqlB3H54lsDNrErXrM6jKxspI364wLJWDAgxN6FgWyRhCUcRlZgF7mB+8Gp/hLHEXGm
	BW1qHnlVG1yoQSGaUxUKwz2CBcGhvofwTDjA7c8MtZY+HvNgh/vNUyThrawJZkYz4a+fpgg5hi8FG
	tSLHE32MGIyTvP/vVwhpeAajm4kF3JQqGDMTpD3JHsh2woM36YQIgryNI6ENXCDLDFuaIcQvEwbz/
	g69cr+yoaMaBam3TFEQqWTY/fMTzBGsQShkXpcuT/2yaBhUAyzcedUobIIESFdH2UcXorq0sE6VFS
	zoY/nkIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0keH-0043Cz-1S;
	Sun, 21 May 2023 15:07:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0keE-0043C1-2N
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 15:07:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC99C60C22;
	Sun, 21 May 2023 15:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B29C433D2;
	Sun, 21 May 2023 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684681619;
	bh=l+u6FHkbB8kmjVU1F488VRFaRdgaVhVDtl8JxOJkRU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFVBwLbeDEuhuMiKWDTaVGKQyaUTYjYpQ7NmilBf9GoVCVtKmFYe45CgEIIPQy19I
	 nAhiskZU3PyEvzCvAI4F+IOKRZfhkzZoFWFvjhmpCACI3ecRmj3YnpRTnIkCvck4xb
	 QBZtjutdojbP4ZkVBtfNQdhUaz/V3ZEGBu+F+1WOMPXl4DZ/el9Ck7/FEBGhAsBBHE
	 tcxeUxHvXyLUu/UH45G/VBDzZN4ieB9OPm/vRGpYnQt7s8hvLUyGD6mOkp73XqTtPp
	 eEWLguhtFZii7Dn8dh2x4lf9aGHMXwW0Asr2AFf9LQGdrXSBJFnnhlso63LEHM6SCM
	 3NfbNQcFVpIzw==
Date: Sun, 21 May 2023 16:06:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: bmeng@tinylab.org, guoren@kernel.org, jszhang@kernel.org,
	linux-riscv@lists.infradead.org, npiggin@gmail.com,
	palmer@rivosinc.com, paul.walmsley@sifive.com,
	paulburton@kernel.org, tim.bird@sony.com
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
Message-ID: <20230521-cone-payroll-5b3ae791c08f@spud>
References: <20230521-pulp-canola-5df45b40474d@spud>
 <20230521145603.64751-1-falcon@tinylab.org>
MIME-Version: 1.0
In-Reply-To: <20230521145603.64751-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_080702_818021_AC33503B 
X-CRM114-Status: GOOD (  22.11  )
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
Content-Type: multipart/mixed; boundary="===============9169680998219874436=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9169680998219874436==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uY6vVpV3g1FmiABg"
Content-Disposition: inline


--uY6vVpV3g1FmiABg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 21, 2023 at 10:56:03PM +0800, Zhangjin Wu wrote:
> > On Sun, May 21, 2023 at 08:41:34PM +0800, Zhangjin Wu wrote:
> > > > On Wed, May 17, 2023 at 04:29:36PM +0800, Zhangjin Wu wrote:

> Btw, where can I check the patch status? 10 years ago, when I worked on
> MIPS architecture, I used patchwork to track the status, not sure, which
> web site we are currently using, lore.kernel.org or still
> patchwork.kernel.org? I use lore to read and send patches now.

Yup, still patchwork for status tracking.
https://patchwork.kernel.org/project/linux-riscv/list/

>=20
> > To be honest, I am not quite sure why you are sending some of these
> > things as RFC. The VDSO thing looks like something that should be
> > considered/reviewed properly etc, rather than "hey I have this idea,
> > does anyone have suggestions".
> >
>=20
> "RFC" added in my recent patchset is really want to get some feedbacks,
> especially, to learn if it is valuable to continue. As you know, the
> VDSO is required by most of the system, so, touch it should be
> carefully, and dead syscall elimination is another "big" change.
>=20
> Thanks for your kindly suggestion, I will remove "RFC" if it is not that
> necessary.

Yea, I understand why you're doing it, but if you do & noone replies
there's a good chance that it'll just get skipped for non-RFC patches
when Palmer is merging stuff.

Cheers,
Conor.

--uY6vVpV3g1FmiABg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGozjgAKCRB4tDGHoIJi
0oSnAP4gAxTWTCyhz1tzCR8txZnx829UJvAn1d21jSb2BaFl+AD+IgjOZ815hgcD
/afl9ZdIZD6DgxgwEqK+3ugNKWD1ogU=
=1592
-----END PGP SIGNATURE-----

--uY6vVpV3g1FmiABg--


--===============9169680998219874436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9169680998219874436==--

