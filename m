Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9B4C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 08:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Biw7K8hCXI7IRS9PV9KGU5LYpbENGES11QBZIXzo3s=; b=USwRxVDJLbDlVN
	yMJSe00mWMEKwrxgGM4DoWRiL2TRvRbmsuHJJ8pIBFBIxHRUhR592lfJzuylS2oMoCbNEGrEbdelz
	enPCg6gpnH1ygNQ9ReEZyqzud2z5Y5vHSxcOC8u8F08Qmpn8RX+L+pWWVv/HXLARF7jtgiVRg4M77
	q6rXmedEeAgu57c3Z5pfICBbNyjLy8gcsgLn1cAFIkco6MQZrvouCHRCthGCjXAzGJ5UIdnVLuPOU
	nd/WzWXkBmFj6npQtL+uRMqRU6cv4l3d73yl0xCKzCU4z8682qXoWcsrCo5kwse5gdsh13nrVLiDi
	LzODF1B5zzWrmAmPdUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl5EX-00Fwo9-LC; Sun, 01 May 2022 08:47:13 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl5EM-00Fwl9-Ry; Sun, 01 May 2022 08:47:04 +0000
Received: by mail-vs1-xe33.google.com with SMTP id x8so3072651vsg.11;
 Sun, 01 May 2022 01:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YeMrQTzuf2gRQtezWWafNVYSaUpuhBePEKDtQvKbaWw=;
 b=nWh9yV+kO8Q7Dem2PHaKx8kspjOWTvEYLzCFQFjnTu9qQQZQQqV7uGUKn2xK8RCOYV
 d29tKQlPggdptI+tPVWVkzfGVc6V5kujnWIFhshwWyTcSz1yCQQBQHznRNadgkgEK0Zn
 D8vgLMcPz5JIWDfHoJ7z5xaL8L2WVzlV9m56y/JLyPI0PjUBWD3YArgx2hQ6bmr8KL8x
 +uMkSzcr4RYR6554+4w5GjQHnZGzWWDBloOWQLCA30h9Nec7T+WotqVGq/5yZmNdrFHo
 URtDSAZR7mq702SxWU4FCHnTJ50bbyjW0Cc8u1e3GRSepWLfipSkHFaZ1Z4O3HaMt/2/
 znwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YeMrQTzuf2gRQtezWWafNVYSaUpuhBePEKDtQvKbaWw=;
 b=6ZnzxnT4qcGXPCcjgEuCPRtzatBSffkzutMC7hc6+E154TnapMvhgjiARFkwNC2fnC
 TGR5TSnSWgFGz1Yz/rospsSspQ2mYKfAXg6u3ELl2fnVpvDtuNj4VmeGqmIj91X2Xfj8
 uPPNW3LSXceats8Mx/4ju6evRhpp4vEcQZhGTz0KB2amWsv574Fy+kRJD6CzVkN6VMlN
 21irndNwnbdP3nEVX6B4OsdvRJavzA53LHAsWnY00i7aFvgZIzZTtvJxpLZz7GBcaBPK
 /d85WwvAM4408anRQFwlgKIgVKDLNvFZvjga9sIntHO4wnay0zAOSUgw3XDdNW13QQWh
 d9+w==
X-Gm-Message-State: AOAM531NAip41Ganb6bfaz/kpdssTl+GDv/tFZg1LCs8TH5KcCZkdV9f
 sVxTKm/PgA5jSdOaC+PBlivabOFtcGG+XOT+fxE=
X-Google-Smtp-Source: ABdhPJx9y9y0akz5HssQ3SXny9Vs4F60zx3/tiArR/BWCv18jYhs2liGZ4RSuGtueeNr/xqIkWAfYTXzJMlwfI//47k=
X-Received: by 2002:a67:b142:0:b0:32c:e806:a0b0 with SMTP id
 z2-20020a67b142000000b0032ce806a0b0mr1758746vsl.71.1651394821045; Sun, 01 May
 2022 01:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220430090518.3127980-1-chenhuacai@loongson.cn>
 <20220430090518.3127980-22-chenhuacai@loongson.cn>
 <CAK8P3a0LwJ3mMQMFkxGxr+umCMM3dKGRnLF+dMCmD5j43hq2sA@mail.gmail.com>
 <CAAhV-H6vPdLeup38YTj64Xxxk+PTact=DMJTs9efsa1b3t-y2A@mail.gmail.com>
 <Ym4qNILcz+W7dC9i@shell.armlinux.org.uk>
In-Reply-To: <Ym4qNILcz+W7dC9i@shell.armlinux.org.uk>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Sun, 1 May 2022 16:46:50 +0800
Message-ID: <CAAhV-H58HXicH7jj88BFUH8P9cGwXFGjgOoLvZubQsBst+zheQ@mail.gmail.com>
Subject: Re: [PATCH V9 21/24] LoongArch: Add zboot (compressed kernel) support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Xuefeng Li <lixuefeng@loongson.cn>, 
 Yanteng Si <siyanteng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
 Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-efi <linux-efi@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_014702_929255_E3814673 
X-CRM114-Status: GOOD (  27.13  )
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

Hi, Russell,

On Sun, May 1, 2022 at 2:35 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Sun, May 01, 2022 at 01:22:25PM +0800, Huacai Chen wrote:
> > Hi, Arnd,
> >
> > On Sat, Apr 30, 2022 at 7:02 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Sat, Apr 30, 2022 at 11:05 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > >
> > > > This patch adds zboot (self-extracting compressed kernel) support, all
> > > > existing in-kernel compressing algorithm and efistub are supported.
> > > >
> > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > >
> > > I have no objections to adding a decompressor in principle, and
> > > the implementation seems reasonable. However, I think we should try to
> > > be consistent between architectures. On both arm64 and riscv, the
> > > maintainers decided to not include a decompressor and instead leave
> > > it up to the boot loader to decompress the kernel and enter it from there.
> > X86, ARM32 and MIPS already support self-extracting kernel, and in
> > 5.17 we even support self-extracting modules. So I think a
> > self-extracting kernel is better than a pure compressed kernel.
>
> FYI, kernel modules are not self-extracting. They don't contain the code
> to do the decompression - that is contained within the kernel, and it is
> the kernel that does the decompression. The userspace tooling tells the
> kernel that the module is compressed.
I call "self-extracting" here means we don't need out-of-kernel help:
kernel decompress doesn't need the bootloader, module decompress
doesn't need kmod.

Huacai
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
