Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC7FC3ABC3
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 20:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPBchwZlp3wsFUrOvPwZu+pV2bjLUqspUUhZ09XTPlo=; b=mZxkRn8MKsw+ZM6yhBmrvNsUsd
	tRoqQUtA4ekzBnwOeOe9DKcsLLtZuDv0ZCl3eUgMIUfk9s1DX2YTvmZGJD2QnIUG83ZE13zEre9Rw
	UQIaRXNauv0mDpsOG4JVJcBXpC3qSpIdmkHCDThYzIiOwZgRL/KrrjWSMxjGbXgu/XtXuDjSZdCVw
	mgq4jQIGN7xRFHgJ+p+FLn+lWWd4Qom5Kw3sROdMfDRhh00rtcQYNjeNqnBovnYjdQUjltkOsQxl5
	Vzo+9zHCBx3+kJ7lMVLxsT1g4tf/fFVIM/YRIL+Ne/NFS97HEuDKa5mDOq3X3yEfTKQJD+HNu51Sn
	Trjs7/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOf8-0000000DL0Q-1WRt;
	Tue, 06 May 2025 20:13:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCL4p-0000000CesJ-2iVT
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 16:23:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AB356A4D6AC;
	Tue,  6 May 2025 16:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884F4C4CEE4;
	Tue,  6 May 2025 16:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548606;
	bh=dq9ErICKWqQf/JE8a2nlljpBO2Y+xrl7KL21aVj/qC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUREuewadKW9lDi6wOx2CWKLa3EhWk2XQynw6eI2YnuLDJ9UkxSVBqm+VqGd2Y/TN
	 Ohu9WOnn9sw+i1AXY5VTb47VqQO9OEh3oftDfCwuHce117K563LMCwnwWKman3cXNv
	 it92xpu6KyeoVHk9jwomQjbh+edCHMbsJMXGaFKzVW9CWQ/sRXaJJV/DBnLgpjxWDS
	 Uo8kKKXsrfSYtr6bOuAVsdLXk2LxXjqEcKIMmMvcb59DmAcIlUC5za0NCQw7SVnw/C
	 lT9gWGCrzFA9nZrio0GWZs3iJhLDJaCMMKcHmRIW4Q1I8AVLuA8qxvDuOAcXHledF4
	 m0tmJxWbMxCzA==
Date: Tue, 6 May 2025 17:23:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com
Subject: Re: [PATCH v2 6/9] dt-bindings: cache: ax45mp-cache: allow variable
 cache-sets for Andes L2 cache
Message-ID: <20250506-clammy-punctuate-6cb07dd0e81e@spud>
References: <20250503151829.605006-1-ben717@andestech.com>
 <20250503151829.605006-7-ben717@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20250503151829.605006-7-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_092327_758294_76ED149F 
X-CRM114-Status: UNSURE (   9.27  )
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
Content-Type: multipart/mixed; boundary="===============6731962880950205504=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6731962880950205504==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5IEHagUulufTAK40"
Content-Disposition: inline


--5IEHagUulufTAK40
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 11:18:26PM +0800, Ben Zong-You Xie wrote:
> The current device tree binding for the Andes AX45MP L2 cache enforces
> a fixed number of cache-sets (1024). However, there are 2048 cache-sets in
> the QiLai SoC. This change allows both 1024 and 2048 as valid values for
> "cache-sets".
>=20
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thanks.

--5IEHagUulufTAK40
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo3eQAKCRB4tDGHoIJi
0vNRAP9KmSdGwei5bWarXurTygTvCcNE5W3uyNAoqvI15vlJ8QD/TDxmc+ZcEQnG
Vecgy8nqGVt4RibG2dtkq2a4zI07pQg=
=FvUY
-----END PGP SIGNATURE-----

--5IEHagUulufTAK40--


--===============6731962880950205504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6731962880950205504==--

