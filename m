Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5276AEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4bcyrQA8Q0GfKH7RwZMRcVfTEtL4aUG66Hg98+TP7s=; b=Htq61mdWjw9afQPztJ9RKnUC6v
	Rcjd+Lfp0/L9zpO//THW0OJHnAEKX1nejp5afFjtnay2to2CRo6ws+iOTMmN3TFSG+XgRJc+uDUn/
	pQN08qugCE3vcC9xoUcBhrgHlN/YqXJqiGloQB11wbzC0Lrz2e08wdkmFxArfSTWnJyWf8RQtXWiO
	5x+5HA3fl2paZZUiSMIKLiJaqcQ+rCiRbJJHQ74vJ0Cr5Tc1OB96Iva9LaQ7EaD9eekOnvTvGYSSr
	HbwqTD97x0DEVrD2PQtPcpmCkquuqOKYslWSGly4GvqFK+MfD8lIiMtBOdmFCAPgNRzc5FyMZxw/+
	RhX6B21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Je-005Xbx-2W;
	Wed, 19 Jul 2023 06:05:38 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Jc-005Xac-0i;
	Wed, 19 Jul 2023 06:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O63mZ8yzF6CijAtxSQoALTxAYE2vHbZSrNPF/uuCP68=; b=ndDKyUD2xHL79PniRhDV+SJMHL
	zpsSCSVAJntTj1LUxoqF66BDfuoaOKlIke4eK/B+Xp3/DD4Fp8hMgZrSjj29Q2ugQh7/7FaDY4oLU
	U20souoWS0oLE7Nv/JftQ19WvefaPimCQ/rcrRpxfeCbgX3n8UWj5lCH1JQ8hziii8pAX/K1SML8k
	4Lsy02OJ+T9W1A2jtNuJ6ElfkZNMcA2hVkkSWh1g97cQXNRgMxA9PFn5RoTk2NuirGevSNdLKXpO+
	bbIY3QqvkziWnC3qNgCjTbwwkji7VKktZrM2YlVTDYSbhaOcc8ncRLGR5sle6Cc7fWDqXTShFOAAk
	+2bGGJuQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLpqq-00BtP6-00;
	Tue, 18 Jul 2023 18:55:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C7D9861653;
	Tue, 18 Jul 2023 18:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFD5C433C8;
	Tue, 18 Jul 2023 18:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689706506;
	bh=g90tmctGip5JZ/qUltLRa3L/ha79p8Mr36vMSarsNto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hL9gb0hWnxYQ//PahNxf6ii3EcokNDZCUKPYDDX2Uj5Y9En1S9Qey0qZDQ2RW3P2p
	 dTTMDDmfmtisD08Vic4XKPtxlGRvJPgyq8Vz7vooyeMlS1DNpBL5LhEkFy/YxE3mnd
	 JGZwQRVkEFMazG6MnqCTiZ62Hf2mFE7KFIDZ1yzZpMPF9iQKXY403xt9uho3pljmBz
	 dmdQAiwMPBz8emAKbWggcfJxkiAAU719bIyF0/5kw/Nu71BoYVur9E70n5SstkziYs
	 8h5G21sSol6HTKBwHCSG9f3dVB8vIx3V2YTIARB0eTo6wi80Ose2YR2SPxc5OAnBn2
	 l/Cl4NVx1FtQA==
Date: Tue, 18 Jul 2023 19:54:57 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "ardb@kernel.org" <ardb@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>
Subject: Re: [PATCH 01/35] prctl: arch-agnostic prctl for shadow stack
Message-ID: <45489f30-8bb7-45f1-ad09-28de4cebf406@sirena.org.uk>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
 <20230716-arm64-gcs-v1-1-bf567f93bba6@kernel.org>
 <3185fa6c37e54d26d66cd0e87e74fb5492399d78.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <3185fa6c37e54d26d66cd0e87e74fb5492399d78.camel@intel.com>
X-Cookie: Nothing happens.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_195512_321888_AD526C20 
X-CRM114-Status: GOOD (  41.90  )
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
Content-Type: multipart/mixed; boundary="===============2337277980407516253=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2337277980407516253==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KcrOI5lcfTfmau0e"
Content-Disposition: inline


--KcrOI5lcfTfmau0e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 05:45:01PM +0000, Edgecombe, Rick P wrote:
> On Sun, 2023-07-16 at 22:50 +0100, Mark Brown wrote:

> > Three architectures (x86, aarch64, riscv) have announced support for
> > shadow stack.=A0 This patch adds arch-agnostic prtcl support to enable
> > /disable/get/set status of shadow stack and forward control (landing
> > pad)
> > flow cfi statuses.

> What is this about forward control flow? Seems to be just about shadow
> stack.

Sorry, that's the original commit message - the original version of this
also had support for controlling landing pads but I don't need that and
cut them out of the series.  I forgot to update that bit of the commit
message.

> > [Rebased onto current kernels, renumbering to track other allocations
> > =A0already upstream, dropping indirect LP, updating to pass arg to set
> > =A0 by value, fix missing prototypes for weak functions and update
> > title.
> > =A0 -- broonie]

> 1. PR_SET_SHADOW_STACK_STATUS seems like a strange name for the thing
> actually doing the whole enabling of the feature which involves
> allocating memory, etc. And in the future a growing array of different
> things (enabling push, write, etc).

I have no strong opinion on naming here.  _MODE?  I didn't find any
discussions around this in the=20

> 2. x86 only allows one enabling/disabling operation at a time. So you
> can't enable shadow stack AND WRSS with one syscall, for example. This
> is to make it so it's clear which operation failed. Also, since some
> features depend on others (WRSS), there would need to be some ordering
> and rollback logic.=A0There was some discussion about a batch enabling
> arch_prctl() that could report failures independently, but it was
> deemed premature optimization.

I did see that the x86 implementation required a call per flag, the
logic wasn't hugely obvious there - it didn't seem super helpful.
There's nothing stopping userspace turning one flag at a time if it
wants to, we just don't require it.  I wasn't overly concerned about the
rollback logic since I was anticipating that the main complexity is the
base enable and allocate, everything else would just be storing a mode.

We can implement things with the one bit per call approach, I just
didn't see much upside to it.  Perhaps I'm missing some case though.

> 3. It only allows you to lock the whole feature, and not individual
> subfeatures. For things like WRSS, it came up that there might be an
> elf bit, like the shadow stack one, but that works a bit different.
> Instead of only enabling shadow stack when ALL DSOs support the
> feature, it would want to be enabled if ANY DSOs require it. So
> userspace might want to do something like lock shadow stack, but leave
> WRSS unlocked in case a dlopen() call came across a WRSS-requiring DSO.

We could add either a second argument with the lock or a separate lock
prctl() and matching query which takes the same bitmask, being able
to lock per feature does give more flexibility to userspace in how we do
the locking and isn't hugely more costly to implement.  My model for
locking had been that there would be a final decision on what the
features should be, I was modelling "can enable" as equivalent access to
"is enabled" when it came to what was locked.

> 4. To support CRIU, there needed to be a ptrace-only unlock feature.
> The arch_prctl() has a special ptrace route to enforce that this unlock
> is only coming from ptrace. Is there some way to do this with a regular
> prctl()?

For arm64 we need to add a regset to expose the GCS pointer anyway so
the GCS mode is in there, though at the minute we prevent any changes at
all via that mechanism it could be implemented later.  I'm not aware of
any way for prctl() to tell if it is being invoked via ptrace so that'd
need to be dealt with somehow.

> 5. I see in the next patch there is hinted support for write and push
> as well (although I can't find the implementation in the patches, am I
> missing it?). X86 has something close enough to write, but not push.
> What is the idea for when the features don't exactly match?

The implementation is in "arm64/gcs: Implement shadow stack prctl()
interface", it just boils down to turning on or off a register bit.

> I think when Deepak originally brought up this unified prctl-based
> interface, it seemed far away before we could tell if it *could* be
> unified. Do either of you have any thoughts on whether the above points
> could be incorporated?

Other than the issue with CRIU I don't see any huge difficulty.

--KcrOI5lcfTfmau0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS24AAACgkQJNaLcl1U
h9DxkQgAgZwa9pvR8VpxobsPn+zGULF2/Agz87ptksoCHAdiehLbLFMyBPdWVlPE
VpUVG9yRkpPwF6CxIGr7eYT3bdZPRghlak/eJK+2vfEr9OBZrtn5jUDtLcYXHFEh
4zY9eSZj4uM6IEH8PR/edFhVsRmngGx2xU0Y4yqcmKXBT2S4OdfrOQQvQkKQ15eG
oZBMN4uX+3JFgQLViUMNpPj0bbkA+G4kab1alwOZiQZfZEqH1CRuPpk4CHu51Db9
8bP7/Jy0QkCO19VmDm3NC8v3vAUoECs9iGx6GzsL41fRNlNMbEy2yyTxdz4Nu4YH
/Fkhbx2eF0EG2nmwEzbQ+eAsBn/+eg==
=rIz9
-----END PGP SIGNATURE-----

--KcrOI5lcfTfmau0e--


--===============2337277980407516253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2337277980407516253==--

