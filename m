Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CB0C88E5C
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 06:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VVC5xk94YCtDXzJgKXIwUPGxLeY5Bkz2gLheANJJG9c=; b=yPX4aDKi+kxoOO4VwazxZxTZKV
	zC91IEZoSwUXZZiMBMXTwfHIWLcPwK+w69Vbg19Y4muzgM6LVIbZSFsZcdPLVgj3S/AvlT+VhYrKx
	CuNAXh4b0kPFauC7drBKtDctKLbZ2BUt7juXUyPbgll8MDQNK22F5ckct6oCIAdFlVWA6ZioJVxbt
	gUmmNjjVr/VnMcgYhOwKg+IWliCI1qHikyNjqpuuRJkQMPIEMsrdqwM6mRWUv7Wg6FjYXV2sCauw8
	UNnx2/q6XEm5Kc5YyGnDAantco5QcAMKnGySG48Xvy3dfOCXNnyK26FvAT2tnAe4K25VTZSs/xinf
	sVCaHuPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jIg-00000008Uts-2PUt;
	Wed, 16 Sep 2026 06:39:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jIa-00000008Usp-40i8;
	Wed, 16 Sep 2026 06:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uVDBK2xNAXhHDNCHOU+SjarglqFyyWlJ3wc704FVprE=; b=JacOtMFOqa4NS+E/xhMesr8tBq
	e8hjkJVi3nV8J+dxRZwMO1hUD6uWQYzT5UkYIyzsZdENmpOsZxmN6MSKHU0P3Goyg2px2dXFAY/f1
	+bAFfZrYjjpTdj0TNcLuSxx9QhEyjl3ZP4Ikf1qwPAlPF3+QFKvhW05hKyz0TVMkSKz1WGqfXfkd+
	nKnB+EQw+zs26N/dKC5Mcl54YEzYlY4/ugLeWNa2Za7MXRBtD0iADRaG7KEbn1EsBZFSAPt5bGcoL
	iNkfGMtivUxZHLGUzgMWiCnDWpFW2iBZrHr37pWFY3vwMLlo8LgLinEt3x5O2WTkTjR6OEKenQBw/
	kcUCU4EA==;
Received: from flow-a5-smtp.messagingengine.com ([103.168.172.140])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6jIX-00000007XlV-2KSS;
	Wed, 16 Sep 2026 06:39:15 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id 0617A138019A;
	Wed, 16 Sep 2026 02:39:06 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 16 Sep 2026 02:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789540746;
	 x=1789547946; bh=uVDBK2xNAXhHDNCHOU+SjarglqFyyWlJ3wc704FVprE=; b=
	hM+QMgL4AS7CuAQEgPY/QESyH1qSIMZM/PiTjgz4TNQ7lYyddA3jppvmlI/5IRtp
	aLcPPSNyOwZ4ONFBjLRiTqDIPlY3kJ+iV4FjtzA/Jf9ExeZkGWFtHMAC1apX2a0o
	JxG9Sm/MY81KGVD79EG76UngndQxb50JJkMNvH391CRijk5PQKuEQLxqHqbhc7aw
	U6a9xwdt0VNRDZLHdO5kGUU4Dy1ykntORbxgDQvM1R9XJSRtFEPXz+ydch/mp5pK
	Vk4vumi5TLTNChz5cDYk6D26dHyiJTy5AwBer+/nPsYPOG3drXMIF0gaP31z2rze
	xJV1PP23jlnY8LgHB/VqQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789540746; x=
	1789547946; bh=uVDBK2xNAXhHDNCHOU+SjarglqFyyWlJ3wc704FVprE=; b=g
	gZJYzQ/CXO0ZSXUW9zkiwFdCtlScWZRoKQ59VDODFeKbchxdoJRfGVhNB6de1zAk
	Igmrs/HG/KIktDBDX5I62AOCECbxn3CR2QbyoBLBAbC3cEeponmdReOksRDiSe9q
	OTcPBrLridMkOw6nE1aScTu+vm9BOJTRg0cVXnmQ/RekVjvXfgGSAPeg0NIeMhBh
	8KtzxT0E9acGFkTvcgiVBxN0jUAPfrmFFpZqFDVEjJF7sR9+PWmJHcS79+es9Hqe
	Y+50DhmmirNy5aZpgXmGHT+b8LXtxiNGfE1XqVtVmARtuUlsPSt2BK2wlPS3A51z
	fM8arZOK+hOXDQfEkKw+A==
X-ME-Sender: <xms:fjmqatCOK7YHvubAqP1h1V4YHULodgdPceHZjBfh4g68lLmN8fzLew>
    <xme:fjmqamWCKZY-7ZZOzLlSDByX0z0N7hwZzF8jDjvQMoCxsQZT4SzA52-0Sef4q-dTa
    anOMFKCXiFZqd0YC2iWjXTsn2Wq8U_0tAkRYry5mfPZ2qM04ea2cRw>
X-ME-Proxy-Cause: dmFkZTFiOvX0hSiRFkM2Qokbvc+IueVqJCGvgtt3OAIf0qT3xs2bOXFJbjdsyY8EBf6a3G
    wBCuVkHp4QXzYkIot+hObLZCDrcnpZNKnpfFLgzQAVfSFunvh+182qDL/bjJdZsRhVnu9N
    Rg8qcQzNoSLXgIKivflL/NB+ZAAB62DKqF6eukoIpU/rwKNOR5bsSXqO1BYRbMg1zYNqN4
    oDPyOTYhMAJIKADNwdJOv6Ou9XDvSo8ddi0YiltF66PEiXc7a9FuDksrLfsfqL/XuqAsHP
    Y9CbQ4YvBgsWEAs7PYbhaU0vN1Tvx0ewh8X5yu5fjf+KRn2neEB4wnaNF9X+YH4Sh8f2IZ
    TMnCjUGn0ubvPi6ZhHHWHmRfG8Sb4PiHdpFOGZxXR/fGxogQNqik6N+b7W9Y66lFVF9kfA
    ZfgNIGxbV0r4VtA8proereo7T+tN2tZ3l+eECqT0E2xOtfLCzH6Sy45Pkr7MIiczYxZRTL
    ojXbeTO2DmADXmQu2KlswHGHk+E3MWyNQjGEYTIAL9pnYs19jLARyw5v7gwrdv3vVLVrn1
    yf0WILLhluhmhnW+96OjgVLZMQZsTe+SCOMhGafvJe3m0q/F8vb96Rzj20Mx8LYjh9lnUU
    YuFaw0rQJ8zgvbkLtbtjlx6b6GFIj5Ly0fkpKPiFmCaW0ccGDMIj4dDXXp+Q
X-ME-Proxy: <xmx:hDmqaoO298rcphhD8Jjlgl5XgjXhF7eGmlnys2eFqqLKSzN_7i2qzw>
    <xmx:hDmqatZ4pyaIgPMQWgMN7nnUJPUB3fmdsNJBMbsYR7ogu4OQHW5F6g>
    <xmx:hDmqamY-k-QYn5GnKcOegE_9hlIoeCFp_BuLjgqP_RN42SFCrdZ-oQ>
    <xmx:hDmqakTqA0lH3dlwfmObrHXkO03DNl8T3ILlter4bigIRFFkb_DrSw>
    <xmx:ijmqauV7wtCCxTe3hDFR956AK3ZE8qxavmJ2ZnsMA1jGXU98OwpJDD18>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id EA77F32A0085; Wed, 16 Sep 2026 02:38:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ArHA-gVR6p-N
Date: Wed, 16 Sep 2026 08:38:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kees Cook" <kees@kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Alexey Gladkov" <legion@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 "Jens Axboe" <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Message-Id: <081b2b60-e295-4cd7-b201-d996a88c5f28@app.fastmail.com>
In-Reply-To: <202609151758.BA5732348@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
 <202609151758.BA5732348@keescook>
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if available
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_073914_119679_70D9E855 
X-CRM114-Status: GOOD (  13.92  )
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

On Wed, Sep 16, 2026, at 03:06, Kees Cook wrote:
> On Mon, Sep 14, 2026 at 10:22:20AM +0100, Lorenzo Stoakes (ARM) wrote:
>
> Makefile:
>
> KPGZIP	:= $(if $(shell command -v pigz 2>/dev/null),$(PYTHON3) 
> $(abs_srctree)/scripts/jobserver-exec 
> $(abs_srctree)/scripts/parallel-gzip,gzip)
>
> and the same scripts/parallel-gzip:
>
> 	#!/bin/sh
> 	exec pigz -p ${PARALLELISM:-1} "$@"
>
> And then replace the /boot/ KGZIP uses with KPGZIP. Then we don't need
> to change modules, config_data, new users, nor cmd_gzip, etc, which all
> continue to use the regular KGZIP and the "use python" part for the
> KPGZIP case becomes is a 1-time cost?

Nice, I like the idea and this this will work. I didn't know about
scripts/jobserver-exec, but this does seem like a perfect fit.

I checked the other compression tools we support, and found that
zstd is another one that has built-in support for parallel
compression, so we probably want to have it there as well.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
