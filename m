Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F55EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THWCEE8zCfgDN/IozcVDNcu/iHe3V5XqcTBof5mE2aU=; b=r6fxCnAqAVHJkF
	qZ3BX+YOAQNseJ3deIImGPYuSG7jpeshR6bF6gOApxgsNNK5TVKMISvdKGR7eUxy/tGnR4fbUhyp9
	URvNhuhJZ+llPoRVfbeq7X261TwIFhfTU9LS1py8om7/wTmwkAnXPLXirMBjcAfZm1n3ixgdPn64k
	15MREB03P5bh9neFztSeHJq3TItTIWOi2KUwlEcID6oKPv02FC16xIVv+uZW+DH0pBCueQkA0//Qi
	E+70D0bXWFg+m0Y24L9tks/sZOIkr9zHHnjsL3CQqxW/8bigdjO+KCcqx+cT6CX8DrrT+LHgllQJW
	F9rxHjWX06hpYJOjDE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoub-00Ad7b-0b;
	Mon, 26 Jun 2023 16:17:57 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDouY-00Ad6M-0B
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 16:17:56 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b477e9d396so51178061fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 09:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687796272; x=1690388272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/z5+xnWs45041h00fl+tQyUR27zX4P0GYrInlN6dMa4=;
        b=C+rGlXVSints3DyywlkPL26WbmmecTvwwJKt1v8DTHBHf3r8EAnqVlaiy1HfZBeeaV
         VA26tv36Utp8r5Ed69RB1c8zxMfd+sh4Tzks+hYxN8Ii1FIur9ViElAEEz03wIbKCxGt
         1bHlPXQADceudRPsHUAwgRV5xbh1G9Vv8MAOgAduJTCpBbd0/NFDyCXVnHsfTJHaHTX0
         wR6hbX5ARGbECAb/xKctC6SIydaBPN+S+kfoeGAPlc9bEiUqr7a7PiyqDqu5ZsTzOVsu
         7NP43BtapSeNj3jtljv/QLgU9hqEZDJRLVWWQaxQAykRwzMr26qDjHBNWFkPPHLhSmuT
         PYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687796272; x=1690388272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/z5+xnWs45041h00fl+tQyUR27zX4P0GYrInlN6dMa4=;
        b=iUv/+LsP66yOhxzTz8thCAgEfnCHwioHN5gw9ktYr4cRFa1wSiXZoDzjNFmwE1kaVB
         QgFCBEDO5axRkgguI6P/D78JC7erSeUvPsWRUHQ50gJS7gchcMkhVjlDf/XjXv2PfTZs
         5Q4mGurHIYgY+ioI+X9QTO6xCpcRynNdczeCrylOLF++bzFqNiP4z05QvaowTTjZx1pj
         KJfsYCcwbQrFiIqiRLPKtyweetODz3y8TZrsC+crMPgYRXgMJ6eYRjFGniJEz9ywD3k6
         Ts8Ixlv5ECeVlborFKUpRvoM/g9YBXmHTMSNzmaOLokaWHuoaXT/vp9pQ/q9o4Bu5ME4
         ffwQ==
X-Gm-Message-State: AC+VfDzh4t0eYGngyD0zBh32tyKF/dm2zfNJxriPQOxvwWrE55SlDf+9
	BdH4bzgajt0iS7PwLDk66TVpow==
X-Google-Smtp-Source: ACHHUZ5k6uZBNezS9GNCWKfwqTUDPk5naondFMJ4S/crxxAvehZQuVd7g+h4xHf7XbUhF+H8lb3WoQ==
X-Received: by 2002:a2e:848a:0:b0:2b4:6c76:332f with SMTP id b10-20020a2e848a000000b002b46c76332fmr19796985ljh.9.1687796272233;
        Mon, 26 Jun 2023 09:17:52 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h22-20020a170906829600b00988a364023bsm3392930ejx.127.2023.06.26.09.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 09:17:51 -0700 (PDT)
Date: Mon, 26 Jun 2023 18:17:51 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1 7/9] RISC-V: split riscv_fill_hwcap() in 3
Message-ID: <20230626-0176f6ea5768a6013a7aecdc@orel>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-prevalent-heaviness-e35188de1225@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626-prevalent-heaviness-e35188de1225@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_091754_100062_FE921F56 
X-CRM114-Status: GOOD (  44.73  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 26, 2023 at 12:19:45PM +0100, Conor Dooley wrote:
> Before adding more complexity to it, split riscv_fill_hwcap() into 3
> distinct sections:
> - riscv_fill_hwcap() still is the top level function, into which the
>   additional complexity will be added.
> - riscv_fill_hwcap_from_isa_string() handles getting the information
>   from the riscv,isa/ACPI equivalent across harts & the various quirks
>   there
> - riscv_parse_isa_string() does what it says on the tin.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 350 +++++++++++++++++----------------
>  1 file changed, 182 insertions(+), 168 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 5405d8a58537..366477ba1eea 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -180,29 +180,172 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  
>  const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
>  
> -void __init riscv_fill_hwcap(void)
> +static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct riscv_isainfo *isainfo,
> +					  unsigned long *isa2hwcap, const char *isa)
> +{
> +	/*
> +	 * For all possible cpus, we have already validated in
> +	 * the boot process that they at least contain "rv" and
> +	 * whichever of "32"/"64" this kernel supports, and so this
> +	 * section can be skipped.
> +	 */
> +	isa += 4;
> +
> +	while (*isa) {
> +		const char *ext = isa++;
> +		const char *ext_end = isa;
> +		bool ext_long = false, ext_err = false;
> +
> +		switch (*ext) {
> +		case 's':
> +			/*
> +			 * Workaround for invalid single-letter 's' & 'u'(QEMU).
> +			 * No need to set the bit in riscv_isa as 's' & 'u' are
> +			 * not valid ISA extensions. It works until multi-letter
> +			 * extension starting with "Su" appears.
> +			 */
> +			if (ext[-1] != '_' && ext[1] == 'u') {
> +				++isa;
> +				ext_err = true;
> +				break;
> +			}
> +			fallthrough;
> +		case 'S':
> +		case 'x':
> +		case 'X':
> +		case 'z':
> +		case 'Z':
> +			/*
> +			 * Before attempting to parse the extension itself, we find its end.
> +			 * As multi-letter extensions must be split from other multi-letter
> +			 * extensions with an "_", the end of a multi-letter extension will
> +			 * either be the null character or the "_" at the start of the next
> +			 * multi-letter extension.
> +			 *
> +			 * Next, as the extensions version is currently ignored, we
> +			 * eliminate that portion. This is done by parsing backwards from
> +			 * the end of the extension, removing any numbers. This may be a
> +			 * major or minor number however, so the process is repeated if a
> +			 * minor number was found.
> +			 *
> +			 * ext_end is intended to represent the first character *after* the
> +			 * name portion of an extension, but will be decremented to the last
> +			 * character itself while eliminating the extensions version number.
> +			 * A simple re-increment solves this problem.
> +			 */
> +			ext_long = true;
> +			for (; *isa && *isa != '_'; ++isa)
> +				if (unlikely(!isalnum(*isa)))
> +					ext_err = true;
> +
> +			ext_end = isa;
> +			if (unlikely(ext_err))
> +				break;
> +
> +			if (!isdigit(ext_end[-1]))
> +				break;
> +
> +			while (isdigit(*--ext_end))
> +				;
> +
> +			if (tolower(ext_end[0]) != 'p' || !isdigit(ext_end[-1])) {
> +				++ext_end;
> +				break;
> +			}
> +
> +			while (isdigit(*--ext_end))
> +				;
> +
> +			++ext_end;
> +			break;
> +		default:
> +			/*
> +			 * Things are a little easier for single-letter extensions, as they
> +			 * are parsed forwards.
> +			 *
> +			 * After checking that our starting position is valid, we need to
> +			 * ensure that, when isa was incremented at the start of the loop,
> +			 * that it arrived at the start of the next extension.
> +			 *
> +			 * If we are already on a non-digit, there is nothing to do. Either
> +			 * we have a multi-letter extension's _, or the start of an
> +			 * extension.
> +			 *
> +			 * Otherwise we have found the current extension's major version
> +			 * number. Parse past it, and a subsequent p/minor version number
> +			 * if present. The `p` extension must not appear immediately after
> +			 * a number, so there is no fear of missing it.
> +			 *
> +			 */
> +			if (unlikely(!isalpha(*ext))) {
> +				ext_err = true;
> +				break;
> +			}
> +
> +			if (!isdigit(*isa))
> +				break;
> +
> +			while (isdigit(*++isa))
> +				;
> +
> +			if (tolower(*isa) != 'p')
> +				break;
> +
> +			if (!isdigit(*++isa)) {
> +				--isa;
> +				break;
> +			}
> +
> +			while (isdigit(*++isa))
> +				;
> +
> +			break;
> +		}
> +
> +		/*
> +		 * The parser expects that at the start of an iteration isa points to the
> +		 * first character of the next extension. As we stop parsing an extension
> +		 * on meeting a non-alphanumeric character, an extra increment is needed
> +		 * where the succeeding extension is a multi-letter prefixed with an "_".
> +		 */
> +		if (*isa == '_')
> +			++isa;
> +
> +#define SET_ISA_EXT_MAP(name, bit)						\
> +		do {								\
> +			if ((ext_end - ext == sizeof(name) - 1) &&		\
> +			     !strncasecmp(ext, name, sizeof(name) - 1) &&	\
> +			     riscv_isa_extension_check(bit))			\
> +				set_bit(bit, isainfo->isa);			\
> +		} while (false)							\
> +
> +		if (unlikely(ext_err))
> +			continue;
> +		if (!ext_long) {
> +			int nr = tolower(*ext) - 'a';
> +
> +			if (riscv_isa_extension_check(nr)) {
> +				*this_hwcap |= isa2hwcap[nr];
> +				set_bit(nr, isainfo->isa);
> +			}
> +		} else {
> +			for (int i = 0; i < riscv_isa_ext_count; i++)
> +				SET_ISA_EXT_MAP(riscv_isa_ext[i].name,
> +						riscv_isa_ext[i].id);
> +		}
> +#undef SET_ISA_EXT_MAP
> +	}
> +}
> +
> +static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
>  {
>  	struct device_node *node;
>  	const char *isa;
> -	char print_str[NUM_ALPHA_EXTS + 1];
> -	int i, j, rc;
> -	unsigned long isa2hwcap[26] = {0};
> +	int rc;
>  	struct acpi_table_header *rhct;
>  	acpi_status status;
>  	unsigned int cpu;
>  
> -	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
> -	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
> -	isa2hwcap['a' - 'a'] = COMPAT_HWCAP_ISA_A;
> -	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
> -	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
> -	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
> -	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
> -
> -	elf_hwcap = 0;
> -
> -	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
> -
>  	if (!acpi_disabled) {
>  		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
>  		if (ACPI_FAILURE(status))
> @@ -234,158 +377,7 @@ void __init riscv_fill_hwcap(void)
>  			}
>  		}
>  
> -		/*
> -		 * For all possible cpus, we have already validated in
> -		 * the boot process that they at least contain "rv" and
> -		 * whichever of "32"/"64" this kernel supports, and so this
> -		 * section can be skipped.
> -		 */
> -		isa += 4;
> -
> -		while (*isa) {
> -			const char *ext = isa++;
> -			const char *ext_end = isa;
> -			bool ext_long = false, ext_err = false;
> -
> -			switch (*ext) {
> -			case 's':
> -				/*
> -				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
> -				 * No need to set the bit in riscv_isa as 's' & 'u' are
> -				 * not valid ISA extensions. It works until multi-letter
> -				 * extension starting with "Su" appears.
> -				 */
> -				if (ext[-1] != '_' && ext[1] == 'u') {
> -					++isa;
> -					ext_err = true;
> -					break;
> -				}
> -				fallthrough;
> -			case 'S':
> -			case 'x':
> -			case 'X':
> -			case 'z':
> -			case 'Z':
> -				/*
> -				 * Before attempting to parse the extension itself, we find its end.
> -				 * As multi-letter extensions must be split from other multi-letter
> -				 * extensions with an "_", the end of a multi-letter extension will
> -				 * either be the null character or the "_" at the start of the next
> -				 * multi-letter extension.
> -				 *
> -				 * Next, as the extensions version is currently ignored, we
> -				 * eliminate that portion. This is done by parsing backwards from
> -				 * the end of the extension, removing any numbers. This may be a
> -				 * major or minor number however, so the process is repeated if a
> -				 * minor number was found.
> -				 *
> -				 * ext_end is intended to represent the first character *after* the
> -				 * name portion of an extension, but will be decremented to the last
> -				 * character itself while eliminating the extensions version number.
> -				 * A simple re-increment solves this problem.
> -				 */
> -				ext_long = true;
> -				for (; *isa && *isa != '_'; ++isa)
> -					if (unlikely(!isalnum(*isa)))
> -						ext_err = true;
> -
> -				ext_end = isa;
> -				if (unlikely(ext_err))
> -					break;
> -
> -				if (!isdigit(ext_end[-1]))
> -					break;
> -
> -				while (isdigit(*--ext_end))
> -					;
> -
> -				if (tolower(ext_end[0]) != 'p' || !isdigit(ext_end[-1])) {
> -					++ext_end;
> -					break;
> -				}
> -
> -				while (isdigit(*--ext_end))
> -					;
> -
> -				++ext_end;
> -				break;
> -			default:
> -				/*
> -				 * Things are a little easier for single-letter extensions, as they
> -				 * are parsed forwards.
> -				 *
> -				 * After checking that our starting position is valid, we need to
> -				 * ensure that, when isa was incremented at the start of the loop,
> -				 * that it arrived at the start of the next extension.
> -				 *
> -				 * If we are already on a non-digit, there is nothing to do. Either
> -				 * we have a multi-letter extension's _, or the start of an
> -				 * extension.
> -				 *
> -				 * Otherwise we have found the current extension's major version
> -				 * number. Parse past it, and a subsequent p/minor version number
> -				 * if present. The `p` extension must not appear immediately after
> -				 * a number, so there is no fear of missing it.
> -				 *
> -				 */
> -				if (unlikely(!isalpha(*ext))) {
> -					ext_err = true;
> -					break;
> -				}
> -
> -				if (!isdigit(*isa))
> -					break;
> -
> -				while (isdigit(*++isa))
> -					;
> -
> -				if (tolower(*isa) != 'p')
> -					break;
> -
> -				if (!isdigit(*++isa)) {
> -					--isa;
> -					break;
> -				}
> -
> -				while (isdigit(*++isa))
> -					;
> -
> -				break;
> -			}
> -
> -			/*
> -			 * The parser expects that at the start of an iteration isa points to the
> -			 * first character of the next extension. As we stop parsing an extension
> -			 * on meeting a non-alphanumeric character, an extra increment is needed
> -			 * where the succeeding extension is a multi-letter prefixed with an "_".
> -			 */
> -			if (*isa == '_')
> -				++isa;
> -
> -#define SET_ISA_EXT_MAP(name, bit)							\
> -			do {								\
> -				if ((ext_end - ext == sizeof(name) - 1) &&		\
> -				     !strncasecmp(ext, name, sizeof(name) - 1) &&	\
> -				     riscv_isa_extension_check(bit))			\
> -					set_bit(bit, isainfo->isa);			\
> -			} while (false)							\
> -
> -			if (unlikely(ext_err))
> -				continue;
> -			if (!ext_long) {
> -				int nr = tolower(*ext) - 'a';
> -
> -				if (riscv_isa_extension_check(nr)) {
> -					this_hwcap |= isa2hwcap[nr];
> -					set_bit(nr, isainfo->isa);
> -				}
> -			} else {
> -				for (int i = 0; i < riscv_isa_ext_count; i++)
> -					SET_ISA_EXT_MAP(riscv_isa_ext[i].name,
> -							riscv_isa_ext[i].id);
> -			}
> -#undef SET_ISA_EXT_MAP
> -		}
> +		riscv_parse_isa_string(&this_hwcap, isainfo, isa2hwcap, isa);
>  
>  		/*
>  		 * Linux requires the following extensions, so we may as well
> @@ -422,6 +414,28 @@ void __init riscv_fill_hwcap(void)
>  
>  	if (!acpi_disabled && rhct)
>  		acpi_put_table((struct acpi_table_header *)rhct);
> +}
> +
> +void __init riscv_fill_hwcap(void)
> +{
> +	struct device_node *node;
> +	const char *isa;
> +	char print_str[NUM_ALPHA_EXTS + 1];
> +	int i, j, rc;
> +	unsigned long isa2hwcap[26] = {0};
> +	struct acpi_table_header *rhct;
> +	acpi_status status;
> +	unsigned int cpu;

I see all these unused variables get removed in the next patch, but they
should get removed here, lest they trigger some warnings and bots come
after you!

> +
> +	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
> +	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
> +	isa2hwcap['a' - 'a'] = COMPAT_HWCAP_ISA_A;
> +	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
> +	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
> +	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
> +	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
> +
> +	riscv_fill_hwcap_from_isa_string(isa2hwcap);
>  
>  	/* We don't support systems with F but without D, so mask those out
>  	 * here. */
> -- 
> 2.40.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
