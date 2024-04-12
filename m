Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00086C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 16:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aolBRhqGq2zyf3xI/WjkfE1iARwrzawtlobqtsnxNWo=; b=CMoh2AOav9qftR
	q0D7LRhF5qIHwd31qWWaM3H6gDBe8TyxJwj73qAG7KaO132EpVjpOs9MMaNPNTqJZ/RiuxxPpQAk/
	sjeOEWuOnFma4sT+qjaz3ywofneQeHl1oN3oQQ6bI4uxwHRctNXXClwfhhep1CMvxYFvHGIT+6sT1
	8q9NnWi3Kkc3AIXgzJ1o4x6a1SXZ/S2fVwjKLxSvITI0mNF1rZQQkbcx4bnTCJv7N8ZgW+mzBYATO
	jQAN6ghmlS3FuytRQiGRXoBAN/iIEPg10qBSEkr/48Q7Wbf4z6YP9h8mCpJTW/pCxLyw/RqRnFGPX
	l/W/76Q5IgrCO84j6IdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKEA-00000000ZLu-0s6M;
	Fri, 12 Apr 2024 16:58:14 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKE6-00000000ZKS-24zN
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 16:58:12 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ed0e9ccca1so1080992b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 09:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712941088; x=1713545888; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FJWVQnWLX/pkislYxbbN5qnILpyF7P63m18zWA+EsbY=;
        b=JE6jeG/oa9WxGl4EUpneHJuKGZuleuVb8gWA6OfTMMDsdHrQ+rJpCvm0JwUVeMCNTF
         bzwXwbF+aMu+gQfeKxajrHqIgQzQTpCPgGUs8LZNXZel3ONgoBvDennYNvkD6pOEbrlG
         ne1khTsbg10chs40m0pen4dZ+d8aB3qCtgmyAZP2LuX27sLXz1iG6EuhqOomI2tEWfpd
         776VhuNdwKofpRjCOm1RcLlO37RYroFPaQWkK0PxvdBb6+LeXXWaC0r585wjXGpZAwsa
         KILq4nnF55EXS/jLMZ08qsmb5vx4Qc+Jry37tZA2bn6Xok9I+vEdZ1ZbLLJb6x8hthLE
         wo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712941088; x=1713545888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJWVQnWLX/pkislYxbbN5qnILpyF7P63m18zWA+EsbY=;
        b=Tj5K4okxp84DqTfiIWJ8x1sK1jpXHVyqkwHvplFa7IfCRshzJEV18ozDi4bo0O8i+2
         g+vP4XoLk7Cs01bNKB6p+2+rJblUPdWfDyQ9DZ/nKItYQDxIAQGRIpQx4s2x0IL8n4vQ
         PLVoCEuJfjb8KFmfInSObATM0iZMWYa0uQxzEa1L8cqgvfKJO4/lUnmBrussddpv294P
         /zcrxZMy80dhPvL0nsfbmkKcx5uf7xg/SLL6rFmCOCPDtbzI/tsfbOKlCoVWizV7dUFB
         GbMJcCd1KZGRd6E6oLQOUQhAqA23mrhYV8Xi1GFs2gzFe4v0u4kov6tSN0ghfmIuqXFb
         Slzw==
X-Forwarded-Encrypted: i=1; AJvYcCXrJv7IgZuGuE37caD6q52ire0DPxKsCU6KREuJUni74rtacTEPJmPy+Jx/8vH89r0PdT9Oy5GFwUmMOi3RJDezFhYCoyfPd8Zg4fAE6BVA
X-Gm-Message-State: AOJu0Yz45BYIdBcAMjoeFCmTehHQRKv2xU5caqAAQfCdqanYWhsXLfIh
	i9iETcO9tzq9h5bOq1XCV4wzzeHHwzdMrKbuaVmrcanVqYTOzlLN6rQ7H58AJUk=
X-Google-Smtp-Source: AGHT+IGPCmN3W2HTZ0QmJ+6REUIlwbvOotgDE2tr5rxL5ipmW/2VnsTgQx/xnNwczxd72R2Uusa6Og==
X-Received: by 2002:a05:6a20:5648:b0:1a7:4b6f:7934 with SMTP id is8-20020a056a20564800b001a74b6f7934mr3088514pzc.17.1712941088421;
        Fri, 12 Apr 2024 09:58:08 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:121b:da6b:94f1:304])
        by smtp.gmail.com with ESMTPSA id a26-20020aa7865a000000b006ea8ba9902asm3085131pfo.28.2024.04.12.09.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 09:58:07 -0700 (PDT)
Date: Fri, 12 Apr 2024 09:58:04 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 06/19] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <ZhloHGxa5jRRR9xg@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-6-4af9815ec746@rivosinc.com>
 <20240412-sprawl-product-1e1d02e25bca@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412-sprawl-product-1e1d02e25bca@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_095810_841158_BBA168D2 
X-CRM114-Status: GOOD (  26.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Apr 12, 2024 at 01:30:08PM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:12PM -0700, Charlie Jenkins wrote:
> >  static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct riscv_isainfo *isainfo,
> 
> > -					  unsigned long *isa2hwcap, const char *isa)
> > +					struct riscv_isainfo *isavendorinfo, unsigned long vendorid,
> > +					unsigned long *isa2hwcap, const char *isa)
> >  {
> >  	/*
> >  	 * For all possible cpus, we have already validated in
> > @@ -349,8 +384,30 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
> >  		const char *ext = isa++;
> >  		const char *ext_end = isa;
> >  		bool ext_long = false, ext_err = false;
> > +		struct riscv_isainfo *selected_isainfo = isainfo;
> > +		const struct riscv_isa_ext_data *selected_riscv_isa_ext = riscv_isa_ext;
> > +		size_t selected_riscv_isa_ext_count = riscv_isa_ext_count;
> > +		unsigned int id_offset = 0;
> >  
> >  		switch (*ext) {
> > +		case 'x':
> > +		case 'X':
> 
> One quick remark is that we should not go and support this stuff via
> riscv,isa in my opinion, only allowing it for the riscv,isa-extensions
> parsing. We don't have a way to define meanings for vendor extensions in
> this way. ACPI also uses this codepath and at the moment the kernel's
> docs say we're gonna follow isa string parsing rules in a specific version
> of the ISA manual. While that manual provides a format for the string and
> meanings for standard extensions, there's nothing in there that allows us
> to get consistent meanings for specific vendor extensions, so I think we
> should avoid intentionally supporting this here.

Getting a "consistent meaning" is managed by a vendor. If a vendor
supports a vendor extension and puts it in their DT/ACPI table it's up
to them to ensure that it works. How does riscv,isa-extensions allow for
a consistent meaning?

> 
> I'd probably go as far as to actively skip vendor extensions in
> riscv_parse_isa_string() to avoid any potential issues.
> 
> > +			bool found;
> > +
> > +			found = get_isa_vendor_ext(vendorid,
> > +						   &selected_riscv_isa_ext,
> > +						   &selected_riscv_isa_ext_count);
> > +			selected_isainfo = isavendorinfo;
> > +			id_offset = RISCV_ISA_VENDOR_EXT_BASE;
> > +			if (!found) {
> > +				pr_warn("No associated vendor extensions with vendor id: %lx\n",
> > +					vendorid);
> 
> This should not be a warning, anything we don't understand should be
> silently ignored to avoid spamming just because the kernel has not grown
> support for it yet.

Sounds good.

- Charlie

> 
> Thanks,
> Conor.
> 
> > +				for (; *isa && *isa != '_'; ++isa)
> > +					;
> > +				ext_err = true;
> > +				break;
> > +			}
> > +			fallthrough;
> >  		case 's':
> >  			/*
> >  			 * Workaround for invalid single-letter 's' & 'u' (QEMU).
> > @@ -366,8 +423,6 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
> >  			}
> >  			fallthrough;
> >  		case 'S':
> > -		case 'x':
> > -		case 'X':
> >  		case 'z':
> >  		case 'Z':
> >  			/*
> > @@ -476,8 +531,10 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
> >  				set_bit(nr, isainfo->isa);
> >  			}
> >  		} else {
> > -			for (int i = 0; i < riscv_isa_ext_count; i++)
> > -				match_isa_ext(&riscv_isa_ext[i], ext, ext_end, isainfo);
> > +			for (int i = 0; i < selected_riscv_isa_ext_count; i++)
> > +				match_isa_ext(&selected_riscv_isa_ext[i], ext,
> > +					      ext_end, selected_isainfo,
> > +					      id_offset);
> >  		}
> >  	}
> >  }



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
