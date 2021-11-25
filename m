Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA7BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 10:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbRyvE6bfOZOTG2MfrthKo2Amiabj2xrwxJqv4ATmYs=; b=QpNGRhlcmmbR1/
	f57XThfvKlsJ+fRUQf1cYVRs//3iipsiHMU4swrKz7tNCVrZDWKqPi4Fc5kQkVRtMvRyToZRFvk6u
	fjHtgm/rETwun+oHU6UnxpP8sy2KWBL9n7GLKJNorNSNDEgYRW0yoPex71cjcCtuaiDsuq/Wvxa0I
	IH+FWumnnMbpx1SKXjwH6tEXgqcPrQjDGP11DMAW8BwU0OqXAD5EVvVKi1wULSnw2WWdDm3UtzCIL
	j+34tESKvsdHo6rNVcEzUWdnT6PT2Wra1cyelDFQ2vcZ6hPMJWm2vdyeLkv8G5MrYeVFqosJneLGG
	LoMTihCyDtQ9KSoR3yMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqCQz-0078Ti-MU; Thu, 25 Nov 2021 10:56:57 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqCQx-0078TJ-MC
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 10:56:57 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 188so3584482vku.8
 for <linux-riscv@lists.infradead.org>; Thu, 25 Nov 2021 02:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=19XxhN1cPhuBovF+Xh4gn1b03Gy0GpCCVXwbXEhLi/Y=;
 b=g4HEKhiSSbHpHj5yFd7PfkOCC7OjRDa51IdTeUlVTfAai66FDIoyoUR79zc+fQdbz8
 tc19wl9pyY+DEs1Xm1MIoS1J4IdjHoGTNF+3mryBMD6ckQs32XzAN1SqwFz9BcnloFXK
 tQUXtmCqgQZDGSKbAfvUMhM8RF1byNDRfaALLRJWWSCiGK4n4ishPhzsVn9InWnUBVeK
 yBatM+MagxOFcS9yfsEcGz7aRivqX2fYTK+L9aHZyHr4H3xhnvnMHBNfruDN1KHILche
 hZJuQHctID1iokGll0VabYZIhGU5u5KwNIwgOHXrT6M4E9/M3Gf0QoediHeCnYvum+Sh
 GRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=19XxhN1cPhuBovF+Xh4gn1b03Gy0GpCCVXwbXEhLi/Y=;
 b=ryyB4tN+Y0poM1ewomDuArMoo2KIvKArOBcV2WzqOw7famffFl4UzTy1e8LuI9XbxJ
 648xyGaXkq3SLnTwxU1sCjsXLMU8OS0iCDczdZgf8kiTZ9VUvOVbM03F8zukPaU1zPX9
 KLd9WIKvmSJzddsQpRKr7Y0OLqSZXIZGu1ZURYgmH/SefRfQIIkiL6IY9XsjzXhJxH2d
 IuaDFrmZi723s+dAC/2oUuxglrtAQDZ2qsh09nASF3mhER0tEU8jbbSO48IBDAiwzMY2
 50CcCSmEcA0HnzY41+EPPEhKa2JSUKCaJDW56oc8gYjk8h68zsDbH0RwZ2Fq5foiKbxA
 DVTw==
X-Gm-Message-State: AOAM533B4kly8MQzGvBMGCT0KzjW1Sk6du0L/KSfz1nJKrbMQaul0CEE
 qUzVFzaxhSVL5rR2Je2oWwxqbCtmHrQnV7/iCMc=
X-Google-Smtp-Source: ABdhPJw08+vO8xvImD361nCgmPTJ+oAFgtqZIP1QpMejp7pxO+ovFtVtHwaNa0Pb3/X68lyALNXkewo6EsgomvUodzo=
X-Received: by 2002:a05:6122:8cf:: with SMTP id
 15mr9414800vkg.16.1637837813643; 
 Thu, 25 Nov 2021 02:56:53 -0800 (PST)
MIME-Version: 1.0
References: <20210929172234.31620-1-mcroce@linux.microsoft.com>
 <20210929172234.31620-4-mcroce@linux.microsoft.com>
In-Reply-To: <20210929172234.31620-4-mcroce@linux.microsoft.com>
From: Ley Foon Tan <lftan.linux@gmail.com>
Date: Thu, 25 Nov 2021 18:56:41 +0800
Message-ID: <CAFiDJ5-OJzWWR0hSZDsuAmxzxTE7cRR9Bsetpfh5vvrTxzkKPw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] riscv: optimized memset
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, 
 Bin Meng <bmeng.cn@gmail.com>, David Laight <David.Laight@aculab.com>, 
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_025655_749993_1C579582 
X-CRM114-Status: GOOD (  14.05  )
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

On Thu, Sep 30, 2021 at 1:56 AM Matteo Croce <mcroce@linux.microsoft.com> wrote:
>
> From: Matteo Croce <mcroce@microsoft.com>
>
> The generic memset is defined as a byte at time write. This is always
> safe, but it's slower than a 4 byte or even 8 byte write.
>
> Write a generic memset which fills the data one byte at time until the
> destination is aligned, then fills using the largest size allowed,
> and finally fills the remaining data one byte at time.
>
> Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> ---
>  arch/riscv/include/asm/string.h |  10 +--
>  arch/riscv/kernel/Makefile      |   1 -
>  arch/riscv/kernel/riscv_ksyms.c |  13 ----
>  arch/riscv/lib/Makefile         |   1 -
>  arch/riscv/lib/memset.S         | 113 --------------------------------
>  arch/riscv/lib/string.c         |  41 ++++++++++++
>  6 files changed, 44 insertions(+), 135 deletions(-)
>  delete mode 100644 arch/riscv/kernel/riscv_ksyms.c
>  delete mode 100644 arch/riscv/lib/memset.S

This patch causes the Linux kernel to hang if compile with LLVM/Clang.
Tested on Qemu.

Steps to compile with Clang:
make CC=clang  defconfig
make CC=clang -j

Boot log:

[    0.000000] Linux version 5.15.4-01003-g23eeaac40da8 (xxxxx@ubuntu)
(clang version 14.0.0 (https://github.com/llvm/llvm-project
6b715e9c4d9cc00f59906d48cd57f4c767229093), GNU ld (GNU Binutils)
2.36.1) #151 SMP Thu Nov 25 18:41:47 +08 2021
[    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
[    0.000000] Machine model: riscv-virtio,qemu
[    0.000000] earlycon: sbi0 at I/O port 0x0 (options '')
[    0.000000] printk: bootconsole [sbi0] enabled
[    0.000000] efi: UEFI not found.

Regards
Ley Foon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
