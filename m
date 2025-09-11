Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93463CAC587
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 19:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABvMhLyoysPJeDLr098d2Z/+AFsc8fuDX+NwVhkrniY=; b=zN9BVJkXCmv383RA9VsJD6d/Mp
	Dbg4Can4VrO66R559TkxCL34mBrbDbsZgAc3/hxM5Z3zLIsInJJlcw8D5TEui9VBbMwXjUKcGiLnu
	qd++550CjpMqgXA8ScTRDWSAkUBgBykUOXgwJM2EJ08eIte6vwnVTqXM16ZazztyftbOIu7BDQgLf
	DQax5iXazcSTzFYchZGPpPNc6veGcQrQlTxLs7oAIvU4Uebuo+7xAhI48l+vqLix5S2gWbTUp0KML
	7XM7A4+1LiI9lRSTkdW4CUv5RUPhvXblTjepeq8MqkavTQqGSj5FIIolmauJb9JynJH/unaWFcE2c
	ePvCo8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwnMP-000000055iW-26qb;
	Thu, 11 Sep 2025 19:53:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwnMM-000000055i8-2fJK
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 19:53:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0688A40BA3;
	Thu, 11 Sep 2025 19:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0ABCC4CEF0;
	Thu, 11 Sep 2025 19:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757620413;
	bh=AodW38A29sqmvvlSetUW/ZjjgJbifCGUivPqnBnvZ/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cRj/p7TTc4VZV3zJp2FQAE1awUUZBHTY94GntEf9iosSZJDoxzebyvwvjDuuwxgJT
	 0uj4ycURxC7Wx9sErcvyOi04SzecJCqNd0tImUNF22T/0KQJBtDqe0lT0OLGuIF1ae
	 tlD6wlS8xt8JVVWadDBlDJCoZ85RSTDWsCUddRa+AprvZUW/Jv7U2GWrOZ9nM3098e
	 O0AUiCxqVXZcE+zqcLJE8MHSljkZO/imTdhEkjQInuv9UilOii53XDV0Vi2sOeyYGE
	 gXEKu+JsColDMIfi/Ptn5roDjQqAtr76gCI6+aHJ8B9IpWriAsyPztS5hJDi5UIxDs
	 M/VkKkRM7QyQw==
Date: Thu, 11 Sep 2025 12:53:32 -0700
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	James Morse <james.morse@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Vasudevan Srinivasan <vasu@rivosinc.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] RISC-V: Detect Ssqosid extension and handle srmcfg
 CSR
Message-ID: <aMMovMevjriDs/Ac@x1>
References: <20250910-ssqosid-v6-17-rc5-v1-0-72cb8f144615@kernel.org>
 <20250911-chaste-rare-fbc3b48a341a@spud>
MIME-Version: 1.0
In-Reply-To: <20250911-chaste-rare-fbc3b48a341a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_125334_699354_90184BC3 
X-CRM114-Status: UNSURE (   9.96  )
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
Content-Type: multipart/mixed; boundary="===============4923685322178358922=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4923685322178358922==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zEbtGaWXMlB3uQ9r"
Content-Disposition: inline


--zEbtGaWXMlB3uQ9r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 11, 2025 at 05:23:30PM +0100, Conor Dooley wrote:
> Why is there no binding change here? Is it not possible to use the
> extension on DT systems, or is this an oversight?

Thanks for pointing this out. My intention is to support QoS on both DT
and ACPI systems. I will add an entry after sstc in extensions.yaml.

Thanks,
Drew

--zEbtGaWXMlB3uQ9r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaMMorwAKCRDb7CzD2Six
DOfaAP96GGUAVpysr/h4ZBvQcIkHJzaMMI7OTwpxiLbcKu3WyQD9EeUoBIblbZhg
l85fP/yS4nkEhSof41ceaoNhMnF47gI=
=ZHZW
-----END PGP SIGNATURE-----

--zEbtGaWXMlB3uQ9r--


--===============4923685322178358922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4923685322178358922==--

