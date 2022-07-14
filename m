Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6725FC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 08:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CoPNluHq4L6mSdw90eBpiYe0FBUuMWNLxkouq5OT48=; b=XZyNs11vcqGqwe
	T9LlSL19ZAURHhjI9OP/4wj9SE4wTvx1y5nCPXknDVEsHsahTd7JkMY9NcM5ZdXIvTRcREZ+VSQ2P
	cvQ7V0u7m3JIOPvhu7Qyo4qgd6CrucTT/X3yMKIzW1DYm3fz/w+1swbIsCehuF+/6g1Q+2L9nOUVM
	8HUjCH0im6t08QuXbMCEili9ndiXpUy4FwAUw2ZJ+8IQ+pp4t7VfN5VK7DAIfnwkpoNv3mAvvU7F5
	7VDSsB+mW0uFFEIQFGhp0XxYbSZGoRfJIdZ7ZkvEv8Q9+FUKstoiLBmRQgYBBoxCXAK3AHmcN+9pu
	Ga2MScB7Ru+sx+4SzBMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBu9p-00CKQG-Vb; Thu, 14 Jul 2022 08:25:14 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBu9n-00CKNH-UF
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 08:25:13 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1McY4R-1nZ0ZS0LLZ-00d1Xa for <linux-riscv@lists.infradead.org>; Thu, 14
 Jul 2022 10:25:07 +0200
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-31caffa4a45so9731987b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Jul 2022 01:25:06 -0700 (PDT)
X-Gm-Message-State: AJIora8dcW7KYCj0UvWvBW30S9OimqueI1VP6DuW/IF50KC0PBA8LzII
	azwEyaO+74wvFdngYbCQA2f6DFryr0yQwlg6Xqo=
X-Google-Smtp-Source: AGRyM1vt2i+MLzQoQ8EUAstVq2RqNs3pwOpWRFUMpYqOFMtyP7eGTQHRST6xfO3JNud96tGfOfo+oDtOe953D88c1j4=
X-Received: by 2002:a81:d93:0:b0:31c:d32d:4d76 with SMTP id
 141-20020a810d93000000b0031cd32d4d76mr9102171ywn.135.1657787105766; Thu, 14
 Jul 2022 01:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220714025901.359695-1-xianting.tian@linux.alibaba.com> <20220714025901.359695-3-xianting.tian@linux.alibaba.com>
In-Reply-To: <20220714025901.359695-3-xianting.tian@linux.alibaba.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 14 Jul 2022 10:24:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3-jKEs+uGL=_kjmfzao6DYgmrkO+YWtNhv5O+hFw_qog@mail.gmail.com>
Message-ID: <CAK8P3a3-jKEs+uGL=_kjmfzao6DYgmrkO+YWtNhv5O+hFw_qog@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] riscv: Add modules to virtual kernel memory layout dump
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
	Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Nick Kossifidis <mick@ics.forth.gr>, Mike Rapoport <rppt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, huanyi.xj@alibaba-inc.com
X-Provags-ID: V03:K1:i+/Dg2i4ZKLxJZHIN3vIxWmjio/HaYYJn32cK4mG0C1XNPvq4Bv
 Fw1kNOVTPJe+C1DL5/znGXcUTvSHipsGslblLO5dHTmMsohxq8qC68KShtqRdf9BVpGtv7/
 U78SoZMleivPN7PdUaPsFSZ4OUM8JD51n87oewhOXb7kCIKFNKq5PBqTWGLb5t0HsAGPSeq
 ACitn9AYNDaesMl7zMChQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7MIddEBhIKo=:tDpX0kwxrjMF8Uh5ifFUnA
 2reqJi832jWSk5Kv/8BkLIEdUb7a3Zv3FjPZnw5nlJROQulqkMq0pZLB7F43DahqebYnEEHIY
 L7Deh+eMPb3uxO59vRLwveyC7tOrdz8nvEIvXIMfRUNs5TalLtSokJ5TBH9sSrVZ4f/w6i/LT
 uHpGmwoonS3ndi5K+DiaLrzjMxs6FprivKBZjyBC6F+X5XF8qMB+B7mxiGxshb5PXs1Nmkova
 2WntS2bgetfPmEWgMTlmqIpmS5dRgWgtRNqPG+blQSBhouul+fkAgXbRNtKue8RIDa1lyhRhl
 o/eB26UfaVMmPJHAdTPUdG8OegtvWsH6zYGPohnGK8mKl5ynVv1dB9ybLPXWFvlMCgMF0lda1
 OGxwIMWoM4jjMdMt9lcxb7in5xGQOe2azwqu52GmWo1B0oy5DA+P/edJcDZEkEujG/DjYFTde
 BzjEYAe4Bfc9JJ98TDyacaGn903lITj9AHV2PYRkGTr5c2ihMDtW2x5Wkwp/jxjeCJz1o1Lm2
 n5uys2gbsNSlqPaGOv0982xeXSvzDj5RRCjwuOJq+w0sglgEPdHUsQ72fHQ7/NjycGBtsBbcP
 hxLUr3PUN2gPy0M3CiSqky+UQdePhohceohiQCZZgXfYJb6gCIN5d33mG1yGA5w88JQWSeytM
 aE3j5sdRmR5yRuTDI2o/sHyyiGo2FtK5+2TKVcJdN5gpS0cOZa1oCO3EUaIt7jco0kvMqICV4
 b0nvUWc6/qMWmCByHhrIpLqhTqwts34FBPG7yI2qTI5vTzHeHeCTORT030oSLwAi5rKoU/0hY
 Dd0pfm3/7eO3c+exA/yWAw4nOFNpNfeg9+SEolY1PYev6aEdu+GSA/YffHCetU160CQmi1imu
 LHNxQktxryCSBfIDAqLQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_012512_299565_9C737D8E 
X-CRM114-Status: GOOD (  11.23  )
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

On Thu, Jul 14, 2022 at 4:59 AM Xianting Tian
<xianting.tian@linux.alibaba.com> wrote:
>
> As MODULES is only defined for CONFIG_64BIT, so we dump it when
> CONFIG_64BIT.

Doesn't this cause a compile-time error on 32-bit?

>                 (unsigned long)VMEMMAP_END);
>         print_ml("vmalloc", (unsigned long)VMALLOC_START,
>                 (unsigned long)VMALLOC_END);
> +       if (IS_ENABLED(CONFIG_64BIT))
> +               print_ml("modules", (unsigned long)MODULES_VADDR,
> +                       (unsigned long)MODULES_END);

The IS_ENABLED() check prevents the line from getting executed, but
unlike an #ifdef it still relies on it to be parsable.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
