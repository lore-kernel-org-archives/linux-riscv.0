Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A43C2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 18:51:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9B4420757
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 18:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RkZR0w/d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9B4420757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q+/nuTq3Xfqb73Usz8NBMp9TkloclHlAcsX67lIaMMw=; b=RkZR0w/dReDbE+cdtj/Wz28HV
	Wxbri/+6bQNhGtMQZ1/6taUUR3H5gyxlxhMWDFOWhzyUMzSqx/yY4AXGsQN2dknVQkfu8V0FS/ziW
	AGKwYp2FLnBVWzo4jZ+6DCFW0t6K4Dghk9Vh3MYw3I+35sL/8dXhO3bDf7VO5sklrnRp+QfjazcMf
	teALRrVolOeFMRtqorklsVBaMWtXSFqOE4LFP1L7Z1Fxtexe22m1w1iiEcf/PndMUh+vBIpqMH2O8
	LGFAPW0NZKfXGSMtY02UIWUWqmeD3zbkWGmnUPh6RdStPogcbv7hMogd8zHott8+tq+cn/ORAfj7U
	3J86c6ACw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khdPZ-0003JV-6x; Tue, 24 Nov 2020 18:51:33 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khdPX-0003JA-2G
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 18:51:31 +0000
Received: by mail-oi1-f196.google.com with SMTP id v202so21760815oia.9
 for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2020 10:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jLgRkvNZDgzifodaE8EMus5xcvCzfMMH9uwC3wIOBb4=;
 b=XUcJjc+FTr0D2/FKfYq2W/TmETVBgf9sYYyD+K3YLcP9Y/3TMFHvHdslq2dvKjfcKV
 CH/P2USs86Z9Bx1y40qN/SSHLvwfAzDww2+as1f6DSBJHvjZwg6xHuENtj9357dhvzLF
 +IUehSXnBZZzleXm8SUVJoACINekhs8JE9DohP28cx1NqRLtJBUd/SAKEMnwc4tsVQdn
 7SUwjvYncvjdR88E39r3+q17Twgv6fTJg1qlqSOUdky2iI80fqGMzD4jADIfGXA33OFx
 TmeRL5v9tVeWNiH/VuW1FGt7WJK9cEu7SpTZ8ZsPUEBmwAlrEbDK0pp8HbvHy0PMjQai
 RTSg==
X-Gm-Message-State: AOAM530Ms4W9gjX4bz/PwAIauu/6LyYUZXcUDKZCi8osysq8XYOJQywt
 2hd3DWpTJYswi1J4/0pyoHkCRN99gIUHmMAzIAU=
X-Google-Smtp-Source: ABdhPJzJTHN0EZ9x5LkNWapVCxjkQtojq63K19GvbXFCpjz3NM8fGWLVYQO01JPHQgAmeFVa5xCtYTNE7u/4H+kUkl4=
X-Received: by 2002:aca:c3c4:: with SMTP id t187mr3522373oif.148.1606243890137; 
 Tue, 24 Nov 2020 10:51:30 -0800 (PST)
MIME-Version: 1.0
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
 <20201124043728.199852-22-damien.lemoal@wdc.com>
In-Reply-To: <20201124043728.199852-22-damien.lemoal@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Nov 2020 19:51:18 +0100
Message-ID: <CAMuHMdWZX4_Y+4OdEQPJwqHd68OA4p0uw7KQfjVwgHgk0Q=brA@mail.gmail.com>
Subject: Re: [PATCH v2 21/21] riscv: Add Canaan Kendryte K210 SD card defconfig
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_135131_169022_FF4691F3 
X-CRM114-Status: GOOD (  18.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On Tue, Nov 24, 2020 at 5:39 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> The nommu_k210_defconfig default configuration allows booting a K210
> SoC based board using an embedded intramfs cpio file. Modifying this
> configuration to enable support for the board SD card is not
> trivial for all users. To help beginners getting started with this
> board, add the nommu_k210_sdcard_defconfig default configuration file
> to set all configuration options necessary to use the board mmc-spi
> sd card for the root file system. This configuration adds support for
> the block layer, the mmc-spi driver and modifies the boot options to
> specify the rootfs device as mmcblk0p1 (first partition of the sd card
> block device). The ext2 file system is selected by default to encourage
> its use as that results in only about 4KB added to the kernel image
> size. The default device tree compiled in is unchanged and must be
> replaced by the user with the device tree suitable for the board being
> used (k210_maix_bit, k210_maix_dock, k210_maix_go, k210_maixduino or
> k210_kd233).
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

While ext2 is definitely cheaper than ext4 (the latter takes almost +200
KiB, ugh), ext2 does not have journaling.
Hence your root file system will be unclean all the time, unless you always
manage to unmount it before reboot.  And your default buildroot
does not have e2fsck.

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
