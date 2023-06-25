Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AF3EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 21:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20v9IRiIBFO9RsdtKm0zNoQngzLYbMnABd/EM/Nl4ic=; b=yJ5XybvURFkONg
	t/eErKM0iPZbZ2jhvhNvt9xD2qSEmwF4+mi4aAPYjW8jDTA/JeY3sWH0ecpF5gMLN75N8IXo01oXm
	ClSC54y6FSkaG5UQVL+iAO1gBRx9wJptYuVFtF0jaF4I8WBbfnJZEqGwzdaCvKERkpuJ8NHwnkIr7
	FOghsI3B9QwdC/i3guDH4LB2TuDmzWSYkYS+cReE/SL9mCz8OfNkTCXBFdCbO2cexyU48OVAkldrB
	mSkOJk6s0Fs0fTK8WqTL4NgXB3eRBdEY9SmV17DhgDlqO1/ajCBnUhImoASawmev3y71oHMDXHsqe
	2IbUxdIlUqSAfC8JCWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDXUx-008m5p-1V;
	Sun, 25 Jun 2023 21:42:19 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDXUu-008m5L-0n
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 21:42:18 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-264-__5NTeNUOTOunLze3S7Sqw-1; Sun, 25 Jun 2023 22:42:09 +0100
X-MC-Unique: __5NTeNUOTOunLze3S7Sqw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 25 Jun
 2023 22:42:08 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 25 Jun 2023 22:42:08 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Evan Green' <evan@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: RE: [PATCH 1/2] RISC-V: Probe for unaligned access speed
Thread-Topic: [PATCH 1/2] RISC-V: Probe for unaligned access speed
Thread-Index: AQHZpiD8K74IXZi1x0Sk5pxi8WFXO6+cDCdw
Date: Sun, 25 Jun 2023 21:42:07 +0000
Message-ID: <88d0b61ca01d4c1a87a17d3c34baa2a6@AcuMS.aculab.com>
References: <20230623222016.3742145-1-evan@rivosinc.com>
 <20230623222016.3742145-2-evan@rivosinc.com>
In-Reply-To: <20230623222016.3742145-2-evan@rivosinc.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_144216_575788_67281BB1 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, Masahiro
 Yamada <masahiroy@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, Li Zhengyu <lizhengyu3@huawei.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Evan Green
> Sent: 23 June 2023 23:20
> 
> Rather than deferring misaligned access speed determinations to a vendor
> function, let's probe them and find out how fast they are. If we
> determine that a misaligned word access is faster than N byte accesses,
> mark the hardware's misaligned access as "fast".
> 
> Fix the documentation as well to reflect this bar. Previously the only
> SoC that returned "fast" was the THead C906. The change to the
> documentation is more a clarification, since the C906 is fast in the
> sense of the corrected documentation.
> 
> Signed-off-by: Evan Green <evan@rivosinc.com>
> ---
...
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> index 19165ebd82ba..710325751766 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -88,12 +88,12 @@ The following keys are defined:
>      always extremely slow.
> 
>    * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are supported
> -    in hardware, but are slower than the cooresponding aligned accesses
> -    sequences.
> +    in hardware, but are slower than N byte accesses, where N is the native
> +    word size.
> 
>    * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are supported
> -    in hardware and are faster than the cooresponding aligned accesses
> -    sequences.
> +    in hardware and are faster than N byte accesses, where N is the native
> +    word size.

I think I'd just say 'faster/slower than using byte accesses' (ie no N).

There are two obvious FAST cases:
1) the misaligned access takes an extra clock - worth aligning copies.
2) the misaligned access is pretty much as fast as an aligned one.

Even if you find it hard to distinguish them you should probably
allow for them both.

x86 (on Intel (non-atom) cpu) is definitely in the latter camp.
Misaligned copies are measurable slower - but not enough to
ever worry about.
I think that misaligned transfers get spilt into 8 byte accesses
(pretty irrelevant in the kernel) and then accesses that cross
cache line boundaries are split on the boundary.
With pipelined writes and two reads/clock it doesn't often
make a measurable difference.
That is definitely what I see for uncached accesses to PCIe space.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
