Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE07C4725D
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 01:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ZBOfg9qrCFGlqxSnbcqwalYLv8NpPmRMMVagaCDeFw=; b=acCChbJGtQCNSj
	46tUUbQwa6epuSl7/fC1e/6GZ6Bb2NB18Lc3n/Vc0IMoIFszFBQBonCEkFlkrJH5HIhO2R6otLpAY
	cDW3LgWBZiR9PxnDGXzHfYKkFkzUgtLf4gQfvwnapVC+nsnPCi+qYhga6rtoU+kgrCGAkQ8nxm1AR
	d2l2Me1TTDR5H6w/4oasNcZRNy7nzUeF+7++d3Eo3aZFDNCFwyDamyze377wcqGcNjwv/CY3Ajwfo
	7GVj9kVEWjOMKk45ZnvPIMjt1aeu3eZcfsov2Cmv8WDB2NqAKbkCZHM8QLCyIkYxjAVFPhBBypHtQ
	0pFM3K4CZ3e/KdpVJ8Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rR0Fr-00718h-1R;
	Sat, 20 Jan 2024 01:34:39 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rR0Fn-00717t-2e
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 01:34:38 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6d9af1f52bcso1111334b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 17:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705714474; x=1706319274; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ESr1s1LQuOTutaWHm69OFuVr1y+EY8ccPvGNNNRU7c=;
        b=z2kRqbOBuRZFdMagOq8CN8TBfqUPjjLm1U9aXsdLtuJhovURuMxB8qSFz6u7IP2uaS
         ixuyN0+NeqRrXE17AZoNmN8iVha2GeDCWA4qTn3FhXS9zw8HkMCYo96/seUKZWCfSsEO
         ilHyvemxK0EPjxT1+9ShtgjXXdhXmlZzm0NBBwDyJggrf7C26VfsuaB4oUXW+Can8oi2
         WWtC3kjJvXJ/RiDDS1Yi2ia5ZNbBKl4SwBwwtOUrZtfp/qFbRvwt+A0Q9qNwYtqV/OQP
         ddPu/aYaAtUYe2jdk23j1HR9EXe3NrSIdcZcLohtUzDheN39GOpirtyo8miI9W3X9FZg
         cSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705714474; x=1706319274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ESr1s1LQuOTutaWHm69OFuVr1y+EY8ccPvGNNNRU7c=;
        b=TMmRczCXeFMXsQqQmqCeDsvYhuZW6SIRnokJ64qivaMl/ED7xx0/t3zvI0+fTfB5Sf
         lqVvtDf/eAjop9HUMbGABrlvkSlW830MQzeP0Wxiqid8Z9I8/wolDDnH9woiTq2vF5tM
         Hcs/7oTl3LMoaJcmQhaYlhrMpCW7naF9NWYw+omiLzHDSvOU95lzcxTfpyOaWxQLMBUk
         IH3glUo68WWE6adx3xMHUcqSyNBjFEqk9gEL09IJnqhyj976FiVGbjk5PU4cY8aLPkB2
         iEsQWly78Dcc0OnR/ITMJUoyVO8Zoid/e6UJqMerDK1B3xVtmSupqQ8snNR5Kkg/BEDy
         +NgQ==
X-Gm-Message-State: AOJu0Yy9RGjOLQwwvmoBstbX2WVj9DLAuI9Rod5tYRmlcxqfeVB5xTnb
	y0dbuAaOdymyJD2BytPLKDHsNO6KWw49iq4atMdxF437Oq8rR165CXyoJ11gwiI=
X-Google-Smtp-Source: AGHT+IFpTaljaK+IhzjIUgqr3GVQ3I9VycDOb1FWOAfJMZG3m5Pa9z8B24GyjvedFp0KN3e6hXYsKA==
X-Received: by 2002:a05:6a21:185:b0:19a:6830:2334 with SMTP id le5-20020a056a21018500b0019a68302334mr757399pzb.46.1705714474654;
        Fri, 19 Jan 2024 17:34:34 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id r9-20020a170903410900b001d71c89fb32sm1961666pld.269.2024.01.19.17.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 17:34:34 -0800 (PST)
Date: Fri, 19 Jan 2024 17:34:31 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: alexghiti@rivosinc.com, anup@brainfault.org, aou@eecs.berkeley.edu,
	conor@kernel.org, jrtc27@jrtc27.com, konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, mick@ics.forth.gr,
	palmer@rivosinc.com, paul.walmsley@sifive.com,
	rdunlap@infradead.org
Subject: Re: [PATCH v10 0/4] RISC-V: mm: Make SV48 the default address space
Message-ID: <ZasjJ3HPUVuxr2oG@ghost>
References: <20230809232218.849726-1-charlie@rivosinc.com>
 <tencent_F9568C6D8872E30EDFAF20ADF686A31D6E06@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_F9568C6D8872E30EDFAF20ADF686A31D6E06@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_173436_068731_40A8235E 
X-CRM114-Status: GOOD (  25.68  )
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

On Sun, Jan 14, 2024 at 01:26:57AM +0800, Yangyu Chen wrote:
> Hi, Charlie
> 
> Although this patchset has been merged I still have some questions about
> this patchset. Because it breaks regular mmap if address >= 38 bits on
> sv48 / sv57 capable systems like qemu. For example, If a userspace program
> wants to mmap an anonymous page to addr=(1<<45) on an sv48 capable system,
> it will fail and kernel will mmaped to another sv39 address since it does

Thank you for raising this concern. To make sure I am understanding
correctly, you are passing a hint address of (1<<45) and expecting mmap
to return 1<<45 and if it returns a different address you are describing
mmap as failing? If you want an address that is in the sv48 space you
can pass in an address that is greater than 1<<47.

> not meet the requirement to use sv48 as you wrote:
> 
> >	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
> >		mmap_end = VA_USER_SV48;			\
> >	else							\
> >		mmap_end = VA_USER_SV39;			\
> 
> Then, How can a userspace program create a mmap with a hint if the address
> >= (1<<38) after your patch without MAP_FIXED? The only way to do this is
> to pass a hint >= (1<<47) on mmap syscall then kernel will return a random
> address in sv48 address space but the hint address gets lost. I think this

In order to force mmap to return the address provided you must use
MAP_FIXED. Otherwise, the address is a "hint" and has no guarantees. The
hint address on riscv is used to mean "don't give me an address that
uses more bits than this". This behavior is not unique to riscv, arm64
and powerpc use a similar scheme. In arch/arm64/include/asm/processor.h
there is the following code:

#define arch_get_mmap_base(addr, base) ((addr > DEFAULT_MAP_WINDOW) ? \
					base + TASK_SIZE - DEFAULT_MAP_WINDOW :\
					base)

arm64/powerpc are only concerned with a single boundary so the code is simpler.

> violate the principle of mmap syscall as kernel should take the hint and
> attempt to create the mapping there.

Although the man page for mmap does say "on Linux, the kernel will pick
a nearby page boundary" it is still a hint address so there is no strict
requirement (and the precedent has already been set by arm64/powerpc).

> 
> I don't think patching in this way is right. However, if we only revert
> this patch, some programs relying on mmap to return address with effective
> bits <= 48 will still be an issue and it might expand to other ISAs if
> they implement larger virtual address space like RISC-V sv57. A better way
> to solve this might be adding a MAP_48BIT flag to mmap like MAP_32BIT has
> been introduced for decades.
> 
> Thanks,
> Yangyu Chen
> 

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
