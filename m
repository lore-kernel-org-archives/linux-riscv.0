Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB808C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jun 2022 07:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WuKFz+G/Sfjd2fhOoVc9oHdQ+7Dek9/rpU8SyJFRt6M=; b=CiOcerCTm6GAoz
	ac3EnEdtxs9IF75PSQrQXEVV+FObVMCmnSu6dcV6tCrvLWgLhs25vw5nTft1/kVqE7//QsTdAEb67
	r2d8Nph6lxLIVBZoxGpgmn4ZYJ3NMGacPxTOmUiOsb1Fh2+cpzPr/6MqQsCHqHnhd1nOv1fJeb7Gh
	9ZwX8D1adWWuE60aADYTAqnHhvdoSffjh7h4db02TX7KPw/VHD/SmchNzt0aou7N2kj1SS8J9+wAG
	fPxQfxM4nxqPnV5wUxcKlqWezGlN+ttxN9vW96jU4T9kUNKljO5KWytxn/h0FHixerNf2O6FaCK7t
	8ftcQukDXWtPwb3gE77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o507V-004zG1-QB; Sat, 25 Jun 2022 07:22:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o507T-004zFI-2m
	for linux-riscv@lists.infradead.org; Sat, 25 Jun 2022 07:22:16 +0000
Received: by mail-wr1-x435.google.com with SMTP id q5so559600wrc.2
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jun 2022 00:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9cKQK7FbM7x2pbFj1LTUNC0vlA4K6e2zfCrImitpQBg=;
        b=dTufpNwtV/jDnfAbvlUxEYOVqFnp74FznhyusAoiijBgzS9GZqSMTLpFZKJgw/XmEF
         axK3YMIfs4SNYHIVEm8kaTtLLc4Sua0/6rJ0TV5l8tTRcTje6yGq2zbuuWqMmIYTf2L1
         68zL1u7UR26A968sWLGSPKSaZxcf/q5eW7Y4foVvsbcbzYhK+4adf0xO8i7ZX/HzWBw5
         6Q7ZjYo5ZwrUOgTgjLTq6IFQ48ljH8mIIfxcYY0FkkxK8xgfdMJeC0h/IJJ7v8IwvkHG
         J2rqbZbtSxXl5nvkxEccIY9Wb2APVhyflViK2DkuVqLe+zlZ41uiyP9F9MlmgIyTim6S
         Y3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9cKQK7FbM7x2pbFj1LTUNC0vlA4K6e2zfCrImitpQBg=;
        b=PFddRSKQLxGSs1i0SWAoyy1R45wD/BJBrETPgT9UjWf/kcYdsmz2HR4zOtVojTVHdQ
         RxwU6nEFze7PA7qu5amiIpdg9sZ7JSgIIk2lvgWxcmnGoqpwoewQFXS6ZvrD5NI1nGYO
         0t7duRC8q2NFt1VAdzZLlqbEV+99Tkm3y8F0CO6AGMxG1DpWcMbz2Ie3clGgwOvXPs/F
         IpqKNRulnijGXmWV2/CrwGqLzqg2/aVMT86T9n6ycVhAYdI70XNY+Djo+Xr2wcGj7dYN
         t0onm2yk+HRvDgPLtkhQghy+SCo4JhdbQirY0EUIIrzrnpGuPFR1B0ulyDLO2IXKvhAe
         h+HA==
X-Gm-Message-State: AJIora86LwQ3FvxV2IZF54GMAasf0Y9fd8hyXHL3Q59t5jqNGCtgC/vc
	9TymRLLdS7AXn/kul7SuPYb2DADDv4GbC+fTMd2cmOtWVRozdQ==
X-Google-Smtp-Source: AGRyM1s2JyevF68DYH0E5FumiPiGuo3Gm1V+IubsbgZFrZpiK2yx8nWsEBGgEnDnU+l5ppPG474WrNtrHqw3Hh+omIM=
X-Received: by 2002:a5d:4532:0:b0:21b:ab1e:e9fa with SMTP id
 j18-20020a5d4532000000b0021bab1ee9famr2689573wra.214.1656141732432; Sat, 25
 Jun 2022 00:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <bca6d76d-1708-fede-8008-d2588a14b656@mail.ru> <8887d851-19b7-ee10-a89e-fb69d54ac41e@sholland.org>
 <CAAhSdy3CoRVs7Rn=TDBRrfqaNEr1R6h4r1cdgGR-QKCtg7QYrw@mail.gmail.com>
 <CAHBxVyFv57ggFhoJTCUfVPsosjRTdCy=2+TD=P3SSnT-NG-Y1g@mail.gmail.com> <76741e1c-056d-d3ae-fc20-eeb8f6e996f6@gmail.com>
In-Reply-To: <76741e1c-056d-d3ae-fc20-eeb8f6e996f6@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 25 Jun 2022 12:52:01 +0530
Message-ID: <CAAhSdy1pYZsRqKTt5jEsOy4MsPcSZDmBzY6FJGBhRTRLjC8xNg@mail.gmail.com>
Subject: Re: Tickless timer regression in v5.18.3 on riscv
To: Eva Kotova <nyandarknessgirl@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_002215_389881_7B6301E0 
X-CRM114-Status: GOOD (  18.67  )
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

On Fri, Jun 24, 2022 at 1:15 PM Eva Kotova <nyandarknessgirl@gmail.com> wrote:
>
> On Thu, Jun 23, 2022 at 8:59 PM Anup Patel <anup@brainfault.org> wrote:
>  > I suggest we introduce an optional "riscv,timer-always-on" DT
>  > property for each HART. If all HART DT nodes have this property then
>  > we don't set C3STOP flag in clockevent device, else we set it.
>
> Is there any particular reason not to implement the opposite DT property
> "riscv,timer-s3stop" for timers that stop in suspend?

The DT property definition should be about describing HW behavior and
not about describing SW features to be used.

The "riscv,timer-always-on" DT property set in a HART means the timer
in the corresponding HART is always on irrespective to idle state of HART.

Whereas, the "riscv,timer-c3stop" DT property set in a HART means SW
should use the C3STOP flag for the clock_event_device of this HART.

Clearly, "riscv,timer-always-on" DT property is more appropriate since
it describes HW behaviour.

> Right now, this patch breaks the behavior of previously fine working
> boards (worse sleep precision, higher idle consumption), and these
> boards have none of the mentioned issues, so why should they degrade
> after a kernel update?

The breakage was unintentional.

What we quickly need is a patch series (2 patches) for setting C3STOP
based on "riscv,timer-always-on" (Just like ARM arch timer driver). The
first patch will add documentation of "riscv,timer-always-on" in DT bindings
and second patch will update drivers/clocksource/timer-riscv.c

> The CLINT timer is already well-defined and worked for years, i don't
> see how suspend issues on particular hardware can justify going against
> the official spec.
>
> I do really think this should be addressed by the platform SBI
> implementation (that's why SBI exists after all?..) or DT properties for
> suspend-affected hardware, not finding holes in SBI spec and introducing
> fragmentation in the SW ecosystem.

Whether, timer will be kept running or be turned-off in a non-retentive
suspend state is a microarchitecture detail (or CPU implementation detail).

This can't be enforced by RISC-V SBI specification because SBI calls are
runtime services and do not describe HW. The best way is to discover this
HW behaviour (or CPU implementation detail) is through DT or ACPI.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
