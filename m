Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B13C54EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 22:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVMm9s6RYBR6Z1l+iIqyWVKH79Mi1m+roPpMfRLmg+s=; b=mbdn60IAsPtAyBRT7TOxCrtRqM
	SsGmsWPVFn9phFZrY3WupWtbZqfvAJjtmDsI9M1kDP72ZTVss4p6krYGDYujvqpGo9N939y91Iexv
	0nxN8DKfiddyhz1WTOy7GDP9dpw8iEW3O3ED5trEz6cPFbaPg22OmObLzmfWmkFJB6xihyOl0z9NR
	WpNyOfXOnjOaOAMKHE3Eql3/J75LJWCFhf+0TRzLmctxNWobsbXfePzQLUGMaqHDIaeEx+E7s8rqT
	ivHnGB6vwPKfAHYrJMzWfzsPCVxtCWjFmsyrILklUElcJ9qAXWtBliMfp9JoEB2iHap3TDqe2aQYE
	66xBoUzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMjp-008ian-9D; Tue, 10 Jan 2023 22:04:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMjl-008iZz-UH
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 22:04:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8DDFE618E5;
	Tue, 10 Jan 2023 22:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF08C433EF;
	Tue, 10 Jan 2023 22:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673388292;
	bh=sXKQH9MHPwjOGWbA5cDyPTWbK0WzJz55SrsR2+i9tYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j7h6E7zc8athO1Q5AWD2+pZqe1vxLYAx7h0qd8ud8mwzfeW3B0vBXGXhFbKO53NjT
	 bGTfuw7X+QD64wZtno1TYG/CcWiMKTZqKK4bJxS5ghfMloAA0b/yb+hQMRSepclgYZ
	 f1sYdryDdJCwupYZ0g37IluYQ9ubjezKdvU5zHFwuKyshnKCSB9j/IWtK9LPq2/5bG
	 F4lpcT6rqnWE2wdjp3Jc+JL1iYp2Hm7Agq9cvIA4FX9PONmBP3LoicLBiQAt/gKIe3
	 CHDydOenDqT1Cjx/s2ZT9Oc62BwmH8Rwu/BeUUFGBOXAQoFLVzYm3O64p/jn1LKtBE
	 3JX8q7vpqgbBg==
Date: Tue, 10 Jan 2023 22:04:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	palmer@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Guo Ren <guoren@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>, linux@rivosinc.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: elf: add .riscv.attributes parsing
Message-ID: <Y73g/nkDe7Sfp9ps@spud>
References: <20230110201841.2069353-1-vineetg@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230110201841.2069353-1-vineetg@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_140454_090449_E0F7DA12 
X-CRM114-Status: GOOD (  17.03  )
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
Content-Type: multipart/mixed; boundary="===============1542080331622822965=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1542080331622822965==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XzBgRjeUQy7ALPqW"
Content-Disposition: inline


--XzBgRjeUQy7ALPqW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Vineet,

While you're at it with Jess' concerns, couple nitpicks for you.
May as well say them now rather than while a v2 comes around.

On Tue, Jan 10, 2023 at 12:18:41PM -0800, Vineet Gupta wrote:

> Reported-by: kernel test robot <lkp@intel.com>  # code under CONFIG_COMPAT

You can drop this, even if it reported against a private branch AFAIU,
just like its complaints about patches. As Greg would say, LKP didn't
report a feature!

> diff --git a/arch/riscv/kernel/elf-attr.c b/arch/riscv/kernel/elf-attr.c
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023-24 Rivos Inc.

s/-24//


> +static u64
> +decode_uleb128(unsigned char **dpp)

Surely that fits inside 80?

> +static int rv_parse_elf_attributes(struct file *f, const struct elf_phdr *phdr,
> +				   struct arch_elf_state *state)
> +{
> +	unsigned char buf[RV_ATTR_SEC_SZ];
> +	unsigned char *p;
> +	ssize_t n;
> +	int ret = 0;
> +	loff_t pos;
> +
> +	pr_debug("Section .riscv.attributes found\n");
> +
> +	/* Assume a reasonable size for now */
> +	if (phdr->p_filesz > sizeof(buf))
> +		return -ENOEXEC;
> +
> +	memset(buf, 0, RV_ATTR_SEC_SZ);
> +	pos = phdr->p_offset;
> +	n = kernel_read(f, &buf, phdr->p_filesz, &pos);
> +
> +	if (n < 0)
> +		return -EIO;
> +
> +	p = buf;
> +	p++;				/* format-version (1B) */
> +
> +	while ((p - buf) < n) {
> +

While I'm already passing through, checkpatch isn't the biggest fan of
your whitespace after open braces:

https://gist.github.com/conor-pwbot/a572e395763916c7716cab9c870df4f3

> +		unsigned char *vendor_start;
> +		u32 len;
> +
> +		/*
> +		 * Organized as "vendor" sub-section(s).
> +		 * Current only 1 specified "riscv"

Is it worth having a comment like this that may rapidly go out of date?

Cheers,
Conor.


--XzBgRjeUQy7ALPqW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY73g/gAKCRB4tDGHoIJi
0qX7AP9ZTbJkjWiFBAlQ+CxEuOs0Tppz2YmYXfKW9ZHqLM2Z4gEA9K3DUGLckpu9
mZT4QzW5RzFFFFu2FuteHImu27Nw7w4=
=TpDw
-----END PGP SIGNATURE-----

--XzBgRjeUQy7ALPqW--


--===============1542080331622822965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1542080331622822965==--

