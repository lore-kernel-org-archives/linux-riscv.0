Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA8EC4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 18:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vQC20lJ0bI/a2n4lk6Mx5XlD7Tvj+vxwL7cRnO/o6Xw=; b=euljcvaI8hNDmmMrtCKVBIMH+D
	IP5kSQco6s9042O7ckDZsGM0qpIaHRIiHqS6g7x403XqCKOX4Dor+n1NN4NdRSxXgXPjrfj8gcLiD
	eShauKsKRth9K3Mor+ihOzmMIcSHXO/wuZLOioPlJUicTL0ELc65lyKZMhDf0PYWgIzM+FIORD9Cu
	tg62C9b4XRqo8GD9WPDDA43uEeSNtGdGh+HXGUSL1yoztiScXX3kmOF9RsMYLmESuENbHJN1o61jq
	Zu/Jl+2okYmg9uzTUTBlCLiL4s9CqATSJ0QgQulZEtSt0umPjX+H8TrNhIfmX3It5gMBQ0ynxhdAP
	N3dl/uqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AiZ-000crD-UG; Fri, 02 Dec 2022 18:24:59 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AiX-000cpZ-4C
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 18:24:58 +0000
Received: by mail-pf1-x42b.google.com with SMTP id c15so5627785pfb.13
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 10:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8xc1awsQJmhg6vB1XWcio8Inqx7vu6jIuLFBZEo1A8=;
        b=4pjhZUHY7jgCHHc1omjoQeudgyL8H37B7bpLBJViXZRNUyXte5mswTZNsWPwJMwAjy
         PJ3hAs+SRn5Bx0xeg0eCz63Rmapn7Bm6kBbO+h89LrI1GE6Y+wZ9Px1Ad+qGVQxqmNyD
         0/zbX6AkaNBUUIHJB81ysnzJZvB787eJqoj7ug4nQ/UiQ5SJNrLKeb2Tx60Jv9XWQnbW
         MajUTbGdYmwJdC7b1gJW94hpBqxtuRE2sA+AF81VP8RNtk7dYWl6YavNo6M/EPMc75Xi
         y81RHrOZYhfQGnH/LGhlSkIh1+HdjzjEI0fLCEl+qaI4wG5wZ2zcM9XzWsjGtFDYRbxi
         fqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8xc1awsQJmhg6vB1XWcio8Inqx7vu6jIuLFBZEo1A8=;
        b=seLJ1YYB7WPGlv1YoCdlgTzWCtkGhsQ9aQECaAjJxmbuGhfTA+Vj3Cunyc9bcsRjJi
         fV/thRBz1mHOpSprt2BB1//+2Ukvl5/HctngGEH5OTMuEMB9H0vnp0/AkUwyGHHQf4tq
         aQwiIIP4cn0qfneb4G2wrFD8WLeTX+hq6BH0BNppyzeIF/yqHAg/dy+PEUqswi16Ftfc
         DM3Y4sXRU+Z4yzzEPwMFAO6nW6+Dvd0oshWM0KLYwsSSS5jPTnq1fpKy/UKUmsdmyimC
         EBM708s38g1bVpGBk3hMIUKKPKvzHduzr1PHuXmi12ely896fWFpbPrmRGgD2+VDk6yM
         xJ/Q==
X-Gm-Message-State: ANoB5pkykdu+gISTPAT4jsq47AnHXDInEhbjx8gZdI8aYWmsnrAYHWzR
	BjLy23EX0459zgzCehTY+/vIyw==
X-Google-Smtp-Source: AA0mqf6Fh4zQrJYos5uGsnmHePnkUgEdVggdPbeQSMN5MDI6BNBsEsLWa93IQMcOp2Y0+0k9g3NPXQ==
X-Received: by 2002:aa7:87c7:0:b0:562:a27a:4a84 with SMTP id i7-20020aa787c7000000b00562a27a4a84mr55730090pfo.50.1670005494008;
        Fri, 02 Dec 2022 10:24:54 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090a31ca00b0021358bd24b9sm6933147pjf.21.2022.12.02.10.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:24:53 -0800 (PST)
Date: Fri, 02 Dec 2022 10:24:53 -0800 (PST)
X-Google-Original-Date: Fri, 02 Dec 2022 10:24:44 PST (-0800)
Subject: Re: [PATCH v2 8/8] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
In-Reply-To: <Y4pBbVQgcTmS7NLa@spud>
CC: hal.feng@starfivetech.com, linux-riscv@lists.infradead.org,
  devicetree@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, ben.dooks@sifive.com, tglx@linutronix.de,
  Marc Zyngier <maz@kernel.org>, sboyd@kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de,
  linus.walleij@linaro.org, emil.renner.berthing@canonical.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-a6f218e1-cfea-4681-bd66-14678510ed7c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_102457_184523_F98EF727 
X-CRM114-Status: GOOD (  20.58  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 02 Dec 2022 10:18:21 PST (-0800), Conor Dooley wrote:
> On Fri, Dec 02, 2022 at 10:13:40AM -0800, Palmer Dabbelt wrote:
>> On Fri, 02 Dec 2022 10:07:33 PST (-0800), Conor Dooley wrote:
>> > On Fri, Dec 02, 2022 at 10:00:35AM -0800, Palmer Dabbelt wrote:
>> > > On Thu, 17 Nov 2022 17:17:14 PST (-0800), hal.feng@starfivetech.com wrote:
>> > > > Add CONFIG_SERIAL_8250_DW=y, which is a necessary option for
>> > > > StarFive JH7110 and JH7100 SoCs to boot with serial ports.
>> > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> > > > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> > > > ---
>> > > >  arch/riscv/configs/defconfig | 1 +
>> > > >  1 file changed, 1 insertion(+)
>> > > > > diff --git a/arch/riscv/configs/defconfig
>> > > b/arch/riscv/configs/defconfig
>> > > > index 05fd5fcf24f9..a23d022974ad 100644
>> > > > --- a/arch/riscv/configs/defconfig
>> > > > +++ b/arch/riscv/configs/defconfig
>> > > > @@ -122,6 +122,7 @@ CONFIG_MICROSEMI_PHY=y
>> > > >  CONFIG_INPUT_MOUSEDEV=y
>> > > >  CONFIG_SERIAL_8250=y
>> > > >  CONFIG_SERIAL_8250_CONSOLE=y
>> > > > +CONFIG_SERIAL_8250_DW=y
>> > > >  CONFIG_SERIAL_OF_PLATFORM=y
>> > > >  CONFIG_VIRTIO_CONSOLE=y
>> > > >  CONFIG_HW_RANDOM=y
>> > > 
>> > > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> > 
>> > Hey Palmer, could you take this as v6.2 material instead of Acking it
>> > please? It applies to the jh7100 stuff that's already in-tree.
>> 
>> Ya, no problem.  Just this patch, or the whole series?
>
> Just this one defconfig patch please, the rest is not ready.
> Sorry that that was not clear,

No problem.  It's staged, it'll end up on for-next when it builds (it's 
behind some other stuff right now).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
