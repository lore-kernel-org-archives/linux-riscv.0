Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D218CCD11DB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 14:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMquiJnOgYqeXqD120YSFmM1WU4lQCT8pUgn7LbiMbk=; b=R7OOQDYhE/xnwwGXmSyJkXsCvW
	nakaF0ZPbPOE0yhVqMCcFXaZAShaNxnL4cWGNPe9yBtKKA5oiFjSEJBJ63aXo/pdzpNaYoVriiIzv
	nnZnEWBZ2Acdaja6XltxgIsjSTic7Vk8TF5xLFqzjb/EWh1cShrDtDCjloSgK6DD3f8pcH1N1cs+S
	ehHS/sEVwHAYjr+doQGOG5RlmbeXeI8pQe6tVfZCg/xUHOBDGSL5ecDS6bX2tnmeUAPyZDHHbWxYB
	c7I9B6SFCRFk4wmzJHbq5hI74nLN3WVsdVTyQUkEPB2PUcPs1gZu5K8AdACz/rISEd5ogwV4fWczW
	cgIRMmOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmavh-0000000D3WP-2GyD;
	Tue, 19 Mar 2024 14:59:05 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmava-0000000D3QF-2CXD
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 14:59:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EB145CE0E89;
	Tue, 19 Mar 2024 14:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DA7C433C7;
	Tue, 19 Mar 2024 14:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710860323;
	bh=54EqniYZH25flALmpAB+tWCApnBsX6hK351wxf8tdHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YN5NsCx7Cy04ccVpEDvFu9zhRfENuAcM56dxMf9x46oJZaETGq+PwlVEU1NnT+jiG
	 xbKIKWKq4tErfs4ZHzcP76KGxsHa8NVTkG7EF9WoQ+St3QoF+ipaUx8EePCWL31NJZ
	 BIWLcX+DHrhlQdf8YwY4jTvt9p8Kft6FsCex06oZISe1g2yKGseYPTUasZTHwsjK5c
	 vZgRUWYDuCy3h2q8xQq2F1osTqNe/7hQH+kyb4Hf1dYWs+4H/uTpIlXNnfyoSZE5Y5
	 LesRzfapJZR0een6vGhXmcVBMlU89d4FrZu2LNzwfGT+sbLQ82njleFrq7Rg9EiCjl
	 oHb9iBaB9qDhw==
Date: Tue, 19 Mar 2024 14:58:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andy Chiu <andy.chiu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Evgenii Shatokhin <e.shatokhin@yadro.com>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	rostedt@goodmis.org, mingo@redhat.com, peterz@infradead.org,
	jpoimboe@kernel.org, jbaron@akamai.com, ardb@kernel.org,
	greentime.hu@sifive.com, zong.li@sifive.com, guoren@kernel.org,
	Jessica Clarke <jrtc27@jrtc27.com>, kernel@esmil.dk,
	linux-riscv@lists.infradead.org, linux@yadro.com,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 0/5] Enable ftrace with kernel
 preemption for RISC-V
Message-ID: <20240319-overfeed-ploy-82b611e71c64@spud>
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
 <4fe4567b-96be-4102-952b-7d39109b2186@yadro.com>
 <CABgGipUGCVjy5wG1TMDpgf1Zn7Jcx5Lg1CUzQ0YLr5nOPf-TUg@mail.gmail.com>
 <51f21b87-ebed-4411-afbc-c00d3dea2bab@yadro.com>
 <bd7c2263-4e81-4be6-af4d-22a0842ba2e4@ghiti.fr>
 <CABgGipUtzLG2tffXOdV7-7ss+_doQvjxfwzVbfzyO56J3_3X0Q@mail.gmail.com>
 <f4506e4f-fca5-49ac-868e-f42f1f23ce9b@ghiti.fr>
 <c1d994e2-8f0c-4039-b790-a426fc48055c@sifive.com>
 <CABgGipX_WuB5pZ4xgLcBZF7WpHmt_J9m48k+7n-UwH-jUtXJ1A@mail.gmail.com>
 <79b47f1d-8332-476c-b827-28043d7b3b76@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <79b47f1d-8332-476c-b827-28043d7b3b76@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_075859_161593_7F1FE03A 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============5090098027478993491=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5090098027478993491==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o94p9oOjhaweJGCf"
Content-Disposition: inline


--o94p9oOjhaweJGCf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 03:50:01PM +0100, Alexandre Ghiti wrote:

> The thing is ftrace seems to be quite broken as the ftrace kselftests rai=
se
> a lot of issues which I have started to debug but are not that easy, so we
> are wondering if *someone* should not work on Bjorn's solution (or anothe=
r,
> open to discussions) for 6.10. @Andy WDYT? Do you have free cycles? Bj=F6=
rn
> could work on that too (and I'll help if needed).

If patching is broken I wouldn't be too worried about targeting 6.10,
just do it right and get Palmer to take it on fixes when everyone is
happy with it.


--o94p9oOjhaweJGCf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfmoGQAKCRB4tDGHoIJi
0qZWAQDrbJ6nqmk+IegmauIVQ7iydOEVvAUm1GQQwsgvccg+tAEAvPRRsNHDkjHH
C8Hbc5FcirtLAZNCI4Xim7V6hm4kqA0=
=SWAa
-----END PGP SIGNATURE-----

--o94p9oOjhaweJGCf--


--===============5090098027478993491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5090098027478993491==--

