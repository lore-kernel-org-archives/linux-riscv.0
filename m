Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D1CC77B7E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 18:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uN8E9+b05/cbBbqMqYGRl2vj7Nm3qhR2aW9L+xBXyXo=; b=VLSLZyEtqvdJEhpu6XxTxW7OIN
	ml4c7QLvW6PlBIlHS9P/Wj/8RLQ94+RSzTJKL0C3qKfyKfbdknM/rqbLWE9oFoQ5DL4ZpWutUfP4E
	fFWHHu7cTL6MtJ1KWoF9AFk6dZTrvVrRXQ2Ee8nSuVLlifuBkbIfipZHluj5J2K4Rs2Og+QvZD2gn
	hn4b/7A7SqIj2fuTq7so6o606IWNWmn7J6qJ9VQZUFbC4vOaTSuSDvk9xgfJwvPOmuB1yBYXyzM+2
	kk//xh9Qu+2Yd/J4UCwHD7phM0RTLSa93ky+EX01JuOOPGVI6Q5gqD6SOkbit0VW3iVrqRPrWx78U
	t+ujXyhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2FsW-00HRn2-0a;
	Thu, 25 May 2023 18:40:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2FsU-00HRmV-0H
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 18:39:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC9EC63A0B;
	Thu, 25 May 2023 18:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD99CC4339C;
	Thu, 25 May 2023 18:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685039997;
	bh=OkYQrOPk4PyK08Uym+XIxvDDLcqyKIRZcZ+rbE78SC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dp1Ur0bqJyfLFJbG2S67Ujk/FXHuqKGqnRUxLVhqBXx7hh+HRvzW1YdZ6bCWmnO1z
	 BL/LkECCriwQnFZpLt8PYiB0U+YwEO/PZ5OOfOGALYctBYqQKZ1FKoVWasNDEH9+sa
	 3xra4uDwx9azEuN9ZiYepBEhza6dGDYCkAl0w5lQ0jCmlE9B2O12AmYeGZT4yKAKyQ
	 pjka0kA2D0NPmAPgUhZ5bD3dHQ51g8uOPKlgrrP6N8j/xi/11ptBYICCbu5QGyEbny
	 s/uoD5eMVfpfqqOObrgbXCnj98eNhpF9c2cNoC+LGVYfMuu5iSgYUhFTk8m/9yxsxb
	 yhOU/GT+XRAow==
Date: Thu, 25 May 2023 19:39:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Alexandre Ghiti <alex@ghiti.fr>, robh@kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	jeeheng.sia@starfivetech.com, linux-kernel@vger.kernel.org,
	palmer@rivosinc.com, leyfoon.tan@starfivetech.com,
	mason.huo@starfivetech.com, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: Bug report: kernel paniced when system hibernates
Message-ID: <20230525-desecrate-imposing-d97ab34e06ad@spud>
References: <20230525-guacamole-swimmer-68048a73baac@wendy>
 <CAK9=C2WUyLxZwQO37cN-i+V+A3yxmEoaj=uE8yR8nseYTDW7oQ@mail.gmail.com>
 <20230525-postnasal-monopoly-98adb96ffaa1@wendy>
 <CAAhSdy06nQh4H1FP_K_-VF462mhj+F2M=4AV4QSCUGe5XVqX0g@mail.gmail.com>
 <20230525-shrapnel-precut-26500fca4a48@wendy>
 <CAAhSdy3SqeLdAfaojUki=ht21nr4ZUPMkW_t9M6ntQCt6Ds4Nw@mail.gmail.com>
 <20230525-citric-waged-a2f78d27eb0c@wendy>
 <CAOnJCULfC0jmiucLNMeJZwJf4QbGAN6r4B-ubUbP16KVpxrCfA@mail.gmail.com>
 <20230525-flaring-trading-f2bf0713ae26@spud>
 <CAOnJCUK_EgX-En1QNS8yX1WA1nj8w2kpvXMQcvgWuR3dvzEQYw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOnJCUK_EgX-En1QNS8yX1WA1nj8w2kpvXMQcvgWuR3dvzEQYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_113958_161048_DFE21AE8 
X-CRM114-Status: UNSURE (   9.88  )
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
Content-Type: multipart/mixed; boundary="===============3333374745228852415=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3333374745228852415==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iJ4+DQXsDg97Xef1"
Content-Disposition: inline


--iJ4+DQXsDg97Xef1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 25, 2023 at 11:37:40AM -0700, Atish Patra wrote:

> Any testing of hibernation still needs to revert the patch until we
> have the proper fix.

"the patch" is what exactly? I assume you don't mean depending on
NONPORTABLE, since that is a Kconfig option.

--iJ4+DQXsDg97Xef1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG+rdwAKCRB4tDGHoIJi
0kJsAP9eqnY5SZu39gUcRNcAWMbMCXWw7Ec+mpD4rdvpRQvt7QEAqHgS2ADQ+RHj
6zsURS+xf694dQKGktiCuRbJdHQGLAY=
=6hRR
-----END PGP SIGNATURE-----

--iJ4+DQXsDg97Xef1--


--===============3333374745228852415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3333374745228852415==--

