Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD97C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGy1ZGDJnoslQDcDWn+eSaoZ1YVyJqKoVsHHDU1SFXM=; b=Lh3V3zbvh4yMva
	DkbZUqVXakLcYKmF8fpwp95usdVLWkej6yRh6qnx3kj8ZLbAb19VEPOq+X2bddPApK8jHovOdfz8D
	OGF0AQdgwbD9+gkmRA/kej1jbS7cX/CKjQuSUsCvbAlzgjjx0po/BIPiEaqJysMyO07hGqvVurfJU
	9qt8Z9cbVS28v8RNQ9gbijVEVL9GySOkR2NtcDSzE8J3wPn/JdvDFXVq+1t2Jhmt04c8zg+YuFGMb
	YwSdwESUEyy5QI+ZJMYxNs2iIgEAL/HS+3u6vUd0NwBSYPefWj4lYDp3BH2qkhxc8t6T0yZ8bPTR2
	HKzzohK3USrSu9kiPA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEqId-0031Up-63; Fri, 22 Jul 2022 10:54:27 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEqIJ-00319h-Os; Fri, 22 Jul 2022 10:54:09 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MAOa3-1oLD9e04fj-00BwfX; Fri, 22 Jul 2022 12:54:01 +0200
Received: by mail-oi1-f177.google.com with SMTP id u9so5181706oiv.12;
        Fri, 22 Jul 2022 03:54:00 -0700 (PDT)
X-Gm-Message-State: AJIora8/0SxYjKXI2J/me4vPkXufQuiNGj11dYnx2/4+w5Cmf25gJ4Xq
	Rif7atoOzdFuzc7K9SEDqgHw5KiWNnteHGuIBHw=
X-Google-Smtp-Source: AGRyM1vy78FVr9qHehqDiblEj3V70Xauesbczc+NWbVsp5PyEl2CXocctR2Sg0IIOFpYE1nv6PajH1Yeg0LPhB77W8o=
X-Received: by 2002:a05:6808:1511:b0:33a:b4f1:5247 with SMTP id
 u17-20020a056808151100b0033ab4f15247mr1728223oiw.188.1658487239317; Fri, 22
 Jul 2022 03:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220718004114.3925745-3-shorne@gmail.com> <mhng-3ae42214-abe0-4fad-9fa9-8f19809fa4d9@palmer-mbp2014>
 <CAL_Jsq+_5-fhXddhxG2mr-4HD_brcKZExkZqvME1yEpa6dOGGg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+_5-fhXddhxG2mr-4HD_brcKZExkZqvME1yEpa6dOGGg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Jul 2022 12:53:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0FwLmFO6Ew6kkJv=rOGRdQ+cyXok4b1kRr1RQP499wKA@mail.gmail.com>
Message-ID: <CAK8P3a0FwLmFO6Ew6kkJv=rOGRdQ+cyXok4b1kRr1RQP499wKA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] asm-generic: Add new pci.h and use it
To: Rob Herring <robh@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Stafford Horne <shorne@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-um <linux-um@lists.infradead.org>, 
	PCI <linux-pci@vger.kernel.org>, 
	"open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>
X-Provags-ID: V03:K1:Ois1pY9iISignUToa3wgqdufvqaABUximEkOELApCizdnnGN7Ke
 TBcncExufjXzyU8p1LkZVpV9z2x+PPgLCYHRL96cDfyfx3lyZD9OhSAGKOq5uWUB3yzwSeJ
 KiKZ+cwWswv2YTLG+XqX6imC4FCjSLU5t6ce+FDFuhs/HkUB4dN3BffbmC1W0jcGDMKcRJj
 kKCTXmERNy4N0tCqJ/n3w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G45qrpPCGDA=:0GOFNWJZrR8xxwxA/CGbV+
 zepBOqFYeTATdA6xAZefZU0mM45Nwyf/MMqCxrog1lC8cGsXMpsUJYo0KgYN8xoDbwhJa/UOu
 YxrT6pV6/lN7P/Pua56RE7Hhv+7kT2mUuD6QSZacvU6eNP9NJCRm8XmIno84Y4MRe15NbEZwF
 AAAAu6i1UkVrI55isX3qKds0X4NEdXDnMNeSozX2aU2iBycD0lAuq9Pna9gJLSMKZlX/a577r
 8X9042iIAADKiFoDDjIa5wCKx44a3IVuWup0UdQvYmy9IfG8dMd9KyP/ho1gYl8LZpPmoBAZg
 cSqCRqcxoDGubZ/3XaE24xYXf7f3crqnkAVRfaI2nHl7NvVcmp1lH3IN8PNC+oJoTOhBiTXLc
 ZeP81lYbkxtvVpDPeoUWpKrK5WScncAmapxfs1DgnYgC7hzEvcvC51LKZccjtG1svqlELuxB7
 m54pM9BJt8PedLdjKemZGOOEVjnhkUBZX4/ljxGXiSZaGBSpepe7LIKh+s1VgMB41IkEVAFsB
 OPwJqLxlr6LDYaItjvRuPJH/GRLBFKcxWcMBuyPTgYGhcmYF+pvqwvrZXEw5GGj8mgOer9K98
 UgGKFQ/Kw7cG7xO1SzNB2BJBsasfH1MRO/x3eC7b33ZLVNWn9ONV0ycwuPmDji30Vua4SVYoQ
 7XzlD30pCWAhrKZ8932b6XLbjZzP4g4y8LiumBHFi+cG2Jm/Tsa4WuZoP1csB0GA+PY31wfwb
 PvheoVB/pi0rZWf0Bnl6sa8t4S8GCX0sJohNL/NVjTm4nlx9u3v7XlhafVL9dZG4yIpvNt8yE
 1mytlmb0qvjVCdNq70otZTbXyJYyEYpFIbn9qEQeciNHtNSo/+LLgFe4hSyAeXLPvyroL/k4L
 no67pjWClilSvQlEt4ArUSQmGog5E9KfUM/pVVvls=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_035408_123686_01EABDA3 
X-CRM114-Status: GOOD (  21.10  )
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

On Fri, Jul 22, 2022 at 1:06 AM Rob Herring <robh@kernel.org> wrote:
> On Tue, Jul 19, 2022 at 9:59 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > On Sun, 17 Jul 2022 17:41:14 PDT (-0700), shorne@gmail.com wrote:

> > > diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
> > > index 7fd52a30e605..12ce8150cfb0 100644
> > > --- a/arch/riscv/include/asm/pci.h
> > > +++ b/arch/riscv/include/asm/pci.h
> > > @@ -12,29 +12,7 @@
> > >
> > >  #include <asm/io.h>
> > >
> > > -#define PCIBIOS_MIN_IO               0
> > > -#define PCIBIOS_MIN_MEM              0
> >
> > My for-next changes these in bb356ddb78b2 ("RISC-V: PCI: Avoid handing
> > out address 0 to devices").  Do you mind either splitting out the
> > arch/riscv bits or having this in via some sort of shared tag?
>
> Shouldn't the values not matter here if the IO and mem resources are
> described in the DT (and don't use 0)? The values of 4 and 16 look
> odd.

I think it's different for the two types: For memory resources, this only
matters if the bus actually contains MMIO address zero. In most cases
the MMIO addresses are the same as the address seen by the CPU
and already nonzero based on the SoC design.

For the I/O port numbers, the port numbers tend to be more dynamic,
but you'd normally have addresses 0 through 0xffff on each PCI host
bridge with memory mapped I/O ports, so this can clearly happen.

Still, it seems better to not address the port zero issue in architecture
specific code but instead do it in the PCI core code. Ideally
we'd just use the 0x1000 minimum, which also helps stay out of
the ISA port numbers that may be used by things like
VGA or SATA adapters in legacy mode. The only reason I can
see for allowed smaller port numbers is for machines that have
a very limited I/O port window and do not have ports over
0x1000 at all.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
