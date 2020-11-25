Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA74EC5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 08:51:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B85E920857
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 08:51:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="21QR8VzD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B85E920857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xH5jB//yYXevDa6JwFkVdESmlWqqDEnSpSx/xOPIveg=; b=21QR8VzDgZOGmcgNnmyhNlsH5
	1ZccQjJo14tE+OoCBLhp3UMuOEvS1ak64QUOq/qsFXS6C7xvT2X4Fk2NrXQB4P+Uqi7b8/zEVWOGg
	dFemwVQ++mnXLl2FG6FPruN4jW75//jg3/xulec16jkuYVDy4lug8phtyRGfSBqm5PccbFvd1POWb
	h6yqePtolzCOcbSW1vnu4ZSd9iZhXTong6LLag7m/mktXOUdnoTZLDWycDvfnL+1j/XyPotTHMDMw
	u1dDwFCzU8atzKwJqUOOgps5mA0O3MWCHsN/Bz5DP2NFtMK9Gi0kN7E2Nt21Ju8iJiNWBVAeVWGbo
	cKB29O4Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khqWT-0006WR-VC; Wed, 25 Nov 2020 08:51:33 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khqWR-0006Vr-0F
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 08:51:32 +0000
Received: by mail-ot1-f67.google.com with SMTP id n12so1588329otk.0
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 00:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kl1ooVwC5sorQ85yYzVr3KYM5DDAoiMuzVAwUEh9o3w=;
 b=A/fVl51oj6QEMAHhos/K6nApQNsONNS/KX9w38Vk77KUlOdGmTKwDenehIBDzp4gYu
 VISmc2JubffTIHrQCAm5i1V4AMuKvUEEj92qDWYbQAQctL2YuPbz3nMbh1p+jLK5g5PD
 +N6359GjTu1Vcemhw9tq9QYOwRGYkYMn/opgDuxBJpW5HWM2AYGk5XFA64guad3xdRyi
 FpG4E9GOcg850/oFOA3gd42tK5Kdx7ECD4na5lsobM2+KXK4EVwMvAgfb9/OpTYI6ikY
 tED79N/5F3azwickLDECsn9jXdiBdq2tnHKWAxVFBfEhojIT7vvHOQQHePnkBqODKrZp
 i8dw==
X-Gm-Message-State: AOAM533Xf1VXdEwwMAu8QGczf5gf/ujxuqiNiGRWCNptltX1rTkhJU8G
 zorIxaWQ3YeLPuLeNM/fa+R6PUiKuMlbJ49GQBVcUbt4Hkk=
X-Google-Smtp-Source: ABdhPJzngLqzabrksUi7zxt1gakeAI2FVfVbqE6msa5OQLUvUdCUroniLCADSSSuVQ6ru5wj9GYRhi8SwYoVuEwK6gQ=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr2109851oth.250.1606294290430; 
 Wed, 25 Nov 2020 00:51:30 -0800 (PST)
MIME-Version: 1.0
References: <20201124185738.3541314-1-geert@linux-m68k.org>
 <CH2PR04MB652231C5B82E9F8184F496D8E7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
In-Reply-To: <CH2PR04MB652231C5B82E9F8184F496D8E7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2020 09:51:19 +0100
Message-ID: <CAMuHMdW9dySq3y_Uixv8_7e+Pe2VKw4iGV36mx-DbX6-yzk-Gw@mail.gmail.com>
Subject: Re: [PATCH] riscv: defconfig: k210: Disable CONFIG_VT
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_035131_245277_2E18A27C 
X-CRM114-Status: GOOD (  13.76  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On Wed, Nov 25, 2020 at 7:14 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2020/11/25 3:57, Geert Uytterhoeven wrote:
> > There is no need to enable Virtual Terminal support in the Canaan
> > Kendryte K210 defconfigs, as no terminal devices are supported and
> > enabled.  Hence disable CONFIG_VT, and remove the no longer needed
> > override for CONFIG_VGA_CONSOLE.
> >
> > This reduces kernel size by ca. 65 KiB.
>
> Indeed, nice saving. Just tested, and all is good.

I used my old script[1] to check the impact of disabling config options.

I don't see any other low-hanging fruits:

Disabling CONFIG_BLOCK saves 492890 bytes
Disabling CONFIG_EXT4_FS saves 322528 bytes
Disabling CONFIG_PRINTK saves 214612 bytes
Disabling CONFIG_SMP saves 214486 bytes
Disabling CONFIG_FRAME_POINTER saves 166368 bytes
Disabling CONFIG_TTY saves 156618 bytes
Disabling CONFIG_PROC_FS saves 110274 bytes
Disabling CONFIG_MMC saves 87656 bytes
Disabling CONFIG_VT saves 70350 bytes
Disabling CONFIG_SYSFS saves 62298 bytes
Disabling CONFIG_BUG saves 50882 bytes
Disabling CONFIG_SPI saves 34420 bytes
Disabling CONFIG_SOC_CANAAN saves 34286 bytes
Disabling CONFIG_I2C saves 34086 bytes
Disabling CONFIG_PROC_SYSCTL saves 23890 bytes
Disabling CONFIG_POSIX_TIMERS saves 18388 bytes
Disabling CONFIG_I2C_DESIGNWARE_PLATFORM saves 17530 bytes
Disabling CONFIG_MMC_BLOCK saves 17200 bytes
Disabling CONFIG_UNIX98_PTYS saves 16360 bytes
Disabling CONFIG_MULTIUSER saves 16148 bytes
Disabling CONFIG_NEW_LEDS saves 15964 bytes
Disabling CONFIG_SPI_DESIGNWARE saves 15434 bytes
Disabling CONFIG_GPIO_CDEV saves 15352 bytes
Disabling CONFIG_MMC_SPI saves 14754 bytes
Disabling CONFIG_SOC_CANAAN_K210_DTB_BUILTIN saves 13864 bytes

(Yes, I have ext4 enabled ;-)

I haven't done enough riscv kernel development yet to assess if I need
CONFIG_FRAME_POINTER or not.

[1] https://github.com/geertu/linux-scripts/blob/master/linux-analyze-marginal-sizes

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
