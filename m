Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1839FC48286
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 02:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Vhl8/7HlVxl1pSq6+l9a5KKkGKDBwH9YFMmZulOpBI=; b=3/t+WIFo8Z5RAJ
	qShQIJKwx6TKOxkCIH8VpsC9SZgz3kcH1NX5m9cIRNb3TKITEQg6P6WvSMvaiCpOeTTakMOHT9Mcq
	ZCePDzE3KonGJQwhnuoX0ZXRmFD3oZAuAQd9mfRo1wube8wj3hM0FbtRCGXwv+S4s/EJcPuZVoUEf
	4nvWAPet1OX1zKdrM0Ve7b+C38suZh9gC4BdmUiX9COQqrc39mfNFuKy5M5VOgm8+ChwwfArEXXH1
	d9vYKCKcJOc6aNTz6nD81o+4E8wfZeoC8QGbZYQJxBeUqZGN1DxQMYtVMXC8EWwQljNJABicuEPMg
	K8GBJQMAw5nRzD7zEa2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVjHr-00000009t5F-40sE;
	Fri, 02 Feb 2024 02:28:15 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVjHm-00000009t3I-1pBy
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 02:28:15 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6e118da997cso839908a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 18:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706840889; x=1707445689; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nH6kvi7IzHM1HjT9d3ebo606kaCmtup5eOU1YOyCeeQ=;
        b=fQV76b5jIetAzjlpxyNjQAle0/vx6T5ABwXrklGBuWPqFvVjHKx8QD783o1PFsbo3L
         +x0K5f7cxtB0lrwgqL7IgPzJQ/G+c0DmhjJwzCbZEITYtxaImQMp3o5a7abfSvMO44oA
         POdD0cMW+shY6SFefrjwLfYoSXgVxN+Qj5RotrlptP1LjZlW7iAu1K84xP97/7mfwhQV
         rkA4+HsSb5pvH+xtJ/g3skM5rqbzxU9NbMtMUa1HuXZPmUcFdLQl1tLbTqiM/CsEUH68
         oknvT74GTryBuxMknpg/vVAdisbO71SLlHQEwgt/sz+V2FTLcP8lU90/xTfNzID0HAYj
         +B1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706840889; x=1707445689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nH6kvi7IzHM1HjT9d3ebo606kaCmtup5eOU1YOyCeeQ=;
        b=Z2Eo9UpLBMHAn9MQObeLQXUWqQUF68FuUIIqc2wm3BzZnv9PMwGo6x5yWSPkCNbOwk
         t2zdMjj5+fclc8E4to99QjpHX51ffBpb6T/UczLXplpxKVVzkPJ9kzsMztkO+s+9OJNN
         7k368NUGhJHGLVXj0H+P5/B37iqMSFIP0J8YpgosA9I52dpQB5/f0mhSL/hEFCoFKnDl
         RQJUAuOSDcnmX8C+LlhHf6cydLz8pO3PbTXdOkndEzUxaff+32xWtr8XG5Lr7jsnASpN
         XPVKpuvTXCfm0yVDtcy/bXnMkFtjLCAz/rK95CBdIto+Ln2GnxgzO361iVtt7itYMHNg
         aqLw==
X-Gm-Message-State: AOJu0YyTMekg71GmMhVkZcklzoqON/dfE8BzARLaBOGWwJXdi+ee83wL
	EXQ65S7Z5l+X8noTNPboPTV3HtPg5K7is/OkPvvmUg62TkDXmUYFoGIS2/QwHv4=
X-Google-Smtp-Source: AGHT+IFp062ooy/IHYTf+Z1OQbUuwLGyLVscZ2fxBHLPNsW3kl1YytnGZuKwPGTv6LdCdXItOvcJDA==
X-Received: by 2002:a05:6358:6f9e:b0:175:f9b8:89bf with SMTP id s30-20020a0563586f9e00b00175f9b889bfmr754264rwn.22.1706840888844;
        Thu, 01 Feb 2024 18:28:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXzW8HfzfBFndPbvvprCc2R3w70/c3RF57w2kO5sNhkjXiUc1+iJh25RmbGSpHdo5iPTXeHAnAB7skw2x1KEoPntxLdqUFcfINGL9DWhTDZaEPfW02nxrhVVq93LOqGqNgq0r2qw1V7QZ4yQQb9qzK9vG4gCQm+HEhoLTBwLMa67+YJOLZ31OGsXEicpDP0DEqDcubfynAm/g8XPvNWtIf9b3BlmflK4EEeYcg2uN/vMC9b1V1V3JenxQ0f8Fdb7boDEqhfd/fOEWa8BjnidQ1VNbmJzh8ygiJqy/NzNF8GnnxzaQLPE/xjCNrGBSeDM8QyHJD2o/RIpcqCU7zdkZSx+UdVKZjT1sw6QR6wH8bkgpWrrk+HXWDd54eS+Qerhkl4EURj
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id f8-20020a63de08000000b005d8aef12380sm524464pgg.73.2024.02.01.18.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 18:28:08 -0800 (PST)
Date: Thu, 1 Feb 2024 18:28:06 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/3] riscv: mm: Use hint address in mmap if available
Message-ID: <ZbxTNjQPFKBatMq+@ghost>
References: <20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com>
 <20240130-use_mmap_hint_address-v3-1-8a655cfa8bcb@rivosinc.com>
 <tencent_83E0AB36A9A3032E5A4C4AC864A311DF9406@qq.com>
 <tencent_068B3B7AE01AC67885E4369AF14109CE6A0A@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_068B3B7AE01AC67885E4369AF14109CE6A0A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_182810_702515_511F33EE 
X-CRM114-Status: GOOD (  41.37  )
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

On Wed, Jan 31, 2024 at 11:59:43PM +0800, Yangyu Chen wrote:
> On Wed, 2024-01-31 at 22:41 +0800, Yangyu Chen wrote:
> > On Tue, 2024-01-30 at 17:07 -0800, Charlie Jenkins wrote:
> > > On riscv it is guaranteed that the address returned by mmap is less
> > > than
> > > the hint address. Allow mmap to return an address all the way up to
> > > addr, if provided, rather than just up to the lower address space.
> > > =

> > > This provides a performance benefit as well, allowing mmap to exit
> > > after
> > > checking that the address is in range rather than searching for a
> > > valid
> > > address.
> > > =

> > > It is possible to provide an address that uses at most the same
> > > number
> > > of bits, however it is significantly more computationally expensive
> > > to
> > > provide that number rather than setting the max to be the hint
> > > address.
> > > There is the instruction clz/clzw in Zbb that returns the highest
> > > set
> > > bit
> > > which could be used to performantly implement this, but it would
> > > still
> > > be slower than the current implementation. At worst case, half of
> > > the
> > > address would not be able to be allocated when a hint address is
> > > provided.
> > > =

> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > > =A0arch/riscv/include/asm/processor.h | 27 +++++++++++---------------
> > > -
> > > =A01 file changed, 11 insertions(+), 16 deletions(-)
> > > =

> > > diff --git a/arch/riscv/include/asm/processor.h
> > > b/arch/riscv/include/asm/processor.h
> > > index f19f861cda54..8ece7a8f0e18 100644
> > > --- a/arch/riscv/include/asm/processor.h
> > > +++ b/arch/riscv/include/asm/processor.h
> > > @@ -14,22 +14,16 @@
> > > =A0
> > > =A0#include <asm/ptrace.h>
> > > =A0
> > > -#ifdef CONFIG_64BIT
> > > -#define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> > > -#define STACK_TOP_MAX		TASK_SIZE_64
> > > -
> > > =A0#define arch_get_mmap_end(addr, len, flags)			\
> > > =A0({								\
> > > =A0	unsigned long
> > > mmap_end;					\
> > > =A0	typeof(addr) _addr =3D (addr);				\
> > > -	if ((_addr) =3D=3D 0 || (IS_ENABLED(CONFIG_COMPAT) &&
> > > is_compat_task())) \
> > > +	if ((_addr) =3D=3D 0 ||					\
> > > +	=A0=A0=A0 (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
> > > +	=A0=A0=A0 ((_addr + len) > BIT(VA_BITS -
> > > 1)))			\
> > > =A0		mmap_end =3D STACK_TOP_MAX;			\
> > > -	else if ((_addr) >=3D VA_USER_SV57)			\
> > > -		mmap_end =3D STACK_TOP_MAX;			\
> > > -	else if ((((_addr) >=3D VA_USER_SV48)) && (VA_BITS >=3D
> > > VA_BITS_SV48)) \
> > > -		mmap_end =3D VA_USER_SV48;			\
> > > =A0	else							\
> > > -		mmap_end =3D VA_USER_SV39;			\
> > > +		mmap_end =3D (_addr + len);			\
> > > =A0	mmap_end;						\
> > > =A0})
> > > =A0
> > > @@ -39,17 +33,18 @@
> > > =A0	typeof(addr) _addr =3D (addr);				\
> > > =A0	typeof(base) _base =3D (base);				\
> > > =A0	unsigned long rnd_gap =3D DEFAULT_MAP_WINDOW - (_base);	\
> > > -	if ((_addr) =3D=3D 0 || (IS_ENABLED(CONFIG_COMPAT) &&
> > > is_compat_task())) \
> > > +	if ((_addr) =3D=3D 0 ||					\
> > > +	=A0=A0=A0 (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
> > > +	=A0=A0=A0 ((_addr + len) > BIT(VA_BITS -
> > > 1)))			\
> > > =A0		mmap_base =3D (_base);				\
> > > -	else if (((_addr) >=3D VA_USER_SV57) && (VA_BITS >=3D
> > > VA_BITS_SV57)) \
> > > -		mmap_base =3D VA_USER_SV57 - rnd_gap;		\
> > > -	else if ((((_addr) >=3D VA_USER_SV48)) && (VA_BITS >=3D
> > > VA_BITS_SV48)) \
> > > -		mmap_base =3D VA_USER_SV48 - rnd_gap;		\
> > > =A0	else							\
> > > -		mmap_base =3D VA_USER_SV39 - rnd_gap;		\
> > > +		mmap_base =3D (_addr + len) - rnd_gap;		\
> > > =A0	mmap_base;						\
> > > =A0})
> > > =A0
> > > +#ifdef CONFIG_64BIT
> > > +#define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> > > +#define STACK_TOP_MAX		TASK_SIZE_64
> > > =A0#else
> > > =A0#define DEFAULT_MAP_WINDOW	TASK_SIZE
> > > =A0#define STACK_TOP_MAX		TASK_SIZE
> > > =

> > =

> > I have carefully tested your patch on qemu with sv57. A bug that
> > needs
> > to be solved is that mmap with the same hint address without
> > MAP_FIXED
> > set will fail the second time.
> > =

> > Userspace code to reproduce the bug:
> > =

> > #include <sys/mman.h>
> > #include <stdio.h>
> > #include <stdint.h>
> > =

> > void test(char *addr) {
> > =A0=A0=A0 char *res =3D mmap(addr, 4096, PROT_READ | PROT_WRITE,
> > MAP_ANONYMOUS
> > > MAP_PRIVATE, -1, 0);
> > =A0=A0=A0 printf("hint %p got %p.\n", addr, res);
> > }
> > =

> > int main (void) {
> > =A0=A0=A0 test(1<<30);
> > =A0=A0=A0 test(1<<30);
> > =A0=A0=A0 test(1<<30);
> > =A0=A0=A0 return 0;
> > }
> > =

> > output:
> > =

> > hint 0x40000000 got 0x40000000.
> > hint 0x40000000 got 0xffffffffffffffff.
> > hint 0x40000000 got 0xffffffffffffffff.
> > =

> > output on x86:
> > =

> > hint 0x40000000 got 0x40000000.
> > hint 0x40000000 got 0x7f9171363000.
> > hint 0x40000000 got 0x7f9171362000.
> > =

> > It may need to implement a special arch_get_unmapped_area and
> > arch_get_unmapped_area_topdown function.
> > =

> =

> This is because hint address < rnd_gap. I have tried to let mmap_base =3D
> min((_addr + len), (base) + TASK_SIZE - DEFAULT_MAP_WINDOW). However it
> does not work for bottom-up while ulimit -s is unlimited. You said this
> behavior is expected from patch v2 review.=A0However it brings a new
> regression even on sv39 systems.
> =

> I still don't know the reason why use addr+len as the upper-bound. I
> think solution like x86/arm64/powerpc provide two address space switch
> based on whether hint address above the default map window is enough.
> =


Yep this is expected. It is up to the maintainers to decide.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
