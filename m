Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276E1C52D6F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 02:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckTc4HXHAPIpIY6R0JA4WQIbuW4Yp5nRJMHQKvF1tQc=; b=HCv5hcC4zdbiFf
	NFVFO0Tnbb67vMg5Fbct774zZXuonPrphV9MkKk5bEZonJMpidwMofD1KO4d71aWAZ/OsHuThTHFU
	ooHTX8qqcVjoZAJv/KGwU52YKhm1r59ZuAX1RVHPKpQUiWkLgpk4PGjcKajuVr/Zszn8o4nWAZX9O
	Pj8cEl54drNeVuJ2q41JS4dVpsNTOjIpy4QOpFqWMT74Jzti2vtbS5+vNBCFZQwIpDFJbgiKd89Fb
	F63If9MjSVogJuhPs29ekMNMYA2QzjQ3tjVhqPxv5wyaGoiarXFwDXSs64S09MGVZ7XhEr0E6rhQt
	RxHrR6BMC/KaB4RCqpjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgEpx-00000003Zpg-3ndl;
	Tue, 20 Aug 2024 02:43:09 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgEpu-00000003Zoq-29c7
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 02:43:08 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-27018df4ff3so2965424fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 19:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724121785; x=1724726585; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IFOzHWvbak6LE8xz7ZLjSo/pB2FEXgmHkGdVOLCa8Qg=;
        b=XMuusJB47JcjfLJ3L+XUE7lAu9kimPEozF2ph9IAZcneYtkuSP4zCpoWMLbk/MWGEK
         0F635uRnmU2BIC7q61/doi/6ZJwUKbWoC7I056/EYkxj6oINPro9ZAzbHtT4tvOqdRRe
         SJuXF0SN2J6atQztI4r2vGz8djXinTUtVJ/YaVn+IFEGaFSkLlH/iQNDhMsTCvXi85xe
         iJ32Ev6y56D7hp+D+nkfM0HXdHCIPG+HBs19dd3jjviv05o8hc7r1SkqEO4f0dkZygoi
         J0DQdcysU1lMW/os4cbhuSs4DotxAMoX6cA/9CTe9VUw91wTZv9HpDwvSndPu9VLH+9v
         KVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724121785; x=1724726585;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFOzHWvbak6LE8xz7ZLjSo/pB2FEXgmHkGdVOLCa8Qg=;
        b=UQeu8QAcHVnPe26T94TCn0u5Sd+wSyCxf1spXF6Z1w5Ng8UombCOlyldbarCSBNk8i
         Dn8Ez4tDpWwXnyxL3qW371Erb4maBj2FTsD6C1wiu2YQWg7KyuxURW/Q37FnYMixWADC
         y1KdJ3NpN5oEOilZZ98CTxS0SkJUxPA9duvvgIu6oW9tyTMvU+CyPechmdSsLdMNXyH6
         ASr62wWkA3OxzMoM/6ZINB4kuwQQLw2QwsLORBw86FijBuLqh9zgq2HjzrC1t2nYcUfA
         4SGjQWL33sMj9h7KTcSTEd3FQIDVktio3wR+Ma4+updVNjR1qBVYtwsxv8xFo9mPGEdo
         Nohg==
X-Forwarded-Encrypted: i=1; AJvYcCU69YF7CHnKhOy1/+RUzheHW2luhwit6JJCRRpuupBcIJa9SyYgyBqjDdWFeQBeEBdgTlajhb/SxLx2mQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yym3872DoCE7hUx8qVAmmFejc/D/nGcTf56wuPh60518qWVAvyD
	GvJwMexoKIiCTKUfNC+NB7dHd6oO00TwhO0984hndpUafsiR3IIBoTOljUQBzQ0=
X-Google-Smtp-Source: AGHT+IFyL2JXMETglLC3qz3X/+8Y7jUI/5f0Wd58GItgifYO6esi1EP2LeOLUWy1KtEsosdOCx3dgA==
X-Received: by 2002:a05:6870:e387:b0:24e:8987:6f34 with SMTP id 586e51a60fabf-2701c354855mr15623458fac.3.1724121785232;
        Mon, 19 Aug 2024 19:43:05 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:7ef:3ad1:b795:8617])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af1e415sm7473468b3a.175.2024.08.19.19.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 19:43:04 -0700 (PDT)
Date: Mon, 19 Aug 2024 19:43:01 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Levi Zim <rsworktech@outlook.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, cyy@cyyself.name,
	alexghiti@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, shuah@kernel.org, corbet@lwn.net,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: [PATCH v3 1/3] riscv: mm: Use hint address in mmap if available
Message-ID: <ZsQCtUP9ul2Y9WB9@ghost>
References: <mhng-5d9bb6c0-9f40-44b2-b9dc-3823cf6dbdef@palmer-ri-x1c9>
 <MEYP282MB2312106710775098261AB348C68C2@MEYP282MB2312.AUSP282.PROD.OUTLOOK.COM>
 <ZsN6R8IliKzAKKMb@ghost>
 <MEYP282MB2312FDB8F4AA7A76884081ADC68D2@MEYP282MB2312.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MEYP282MB2312FDB8F4AA7A76884081ADC68D2@MEYP282MB2312.AUSP282.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_194306_850088_2364183D 
X-CRM114-Status: GOOD (  68.82  )
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

On Tue, Aug 20, 2024 at 09:48:50AM +0800, Levi Zim wrote:
> On 2024-08-20 01:00, Charlie Jenkins wrote:
> > On Mon, Aug 19, 2024 at 01:55:57PM +0800, Levi Zim wrote:
> > > On 2024-03-22 22:06, Palmer Dabbelt wrote:
> > > > On Thu, 01 Feb 2024 18:28:06 PST (-0800), Charlie Jenkins wrote:
> > > > > On Wed, Jan 31, 2024 at 11:59:43PM +0800, Yangyu Chen wrote:
> > > > > > On Wed, 2024-01-31 at 22:41 +0800, Yangyu Chen wrote:
> > > > > > > On Tue, 2024-01-30 at 17:07 -0800, Charlie Jenkins wrote:
> > > > > > > > On riscv it is guaranteed that the address returned by mmap=
 is less
> > > > > > > > than
> > > > > > > > the hint address. Allow mmap to return an address all the w=
ay up to
> > > > > > > > addr, if provided, rather than just up to the lower address=
 space.
> > > > > > > > > > This provides a performance benefit as well, allowing
> > > > > > mmap to exit
> > > > > > > > after
> > > > > > > > checking that the address is in range rather than searching=
 for a
> > > > > > > > valid
> > > > > > > > address.
> > > > > > > > > > It is possible to provide an address that uses at most =
the same
> > > > > > > > number
> > > > > > > > of bits, however it is significantly more computationally e=
xpensive
> > > > > > > > to
> > > > > > > > provide that number rather than setting the max to be the h=
int
> > > > > > > > address.
> > > > > > > > There is the instruction clz/clzw in Zbb that returns the h=
ighest
> > > > > > > > set
> > > > > > > > bit
> > > > > > > > which could be used to performantly implement this, but it =
would
> > > > > > > > still
> > > > > > > > be slower than the current implementation. At worst case, h=
alf of
> > > > > > > > the
> > > > > > > > address would not be able to be allocated when a hint addre=
ss is
> > > > > > > > provided.
> > > > > > > > > > Signed-off-by: Charlie Jenkins<charlie@rivosinc.com>
> > > > > > > > ---
> > > > > > > >  =A0arch/riscv/include/asm/processor.h | 27 +++++++++++----=
-----------
> > > > > > > > -
> > > > > > > >  =A01 file changed, 11 insertions(+), 16 deletions(-)
> > > > > > > > > > diff --git a/arch/riscv/include/asm/processor.h
> > > > > > > > b/arch/riscv/include/asm/processor.h
> > > > > > > > index f19f861cda54..8ece7a8f0e18 100644
> > > > > > > > --- a/arch/riscv/include/asm/processor.h
> > > > > > > > +++ b/arch/riscv/include/asm/processor.h
> > > > > > > > @@ -14,22 +14,16 @@
> > > > > > > > =

> > > > > > > >  =A0#include <asm/ptrace.h>
> > > > > > > > =

> > > > > > > > -#ifdef CONFIG_64BIT
> > > > > > > > -#define DEFAULT_MAP_WINDOW=A0=A0=A0 (UL(1) << (MMAP_VA_BIT=
S - 1))
> > > > > > > > -#define STACK_TOP_MAX=A0=A0=A0=A0=A0=A0=A0 TASK_SIZE_64
> > > > > > > > -
> > > > > > > >  =A0#define arch_get_mmap_end(addr, len, flags)=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > >  =A0({=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > >  =A0=A0=A0=A0 unsigned long
> > > > > > > > mmap_end;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 \
> > > > > > > >  =A0=A0=A0=A0 typeof(addr) _addr =3D (addr);=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > > -=A0=A0=A0 if ((_addr) =3D=3D 0 || (IS_ENABLED(CONFIG_COMPA=
T) &&
> > > > > > > > is_compat_task())) \
> > > > > > > > +=A0=A0=A0 if ((_addr) =3D=3D 0 ||=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > > +=A0=A0=A0 =A0=A0=A0 (IS_ENABLED(CONFIG_COMPAT) && is_compa=
t_task()) ||=A0=A0=A0 \
> > > > > > > > +=A0=A0=A0 =A0=A0=A0 ((_addr + len) > BIT(VA_BITS -
> > > > > > > > 1)))=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0 mmap_end =3D STACK_TOP_MAX;=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > > -=A0=A0=A0 else if ((_addr) >=3D VA_USER_SV57) \
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 mmap_end =3D STACK_TOP_MAX;=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > > -=A0=A0=A0 else if ((((_addr) >=3D VA_USER_SV48)) && (VA_BI=
TS >=3D
> > > > > > > > VA_BITS_SV48)) \
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 mmap_end =3D VA_USER_SV48;=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > >  =A0=A0=A0=A0 else=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 mmap_end =3D VA_USER_SV39;=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 mmap_end =3D (_addr + len);=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > >  =A0=A0=A0=A0 mmap_end;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > >  =A0})
> > > > > > > > =

> > > > > > > > @@ -39,17 +33,18 @@
> > > > > > > >  =A0=A0=A0=A0 typeof(addr) _addr =3D (addr);=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > >  =A0=A0=A0=A0 typeof(base) _base =3D (base);=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > >  =A0=A0=A0=A0 unsigned long rnd_gap =3D DEFAULT_MAP_WINDOW =
- (_base);=A0=A0=A0 \
> > > > > > > > -=A0=A0=A0 if ((_addr) =3D=3D 0 || (IS_ENABLED(CONFIG_COMPA=
T) &&
> > > > > > > > is_compat_task())) \
> > > > > > > > +=A0=A0=A0 if ((_addr) =3D=3D 0 ||=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > > +=A0=A0=A0 =A0=A0=A0 (IS_ENABLED(CONFIG_COMPAT) && is_compa=
t_task()) ||=A0=A0=A0 \
> > > > > > > > +=A0=A0=A0 =A0=A0=A0 ((_addr + len) > BIT(VA_BITS -
> > > > > > > > 1)))=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0 mmap_base =3D (_base);=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > > -=A0=A0=A0 else if (((_addr) >=3D VA_USER_SV57) && (VA_BITS=
 >=3D
> > > > > > > > VA_BITS_SV57)) \
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 mmap_base =3D VA_USER_SV57 - rnd_gap=
; \
> > > > > > > > -=A0=A0=A0 else if ((((_addr) >=3D VA_USER_SV48)) && (VA_BI=
TS >=3D
> > > > > > > > VA_BITS_SV48)) \
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 mmap_base =3D VA_USER_SV48 - rnd_gap=
; \
> > > > > > > >  =A0=A0=A0=A0 else=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 mmap_base =3D VA_USER_SV39 - rnd_gap=
; \
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 mmap_base =3D (_addr + len) - rnd_ga=
p; \
> > > > > > > >  =A0=A0=A0=A0 mmap_base;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > > >  =A0})
> > > > > > > > =

> > > > > > > > +#ifdef CONFIG_64BIT
> > > > > > > > +#define DEFAULT_MAP_WINDOW=A0=A0=A0 (UL(1) << (MMAP_VA_BIT=
S - 1))
> > > > > > > > +#define STACK_TOP_MAX=A0=A0=A0=A0=A0=A0=A0 TASK_SIZE_64
> > > > > > > >  =A0#else
> > > > > > > >  =A0#define DEFAULT_MAP_WINDOW=A0=A0=A0 TASK_SIZE
> > > > > > > >  =A0#define STACK_TOP_MAX=A0=A0=A0=A0=A0=A0=A0 TASK_SIZE
> > > > > > > > > > I have carefully tested your patch on qemu with sv57. A
> > > > > > bug that
> > > > > > > needs
> > > > > > > to be solved is that mmap with the same hint address without
> > > > > > > MAP_FIXED
> > > > > > > set will fail the second time.
> > > > > > > > Userspace code to reproduce the bug:
> > > > > > > > #include <sys/mman.h>
> > > > > > > #include <stdio.h>
> > > > > > > #include <stdint.h>
> > > > > > > > void test(char *addr) {
> > > > > > >  =A0=A0=A0 char *res =3D mmap(addr, 4096, PROT_READ | PROT_WR=
ITE,
> > > > > > > MAP_ANONYMOUS
> > > > > > > > MAP_PRIVATE, -1, 0);
> > > > > > >  =A0=A0=A0 printf("hint %p got %p.\n", addr, res);
> > > > > > > }
> > > > > > > > int main (void) {
> > > > > > >  =A0=A0=A0 test(1<<30);
> > > > > > >  =A0=A0=A0 test(1<<30);
> > > > > > >  =A0=A0=A0 test(1<<30);
> > > > > > >  =A0=A0=A0 return 0;
> > > > > > > }
> > > > > > > > output:
> > > > > > > > hint 0x40000000 got 0x40000000.
> > > > > > > hint 0x40000000 got 0xffffffffffffffff.
> > > > > > > hint 0x40000000 got 0xffffffffffffffff.
> > > > > > > > output on x86:
> > > > > > > > hint 0x40000000 got 0x40000000.
> > > > > > > hint 0x40000000 got 0x7f9171363000.
> > > > > > > hint 0x40000000 got 0x7f9171362000.
> > > > > > > > It may need to implement a special arch_get_unmapped_area a=
nd
> > > > > > > arch_get_unmapped_area_topdown function.
> > > > > > > =

> > > > > > This is because hint address < rnd_gap. I have tried to let mma=
p_base =3D
> > > > > > min((_addr + len), (base) + TASK_SIZE - DEFAULT_MAP_WINDOW). Ho=
wever it
> > > > > > does not work for bottom-up while ulimit -s is unlimited. You s=
aid this
> > > > > > behavior is expected from patch v2 review.=A0However it brings =
a new
> > > > > > regression even on sv39 systems.
> > > > > > =

> > > > > > I still don't know the reason why use addr+len as the upper-bou=
nd. I
> > > > > > think solution like x86/arm64/powerpc provide two address space=
 switch
> > > > > > based on whether hint address above the default map window is e=
nough.
> > > > > > =

> > > > > Yep this is expected. It is up to the maintainers to decide.
> > > > Sorry I forgot to reply to this, I had a buffer sitting around some=
where
> > > > but I must have lost it.
> > > > =

> > > > I think Charlie's approach is the right way to go.=A0 Putting my us=
erspace
> > > > hat on, I'd much rather have my allocations fail rather than silent=
ly
> > > > ignore the hint when there's memory pressure.
> > > > =

> > > > If there's some real use case that needs these low hints to be sile=
ntly
> > > > ignored under VA pressure then we can try and figure something out =
that
> > > > makes those applications work.
> > > I could confirm that this patch has broken chromium's partition alloc=
ator on
> > > riscv64. The minimal reproduction I use is chromium-mmap.c:
> > > =

> > > #include <stdio.h>
> > > #include <sys/mman.h>
> > > =

> > > int main() {
> > >  =A0=A0=A0 void* expected =3D (void*)0x400000000;
> > >  =A0=A0=A0 void* addr =3D mmap(expected, 17179869184, PROT_NONE,
> > > MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
> > >  =A0=A0=A0 if (addr !=3D expected) {
> > It is not valid to assume that the address returned by mmap will be the
> > hint address. If the hint address is not available, mmap will return a
> > different address.
> =

> Oh, sorry I didn't make it clear what is the expected behavior.
> The printf here is solely for debugging purpose and I don't mean that
> chromium expect it will get the hint address. The expected behavior is th=
at
> both the two mmap calls will succeed.
> =

> > >  =A0=A0=A0=A0=A0=A0=A0 printf("Not expected address: %p !=3D %p\n", a=
ddr, expected);
> > >  =A0=A0=A0 }
> > >  =A0=A0=A0 expected =3D (void*)0x3fffff000;
> > >  =A0=A0=A0 addr =3D mmap(expected, 17179873280, PROT_NONE, MAP_PRIVAT=
E|MAP_ANONYMOUS,
> > > -1, 0);
> > >  =A0=A0=A0 if (addr !=3D expected) {
> > >  =A0=A0=A0=A0=A0=A0=A0 printf("Not expected address: %p !=3D %p\n", a=
ddr, expected);
> > >  =A0=A0=A0 }
> > >  =A0=A0=A0 return 0;
> > > }
> > > =

> > > The second mmap fails with ENOMEM. Manually reverting this commit fix=
es the
> > > issue for me. So I think it's clearly a regression and breaks userspa=
ce.
> > > =

> > The issue here is that overlapping memory is being requested. This
> > second mmap will never be able to provide an address at 0x3fffff000 with
> > a size of 0x400001000 since mmap just provided an address at 0x400000000
> > with a size of 0x400000000.
> > =

> > Before this patch, this request causes mmap to return a completely
> > arbitrary value. There is no reason to use a hint address in this manner
> > because the hint can never be respected. Since an arbitrary address is
> > desired, a hint of zero should be used.
> > =

> > This patch causes the behavior to be more deterministic. Instead of
> > providing an arbitrary address, it causes the address to be less than or
> > equal to the hint address. This allows for applications to make
> > assumptions about the returned address.
> =

> About the overlap, of course the partition allocator's request for
> overlapped vma seems unreasonable.
> =

> But I still don't quite understand why mmap cannot use an address higher
> than the hint address.
> The hint address, after all, is a hint, not a requirement.

Yes that is fair. A "hint" that does not guarantee anything is
useless so architectures have abused the term quite a bit.

> =

> Quoting the man page:
> =

> >    If another mapping already exists there, the kernel picks
> >         a new address that may or may not depend on the hint.  The
> >         address of the new mapping is returned as the result of the cal=
l.
> So for casual programmers that only reads man page but not architecture
> specific kernel
> documentation, the current behavior of mmap on riscv64 failing on overlap=
ped
> address ranges
> are quite surprising IMO.

The man pages for riscv are in desperate need of attention. I have
submitted a couple of updates to them recently, but there is a lot more
work to be done to help developers.

> =

> And quoting the man page again about the errno:
> =

> > =A0=A0=A0=A0=A0 ENOMEM No memory is available.
> > =

> > =A0=A0=A0=A0=A0=A0ENOMEM The process's maximum number of mappings would=
 have been
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0exceeded. =A0This error can also=
 occur for munmap(), when
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0unmapping a region in the middle=
 of an existing mapping,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0since this results in two smalle=
r mappings on either side
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0of the region being unmapped.
> > =

> > =A0=A0=A0=A0=A0=A0ENOMEM (since Linux 4.7) The process's RLIMIT_DATA li=
mit,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0described in getrlimit(2), would=
 have been exceeded.
> > =

> > =A0=A0=A0=A0=A0=A0ENOMEM We don't like addr, because it exceeds the vir=
tual address
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0space of the CPU.
> > =

> =

> There's no matching description for the ENOMEM returned here.
> I would suggest removing "because it exceeds the virtual address
> space of the CPU." from the last item if the ENOMEM behavior here
> is expected.

This ENOMEM means something like "no memory available in the requested
region".

> =

> > This code is unfortunately relying on the previously mostly undefined
> > behavior of the hint address in mmap.
> Although I haven't read the code of chromium's partition allocator to jud=
ge
> whether it should
> be improved or fixed for riscv64, I do know that the kernel "don't break
> userspace" and
> "never EVER blame the user programs".

The hint address design of mmap is a tricky one because it is largely
implementation defined and what the man pages say is not how it is
implemented in most architectures!

> > The goal of this patch is to help
> > developers have more consistent mmap behavior, but maybe it is necessary
> > to hide this behavior behind an mmap flag.
> Thank you for helping to shape a more consistent mmap behavior.
> I think this should be fixed ASAP either by allowing the hint address to =
be
> ignored
> (as suggested by the Linux man page), or hide this behavior behind an mmap
> flag as you said.

Having a flag could also lead to a generic way of defining this
behavior. Other architectures do not provide a way for applications to
guarantee that some number of bits are left unused in a virtual address,
and that was one of the motivating design goals here.

- Charlie

> =

> > - Charlie
> > =

> > > See alsohttps://github.com/riscv-forks/electron/issues/4
> > > =

> > > > > - Charlie
> > > Sincerely,
> > > Levi
> > > =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
