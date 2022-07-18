Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426DAC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 06:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wwfZy8e2XsTtpu0IpZ2wDUe1CQWRtlBaSikht+gKWwk=; b=wwBfslMNwSIxAn
	6JVEziNmiHbi629NYyJ69rBO+uPeWRlU9n+2YeYjU1LJd71q5KKhFSWyS1/CTOqgfZwHEzAhLxmrK
	sK9zKyWX5v9ZJJcXShICh52eD3NqEW8Pr+HquPpXAEV4/CMkKp7/88AZKPqL9kLPZ1s7PHMAPoYip
	5ma0L3o1EslqGONAjv4buRfyfvETC8KRnubWHhpRYKJrhOYzUjIOsTFjnmqJqeUlICuIhaWQTPpo2
	dkfZ3gPQLzjmouHfCk+I7MUATCCuKfKYhg9JSNCISiSuCMLlkUlV19O55xZ2CqjwCAT5PVWHvlhNv
	gLo8lxfwi+3+V3a8yF3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDKgc-00BKRZ-5K; Mon, 18 Jul 2022 06:56:58 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDKgQ-00BKM3-1q; Mon, 18 Jul 2022 06:56:48 +0000
Received: from mail-yb1-f169.google.com ([209.85.219.169]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MdNLi-1neGyl1QXY-00ZR0r; Mon, 18 Jul 2022 08:56:39 +0200
Received: by mail-yb1-f169.google.com with SMTP id e69so19254486ybh.2;
        Sun, 17 Jul 2022 23:56:38 -0700 (PDT)
X-Gm-Message-State: AJIora8dJuB95fBtaVOg0/GVwpsRmZ1YNNPisnTTUUd+iQ945xYmLcpa
	ibr3XT8vOH+LFPig/n1ajpTPNBSn8IDyBxZrj1s=
X-Google-Smtp-Source: AGRyM1vU8FO4VvXqJJe8h9tVAzt2Xq6mwcu486wLt3r26bRZC2xoaFetO/g9AVKDxyN/6vE3AHk71rISOL1hLEeUK6E=
X-Received: by 2002:a25:8b8b:0:b0:669:b37d:f9cd with SMTP id
 j11-20020a258b8b000000b00669b37df9cdmr25660893ybl.394.1658127396964; Sun, 17
 Jul 2022 23:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220717033453.2896843-1-shorne@gmail.com> <20220717033453.2896843-3-shorne@gmail.com>
 <YtTjeEnKr8f8z4JS@infradead.org>
In-Reply-To: <YtTjeEnKr8f8z4JS@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Jul 2022 08:56:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1KJe4K5g1z-Faoxc9NhXqjCUWxnvk2HPxsj2wzG_iDbg@mail.gmail.com>
Message-ID: <CAK8P3a1KJe4K5g1z-Faoxc9NhXqjCUWxnvk2HPxsj2wzG_iDbg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] asm-generic: Add new pci.h and use it
To: Christoph Hellwig <hch@infradead.org>
Cc: Stafford Horne <shorne@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-um <linux-um@lists.infradead.org>, 
	linux-pci <linux-pci@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>
X-Provags-ID: V03:K1:FXCLL6zFHFgjPAzsIqBI7zvCcKvxvE370dPsLMYemhwvVJVKhA+
 fV8YBJ0+oLQCmAPIeJWUXQfGrcGmcoHfEKZd2VDUTLLKHa+EKVJFmTbqHHIv7Twxpkn7JtH
 dGxlJHmkvfaWFXPcowq7wggcROXq+NuiXc0nCDRG7Ooe/Olp/c7Xnm+F4BaZ+26qkIQoEyr
 CB/bqXjRT62YIWqShhsjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P2Huf9Ea+7g=:/7FJaViopiOk6Bo/4QEHyL
 MyaIx3DZsEuMaIZOkDDkXznF4t5Ig9df3x+tSj0mWX0LJ2QTGjkqUxTNcC+IAaHQOw2HUn7Hx
 rs5KIo/QgVPrZSV54gXLLxoYSYLKMB9SdX0fc7tGSGjkYljyZBsFEB0UG9uoAXkSc5sn6dH8v
 f4YXoS+20eIYmTXEK+/O6EArmvfFPCufZRzGPWLLUgkuAVQDrQqiLiPuDsCc7krlnMB4jd+NV
 91XkXoCPOIDuc4qeO0lj4k6AN90vLz+INUAFiBK8NfHRgMcLqZGHleJ0UYVv0534tIxt3ENc7
 /Txs2H2Qhx4t1f1nbqDJmdpweLVA8BTapZ+sUfPyoumksudMO83FSaa3iDY/CI6uqJ0CUyDLk
 Gso671b/HYVoJKdEEXybphrcujCK7WIMp2Vdzr8sI56uwBRlw1TveZ8CwzcafBx55lrvnhK8n
 Qgw9XSEn7sx/KhnCW6/A5u94hd3U6+rOdlKA7l0tcX7OyL4up3OtIlunvyuG1a3CGoxV0qXz2
 gsH9MAFK+x66hvCMesJDjfbx2Q/rTxjSDtbCkDM/7lntckMWdXmVx4P4ytuxiEhzMueHUPfS3
 74MZc0hBqkt28PmMqLSYzkDrPXx5PRA6Ynl2mkNirE0c7XFCt38XhWzNY3wGptY7l6vZb7ijI
 o3wK7M425TGv/b4s63mrsAB1p4JF1iIrEy8oxdFcR3ldtxfiCfb6HssnV1fMAXLkdz0h8Yz58
 MgruDKERmNl+UgsbzxbONEttUNor7P3/LSll9Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_235646_441409_CC9A0A37 
X-CRM114-Status: GOOD (  18.25  )
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

On Mon, Jul 18, 2022 at 6:37 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sun, Jul 17, 2022 at 12:34:53PM +0900, Stafford Horne wrote:
> > Two things to note are:
> >
> >  - isa_dma_bridge_buggy, traditionally this is defined in asm/dma.h but
> >    these architectures avoid creating that file and add the definition
> >    to asm/pci.h.
>
> This doesn't have anyting to do with PCI support.  I think adding a
> separate header just for this that always stubs it out unless a config
> option is set (which x86 then selects) is the besy idea here.  I also
> think the isa_dma_bridge_buggy needs to move out of the PCI code as
> well.

Most architectures have it in asm/dma.h, which is probably the right place
(if we end up keeping it), since this is for the ISA DMA API.

I would copy this declaration from x86

#ifdef CONFIG_PCI
extern int isa_dma_bridge_buggy;
#else
#define isa_dma_bridge_buggy (0)
#endif

to asm-generic/dma.h and remove it from arch/sh to avoid the
one duplicate definition. The architectures that have the declaration
in asm/pci.h (arm64, csky, riscv) already get the asm-generic version
of asm/dma.h.

As mentioned before, it would be even better to just remove it
entirely from everything except x86, and enclose the four
references in an explicit "#ifdef X86_32". The variable declaration
only exists because drivers/pci/quirks.c is compiled on all
architecture, but the individual quirk is only active  based on
the PCI device ID of certain early PCI-ISA bridges.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
