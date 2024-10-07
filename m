Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67257CFB45D
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 20:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2sGH38njr0TPhlErCLaLMx4zfiJ/d8NB29swhvFFLI=; b=fIsJSX6/1KstECqM/W8LwS9piV
	eaBxNthVi+4ZqctQQhdeOCqWJ70hgdxpPSLwt/8SE2POLeGCsOUlTtXSuszXZMiyYvodYLg6mbhQd
	lU1whS6FkZoLirORxxZ1sFwkRcn7j9+ISXeYgdZri/0oogFlYMpf8jC1qsSYL9I6vWyx4aXfxo7gV
	/Ku+lVBayCoKDfJvlsLJLw+JL6FIeh9qy9iSgNIEl8T9EWV2T0uMNo/phElzC9/s8AzGspjTh838S
	EVMcTgAgrIBam/C48e1aZQ/5Jfpv9Nl10WFyFRNzilAae9uihI6HMXmTGRD7jr7zytLBaVoxU6qIB
	oVnDBdXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxu8W-00000003iQo-3RHC;
	Mon, 07 Oct 2024 20:15:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxu6l-00000003i5W-2XKa
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 20:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B61D75C4AEC;
	Mon,  7 Oct 2024 20:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523EFC4CEC6;
	Mon,  7 Oct 2024 20:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728332010;
	bh=OwIhuTuOCjUtH+lqgN/r1UqFieX0/XSad9XFiZtVLcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eRHaMUVFTAo7VuZziMXYKga3+9IlFNUBs1+w/AIQTM7RgYCqXpycouKGEvVepWApW
	 mN8Dfk0+OAS6pD18TFBoe8TGU9CerVHT8BL15YyDsB/0OS2287GfsvL5BNOLTV+rEc
	 ruox0bRTM2POMWw4Jtzbc85/q6BiuJXERmo4/UxDADxZ6g/nf6gXuSBqou+zkYStJC
	 bxvLAg5wGtrFLK11GWMslT5YUiWUFxsz2RmeEy8y/chbCgQJghlm/rBS1wJ/1RbOcV
	 fGWC1+rxcO/VjMQimuhE6q+bu/pKZjftFARmQQQn9IoKSa2ckW+ioYBQGhBAbHw/8c
	 qvdKO4xxzsRPw==
Date: Mon, 7 Oct 2024 21:13:28 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH v2] selftests: sched_ext: Add sched_ext as proper
 selftest target
Message-ID: <ZwRA6P3YZ42JjVk9@finisterre.sirena.org.uk>
References: <20241007073133.989166-1-bjorn@kernel.org>
 <ZwQBqlG6MShCkNrU@finisterre.sirena.org.uk>
 <87r08rnbra.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
In-Reply-To: <87r08rnbra.fsf@all.your.base.are.belong.to.us>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_131331_712161_4941939C 
X-CRM114-Status: GOOD (  10.96  )
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
Content-Type: multipart/mixed; boundary="===============6655054299958092140=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6655054299958092140==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SlQF1kEi/Sq2tluV"
Content-Disposition: inline


--SlQF1kEi/Sq2tluV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2024 at 06:00:57PM +0200, Bj=F6rn T=F6pel wrote:

> The sched_ext BPF programs relies on a vmlinux.h, which is generated
> using bpftool and the vmlinux with BTF information. Have you built a
> kernel with BTF support?

OK, so having beaten the kernel config into shape and using GCC rather
than clang for my build I did get this to build fine.  I think the main
gotchas are the issues with the arm64 defconfig not supporting BTF and
the fact that the Makefile silently picked up the host kernel.

--SlQF1kEi/Sq2tluV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcEQOQACgkQJNaLcl1U
h9CsgAf+JweWiALg8MrJcyZWQ/Pn9EUqi7KrnVreTX5EzvtXhEdADiwSpjKYXx4h
h9ifs9ponWUCIpZIsC0uBFE5/kUpRfUuqg3lPlJVkbK2OyMy0C9WKk/gs6J06OYR
YBERMPJ877MHJB1dt1jC0Mmy7jMA3sGY3l3kN4xrJ1eYjRe7jsvDIqnc8KaK5v/l
P4DZIPKQcecagc6yppx5BYjyEBs3x2osaUKwuUOqHFlavzOZw9JUdSenhfcCJXhh
Hm3yRRUvyr942RhZdL201NxZBpGFjqFufHL6XQo1eY56U9we/SFVKRBroPo3mOPg
EM+El1VEGI8+TTAEyp8AIS0xJfFGXA==
=VPuE
-----END PGP SIGNATURE-----

--SlQF1kEi/Sq2tluV--


--===============6655054299958092140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6655054299958092140==--

