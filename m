Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B62C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43ypqBFDGhoSH6l52+ws0tQhPXc0WMTrL70U7FsK9eE=; b=av47AZFvbGq9hF/1Wk7w4T1RrE
	FnAACs5eUR59bAJPZYZNxoPiX4coi0/7jgp2jI8DnhO1ocr7P+CWjzY9NTPTvp0/WJO4aoATCr74v
	XghVCa3fte4lC01o6NmVqZ1OGNurQjhUM773B6cBi8eTCYLizh/tJpzwI/fYlr8nnvJLZZePHgW+5
	KOSB6mU76gJ0AYYRTMHLMvXtIjypvMlhgfQlXp5QX+D3rU09hY2vZFfiP0oFxxFyFQqIBMjQnfTK5
	13InrByO9gke/jCv/vwrvyqExxkKm+ioP2KGyrQXVI19w0SFpKaYHvV62/eTKRe7ULdLnlAPEjZZf
	ktD0rrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc297-009njh-0T;
	Tue, 14 Mar 2023 10:44:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc28z-009ngh-08;
	Tue, 14 Mar 2023 10:44:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B62106170B;
	Tue, 14 Mar 2023 10:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD02C433D2;
	Tue, 14 Mar 2023 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678790673;
	bh=/zc6dyyYEjbrVXwGWF4uQQkOIFQN/MV9XcG7kVyoU8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=huMTdu+PpFBDNANuJEv3Zffu1Vwm5cnJIAQmdYY3MuN25otEzxcnlFhMmkggk2hUo
	 Zg6vJh0QdA9Jnk7zIVTJcZgLygNa22xIIMc2Pcs3GewkKm2ckMzMRdk7bASAm+Eues
	 RAN2IljR//Emad3bmD6suX/b0xnCdzhRS9quJSJdByNALFOBypTAd+axnneC01zyp9
	 mqLwazNT6zD+m68frSOR6bzEC7f4JK/4T7YbjsBWyMJxnlp4Wj6f3OSAsIN4kJmS52
	 zfQ8yCd2HXmxsc+/l1K3ni3SUZUbMnG/6B0ZUMCAF96ZfwPxqmqsZGPZ7TYIDtJlD2
	 EAHAvLIXAshfA==
Date: Tue, 14 Mar 2023 10:44:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Rolf Eike Beer <eb@emlix.com>, Huacai Chen <chenhuacai@kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH -next v14 11/19] riscv: Add ptrace vector support
Message-ID: <61c440cd-bae9-4984-9d26-d78e9fad2f16@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-12-andy.chiu@sifive.com>
 <87mt4v4clq.fsf@all.your.base.are.belong.to.us>
 <CABgGipU9LjvT6RQ6OfTXm6==pV0KXUjvyTR-FCNC05sfDec+9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgGipU9LjvT6RQ6OfTXm6==pV0KXUjvyTR-FCNC05sfDec+9g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_034437_176051_33DD0271 
X-CRM114-Status: GOOD (  21.14  )
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
Content-Type: multipart/mixed; boundary="===============6347458631541804357=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6347458631541804357==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wsNNZ3f2h61Byr8b"
Content-Disposition: inline


--wsNNZ3f2h61Byr8b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 06:39:19PM +0800, Andy Chiu wrote:
> On Thu, Mar 2, 2023 at 7:27=E2=80=AFPM Bj=C3=B6rn T=C3=B6pel <bjorn@kerne=
l.org> wrote:
> >
> > Andy Chiu <andy.chiu@sifive.com> writes:
> >
> > > diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> > > index 2ae8280ae475..3c0e01d7f8fb 100644
> > > --- a/arch/riscv/kernel/ptrace.c
> > > +++ b/arch/riscv/kernel/ptrace.c
> > > @@ -83,6 +87,62 @@ static int riscv_fpr_set(struct task_struct *targe=
t,
> > >  }
> > >  #endif
> > >
> > > +#ifdef CONFIG_RISCV_ISA_V
> > > +static int riscv_vr_get(struct task_struct *target,
> > > +                     const struct user_regset *regset,
> > > +                     struct membuf to)
> > > +{
> > > +     struct __riscv_v_ext_state *vstate =3D &target->thread.vstate;
> > > +
> > > +     if (!riscv_v_vstate_query(task_pt_regs(target)))
> > > +             return -EINVAL;
> > > +     /*
> > > +      * Ensure the vector registers have been saved to the memory be=
fore
> > > +      * copying them to membuf.
> > > +      */
> > > +     if (target =3D=3D current)
> > > +             riscv_v_vstate_save(current, task_pt_regs(current));
> > > +
> > > +     /* Copy vector header from vstate. */
> > > +     membuf_write(&to, vstate, offsetof(struct __riscv_v_ext_state, =
datap));
> > > +     membuf_zero(&to, sizeof(void *));
> > > +#if __riscv_xlen =3D=3D 32
> > > +     membuf_zero(&to, sizeof(__u32));
> > > +#endif
> >
> > Remind me why the extra care is needed for 32b?
> >
>=20
> That is from the old version of the code and I agree we should remove
> that.

> Hey Conor, does your Rb still hold after removing this #if,
> #endif section?

Sure.

--wsNNZ3f2h61Byr8b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBBQBQAKCRB4tDGHoIJi
0q0/AP4qrjOdg4BZ8czZIXwP9AB8olebSGPPagBSO9A50HhpCgD+MmTpUZCrAhFP
UT8+bE+VYtwzLS7zCuUEHQUHd8lqwAY=
=JWax
-----END PGP SIGNATURE-----

--wsNNZ3f2h61Byr8b--


--===============6347458631541804357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6347458631541804357==--

