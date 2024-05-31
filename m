Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FBAC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7UXc6tdsyeOTmRoJQfhUEUU4MLmZFQ0PLMRDaXLA0s=; b=X09JgY0W+p3te/cRKpItCIVsji
	SyGg56uaiz09+queboTZ6h6gC57SMfK19XFUxkz28KYrLHvoYWZvDfzlyH4rgWBjUxXG0gOQ1tRWc
	Uo9E21HgH4l8oQtNIVfG2WNTYosVBHFWQpkVspKE5h8Z0UYVp51OAIM9M1rn1VWTuVWi6KoMN7wJX
	UVXs8791x4SR1nGvd1w1errA9s4RoehhBHV5B0OG08tkU/kr6wzWhVSUdLlMOswFNEYjA0p0jPiHd
	8xZrNzCZfJLQq76vAlfFU2Rf1sWYiMlsf3OaZmZIFJP6XRJDB49qPeBZbvW2M3ziNexthF6L4AQrH
	wi8zgjfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD3nK-0000000AbPN-3siK;
	Fri, 31 May 2024 15:03:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD3nD-0000000AbOl-39KB
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 15:03:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56419CE1CBC;
	Fri, 31 May 2024 15:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB00C116B1;
	Fri, 31 May 2024 15:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717167820;
	bh=kzwdmdMivwWbu5Pb/8+YQ58BObGKh4rKu+UvlJwfFUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JyDhaIvvHsmyO+DgChXw9qUEqUvOzPG6r93W6GoRT5W7YUEKR0Br6mZJCujvfLrx7
	 IIgezlL3LbNOfC3tQxupOvBrr2f8mLyaCsLqEkSNgpgnG5YI+4SYAuvi/EhcJiBIrc
	 zG7sKPheoWI6D6wFafreEztoE71IAs1AhlyyCYZOW2vIPwryj5SI6DLpmaFPEp2RbY
	 HoZOuxrO9C4nHuUL09pTewJQke5e3HDWyy0NygwAuyaQpNIQJjvAFSzVXZFssZXGwf
	 G0CUsLPpoNxhVv/pabmJBP4Z+fW7E9hTRkdtJ0DSfmW2vxV5V7X4jWTXW8zp8mosvC
	 zAP8kZz+O5urA==
Date: Fri, 31 May 2024 16:03:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: thead: th1520: Add PMU event node
Message-ID: <20240531-reseal-sabbath-4994673eb98c@spud>
References: <IA1PR20MB4953BA3638A0839FCB0EF86BBBF32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CAJF2gTRu8WUkjOOzH4MZvinZv=0cgF988c7HyzP5jw0p3w+MWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTRu8WUkjOOzH4MZvinZv=0cgF988c7HyzP5jw0p3w+MWQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_080343_988542_DD35AD91 
X-CRM114-Status: UNSURE (   8.21  )
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
Content-Type: multipart/mixed; boundary="===============7709128918580990394=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7709128918580990394==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hFbzC4Jn/xKf+UkR"
Content-Disposition: inline


--hFbzC4Jn/xKf+UkR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 31, 2024 at 09:43:00AM +0800, Guo Ren wrote:
> LGTM! Reviewed-by: Guo Ren <guoren@kernel.org>

Please provide tags on a new line so that tooling picks them up.
I had to amend this commit cos I forgot a signoff, so I added it.

Thanks,
Conor.

--hFbzC4Jn/xKf+UkR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlnmxwAKCRB4tDGHoIJi
0mWyAQCtRDjlV2EDCpIRC6SNrAMNrikM8qQS5Cv/TvuW/ikVBwEA1f58SB+mNN9k
pDLsbVdZhVH4q91F16Bt0AnC24yHAQw=
=JZ98
-----END PGP SIGNATURE-----

--hFbzC4Jn/xKf+UkR--


--===============7709128918580990394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7709128918580990394==--

