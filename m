Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0336EE0213
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 00:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8bU8Dzhf2LMXJXfF20t448lrluVqo2Z0k0BDJBP7Q8=; b=WyEMbOK0F8EBIe
	rGKmTDSRFuiXV/5k8izUb/6o6qSOvVyeDwkvCAzcKdYYaBr30IC1ua3TvZ7eamX9K61vwccGNO65p
	IIYc/xrKdjxmgzKWnghxELFUWn6y99YUdVmImGao+e6FDa/qgEVmLS8Hbbe3Ipcer3BRcgBzHPALs
	VmgcugZ4rpu0eS1SU9PWDKFmSd3QQ0pxb5Q0UlA7UUqObjdqYYXE1IBG34J3+UxA/s81NdpgPzx43
	MPkfTUTTV0rZ2kimsnxV8BgqWPoIqB5WzyXaqrb1YoFNOynAoMEQDnIhusxOXeeBostzDdPgVrx7v
	YWBx2iI0MmHHzvPBI7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgaQJ-006x7S-0B;
	Thu, 14 Sep 2023 00:41:35 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgaQG-006x71-0H
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 00:41:34 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5657add1073so348633a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 17:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694652091; x=1695256891; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bV+/Al2CCZ37TkAw2reTJoR4Wcs9Dysg1WA/YPpvqys=;
        b=Cjl244N/MHjcXyTRPJL2EVo9VooIaEyDAvnRr8OvZYDSyYbBDb97LuRcxPBknVTpqx
         lPqiGpiPbGMsMY8R+VvI9+dznUFtixzCDgH6ztLC08kTE9i28WtnL6K+oj3eKCtZFBMm
         3ZybhPobtQcn75mRLYHxoOc43LktpGS+ppg45bJMY2wJxvcpSi2jTooFyBcnBjfM/fRL
         dFWtnLmEyBUQXoon8jobHdn9JvEvCnn+zuNCm7NZuTF7uE5HfX33agXuM8uKUEvOynqp
         HprUFbe3lHf2KGVwMV45msJYktByvuPMslalTtPpNKWsxr4VkTl8MZ/l4wd8RAA94f3d
         2CGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694652091; x=1695256891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bV+/Al2CCZ37TkAw2reTJoR4Wcs9Dysg1WA/YPpvqys=;
        b=tuZIUw5ZMkMc0X4JB+ZyzcKjiu7KOuj+g0AIfRFMC3fnJDVnpY+UAB1gNuka7a2vbS
         PiXnDdMYrUtiiucwgguOthjX5SulvbJgGjhS+J2pOglcy4PXe6i9bdEEil2LBI3l5z25
         nZdeSZYX2JUqEJ22tuZbepc25lzBzdZa/bN7VxHLlVGwgzYJgyzlKFDwt/b8Z+D5ettk
         g3rOfh5OCy3k4G79fC6JCvCXd3B1XaxoHkkTfGG350QZv4cRYd6gJAFqR29a2RGeXezG
         TtGRwVtZ+ipnTxbwdZs7kgEdVhIqAH1nal85Tj/k15a5xLyW0O6V6NkPTzycy0XBMCos
         ls5w==
X-Gm-Message-State: AOJu0YzZoC0W/YuhXLLms7L0D7UuFKY/59sgXDQezVjSoY+8F2oJOS9E
	KrN1EV0EOr5tzhg24UdvRrzvGgH5KEOMhde0PbA=
X-Google-Smtp-Source: AGHT+IHA5ONjppQrkwMzrGnhKDETyQ6oOTrOlD0PGWmam0AlEOkCTSBQUjzGtFekGZDJ+cjR5EaIrA==
X-Received: by 2002:a05:6a20:729d:b0:14d:e615:277c with SMTP id o29-20020a056a20729d00b0014de615277cmr484136pzk.11.1694652090541;
        Wed, 13 Sep 2023 17:41:30 -0700 (PDT)
Received: from ghost ([50.168.177.73])
        by smtp.gmail.com with ESMTPSA id bm1-20020a056a00320100b006900cb919b8sm150017pfb.53.2023.09.13.17.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 17:41:29 -0700 (PDT)
Date: Wed, 13 Sep 2023 20:41:26 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v4 2/5] riscv: Add checksum library
Message-ID: <ZQJWtuXDrKuc95+y@ghost>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-2-77cc2ad9e9d7@rivosinc.com>
 <1818c4114b0e4144a9df21f235984840@AcuMS.aculab.com>
 <ZQEn+8Bi8dxNgg3g@ghost>
 <b503e341f2334d6b9b902a6e621ed7c3@AcuMS.aculab.com>
 <ZQJDOj/6lUumg7WP@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQJDOj/6lUumg7WP@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_174132_364113_C1708698 
X-CRM114-Status: GOOD (  58.86  )
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

On Wed, Sep 13, 2023 at 07:18:18PM -0400, Charlie Jenkins wrote:
> On Wed, Sep 13, 2023 at 08:47:49AM +0000, David Laight wrote:
> > From: Charlie Jenkins
> > > Sent: 13 September 2023 04:10
> > > 
> > > On Tue, Sep 12, 2023 at 08:45:38AM +0000, David Laight wrote:
> > > > From: Charlie Jenkins
> > > > > Sent: 11 September 2023 23:57
> > > > >
> > > > > Provide a 32 and 64 bit version of do_csum. When compiled for 32-bit
> > > > > will load from the buffer in groups of 32 bits, and when compiled for
> > > > > 64-bit will load in groups of 64 bits. Benchmarking by proxy compiling
> > > > > csum_ipv6_magic (64-bit version) for an x86 chip as well as running
> > > > > the riscv generated code in QEMU, discovered that summing in a
> > > > > tree-like structure is about 4% faster than doing 64-bit reads.
> > > > >
> > > > ...
> > > > > +	sum   = saddr->s6_addr32[0];
> > > > > +	sum  += saddr->s6_addr32[1];
> > > > > +	sum1  = saddr->s6_addr32[2];
> > > > > +	sum1 += saddr->s6_addr32[3];
> > > > > +
> > > > > +	sum2  = daddr->s6_addr32[0];
> > > > > +	sum2 += daddr->s6_addr32[1];
> > > > > +	sum3  = daddr->s6_addr32[2];
> > > > > +	sum3 += daddr->s6_addr32[3];
> > > > > +
> > > > > +	sum4  = csum;
> > > > > +	sum4 += ulen;
> > > > > +	sum4 += uproto;
> > > > > +
> > > > > +	sum  += sum1;
> > > > > +	sum2 += sum3;
> > > > > +
> > > > > +	sum += sum2;
> > > > > +	sum += sum4;
> > > >
> > > > Have you got gcc to compile that as-is?
> > > >
> > > > Whenever I've tried to get a 'tree add' compiled so that the
> > > > early adds can be executed in parallel gcc always pessimises
> > > > it to a linear sequence of adds.
> > > >
> > > > But I agree that adding 32bit values to a 64bit register
> > > > may be no slower than trying to do an 'add carry' sequence
> > > > that is guaranteed to only do one add/clock.
> > > > (And on Intel cpu from core-2 until IIRC Haswell adc took 2 clocks!)
> > > >
> > > > IIRC RISCV doesn't have a carry flag, so the adc sequence
> > > > is hard - probably takes two extra instructions per value.
> > > > Although with parallel execute it may not matter.
> > > > Consider:
> > > > 	val = buf[offset];
> > > > 	sum += val;
> > > > 	carry += sum < val;
> > > > 	val = buf[offset1];
> > > > 	sum += val;
> > > > 	...
> > > > the compare and 'carry +=' can be executed at the same time
> > > > as the following two instructions.
> > > > You do then a final sum += carry; sum += sum < carry;
> > > >
> > > > Assuming all instructions are 1 clock and any read delays
> > > > get filled with other instructions (by source or hardware
> > > > instruction re-ordering) even without parallel execute
> > > > that is 4 clocks for 64 bits, which is much the same as the
> > > > 2 clocks for 32 bits.
> > > >
> > > > Remember that all the 32bit values can summed first as
> > > > they won't overflow.
> > > >
> > > > 	David
> > 
> > > Yeah it does seem like the tree-add does just do a linear add. All three
> > > of them were pretty much the same on riscv so I used the version that
> > > did best on x86 with the knowledge that my QEMU setup does not
> > > accurately represent real hardware.
> > 
> > The problem there is that any measurement on x86 has pretty much
> > no relevance to what any RISCV cpu might do.
> > The multiple execution units and out of order execution on x86
> > are far different from anything any RISCV cpu is likely to have
> > for many years.
> > You might get nearer running on one of the Atom cpu - but it won't
> > really match.
> > There are too many fundamental differences between the architectures.
> > 
> > All you can do is to find and read the instruction timings for
> > a target physical cpu and look for things like:
> > - Whether arithmetic results are available next clock.
> >   (It probably is)
> > - How many clocks it takes for read data to be available.
> >   I suspect the cpu will stall if the data is needed.
> >   A block of sequential reads is one way to avoid the stall.
> >   On x86 the instruction that needs the data is just deferred
> >   until it is available, the following instructions execute
> >   (provided their input are all available).
> > - Clock delays for taken/not taken predicted/not predicted branches.
> >   
> > > I don't quite understand how doing the carry in the middle of each
> > > stage, even though it can be executed at the same time, would be faster
> > > than just doing a single overflow check at the end.
> > 
> > You need to do half as many reads and adds.
> > 
> I missed that you were talking about 64-bit reads. I was talking to
> somebody about this a couple weeks ago and they mentioned a counter
> example that showed that adding the carry after was not the same as
> adding it in the middle. Even though addition is commutative, I wasn't
> sure if the overflow checking was. I can't rememeber what the counter
> example was, but I have a feeling it was flawed.

Sorry to double respond to this. It seems like it is the same. However
it seems like it is still slower. After cleaning up my benchmarking more,
it seems like the best way to go is to use the 32-bit adds and
accumulate the overflow in the upper 32 bits.

> > > I can just revert
> > > back to the non-tree add version since there is no improvement on riscv.
> > 
> > The 'tree' version is only likely to be faster on cpu (like x86)
> > that can (at least sometimes) do two memory reads in one clock
> > and can do two adds and two read in the same clock.
> > Even then, without out of order execution, it is hard to get right.
> > 
> > Oh, you might want to try getting the default csum_fold() to
> > be the faster 'arc' version rather than adding your own version.
I do like this idea. I can extract out the changes into the default
version.

- Charlie
> > 
> > 	David
> > 
> > > I can also revert back to the default version that uses carry += sum < val
> > > as well.
> > > 
> > > - Charlie
> > 
> > -
> > Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> > Registration No: 1397386 (Wales)
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
