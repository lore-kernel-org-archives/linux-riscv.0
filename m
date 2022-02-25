Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E0BC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7OxAozHBLAInXKbLY6g+Jrw8kvmucickRs21uOGY5o=; b=JjjziJ0qiHGe9U
	ayGcPPx68c6ldR2X+1AdtTyRaDhkWvwhyFN7OCDQTf6pYxAcDbifQbMy7+dGqdQtHe8zJkOuyqf8N
	coBH3hSgTBH6acQ8zFntw7M7rpVEQgdJvMx+3vWW4Nt53FrM9PTysbCvNhnHGB2tbY56pxEoYOXEf
	9q0hM30cq3+/FGSR5WaHF1mFZbD+16Tr7jqsr8xyoAoSSHLEvHE3RlZ4LZ4fS0eFhiLsBNIFsodlm
	4Y9aKFcNdDpUrJTQ1KE1DmuK6WFBJjavefKD0TSTfwZA4LY57+BFAHdKM5SOQIuxTFtLvQNw83RU/
	qfRCP9qHif+VJnAZD2KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNcrC-005hdF-Ov; Fri, 25 Feb 2022 15:50:10 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNcr8-005hb9-3l; Fri, 25 Feb 2022 15:50:08 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M5x9B-1nHpAG3Jal-007U4Y; Fri, 25 Feb 2022 16:50:03 +0100
Received: by mail-wr1-f44.google.com with SMTP id v21so5155826wrv.5;
 Fri, 25 Feb 2022 07:50:03 -0800 (PST)
X-Gm-Message-State: AOAM532mJm1l3HMgnjerAON2vKo4lhjvh7pax2p5vPvrziW/R3iZ8Vqu
 IslmT65g3yUmBTGPOt5WET//kwgypmSc8qiZKk0=
X-Google-Smtp-Source: ABdhPJysyJQAyOWUBXwECRmjF7nJ/3KDCWU/jhvnP3qXA/ljoo2U2xK+NNU2HPSONjjfnno6VeVoMKIwA9lIuOaBaho=
X-Received: by 2002:a5d:59aa:0:b0:1ed:9f45:c2ff with SMTP id
 p10-20020a5d59aa000000b001ed9f45c2ffmr6588564wrr.192.1645804202754; Fri, 25
 Feb 2022 07:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20220224085410.399351-1-guoren@kernel.org>
 <20220224085410.399351-17-guoren@kernel.org>
 <CAK8P3a13_VBpTidoF_pUdV5g0MFqpSe17rgw=XUv69CCFCN0_g@mail.gmail.com>
 <CAJF2gTTu5=XwDUwNq=PfnzVRj-jPHH+0cOGhhLr_dFED1H24_g@mail.gmail.com>
In-Reply-To: <CAJF2gTTu5=XwDUwNq=PfnzVRj-jPHH+0cOGhhLr_dFED1H24_g@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Feb 2022 16:49:46 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0MtcB7YMWKZKvpcy4Txi4JTXT61KqFoKZOqhVP530oEA@mail.gmail.com>
Message-ID: <CAK8P3a0MtcB7YMWKZKvpcy4Txi4JTXT61KqFoKZOqhVP530oEA@mail.gmail.com>
Subject: Re: [PATCH V6 16/20] riscv: compat: vdso: Add rv32 VDSO base code
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:V2SlStsoPvshM+zxED1ZXpihmiKlZ2s5p+tDHgDPG20Aydibkmg
 9iluLSyGDyPtDRLH9iEbbIod73rht7VpoVY/II/Gu87SBI4xpmw/mObEsVa2Np2Q21rnBbK
 cZij/ZdNgew7d81yRS4Ny+GTw+Btnq09TsjpDHyUYjXlzSy7nB3HaWPkfw/ZQur0c4eNaBf
 tZea3sQOLU0FszvVviJOA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gupc4KbBRms=:fnYtrag0CdIee1uSIgeAi0
 iFrd9IFgXvU111T5jYUpzy0G8N5Wm8CaSv9Ad00y6JDphDdFyU464HQcZJjUwAlSym3hDW89H
 F7Z/LHULiFjwz7FAmcyzWj5VnHkl0yPnNxU12Hjkga5z4iFHMtdd+pGUNPclScKqDkmzkojNL
 N5999ZLieUuIISAyHfLB0HuFZKIKCs2rPxH8RMim+HEbrKYts1Cv6Dk4XgzWZOzcc97WyALWq
 AX3Hsm1GBlnJDWjE8xq7OjpNzuhUi4LAUfKG3O19zWn0ItLoDlW5I8tpLuE2XH8g90DZcMHP5
 n4eTUXQK7Fd7oDtw0YemI9pZ1CgxEK9x0YK0eukFYGy0RCqywgtZYk9NnP0gOrpgiZfv7tJTc
 /PgnNb+tbbA6gdpP+RO65voFk4dl1ktVUk6jba+ipLKtjnYxbrO4n3P8HofJRF9Ajg1cQPmJX
 +JkpAwf7GxvfhXnE5U8ujI643gA5EloMB0vVM7G1nFM1X/zxB7eG/ugPoN0S5Wy1k0HVenBDO
 kAWtWg9pJRdbszOroA6ufRTq2qBBgztjb6fDIWvdKvzzbg7VFrWMGse9vlRA0kra9JFGAflXD
 KcKCidmfem6DHE25yqapNJqHgRR2rgytpXEIg4ihe8QcWMOZ8/fs0bo+xolX8r8T6mRc5Z3z3
 rRv9C4O20I4URslfGNV7zWHk/lV95Hn4h91Qmv7AeNsMpyKoMlSxd0yEmk9ShqXXsUrIRQ0Gd
 vMyyvhVr5heg5TOxcKI7w22ZxzBIovcjYj1P3MVW3YaGYosdYUSPgeDGk81hBx5JaQWnk72FP
 zVTKXu+OYCKiyU55Gj71X7rFPYCBz++4MjEAqSykeHs8pFZQJk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_075006_487743_EF73D3B5 
X-CRM114-Status: GOOD (  13.99  )
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

On Fri, Feb 25, 2022 at 4:42 PM Guo Ren <guoren@kernel.org> wrote:
>
> Hi Arnd & Palmer,
>
> Here is the new modified compat_vdso/Makefile, please have a look,
> first. Then I would update it to v7:
> ===========================================
> # SPDX-License-Identifier: GPL-2.0-only
> #
> # Makefile for compat_vdso
> #
>
> # Symbols present in the compat_vdso
> compat_vdso-syms  = rt_sigreturn
> compat_vdso-syms += getcpu
> compat_vdso-syms += flush_icache
>
> ifdef CROSS_COMPILE_COMPAT
>         COMPAT_CC := $(CROSS_COMPILE_COMPAT)gcc
>         COMPAT_LD := $(CROSS_COMPILE_COMPAT)ld
> else
>         COMPAT_CC := $(CC)
>         COMPAT_LD := $(LD)
> endif
>
> COMPAT_CC_FLAGS := -march=rv32g -mabi=ilp32
> COMPAT_LD_FLAGS := -melf32lriscv

Have you come across a case in which a separate cross toolchain
is required? If not, I would leave this out and just set the flags for the
normal toolchain.

I also think it would be a nicer split to build the two vdso variants
as vdso64/vdso32 rather than vdso/compat_vdso. That way,
the build procedure can be kept as close as possible to the
native 32-bit build.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
