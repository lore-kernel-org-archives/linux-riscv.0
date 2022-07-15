Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC8FC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 09:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9NHEQmDozdDrTucyyawYECXK0tdkZfesurMuhUH4AQ=; b=OmFD+3owUn3VG+
	aoi2iQM/CYOcB5/flgqE5GTHj0i9skOP9j2uWkLtjGeO+ZId7x33C2SOJcSpBQFEFYxFEP5hG/TyI
	y7fmZ3eqVScWSKjPM3FqhEP+BMpTwcvZsVZyzvdoIKY58yMaIsZqjrKCqUGwS4E7E1fVEjzD1B46v
	LSbJkXSyBihb/bDb93wwa5kaJOPVAXcLxVx/WYqGhdYLWbCkqXORwUgKOxyO2Iba3lsWOsK0VFTdD
	clGBIugAgkvNyBipEgLlsPYLCHicbQ3xZga7UyvsimtAEtmWkyrBVP8Uq76xYcRdOXQuPQuLm70fq
	jw8XvunJPmUmobEHPh1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCHBc-005wt7-64; Fri, 15 Jul 2022 09:00:36 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCHBZ-005wmp-HN; Fri, 15 Jul 2022 09:00:35 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N4hex-1nVpAS2LJ9-011iCP; Fri, 15 Jul 2022 11:00:27 +0200
Received: by mail-ot1-f54.google.com with SMTP id e1-20020a05683013c100b0061c1a6b8d11so3067806otq.8;
        Fri, 15 Jul 2022 02:00:27 -0700 (PDT)
X-Gm-Message-State: AJIora+qMzwevavn3zUJ4IOFtjofau4TCRaEPQwo9+02U5db/nnyN8bL
	bmzMH8ZBCwq6E4YoSbT4Yz7XQXwK9b+BGxhN6+Y=
X-Google-Smtp-Source: AGRyM1tHW75qCujFy97ODmosD9Zq5/ZJz8LFlR+pPafKBIRkIjZ9IOLEvm6nWkFKYL4KxpjirK2nvE70QWAIuDMflXk=
X-Received: by 2002:a25:73d1:0:b0:66e:aee4:feb3 with SMTP id
 o200-20020a2573d1000000b0066eaee4feb3mr13106300ybc.452.1657872578352; Fri, 15
 Jul 2022 01:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220714214657.2402250-1-shorne@gmail.com> <20220714214657.2402250-3-shorne@gmail.com>
In-Reply-To: <20220714214657.2402250-3-shorne@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 15 Jul 2022 10:09:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2_HKMf8nMcSkK1_jyCEHEdzz=YiRmPvN+ACbPTafXJzA@mail.gmail.com>
Message-ID: <CAK8P3a2_HKMf8nMcSkK1_jyCEHEdzz=YiRmPvN+ACbPTafXJzA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] asm-generic: Add new pci.h and use it
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-csky@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-um <linux-um@lists.infradead.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>
X-Provags-ID: V03:K1:sbbPJbSwbNstZsCh1YKIQdqSvZ8lIStw/J5A7C5qc9qZ3PGS6Ws
 ENWdD8BfyceWoOld116RwXOgFKPrbRkAJzjt232KU6zxA0ZqvgasMXyWJ/CE0xGWVXap51B
 1ftQzhkMMLNs5YCQkeZu7vbifdISL44/PWrIh2FXMPX/aOSiVPKB95cmLrp11k+OSZohpTW
 t+YTRzIJFxa8p8RH9AjeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:i+GtSbM8IeA=:cXTVJUYWl6DXc0uIr5OFru
 VxaC5AExsB3AIKHk7p8yAis6XDUtIbI0T2IG2yLNCYXUzabd9pnGt8/wLUw8G9di+NzshwhZA
 frJ0JsaY0lxSpNQNrqcCRnZEIaXtMKRt9woJqIK7oHLTgYJMojP/0lr4yRPOaRnEGBsE0XNt5
 YFGJCbcPKGQJF2U1qPNoqeacbxrB4XwqS8wcDrH/20lWPDaI9dVKAPpU2kq/bDPaPbiLtEztl
 PqOQe5PpOA+k7U4ZTmtOnEIK2BbZhc8aR5OKGuaYiDL3W4YqUXFeMMmxIWyUAkvxRL4k2UZhm
 pKIMl+RxsbpLptv/RlS0I0CmmxZxth7g9Xe826qN7/ml2F/MtvQfXb0R5TWblmI7lOuD6yxtH
 ktcMcYlEYurMWB+eIakkn0wGrTsiNmSDLuTF2bjxH2gzxgV1DUGfwO7gnhOJTutstLm7Kc6kf
 ao6Zpz2xYhPSSwU+IRMQL2CFGvHhMcDdGNFu7dxvvTaWZkXKJPzVr55HyFktJqJq6C/oyNjQG
 QzdcVI1spmhmfI9wKNWyn9LRsfNqTTVvNpm5yAgXI8bdix8dPd+RYnasqad/WnMeLHB69wh5/
 9wUPZdgnri29LmfD482LNHrLOZUvchb0Cc6AgIFUg7n5SwsNU6XoL68QHzz/bBUUqeuPSOLhl
 GuWaRzH8Fp9ook9MYuIcvI1sVBvt0ycYn+iyLlsfMDNMi21mJPybQJyHVa5hRsdqBOfQjBO4z
 T9kXOdFCFrXjDjRQvAdfCdYMgWrKve7ZKzLhOpu5w+pgunSQ8w7CvgPXS9yNUiTlJ4FAiyXIp
 QPISPqzechm+75eyasA8St88UM0fTrm9CUmy/bU2yymhHT09kZ8xJOQzJ20+Hunzg6s/TxsuC
 m6zNHAThXz/xgW2e9LDw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_020033_893949_0F8338D5 
X-CRM114-Status: GOOD (  20.84  )
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

On Thu, Jul 14, 2022 at 11:46 PM Stafford Horne <shorne@gmail.com> wrote:
>
> The asm/pci.h used for many newer architectures share similar
> definitions.  Move the common parts to asm-generic/pci.h to allow for
> sharing code.

This looks very nice, thanks for doing it!

> Two things to note are:
>
>  - isa_dma_bridge_buggy, traditionally this is defined in asm/dma.h but
>    these architectures avoid creating that file and add the definition
>    to asm/pci.h.

I would prefer if we could just kill off this variable for non-x86, as it's
only set to a nonzero value in two implementations that are both
x86-specific and most of the references are gone. That does not have
to be part of this series though, if you don't want to address it here, just
add a comment to the new pci.h file.

>  - ARCH_GENERIC_PCI_MMAP_RESOURCE, csky does not define this so we
>    undefine it after including asm-generic/pci.h.  Why doesn't csky
>    define it?

Adding David Woodhouse to Cc, as he introduced this interface. As I
understand it, this was meant as a replacement for the old
architecture specific pci_mmap_page_range interface, and is ideally
used everywhere.

It's probably something that slipped through the review of csky and
should have been there.

As an aside, it seems the pci_mmap_page_range() cleanup was
left almost complete, with sparc being the only one left after
David Miller found a problem with the generic code. Not sure if
this was ever resolved:
https://lore.kernel.org/lkml/1519887203.622.3.camel@infradead.org/t/#u

> +#ifndef PCIBIOS_MIN_IO
> +#define PCIBIOS_MIN_IO         0
> +#endif
> +
> +#define PCIBIOS_MIN_MEM                0

We should probably #ifdef both of these for consistency.

> +static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> +{
> +       /* no legacy ide irq support */
> +       return -ENODEV;
> +}

And this can just go away now, according to what we found.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
