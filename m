Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B66C52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 17:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cAujeeQGpxAt4Ff/tNKaGTpL8I4N5FG8cdMJWfJKVw=; b=cqcsZ/KwS/sw1u
	BKgs96z5mdU8IEgs78t3MN2eZB1y4qFgtia5fb9iJzrUv3Ei2juq6lUkGWNkP4cqdl6waqdH8p/jk
	UKOM+wkF9sqo4PJvAftcL4u79YXq16fGW+BBBxAVa95+F06mF/btakRKcjNQthCNceQYdg6jD4dyV
	XEvG71KyR1bYru+/9EHItfjZs+eXPGLbIEIsxsoNn6h17OkAaRpsWXdsnSx3coh0Og4OX5fdg0AMz
	kgm4QuelZyEjvrHxfzLGdx/7BFQDESpbskkhU7CbDN7NtaRLJDHzFom8t4FLGKVYV/yl9R80bsLiK
	pHpNc2eYxlWgbNgnzrvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5qW-00000002Jzq-1T4g;
	Mon, 19 Aug 2024 17:07:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5kg-00000002IIN-0i1t
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 17:01:11 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-201df0b2df4so35103245ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 10:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724086865; x=1724691665; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8kCQe9G/ESsT5mGMR2/0Q1jS/fZ3F9lMSZDT/xQTaFw=;
        b=fM2GOMcaBi0Md2RkcplFgVqOgPTLHzHaEuOAz8/eGOI8kFxJM8b1Yqyz22uKT0+3s7
         yWa8caxalRd1QMHWqkim26KZNbNWHh+V5NktkcFXETfGIYc6+RTfRepUQpwkO/mViPqF
         Txin1bbml/5lMo9ksTxAnE73AseqDTpTl2wakDhRhfcGNC/zIEr6SwSw+PduoDUVrXhd
         KXQUgvy226IenGsQOPJmG2LIqQFlLqmpRnimf3uRTT9qH2+XwoCh8PT9xg006QMYLSIT
         uw6lMxRf2h21nJTEN+9oJrWwLspKuY0c886XFBgfvloQ8rs9w6X2M6r+Nb+exAI2jqfZ
         SRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086865; x=1724691665;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kCQe9G/ESsT5mGMR2/0Q1jS/fZ3F9lMSZDT/xQTaFw=;
        b=dAQY4bge7o6prySzZ2ABhyrKm1rsyweUT/tA3Yye/v2fSYBeg+SYzj125a2mUCbUsC
         KFlPNv3H9s3q9WNIspIwMmOU8yyjN4JC1opsYwrR94FcdAX8lGmARpFuG5v7CZP6UhUY
         w7AWPr2o327JW7dN4N4683cby66bHOcXkb2z2S8RXfGpzlWZUn3tYbcbbreGxdIKkH59
         FXbJNPmfpjy2yh0ZupDGlUrJwh4u0rPqTv4pO3OxnRIocsoOeSzOBZaTDe0i4tnmhKuj
         G1rnPGqzYhYe5A+cQLBfZ6t5sgGGg7Se1z3o3qpXglJDrOdwWX2bnLgzP/O7SnBJiKv8
         9Pag==
X-Forwarded-Encrypted: i=1; AJvYcCXuPOU9ytH9b35FCE+541bRDCl1BsWRrC13o4kh0IF/JAM3vJqHlhWy4/Zqp8Q2K71KKgR5dISYmib2MWEih3s6svKtylj0CN60HKF+2oFV
X-Gm-Message-State: AOJu0YwlG/smKdEoToxZYrGl2TZGu3aZC5rxCt8cd6UvYe3RKM3ln8S/
	VToq3jRrzOxx6Crxf/G/Sq43a8vFddaJlPw7w2JW0v2luolCnaZINRFbz5XRvY0=
X-Google-Smtp-Source: AGHT+IHut0PifcKMMGeqhfJ8yiuVWQ7wXVh2IejTYX1LXvOUkkJjf0fMHibwkq8TDuAnUw+VWMtRMQ==
X-Received: by 2002:a17:902:e74d:b0:202:244e:a0b3 with SMTP id d9443c01a7336-202244ea2admr94263185ad.46.1724086864336;
        Mon, 19 Aug 2024 10:01:04 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f02fa4d5sm65079055ad.41.2024.08.19.10.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 10:01:03 -0700 (PDT)
Date: Mon, 19 Aug 2024 10:00:55 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Levi Zim <rsworktech@outlook.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, cyy@cyyself.name,
	alexghiti@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, shuah@kernel.org, corbet@lwn.net,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: [PATCH v3 1/3] riscv: mm: Use hint address in mmap if available
Message-ID: <ZsN6R8IliKzAKKMb@ghost>
References: <mhng-5d9bb6c0-9f40-44b2-b9dc-3823cf6dbdef@palmer-ri-x1c9>
 <MEYP282MB2312106710775098261AB348C68C2@MEYP282MB2312.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MEYP282MB2312106710775098261AB348C68C2@MEYP282MB2312.AUSP282.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_100106_317366_59E7EB27 
X-CRM114-Status: GOOD (  57.66  )
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

On Mon, Aug 19, 2024 at 01:55:57PM +0800, Levi Zim wrote:
> On 2024-03-22 22:06, Palmer Dabbelt wrote:
> > On Thu, 01 Feb 2024 18:28:06 PST (-0800), Charlie Jenkins wrote:
> > > On Wed, Jan 31, 2024 at 11:59:43PM +0800, Yangyu Chen wrote:
> > > > On Wed, 2024-01-31 at 22:41 +0800, Yangyu Chen wrote:
> > > > > On Tue, 2024-01-30 at 17:07 -0800, Charlie Jenkins wrote:
> > > > > > On riscv it is guaranteed that the address returned by mmap is =
less
> > > > > > than
> > > > > > the hint address. Allow mmap to return an address all the way u=
p to
> > > > > > addr, if provided, rather than just up to the lower address spa=
ce.
> > > > > > > > This provides a performance benefit as well, allowing
> > > > mmap to exit
> > > > > > after
> > > > > > checking that the address is in range rather than searching for=
 a
> > > > > > valid
> > > > > > address.
> > > > > > > > It is possible to provide an address that uses at most the =
same
> > > > > > number
> > > > > > of bits, however it is significantly more computationally expen=
sive
> > > > > > to
> > > > > > provide that number rather than setting the max to be the hint
> > > > > > address.
> > > > > > There is the instruction clz/clzw in Zbb that returns the highe=
st
> > > > > > set
> > > > > > bit
> > > > > > which could be used to performantly implement this, but it would
> > > > > > still
> > > > > > be slower than the current implementation. At worst case, half =
of
> > > > > > the
> > > > > > address would not be able to be allocated when a hint address is
> > > > > > provided.
> > > > > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > > > ---
> > > > > > =A0arch/riscv/include/asm/processor.h | 27 +++++++++++---------=
------
> > > > > > -
> > > > > > =A01 file changed, 11 insertions(+), 16 deletions(-)
> > > > > > > > diff --git a/arch/riscv/include/asm/processor.h
> > > > > > b/arch/riscv/include/asm/processor.h
> > > > > > index f19f861cda54..8ece7a8f0e18 100644
> > > > > > --- a/arch/riscv/include/asm/processor.h
> > > > > > +++ b/arch/riscv/include/asm/processor.h
> > > > > > @@ -14,22 +14,16 @@
> > > > > >
> > > > > > =A0#include <asm/ptrace.h>
> > > > > >
> > > > > > -#ifdef CONFIG_64BIT
> > > > > > -#define DEFAULT_MAP_WINDOW=A0=A0=A0 (UL(1) << (MMAP_VA_BITS - =
1))
> > > > > > -#define STACK_TOP_MAX=A0=A0=A0=A0=A0=A0=A0 TASK_SIZE_64
> > > > > > -
> > > > > > =A0#define arch_get_mmap_end(addr, len, flags)=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 \
> > > > > > =A0({=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > =A0=A0=A0=A0 unsigned long
> > > > > > mmap_end;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 \
> > > > > > =A0=A0=A0=A0 typeof(addr) _addr =3D (addr);=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > -=A0=A0=A0 if ((_addr) =3D=3D 0 || (IS_ENABLED(CONFIG_COMPAT) &&
> > > > > > is_compat_task())) \
> > > > > > +=A0=A0=A0 if ((_addr) =3D=3D 0 ||=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > +=A0=A0=A0 =A0=A0=A0 (IS_ENABLED(CONFIG_COMPAT) && is_compat_ta=
sk()) ||=A0=A0=A0 \
> > > > > > +=A0=A0=A0 =A0=A0=A0 ((_addr + len) > BIT(VA_BITS -
> > > > > > 1)))=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > =A0=A0=A0=A0=A0=A0=A0=A0 mmap_end =3D STACK_TOP_MAX;=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > -=A0=A0=A0 else if ((_addr) >=3D VA_USER_SV57) \
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 mmap_end =3D STACK_TOP_MAX;=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > -=A0=A0=A0 else if ((((_addr) >=3D VA_USER_SV48)) && (VA_BITS >=
=3D
> > > > > > VA_BITS_SV48)) \
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 mmap_end =3D VA_USER_SV48;=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > =A0=A0=A0=A0 else=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 mmap_end =3D VA_USER_SV39;=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > +=A0=A0=A0=A0=A0=A0=A0 mmap_end =3D (_addr + len);=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > =A0=A0=A0=A0 mmap_end;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > =A0})
> > > > > >
> > > > > > @@ -39,17 +33,18 @@
> > > > > > =A0=A0=A0=A0 typeof(addr) _addr =3D (addr);=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > =A0=A0=A0=A0 typeof(base) _base =3D (base);=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > =A0=A0=A0=A0 unsigned long rnd_gap =3D DEFAULT_MAP_WINDOW - (_b=
ase);=A0=A0=A0 \
> > > > > > -=A0=A0=A0 if ((_addr) =3D=3D 0 || (IS_ENABLED(CONFIG_COMPAT) &&
> > > > > > is_compat_task())) \
> > > > > > +=A0=A0=A0 if ((_addr) =3D=3D 0 ||=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > +=A0=A0=A0 =A0=A0=A0 (IS_ENABLED(CONFIG_COMPAT) && is_compat_ta=
sk()) ||=A0=A0=A0 \
> > > > > > +=A0=A0=A0 =A0=A0=A0 ((_addr + len) > BIT(VA_BITS -
> > > > > > 1)))=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > =A0=A0=A0=A0=A0=A0=A0=A0 mmap_base =3D (_base);=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > -=A0=A0=A0 else if (((_addr) >=3D VA_USER_SV57) && (VA_BITS >=
=3D
> > > > > > VA_BITS_SV57)) \
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 mmap_base =3D VA_USER_SV57 - rnd_gap; \
> > > > > > -=A0=A0=A0 else if ((((_addr) >=3D VA_USER_SV48)) && (VA_BITS >=
=3D
> > > > > > VA_BITS_SV48)) \
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 mmap_base =3D VA_USER_SV48 - rnd_gap; \
> > > > > > =A0=A0=A0=A0 else=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 mmap_base =3D VA_USER_SV39 - rnd_gap; \
> > > > > > +=A0=A0=A0=A0=A0=A0=A0 mmap_base =3D (_addr + len) - rnd_gap; \
> > > > > > =A0=A0=A0=A0 mmap_base;=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > > > > > =A0})
> > > > > >
> > > > > > +#ifdef CONFIG_64BIT
> > > > > > +#define DEFAULT_MAP_WINDOW=A0=A0=A0 (UL(1) << (MMAP_VA_BITS - =
1))
> > > > > > +#define STACK_TOP_MAX=A0=A0=A0=A0=A0=A0=A0 TASK_SIZE_64
> > > > > > =A0#else
> > > > > > =A0#define DEFAULT_MAP_WINDOW=A0=A0=A0 TASK_SIZE
> > > > > > =A0#define STACK_TOP_MAX=A0=A0=A0=A0=A0=A0=A0 TASK_SIZE
> > > > > > > > I have carefully tested your patch on qemu with sv57. A
> > > > bug that
> > > > > needs
> > > > > to be solved is that mmap with the same hint address without
> > > > > MAP_FIXED
> > > > > set will fail the second time.
> > > > > > Userspace code to reproduce the bug:
> > > > > > #include <sys/mman.h>
> > > > > #include <stdio.h>
> > > > > #include <stdint.h>
> > > > > > void test(char *addr) {
> > > > > =A0=A0=A0 char *res =3D mmap(addr, 4096, PROT_READ | PROT_WRITE,
> > > > > MAP_ANONYMOUS
> > > > > > MAP_PRIVATE, -1, 0);
> > > > > =A0=A0=A0 printf("hint %p got %p.\n", addr, res);
> > > > > }
> > > > > > int main (void) {
> > > > > =A0=A0=A0 test(1<<30);
> > > > > =A0=A0=A0 test(1<<30);
> > > > > =A0=A0=A0 test(1<<30);
> > > > > =A0=A0=A0 return 0;
> > > > > }
> > > > > > output:
> > > > > > hint 0x40000000 got 0x40000000.
> > > > > hint 0x40000000 got 0xffffffffffffffff.
> > > > > hint 0x40000000 got 0xffffffffffffffff.
> > > > > > output on x86:
> > > > > > hint 0x40000000 got 0x40000000.
> > > > > hint 0x40000000 got 0x7f9171363000.
> > > > > hint 0x40000000 got 0x7f9171362000.
> > > > > > It may need to implement a special arch_get_unmapped_area and
> > > > > arch_get_unmapped_area_topdown function.
> > > > >
> > > > This is because hint address < rnd_gap. I have tried to let mmap_ba=
se =3D
> > > > min((_addr + len), (base) + TASK_SIZE - DEFAULT_MAP_WINDOW). Howeve=
r it
> > > > does not work for bottom-up while ulimit -s is unlimited. You said =
this
> > > > behavior is expected from patch v2 review.=A0However it brings a new
> > > > regression even on sv39 systems.
> > > > =

> > > > I still don't know the reason why use addr+len as the upper-bound. I
> > > > think solution like x86/arm64/powerpc provide two address space swi=
tch
> > > > based on whether hint address above the default map window is enoug=
h.
> > > > =

> > > =

> > > Yep this is expected. It is up to the maintainers to decide.
> > =

> > Sorry I forgot to reply to this, I had a buffer sitting around somewhere
> > but I must have lost it.
> > =

> > I think Charlie's approach is the right way to go.=A0 Putting my usersp=
ace
> > hat on, I'd much rather have my allocations fail rather than silently
> > ignore the hint when there's memory pressure.
> > =

> > If there's some real use case that needs these low hints to be silently
> > ignored under VA pressure then we can try and figure something out that
> > makes those applications work.
> =

> I could confirm that this patch has broken chromium's partition allocator=
 on
> riscv64. The minimal reproduction I use is chromium-mmap.c:
> =

> #include <stdio.h>
> #include <sys/mman.h>
> =

> int main() {
> =A0=A0=A0 void* expected =3D (void*)0x400000000;
> =A0=A0=A0 void* addr =3D mmap(expected, 17179869184, PROT_NONE,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
> =A0=A0=A0 if (addr !=3D expected) {

It is not valid to assume that the address returned by mmap will be the
hint address. If the hint address is not available, mmap will return a
different address.

> =A0=A0=A0=A0=A0=A0=A0 printf("Not expected address: %p !=3D %p\n", addr, =
expected);
> =A0=A0=A0 }
> =A0=A0=A0 expected =3D (void*)0x3fffff000;
> =A0=A0=A0 addr =3D mmap(expected, 17179873280, PROT_NONE, MAP_PRIVATE|MAP=
_ANONYMOUS,
> -1, 0);
> =A0=A0=A0 if (addr !=3D expected) {
> =A0=A0=A0=A0=A0=A0=A0 printf("Not expected address: %p !=3D %p\n", addr, =
expected);
> =A0=A0=A0 }
> =A0=A0=A0 return 0;
> }
> =

> The second mmap fails with ENOMEM. Manually reverting this commit fixes t=
he
> issue for me. So I think it's clearly a regression and breaks userspace.
> =


The issue here is that overlapping memory is being requested. This
second mmap will never be able to provide an address at 0x3fffff000 with
a size of 0x400001000 since mmap just provided an address at 0x400000000
with a size of 0x400000000.

Before this patch, this request causes mmap to return a completely
arbitrary value. There is no reason to use a hint address in this manner
because the hint can never be respected. Since an arbitrary address is
desired, a hint of zero should be used.

This patch causes the behavior to be more deterministic. Instead of
providing an arbitrary address, it causes the address to be less than or
equal to the hint address. This allows for applications to make
assumptions about the returned address.

This code is unfortunately relying on the previously mostly undefined
behavior of the hint address in mmap. The goal of this patch is to help
developers have more consistent mmap behavior, but maybe it is necessary
to hide this behavior behind an mmap flag.

- Charlie

> See also https://github.com/riscv-forks/electron/issues/4
> =

> > > =

> > > - Charlie
> =

> Sincerely,
> Levi
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
