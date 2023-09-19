Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF11CD342E
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 02:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PrNNfpgN0lnOBxQoSyhs6olnbOJKsr1mBHnf4472G44=; b=s8U8Y/6FG6rRMc
	ly03eMv4m3jISP9OWZFe2YE/k5hvuU8TidfW5LIMT/U4Ma8wAoIyvRQf2kzEFKwo0szDbfwbte4HB
	m2hD77kNBvgD0uMvGZ9ykwWlUovD0aPI393vmQikJd2vVbDhqEb0qcTCjU3B8olDI3gPJr3t9F2iQ
	ybzYpF0Rf48eiM158l2cv/clrPc/505bG5NFoLHkv9Fzst+K3pOPGPuYyH5ixeMSO54mP1jUSoovD
	bqK1Jm270YPpIJ8I++hMmmXymHuXtvAKaTddTuexSOV7i6zqG39WHFuVZ/D9AUh29ygsWVSa3RIRg
	XTcxdNK/FcQ/6NZWSqCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiQwV-00Gl7s-0I;
	Tue, 19 Sep 2023 02:58:27 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiQwS-00Gl7M-0K
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 02:58:26 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5780040cb81so3992748a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 19:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695092302; x=1695697102; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ORUv82vqRYOMSTI3MAI/v8wlx+Ql9aKnbQUGVaGlaPk=;
        b=01s5DeSrbmMt9jDjX4NevUJNzhlHAIbRoNTcsp3OEHRad+mjBxJ1rJ86tAC/rbK87r
         C0jCluydZKTUqE/zyUhRGLUKxLeDXDaL0A7HN9SDATQo2Ijd5wdKSGjpYlsXhQ+4/Gqg
         +NJndw8sagWvWTuTQ11GyTunYLayZnDBx+WG4Z/oWW8ZkcwvK09xs9ygDIDySdTloIJZ
         ++FThJuLchHSytohWkLBZR+DCIHdegVcY8n9/Sd+9RbmLrLyB7rcpgJoEpmCEVqyfjg3
         bEssb1X5soNU1xRVkGb7P4R4IzziQ4gGfdwMIj8R+HpkPwvesQG/+GMDVClblQI0y6Hg
         yRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695092302; x=1695697102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORUv82vqRYOMSTI3MAI/v8wlx+Ql9aKnbQUGVaGlaPk=;
        b=jiomwiI/mG0TVxr4XWBAKxdOfePtmVZHZtcmGTBFZzWoLHnA+BuJPkdQCPW7CPuDWR
         LA3rnMJHPO+DgG3Y0I1W/Zwmt18Nx6K3BhVE/Mro8Pd7ydzsAXeSglaxhgm9xU1qcv4i
         mLirop5PUJDezw2K9ENdWLV6v4EQk1esllfbqqeZN679hac86QaIHrTW1sMlM/+P/nXn
         j11835LwLc2rpQjUtqv7nISkz897ZgB4bOREK6HLPJKS8jlStNA+GLdVlR0SRJhioOzc
         CoNWEZwGcG1PPUwVs9Lk5CCUR5KtTfsWKEgUK9qkjrw88P4D149p8r0AN69kc8d5I7Nd
         0O8Q==
X-Gm-Message-State: AOJu0Yzlv1sN5Hr5i1eJq/00Z/lmhND3nMRkQXWKjaBZ110OBky89ZXV
	Z3e7CWhUetTwRXVu8gTQpn3N0Q==
X-Google-Smtp-Source: AGHT+IGvzqt10mRcT1dFlERUb3xtizvXDaC+nue1KjE5CKUtvggbx55iRB0WQs7JDN+aUlchqMqXaQ==
X-Received: by 2002:a17:902:eb46:b0:1c5:76b6:d94f with SMTP id i6-20020a170902eb4600b001c576b6d94fmr4069811pli.31.1695092302279;
        Mon, 18 Sep 2023 19:58:22 -0700 (PDT)
Received: from ghost ([50.168.177.76])
        by smtp.gmail.com with ESMTPSA id jj6-20020a170903048600b001b8c6662094sm5038719plb.188.2023.09.18.19.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 19:58:21 -0700 (PDT)
Date: Mon, 18 Sep 2023 22:58:17 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v6 3/4] riscv: Add checksum library
Message-ID: <ZQkOSf1b66lHzjaf@ghost>
References: <20230915-optimize_checksum-v6-0-14a6cf61c618@rivosinc.com>
 <20230915-optimize_checksum-v6-3-14a6cf61c618@rivosinc.com>
 <0357e092c05043fba13eccad77ba799f@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0357e092c05043fba13eccad77ba799f@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_195824_340361_5269A11D 
X-CRM114-Status: GOOD (  33.62  )
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Sep 16, 2023 at 09:32:40AM +0000, David Laight wrote:
> From: Charlie Jenkins
> > Sent: 15 September 2023 18:01
> > 
> > Provide a 32 and 64 bit version of do_csum. When compiled for 32-bit
> > will load from the buffer in groups of 32 bits, and when compiled for
> > 64-bit will load in groups of 64 bits.
> > 
> ...
> > +	/*
> > +	 * Do 32-bit reads on RV32 and 64-bit reads otherwise. This should be
> > +	 * faster than doing 32-bit reads on architectures that support larger
> > +	 * reads.
> > +	 */
> > +	while (len > 0) {
> > +		csum += data;
> > +		csum += csum < data;
> > +		len -= sizeof(unsigned long);
> > +		ptr += 1;
> > +		data = *ptr;
> > +	}
> 
> I think you'd be better adding the 'carry' bits in a separate
> variable.
> It reduces the register dependency chain length in the loop.
> (Helps if the cpu can execute two instructions in one clock.)
> 
> The masked misaligned data values are max 24 bits
> (if 
> 
> You'll also almost certainly remove at least one instruction
> from the loop by comparing against the end address rather than
> changing 'len'.
> 
> So ending up with (something like):
> 	end = buff + length;
> 	...
> 	while (++ptr < end) {
> 		csum += data;
> 		carry += csum < data;
> 		data = ptr[-1];
> 	}
> (Although a do-while loop tends to generate better code
> and gcc will pretty much always make that transformation.)
> 
> I think that is 4 instructions per word (load, add, cmp+set, add).
> In principle they could be completely pipelined and all
> execute (for different loop iterations) in the same clock.
> (But that is pretty unlikely to happen - even x86 isn't that good.)
> But taking two clocks is quite plausible.
> Plus 2 instructions per loop (inc, cmp+jmp).
> They might execute in parallel, but unrolling once
> may be required.
> 
It looks like GCC actually ends up generating 7 total instructions:
ffffffff808d2acc:	97b6                	add	a5,a5,a3
ffffffff808d2ace:	00d7b533          	sltu	a0,a5,a3
ffffffff808d2ad2:	0721                	add	a4,a4,8
ffffffff808d2ad4:	86be                	mv	a3,a5
ffffffff808d2ad6:	962a                	add	a2,a2,a0
ffffffff808d2ad8:	ff873783          	ld	a5,-8(a4)
ffffffff808d2adc:	feb768e3          	bltu	a4,a1,ffffffff808d2acc <do_csum+0x34>

This mv instruction could be avoided if the registers were shuffled
around, but perhaps this way reduces some dependency chains.
> ...
> > +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> > +	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
> ...
> > +		}
> > +end:
> > +		return csum >> 16;
> > +	}
> 
> Is it really worth doing all that to save (I think) 4 instructions?
> (shift, shift, or with rotate twice).
> There is much more to be gained by careful inspection
> of the loop (even leaving it in C).
> 

The main benefit was from using rev8 to replace swab32. However, now
that I am looking at the assembly in the kernel it is not outputting the
asm that matches what I have from an out of kernel test case, so rev8
might not be beneficial. I am going to have to look at this more to
figure out what is happening.

> > +
> > +#ifndef CONFIG_32BIT
> > +	csum += (csum >> 32) | (csum << 32);
> > +	csum >>= 32;
> > +#endif
> > +	csum = (unsigned int)csum + (((unsigned int)csum >> 16) | ((unsigned int)csum << 16));
> 
> Use ror64() and ror32().
> 
> 	David
> 

Good idea.

- Charlie

> > +	if (offset & 1)
> > +		return (unsigned short)swab32(csum);
> > +	return csum >> 16;
> > +}
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
