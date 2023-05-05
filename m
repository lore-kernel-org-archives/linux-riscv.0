Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDEAC77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 09:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrY7y0djaZMUix3RUgZ2L9AGjd7k5T8IU6FK4DXTEVM=; b=Szj4I466u1r7x4
	0tpDwQijzG63mEX/Gacvxj9upms34byPPUNhspmLJDaO4c5JWl4VCZsH5YSg6hRqCzskNtAkaKjB4
	yKQo5GGpXcRBf8DysdPB/t+288JniX/IleWZYwcu/ITAtd4Wq1sn2qeRxw9EYuHY0A4aTjcCowaQV
	r/kOA582pBgHixmNxkhgVhe7NAg982T9XXfauTcsIv+q89FUdGWow/jUWIvOFaH6ULRNhDkHodKpK
	RFS+fwHxKSVk1Mehsy7k2+0hMsqvQp9OxLxevNML2giltFbU67TLsDyGz7LyvPnMbDiCAP17i0Pth
	wh3gchi7dSPcjD+4K5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1purUp-00A6Qp-1m;
	Fri, 05 May 2023 09:12:59 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1purUl-00A6Ov-2t
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 09:12:57 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-306f9df5269so999928f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 May 2023 02:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683277973; x=1685869973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IwcpTfd2bogL7zVPAKAMc1TR4Q6X1IDFugK6ftr4UnU=;
        b=LbdttePfZN1XFBJWzv3WmwDlkdAScBTaJStc2KtZ68+vxBXeBpPr0nkrTfOur2uQR5
         cJkfQQpzzoF7R/hGlYFXBInQ0PDX673zeIPIywo2Gb5AvfQyk5ZOxgNdqh4Jzc0uLVcn
         Dtkcog8DusaIcFpSHjdybyn5mBz2VNf8XjUeB9brL3aBCDGVSvZtWlduHsDC0nN5iKKN
         zVXR461+9rnJfMSs/0fK2S1sUlbvy5hajhArhEVxuB8LfauDXnndiBpdZbLciZP86iS0
         BXwmOIz35AWnudimZGQa+84enS55cxYdOZ3qiw7UbeMfbCLPYhmULJ6kUFqPKsqGCr1Z
         W2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683277973; x=1685869973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwcpTfd2bogL7zVPAKAMc1TR4Q6X1IDFugK6ftr4UnU=;
        b=iFDlsQw2K40zwkQsEdrituovxqPk4E8i+pGD8hvr3njMndyVED5feQyJVh2ViMQ4Yf
         hmyOerg321F3lg+gR6dEz+XcBdh9ahfhIbqESFE+i672j5pUDm8iwTUYPsccEJoUtuSu
         IeqHpk63ZgyQxZaHgyn1jnQRPnD9E2WgONaIcYnrt6379Yy6mhCqARJ/kEQQ4Ce314mx
         R2WKevKfM74ezC87ETemlBZWsr5DOiQJPtddIU5kAtqgpksKVixVAo2UhdBX1twQxM9w
         hReuS5fy21QYc3pekfSLIKHrWXC0kAdxtsGxwK0FUSgCfnB6EPQ/eo3maFo21m8OKvHN
         iR3A==
X-Gm-Message-State: AC+VfDxsl7+0aq8GhSRTj1eyVD+vCQvXeACWRibhqxB59W+V82UWpxhS
	pkRDQnOLtLo7JGpf5PI9T9eZAg==
X-Google-Smtp-Source: ACHHUZ46TfIY8eRIZt0bHJIeZ4jXbYVq+spEAvHm777CyXXMG8CVGiJm9j1di2NDiBn7fgDnT4CsuQ==
X-Received: by 2002:adf:e605:0:b0:304:6fef:f375 with SMTP id p5-20020adfe605000000b003046feff375mr876017wrm.70.1683277973382;
        Fri, 05 May 2023 02:12:53 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m2-20020a056000008200b0030630120e56sm1718960wrx.57.2023.05.05.02.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 02:12:52 -0700 (PDT)
Date: Fri, 5 May 2023 11:12:51 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v1 5/7] RISC-V: rework comments in ISA string parser
Message-ID: <20230505-7be7c3827b37730f697a1c7e@orel>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
 <20230504-never-childlike-75e2ce7e50d8@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504-never-childlike-75e2ce7e50d8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_021255_943351_8AA649F2 
X-CRM114-Status: GOOD (  38.73  )
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
Cc: Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 04, 2023 at 07:14:24PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> I have found these comments to not be at all helpful whenever I look at
> the parser. Further, the comments in the default case (single letter
> parser) are not quite right either.
> Group the comments into a larger one at the start of each case, that
> attempts to explain things at a higher level.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 71 ++++++++++++++++++++++++++++------
>  1 file changed, 60 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index a79c5c52a174..2fc72f092057 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -146,7 +146,7 @@ void __init riscv_fill_hwcap(void)
>  
>  			switch (*ext) {
>  			case 's':
> -				/**
> +				/*
>  				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
>  				 * No need to set the bit in riscv_isa as 's' & 'u' are
>  				 * not valid ISA extensions. It works until multi-letter
> @@ -163,53 +163,102 @@ void __init riscv_fill_hwcap(void)
>  			case 'X':
>  			case 'z':
>  			case 'Z':
> +				/*
> +				 * Before attempting to parse the extension itself, we find its end.
> +				 * As multi-letter extensions must be split from other multi-letter
> +				 * extensions with an "_", the end of a multi-letter extension will
> +				 * either be the null character as of_property_read_string() returns
> +				 * null-terminated strings,

The ACPI table also requires the ISA string be null-terminated. I'd maybe
drop the reference to the DT function and just state the string will be
null-terminated to avoid any ACPI concern.

> or the "_" at the start of the next
> +				 * multi-letter extension.
> +				 *
> +				 * Next, as the extensions version is currently ignored, we
> +				 * eliminate that portion. This is done by parsing backwards from
> +				 * the end of the extension, removing any numbers. This may be a
> +				 * major or minor number however, so the process is repeated if a
> +				 * minor number was found.
> +				 *
> +				 * ext_end is intended to represent the first character *after* the
> +				 * name portion of an extension, but will be decremented to the last
> +				 * character itself while eliminating the extensions version number.
> +				 * A simple re-increment solves this problem.
> +				 */
>  				ext_long = true;
> -				/* Multi-letter extension must be delimited */
>  				for (; *isa && *isa != '_'; ++isa)
>  					if (unlikely(!isalnum(*isa)))
>  						ext_err = true;
> -				/* Parse backwards */
> +
>  				ext_end = isa;
>  				if (unlikely(ext_err))
>  					break;
> +
>  				if (!isdigit(ext_end[-1]))
>  					break;
> -				/* Skip the minor version */
> +
>  				while (isdigit(*--ext_end))
>  					;
> -				if (tolower(ext_end[0]) != 'p'
> -				    || !isdigit(ext_end[-1])) {
> -					/* Advance it to offset the pre-decrement */
> +
> +				if (tolower(ext_end[0]) != 'p' || !isdigit(ext_end[-1])) {
>  					++ext_end;
>  					break;
>  				}
> -				/* Skip the major version */
> +
>  				while (isdigit(*--ext_end))
>  					;
> +
>  				++ext_end;
>  				break;
>  			default:
> +				/*
> +				 * Things are a little easier for single-letter extensions, as they
> +				 * are parsed forwards.
> +				 *
> +				 * After checking that our starting position is valid, we need to
> +				 * ensure that, when isa was incremented at the start of the loop,
> +				 * that it arrived at the start of the next extension.
> +				 *
> +				 * If we are already on a non-digit, there is nothing to do. Either
> +				 * we have a multi-letter extension's _, or the start of an
> +				 * extension.
> +				 *
> +				 * Otherwise we have found the current extension's major version
> +				 * number. Parse past it, and a subsequent p/minor version number
> +				 * if present. The `p` extension must not appear immediately after
> +				 * a number, so there is no fear of missing it.
> +				 *
> +				 */
>  				if (unlikely(!isalpha(*ext))) {
>  					ext_err = true;
>  					break;
>  				}
> -				/* Find next extension */
> +
>  				if (!isdigit(*isa))
>  					break;
> -				/* Skip the minor version */
> +
>  				while (isdigit(*++isa))
>  					;
> +
>  				if (tolower(*isa) != 'p')
>  					break;
> +
>  				if (!isdigit(*++isa)) {
>  					--isa;
>  					break;
>  				}
> -				/* Skip the major version */
> +
>  				while (isdigit(*++isa))
>  					;
> +
>  				break;
>  			}
> +
> +			/*
> +			 * The parser expects that at the start of an iteration isa points to the
> +			 * character before the start of the next extension. This will not be the
> +			 * case if we have just parsed a single-letter extension and the next
> +			 * extension is not a multi-letter extension prefixed with an "_". It is
> +			 * also not the case at the end of the string, where it will point to the
> +			 * terminating null character.
> +			 */
>  			if (*isa != '_')
>  				--isa;
>  
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
