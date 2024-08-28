Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB3DC636EE
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 17:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=liLILskCL6HphfSqaxJrrF6oUc5B08L4mfNkEJgPNtg=; b=KuygTmfLGTOe5e
	TEOAnp/qoxxdMDZ77NOhMVLwELEWW2DgqnFNgG56m2vCLtPu8nx1sexhpj5eYJE3HP0ajs/tTZPVb
	uZ6Mlw1Z51SKWIgXUn5H6Dn+5ILkVOVg3VsDef+P1ulNDJ23d9qqB5bCFi9hhCBpmrmohMb/FJDHf
	kvOfnGnkdx1JIvhkpCf8PyJvxJ9Tw11ochkjpFL7hPcGWMe4mezEoGPjda/821FtfK/02rm7iAK1F
	PWNhQ83U97qeB+yX8o1NZJBV3uSb5M3YA7+sYGzKNI9VioBAap2B1FA4QSH42aI3Gur5k420/YAps
	44T1gMkOgGcpE9xWsjFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjMUh-0000000GNHK-27l6;
	Wed, 28 Aug 2024 17:30:07 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjMUd-0000000GNDG-1F1K
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 17:30:05 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-202089e57d8so6019965ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724866201; x=1725471001; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=izEx2iGerEnX7WB/2Mpvv+y1MVG/tbs1FdX9CKEIcSg=;
        b=bdlacIXKsR4XhOJL3Ew4n2h4UtgfpMQHqlFVrGEZS6QiNC3BbFRWPmsgboaIy0p5wX
         tGlDbH6HwUkwdEGDh0gD/sMnIQDX35HtGh01Iv1IYMGUFFHnEALD0YTl1rRYOS0i5+iO
         JniU7dZ29A/H1AD5rpvrGhZgsyDxpwFt+095I4bgTEJmcwNlcObi9S0j1LWiLSNqqPEf
         chRQAaGzfldUUqKCXzvryxsPM2lmuTqAQC04Nq+o6KrAb9OXaS79D9IqlxGl0zLrMa8y
         g1hKyla1u75vFiw3SZkzJ/cfw2wGjRKCAJqaNNPiPznoo3vsEVC6WVZTKl5cnELzS9F+
         XCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724866201; x=1725471001;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izEx2iGerEnX7WB/2Mpvv+y1MVG/tbs1FdX9CKEIcSg=;
        b=rK5yrXNGZQeFSf91HrbLHZ6nwGm3FqBkgW0d9dsFXqwmHwSiy/4xrAz2WzePK9PNFO
         Wyr+YcAzD68cBcDYafaQPcxqRyHRHwRDuCUJrxrgomvog+JIh6WtZHkLucnw7z+N/QJQ
         Kb/yaLJGravGmYrn3kPPyWwuAuFcYZRbxM+MD/aPO9n2jJlPGrDnrUlhEPIyN+iUsIsF
         oFjNzQyWrzm8IONNUHm/fUHGFfVdK0rct2E6MnSK4ddmvDw4iTOn3OVJFdFIKv9VBtkI
         zYh2Nq4mcRp55QobM4B22yxYzbd1MY8FHKmeUs9iAEIB3fLx3fdW2J1mMlsn4E25C3o4
         I48w==
X-Forwarded-Encrypted: i=1; AJvYcCUZ4N3mxNpXXwpHQT7+65njjhUy68NVC8zGeuLiLpG2z+eJ4J0iHUE+5v/Zgr2ryPvwu6lvM8NHAba7bw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp4olHim+JBAKbrSWX+dLNhoL/90CwlhA/+S8ai1ez3CBIFVbM
	JyFjHF6tlpwq5MT+vdb19KJlDMyYJ9RGtN+U5C9IkWyxZoxNfKe5M4clu93ZwcY=
X-Google-Smtp-Source: AGHT+IHMsuvXLfTW+bLvG1ZAGccaibo4i2N0hBI/JcHNn1qd40DIOjpRRFBts/vAK3nn3l/ntjAfHA==
X-Received: by 2002:a17:903:1210:b0:1fb:2ebc:d16b with SMTP id d9443c01a7336-204f9bb4194mr38041435ad.7.1724866201061;
        Wed, 28 Aug 2024 10:30:01 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385581393sm101427625ad.102.2024.08.28.10.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 10:30:00 -0700 (PDT)
Date: Wed, 28 Aug 2024 10:29:55 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Shuah Khan <shuah@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 07/16] powerpc: mm: Support MAP_BELOW_HINT
Message-ID: <Zs9ek1Cr1SaQzSqg@ghost>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <20240827-patches-below_hint_mmap-v1-7-46ff2eb9022d@rivosinc.com>
 <a43c52c6-c1ac-4ef3-b511-08f0459bddad@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a43c52c6-c1ac-4ef3-b511-08f0459bddad@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_103003_344276_BDBD9876 
X-CRM114-Status: GOOD (  21.05  )
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

On Wed, Aug 28, 2024 at 08:34:49AM +0200, Christophe Leroy wrote:
> Hi Charlie,
> =

> Le 28/08/2024 =E0 07:49, Charlie Jenkins a =E9crit=A0:
> > Add support for MAP_BELOW_HINT to arch_get_mmap_base() and
> > arch_get_mmap_end().
> > =

> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >   arch/powerpc/include/asm/task_size_64.h | 36 ++++++++++++++++++++++++=
+++------
> >   1 file changed, 30 insertions(+), 6 deletions(-)
> > =

> > diff --git a/arch/powerpc/include/asm/task_size_64.h b/arch/powerpc/inc=
lude/asm/task_size_64.h
> > index 239b363841aa..a37a5a81365d 100644
> > --- a/arch/powerpc/include/asm/task_size_64.h
> > +++ b/arch/powerpc/include/asm/task_size_64.h
> > @@ -72,12 +72,36 @@
> >   #define STACK_TOP_MAX TASK_SIZE_USER64
> >   #define STACK_TOP (is_32bit_task() ? STACK_TOP_USER32 : STACK_TOP_USE=
R64)
> > -#define arch_get_mmap_base(addr, len, base, flags) \
> > -	(((addr) > DEFAULT_MAP_WINDOW) ? (base) + TASK_SIZE - DEFAULT_MAP_WIN=
DOW : (base))
> > +#define arch_get_mmap_base(addr, len, base, flags)					\
> =

> This macro looks quite big for a macro, can it be a static inline function
> instead ? Same for the other macro below.
> =


I had overlooked that possibility, I think that's a great solution, I
will change that.

> > +({											\
> > +	unsigned long mmap_base;							\
> > +	typeof(flags) _flags =3D (flags);							\
> > +	typeof(addr) _addr =3D (addr);							\
> > +	typeof(base) _base =3D (base);							\
> > +	typeof(len) _len =3D (len);							\
> > +	unsigned long rnd_gap =3D DEFAULT_MAP_WINDOW - (_base);				\
> > +	if (_flags & MAP_BELOW_HINT && _addr !=3D 0 && ((_addr + _len) > BIT(=
VA_BITS - 1)))\
> > +		mmap_base =3D (_addr + _len) - rnd_gap;					\
> > +	else										\
> > +		mmap_end =3D ((_addr > DEFAULT_MAP_WINDOW) ?				\
> > +				_base + TASK_SIZE - DEFAULT_MAP_WINDOW :		\
> > +				_base);							\
> > +	mmap_end;									\
> =

> mmap_end doesn't exist, did you mean mmap_base ?

Oh whoops, thank you!

- Charlie

> =

> > +})
> > -#define arch_get_mmap_end(addr, len, flags) \
> > -	(((addr) > DEFAULT_MAP_WINDOW) || \
> > -	 (((flags) & MAP_FIXED) && ((addr) + (len) > DEFAULT_MAP_WINDOW)) ? T=
ASK_SIZE : \
> > -									    DEFAULT_MAP_WINDOW)
> > +#define arch_get_mmap_end(addr, len, flags)							\
> > +({												\
> > +	unsigned long mmap_end;									\
> > +	typeof(flags) _flags =3D (flags);								\
> > +	typeof(addr) _addr =3D (addr);								\
> > +	typeof(len) _len =3D (len);								\
> > +	if (_flags & MAP_BELOW_HINT && _addr !=3D 0 && ((_addr + _len) > BIT(=
VA_BITS - 1)))	\
> > +		mmap_end =3D (_addr + _len);							\
> > +	else											\
> > +		mmap_end =3D (((_addr) > DEFAULT_MAP_WINDOW) ||					\
> > +				(((_flags) & MAP_FIXED) && ((_addr) + (_len) > DEFAULT_MAP_WINDOW)=
)\
> > +				? TASK_SIZE : DEFAULT_MAP_WINDOW)				\
> > +	mmap_end;										\
> > +})
> >   #endif /* _ASM_POWERPC_TASK_SIZE_64_H */
> > =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
