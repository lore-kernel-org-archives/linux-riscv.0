Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB5FCE79A9
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 18:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oc3mVk3tWYxe5eXcc70H72Wa1gNxUVRHr1S21YuF7Mk=; b=kzNXNjCsFCZb4V
	zADYJJF/bJDuU3f047mxFRlr9VmdlV50LtVeXESnRVqWDNX3DiRd01SQtobByWw5NvCM2u6VjkE6S
	ahIVmv+v6bxNpxUlO7J9OyO0EjbIGyGca764R48SZY4d4VBA2yycMKDmom5UwRbcEZ9oVT0Dnvm0P
	W8g6jau2ws01xuB1bfSf+KdBEydhvR7HSms+zTlUHfhvsKhtAV16jsGM1IYd/k8DB+ro/GX6cKN45
	Ak65wvbXrdp5Ll0RkF2B3M1JVPjIV08SrYE5t/X72ET3N/vZ41YGh33n4qKhg6R0BDFWHL8wcl8WR
	1NWRabBM2iG1ygDP0/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qif5m-0011rW-1P;
	Tue, 19 Sep 2023 18:04:58 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qif5j-0011qE-2B
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 18:04:57 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-690bc3f8326so1382497b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 11:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695146692; x=1695751492; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=15nBqosj6WWJOSwWn2FB/oN1SFdvM0QLlK2aSBEvitc=;
        b=fsAC/kP+8QXIoCRGhIi7l+Ibl6izYWsdFCE+mqzqqtoOjXXg/bCUbofwURl0/C93WQ
         IL9gl1szMzb9saaUD9kF1S2LDcCqIcJV+smY6oLF4TSDUBkFxFdzm2E00iHx8bnOMSBt
         7PIOg+oPxxrm46Clm+Q5ZnOe6Ua8GQ2ixBeBvXgScvt6vt1xQ/+ZDNzqWlcnquwrZ56C
         ekFyHWfYN7PSj/iznyVd+ORra7Nnw0+EC+G4XzI6yJSXDvchX0XRvgaY8s9/kuc9EPJU
         eyadqfKOBx1asvE03cWtIkMYGIfkiMkvlK6PVdvbJWyjJZmqLNjVLM+eoVp9uba9Gctk
         SS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695146692; x=1695751492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15nBqosj6WWJOSwWn2FB/oN1SFdvM0QLlK2aSBEvitc=;
        b=ClR8LazZjYboj3RlUYCqZ6NtJfaHMhHdYNPIIOl0BdKcwvfXVx9+ZS0xS+lfotpFsm
         Fch819vja1LMa+MVX5c4ahcQNqNFRsc/0o68YyQPQgxiTEdIZU8Q7MfzJxHRF0jGo3Ii
         Nspd/fb235j/LotaBkUbW2kzVAHbUlpjZsKe8cZ7QqxTtqxFpj3D5Q7HWJuBIF47R4dv
         OGxh2Dd9Q+4JesOHTIy8/3CBt5B/TTVoXCPO/jjnSOlM7xRoovuuezLQI0BYKvkhp2Qa
         CVChVa3r8fMsA8aMQQJFYqeH/vu6f1qMo1TTpRFwrw01T2/oSUdk9AmxMA3wBpJKcwFA
         Y8PQ==
X-Gm-Message-State: AOJu0YwyxCOGw5oKS4JRumn2fTQ6qG7Et6W1dfEHxZN4nNCdd35IiJPs
	29mgvwXRnLuivAe0fiuo0f/KBg==
X-Google-Smtp-Source: AGHT+IFn+Y/cGWo27YQI4ilcWAzwa2ujC73b21l2AUPxDC9BANzyouOgE1tnupcGIzbju5oTcBbyWg==
X-Received: by 2002:a05:6a00:179f:b0:690:1720:aa9a with SMTP id s31-20020a056a00179f00b006901720aa9amr446773pfg.15.1695146692638;
        Tue, 19 Sep 2023 11:04:52 -0700 (PDT)
Received: from ghost ([50.168.177.76])
        by smtp.gmail.com with ESMTPSA id a23-20020a62e217000000b00666e649ca46sm8947951pfi.101.2023.09.19.11.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 11:04:52 -0700 (PDT)
Date: Tue, 19 Sep 2023 14:04:48 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v6 3/4] riscv: Add checksum library
Message-ID: <ZQniwNEoYLo52HI7@ghost>
References: <20230915-optimize_checksum-v6-0-14a6cf61c618@rivosinc.com>
 <20230915-optimize_checksum-v6-3-14a6cf61c618@rivosinc.com>
 <0357e092c05043fba13eccad77ba799f@AcuMS.aculab.com>
 <ZQkOSf1b66lHzjaf@ghost>
 <0fe9694900c7492c96dce6b67710173f@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fe9694900c7492c96dce6b67710173f@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_110455_713113_CF07349A 
X-CRM114-Status: GOOD (  24.51  )
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

On Tue, Sep 19, 2023 at 08:00:12AM +0000, David Laight wrote:
> ...
> > > So ending up with (something like):
> > > 	end = buff + length;
> > > 	...
> > > 	while (++ptr < end) {
> > > 		csum += data;
> > > 		carry += csum < data;
> > > 		data = ptr[-1];
> > > 	}
> > > (Although a do-while loop tends to generate better code
> > > and gcc will pretty much always make that transformation.)
> > >
> > > I think that is 4 instructions per word (load, add, cmp+set, add).
> > > In principle they could be completely pipelined and all
> > > execute (for different loop iterations) in the same clock.
> > > (But that is pretty unlikely to happen - even x86 isn't that good.)
> > > But taking two clocks is quite plausible.
> > > Plus 2 instructions per loop (inc, cmp+jmp).
> > > They might execute in parallel, but unrolling once
> > > may be required.
> > >
> > It looks like GCC actually ends up generating 7 total instructions:
> > ffffffff808d2acc:	97b6                	add	a5,a5,a3
> > ffffffff808d2ace:	00d7b533          	sltu	a0,a5,a3
> > ffffffff808d2ad2:	0721                	add	a4,a4,8
> > ffffffff808d2ad4:	86be                	mv	a3,a5
> > ffffffff808d2ad6:	962a                	add	a2,a2,a0
> > ffffffff808d2ad8:	ff873783          	ld	a5,-8(a4)
> > ffffffff808d2adc:	feb768e3          	bltu	a4,a1,ffffffff808d2acc <do_csum+0x34>
> > 
> > This mv instruction could be avoided if the registers were shuffled
> > around, but perhaps this way reduces some dependency chains.
> 
> gcc managed to do 'data += csum' so had add 'csum = data'.
> If you unroll once that might go away.
> It might then be 10 instructions for 16 bytes.
> Although you then need slightly larger alignment code.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
I messed with it a bit and couldn't get the mv to go away. I would expect
mv to be very cheap so it should be fine, and I would like to avoid adding
too much to the alignment code since it is already large, and I assume
that buff will be aligned more often than not.

Interestingly, the mv does not appear pre gcc 12, and does not appear on clang.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
