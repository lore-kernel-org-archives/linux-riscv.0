Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED02C83037
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 18:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=goofuRNoMguk+F9lYKfLS624Iroax0wxjOJ6GzPxU3I=; b=zpgiqBheQ3wl0O
	Ww+vmuyZQUvCo6KE9MRIbSh1+1k5SGRFbNPr8Dg2BsWaBJmX0oBY0/0DfhB1uY6X7sIQH3ICQH7l6
	Hi54/cOoxvtnHx5Zh3LnLvYN/7fMueu6OcoRJJNVsLIwU6O8WENEmbs4bang3uEsOHwTdK4rZBIgr
	tzllDdJXSjYDV7BE9iCijpbyHSmwXCBm1Som2fPPPk/R8t/o5PKjFVhKAPXfU/BaTFCZV1CpegP5m
	2A3s4KrPjQcbDpXsV8E7kTz52WXWiWdd6+GyK5SuDzsdA66sLNuyAgIPBkkrj9GJ6du7cWCMyNU1H
	mJ+KRQzaEDEdoBcau/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ1c-000000039ix-0FRV;
	Mon, 30 Jun 2025 18:14:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIQ3-000000035aL-2FSf
	for linux-riscv@bombadil.infradead.org;
	Mon, 30 Jun 2025 17:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=o8UzOjuYiP+6COT/0DGz1uZwVPKOOEYuoLLIXwCIIFs=; b=YgBcU2mbcLXdhG9j2iwbEoVZj1
	rI924Qw6Gv9BGnKxBnu8ude8p8jU0Pfb9G1onhQfqAXPZZ/vd75srQmknTfxghaG8ylrt+lV60CS9
	YeezrKWUJXr1G/cU/qaGePFnCjWuVOFrcorHTDO7qETGwbEwG2ciJASn/cniCDRfe0eQPAPRDNk5T
	uQ1XKT53CVWcm9z628MgNqz0/Le8mG/wJEPnwndqOf3CGsZsmUH414ns57C3jifhVCpXtxxBlM887
	qlfEaIYQWCKxLjXQkM+kS6KZT+qfbqB7nTpMEHYZJYk6fFjEXtTgH4Ur95LbMJMpdet6deiCFYEtC
	MX5pgShg==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIQ0-00000006q7J-2Nl8
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 17:35:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso24843835e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 10:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751304946; x=1751909746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8UzOjuYiP+6COT/0DGz1uZwVPKOOEYuoLLIXwCIIFs=;
        b=RH6Iumv4Qn5ubVqmwOPU1Of+EWWJsmmul/AFXXhk/6Wv6w2qGn8QkVrQR2Sh4iVXId
         8TXx27ynqjdL4nMOzHPDn2Hj1vY9ioWA8URN5sH4dgmjikYjCdxEtdzMN+cMH2FYLXmv
         0IIibQTnx8RgeGi1fU+3/nUtCUjS+PAkFciwjlEpvL51mghN0MmfpkB/DFEysqowYJsJ
         mrS01Jj6EReyym2Gv+g/WnlkZ0+lBo8/5QgWzEBrR0hEUN/mwtKKWN0Y8ZhrGyocDJzS
         y7n5VOZiD2rORYdca7Wvp6h48GgJngEmpuibFv2jGwfii1co7tdNg4Hx5Pt+21gbML/v
         5ViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751304946; x=1751909746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8UzOjuYiP+6COT/0DGz1uZwVPKOOEYuoLLIXwCIIFs=;
        b=J8g17NGO2CKhQRUvQzXziqoVuhf1pEU61Cg6BoYqar/Typ6QdAS8d8LFNiAd3DYgYR
         35lfJGXNvTXV110zNtTbhpKplzq5Szz1LEeN0RhigqAQE8AoAfTfrlXJEVmdxWPrh18F
         gut9ykdO8epC/AWLA/r/g8sw0sEjPTHVaupIYLhpjWKQlytMqW4+Qcld56yx7ax8IkqJ
         d4Hn0QYwAxnnb1pNv0vgYggmYpWgIeph51jcd+KaBHmw9KFNoxcMG0/3F4GQKonq9slC
         NOB7oBGzFHdv681GNAoT9fxN152QJTfPI1xYeyB0KDrn65WsQHLJdYqOTF60AT5L1ZAR
         hLng==
X-Forwarded-Encrypted: i=1; AJvYcCXxjVt3SRCOuzwZYgXDwznySdIvdnBr12lxm71h381KIp72zt11EiydJbwN+Mcj2DVUs7kHNNsWQErBFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzszGlmmzOPvkasx4OJHzUFBQY89ivJDxYg5ytG6NlnP3/uueUT
	1j821E8jhbHAxfZZaBBCR6TektDKArRJqPqGdRL2TH1kZSRsAmiJ1PNu
X-Gm-Gg: ASbGncvMWG/hYjygp3JlLmUw+RdVMn2gP4OelAqKaF5mfWKl4AgkN5hcfnAifS0nTZV
	0zOI1VIrny2k2N5IXtE0ZPUVbkReozSk+yUIo5d29Nmt7bxLpcNZthYgNLiZghoB0b/DByH3NUp
	1hNUO6tSmPZCCIBIs3k3YQBRWHCfk/HEZNNb9BUEFTzkYD6Oq5wTRL277l9abHzfp9PCIP+832k
	CoCXAwOyfO3WEUxJ/Fa9X3gdHg/o+X2J/0HQ8gsbD6bB/WOipcL/Bcs7Usu1thVqtq8/3HkJESR
	ddriM78nXo0/6ekHJOUjFumlppUxuxsPjHy9rYz0PcpB1xzqWkdrDrVvOC80JDatIWuQxZReahn
	JjGojO7spC0GPDknJzw==
X-Google-Smtp-Source: AGHT+IFUgJpGHTHreJd2V4YxIs3BSqWmS5u8aylaBhtbUqxygRzxU7eVkC51ET0af1KjL/WOFJ+ycw==
X-Received: by 2002:a05:600c:1552:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-453a7fa138dmr1464735e9.4.1751304946001;
        Mon, 30 Jun 2025 10:35:46 -0700 (PDT)
Received: from pumpkin (host-92-21-58-28.as13285.net. [92.21.58.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5972bsm11052648f8f.68.2025.06.30.10.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 10:35:45 -0700 (PDT)
Date: Mon, 30 Jun 2025 18:35:34 +0100
From: David Laight <david.laight.linux@gmail.com>
To: cp0613@linux.alibaba.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, arnd@arndb.de,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux@rasmusvillemoes.dk,
 palmer@dabbelt.com, paul.walmsley@sifive.com, yury.norov@gmail.com
Subject: Re: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb
 extension
Message-ID: <20250630183534.160b9823@pumpkin>
In-Reply-To: <20250630121430.1989-1-cp0613@linux.alibaba.com>
References: <20250629113840.2f319956@pumpkin>
	<20250630121430.1989-1-cp0613@linux.alibaba.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_183548_750525_9A7FB457 
X-CRM114-Status: GOOD (  23.61  )
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

On Mon, 30 Jun 2025 20:14:30 +0800
cp0613@linux.alibaba.com wrote:

> On Sun, 29 Jun 2025 11:38:40 +0100, david.laight.linux@gmail.com wrote:
> 
> > > It can be found that the zbb optimized implementation uses fewer instructions,
> > > even for 16-bit and 8-bit data.  
> > 
> > Far too many register spills to stack.
> > I think you've forgotten to specify -O2  
> 
> Yes, I extracted it from the vmlinux disassembly, without compiling with -O2, and
> I used the web tool you provided as follows:
> ```
> unsigned int generic_ror32(unsigned int word, unsigned int shift)
> {
> 	return (word >> (shift & 31)) | (word << ((-shift) & 31));
> }
> 
> unsigned int zbb_opt_ror32(unsigned int word, unsigned int shift)
> {
> #ifdef __riscv
> 	__asm__ volatile("nop"); // ALTERNATIVE(nop)
> 
> 	__asm__ volatile(
> 		".option push\n"
> 		".option arch,+zbb\n"
> 		"rorw %0, %1, %2\n"
> 		".option pop\n"
> 		: "=r" (word) : "r" (word), "r" (shift) :);
> #endif
> 	return word;
> }
> 
> unsigned short generic_ror16(unsigned short word, unsigned int shift)
> {
> 	return (word >> (shift & 15)) | (word << ((-shift) & 15));
> }
> 
> unsigned short zbb_opt_ror16(unsigned short word, unsigned int shift)
> {
> 	unsigned int word32 = ((unsigned int)word << 16) | word;
> #ifdef __riscv
> 	__asm__ volatile("nop"); // ALTERNATIVE(nop)
> 
> 	__asm__ volatile(
> 		".option push\n"
> 		".option arch,+zbb\n"
> 		"rorw %0, %1, %2\n"
> 		".option pop\n"
> 		: "=r" (word32) : "r" (word32), "r" (shift) :);
> #endif
> 	return (unsigned short)word;
> }
> ```
> The disassembly obtained is:
> ```
> generic_ror32:
>     andi    a1,a1,31

The compiler shouldn't be generating that mask.
After all it knows the negated value doesn't need the same mask.
(I'd guess the cpu just ignores the high bits of the shift - most do.)

>     negw    a5,a1
>     sllw    a5,a0,a5
>     srlw    a0,a0,a1
>     or      a0,a5,a0
>     ret
> 
> zbb_opt_ror32:
>     nop
>     rorw a0, a0, a1
>     sext.w  a0,a0

Is that a sign extend?
Why is it there?
If it is related to the (broken) 'feature' of riscv-64 that 32bit results
are sign extended, why isn't there one in the example above.

You also need to consider the code for non-zbb cpu.

>     ret
> 
> generic_ror16:
>     andi    a1,a1,15
>     negw    a5,a1
>     andi    a5,a5,15
>     sllw    a5,a0,a5
>     srlw    a0,a0,a1
>     or      a0,a0,a5
>     slli    a0,a0,48
>     srli    a0,a0,48

The last two instructions mask the result with 0xffff.
If that is necessary it is missing from the zbb version below.

>     ret
> 
> zbb_opt_ror16:
>     slliw   a5,a0,16
>     addw    a5,a5,a0

At this point you can just do a 'shift right' on all cpu.
For rol16 you can do a variable shift left and a 16 bit
shift right on all cpu.
If the zbb version ends up with a nop (as below) then it is
likely to be much the same speed.

	David

>     nop
>     rorw a5, a5, a1
>     ret
> ```
> 
> Thanks,
> Pei


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
