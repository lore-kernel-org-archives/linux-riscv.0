Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723EFC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqlAeCxlBlj8jLZb5vx32TzhORi8qwNE+94dFaU3Sv0=; b=jmZUXmAaRzH3D1SImPWR/PxNCl
	CU1HkOp3eq2aQBG6Ia0cAFL5i7xZbj+SkI0mlPQjVcZOxoIjk7GZoxzu5yUk49N4OkQ9AWwLIofqC
	bxcj5oVqwRHqZ20HfEPJJd90O9aRhNlizafT++nqVVhY4nu4yZVkuDqQie6f1GrWt/4jJx+SE+IAj
	LFjtrHONB+6QyiOeGKCJM7tGxoPFEbze9U+K54Oh2Dk6gHRL8LVge6u6jdmlmm4R52xWFjVJ9RLra
	HlC/Q88ZRh+Ij/ZbNjtfieWuF4rkuRwhC1vRe9oIbGeQmUMO/k19wOnW1RC/o3kaKRkVz9lzrt+pm
	9Yl/+J5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtF4-00000000usC-01Ra;
	Wed, 19 Jun 2024 11:12:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtEz-00000000urZ-3E5Y
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A5F761D79;
	Wed, 19 Jun 2024 11:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19465C2BBFC;
	Wed, 19 Jun 2024 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718795556;
	bh=O9nhu/+Qvcd4o30VuBzlUYrvaX7bpq5z3EfEXG99SKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4N+24W4GUYywKfd1i2dwkIWWjD5HVHCyj20kf4BUsnWhLyOC0niZaYsukQyT40AC
	 2cgc9CdRNQ9UYlL567COAG+eEsCsaaYz7Bjjf/BuRbPMghM6N+gH3kSUnHCod578ka
	 owgCGNYXKzNSe9xhYHuxjicp+EojR0lPu1ySPu9DtJIk5UGQ+R+PpgcJ7lgw6wJn7H
	 wbXW8fAyzBbE+shz836a92bqhZWS5U8nEjJqT+kj+3UxNke3DIvp1kv2vIYyP19ZJO
	 WmxtGLpsHi6YFkw/K9yq1nNcYGbcH7JzWIjko1e67vTvTBVbbAPjOG0FLsqthikwpC
	 1XuRgZXPux22Q==
Date: Wed, 19 Jun 2024 12:12:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] clk: thead: Add support for TH1520 AP_SUBSYS clock
 controller
Message-ID: <20240619-tapping-jaundice-471811929d96@spud>
References: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
MIME-Version: 1.0
In-Reply-To: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_041239_103300_CCFC24B8 
X-CRM114-Status: GOOD (  11.38  )
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
Content-Type: multipart/mixed; boundary="===============8503176402705310856=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8503176402705310856==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FObDbNoTBAgucHoG"
Content-Disposition: inline


--FObDbNoTBAgucHoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 15, 2024 at 06:54:29PM -0700, Drew Fustini wrote:
> This series adds support for the AP sub-system clock controller in the
> T-Head TH1520 [1]. Yangtao Li originally submitted this series in May
> 2023 [2]. Jisheng made additional improvements and then passed on the
> work in progress to me.

One thing I noticed on the dts side is that the GPIO controllers have no
clocks provided. Does the AP sub-system clock controller provide their
clocks too?

--FObDbNoTBAgucHoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnK9HgAKCRB4tDGHoIJi
0nOtAQCGanWyMDVqpiwnBPcON68b0Uar/qqWSiQrmJT0LkotFAD/QrasnNc1TUTV
RH7Wx87PHTMMHt9BO/UguDi5bJ5uJQU=
=LFxV
-----END PGP SIGNATURE-----

--FObDbNoTBAgucHoG--


--===============8503176402705310856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8503176402705310856==--

