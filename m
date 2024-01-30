Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E96C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 22:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeDHeisY2/0vfAyoU72DS2J/9BOzM84jnrZAI5hZBxU=; b=SJRyu4LsDtKmNx
	PsVnbtjRqiO4E1MIUrUz9ioex5zzFky67bMvpLj0UX5h640+KHNXUxgj9IkKTY5c/x0Zm3B7Sphv1
	5o6WbMDTtfGEsJ9FohF3dAL6e4b/gGd15sUNb3P+QS4nOrLkUqAkFVWzqdPZKhmMtKca8xXWF0xZa
	KBMfJaWyvNEmHeKLxSU5asaD9XN+R3v78jX+LgMUJWtQp0r7tvspjFtfyl/xpFMPf7sZO3eGB/ZUn
	ilafH4+Vw0ajHJprH1Jxjz8BKOqauZN0Z5U0mu2MLXeh7LEDlcnRU4bikw1vQdEPu1MRp93Cglx+5
	pNOHwQmYQaoAxFOFV7fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUwJ5-00000000iU5-0l2a;
	Tue, 30 Jan 2024 22:10:15 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUwJ2-00000000iS3-0B4f
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 22:10:13 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso2349048a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 14:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706652610; x=1707257410; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+NalAEpBOXm2rq7TuoQxf0lFmytzH/73qgpQl7PiKxE=;
        b=rzJnw7ExjloQil79lnEGEKADQtRKgq6EebkZ4MMs8UlWg1KtoIQZUzBOqYX2OottPD
         pq8vXfRk/ShCZ4SkDWyc0PeypEaxJsngR7yCRUbVGHzG9vOTpq7T2AqHrgzyxZb+OMp7
         B80OIVQ+yFUNzQDVm2k+mGNtOIM95NiXXeU/vwifWlanXUuZk27Fyt3asARlYDI40EDo
         hqRMM6iLKXEHvzN/rcfjMd8bKYVuuXuGYySf46pTffKUDfeCJj5QXZ7ugZ2kmkGhToJW
         CqYcifdqvYUlkoATXKZHjPnUy8iIBuKIZMpl4MXjziJdaFGHXvZYtqrh1dowCRXN1RYI
         MkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706652610; x=1707257410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NalAEpBOXm2rq7TuoQxf0lFmytzH/73qgpQl7PiKxE=;
        b=TDXLlL7azlAMt0d6ygAX7NCQ5p/4Qvc6Rw4GESuFmfakoDv+mN/QClbRSrAmUjzNkh
         7VdAVzVEwzyttEBaBuvSKCS1SnIE0+kTQnS81Cyr2Z4nywBnIX6guMUYOgZ5Vmhirf8m
         vXxFqjVz4wlNVczXr1IqtsCvtZxmD1oMyGRk/UCOfbWW8rMQRDQlTVPswXTBr69yE1Y1
         lwfM7l1jj3L0VewYsQJKMmB7LytJ8sRI60ybdh/6y2ZjJYbOllEGoM2bqz/wlqkhuJs4
         8ZMphFXFUWGcJJtqUfSimy+Zx+bwcKvJLper3KTC9+kzP5PPtNeik/KI4WWQRUoEbTt8
         hoDA==
X-Gm-Message-State: AOJu0Yz3Mg8VqT8wXCDNP/MQLzHu0ZSYp3Qk0z6Tl2OfvtqCyy/N93y7
	HiTAJtLIZyFIhKDHRBlMLgK5YG75v7lG14gvf/C+XDOm7I61/87TIemZH2E1HBvGiTXCnQLkkEA
	75bs=
X-Google-Smtp-Source: AGHT+IG0TEzaW4Z3tywTe2xwATbdanx5HuSgB7lDcqkiSgyWa4yxiZlDC4+9TLpHCznT/n5rvfzkJQ==
X-Received: by 2002:a05:6a20:d819:b0:19c:a0f0:b167 with SMTP id iv25-20020a056a20d81900b0019ca0f0b167mr6839305pzb.3.1706652610266;
        Tue, 30 Jan 2024 14:10:10 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id jw3-20020a056a00928300b006d9b4303f9csm8274107pfb.71.2024.01.30.14.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 14:10:09 -0800 (PST)
Date: Tue, 30 Jan 2024 14:10:07 -0800
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
Message-ID: <Zblzv0KqlIZQ0wbF@ghost>
References: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
 <5fd69812-f07b-4079-a871-7e0ee857aaca@app.fastmail.com>
 <ZbhbNYLR9kh5dtFU@ghost>
 <6352ff7f-1e69-4f7a-b793-f69d223d4684@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6352ff7f-1e69-4f7a-b793-f69d223d4684@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_141012_114776_CBE6016B 
X-CRM114-Status: GOOD (  28.20  )
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

On Tue, Jan 30, 2024 at 05:04:55PM -0500, Stefan O'Rear wrote:
> On Mon, Jan 29, 2024, at 9:13 PM, Charlie Jenkins wrote:
> > On Mon, Jan 29, 2024 at 09:04:50PM -0500, Stefan O'Rear wrote:
> >> On Mon, Jan 29, 2024, at 7:36 PM, Charlie Jenkins wrote:
> >> > On riscv, mmap currently returns an address from the largest address
> >> > space that can fit entirely inside of the hint address. This makes it
> >> > such that the hint address is almost never returned. This patch raises
> >> > the mappable area up to and including the hint address. This allows mmap
> >> > to often return the hint address, which allows a performance improvement
> >> > over searching for a valid address as well as making the behavior more
> >> > similar to other architectures.
> >> 
> >> This means that if an application or library opts in to Sv48 support by
> >> passing a nonzero hint, it will lose the benefits of ASLR.
> >
> > sv48 is default. However your statement stands for opting into sv57.
> > If they always pass the same hint address, only the first address will
> > be deterministic though, correct?
> 
> I think this is correct.
> 
> >> 
> >> Allowing applications to opt in to a VA space smaller than the
> >> architectural minimum seems like an independently useful feature.
> >> Is there a reason to only add it for riscv64?
> >> 
> >
> > If there is interest, it can be added to other architectures as well.
> 
> I meant as opposed to riscv32.

That is a good point. I can include rv32 as well.

- Charlie

> 
> -s
> 
> > - Charlie
> >
> >> -s
> >> 
> >> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> >> > ---
> >> > Charlie Jenkins (3):
> >> >       riscv: mm: Use hint address in mmap if available
> >> >       selftests: riscv: Generalize mm selftests
> >> >       docs: riscv: Define behavior of mmap
> >> >
> >> >  Documentation/arch/riscv/vm-layout.rst           | 16 ++--
> >> >  arch/riscv/include/asm/processor.h               | 21 ++----
> >> >  tools/testing/selftests/riscv/mm/mmap_bottomup.c | 20 +----
> >> >  tools/testing/selftests/riscv/mm/mmap_default.c  | 20 +----
> >> >  tools/testing/selftests/riscv/mm/mmap_test.h     | 93 +++++++++++++-----------
> >> >  5 files changed, 66 insertions(+), 104 deletions(-)
> >> > ---
> >> > base-commit: 556e2d17cae620d549c5474b1ece053430cd50bc
> >> > change-id: 20240119-use_mmap_hint_address-f9f4b1b6f5f1
> >> > -- 
> >> > - Charlie
> >> >
> >> >
> >> > _______________________________________________
> >> > linux-riscv mailing list
> >> > linux-riscv@lists.infradead.org
> >> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
