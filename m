Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35100EE49A4
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 19:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WW2atk3nuW45jubXlORxnbpaHA/q/OvxjcNdYx38tIE=; b=4gBNr5GvKQmN+wl8dv3xVLFw9d
	Y9UWFDMb3Ku2QpPkCu7pmPqk0fN4xFj58gW28OWOGNr5GQqgrG5Nz4PfHD2mZTxShK41AaGKnwtYT
	+pC2sTs5fXwAJ6tdGGzyUVJLeBKlpJbtzTtkIZQmKGi7virbNfIsvV4WxKma0xRFlradr0mKjRfj9
	/pOHc+LQRTpgbvfOGQPzQLGv4Y5MfY1UsH/0nbBf2b/X+2CsYCD8gYj1n2nekKHLyJin17op330oe
	U3USbIlohIhDhmz4npX6t+vR/Lm+/2HLSMKE89BXUOOEzlVq94KK81/fh/170i37D4SlsidkW+bZ4
	5OUgLBDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfQOO-00GrTC-1O;
	Sun, 10 Sep 2023 19:46:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfQOL-00GrS9-34
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 19:46:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B7ECAB80D0C;
	Sun, 10 Sep 2023 19:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FC9C433C7;
	Sun, 10 Sep 2023 19:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694375202;
	bh=0mvlneHp3c5CaAZWyTI0H0bsvFFK1kORjGTdIZMpYRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNu7XQCOOWWxuhn83tvc45l4SurevbxCseaO3e7zweDPnkiFN79JVQ8NBbOSw8zF2
	 rxppa4yUMHfgC7ofTpxl7BseKR9GMA+GleM5xt+C7Q7t1sTHk7NF7satVwjWYUN66e
	 s1E8q9k6ge1M6v9dAaH6NVkiqkz3HuvGuQ19JmQtxNUJp2nfesCePg3nhCBL6Rv0Xb
	 b+Cy0UbkeWqHMtoguJxOtLLglVtRgTOb7HYFaoH1Mkt8d7MSzbGUWCn3qploEb87q/
	 PAlXt7DmRi4bIgLM8+SxCPYdY1tCZ4CRVjymtWbG3vwwE8KYMmXUtwvz9HuT7R3pit
	 zugbaYRnjekJQ==
Date: Sun, 10 Sep 2023 20:46:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] riscv: mm: Always flush a single MM context by ASID
Message-ID: <20230910-haggler-barrier-421cefb0cc79@spud>
References: <20230909201727.10909-1-samuel@sholland.org>
 <20230909201727.10909-7-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20230909201727.10909-7-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_124646_140509_6D1C33C1 
X-CRM114-Status: GOOD (  10.37  )
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
Content-Type: multipart/mixed; boundary="===============2575701894050967977=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2575701894050967977==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XAP+SDGC73uO892R"
Content-Disposition: inline


--XAP+SDGC73uO892R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 09, 2023 at 03:16:34PM -0500, Samuel Holland wrote:
> Even if ASIDs are not supported, using the single-ASID variant of the
> sfence.vma instruction preserves TLB entries for global (kernel) pages.
> So it is always most efficient to use the single-ASID code path.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

On nommu:
arch/riscv/include/asm/tlbflush.h:59:69: error: 'mm_context_t' has no membe=
r named 'id'
arch/riscv/include/asm/tlbflush.h:61:9: error: implicit declaration of func=
tion 'local_flush_tlb_all_asid'; did you mean 'local_flush_tlb_all'? [-Werr=
or=3Dimplicit-function-declaration]

Cheers,
Conor.

--XAP+SDGC73uO892R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZP4dHgAKCRB4tDGHoIJi
0m6yAQC30XIJEbs6GqdPJenN69cc0QqOG8mlUD4J0NJQ1HsG6QEAmbJu7+FKS0oJ
Cv27cSMuq/YLDqJFq8GD2qPkVIAsywE=
=NMxL
-----END PGP SIGNATURE-----

--XAP+SDGC73uO892R--


--===============2575701894050967977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2575701894050967977==--

