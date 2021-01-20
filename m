Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809F5C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 13:07:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25EE022210
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 13:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25EE022210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mgUiiiD8n1oTsfdM2h2XgShW46BjBwlNreSrV/qLwcs=; b=NJvo3zJcL7aRvr2Ld5EK9DBJN
	pzRiSx5uYGu/qtoBD5EQdPWqbgoLbb3iR8BUn1RDU5bkQBMgyB2MhkzyHM473akuiGsxudEsFH3ti
	j9EjJbvq0ZimfBK9D7R3F1Hv+iT/jjZQf7ofbTgsJzSiR0aBfu2Zq4vkfumLyZyuboij2FlmeDtCj
	G3u6haP4CcwfRdiLKOK7+fB04rgog3C2XPf9ukPaPgXpa9q8VzOs9wKCayJ6KdUm0MU9p2Wbv7NKe
	4p2+Ufp/T7O2BEl+gTbCO77wEymMUReZs3Kxa613D17m+uyLkVWIl/6Ci2cGzvhadzMti0iB6Q+oQ
	KphwOm6dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2DCW-0006KR-4x; Wed, 20 Jan 2021 13:07:08 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2DCU-0006JL-EM
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 13:07:07 +0000
Received: by mail-pf1-x42f.google.com with SMTP id 11so14452115pfu.4
 for <linux-riscv@lists.infradead.org>; Wed, 20 Jan 2021 05:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZOvZA96ZqHhYYsl3TXxpU61JXBoyw6gS3vQQtm7WhqA=;
 b=XGLsFqBfw29Axuri0oRGB/SxGWwPC7x9iXNKeWx1fOQd8pNcWe580ocWmP+vByX8p2
 2djvXDWYV6b/0PPSyWBfS0TzmYUHM7drEbSJlaGFF7+93p0iv8HKen6LU3BtbwX4fnDz
 YTqBI0q3y8GI37coPtA8sJsqBfyNv/H8hikQ9tWeA44biBh7fvY0O3hf5k1qRacdCrVj
 9k6DSywqBx/oolXcfCqKs1CWp/IgmBQVKla7D5PKMGqpAv8Fm+4Xq8LIjrmHevXwluBE
 3s0dLTxUFPLrIkdJp+L0nzWbu7PclY62v0aZyEaYwDNeDusMNXf1jwIXalp2k46eUmjo
 OHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZOvZA96ZqHhYYsl3TXxpU61JXBoyw6gS3vQQtm7WhqA=;
 b=CkVFo456JTREfJEe9MzwWej+e7qr6WiUzuDOlVFU2lLEYdblh2kWsj/c25jwEQcMiq
 EnPGvVKMdo14bKFCexUdHc8Qwef/yKtL840tdYze/GQUr8pd8UMWEJEX9LM6N/uuffSi
 qUKXx9/K2ttfCikmuBaJI/TE78CFmVPL/026//X4e7r00SDjnZkSgoqSkLzo4PSAOEBJ
 HLosqmPl4PYNop2ZibKpwIlscIYCtemog2E4D4S+UXq5AEXGtDQoRaVlwbfPMRW5R4du
 hSdXqyhgHBsA2DcWrojo4qgIOKcOIqOv8VflwEK070AlT6RsoisgpRuN8MBYMx23eOrF
 cKZA==
X-Gm-Message-State: AOAM532GoG+S6IR5hp8+GQX+RtlxIMwFdCSgUtizQIBt/Zj1EG1TG7ho
 2zurvVCGu/p//KiMR/RYUa8=
X-Google-Smtp-Source: ABdhPJyWYxsCNaud4l5HTIU2X7R5T/Xz6UT6kJEieFA13jRSuANZg+q8KXJ17UrLhYygL3ubwyjH3Q==
X-Received: by 2002:aa7:8eda:0:b029:19e:c8c3:ed74 with SMTP id
 b26-20020aa78eda0000b029019ec8c3ed74mr9014247pfr.66.1611148022806; 
 Wed, 20 Jan 2021 05:07:02 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 r30sm2593787pjg.43.2021.01.20.05.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 05:07:01 -0800 (PST)
Date: Wed, 20 Jan 2021 22:06:59 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4] drivers/soc/litex: Add restart handler
Message-ID: <20210120130659.GN2002709@lianli.shorne-pla.net>
References: <20210119080938.1832733-1-geert@linux-m68k.org>
 <20210119213444.GL2002709@lianli.shorne-pla.net>
 <20210119221110.GM2002709@lianli.shorne-pla.net>
 <CAMuHMdVpogc=oEgCCq8N__RJkujJX47OaZZcyaRgjSJV2+SZ-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVpogc=oEgCCq8N__RJkujJX47OaZZcyaRgjSJV2+SZ-Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_080706_487059_47A1AD62 
X-CRM114-Status: GOOD (  26.09  )
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
Cc: Mateusz Holenko <mholenko@antmicro.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Karol Gugala <kgugala@antmicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 20, 2021 at 09:20:39AM +0100, Geert Uytterhoeven wrote:
> Hi Stafford,
> 
> On Tue, Jan 19, 2021 at 11:11 PM Stafford Horne <shorne@gmail.com> wrote:
> > On Wed, Jan 20, 2021 at 06:34:44AM +0900, Stafford Horne wrote:
> > > On Tue, Jan 19, 2021 at 09:09:38AM +0100, Geert Uytterhoeven wrote:
> > > > Let the LiteX SoC Controller register a restart handler, which resets
> > > > the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > >
> > > Thanks, this looks good to me, queued to my linux-next branch.
> > >
> > > -Stafford
> > >
> > > > @@ -66,8 +71,19 @@ static int litex_check_csr_access(void __iomem *reg_addr)
> > > >
> > > >  struct litex_soc_ctrl_device {
> > > >     void __iomem *base;
> > > > +   struct notifier_block reset_nb;
> > > >  };
> > > >
> > > > +static int litex_reset_handler(struct notifier_block *this, unsigned long mode,
> > > > +                          void *cmd)
> > > > +{
> > > > +   struct litex_soc_ctrl_device *soc_ctrl_dev =
> > > > +           container_of(this, struct litex_soc_ctrl_device, reset_nb);
> > >
> > > Nice.
> > >
> > > > +   litex_write32(soc_ctrl_dev->base + RESET_REG_OFF, RESET_REG_VALUE);
> > > > +   return NOTIFY_DONE;
> > > > +}
> > > > +
> >
> > Actually, I tested this out on the latest (2-weeks ago) Litex and
> > openrisc/for-next and it didn't seem to work correctly.
> >
> > I will look into it a bit closer, but if you see or can think of anything let
> > me know.  Note There are a few failures below related to network services as my
> > for-next kernel doesnt have a network driver (yet).
> 
> Hmmm, openrisc/for-next does have commit 131172a4a8ce3fcc ("openrisc:
> restart: Call common handlers before hanging").
> 
> It's been a few years I used an OpenRISC setup.
> Do you have a link to Linux on mor1kx/LiteX setup instructions?

Actually, I rebuilt everything again and it works fine.  FYI, my instructions
for setup are here:

 - https://github.com/stffrdhrn/or1k-utils/tree/master/litex

I use an arty dev board, you can see the reset working below. There are some
things I need to fix in my dev rootfs shutdown scripts but it does reset.


    # shutdown -r now

    Broadcast message from root@buildroot (console) (Thu Jan  1 00:01:07 1970):
    The system is going down for reboot NOW!
    INIT: Switching to runlevel: 6
    # mounting home work nfs ...
    mount: mounting 10.0.0.27:/home/shorne/work on /home/shorne/work failed: No such device
    enabling login for shorne ...
    setting coredumps ...
    Stopping dropbear sshd: FAIL
    Stopping ntpd: FAIL
    Nothing to do, sntp is not a daemon.
    Stopping network: ifdown: interface lo not configured
    ifdown: interface eth0 not configured
    OK
    Saving random seed: [   70.960000] random: dd: uninitialized urandom read (512 bytes read)
    OK
    Stopping klogd: OK
    Stopping syslogd: start-stop-daemon: warning: killing process 51: No such
    process
    FAIL
    umount: devtmpfs busy - remounted read-only
    umount: can't unmount /: Invalid argument
    [   72.650000] reboot: Res
	    __   _ __      _  __
	   / /  (_) /____ | |/_/
	  / /__/ / __/ -_)>  <
	 /____/_/\__/\__/_/|_|
       Build your hardware, easily!

     (c) Copyright 2012-2020 Enjoy-Digital
     (c) Copyright 2007-2015 M-Labs

     BIOS built on Jan 20 2021 21:18:10
     BIOS CRC passed (b12f1de3)

     Migen git sha1: 40b1092
     LiteX git sha1: 57289dd4

    --=============== SoC ==================--
    CPU:            MOR1KX @ 100MHz
    BUS:            WISHBONE 32-bit @ 4GiB

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
