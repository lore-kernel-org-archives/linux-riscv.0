Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25B9CA1010
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 00:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzWhgCxAYvbC3gUqffQXG+2cRiQJHwKkaqpC6oTv0J0=; b=wTB1bWFdHKsOpu0lw1PF8wj73y
	T7q0k5jTcTy5so6JquaBHmOpGAxbmfbEek0N3FxeroIf0kCDrwf7SvW27k7WlzPAX33nAs+xddWwf
	rHWciD8gsSUB3igU7tPsFOJrSlpHbk/mxm95HmHMQAeHpA4V8tSe1sAabrYQ6zG9XMUou3p/lGfTa
	NpSQPEnTJo0VLIG46CirR8SVsr0Jdzo+jPONApDCmYDN3dTEpGgwFumh/VHdNLMltT5kVZWaqauBJ
	isURlhAFBjSfEjfKqcxMSAZCPVahjaoRBurRdmZLZgQLQ7mIJ6CVGnG+LqQVgERVfNpVcqh+kGZXo
	QwVTRVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbcJ-00000002pSz-2dRr;
	Wed, 03 Sep 2025 00:44:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWxq-00000001mH0-0X7x
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 19:46:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB0C944BAC;
	Tue,  2 Sep 2025 19:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99B3C4CEF7;
	Tue,  2 Sep 2025 19:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756842405;
	bh=CdZRISA+gHEiKLzaBnl6L8jh3RJF2Z38OQtqosUs1iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BawJS0vtxYtH/xFhNdiDLcwJiKEHO2uI1LWPeQSZRCUC6juDn5PqmtiFNXi87Lioy
	 dSKsRqzIUQ/e1LMiFo6XWSL4FGZhQ8+4Q3KY+Z7iVzHj/GQs8Si6ZBy2TTx1bJQVdf
	 rskvoXOd4aNemMT9v6Fn7G+efiNxQT67zaHyizNN2dvAY8sS6APQQJzsNG9d6QDCBO
	 PUKOxZoR4aOK7JiyKDv+ihx2sfEKk8xfczoJ/CXShPQjmXx6Zke+k/6ImyE37S6dH7
	 AcGlyOZork/DYtqVayJtKMhafwMoIDTQpvyqQmLQ/arL9MW9rNPzRvNX81xxYhFl1M
	 0JjjevjgMHOGg==
Date: Tue, 2 Sep 2025 20:46:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, ajones@ventanamicro.com, brs@rivosinc.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com
Subject: Re: [PATCH v2 2/4] dt-bindings: riscv: Add Zalasr ISA extension
 description
Message-ID: <20250902-embattled-pandemic-254a71360f10@spud>
References: <20250902042432.78960-1-luxu.kernel@bytedance.com>
 <20250902042432.78960-3-luxu.kernel@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20250902042432.78960-3-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_124646_182593_66A9CEC3 
X-CRM114-Status: UNSURE (   8.29  )
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
Content-Type: multipart/mixed; boundary="===============4500668226768004670=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4500668226768004670==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F5KiYL1bGp+1NxlZ"
Content-Disposition: inline


--F5KiYL1bGp+1NxlZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2025 at 12:24:30PM +0800, Xu Lu wrote:
> Add description for the Zalasr ISA extension
>=20
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--F5KiYL1bGp+1NxlZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLdJoAAKCRB4tDGHoIJi
0ptIAQCaoWjxj52htgtd1T5cupEX6Xxhi7rM5bR8frrLzgpAXwD9H7LxrnzkSQw0
70FLm2xEp7XUSwoUAZ8eefbM5SZvfAQ=
=Nxrs
-----END PGP SIGNATURE-----

--F5KiYL1bGp+1NxlZ--


--===============4500668226768004670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4500668226768004670==--

