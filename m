Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84891EE14D0
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 09:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/x22yytXyHeoV8sRKLzvUKuVjZt6dc23yGzKtnlNKw=; b=HiNTckJ2AzKyvrGQcvg+QjU9AS
	ptievHJtxcigo/vqiknnmSm1Q6ypakEhBg07qdwqj1GDMKvMwgU2V8dSL/sHKQuq3I6Og7wMEpD7G
	4oWptDWCMxZ6Mm6lDv2bLS6qeoSqcXmI2Vh8NhXsn+lWO5Dt7Fi/FcJ7ijONGeSLpawOEUYBug7yD
	Xm8FWjHH3Y+iOGRQFTytQFNHcIW1f7/0FbS3l/jOI/DBa1/fFgF4MjpNoW+WjjKZ8VoOaKV3Ym1O7
	VfJznPcgH/Pl2qM8H1iD1lW7yn1XcDjbMrgE2eaUB7+qdFYQxNCrIrge9IBGlKBq+R09+DZ7HH4KX
	inMR5o3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBgx-00BivI-1C;
	Thu, 07 Sep 2023 09:52:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBgu-00Bium-1w
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 09:52:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E1A85B81D8F;
	Thu,  7 Sep 2023 09:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E202FC433BC;
	Thu,  7 Sep 2023 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694080365;
	bh=4NjL8K4R6fpztrR/Dgccj7AXRwKd3L0DWcJs2pDqGtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=huYT4+giRmWYVqxUCb9V8Z4oo1OqM0S8aq9h96mmxlmVHzH+Y5cEl36UeRPZCWZKZ
	 DdkNYGG4JQkfTV6FDL1tayxgnHfpFXQb3YJCif1hAPMBF3VNUasz0Ir3+G0DL97rc6
	 dvyqbrePU+Tst4xzKAgYdaTopqurD9bdMR/OkDKZ8z74dzj3+DXUHFs+KfwbFlCoNq
	 44LUdtdmK8mmpA6rc5zhH8nDCHzpZ9cU3HMktWXLkYkIb4ejYIIFahQpZtqEtNc7+K
	 AaFZRjPUUV42/1RwGy/q4fe2woxpNyFPIey0qKbN8lGtfC+l6UVY0Y+G4UTpgwlkEW
	 a4uz4TvLf38dQ==
Date: Thu, 7 Sep 2023 10:52:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v2 2/5] riscv: Add checksum library
Message-ID: <20230907-9d5d2e7ef2a20edd75514470@fedora>
References: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
 <20230905-optimize_checksum-v2-2-ccd658db743b@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230905-optimize_checksum-v2-2-ccd658db743b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_025248_790082_7A1BB07E 
X-CRM114-Status: GOOD (  13.71  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5402845802811373580=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5402845802811373580==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u3Gz+z7jGL7ncD+4"
Content-Disposition: inline


--u3Gz+z7jGL7ncD+4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 05, 2023 at 09:46:51PM -0700, Charlie Jenkins wrote:

> +#ifdef CONFIG_RISCV_ISA_ZBB
> +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		/*
> +		 * Zbb is likely available when the kernel is compiled with Zbb
> +		 * support, so nop when Zbb is available and jump when Zbb is
> +		 * not available.
> +		 */
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop",  0,
> +					      RISCV_ISA_EXT_ZBB, 1)
> +		    :
> +		    :
> +		    :
> +		    : no_zbb);
> +	} else {
> +		if (!__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ZBB))
> +			goto no_zbb;
> +	}

Again, do these constructs have an appreciable benefit over doing
if (!riscv_has_extension_likely(<ZBB>)
	goto no_zbb;

?

That encaspulates the fallback to a non-alternative mechanism for you,
in case you had not noticed.

--u3Gz+z7jGL7ncD+4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPmdYwAKCRB4tDGHoIJi
0gPaAQCWfaA4BsurBPCfNHsJ5cIRXgEUpRYKmdhLrs1tMc9gmgEAvioIEb04cNY2
OYY8B8G9Z3xdn8bl0pskyuYYaS9NWQg=
=KM80
-----END PGP SIGNATURE-----

--u3Gz+z7jGL7ncD+4--


--===============5402845802811373580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5402845802811373580==--

