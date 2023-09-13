Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96441EE0211
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 23:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSq4gfCJ2SOEzc1CxIFKErjomyCWo9Qnhs4RxWqvO2c=; b=NBTAVmysZBYS8w
	UnQ568ppq5rX7ayZVsVqyrpePUIVbruKk39by+HWkWLeTkRNa5nxD1j8699falP8u1KGolPHzgKeo
	N524ghlNzzdsEyPxi/KrH8wzbPlSSBjupW7pIRfLXZZVTAkddNaAb1pjFxb508R6XakNbp/JnjQMC
	PuQuk378gHv9gK/KkLx29SNW2iwy/Ze26xmaUyJ9aWwVarIDr9U71vLIDPEZx0PmXbWJpt3ZWDZBf
	fQDQrzOfsPXlTd9DseRISkjrEB2iGWqVIRfXEc7NvZnFpU3v4DVNiWiKzokTqcw6kuQFc5STgShjw
	skqIOuta6Y/r/7vrYjsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgZ7r-006sL2-2b;
	Wed, 13 Sep 2023 23:18:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgZ7n-006sKG-24
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 23:18:25 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-68a3ced3ec6so281707b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 16:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694647102; x=1695251902; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xJc42z8P6nDzPilZwKRjToDvpsRhMtSMczHRpoRzj48=;
        b=Ar1ufr35EhOk5YrJyBQ8vTj7NPAse1UBMUu6UYVw0iy2oNaQofe7UuaI4LfUXUMbNj
         0ZalENMCDHsDmZp0Qv4SYC5R1L2JwmqJMD3NxUopJWpo1qB3yagt1FrsaoVoMzHwYkSd
         3gzkMqiDm2U5nA/hn3lROhOppZrAdxW1hyBJb4+3bvMhv5+N/M6ZtUR3irI+uK64UjDo
         iV6NG4mKS1a7db0SQhSrWeGoHOz9Oq/mBQYJrr2wiHOqOeU8CFiKXEzlUUW1CeWe/lm2
         +TschP61gn9EHwa/AyRw8kZImCT25/BERMQcFmDpe/4BH0m1/tqLXBhj/beVkimcPEon
         2/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694647102; x=1695251902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJc42z8P6nDzPilZwKRjToDvpsRhMtSMczHRpoRzj48=;
        b=FKDu0E0/Ni/vGp9EoCjOi4Achcz2sW2aqPzzkTbEx0HlUYxuGsSX1KQrsTYYt3/1D8
         OzrIxJvkhg6yHdJPc0Hv+/KnCqd9Jeuw95bp7IpMPiMw+g5BYTvArW4h8h+tEFCqPCHy
         JEWb3XSfgKojNeJQZI2q3ba/H+spJA4JdddetWs3RVedImuTo20TLckVNCDv5eHFnXiT
         HquG16Dv0giceXmnZiV8enU7G/pFnAA1xLVuDEAwWU2tvszd4HnJdXgux82T2HlZo5d0
         c2/ZveKFQjdcK90WepahR95ZU1nYUQ7X1r5qwXeM6xX9PE0Lc7lHHPUCuSwqzBVFEgrO
         /W9Q==
X-Gm-Message-State: AOJu0Yw0iOjdhjbbQ8DIK5QKtpoRuIojM7kiNdhsbiK9YJvvgUOoZU03
	oRYVr7g0dv7epmQGZfhXhHZ04w==
X-Google-Smtp-Source: AGHT+IE4DGy87y+n2xFtGQCzV+yeP59IPRKOAVAY/oRuATv4grqW3U7iJJ0ORADF01Dj7WzbJFc6qg==
X-Received: by 2002:a05:6a00:24d4:b0:68e:2fcd:f4de with SMTP id d20-20020a056a0024d400b0068e2fcdf4demr4462782pfv.20.1694647102487;
        Wed, 13 Sep 2023 16:18:22 -0700 (PDT)
Received: from ghost ([50.168.177.73])
        by smtp.gmail.com with ESMTPSA id z23-20020aa785d7000000b0068fbad48817sm94255pfn.123.2023.09.13.16.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 16:18:21 -0700 (PDT)
Date: Wed, 13 Sep 2023 19:18:18 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v4 2/5] riscv: Add checksum library
Message-ID: <ZQJDOj/6lUumg7WP@ghost>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-2-77cc2ad9e9d7@rivosinc.com>
 <1818c4114b0e4144a9df21f235984840@AcuMS.aculab.com>
 <ZQEn+8Bi8dxNgg3g@ghost>
 <b503e341f2334d6b9b902a6e621ed7c3@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b503e341f2334d6b9b902a6e621ed7c3@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_161823_911508_B9CC3A40 
X-CRM114-Status: GOOD (  53.56  )
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

On Wed, Sep 13, 2023 at 08:47:49AM +0000, David Laight wrote:
> From: Charlie Jenkins
> > Sent: 13 September 2023 04:10
> > 
> > On Tue, Sep 12, 2023 at 08:45:38AM +0000, David Laight wrote:
> > > From: Charlie Jenkins
> > > > Sent: 11 September 2023 23:57
> > > >
> > > > Provide a 32 and 64 bit version of do_csum. When compiled for 32-bit
> > > > will load from the buffer in groups of 32 bits, and when compiled for
> > > > 64-bit will load in groups of 64 bits. Benchmarking by proxy compiling
> > > > csum_ipv6_magic (64-bit version) for an x86 chip as well as running
> > > > the riscv generated code in QEMU, discovered that summing in a
> > > > tree-like structure is about 4% faster than doing 64-bit reads.
> > > >
> > > ...
> > > > +	sum   = saddr->s6_addr32[0];
> > > > +	sum  += saddr->s6_addr32[1];
> > > > +	sum1  = saddr->s6_addr32[2];
> > > > +	sum1 += saddr->s6_addr32[3];
> > > > +
> > > > +	sum2  = daddr->s6_addr32[0];
> > > > +	sum2 += daddr->s6_addr32[1];
> > > > +	sum3  = daddr->s6_addr32[2];
> > > > +	sum3 += daddr->s6_addr32[3];
> > > > +
> > > > +	sum4  = csum;
> > > > +	sum4 += ulen;
> > > > +	sum4 += uproto;
> > > > +
> > > > +	sum  += sum1;
> > > > +	sum2 += sum3;
> > > > +
> > > > +	sum += sum2;
> > > > +	sum += sum4;
> > >
> > > Have you got gcc to compile that as-is?
> > >
> > > Whenever I've tried to get a 'tree add' compiled so that the
> > > early adds can be executed in parallel gcc always pessimises
> > > it to a linear sequence of adds.
> > >
> > > But I agree that adding 32bit values to a 64bit register
> > > may be no slower than trying to do an 'add carry' sequence
> > > that is guaranteed to only do one add/clock.
> > > (And on Intel cpu from core-2 until IIRC Haswell adc took 2 clocks!)
> > >
> > > IIRC RISCV doesn't have a carry flag, so the adc sequence
> > > is hard - probably takes two extra instructions per value.
> > > Although with parallel execute it may not matter.
> > > Consider:
> > > 	val = buf[offset];
> > > 	sum += val;
> > > 	carry += sum < val;
> > > 	val = buf[offset1];
> > > 	sum += val;
> > > 	...
> > > the compare and 'carry +=' can be executed at the same time
> > > as the following two instructions.
> > > You do then a final sum += carry; sum += sum < carry;
> > >
> > > Assuming all instructions are 1 clock and any read delays
> > > get filled with other instructions (by source or hardware
> > > instruction re-ordering) even without parallel execute
> > > that is 4 clocks for 64 bits, which is much the same as the
> > > 2 clocks for 32 bits.
> > >
> > > Remember that all the 32bit values can summed first as
> > > they won't overflow.
> > >
> > > 	David
> 
> > Yeah it does seem like the tree-add does just do a linear add. All three
> > of them were pretty much the same on riscv so I used the version that
> > did best on x86 with the knowledge that my QEMU setup does not
> > accurately represent real hardware.
> 
> The problem there is that any measurement on x86 has pretty much
> no relevance to what any RISCV cpu might do.
> The multiple execution units and out of order execution on x86
> are far different from anything any RISCV cpu is likely to have
> for many years.
> You might get nearer running on one of the Atom cpu - but it won't
> really match.
> There are too many fundamental differences between the architectures.
> 
> All you can do is to find and read the instruction timings for
> a target physical cpu and look for things like:
> - Whether arithmetic results are available next clock.
>   (It probably is)
> - How many clocks it takes for read data to be available.
>   I suspect the cpu will stall if the data is needed.
>   A block of sequential reads is one way to avoid the stall.
>   On x86 the instruction that needs the data is just deferred
>   until it is available, the following instructions execute
>   (provided their input are all available).
> - Clock delays for taken/not taken predicted/not predicted branches.
>   
> > I don't quite understand how doing the carry in the middle of each
> > stage, even though it can be executed at the same time, would be faster
> > than just doing a single overflow check at the end.
> 
> You need to do half as many reads and adds.
> 
I missed that you were talking about 64-bit reads. I was talking to
somebody about this a couple weeks ago and they mentioned a counter
example that showed that adding the carry after was not the same as
adding it in the middle. Even though addition is commutative, I wasn't
sure if the overflow checking was. I can't rememeber what the counter
example was, but I have a feeling it was flawed.
> > I can just revert
> > back to the non-tree add version since there is no improvement on riscv.
> 
> The 'tree' version is only likely to be faster on cpu (like x86)
> that can (at least sometimes) do two memory reads in one clock
> and can do two adds and two read in the same clock.
> Even then, without out of order execution, it is hard to get right.
> 
> Oh, you might want to try getting the default csum_fold() to
> be the faster 'arc' version rather than adding your own version.
> 
> 	David
> 
> > I can also revert back to the default version that uses carry += sum < val
> > as well.
> > 
> > - Charlie
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
