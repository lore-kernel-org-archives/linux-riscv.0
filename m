Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B6CC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 21:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOd7fBs5t1WKXM+Vh3jbNT9pTZxjqtID4/vsGoB6aqM=; b=CEhx7upj09xpnL
	7eEhwf0qyTv/jGmYP9l/XYIiTYZjl5wAaWOn9zKJl52eGKj42t62pAljRnm8v6GbsQ0MtlUmVjEJ7
	KZ05oGE9ieWt/1R0aNYmAAuP84FEUVxz2y5X4wO2LnOoO50g3u5JXMhITr0uMTQvB+HiyH72DEVoi
	UTl/s5TWFAa6uHAznn845YWq/zHo/N6wZRfIkFFr1PLq2CMGM+bNsfz32de+mUIrXW9GSlvN55kh8
	hJa+xT0yeBNgxL07vmlPGvTnGXImpckHGoPvySzBoDkKQ2iGxmgCAOGPl65EKzMni/9NSV/5GFtLe
	WFxI4mjjcBVm/hN7o2PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUw14-00000000flp-0TfW;
	Tue, 30 Jan 2024 21:51:38 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUw10-00000000fi2-11ki
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 21:51:36 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-295d22bd3afso357180a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 13:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706651490; x=1707256290; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Np9jYGYfYb8N8NYn/XtRXhSjDUyxZMfM0XTBuDl+Ozs=;
        b=VgwDVpdG3152Yuhxv5PQgehz5RcrlPfDgrH0vl9psPDtXTlg8tKWYBPxauwQgZEsfM
         YcSMxKxxTcU+VpERY+kvzCjj31lz9r88fHVMnVTxqxmkUnK88fXN7vuKCgUiU00QXFt1
         BpQ6rJES0Pm9Pl4MSf0tDrHQNqKi407gxN3W2X9WDlN+V47vZQ/x04+2/Jon3e7e0CM4
         xlrBU1Pir1cu5HnqVefeF5fmu4d7WF331QerWXcO1EDaZes8aGh4a2z0/l0mDRLc+kEe
         C4OH32n6yWq78tmoX870LKOD1l80Qle2CZysjpa8fKrSQZIL55Cy0Hm1KxjwSJggbKLx
         7Fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706651490; x=1707256290;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Np9jYGYfYb8N8NYn/XtRXhSjDUyxZMfM0XTBuDl+Ozs=;
        b=mJcwXhDn97vJeQOi/hLZigsRnpXBXWSB3JshHaExFw3JMsrqZI2hM3W8V8VT8l6Jrm
         hmzaIL3D3NELC1UBrT2MZcftNb45L+6C0ufKcxFVanDBpdcgssHROsEc6p0HfEOAll2a
         CEzpm2twSMsnN2psfNRRrYu1wVv+LiLEPx9GTn+CQ23c8Qsj9uoCGP7lekAy5sN6gJ7n
         45iYbs1WpWPsf7UXKHPmi7BARUixMbyzObGqifkcNBUVxNJGmlI1ykyii5Fh8JsKL3X+
         qVwClrMv3sq63kG9NlqO0rzOGhIbmdEbqoln4yHlXv9UfN+h0d5cH1sfPe6LShtbVlLQ
         fCRA==
X-Gm-Message-State: AOJu0YzAn0Bomt656aKWkqm8nCQ46pMbVNUWHaU0iRRt1xqd0HMYd1Y9
	FhHbpO7kL9XcvacadWwLtiv38DqUGmw5vG/Cfuptyh5+xMnR4PciOkHHqJ+T/TY=
X-Google-Smtp-Source: AGHT+IEwtwQoylWlOGq8TqPSvs3bul1pVTRd8p25SneMALbfVbul/65KMmvpPziXy2wknL2Wg6OzKg==
X-Received: by 2002:a17:90a:17a2:b0:28f:f1c0:3d21 with SMTP id q31-20020a17090a17a200b0028ff1c03d21mr5388368pja.41.1706651490637;
        Tue, 30 Jan 2024 13:51:30 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id nb5-20020a17090b35c500b0029464b5fcdbsm8657589pjb.42.2024.01.30.13.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 13:51:30 -0800 (PST)
Date: Tue, 30 Jan 2024 13:51:28 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] riscv: mm: Use hint address in mmap if available
Message-ID: <ZblvYH3NLfhZQt9g@ghost>
References: <20240130-use_mmap_hint_address-v2-0-f34ebfd33053@rivosinc.com>
 <20240130-use_mmap_hint_address-v2-1-f34ebfd33053@rivosinc.com>
 <tencent_34680F3AAAE356C4A485103556F3F909C60A@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_34680F3AAAE356C4A485103556F3F909C60A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_135134_543594_04D9DE24 
X-CRM114-Status: GOOD (  31.01  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 31, 2024 at 03:15:16AM +0800, Yangyu Chen wrote:
> On Tue, 2024-01-30 at 11:04 -0800, Charlie Jenkins wrote:
> > On riscv it is guaranteed that the address returned by mmap is less
> > than
> > the hint address. Allow mmap to return an address all the way up to
> > addr, if provided, rather than just up to the lower address space.
> > =

> > This provides a performance benefit as well, allowing mmap to exit
> > after
> > checking that the address is in range rather than searching for a
> > valid
> > address.
> > =

> > It is possible to provide an address that uses at most the same
> > number
> > of bits, however it is significantly more computationally expensive
> > to
> > provide that number rather than setting the max to be the hint
> > address.
> > There is the instruction clz/clzw in Zbb that returns the highest set
> > bit
> > which could be used to performantly implement this, but it would
> > still
> > be slower than the current implementation. At worst case, half of the
> > address would not be able to be allocated when a hint address is
> > provided.
> > =

> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> > =A0arch/riscv/include/asm/processor.h | 22 +++++++++-------------
> > =A01 file changed, 9 insertions(+), 13 deletions(-)
> > =

> > diff --git a/arch/riscv/include/asm/processor.h
> > b/arch/riscv/include/asm/processor.h
> > index f19f861cda54..5d966ae81a58 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -22,14 +22,12 @@
> > =A0({								\
> > =A0	unsigned long
> > mmap_end;					\
> > =A0	typeof(addr) _addr =3D (addr);				\
> > -	if ((_addr) =3D=3D 0 || (IS_ENABLED(CONFIG_COMPAT) &&
> > is_compat_task())) \
> > -		mmap_end =3D STACK_TOP_MAX;			\
> > -	else if ((_addr) >=3D VA_USER_SV57)			\
> > -		mmap_end =3D STACK_TOP_MAX;			\
> > -	else if ((((_addr) >=3D VA_USER_SV48)) && (VA_BITS >=3D
> > VA_BITS_SV48)) \
> > -		mmap_end =3D VA_USER_SV48;			\
> > +	if ((_addr) =3D=3D 0 ||					\
> > +	=A0=A0=A0 (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
> > +	=A0=A0=A0 ((_addr + len) > BIT(VA_BITS -
> > 1)))			\
> > +		mmap_end =3D STACK_TOP_MAX			\
> > =A0	else							\
> > -		mmap_end =3D VA_USER_SV39;			\
> > +		mmap_end =3D (_addr + len);			\
> > =A0	mmap_end;						\
> > =A0})
> > =A0
> > @@ -39,14 +37,12 @@
> > =A0	typeof(addr) _addr =3D (addr);				\
> > =A0	typeof(base) _base =3D (base);				\
> > =A0	unsigned long rnd_gap =3D DEFAULT_MAP_WINDOW - (_base);	\
> > -	if ((_addr) =3D=3D 0 || (IS_ENABLED(CONFIG_COMPAT) &&
> > is_compat_task())) \
> > +	if ((_addr) =3D=3D 0 ||					\
> > +	=A0=A0=A0 (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
> > +	=A0=A0=A0 ((_addr + len) > BIT(VA_BITS -
> > 1)))			\
> > =A0		mmap_base =3D (_base);				\
> > -	else if (((_addr) >=3D VA_USER_SV57) && (VA_BITS >=3D
> > VA_BITS_SV57)) \
> > -		mmap_base =3D VA_USER_SV57 - rnd_gap;		\
> > -	else if ((((_addr) >=3D VA_USER_SV48)) && (VA_BITS >=3D
> > VA_BITS_SV48)) \
> > -		mmap_base =3D VA_USER_SV48 - rnd_gap;		\
> > =A0	else							\
> > -		mmap_base =3D VA_USER_SV39 - rnd_gap;		\
> > +		mmap_base =3D (_addr + len) - rnd_gap;		\
> =

> Please mind that rnd_gap can be non-zero, in this case, the map will
> fail. It will be better to let mmap_base =3D min((_addr + len), (base) +
> TASK_SIZE - DEFAULT_MAP_WINDOW) .

Why would an rnd_gap that is non-zero cause mmap to fail? mmap will fail
if rnd_gap is greater than (_addr + len). That is expected and should be
interpreted as no address was available in the requested address space.

mmap_base is used if the hint address is not available.

I do see that I fumbled the test cases in this patch so I will fix that
in a v3.

- Charlie

> =

> > =A0	mmap_base;						\
> > =A0})
> > =A0
> > =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
