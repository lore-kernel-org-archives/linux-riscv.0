Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FD8C2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 13:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOevWvoykSrp3Etyay5g9HR5nVEVzdNjrgcKBC/UlNA=; b=lxLkNQ0NoEWiZosJFABtO+8Rgy
	n35+dJUaxvEvoDNZt59nO96Izk4wxLjDl0f2wTsvWNECdNb6Br+STalhP1R0INwiswwbiGzmOEucJ
	+YkEDpAQvvguufsGtDIxaMGw2bf54JraR0bkyitFKnYWX4C8MAlCy8qinZfNf1xy0pfnq4scwzOnK
	8b8YA0VXIw00wlajmL4HK8VdFJ49mKV+STQe35R0ZuAYQ/FF4pDQapXFzlFRDC/akzE77Wjjp1+06
	VjnSk/ib6mAmLQ9tdqKHw1WaAPLejj0wdAVVk//K8Mipob2KDFxYtFafT4s47wIvHV/vCHGAKn3N8
	ZwO7jtpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSGdr-00000000CSo-14YV;
	Fri, 12 Jul 2024 13:48:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSGdn-00000000CRt-3a4f
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 13:48:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41ABE61F12;
	Fri, 12 Jul 2024 13:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A787C32786;
	Fri, 12 Jul 2024 13:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720792131;
	bh=UAVO/gXLGNIHoqILwVTdS3n2/0dHqnDhY4+Q6hSW59Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S6UHG8RJDoFnnQ1f++vKtWyN5wGmHFUPPQu7B06L3suYJ9aksheWYADKe5WhqdJVH
	 hFUGrkLQy5HxvKtSAJfXm3D3SGLWQtgdjBcltgTJNcjzp1OZjYCfN7JITz9ozBySVb
	 m1wdwky67VAbo9fTQkNNVXJK3Awq2l1vvCkmbhou5D65gyV8FqwMy5JcljY0BldpgE
	 G/WB/8MLfZDIVIwmTu0J4+bag+/Vsgf5X8klPWJ4YDOLhxUr60/gBgdOxQboyMrPxo
	 SeBjRkCOTCyBDAzQ9qpwQnlNIxF+Vyhw9l2apKyqlxk3bva98RqGfjtdcbZ+0E7VcE
	 sgvrTu5KvZo4Q==
Date: Fri, 12 Jul 2024 14:48:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v3 1/1] riscv: dts: thead: add basic spi node
Message-ID: <20240712-denote-disprove-ce271b70c78c@spud>
References: <20240705093503.215787-1-kanakshilledar@gmail.com>
 <20240705093503.215787-2-kanakshilledar@gmail.com>
 <CAGLn_=tT08KUX0J+WURq=EXKDPj=--Wg3qmCjnzGxNeMcz3NOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGLn_=tT08KUX0J+WURq=EXKDPj=--Wg3qmCjnzGxNeMcz3NOg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_064852_268396_9AC54F47 
X-CRM114-Status: UNSURE (   8.02  )
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
Content-Type: multipart/mixed; boundary="===============3365175012756514719=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3365175012756514719==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TVaUuin2MQ5RhBaQ"
Content-Disposition: inline


--TVaUuin2MQ5RhBaQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 12, 2024 at 02:11:18PM +0530, Kanak Shilledar wrote:
> Hi,
> Any updates on this patch?

It's too late for 6.11, it'll have to wait until 6.12. If Drew has his
tree set up already, he can at least queue it.

Cheers,
Conor.

--TVaUuin2MQ5RhBaQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpE0PgAKCRB4tDGHoIJi
0rtMAQCWJsLbWrTJXYut90rqVRHP9fRSrbjQdZDQo5ZoXTEV1QEA/54A9PCC3MiB
dTITiySq8lWR2Wr/Z+OPHYT1jvO59Qo=
=ocR0
-----END PGP SIGNATURE-----

--TVaUuin2MQ5RhBaQ--


--===============3365175012756514719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3365175012756514719==--

