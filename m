Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFABC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 01:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0WgLdu/Q666sCRPv7BCQoOaGDXTWi830iENm5HevFU=; b=1zFQlLPy4ShIkWwMtGxtW4YaLS
	wY1ZWYyW7Objswd+LqZU1GcYVSnCcpI+BB+G7RPA+7lFRI64e1wClT+lnxh2vUuNaoLMbf3PKYRf5
	svc2HptQEPvQVFwclek5UHffao2RZtTtGEChjbtgjre5BO+LFxyG2LjMouLRGOirBEQSiX8Qaqys1
	tsFaJyE4jEFMCwqrXkTqHT1XFkfOcIlCXJ9INNYzaE17QaVxKD/MKK0Re7xoUMQ980aeH+0oIpPW6
	3RoMjGRNcXjPOZP94n2jTvytoSY78MBR7GkMds6Qdvt0ZMIaLoB3JpXMVVm3Tr7DUD/1uN6qGPqb9
	7tRicomQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrpIY-0000000DUu9-2VtT;
	Wed, 03 Apr 2024 01:20:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrpIV-0000000DUtH-40f7
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 01:20:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8762BCE1ECA;
	Wed,  3 Apr 2024 01:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051D8C433F1;
	Wed,  3 Apr 2024 01:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712107212;
	bh=WBasPOB8gQWqxUEirkIG9EvIRFQQW/a9zobZIgfrljU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EzPP77gAmq7VJZPzNdTJJm/WVZlJgwJfU8CjnbRSjE397SzRw5L+30o4KWMOW71Bs
	 U8ZPJuZt7Wnl+v+TvjOSx0d+Fiw7QQTYvN/rYm3Y+is9aMUaBU2Kfj8we4qt+UCMGj
	 HglIcdpP7fV2/sl0+x18HUhlAMzJyo28GSMaPLGubRvHKN3lDkkS5XtqZIs6920xxF
	 imDO5nX9ttgWLaXn1mGifpI1OzzKNCnAQvQaury3ToCIgO7Jm8g097t5nI2LLxzWnW
	 iDU6CcMcGQd5ctdEwNa7zgZV1mdef3NEktk6DF2lsVOdFudbjF3J66sylX3Mfet1jT
	 Hj1kGIJ7h9XGg==
Date: Wed, 3 Apr 2024 02:20:05 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Pu Lehui <pulehui@huaweicloud.com>, Stefan O'Rear <sorear@fastmail.com>,
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Manu Bretelle <chantr4@gmail.com>,
	Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
Message-ID: <20240403-gander-parting-a47c56401716@spud>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
 <20240328-ferocity-repose-c554f75a676c@spud>
 <ed3debc9-f2a9-41fb-9cf9-dc6419de5c01@huaweicloud.com>
 <87cyr7rgdn.fsf@all.your.base.are.belong.to.us>
 <20240402-ample-preview-c84edb69db1b@spud>
 <871q7nr3mq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
In-Reply-To: <871q7nr3mq.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_182016_468671_3948BE15 
X-CRM114-Status: GOOD (  30.09  )
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
Content-Type: multipart/mixed; boundary="===============2199967495764863305=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2199967495764863305==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qv+BdwRgr1RU9Whw"
Content-Disposition: inline


--qv+BdwRgr1RU9Whw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2024 at 09:00:45PM +0200, Bj=F6rn T=F6pel wrote:

> >> I still think Lehui's patch is correct; Building a kernel that can boot
> >> on multiple platforms (w/ or w/o Zbb support) and not having Zbb insn =
in
> >> the kernel proper, and iff Zbb is available at run-time the BPF JIT wi=
ll
> >> emit Zbb.
> >
> > This sentence is -ENOPARSE to me, did you accidentally omit some words?
> > Additionally he config option has nothing to do with building kernels t=
hat
> > boot on multiple platforms, it only controls whether optimisations for =
Zbb
> > are built so that if Zbb is detected they can be used.
>=20
> Ugh, sorry about that! I'm probably confused myself.

Reading this back, I a bunch of words too, so no worries...

> >> For these kind of optimizations, (IMO) it's better to let the BPF JIT
> >> decide at run-time.
> >
> > Why is bpf a different case to any other user in this regard?
> > I think that the commit message is misleading and needs to be changed,
> > because the point "the hardware is capable of recognising the Zbb
> > instructions independently..." is completely unrelated to the purpose
> > of the config option. Of course the hardware understanding the option

This should have been "understanding the instructions"...

> > has nothing to do with kernel configuration. The commit message needs to
> > explain why bpf is a special case and is exempt from an

And this s/from an//...

> > I totally understand any point about bpf being different in terms of
> > needing toolchain support, but IIRC it was I who pointed out up-thread.

And "pointed that out".

I always make a mess of these emails that I re-write several times :)

> > The part of the conversation that you're replying to here is about the
> > semantics of the Kconfig option and the original patch never mentioned
> > trying to avoid a dependency on toolchains at all, just kernel
> > configurations. The toolchain requirements I don't think are even super
> > hard to fulfill either - the last 3 versions of ld and lld all meet the
> > criteria.
>=20
> Thanks for making it more clear, and I agree that the toolchain
> requirements are not hard to fulfull.
>=20
> My view has been that "BPF is like userland", but I realize now that's
> odd.

Yeah, I can understand that perspective, but it does seem rather odd to
someone that isn't a bpf-ist.

> Let's make BPF similar to the rest of the RV kernel. If ZBB=3Dn, then
> the BPF JIT doesn't know about emitting Zbb.


--qv+BdwRgr1RU9Whw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgyuxQAKCRB4tDGHoIJi
0n8AAQD1sU7Eea95pI9/h7ezuLYET85gYREpzO1Sd6hhzTQzQAEAsiT43tCTGqZa
3CuW+sMeb3FNF2lIMoNx7Bmqui7M9wY=
=JpAU
-----END PGP SIGNATURE-----

--qv+BdwRgr1RU9Whw--


--===============2199967495764863305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2199967495764863305==--

