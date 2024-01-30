Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089B0C47DB3
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 02:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFE+bmXtaRI2tHGPDdhgXg/LYzFfVFXJk16eqpPTzdw=; b=vWXRIWhc5OFYbu
	vCnIO2DAJnCwGRsYr+htKfW/eFW3xuEkdGZNeVKA3JFPlvexJuOB7bKKvbuHkGzP0wO4CDhUrfcHB
	gIZL8Hbfl//QL7S8PyI3ppY+QltMgOg4Uybl/ZjmaOOOGitYQNVAZp7lHzt2W8dnTMi+okQf+95wa
	bAsn7aqIgZ+8hYv6pXfcrakR2Hniw3CwdH5S3qL4hhEOXiAmKuLl5YTuznRem7wxfV5PHlbDINskv
	E2GR6S4qXU3QBCW+BlpCFpSDx7uVlSgEihpquwmMIG29SYDbqoDuPB9YVhs5ud2n5XaQKmk9tYrF9
	6LCYKMnFuiDjpUa83SOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdch-0000000Evd7-3JnB;
	Tue, 30 Jan 2024 02:13:15 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdcf-0000000EvcD-2XC8
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 02:13:15 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-290b37bb7deso2897110a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 18:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706580792; x=1707185592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DQaT8hj9ZpasOuVjPktNO03JfGtp4YjpodrI5ChBkx4=;
        b=yNTefgT5NQXM21BPBVaRLVVvLv6Ew4dxD+Wh3zKX0F1oQahUrJ7W9diHFFLa8ObVYp
         2zBa31WNMg7jVHh5WDuXIlpNh9LtgWvbEn8Nr4wFLLKll8Ulkghalp3zYWddq7RTRsJQ
         WFkyQV/9DK3D1NJffJB66Zvay+eDU0/HuH53j5fcS4dN9LTYZGxdQXzflOpumvrmLGVs
         P4KHCqMAlVlIggVfvd/4G+9JRuXrVuRl7sYQmTBA2JVu0G3b4Jv/+iRu8hs//qeZTFL+
         4SQl8uXCEdRnAfYpTKROLyWjSl4IQr8A1Gh5gwMxAgMS4uFn93ELOFpTrvtdSqeDApc3
         pbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706580792; x=1707185592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQaT8hj9ZpasOuVjPktNO03JfGtp4YjpodrI5ChBkx4=;
        b=aydrAUWmMPNyezLsrdLStDWxVRd1mmjZpaNhGz3/uY/QIRH4Sf5kkAzw1RG55ZYoRv
         FxbRyjNyQx8I3eE/ifdTl2ZZVEGJbBV2hdnnucQ9gU8wRFLJIAWnMpkv3V7ZBlEccv8B
         +ElZ/iUk6fAczy9s/82FCyjjmQQVpx9ZuFu8FDwSJ/7EhjqjHna2lgacdg6VbqbVRxhF
         YaZ1olKwqejUR2lmQbe/llJBSDVue25NjTybHeVAPLWdH8bocQqAZ//m+bANCos5Sbc9
         27I6TNGBznTEdZX/IOj7eW7++UwxYIuU5o0l10b1lp9k/yx+IZColPR/RiMuOATviH36
         V8EQ==
X-Gm-Message-State: AOJu0YzY9c7oepLF7fU2B6huUn9aaAazYBMZfv0FzQBS0Eel/MgKpwIC
	MAdCcGPfhZSZN4aI21KM3+jyKYM8L8z9XT+MiQa1uPm8BQ6AI8vS4P90qKaL7pE=
X-Google-Smtp-Source: AGHT+IGKP9RXIyiwUw8upG06pjp1lfxwwS/marEgSfmUDOzH74kmqKn7lMQecZuLvp8FuLFyForibQ==
X-Received: by 2002:a17:90b:400f:b0:295:ae0c:24c3 with SMTP id ie15-20020a17090b400f00b00295ae0c24c3mr417911pjb.44.1706580791833;
        Mon, 29 Jan 2024 18:13:11 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id sc13-20020a17090b510d00b0028db6cd0ad6sm7244836pjb.3.2024.01.29.18.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 18:13:11 -0800 (PST)
Date: Mon, 29 Jan 2024 18:13:09 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Stefan O'Rear <sorear@fastmail.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Yangyu Chen <cyy@cyyself.name>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/3] riscv: mm: Use hint address in mmap if available
Message-ID: <ZbhbNYLR9kh5dtFU@ghost>
References: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
 <5fd69812-f07b-4079-a871-7e0ee857aaca@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5fd69812-f07b-4079-a871-7e0ee857aaca@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_181313_666355_8760D886 
X-CRM114-Status: GOOD (  23.14  )
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

On Mon, Jan 29, 2024 at 09:04:50PM -0500, Stefan O'Rear wrote:
> On Mon, Jan 29, 2024, at 7:36 PM, Charlie Jenkins wrote:
> > On riscv, mmap currently returns an address from the largest address
> > space that can fit entirely inside of the hint address. This makes it
> > such that the hint address is almost never returned. This patch raises
> > the mappable area up to and including the hint address. This allows mmap
> > to often return the hint address, which allows a performance improvement
> > over searching for a valid address as well as making the behavior more
> > similar to other architectures.
> 
> This means that if an application or library opts in to Sv48 support by
> passing a nonzero hint, it will lose the benefits of ASLR.

sv48 is default. However your statement stands for opting into sv57.
If they always pass the same hint address, only the first address will
be deterministic though, correct?

> 
> Allowing applications to opt in to a VA space smaller than the
> architectural minimum seems like an independently useful feature.
> Is there a reason to only add it for riscv64?
> 

If there is interest, it can be added to other architectures as well.

- Charlie

> -s
> 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> > Charlie Jenkins (3):
> >       riscv: mm: Use hint address in mmap if available
> >       selftests: riscv: Generalize mm selftests
> >       docs: riscv: Define behavior of mmap
> >
> >  Documentation/arch/riscv/vm-layout.rst           | 16 ++--
> >  arch/riscv/include/asm/processor.h               | 21 ++----
> >  tools/testing/selftests/riscv/mm/mmap_bottomup.c | 20 +----
> >  tools/testing/selftests/riscv/mm/mmap_default.c  | 20 +----
> >  tools/testing/selftests/riscv/mm/mmap_test.h     | 93 +++++++++++++-----------
> >  5 files changed, 66 insertions(+), 104 deletions(-)
> > ---
> > base-commit: 556e2d17cae620d549c5474b1ece053430cd50bc
> > change-id: 20240119-use_mmap_hint_address-f9f4b1b6f5f1
> > -- 
> > - Charlie
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
