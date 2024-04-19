Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BA4C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 15:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qI7uLWHT/3H7JFJpU9xhJE99heZ4wmr0LsY91aS02sI=; b=RCJJGIEbYYIoeiN7WxeOoONnY3
	t0GVsPyWTxvjdDsYiFP0kTYH37PoCHnxyTkronq6UEeXLy/GlNcMbtiSfLAfBxEveVdsQacnuimS1
	AJALzsn3Z5eOIQh/gGmc/T3kYkGl+gNUSVWoBSK90ZFhwtq/rk3kNMOr+6BBm0m6M/Rc6j4I9PaAX
	KeNXB/cwhzNQyMvM7Rpll5ddhYQMtV+3i6Xq5owLs6mu+yx5ZJlnZEUs4ReVbWqHwqdCQW/kUaR+x
	IjqH2RZNctwpwIDGEfHuPRQE5/X3RhnZaLGVje2oX8FHJgKIfzS/CK1Ge1O2PG0/MERHI3x/XrMUB
	t+O/e8vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxq6o-000000069ZK-2fgI;
	Fri, 19 Apr 2024 15:25:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxq6k-000000069X0-0iXz;
	Fri, 19 Apr 2024 15:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B3B961A05;
	Fri, 19 Apr 2024 15:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B962BC072AA;
	Fri, 19 Apr 2024 15:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713540297;
	bh=vdYzPMrx1mL0pzbTIRpayXsUt9mVPOYYeTwr96fWnps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CtnQxdlUEF3vKpQu1sx95LnMRlgV/aqKHQp0/csAwg1lJioNcOwmzSnvFtAvZyTUx
	 SSn6uRE4pJZ1NY55n+E5ORiQaYkV4svupYgE1k2LWMVBT9HczBGLkwN7GOKnvyflmU
	 giuHhxuXJwBDLp9qDYKLWKAGqUAB5AVrUjaRyK5HHiej7M1L48HLKnyNbxjPEFE0WA
	 s+H+uAzInE+/8T9KgJEE7pi5pGShvJfNTIDNImR9rYZboqDKpuRPnZLU4mVrdQs34u
	 n/Qn9X7edphCZfK8wfXC+VeDoo7etOF+QLJrKW1UvWYxVvEMthRHAKegjEq6MAvp4G
	 OsYgWYFAz49AQ==
Date: Fri, 19 Apr 2024 16:24:45 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb
 ISA extension description
Message-ID: <20240419-aground-extradite-9557a5b90afe@spud>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-2-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240418124300.1387978-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_082458_354301_562E4E46 
X-CRM114-Status: GOOD (  10.39  )
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
Content-Type: multipart/mixed; boundary="===============2833400736651590004=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2833400736651590004==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IbJ7nnYDSyrUMi3r"
Content-Disposition: inline


--IbJ7nnYDSyrUMi3r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 02:42:24PM +0200, Cl=E9ment L=E9ger wrote:
> Add description for Zca, Zcf, Zcd and Zcb extensions which are part the
> Zc* standard extensions for code size reduction. Additional validation
> rules are added since Zcb depends on Zca, Zcf, depends on Zca and F, Zcd
> depends on Zca and D and finally, Zcf can not be present on rv64.

> +allOf:
> +  # Zcf extension does not exists on rv64

If there's another version, "exist".
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--IbJ7nnYDSyrUMi3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiKMvQAKCRB4tDGHoIJi
0ip5AP9dWXDapMOiL35Gtl6YMVu8HpKNUc2H+iDTWD003piM/QD6AnztSi8/8umM
hU83nbsm7PdjtwFfBV7LErQIay+iZwE=
=Kdnw
-----END PGP SIGNATURE-----

--IbJ7nnYDSyrUMi3r--


--===============2833400736651590004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2833400736651590004==--

