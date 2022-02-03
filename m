Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AB6C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Feb 2022 02:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVsRqsJdG4zR4qVXbRMXoUy1twSG/hduVCukTChiAKc=; b=zx/Kq1qfyvEVT5
	RGF3B4H8kPWmxBpAETJZSsv3T6Q7vjE6W4mhsAWvHEDYBQgA10chirsAUf3snjqNU4SLxuVm4Cfm4
	BUOrmQywDONdS8D259oOgRP4JyfPpb+FoxGzmDrhKbVgS673ccGcLlkR60U+bTyPg0ttS8HHrglim
	smuMMquInOMNt7B7+0I8scW9SC5Y/KwJniyzSepOG6n5dPR1hHfG1KulFldLHPorWzHdGcLQIkk4N
	fz1Xeg6eExBsGQiYs6Fk0ZvBUZRBRQetn6Mwllz8ItMb5AW6GbBh42UB74UuZr8HShDv85E7pBFhZ
	T2tvxCsMUPsEZpwle+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFS6o-00HT4a-Gz; Thu, 03 Feb 2022 02:44:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFS6Z-00HT2A-Vf; Thu, 03 Feb 2022 02:44:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DBBA6B832E6;
 Thu,  3 Feb 2022 02:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2946CC340F4;
 Thu,  3 Feb 2022 02:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643856252;
 bh=V51eVJiRBfBtAiPpggOpCZR3uh94Yz/dWJnManIUqRA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IfifaL/YvkQeOydK0cgYgy7MaOnD1ofDN9TZ9U0AAgJgX5vkoOM/UCN+eqFDFX8e0
 SIROG24sqmSXhudRlXA3k1jWkp77oSEpy958cVODa3+sWBKJFg5/KfQgGGdSVjxxIs
 tBS1ttU+VD/lfGZc6laeZXX3nMQbkvJraFwXMBoSDxQnFXqyuk7KNTCbNzoNPaUxXu
 obu4PEKMkaRLF0VBJAceVG1kvUSawTvpCDv+XjctdvSnwyZA7NM+d+opMx9qUChsMA
 QIiebpV47EWTVL21TA8YNmrdIhNU6Tt7q6oAVfTnyRCqH7wGOKGMQC/DtV00pJqZ7Z
 uKgAZRx6fuHVA==
Received: by mail-ua1-f42.google.com with SMTP id l1so2719250uap.8;
 Wed, 02 Feb 2022 18:44:12 -0800 (PST)
X-Gm-Message-State: AOAM530yWr6+L7VOFAzqlAp9bLojwpmamjlgqK7NWroUUEW5/mtRkeON
 Aj9WjICpYjEHBww9pHEYVSDkpzvj7ebynqwv2FM=
X-Google-Smtp-Source: ABdhPJwcymlbtGZh6tQbwNbq4eIqK1FMhWR2Ntg5Vpt7lVSBlW8sS85pNzZxGeDyQITxXLpJvbICejijlor03wlRbBs=
X-Received: by 2002:ab0:2092:: with SMTP id r18mr12760634uak.66.1643856251122; 
 Wed, 02 Feb 2022 18:44:11 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-16-guoren@kernel.org>
 <20220202075159.GB18398@lst.de>
In-Reply-To: <20220202075159.GB18398@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 3 Feb 2022 10:44:00 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTxzFo1kdkCDH=2RKkQ1gEzOnUCjxotcsjrqivG4qg-Dw@mail.gmail.com>
Message-ID: <CAJF2gTTxzFo1kdkCDH=2RKkQ1gEzOnUCjxotcsjrqivG4qg-Dw@mail.gmail.com>
Subject: Re: [PATCH V5 15/21] riscv: compat: Add hw capability check for elf
To: Christoph Hellwig <hch@lst.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_184417_724044_95384E0D 
X-CRM114-Status: GOOD (  18.24  )
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

On Wed, Feb 2, 2022 at 3:52 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Feb 01, 2022 at 11:05:39PM +0800, guoren@kernel.org wrote:
> > +bool compat_elf_check_arch(Elf32_Ehdr *hdr)
> > +{
> > +     if (compat_mode_support && (hdr->e_machine == EM_RISCV))
> > +             return true;
> > +     else
> > +             return false;
> > +}
>
> This can be simplified to:
>
>         return compat_mode_support && hdr->e_machine == EM_RISCV;
Good point.

>
> I'd also rename compat_mode_support to compat_mode_supported
Okay

>
> > +
> > +static int compat_mode_detect(void)
> > +{
> > +     unsigned long tmp = csr_read(CSR_STATUS);
> > +
> > +     csr_write(CSR_STATUS, (tmp & ~SR_UXL) | SR_UXL_32);
> > +
> > +     if ((csr_read(CSR_STATUS) & SR_UXL) != SR_UXL_32) {
> > +             pr_info("riscv: 32bit compat mode detect failed\n");
> > +             compat_mode_support = false;
> > +     } else {
> > +             compat_mode_support = true;
> > +             pr_info("riscv: 32bit compat mode detected\n");
> > +     }
>
> I don't think we need these printks here.
Okay

>
> Also this could be simplified to:
>
>         compat_mode_supported = (csr_read(CSR_STATUS) & SR_UXL) == SR_UXL_32;
Okay



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
