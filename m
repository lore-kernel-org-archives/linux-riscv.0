Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008DBC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 11:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdAS8WQ1JLTsMW68w6vwqYIUyFiYxeMHemddhz7p+c8=; b=JR9utb+NDQgrp9
	BB07WbORe2SPRethmUv/un4CrmdPPP0w+HxKZZ0Ri0W49W697dKtQrK9zd8WZiaHEh4PW8uk4aLWk
	05YoAYqboK0/OgJGNfv2fX3kIouUJx1YLPd/sJtzckG8REcYif6CFv2+bWFf3s+Hg3AxcF0L1sYkB
	EBXXYSoYIMUdx6MYuIM/SXjvmSaex+1QxvhQZCnlIS73gsaPtUrKWDjoxFkhEmEUI3oo4V92kkRLE
	VCr3zWgw2DqOmGuYWb6/W5f/bpkARI//Gt4p4CaHOIv2ViUhPsUdT4ng+V0w02it/533HUwD6fyqo
	GnmmKl/UW4VNS7CaeXLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEreU-00BtEj-Le; Tue, 01 Feb 2022 11:48:50 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEreH-00Bt7W-98; Tue, 01 Feb 2022 11:48:38 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N6srH-1mAFo5418h-018HAk; Tue, 01 Feb 2022 12:48:34 +0100
Received: by mail-wr1-f43.google.com with SMTP id h21so31484476wrb.8;
 Tue, 01 Feb 2022 03:48:34 -0800 (PST)
X-Gm-Message-State: AOAM5303KQH7oETwwo4F2RPte8G2iYzBlDd/wcLvmvyhXNP3NzOozIDN
 XggDXn+KoTjwx066Rw6ybsm6CZ0uRmVk2fZkldM=
X-Google-Smtp-Source: ABdhPJxO+OGO5lnSmsts+k8ffbEmh9/UtuFXn1dLVr5xpmsd+BH7cbCu5DpyTRvWDXlXMwgE6rWgsvPUd5Lt6roAGEM=
X-Received: by 2002:a05:6000:178d:: with SMTP id
 e13mr20737860wrg.317.1643716114442; 
 Tue, 01 Feb 2022 03:48:34 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-17-guoren@kernel.org>
 <YffVZZg9GNcjgVdm@infradead.org>
 <CAJF2gTRXDotO1L1FMojQs6msrqvCzA782Pux8rg3AfZgA=y0ew@mail.gmail.com>
 <20220201074457.GC29119@lst.de>
 <CAJF2gTTc=zwD__zXwYbO8vmup5evWJtzyiAF9Pm-UVHLJRc5hQ@mail.gmail.com>
 <CAK8P3a2C7nDGQvopYzi1fe_LWyosp8t9dcBsduYK5k_s_OrCaA@mail.gmail.com>
 <CAJF2gTTgTzvGfa3nGzVo4C=fe+ZCGBWp=VhTMRt1vF1O1bnS5g@mail.gmail.com>
In-Reply-To: <CAJF2gTTgTzvGfa3nGzVo4C=fe+ZCGBWp=VhTMRt1vF1O1bnS5g@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 1 Feb 2022 12:48:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3u8zo+MOOpDXaX8PY2ukN3J2VHnV8uDXQwc=0WgV6qFw@mail.gmail.com>
Message-ID: <CAK8P3a3u8zo+MOOpDXaX8PY2ukN3J2VHnV8uDXQwc=0WgV6qFw@mail.gmail.com>
Subject: Re: [PATCH V4 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>,
 Christoph Hellwig <hch@infradead.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
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
X-Provags-ID: V03:K1:dnBZc3IJyAT1Xi7LH5pnTJKyyiTfPPEOV3tmoea53HzRS+xgMrz
 Li6Nqo7yXRmeEXWcCoWj+6fMMr7yHh75rNdSYMFsIla2tGGmc1FtrXz/TAPxgDw2tYJbBhm
 qDXQdszykCKItyFfn9s4e1tAuyVpsSZneeaKzjhohdrp5VibTVFD3JFZzzCg5eUmnAzgh4P
 qDKRXxGyhI+u6Kb9e+0IQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8kryebBYCAU=:j+D77jLM0MLUYHrYikpL/o
 Pm780AMN7MECHa0kEEKVs8Ev1HT2ZHz0kCUB9is2i2L6mJriVAa18OqCAcK4W3mswXIxVV1jf
 i4NhhA6G08mfH7Bl9IYmsytTHlzZRag/qfq3jADtWYe1gFwjz7HdQXRje3jvHJiszJS/5Apts
 2HjHMzuLmckDioJ+VJCSjozvfPudbTvn4tcQZeJN5U0w+QhyIpAsSROi7kaamJ6zNU+wR3pZU
 3btScy5+/mJe0eMH8KAIqMWllWBY0+WBzfw4i5hZHXlGyfKgZXU+HDAInj6n4JjOWPM7ZqF6y
 lUBR7MnFBeve8Az1RP8XfJhuDsntnxboJgZnHwWMNxokr2LXd7WPeLMlC2ZYSFV/cXJzmM6Uq
 sQ8a5vC/tP5yihMwrMWTBCg++nKNJOaWfe14iDs/FEdigJNNAYb5c+8S5FcJAcmJOPl6De8Tz
 KpGsJVsukIzmHZjzVJsJJDLhaZ1oDdljQB3BUCCLEzrZo56Dds0vGv0H9Za8KcuKfEu6o+leP
 K1E3hyU1278J/gVI7Jgj6Ka90/z0Jg5qetD473YJh/SV1abIYXdYtpM0rJDCZeZk3F81ewwdy
 M82nHzB1iM/UMW1n2fJQxbFA6alB8mMAXetP0VujNQaUyY+ksiRZieEV1wJL3+eg8CcgKdb6B
 X2YrPW5pqefoHD8/5t5SY8qExM03UfdIe5VCLdKVJrdDWx0Wxy1qPh9FeIU8oShRzeKk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_034837_642303_4A5B2E25 
X-CRM114-Status: GOOD (  19.73  )
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

On Tue, Feb 1, 2022 at 11:26 AM Guo Ren <guoren@kernel.org> wrote:
>
> Hi Arnd & Christoph,
>
> The UXL field controls the value of XLEN for U-mode, termed UXLEN,
> which may differ from the
> value of XLEN for S-mode, termed SXLEN. The encoding of UXL is the
> same as that of the MXL
> field of misa, shown in Table 3.1.
>
> Here is the patch. (We needn't exception helper, because we are in
> S-mode and UXL wouldn't affect.)

Looks good to me, just a few details that could be improved

> -#define compat_elf_check_arch(x) ((x)->e_machine == EM_RISCV)
> +#ifdef CONFIG_COMPAT
> +#define compat_elf_check_arch compat_elf_check_arch
> +extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
> +#endif

No need for the #ifdef
> +}

> +void compat_mode_detect(void)

__init

> +{
> + unsigned long tmp = csr_read(CSR_STATUS);
> + csr_write(CSR_STATUS, (tmp & ~SR_UXL) | SR_UXL_32);
> +
> + if ((csr_read(CSR_STATUS) & SR_UXL) != SR_UXL_32) {
> + csr_write(CSR_STATUS, tmp);
> + return;
> + }
> +
> + csr_write(CSR_STATUS, tmp);
> + compat_mode_support = true;
> +
> + pr_info("riscv: compat: 32bit U-mode applications support\n");
> +}

I think an entry in /proc/cpuinfo would be more helpful than the pr_info at
boot time. Maybe a follow-up patch though, as there is no obvious place
to put it. On other architectures, you typically have a set of space
separated feature names, but riscv has a single string that describes
the ISA, and this feature is technically the support for a second ISA.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
