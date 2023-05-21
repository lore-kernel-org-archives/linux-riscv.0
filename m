Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE64C7EE23
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 13:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTZOI75b6d4DtW1+inuElNQUtE6s0qi9i0fDDHwmggE=; b=VFtwEPwEGPtbEk8FfSaQ8uHBGD
	vVG+S6eeSlQm4nRV+eqRbPgQ1BL0Z6qF8gzsbxyejIg1VF4cSeOHnd9xo2Q5UZvGzvHAkNzLQEOBe
	FvrhCKohcMS0SGN6dhbaONM4I44AEzGjY9AczvJWYxVfn+t0eaFF/hI8FwP5Kovze7lQ1f5cD3Mrw
	5ib8/SklwyjvyqTgslfB25aOcK7vglMQ6BA4wbbUE8CLExkFivKuuNZPPU3gKJW5IutU7bEcPNT9S
	EhcyOheMPnyXJOU387fi4amrBT+SSGMEDM4rapi46rSzwfSNmXZewGY4pT0gctyie2Pr9NyveBGgq
	NQKKApOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0jBS-003wHb-1E;
	Sun, 21 May 2023 13:33:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0jBN-003wGx-01
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 13:33:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 17CB160D30;
	Sun, 21 May 2023 13:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C63C433D2;
	Sun, 21 May 2023 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684675983;
	bh=yc+xpiRGieSq6TuMgxZKWkYX5/mNWInADWmNFrpAsIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EEAWWK1x61Hmz77cC2PLxZ4Holjjqwv9wvh3X8BZ+lYV0YpqTQCI3DVBCQdyEumth
	 mztglR1FQ/fTqcuikcHWUdutrd5NUACcSlmix1qCmPeTUOgKaQPJrilYOINSz29f2T
	 QrMoc+maAa1SaQ8zHjJDEB0Vk3NwRry0EzNJZwcvKZ0mmkAAmKlK3OYomVMKrgj6kH
	 hE6DrNxcBeIj+Su1WtlcsvyexRf/SSOBATibTQ27iJO8HKx6ll2pgNAFusXj8nKdE2
	 ozlbdNhRM3V6XnNGPdWJ/VTtFs5HPvLlXzGfnNgK8JDy6c4bP07GbwyDcutjAzA01R
	 R5FFN5MRvCFrw==
Date: Sun, 21 May 2023 14:32:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: jszhang@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org,
	npiggin@gmail.com, palmer@rivosinc.com, paul.walmsley@sifive.com,
	paulburton@kernel.org, tim.bird@sony.com, bmeng@tinylab.org
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
Message-ID: <20230521-pulp-canola-5df45b40474d@spud>
References: <ZGna6sWmRZbMf3OH@xhacker>
 <20230521124134.55162-1-falcon@tinylab.org>
MIME-Version: 1.0
In-Reply-To: <20230521124134.55162-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_063309_151668_4F3452FD 
X-CRM114-Status: GOOD (  33.63  )
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
Content-Type: multipart/mixed; boundary="===============1965787090807771544=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1965787090807771544==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9Ez9li3iknOY6I+f"
Content-Disposition: inline


--9Ez9li3iknOY6I+f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey!

On Sun, May 21, 2023 at 08:41:34PM +0800, Zhangjin Wu wrote:
> > On Wed, May 17, 2023 at 04:29:36PM +0800, Zhangjin Wu wrote:
> > > Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
> > > the user to enable dead code elimination. In order for this to work,
> > > ensure that we keep the alternative table by annotating them with KEE=
P.
> > >=20
> > > This boots well on qemu with both rv32_defconfig & rv64 defconfig, but
> > > it only shrinks their builds by ~1%, a smaller config is thereforce
> > > customized to test this feature:
> >=20
> > OOPS, I didn't noticed that you have sent out the patch and you are now
> > in v3. I may read your patch sevral months ago, but I forget it.
>=20
> Yeah, I have sent this patch several times, but beside the suggestion from
> conor,

Half the time my comments are just me forwarding on stuff from
automation complaining. Otherwise I do my best to look at things that
are being ignored.

> I have gotten no more responses (before v3), I even thought RISC-V
> people are not interested in or not require size shrinking ;-)

IIRC, you sent a standalone patch, which might've been picked up had you
not followed it up with a series marked RFC containing the same patch.
The v2 which was sent on 14/2 was marked superseded after the RFC series
on 17/2. And I guess since the RFC generated no comments, but clearly
couldn't be merged, it was ignored?

To be honest, I am not quite sure why you are sending some of these
things as RFC. The VDSO thing looks like something that should be
considered/reviewed properly etc, rather than "hey I have this idea,
does anyone have suggestions".

> As I can see from the mailing list, Guoren just sent out a new series of
> patchset [0] about size shrink (-16%), and include the one [1] from you, =
so,
> I'm not alone, the left patchsets I'm working on and upstreaming include =
dead
> syscall elimination [2], vdso configuration [3], nolibc for rv32 [4] and =
even
> the self-decompress vmlinuz support (RFC v1 will be sent out next week), =
all of
> these patchsets are result of my tinylinux [5] porting to RISC-V (got 334k
> non-MMU rv64 vmlinuz+nolibc hello).

Ordinarily I would suggest that you contact these people and ask them to
review your work, so that there is less for Palmer to do when he is
going through the list on patchwork for stuff to merge - but it looks
like you are already doing that, which is great :)

> I have found that you have fixed up some other issues, It is better to
> merge mine in your series, please don't forget the Tested-by line from
> Bin Meng [7] and the Reviewed-by line from Guoren [8].

I'll mark this patch as superseded then, yeah?

Thanks,
Conor.



--9Ez9li3iknOY6I+f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGoddgAKCRB4tDGHoIJi
0kdKAQCo3WjT90ghlIElwEWLgZJzGstCYDs5vKCmBIuDTnWYCwEA2rHTRG34FjO1
sjGl5R9ZkWmvHSrGXgQLVWEACyFS0Ag=
=WiAj
-----END PGP SIGNATURE-----

--9Ez9li3iknOY6I+f--


--===============1965787090807771544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1965787090807771544==--

