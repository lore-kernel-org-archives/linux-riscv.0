Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA566C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 14:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hp22agV8okquUVWPUgrtGF5cPaCuvSs5McJbwC+yU34=; b=gAplDBAoL5Wpzok45gyRFTOD29
	Cgd6BfkRIXfNFONlBEvIvDJ7j1Z7NYa6DW7EYYgYgpB5+HL0kAoGI3iuFmFC0k6AK/ob1syrVsFSm
	mUtD/IRX6YqF6vpau0cyqCabd4UzwvVY933uhhK9wI21Hisvul7FkcwquSRsT039ObZoTXbtLAIgk
	Ov9BS0AujbojpIGydZnNcFUb4dsqpTkTc2QskSLK2Uvu/ulEYpY+eivwHTVGddi4fwfLLPCe1Gfbh
	9FdNxP7vux/54sPVTppPJqELQWWzL++Yr3MgYkWhCpv+7QLaVMFo3dqrygkq7TkGcdn/XbHkUiGEm
	Y5CIoLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTlP-00000007Dko-1lwU;
	Wed, 26 Jun 2024 14:36:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTlL-00000007DjX-34Hd
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 14:36:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 82B22CE20E7;
	Wed, 26 Jun 2024 14:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474E5C116B1;
	Wed, 26 Jun 2024 14:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719412600;
	bh=lN4o+TpGwEdAHXdvn6W7jWruWVfTSWp81Ict7yYXA7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BPmIAY7C/8HZgLS33QwM53j5BrHpIUyrvhf1la7K/QkKMO4z/Cghds5/vnHGA3+qJ
	 YU+RTOMIeMknGJ1H3/fheBZrdpnAL7bmcFSIOYbGxXKdUS8Ubb20RIPXZ6Fj79+s29
	 k0gha7WFN+zb5v+nj9cwqSteVW0RoXNexPWSxfZZ+OVD1Fkg97gUW5NPGqaNgHkFUf
	 umKQzkwdLic6Tb+b5ORlHwALwnzw3VnlmW6kehkqoA7drMnQf9S0RsGSvn2phkneKS
	 77+MsP+q2rInQPKdHaHAa45mAxlxqr05r/5tqPS2w5k5ps+BeQnCYga5Atx3C2yp+5
	 R1lHZAs7Q3W2Q==
Date: Wed, 26 Jun 2024 15:36:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] RISC-V: hwprobe: Add MISALIGNED_PERF key
Message-ID: <20240626-aide-nickname-1ef5fef000fb@spud>
References: <20240625165121.2160354-1-evan@rivosinc.com>
 <20240625165121.2160354-2-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240625165121.2160354-2-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_073644_293985_98DE8691 
X-CRM114-Status: GOOD (  17.52  )
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
Content-Type: multipart/mixed; boundary="===============8744249408792099973=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8744249408792099973==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="943UgLD4rzYd2FOi"
Content-Disposition: inline


--943UgLD4rzYd2FOi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 09:51:20AM -0700, Evan Green wrote:
> RISCV_HWPROBE_KEY_CPUPERF_0 was mistakenly flagged as a bitmask in
> hwprobe_key_is_bitmask(), when in reality it was an enum value. This
> causes problems when used in conjunction with RISCV_HWPROBE_WHICH_CPUS,
> since SLOW, FAST, and EMULATED have values whose bits overlap with
> each other. If the caller asked for the set of CPUs that was SLOW or
> EMULATED, the returned set would also include CPUs that were FAST.
>=20
> Introduce a new hwprobe key, RISCV_HWPROBE_KEY_MISALIGNED_PERF, which
> returns the same values in response to a direct query (with no flags),
> but is properly handled as an enumerated value. As a result, SLOW,
> FAST, and EMULATED are all correctly treated as distinct values under
> the new key when queried with the WHICH_CPUS flag.
>=20
> Leave the old key in place to avoid disturbing applications which may
> have already come to rely on the key, with or without its broken
> behavior with respect to the WHICH_CPUS flag.
>=20
> Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>=20
> ---
>=20
> Changes in v2:
>  - Clarified the distinction of slow and fast refers to misaligned word
>    accesses. Previously it just said misaligned accesses, leaving it
>    ambiguous as to which type of access was measured.

I think if we are gonna be specific, we should be exactly specific as to
what we have tested and say 32-bit if that's what we're probing/testing
with. That'd be consistent with jesse's proposed wording for vector.

--943UgLD4rzYd2FOi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnwncwAKCRB4tDGHoIJi
0oHJAQCzuhaQs1e0sxDKyRbQx1Rt3W33WC+yta1V3tlS1n8VRQD+MaOHndFJ4ty1
lFeNRZdVv2EK2WGBoxfn3SN4uzjXTgg=
=iNiQ
-----END PGP SIGNATURE-----

--943UgLD4rzYd2FOi--


--===============8744249408792099973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8744249408792099973==--

