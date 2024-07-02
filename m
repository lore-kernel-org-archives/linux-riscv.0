Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E897CC3065C
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HO6+Nz6f+JnJr7Ro3CasEZv2AfwqIzcV7Be/IzWkLv4=; b=z3C3bMNbtZIIhDHZ08AvinIdfb
	PD+IVFx2XVw1m8I12+2EG8MT0tUZ5CrfbtaaIRwtgfz9bAwAv3gprhr6wclxnKSLBYtrpiTjf917u
	OlRFV5IUr3Wad3qhn8Ju9r0OWXLI3umbwdE4oFn6LTEy6Zt0Q8xfuO6O9iG1WTDJKzHSEjj8dk/VA
	IeV7RgKPBhiA2Jqj0n7IrNIQ5euPoZQBeDm6jXs+hXh8EDg8AzqsLljsmqxIwH9+aTwsThP4DsrcT
	8T05liy5AF/hcd0T2k5DMTcDd62xSb8PyKArdepT8Ed03Jd3qul9sTCsrUgKBAuqaGeODIk6aKfKA
	qpzzY0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOeBE-00000006yY9-3Bga;
	Tue, 02 Jul 2024 14:08:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOeB4-00000006yVa-465s
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 14:08:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B3C4BCE1DC0;
	Tue,  2 Jul 2024 14:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4831C2BD10;
	Tue,  2 Jul 2024 14:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719929291;
	bh=FczaPhMPNC2StePC+oGnLGpU1tRFqdJWKJZyTLhC67U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pd1kgJmjphvQZpFYPGN5fWrwFeCN4vdbE37IPda6u/ZDAXOjwNht89sKsRynFIoO5
	 ZN5AATxpTwAdDCt7Yi+IndVIPBtE4s+XjYj+x7ByM74y3HqRiXjZPvXS51qOLCC2lM
	 j17ah0qHZX3Bq3UW5yCU8RuIsteqSG03qgqseXAnspD7LiR+3egEEC0PBoj2jDXKT+
	 6ASk2Ke2SMX9WaI3K94tVueVY/ntVogA1vjm49Hty59Kja+OKIo94w5aNkf5kLTFDC
	 DaPq6hsfupejni532Qx7Ndp4hOvLcVctRKu1jSBihfHGR10tktG3plBWTMCUB0ZO6/
	 G28xOD4jn4paQ==
Date: Tue, 2 Jul 2024 15:08:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 4/4] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <20240702-unissued-dreamlike-badd0fb75ab0@spud>
References: <20240701185132.319995-1-jesse@rivosinc.com>
 <20240701185132.319995-5-jesse@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240701185132.319995-5-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_070815_408396_00EA49FA 
X-CRM114-Status: GOOD (  21.85  )
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
Content-Type: multipart/mixed; boundary="===============7393519211602037876=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7393519211602037876==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x34tUiPHU+DtDFfq"
Content-Disposition: inline


--x34tUiPHU+DtDFfq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 01, 2024 at 02:51:32PM -0400, Jesse Taube wrote:

> +/**
> + *  isa_string_contains - check if isa string contains an extension
> + *
> + * @isa_str: isa string to search
> + * @ext_name: the extension to search for
> + *
> + *  Returns true if the extension is in the given isa string,
> + *  false otherwise
> + */
> +static bool isa_string_contains(const char *isa_str, const char *ext_name)
> +{
> +	size_t i, single_end, len = strlen(ext_name);
> +	char ext_end;
> +
> +	/* Error must contain rv32/64 */
> +	if (strlen(isa_str) < 4)
> +		return false;
> +
> +	if (len == 1) {
> +		single_end = strcspn(isa_str, "sSxXzZ");
> +		/* Search for single chars between rv32/64 and multi-letter extensions */
> +		for (i = 4; i < single_end; i++) {
> +			if (tolower(isa_str[i]) == ext_name[0])
> +				return true;
> +		}
> +		return false;
> +	}
> +
> +	/* Skip to start of multi-letter extensions */
> +	isa_str = strpbrk(isa_str, "sSxXzZ");

Technically this could break with the old QEMUs that had "su" in the
single letter part, but at this point I think enough time has passed
that it does not matter.

> +	while (isa_str) {
> +		if (strncasecmp(isa_str, ext_name, len) == 0) {
> +			ext_end = isa_str[len];
> +			/* Check if matches the whole extension excluding version. */
> +			if (ext_end == '\0' || ext_end == '_' || isdigit(ext_end))

I'm also not entirely sure about the final clause here. If you have an
extension "foo" and "foo32b", you'd match on the latter, right? I don't
think any extensions like that at the minute (foo32b type stuff does,
but the "root" alphabetical part for a foo32b doesn't), but I also don't
wanna have to chase down bugs in a parser this early in the future! The
devicetree binding doesn't actually allow anyone to put version
information in the isa string, so maybe the thing to do is just drop the
isdigit() check, given we only support devicetree right now for this early
probing?

> +				return true;
> +		}
> +		/* Multi-letter extensions must be split from other multi-letter
> +		 * extensions with an "_", the end of a multi-letter extension will
> +		 * either be the null character or the "_" at the start of the next
> +		 * multi-letter extension.
> +		 */
> +		isa_str = strchr(isa_str, '_');
> +		if (isa_str)
> +			isa_str++;
> +	}
> +
> +	return false;
> +}

Otherwise, I think this is fine now. Thanks for the updates.

Cheers,
Conor.

--x34tUiPHU+DtDFfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQJxQAKCRB4tDGHoIJi
0k6uAP4h26hzrqUn8SQOtea5MoE7pVfXu05eNbYHvp84e0SVewEAtZqV1yZzenjn
RAoQXWnUc4/VGcwTElosMZrjivWItQY=
=D3gK
-----END PGP SIGNATURE-----

--x34tUiPHU+DtDFfq--


--===============7393519211602037876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7393519211602037876==--

