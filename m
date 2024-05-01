Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57441C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 19:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fw4DUfUK3cW3WgKj3wWpLWbTJxc5xqNv8F21QI4Izoo=; b=iyOgbmfssHzUoA
	FXTax3xNSybPwDQpu80OmK/IF4Rzn0Ihw48qIBusY5/umoNHLKMhPTFMm97WJQaVxiUPnEDme+ihA
	GCS9W0wWGqVvTkaCDkoJt7VoUQ/s7bsnzNduVSKutWIzuvkHXv2EhnzsY7P7VlD7wUYwxb+vgJor5
	Cn175MWvFSEPwvUFp46bWbE6GP8BRgkKCUJDPEMZAOMNIbKW/7Sbkkq2yKVDaqBsPtEc2YMgpJl5/
	utAMrDUVqjghPOeNWkPnnCsyJalWI1JHBuaylsuA6ORX2T0hEV4yho4pCckYZqdkFBKxBOwd9TfYM
	w6q91hMhgo9p3ejSJvxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2FwF-0000000AYdh-2knv;
	Wed, 01 May 2024 19:48:23 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2FwB-0000000AYcp-1Xrj
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 19:48:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e4bf0b3e06so71459435ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 12:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714592897; x=1715197697; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JtC8dm20imTdKCQqTW5smBrp6Y6uvCPu1xFL49hxPB8=;
        b=ynOGnBHawVVnMiEXlKFHKUCW0PCDtGvqD1Ef3J+MKjjBF7Sf44W+K71wHV+5zuEtgj
         cgEYh+pEO9s5T6SjaW4b0lACfn9/xeXVWR9Lp2tNL5Q1100moEbI2EiSzJtdNiR6afat
         +Kyn5TXxFWB8r5JSya9EJ90RqNmdCLQ951c2ttlsC4FHuTilUR6rdOf8++32vacgPMKM
         9fayXgLSVhiyn1ydptmiONkSBueRv7PjtfmfRKyu5tYNi9g03v+AmNVy48DPkOKYmAm0
         zeqKOYBqeFi33kxdYe0mRKB/mxImFZysOMQ8fQ7lza10zL+h5IycEFofTtMlP1E6Gzc5
         HcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714592897; x=1715197697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtC8dm20imTdKCQqTW5smBrp6Y6uvCPu1xFL49hxPB8=;
        b=LqR9XksH6ifAfugIAHtVCpPW4LtWVMQ98k6AVkIeyCJevyPmKz7wjGxCo+5rGltbEH
         SzX5VzQ/hrPTgBGzQQkD6DYxo0cNaeo7oED4fQ59XkXzgkikB3OlzmFhvyVm/Dstm/A6
         30Hb4g/DAIavkxW1XDzIAjCGd5KEBadZZ6QPOTZisT2ixe9KuEYh2aDupF3+UQNzINtd
         MOaLKKcMeeM2gfe0KKBRteGtY3Ikut6zTStwOzKldZt7yi0+aeFK6bj8LjtZjAh5qYeO
         nDB3/xYgPVYGL4BI8oTZGniur5DlPYUe1RNSRsH0v5dlKul6teVy3Il3mewCruDi2D7n
         Lvtg==
X-Forwarded-Encrypted: i=1; AJvYcCUyhWCeHiS6eMTyryUjEaGC4OAp8uB5iATMId5KgAscvxMYeHLzEbHZH1qOx4D0jpNKj4Uj3Dt6dk/zeWNCWX7YJXsapK26uK1/i5mqyLS0
X-Gm-Message-State: AOJu0Yzg9etCGeZy3yF0ZL6LWazg/deA8mdUI6UYbQAef6OR3KTrWW8/
	EDWIknBsDglIPR7DHsUH2VwldlWac2tA+SA3lcN6qSoGSXKGSm7gLfTUMFBbRRFfZ+MRqHTpJNl
	M
X-Google-Smtp-Source: AGHT+IHqE9T7lF1XvjCAtRw9iaYnvm5Bt1x7gAa4owqnGBOgOTMkA2A37jDPqx0fFTLOHQocKAXYtQ==
X-Received: by 2002:a17:902:d506:b0:1eb:2fa0:c56f with SMTP id b6-20020a170902d50600b001eb2fa0c56fmr4034243plg.35.1714592897320;
        Wed, 01 May 2024 12:48:17 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090276ca00b001dd69aca213sm24321702plt.270.2024.05.01.12.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 12:48:16 -0700 (PDT)
Date: Wed, 1 May 2024 12:48:13 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 07/16] riscv: cpufeature: Extract common elements from
 extension checking
Message-ID: <ZjKcfZsWgR1AY3AZ@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-7-b692f3c516ec@rivosinc.com>
 <20240501-probable-unfunded-746ef6ae1853@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501-probable-unfunded-746ef6ae1853@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_124819_552749_81D55BCA 
X-CRM114-Status: GOOD (  21.77  )
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

On Wed, May 01, 2024 at 12:37:14PM +0100, Conor Dooley wrote:
> On Fri, Apr 26, 2024 at 02:29:21PM -0700, Charlie Jenkins wrote:
> > The __riscv_has_extension_likely() and __riscv_has_extension_unlikely()
> > functions from the vendor_extensions.h can be used to simplify the
> > standard extension checking code as well. Migrate those functions to
> > cpufeature.h and reorganize the code in the file to use the functions.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/cpufeature.h        | 78 +++++++++++++++++-------------
> >  arch/riscv/include/asm/vendor_extensions.h | 28 -----------
> >  2 files changed, 44 insertions(+), 62 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > index fedd479ccfd1..17896ec9ec11 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -98,59 +98,66 @@ extern bool riscv_isa_fallback;
> >  
> >  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
> >  
> > +#define EXT_ALL_VENDORS		0
> 
> It's not really "all vendors", it's standard. Otherwise, this seems all

This hooks up into the alternatives:

ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)

Where the "vendor" argument is supposed to be 0 if the alternative is
applicable to all vendors. Is there a better way to convey this?

- Charlie

> grand to me,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
