Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147DDC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Apr 2022 02:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWY7YFGCwRwvHGjLJYjZ1ZsXFJQOfZqNmtqGaJ5cJbA=; b=fh5ZIx2hV07H14hktA5U/geArx
	vsFq9StxnjO03+j7USQzx8M/ljqr9FCN2BWVQrMLPAf6Qsm/3J1vH2zFVk6Isfj0RkCrmsnBb38PM
	wg9pOIiygXUkCVcxpZI2KDt5XQxpMZj3BqmuEsDt4XPDNtIH54bHe5e9wogddFNH1g/+4oZL3v3Ik
	UD3+qCIZWTB/+Vkl3eXZCUNXLrfMpmcQKVUb99xOlQzLTDcGHgQpoyoOJHy73KImy946Iv7TfvlQI
	j0rdNT7SQt4guu/sEfpMHB6dg1iPdo4dkYFytgTenHRx4Wj1/ejf/jKfp0Pdfd6epMcXpn8OJfK1t
	8GULJqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfucX-00DoKn-DU; Sun, 17 Apr 2022 02:26:37 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfucU-00DoJU-Jz
 for linux-riscv@lists.infradead.org; Sun, 17 Apr 2022 02:26:35 +0000
Received: by mail-qt1-x835.google.com with SMTP id hh4so768304qtb.10
 for <linux-riscv@lists.infradead.org>; Sat, 16 Apr 2022 19:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w8FEMTX/xuVcdhSUM8I8EwNIenSORDwi1yF5x5D0CQk=;
 b=ZBy2A4iECzemte2fKwK6r8t070Gm4ptN3hs9giRZhZcCNYPTt2iL3fOgu2FEN64Fgq
 SxftzRQMyDbl7IrsOK84dpF4S4Eah2v4o1wgwjJtg3i6/6fUt/a17xYAT3UAVssVn+6X
 nJkPc4e/ZdrvhmxQk7JwAe3g4cWqinDy6hTFIhl3I+GFQr4VAX6Qud2mC3INc/YM1tuX
 oOrBl0yOzvWMWDRMmTB8Jn9Pr2tCgJZxPJ134nit4KZJvv/k1IQ1oKidczYT4RkYBAbs
 rVzbn3AoJxyDwn0ix0HRPwMF9LNVtC8ssmRcGNvZQGFEHE1xtVSnhZX8LR6BKROYKMcb
 D1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w8FEMTX/xuVcdhSUM8I8EwNIenSORDwi1yF5x5D0CQk=;
 b=D1YYg6oy1cl7c51qZBDuXtI3im81BKws1GcLHf4NZU326a+qDI92yX93HshFiid36t
 OpTnyQRHjU+8DDZDGFYN9xkTKfoNSeC+FevGcU5T3BHL3gyIfR2jQwuE5lEMSBzL187n
 7smOG6rRN6WD5d5vRRU/cU1V92Qv+s49RHWCJR4yrsysjc3M04MDwQBkKVpsnjJtrOYh
 f9hJz5wZHZkvYe2EXPFTk5CdrORfEEXNRNQvjJ7OqgZe99ZGnqzwU/NVtU42VRNPdDIW
 73CIBn2DOZ43XF71iMPJTOU4q8u9k69fqYfMWdgtMd7Z9yTCUzx3B//cq8AnvlUy92f8
 j6zA==
X-Gm-Message-State: AOAM5307x8DxO14WmcN+zp6BSmH0LMQopf7iyuA545i3thYzpgYlifsN
 p2boJNFsTZV5sHtS2EFSD2U=
X-Google-Smtp-Source: ABdhPJyw2GkpuOw1P/WLegnCnO+dbJ8IIFJT1EB7sljiwNDV5FPSblx7lE96SyGSt8vM8b118kZB/w==
X-Received: by 2002:a05:622a:1a11:b0:2f1:f173:b7cc with SMTP id
 f17-20020a05622a1a1100b002f1f173b7ccmr3511640qtb.318.1650162392472; 
 Sat, 16 Apr 2022 19:26:32 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228]) by smtp.gmail.com with ESMTPSA id
 m9-20020a05622a118900b002f1fc51135dsm91489qtk.57.2022.04.16.19.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 19:26:31 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailauth.nyi.internal (Postfix) with ESMTP id 8750127C0054;
 Sat, 16 Apr 2022 22:26:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 16 Apr 2022 22:26:30 -0400
X-ME-Sender: <xms:1XpbYlKWOJCU_a_aBG3Pf3GDF3dNzb823hRtLeqQMA3lTVs6UImfhw>
 <xme:1XpbYhLJszYcMjmBEVA8ZQL0VVrZ8sSdAJ7z0cvys3GOnfGPccc9rhOiErW_MGvVX
 olAGnV34stYlYXfAQ>
X-ME-Received: <xmr:1XpbYtsgK8HbIntoGKhdM016Lp6MHZYQBkXrN6nJ9mwc9mSWIk4LBLiVIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelkedgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepheefudejueffjeelkedtgeelleelgfffhffhvdehtdekveehjeeivdejgedu
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
 hoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieeg
 qddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigi
 hmvgdrnhgrmhgv
X-ME-Proxy: <xmx:1XpbYmYrqXckwhSnNLxDmoPmJs5N7lNITGceY8VWMh6qC3uaP-YCrg>
 <xmx:1XpbYsbiUKK8_jir1dsX-EBRS4PdiaVIb7oIgSgfHhjZc0-rXwUmoQ>
 <xmx:1XpbYqAOnQv0upnmUu0gRsSUhwtyywMYTzO_4fusVDMmRfq8HNc0pg>
 <xmx:1npbYoTBPvLdyCOGvo143JTe1woY3JfYh04h1ntD-uXopNmHsC21vg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Apr 2022 22:26:28 -0400 (EDT)
Date: Sun, 17 Apr 2022 10:26:22 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>, Daniel Lustig <dlustig@nvidia.com>,
 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2 0/3] riscv: atomic: Optimize AMO instructions usage
Message-ID: <Ylt6zqPgimmKpJzg@tardis>
References: <20220412034957.1481088-1-guoren@kernel.org>
 <YlbwOG46mCR8Q5tJ@tardis>
 <CAJF2gTRws6RqKmJHBdKsycWSkFgYna_MocJ+qp3Z9r1v7mQzsg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTRws6RqKmJHBdKsycWSkFgYna_MocJ+qp3Z9r1v7mQzsg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_192634_720201_E06DBDE1 
X-CRM114-Status: GOOD (  12.76  )
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
Content-Type: multipart/mixed; boundary="===============4218438628425634815=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4218438628425634815==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gsEGlVkScL5MXyzb"
Content-Disposition: inline


--gsEGlVkScL5MXyzb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 17, 2022 at 12:49:44AM +0800, Guo Ren wrote:
[...]
>=20
> If both the aq and rl bits are set, the atomic memory operation is
> sequentially consistent and cannot be observed to happen before any
> earlier memory operations or after any later memory operations in the
> same RISC-V hart and to the same address domain.
>                 "0:     lr.w     %[p],  %[c]\n"
>                 "       sub      %[rc], %[p], %[o]\n"
>                 "       bltz     %[rc], 1f\n".
> -               "       sc.w.rl  %[rc], %[rc], %[c]\n"
> +               "       sc.w.aqrl %[rc], %[rc], %[c]\n"
>                 "       bnez     %[rc], 0b\n"
> -               "       fence    rw, rw\n"
>                 "1:\n"
> So .rl + fence rw, rw is over constraints, only using sc.w.aqrl is more p=
roper.
>=20

Can .aqrl order memory accesses before and after it (not against itself,
against each other), i.e. act as a full memory barrier? For example, can
we end up with u =3D=3D 1, v =3D=3D 1, r1 on P0 is 0 and r1 on P1 is 0, for=
 the
following litmus test?

    C lr-sc-aqrl-pair-vs-full-barrier
   =20
    {}
   =20
    P0(int *x, int *y, atomic_t *u)
    {
            int r0;
            int r1;
   =20
            WRITE_ONCE(*x, 1);
            r0 =3D atomic_cmpxchg(u, 0, 1);
            r1 =3D READ_ONCE(*y);
    }
   =20
    P1(int *x, int *y, atomic_t *v)
    {
            int r0;
            int r1;
   =20
            WRITE_ONCE(*y, 1);
            r0 =3D atomic_cmpxchg(v, 0, 1);
            r1 =3D READ_ONCE(*x);
    }
   =20
    exists (u=3D1 /\ v=3D1 /\ 0:r1=3D0 /\ 1:r1=3D0)

Regards,
Boqun

--gsEGlVkScL5MXyzb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmJbesoACgkQSXnow7UH
+rie9Af/UTwzwnSrsPDa9Dt5IvnF9QCWblr10PoMYKlA7wHaAC7xRVicoRsmLAXF
zIlFIQEcZdxH3/o7cVOtaFDRaNoY6q667AxcTP+vzwcTBoWIAvSo7kip2ZtTAtbE
8sj/bm+AiMfAet+sJ/I0gQNm3wPC3Q0MH5XcuGTpDZQlGny+/mB5s42Ii8vpt+UJ
fgHdn8TqJ4m+PURvx8Rzumv9Uz6y6X8C4/VgZTNOVA3de1tcGw6kinIvOAML8F+v
mAyg5MBo3DJ2Egh4aE1bzNvcfH97MbUJIAECztxhTKcgd77I16hBhhdtZoHRkZYR
6vmBhnqkQm8683s2qqt2HOUZlmrfJQ==
=Fcy2
-----END PGP SIGNATURE-----

--gsEGlVkScL5MXyzb--


--===============4218438628425634815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4218438628425634815==--

