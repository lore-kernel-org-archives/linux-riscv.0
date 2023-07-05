Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15101EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 21:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gTjqeBmeYxGxkk6FAQJNXO0djD63hq1KmuuxA+v4xk=; b=x8jNTuNLtK6cATgdj3xS/EriLm
	toNKaTCG+IRmJ3JglgJidiI7O+HZc+TIIUyVdjRY1TDa8JzYkfmF4WfQmM7M7yfl8F6a9ZsopsAPm
	/apBAjUDO3sDeaaGV2/B5j3BfYcbvkDam5L2IYV/W/YBwBTwPGHpAjjItr4fzqK5ygoIMG2p5K3kN
	1q2WJCb25JbsnN91tZGTVAKeocYAqFPEQ/qEbLcLz/+sGXBWWS0HcN7TKIc5ocs/WhEGVlpKPy37M
	AtldbDQoAWZyrDdW8XiyiGcWmYxRMVgndPErrwuZJr5Qv9MtmXWwF4PlJ7SgHUJijEKhZ1JlelK7c
	TFH9KNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHAWx-00HCM9-1T;
	Wed, 05 Jul 2023 21:59:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHAWu-00HCKu-0U
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 21:59:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A78516173D;
	Wed,  5 Jul 2023 21:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6580C433C7;
	Wed,  5 Jul 2023 21:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688594359;
	bh=qEIycahdSuFpaMds3e9WtkAzIWBozcEdpxs2byPOYUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+DNIqSYtkd+LV4jJsj6ZgUaSptlci0ak2Sm+xOLLEHOlo+njzgJQKUA3c5zMQAw3
	 SdRF1xDtKZyuEEqFNvHICX/ZDxH7CCdnCo9u+JK8kQM4tcTX6kXOcNKCnv7pZeMwmt
	 A2KJAsMIqFXs5CX1sUqixtJMe4OM7PLJMKPKM94QtSbZvkmcyWaqolxSz7nUvBMxRg
	 FUpqaJ+TZKkNWb9V1JqN4rre1F8z7a7Kfs5f8s98Gh2D/vwV1prYQ/I892GX2mja2v
	 w1Apw7iY9SQlq+gcZOifbs0GQiYm/DvNk+j7lmzuQgXVx5FyugMrACNOovVqTNczBF
	 5zEzNZe8EWBkQ==
Date: Wed, 5 Jul 2023 22:59:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, anup@brainfault.org,
	konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	mick@ics.forth.gr, jrtc27@jrtc27.com
Subject: Re: [RESEND PATCH v3 0/2] RISC-V: mm: Make SV48 the default address
 space
Message-ID: <20230705-antler-nature-4492ebe90c63@spud>
References: <20230705190002.384799-1-charlie@rivosinc.com>
 <20230705-gloater-relation-29a6080ec87d@spud>
 <ZKXXquCXkSdFD837@ghost>
MIME-Version: 1.0
In-Reply-To: <ZKXXquCXkSdFD837@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_145920_288647_E87B4154 
X-CRM114-Status: GOOD (  25.56  )
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
Content-Type: multipart/mixed; boundary="===============8751459080397557663=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8751459080397557663==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LfSAcveqTz6Siyh4"
Content-Disposition: inline


--LfSAcveqTz6Siyh4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 05, 2023 at 01:50:50PM -0700, Charlie Jenkins wrote:
> On Wed, Jul 05, 2023 at 09:00:18PM +0100, Conor Dooley wrote:
> > Hey Charlie,
> >=20
> > On Wed, Jul 05, 2023 at 11:59:40AM -0700, Charlie Jenkins wrote:
> > > Make sv48 the default address space for mmap as some applications
> > > currently depend on this assumption. Also enable users to select
> > > desired address space using a non-zero hint address to mmap. Previous
> > > kernel changes caused Java and other applications to be broken on sv57
> > > which this patch fixes.
> > >=20
> > > Documentation is also added to the RISC-V virtual memory section to e=
xplain
> > > these changes.
> >=20
> > I can't find a changelog in any of these patches, nor an explanation for
> > why this is v3 (or a RESEND). All I can find on the list is a v1. Could
> > you explain and provide a changelog please?
> >=20
> > Cheers,
> > Conor.
>=20
> I made a series of mistakes due to an incorrect email configuration. I
> knew something was wrong but I didn't know what after I sent out v2. v2
> bumped the default address space from sv39 to sv48. The purpose of v3
> was to remove an erroneous .gitignore I had included in v2 and also
> modify a testcase that was supposed to check the default was sv48 but it
> was still checking for sv39. After sending out v3 I realized what was
> wrong with my configuration, so I decided to mark it as a resend because
> I believe some people did recieve the previous emails.

Ah yes, I remember massive CC list you used first time around that seemed
to trip up infradead's list service. I guess I've finally gotten to the
incoming mail volume that I am starting to not remember things, even
when they were unusual...

Next time you're sending patches, please add the changelog to your
cover, makes life easier for reviewers etc.

Thanks Charlie,
Conor.

--LfSAcveqTz6Siyh4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKXnsAAKCRB4tDGHoIJi
0k+oAQDvJTKzU6XjlcyqJplBSCfBAjHSVCZ/3LKrXVhbsOJ9yAEA4CJHvvobjGub
lihp+LJxJxUlkuRipXEzHEkTRK6fIQM=
=Msdq
-----END PGP SIGNATURE-----

--LfSAcveqTz6Siyh4--


--===============8751459080397557663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8751459080397557663==--

