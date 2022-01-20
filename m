Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C985C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 13:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=av0SHU7zVhd4nc6NHTNinN8979eXGsPJcfuikerC6bw=; b=ppiAo5+puqPPAf
	+Xsp7sOt+QHTGaHwjv2FtNyK/xdGVcCjz0HJpJZTo8Qxgmohq2zqxOD9H7zY+6AiONIIuydBaxLW9
	dD+x9L7sZNV+UUOW4YdD+0ZHXUbI1zky3L+sahLN0+VE21vqu5zIeekptLTZy0B83wNARvvwO70I0
	EsYPlxEtkCvSTn8tpAI7qKIdw7dEGi+cjjhrQ2X3XjLnwMNI+qu17gcxXz8tddvrjV85T+MJzbIBl
	Nrh+1RTqeUobzJtY8oe4MKHCqBM+kuMLNygJQAwddmybNPpAIN952cmkC475cRF7Q+gRQOHNu0J/c
	cRDO17QU7ctNnK8iH3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAXiv-00BlcW-30; Thu, 20 Jan 2022 13:43:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAXie-00BlWi-Gn; Thu, 20 Jan 2022 13:43:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1060261760;
 Thu, 20 Jan 2022 13:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735C0C340E0;
 Thu, 20 Jan 2022 13:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642686195;
 bh=D+Etye9r3fua1x02UnecAbZv0CalmuxTOWCQ+e8HzdE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cN8TeiZRwruoIRJkOoV5cCJrRkANf7l3v6f2dnF2xlBmUXAwCKjGM3kmUmmr7lfcJ
 1APkSDv+D1H3WQp3uuaV0kT/S8OeoYHOyoCm+Uh5ZwvEw7IhawBDNn89d/q5eyXPa3
 nAY2sqd8hpAZSIAYJGf70xVxfIBc+dqte1gPEuhjwCNzY97jFtY3PEtY924x+w0WZd
 wAeTD/djlb2LaOfPp5PAZ48mZs2FwdBxQt7SiLMX8KePhQm69b789EqQ8wWQDq0dC/
 8Od7DRhnmvf6YwO+Awvtgi4eoym2J8Zy/zeuP32XDNFMzEGlHelD0Dh2qQJ7xmBcHR
 1Xfu4zn6tGfTQ==
Received: by mail-vk1-f179.google.com with SMTP id b77so3594451vka.11;
 Thu, 20 Jan 2022 05:43:15 -0800 (PST)
X-Gm-Message-State: AOAM531yw9rzAA/0WweldskW94FnApnouNS6U415B2XIU6ZXOz6EqCS2
 jMfqz08C69ikeC6jcsc4/1hI7BXjouUZ0o89pAY=
X-Google-Smtp-Source: ABdhPJxsPoD4QKSG5cjRmiwRNbBq9kp7PjD2iW5iWTPRRES5wTkmV/37UExZW0GDHhLl6tuiT3nFW4CEpN2qDzbKvC8=
X-Received: by 2002:a1f:2844:: with SMTP id o65mr15161979vko.2.1642686194514; 
 Thu, 20 Jan 2022 05:43:14 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-16-guoren@kernel.org>
 <CAK8P3a0Mr2m2dVoVss59cN-9X7GVBD29VQLo3m4xswRznk_WUQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0Mr2m2dVoVss59cN-9X7GVBD29VQLo3m4xswRznk_WUQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 Jan 2022 21:43:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTGD_Ks2pO4jXx+QbiLV4nkjzk6mP-xKJOCvHtGTeFfOQ@mail.gmail.com>
Message-ID: <CAJF2gTTGD_Ks2pO4jXx+QbiLV4nkjzk6mP-xKJOCvHtGTeFfOQ@mail.gmail.com>
Subject: Re: [PATCH V3 15/17] riscv: compat: Add UXL_32 support in start_thread
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_054316_629978_5F7A4D76 
X-CRM114-Status: GOOD (  14.90  )
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

On Thu, Jan 20, 2022 at 9:39 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
> > +
> > +#ifdef CONFIG_COMPAT
> > +       if (is_compat_task())
> > +               regs->status |= SR_UXL_32;
> > +#endif
>
>
> You should not need that #ifdef, as the is_compat_task() definition is
> meant to drop the code at compile time, unless the SR_UXL_32
> definition is not visible here.
I almost put CONFIG_COMPAT in every compat related code, because I
hope the next arch that wants to support COMPAT could easily find
where to be modified.

>
>          Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
