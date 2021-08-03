Return-Path: <SRS0=9VPL=M2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D053C4338F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 16:55:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22E2F60EE7
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 16:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22E2F60EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7emzXtMPYf++Znu496eqSXGYd6v8tk7qMLoqNwoXhk=; b=wNkgSfh2vhMDH1
	3QAjFQdGn7jTDkB2e1f9UhUy+zEA5l1DizO343mW6NXOvDilndYIOSTu658L7ra/AkqKWhdCmbAud
	NCtqPKsClSVKp0TQc+t+BoSa21ivSfxha4R648GXU8Uwb35C553yVSKPsAnDV8Xd9W+W+vRE12V14
	lML4WCTuf+wI71P1fn4Y/SH1A8ppDxkQeFBodLF1ng/GzEjLgnF64Pl/qfabiSuwUXA2uDUMG/jnU
	uVrWPNK9YxP5srySBAcoHZCPDCIxhSQm0ByxwBwItYloJorz2MzwJ3/tr+6baZyTjBLs8ZEKlsxB/
	7OFBHKEBHWtsV2c4a8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAxhD-003gqB-C7; Tue, 03 Aug 2021 16:55:15 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAxhA-003goR-UQ
 for linux-riscv@lists.infradead.org; Tue, 03 Aug 2021 16:55:14 +0000
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9E1D5208AB1E
 for <linux-riscv@lists.infradead.org>; Tue,  3 Aug 2021 09:55:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9E1D5208AB1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1628009710;
 bh=HaZnRch7qGYi+vNB3ZsL/DxMMvFWSWo7WErtYkFspsA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AqQiLw3VaKWqCUN/H+n8qq2pZUS23BFriOKYNXAuSb5jhXpYWj7G7LgFeojqxQf6x
 mqZCNPddKk6DpRikD/4RZs93ChrmcXeQayXWgMqEASjuhGNmzU8GgwYgn3LeG4aDPP
 RTktki0FfxbM66o0jXqUM/6/BCX7CCWClgzilF/c=
Received: by mail-pj1-f48.google.com with SMTP id
 dw2-20020a17090b0942b0290177cb475142so4728511pjb.2
 for <linux-riscv@lists.infradead.org>; Tue, 03 Aug 2021 09:55:10 -0700 (PDT)
X-Gm-Message-State: AOAM532xd6u2bNReEk5LM9B+XZ1HYd3mI428oYYaGoZShMtAx8bDEDhj
 9k/MzfzVWVct2UFC7DgWztYkldIJCDfLYlxi0pk=
X-Google-Smtp-Source: ABdhPJyHModUoYFzGPnywl2pyBQ07SohodjnVZXvcoB4fJpsM/A9bOGcvvOjahQitRFqSsVmmvwQ8KmF3rNa1iPU0F0=
X-Received: by 2002:a17:90a:ad85:: with SMTP id
 s5mr23048097pjq.187.1628009710193; 
 Tue, 03 Aug 2021 09:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210719114314.132364-1-mcroce@linux.microsoft.com>
In-Reply-To: <20210719114314.132364-1-mcroce@linux.microsoft.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Tue, 3 Aug 2021 18:54:34 +0200
X-Gmail-Original-Message-ID: <CAFnufp1QpMc87+-hwPa887iQQGCjjkGNanVSKOUsE-0ti82jrA@mail.gmail.com>
Message-ID: <CAFnufp1QpMc87+-hwPa887iQQGCjjkGNanVSKOUsE-0ti82jrA@mail.gmail.com>
Subject: Re: [PATCH] riscv: use the generic string routines
To: linux-riscv <linux-riscv@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>, 
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>, 
 Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_095513_102801_C31453D6 
X-CRM114-Status: GOOD (  12.86  )
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

On Mon, Jul 19, 2021 at 1:44 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
>
> From: Matteo Croce <mcroce@microsoft.com>
>
> Use the generic routines which handle alignment properly.
>
> These are the performances measured on a BeagleV machine for a
> 32 mbyte buffer:
>
> memcpy:
> original aligned:        75 Mb/s
> original unaligned:      75 Mb/s
> new aligned:            114 Mb/s
> new unaligned:          107 Mb/s
>
> memset:
> original aligned:       140 Mb/s
> original unaligned:     140 Mb/s
> new aligned:            241 Mb/s
> new unaligned:          241 Mb/s
>
> TCP throughput with iperf3 gives a similar improvement as well.
>
> This is the binary size increase according to bloat-o-meter:
>
> add/remove: 0/0 grow/shrink: 4/2 up/down: 432/-36 (396)
> Function                                     old     new   delta
> memcpy                                        36     324    +288
> memset                                        32     148    +116
> strlcpy                                      116     132     +16
> strscpy_pad                                   84      96     +12
> strlcat                                      176     164     -12
> memmove                                       76      52     -24
> Total: Before=1225371, After=1225767, chg +0.03%
>
> Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---

Hi,

can someone have a look at this change and share opinions?

Regards,
-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
