Return-Path: <SRS0=6USs=L4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9FCC07E95
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jul 2021 10:28:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE82661405
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jul 2021 10:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE82661405
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgMWUfCQLVHM/9eXfDQB3bQ2rWJQx/VsoGWx8JbjII4=; b=qKehrfvvHvXmML
	RDzzgHgQdW2Z6erb8i4eGm1fTcdANwimLHfTlJBR56fkn29HuWCpeav3QFQsFs/5yTyxA/xgmsOex
	CheFf/XMIozvSnj3Si/C2QCoRg7F0qk7+znomP/O59jvnpm5J3TfD3INNbEy7/ResTURO13P54Bja
	2HNA888xZrIWK7aaHbHEwPJvxHLu+p4J45jKHLgZMIDw0OE5f5xyHroeDFGLk0yjEHQ1t9xqEIv8A
	KbGpT4rSb2/3YWniB+cEMLT+zKAbJJWf5QTiAPWGVus61P5uInhTs+bjPMnwiPNqwctKpj1RHNBQ4
	XYKZxhSF9ZSP7+lJqEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzzLh-006Aoi-A7; Sun, 04 Jul 2021 10:27:41 +0000
Received: from mail-vs1-f51.google.com ([209.85.217.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzzLe-006AoO-Ba
 for linux-riscv@lists.infradead.org; Sun, 04 Jul 2021 10:27:39 +0000
Received: by mail-vs1-f51.google.com with SMTP id h126so5910802vsc.6
 for <linux-riscv@lists.infradead.org>; Sun, 04 Jul 2021 03:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jm7/W98l1EPXw0L7RsU+HLHnrTKHQMB3RVy3seYsLYs=;
 b=TrH4stet8mHAf4LOMBEzgDKk8kCLVA0RaXKjkH+cqZNtZc+njrDlZfwq08gZkaCkSX
 wuuWoN2V80b5LQhixMBUKTFO4mPfIuGSysdgz36Ad9FqPTSqvf8V3J1Nk9DuIKHnUy39
 3V/i4lTNOGG7m+nZkcHYhfrs5RchqeG2GaQOg10jv0lCEBp3zb6w7HrG7GbA8L0z4cGS
 uq4M30/P1M0P27g8XKRcgwKHse4CN62u7tl3LTTci2ZbuzleCrBjY6ireVBQejrQ3MhP
 xEDrdHbgrZMSc/omCYnPgAU/suCA9i3G+HY+gtMqlttOP8WV2GZb8btZ8GvXgy9AOg8W
 GTIA==
X-Gm-Message-State: AOAM5306CaJXwal/DHt9anWRY9kJljTWYAPGBR1cueeiy36MGBRKTts8
 pLQmOouEkK/cQmQj3yFS7EJJuHtoOFbPLUHGb4wOAp41
X-Google-Smtp-Source: ABdhPJy7w2wvrEBODIQm1HT6B4Qsn2dEFXP568AYPmS4zf9RcOCJyTxo6QDhg+z8Es50Eof1qAqzzTjwUFNfOSJBY5A=
X-Received: by 2002:a67:770d:: with SMTP id s13mr6058806vsc.40.1625394456188; 
 Sun, 04 Jul 2021 03:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210704083441.256097-1-qiuwenbo@kylinos.com.cn>
In-Reply-To: <20210704083441.256097-1-qiuwenbo@kylinos.com.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 4 Jul 2021 12:27:25 +0200
Message-ID: <CAMuHMdU+GXCm1RbKriLSyLoV3XCZPDWjMHBuZrZ-i+Q7070ddg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: fix memory size for the SiFive HiFive
 Unmatched
To: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_032738_435396_F50CABDC 
X-CRM114-Status: GOOD (  18.26  )
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

Hi Qiu,

On Sun, Jul 4, 2021 at 10:37 AM Qiu Wenbo <qiuwenbo@kylinos.com.cn> wrote:
> The production version of HiFive Unmatched have 16GB memory.
>
> Signed-off-by: Qiu Wenbo <qiuwenbo@kylinos.com.cn>

Thanks for your patch!

> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -24,7 +24,7 @@ cpus {
>
>         memory@80000000 {
>                 device_type = "memory";
> -               reg = <0x0 0x80000000 0x2 0x00000000>;
> +               reg = <0x0 0x80000000 0x4 0x00000000>;
>         };
>
>         soc {

The /memory node is updated by U-Boot before passing it to the kernel
anyway, right?

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
