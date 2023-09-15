Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F98EED60B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMW6AooUrtmtaa3kN589gAiFpAMFWJn8jv3/vUrRByQ=; b=c7+33msGBMLY0F
	vNGipoeJWoVS8K6lQXRj/+M4d9agg2qTdCcjhNsZkiIFHb0BIpjoqW4liXRz1UNldpxVkKb3EEji5
	jr0UzsbaiBP0A2AmtvTckqwHqu+JPJH6ACoLQNDC7JNOXuQZp8I5wpkscl7cBajJ8viABdEj3U3XH
	s9kG2rxTKHXLmTgkHMZ/k8xSyX60+bjX6MLUcwfC38E+ynT7I2TTtimTTwCu3rvyzyChdyU0oRxlT
	ZwdZ92EnzM6vslAdZvKS5NZMblAK+caLEe+qnSqTJkTLuGbQe0PVlxe3BQGsMqnE44G1PAUVLTDNq
	vzzOXaYVI+2l9Tn49pvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhB0a-00B0iK-0B;
	Fri, 15 Sep 2023 15:45:28 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhB0X-00B0hy-1e
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 15:45:26 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c4194f7635so12443775ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 08:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694792722; x=1695397522; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Th8NoXT19fs06IrPnES4vcAsMrYG/0js4/EA9rEsqpw=;
        b=YAUpJmKUPJBcxvSUMam52lWNbpnI3qR8/LHaOHitsTCHwVY+KbpWeC6AFomerQGlNB
         dQoYRcvDXcWtFSO8FNbC9Ni9Gc8Yix2AQC4Lc35C75R3D/uuBiaPSPq7U0lGJAfJNQ+L
         bBPeepJ0WvBmFXf23sKC0LD63x16gdOQnFDj+lU80lRB/DWq43Do7x0hR1ohyqWf31/d
         gkUPBnolSjmvOE4BAfHB93oSx+j31kATqcZPnFNI1kzd5UKw4BYBIGCIZTHb+diA5bCy
         O/bkdVagqT1XMhbJo+6wTN7BblGnDM0iro+eBkvS40voI12GTLOIb9UytwuM0Pzt/Pn0
         Ov1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694792722; x=1695397522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Th8NoXT19fs06IrPnES4vcAsMrYG/0js4/EA9rEsqpw=;
        b=AZY+M9jVM/fEiH2JQ7nJ1I3PQ0K4httyx+qosAytjvO3rlQL5E91cuPIBSueEpMA8R
         hbT2i3LAak6hT0+vNljt9wfUBGATKouPlMK1a523FxXuu5XV0JULv533FcHp3LcrE0RD
         d4qFJ9DJThfpKYuloLL6WaKWQqT+yVOEWMwTd/gDCCSRI3o6m5UDDhGFgzts4oakUF+8
         rYOJEUDopcFY3N6L5NQh2kJtRwlBxxgvoTcZ1rCcA5MND7kA9qkGQZuLUOkMc+ETXwfZ
         vQVff9Y6yXFlMnsMezyAn00PM8FAHh0k74VlrjBK3w1FhS24ZyajuJKxUkgUlSGH7/l1
         yc0A==
X-Gm-Message-State: AOJu0YxBt0RVQznfNXIpAgzNiipexXVhBlOgmbjJHuU3bXtGUC566Xc8
	DWQGLG14jRhNGkWWrvcaSBj/Dg==
X-Google-Smtp-Source: AGHT+IFzz6+B5OKe9dHaMHtROHjdT+of6Br718R8Aq13I6lpQoCwBt1c/60xCps1YzrgztPc4tY0Ig==
X-Received: by 2002:a17:902:ea0b:b0:1c3:9928:7b28 with SMTP id s11-20020a170902ea0b00b001c399287b28mr7149415plg.6.1694792722551;
        Fri, 15 Sep 2023 08:45:22 -0700 (PDT)
Received: from ghost ([50.168.177.76])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902b28600b001b672af624esm3640532plr.164.2023.09.15.08.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:45:22 -0700 (PDT)
Date: Fri, 15 Sep 2023 11:45:19 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v5 1/4] asm-generic: Improve csum_fold
Message-ID: <ZQR8DyY2wlHE1QHZ@ghost>
References: <20230914-optimize_checksum-v5-0-c95b82a2757e@rivosinc.com>
 <20230914-optimize_checksum-v5-1-c95b82a2757e@rivosinc.com>
 <b6bd38541255470b97bbaf3e6cdb4265@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6bd38541255470b97bbaf3e6cdb4265@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_084525_568199_DD3C5E63 
X-CRM114-Status: GOOD (  26.37  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 15, 2023 at 07:29:23AM +0000, David Laight wrote:
> From: Charlie Jenkins
> > Sent: 15 September 2023 04:50
> > 
> > This csum_fold implementation introduced into arch/arc by Vineet Gupta
> > is better than the default implementation on at least arc, x86, arm, and
> > riscv. Using GCC trunk and compiling non-inlined version, this
> > implementation has 41.6667%, 25%, 16.6667% fewer instructions on
> > riscv64, x86-64, and arm64 respectively with -O3 optimization.
> 
> Nit-picking the commit message...
> Some of those architectures have their own asm implementation.
> The arm one is better than the C code below, the x86 ones aren't.
I can clean up the commit message to be more accurate.
> 
> I think that only sparc32 (carry flag but no rotate) and
> arm/arm64 (barrel shifter on every instruction) have versions
> that are better than the one here.
> 
> Since I suggested it to Charlie:
> 
> Reviewed-by: David Laight <david.laight@aculab.com>
> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  include/asm-generic/checksum.h | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/include/asm-generic/checksum.h b/include/asm-generic/checksum.h
> > index 43e18db89c14..adab9ac4312c 100644
> > --- a/include/asm-generic/checksum.h
> > +++ b/include/asm-generic/checksum.h
> > @@ -30,10 +30,7 @@ extern __sum16 ip_fast_csum(const void *iph, unsigned int ihl);
> >   */
> >  static inline __sum16 csum_fold(__wsum csum)
> >  {
> > -	u32 sum = (__force u32)csum;
> 
> You'll need to re-instate that line to stop sparse complaining.

I will add that back, thanks.

- Charlie
> 
> > -	sum = (sum & 0xffff) + (sum >> 16);
> > -	sum = (sum & 0xffff) + (sum >> 16);
> > -	return (__force __sum16)~sum;
> > +	return (__force __sum16)((~csum - ror32(csum, 16)) >> 16);
> >  }
> >  #endif
> > 
> > 
> > --
> > 2.42.0
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
