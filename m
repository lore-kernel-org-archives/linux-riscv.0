Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBFFC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 05:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amJKEFqjaonx7gAIUcYuSiw5RIVKzASwyumxG/9AYuA=; b=tF4cRsbuCjScbI
	fVK5NPW2kURVpmApuuRpJhy9K1xoHJCnfxGqNKAMT4AcoKQTPdI63Ana3ZFvSF/DF8eh+t7ABUmyE
	NzJBPLYTjP8a1KSdZ8i4t2nhhlbUz0C+e7dFeXdNLW5eX8OsSnL/Y9Wjs2Arf7BNPYz6mjcuwbUHM
	A6Yp5n7mD8P2UkvxGne+3RBoSkXW2OECdMz67gc+WkeWsxJdXfPOKeS2EbL5sUyY3A3h42mcpwJjX
	uha5yUEdM5mZ4jdhqHfdpJrbCKYQh/v5/+m8eKVayv/6oS6rC4Y3JQy5kEfCc3K76P2zf9bixBDD0
	HesXCGoQUWo02B+M2gcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nE33w-005x4n-DF; Sun, 30 Jan 2022 05:47:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nE33j-005x27-NV; Sun, 30 Jan 2022 05:47:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 231F2B828BB;
 Sun, 30 Jan 2022 05:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8563C340EE;
 Sun, 30 Jan 2022 05:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643521648;
 bh=CFf7eYVsi2vfAFWFWWepRognCnx0qrq4RXbGFOfmx9c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NPAxCNaLTo4erRllOLayMfPUYfUOW9vn8x0aWJepTSfSmFE6cR2eBffVk6qUyvNdZ
 v3wz8lOjDUgZTz25phHKEAzLGLT1NkVJp8AuWL2ej8PZnZfdv3FX2p4yUbOsNvaLc7
 ad40OrZwitXivHc3LwQ2Z7IEwtIIa8viQ4z7g/2YsK4NgOLtEh5wOFyP+H7XH8E0bH
 pTnTrhCsz05K8/+IBl0hK4EOqoejHMaIgxXuF2bpco6R1FaW174GiCmOEtCUbSh1QD
 /vc0+bphJ+UVCMo6QbiAw+ofwI5iAXuGl0/v6S7yyySZLfYvKOlRd2M4ToNLzAH7hS
 zlTbUHM35vSDw==
Received: by mail-vk1-f180.google.com with SMTP id n14so6323370vkk.6;
 Sat, 29 Jan 2022 21:47:28 -0800 (PST)
X-Gm-Message-State: AOAM531lJJD+nEwSW+NKb1D1mk0fO90EGp+e20AfLnKL+jI9VA7fAFx4
 davAv05vgCWxuHa03tSm+XZZi6MG8DznoLjdb8k=
X-Google-Smtp-Source: ABdhPJxLWGk5CQ+MBw+7fcsDq1E1+v+xghtxN0mZV6UTIH/aZ2JMAd2qn/Emr/MxaYw7Fbc8Rg4biBjIlqvQekFa+1Q=
X-Received: by 2002:a05:6122:1306:: with SMTP id
 e6mr6299952vkp.28.1643521647659; 
 Sat, 29 Jan 2022 21:47:27 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-7-guoren@kernel.org>
 <CAK8P3a3_kVB78-26sxdsEjb3MMcco6U55tc7siCBFZbJjyH6Sw@mail.gmail.com>
In-Reply-To: <CAK8P3a3_kVB78-26sxdsEjb3MMcco6U55tc7siCBFZbJjyH6Sw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 Jan 2022 13:47:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTThb8_-T0iOFVZoJrvZqeFvjfWB+AdFyOwtGhN9aG-MQQ@mail.gmail.com>
Message-ID: <CAJF2gTThb8_-T0iOFVZoJrvZqeFvjfWB+AdFyOwtGhN9aG-MQQ@mail.gmail.com>
Subject: Re: [PATCH V4 06/17] riscv: compat: Add basic compat date type
 implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_214731_957071_CAB7A9D4 
X-CRM114-Status: GOOD (  13.64  )
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

On Sun, Jan 30, 2022 at 5:56 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Jan 29, 2022 at 1:17 PM <guoren@kernel.org> wrote:
> > +
> > +#define COMPAT_RLIM_INFINITY   0x7fffffff
> >
> > +#define F_GETLK64      12
> > +#define F_SETLK64      13
> > +#define F_SETLKW64     14
>
> These now come from the generic definitions I think. The flock definitions
> are just the normal ones,
Yes, it could be removed after Christoph Hellwig's patch merged.

> and AFAICT the RLIM_INIFINITY definition here
> is actually wrong and should be the default 0xffffffffu to match the
> native (~0UL) definition.
Yes, native rv32 used ~0UL, although its task_size is only 2.4GB.

I would remove #define COMPAT_RLIM_INFINITY   0x7fffffff

>
>             Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
