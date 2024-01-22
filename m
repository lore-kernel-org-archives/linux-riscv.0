Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C259C47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nv1cy3hn67W3vcragGVXAJjseCV0C99ua1cwZ5dugX8=; b=fQQ9M5MzolfRyysW5HvRisFKK1
	SuK+IvuHL2ZY2NdAWxbLGs34Kh4TX2AdGYjjzjn9fOlbYdQUj+NH2ZMlCRSQPD+OeLbgerv7A082L
	h3FmjVgHjm/vrl56M38JK8iKf2gxFde2rnDeDzqw7p/dGH1h/a1X3V7okSw7F1JZ1zW65A0LYtohe
	7aaCbKd51ilVAZ4JYXadT3THA9aHL0Jmi0mS/BNnGWZOhQQ0J5+oDXfd/9z7MbDqwCqOFvFxyTuPV
	26/sKFpkEfnO0o8g6GB9UD4Z/H8BXqtttj/+dgfFIn7rQPgMJQfnAWCE6xg3I4a5+W7GNxst+JL+2
	PGZIU+tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvtL-00Cahn-0g;
	Mon, 22 Jan 2024 15:07:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvtI-00CagX-30
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 15:07:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62BC06115A;
	Mon, 22 Jan 2024 15:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30555C43399;
	Mon, 22 Jan 2024 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705936032;
	bh=UcxkksHxcsaVz6RDRPnLcMAB+qrTU2YcefyY8O6v3UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pVq4KqsSzRcW77reefwLad5zgDLuUb4AQfdroqI+EsSUqYSt8bYkYIr4BKk9qBcnG
	 Adp+qnrOpbrnAaVGmFM7UL36ZVne6N+Yf1kuRFIMWlZSJySbsNjqFleB9hDy5bH6c5
	 ZLkTP35WhhDTXed3eqKKJISVlriZeCOXXa41XqRpSEAM3NSttRKiFjUlY8WRHxOaaO
	 mdFXKUTN0RSSOCSzrAFd5kLSr+S57u8BfELg77sskAdUJFTmTXmMe98S1ItAzkn6Qh
	 j1QyrUqKvCH4+THZtx+JdJhj8D0PtmGwVPbuP3frY5kdxK45BT8pgY2Qe/bSaVXT/O
	 0WegAouDBqsGg==
Date: Mon, 22 Jan 2024 15:07:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: microchip: Fix POLARFIRE_SOC_SYS_CTRL input prompt
Message-ID: <20240122-party-kosher-6c1592d49ffc@spud>
References: <607c5ba8b95b1a11b6dc532223e9d7abcc2c20e4.1705935812.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <607c5ba8b95b1a11b6dc532223e9d7abcc2c20e4.1705935812.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_070713_024778_C6312F24 
X-CRM114-Status: UNSURE (   8.15  )
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
Content-Type: multipart/mixed; boundary="===============4610096252598617251=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4610096252598617251==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kuN3y11A864o183R"
Content-Disposition: inline


--kuN3y11A864o183R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 22, 2024 at 04:04:14PM +0100, Geert Uytterhoeven wrote:
> The symbol's prompt should be a one-line description, instead of just
> duplicating the symbol name.

Huh. Why it was ever like that I do not know...

--kuN3y11A864o183R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa6EnAAKCRB4tDGHoIJi
0mgCAQCUPR4IiGRpjs5TOekItdDyYZ6FZoid8Hk5P2v5MsmwjAD+L2y9azy5sG5R
2cd89GWxsKDgC4ZjtrPDhY9LTH1ZAgw=
=mw6L
-----END PGP SIGNATURE-----

--kuN3y11A864o183R--


--===============4610096252598617251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4610096252598617251==--

