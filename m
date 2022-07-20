Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B25C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 15:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzECndXv+V4TDXMT+kjoozUNSLjWNwJuVcoe2C6MZnY=; b=z42Sl12mNQMFTl
	1fKFCkpdTfC0yF4LzP03GLIqKDnwC/DvqAqc9LhBsIYMPBaoOvAMHZHJS58ZdOd/kjimNkNHiVfsx
	sDJZ+OZIU+bL0yffuwIOXKI3/srgE+PFaYz6EpFiCaqhN2cFVCgz6bIGkZEbksP2VDWYkw0SH+jc2
	Imr96psvCayX9uPFcgK3fnv7Byzz1Qm/x0kzLmKLhz6cptLmT1QsdYxf3tETl99dXNXjjgQ3j2Ohz
	2TyyblE6vcgTgG5MOmG7TIF25QKoBfZI1AgyOoWWhz8QavmpKuPSjC/DsBJcwTlq1vqEH4e8d1Zcx
	Xi7rtafL4suxO/0AmvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEBNm-007OeS-K4; Wed, 20 Jul 2022 15:13:02 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEBNZ-007OXh-Qd; Wed, 20 Jul 2022 15:12:51 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MpUQm-1niR3S07dk-00pqW9; Wed, 20 Jul 2022 17:12:46 +0200
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-31e64ca5161so38586067b3.1;
        Wed, 20 Jul 2022 08:12:45 -0700 (PDT)
X-Gm-Message-State: AJIora9ULPPt/0o08FNeB53ikUhhDAzMiMm6sFQNrY1V3hcfzuo20uvM
	yg/kEm5BVhnAz704mch/62MvNro8WoCvBwZUjII=
X-Google-Smtp-Source: AGRyM1tzl4MfM0IyEBCPbwAniHdv8s1Jto4KbP4qg6fnZySPX2LxyYvKTOEczET3MGSeEbAV4lW/gb7Lp1ezV8Pk71I=
X-Received: by 2002:a81:493:0:b0:31e:6ab9:99a5 with SMTP id
 141-20020a810493000000b0031e6ab999a5mr3756881ywe.209.1658329964540; Wed, 20
 Jul 2022 08:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220720131934.373932-1-shorne@gmail.com> <20220720131934.373932-4-shorne@gmail.com>
In-Reply-To: <20220720131934.373932-4-shorne@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Jul 2022 17:12:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1DMqdeawhjwCRd1W145J-NSr5c9B_waqsddGw3X_oZ_g@mail.gmail.com>
Message-ID: <CAK8P3a1DMqdeawhjwCRd1W145J-NSr5c9B_waqsddGw3X_oZ_g@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] asm-generic: Add new pci.h and use it
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Pierre Morel <pmorel@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-csky@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-um <linux-um@lists.infradead.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>
X-Provags-ID: V03:K1:NcM1f1mBEC/UeuXhe1igFsrzapOIDh5T9/8MpPuXnT7uh8zWWkv
 3zo0O0pFnbw2u/pEz7cEmpSREyx06xs0ZCye7Dz4tSLoSS46/COHsbE0M8xyRUqILZmCen3
 iP5vFqU5jXiYnvqoSmT0++v3vE17WR+aZ9wFV4LZNdoZq/8I2HE1UGeD1+nlSjSxhrgxR1e
 56pfEYAEwFQM0UB7oQHbA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:um5kssj5bIM=:tny5USlFXfcMN9GCJsZ6oV
 9Pz7shPRMBAQYYZdSPa5BniNEfM8OQRIzhsU4JvcStGafyyEl7SORhTDvEAzM/wCTai7EgFbW
 XxRoONe7zC2o9Q+fxMT65c1Ti9weF7rWH1a9SQ+NNCEXqGPDoA1sFbrQr1wTXCyazMUYURI8z
 zRbJC3QG328LLCpAuryltgZj+460gr9oHSevJwX49HB0OI/EowyR3n3Mii6mwICTWu/WWAXLt
 /ToA0gD9QqvzTJgOPzjJzJT1FJCRBdhWuK39ZsoJU9t5VHtwxYdfUTbhNo3VnPQyacWhPXpaT
 F87o47qGxjicitkMPviyz9TDZm9YHFU9eiZ5l/kRLzkd8FRHyFQmuC7ITiq9IsXzU0VKnVuA1
 4+jrhfggSsGnFviUREVlJunAvYlWgb6YCiAYaOVZ+sc+c2i6sLRE3fvVYVKOMS6n9xinGzBeN
 fdT2H6jSiM4LEiD8vw8UQyqq69t6LcvRxXCchNR21woB/YAyUI6kDftsPpmp8L10LSVsMq/LG
 UiTfox74ck9xDrCTkTWpswSLbs5VYvot+ZAGPlZF9NRFUsg+9mprdEQ0cGVxGYsXflBb/68TQ
 bAvV4ju3jRhSfuDIJEHVmEU1JUCKRvsY8xJxPhPC5x2xDoiAzLpOUD9catadbF+Jf2U927IXK
 RMvtwJ0CuvmpOVEknU0Bu4zsw2P6W8FzVqEZx5+DiEr3aoZYeqB05Jn58O9cPX1ACYVZ5rVkL
 5BATytfma3IpSFT8UY+44hwnpNbSBtCBMZ0fnIVWxFNvqq46cRRaYCiHO0iwW9xEVbxE7g/fV
 K3rjBYyp+yzeHkI4Dh5QvGMZron2hOMOYMs3518ERyDnkhS8MnFfgrLIACDFxQEYQobd8h0G4
 hyk7nexjPCrbd6ZWAYKQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_081250_172128_28BFE007 
X-CRM114-Status: GOOD (  12.33  )
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

On Wed, Jul 20, 2022 at 3:19 PM Stafford Horne <shorne@gmail.com> wrote:
>
> The asm/pci.h used for many newer architectures share similar
> definitions.  Move the common parts to asm-generic/pci.h to allow for
> sharing code.
>
> One thing to note:
>
>  - ARCH_GENERIC_PCI_MMAP_RESOURCE, csky does not define this so we
>    undefine it after including asm-generic/pci.h.  Why doesn't csky
>    define it?

If you want to resolve this, I think the easiest way is to add a patch
that sets this
in csky, I'm quite sure this was just a mistake on their end.

> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> Acked-by: Pierre Morel <pmorel@linux.ibm.com>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Stafford Horne <shorne@gmail.com>

Either way:

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
