Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0051CAC5A5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 19:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ykgkw9ATMJ7UCatsNEEaGpBugruhz/oh4gJhC49mbn0=; b=gP99hxR4H7lv/F6AZgd65jo3qe
	skbqnYezbFWRsjcplp5/7f+tj8ngOhFyMoJTohtocnQzyQyFaDOcSwioBq8MmLNPaCU/GXUdsb4gu
	pkGeP2etnBU26oN3YTeI+chr9YLr+jpQqyLRap6p7nn1i8A5o+2hNH0BXsva0Qk1ihk2TpNcLKG23
	3/l2Crohs6b47q0NfYKWcr9c0g3G21ZqSD39wgYEzxIeha1oPnUQikoBqRH4XwgzJyvcN8F23dW7T
	xlR68ivBAeR+bXiNiZYl+dwQjWbc9S1jm/KWmKq6mFEMASESqsfclOi5wgaBbGUEaIuQC1uaViKKg
	pHWhzViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18J6-0000000EbpX-2vgc;
	Tue, 23 Sep 2025 19:04:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18J4-0000000Ebox-0Rrs
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 19:04:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED9CE418E2;
	Tue, 23 Sep 2025 19:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5831EC4CEF5;
	Tue, 23 Sep 2025 19:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758654242;
	bh=rObBVnG62ZJ7ZCcfJqDzxOXdIfr3WgqAb0OSmCfkgWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abRMG2AlbbsDYgfeunO3H3ZWQqTgpqWoKeIKc13cYmTn/jceSJ4VF5d7wUD0Kf/lk
	 PizfsETSN/oS3z2ZxTyiL4qRVXLkR2uCuHo/NC4LBXr8CFx8MiAl48NjSv+OQgsLQN
	 t9sT9Einp0qDnjooqexa4Nt99QaVjDYajKI2kkj5QRZfVu6pcQDB3WdVaCnOOvNjBh
	 zR3V9hZlh1Wj/BBFIok7N2obgy2/zgd9N6cpCPrG2xemoptGzp9LfgFj6OZY1Xeu0v
	 YjLsf3fObMvlpvGGoWWSGslb70eWXipEHD5I9TRGBhcLMk0boDI6jgDuLfBHpoWWoO
	 AKhq4mSbvBCvg==
Date: Tue, 23 Sep 2025 20:03:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 02/11] dt-bindings: riscv: Add Nuclei UX900 compatibles
Message-ID: <20250923-patchy-planner-112bd8448ef8@spud>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
 <20250922-dr1v90-basic-dt-v2-2-64d28500cb37@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20250922-dr1v90-basic-dt-v2-2-64d28500cb37@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_120406_158406_02EA2274 
X-CRM114-Status: UNSURE (   6.73  )
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
Content-Type: multipart/mixed; boundary="===============3988952515686893967=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3988952515686893967==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CAd0kSoi90+pR06L"
Content-Disposition: inline


--CAd0kSoi90+pR06L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--CAd0kSoi90+pR06L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNLvHQAKCRB4tDGHoIJi
0mm0AQCNWP5i3bqaHYB02yTtRtUwZXq/nVW3Pa5v9mJmyekDigEArtrKBVf3mnsU
AqMaRyV5PaznMNOPCQAKIpIxRWNaTgc=
=qZfh
-----END PGP SIGNATURE-----

--CAd0kSoi90+pR06L--


--===============3988952515686893967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3988952515686893967==--

