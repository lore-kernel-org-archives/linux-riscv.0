Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED21C35273
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iq8zTEP4QktGC55ZaKxGkBlPJ6TNF0X+/SEeFBFbp/k=; b=PYDFh/x9N37D7i
	4+/kQnTMdFifATZY5cc41LmZABys3XpTdpIrwV4facDajRds3gFPrUhBv+YOiLYZpA+iB+myix45o
	Z7zTEfDShM9me0/lHz4FSw/QWKhzAe5vQFsjIAkJCpH60K9vAMLqMpC7GrCwpvQwcKDL5t/MY7J/P
	LZmGAQOiTv11VvvdT9ft2kgH9dq55GZ3svkUrQzEnrQcV1gHpWPwLfo5TRaNZlzsX9jkhRzH2sIc9
	tsKv4iYZrcSTTRbr6GeH4Q2njlrdxm0pzOHGZM446G8Dldd2N15PxXOFBgUb377weBHfvPYWvWVuq
	e9yQWPAyYKT9vYwHB/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naeET-0093fI-Po; Sat, 02 Apr 2022 13:56:01 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nadyj-008uts-5V; Sat, 02 Apr 2022 13:39:49 +0000
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 232DdML8023571;
 Sat, 2 Apr 2022 22:39:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 232DdML8023571
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1648906762;
 bh=DjlDOU+QMjAfHhVG3DyTJmpT3lFDSgL63YIdZlYs+Z8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UjBNWOsJyDXN7Ik/vwlvvrJkUL3xcxEeg90yUV1f+r5ew2JO7uDPlWeIA2kNCDqEE
 ETj8LWZUJPnYjBjS9QYitIqBWohRa0mjtjCy7cBR8iXTaGfIbhWCc1NXWZ1cw5JxiY
 2vi5QtrPy/3OUu0OYzdLi51TT9qzBH8nJURyyACPdN49U+KhpkF82BO0ztcEVikKL9
 XTxGKqtlAdv2MopYNjZ+KEk1aH+VC4LwedXc6I7LtAd/tdc5Q95a4YNcsChFI+XkrM
 obNKeytY00Sy3kB7FVsQx/4zvlMOZjhq7dvmSJjIyqWa5P4Sap4+WRoCxJgzCbmYZX
 L4dCUCgCPLXEQ==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id
 p4-20020a17090ad30400b001c7ca87c05bso7573154pju.1; 
 Sat, 02 Apr 2022 06:39:22 -0700 (PDT)
X-Gm-Message-State: AOAM530u15ix2tmAlPZoe3y0ozpacdr19ekV32z7kmTN4W/eoM7ykmCV
 OSta6oBLsRxhNiSjPphh9eFaWK23seKp+U8RKPg=
X-Google-Smtp-Source: ABdhPJw2exoLpxI5c+cAeuK679q0cyMySJSrkv8rzRvz/yceSC8H6FLOcidZ+Bg1m2/S7aiMae+xzlzCK43rihaAn5w=
X-Received: by 2002:a17:90b:4d01:b0:1c9:ec79:1b35 with SMTP id
 mw1-20020a17090b4d0100b001c9ec791b35mr16659993pjb.77.1648906761882; Sat, 02
 Apr 2022 06:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220402133544.2690231-1-guoren@kernel.org>
 <20220402133544.2690231-5-guoren@kernel.org>
In-Reply-To: <20220402133544.2690231-5-guoren@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 2 Apr 2022 22:38:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS8i2xe2zFQo7mcJeujymhWB7hyp36UWS4Rp9T9dMUu2g@mail.gmail.com>
Message-ID: <CAK7LNAS8i2xe2zFQo7mcJeujymhWB7hyp36UWS4Rp9T9dMUu2g@mail.gmail.com>
Subject: Re: [PATCH V10 04/20] kconfig: Add SYSVIPC_COMPAT for all
 architectures
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
 linux-csky@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 X86 ML <x86@kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_063946_760414_C744C199 
X-CRM114-Status: GOOD (  10.71  )
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

On Sat, Apr 2, 2022 at 10:36 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The existing per-arch definitions are pretty much historic cruft.
> Move SYSVIPC_COMPAT into init/Kconfig.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---

Please use "arch:" or something for the commit subject.

I want to see "kconfig:" for
changes under scripts/kconfig/.



-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
