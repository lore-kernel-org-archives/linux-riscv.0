Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A537C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 11:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ROnqoN2A545BV9y8yWjMlT1zZwSGziAiHOo6M+U79s=; b=FOwY1d3pzSFdLV
	7rkpuES95SAtiqua0Km+l562RlUvVdqwrYKbZqCpO6aN1v3mw7cVxebevyR85CEfP9+fAUrDmvNK6
	RmZd0qb9HdcBgNovNYxA5A0p1Ggq5RTNQfBfFuAxDFrMMCNg38T/VOWCivhsxn20JkZyREIda1vQF
	tpiahQuHW+VkbJawNy8bpOqP/r/MuZafY/Vag9zH+s0Ua/sLg1EIuqLpqHjYKC1ufifDYFIOfYaY/
	ad3Tm4E/3FBKJy50B26O9IQLnfZZl8nhK4gA/h7ankF2qg2enxucdSrjYhKLFvWIfT5addHYfZd8b
	cFnqVSrkO+KgRJsOL9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6t5l-00BA9W-81; Mon, 10 Jan 2022 11:44:01 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6t5E-00B9lh-PE; Mon, 10 Jan 2022 11:43:30 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mcp3E-1mYNHK0Snq-00ZtyD; Mon, 10 Jan 2022 12:43:24 +0100
Received: by mail-wr1-f46.google.com with SMTP id o3so26184634wrh.10;
 Mon, 10 Jan 2022 03:43:24 -0800 (PST)
X-Gm-Message-State: AOAM532AXi7whR9DEir54HfsqBP7yG5Pfo6ZF0CdudqYhzve1p00BenK
 NRJxRxj2z0B0PTLcSDk3Ozt8gbt8NpdsCtEVbVA=
X-Google-Smtp-Source: ABdhPJzLcQEl2WnX1Puj9mlVNbd4vaTr3cFkZQMjDOmTeJ+poLBbKI4XZ3sC+IOr25uQ9in4zKpCyj1iJaRs8pYrhxQ=
X-Received: by 2002:adf:fd46:: with SMTP id h6mr1566034wrs.192.1641815003810; 
 Mon, 10 Jan 2022 03:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20211228143958.3409187-1-guoren@kernel.org>
 <20211228143958.3409187-2-guoren@kernel.org>
In-Reply-To: <20211228143958.3409187-2-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 10 Jan 2022 12:43:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0E+2=BnKienWp_VuT2g=YcEfP81SJmgbrLWZbdhRXXrA@mail.gmail.com>
Message-ID: <CAK8P3a0E+2=BnKienWp_VuT2g=YcEfP81SJmgbrLWZbdhRXXrA@mail.gmail.com>
Subject: Re: [PATCH V2 01/17] kconfig: Add SYSVIPC_COMPAT for all architectures
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:b172jwCEoeCzNNA1xmuKEny0Q+Gvi4j7o2BomCG2lTNXXQ+P3Lf
 tk5jSp9MNWJikWRL93K3dxXDkIT4Sjydd0fhTg9RLhoAfqwEVHOmKjVD0/lB5bXpqe0A4bZ
 ypVOnrnj2ezcIy8Bl1W1z1ZH5wnaeIeWf8bM5VB5YylOqlqM3u1oitqJOF+jro2fgQ/1jsv
 o3hx5JJLGnku8iEDRUWHw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3zlBrqQVhJw=:l6pTv8siLTsK/pBuD9VGoo
 5VzShidTZ5SsGCGhXRi68VjFf15rO3q6m/7JvBu/bAIt0wuq/BEG06CrtMljlQVl076PI+vqB
 C0TVOOl9I3MNPSyjByYZHDIdDlkSvHsekdCR0AvBgEmJdQUfVz+17qih3A+1LYU9COBX+Pyf/
 ISvmDwuB9YA3RQRbXERSag/Gdgd8KxszLbs0WtEMeSGAQLCYudYnBHardSXSGWo03/2aHzqpR
 cZqQelb8Q6BzgW4Mo2ZP7MOg1QOGYXI7YlsjCPHPZ0OaJuvup2f/GzBkA1ug3HeMgSwc+e6/I
 UVN+CenUrpPtBHBeNdVoQJ+IWxOKdfqtOiDrnE3DVQ/rmw5vQwll6uplt06bfD2HB6bfbpwTc
 txAmgEju5owdsh1TUGMD5Ikfx5ij1C68utbc1YPAbbnMQtJC20IiVqo4D4WjtEGWD3dW6/+Ju
 DFQ/rny/pivbkc5Oi+XAZdpuwd7unURr1LW6+/RU3Hutetb1ZqAlCzW8cCYi++l6GJcyOmkcU
 KM8tUppfQDOfYFhVL8lKLLkqtk1nS7BNrv5EcwZ5O6G3kMtBWHD8r0aSfSkHD+k/9pjL2n4Ge
 eY4ln6hWxCsgRniFnHXLPa0oxt0psmi7uIgdjkPBR/5ptoo2r49y6UETZiDQFnj9gW+eZOqKx
 m4GICOslBp0IX2PcpzNsXOppHv89rkzM/iAre4oaiv4HzNf8P2sM09q4Ncr8tSAXuNKU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_034329_154004_78BF2F90 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

On Tue, Dec 28, 2021 at 3:39 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The existing per-arch definitions are pretty much historic cruft.
> Move SYSVIPC_COMPAT into init/Kconfig.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christoph Hellwig <hch@infradead.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
