Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D44C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 09:32:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 825466120E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 09:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 825466120E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0HH53je0Vpmjog8fpI0v6EBh9CkH95pvgXtxlqQyJM=; b=17OMTJhU/uobVq
	04C/o0BMdWxM6OBTp9PUagOaliyWLiCKg6tUX/vnZN5kLVTAZEYxzhmVQadALPzeACeFLrrWPbZ6+
	QSPztfruhp5iRh4S85cBn6By8eaXVOmZQ2tFlO1W8KdCdTP+bj41+81a6HjBfeEttrF1LzAF6Wjuj
	wZS64PNlOZ8PaQGuemvzYizrEGaFbkuQo2QSNzlSd5Wf3WP+x66n5FucyTHsSMs+6CJir3vz6//2P
	rU8QgxANY2rv08ENh+nEeYBsWY2qsDEJMtbZDmqKFHXXdvBhKeTIDHrRnuWZHzcWnsp6obn2SeF9K
	OFEM3WGgc92QkNl/Goqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5m6r-00CPHI-6E; Tue, 20 Jul 2021 09:32:17 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5m6g-00CPEl-W6
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 09:32:08 +0000
Received: by mail-ua1-f52.google.com with SMTP id z3so4420610uao.9
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 02:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rgdnRd+t5Fn08CGE5HYFeKJTBlBO+nXJPRDAHBMbx7U=;
 b=WMsevySwsNPOeO58yAZ9YR/AW2BAzVklnmWjycY5wZMwjLxv4xgcy7IEc+OIf9OWq0
 A1IHluyM0Bu+f6lyuHrJN37O9O4pbDBDbuNATDpUBeXmCwCAXBxF0NNPZvgLohwEeVVV
 Fx/ZofzDWdDz0GcHfGkXBJv1pW9f3vXdKDaOQjXGs1lSVtjMnrHG9TfYqxItGdpwmQTM
 IEL8wZmIPVrP0XGqfT2NL+CqV5gH28j0H1XK7/ROwsln5jfiUZMLfEFtPSuQFWtZvymJ
 cp1ye7PU+/8z9k0CafAuCB6oLPQDzBozbMiqv8d1ldnuCNhg0+nLYWwYyLAEiwi/FaEY
 /YQQ==
X-Gm-Message-State: AOAM531VbQclQrzDDPS//uDauNNQoS0HrYOEZ13mkSo4WMQw+oq3U3oj
 zzHFPRLei+7Fx1EFRUAaqPJkaxH9oOsBlBMhCl8=
X-Google-Smtp-Source: ABdhPJzC2IsLXa1JFljvwJBzvQIafprpWb+j/KDrGHgidSzujkNumv581Uu8Zr1ePuNgzSl0gCfBr8EbKuUzjtk7bcM=
X-Received: by 2002:ab0:2554:: with SMTP id l20mr30460183uan.58.1626773523243; 
 Tue, 20 Jul 2021 02:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
In-Reply-To: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jul 2021 11:31:51 +0200
Message-ID: <CAMuHMdWj5j_XQXnwBio8qZBGNFcr5PWwr7O5DroSKwO9AN0nPw@mail.gmail.com>
Subject: Re: [PATCH 0/4] __asm_copy_to-from_user: Fixes
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Guenter Roeck <linux@roeck-us.net>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Gabriel L. Somlo" <gsomlo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_023207_062158_1E032438 
X-CRM114-Status: GOOD (  20.72  )
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

Hi Tsukamoto-san,

On Tue, Jul 20, 2021 at 10:49 AM Akira Tsukamoto
<akira.tsukamoto@gmail.com> wrote:
> These are series for the fix reported by Guenter, Geert and Qiu.
>
> One patch to fix overrun memory access, one patch to fix on rv32.
> And two more for clean up and typos.
>
> Have tested on qemu rv32, qemu rv64 and beaglev beta board.
>
> Thanks for the report and instructions to reproduce the error on rv32.
>
> Akira
>
> Akira Tsukamoto (4):
>   riscv: __asm_copy_to-from_user: Fix: overrun copy
>   riscv: __asm_copy_to-from_user: Fix: fail on RV32
>   riscv: __asm_copy_to-from_user: Remove unnecessary size check
>   riscv: __asm_copy_to-from_user: Fix: Typos in comments
>
>  arch/riscv/lib/uaccess.S | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)

Thanks, RV32 (vexriscv) is booting fine again.

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
