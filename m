Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B589C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 18:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=91OGhE8dZFmOW6lw8jT3VnpZPDthMDZL8y5i4a8mw10=; b=BtopwJv8aALdSykZjb0N+uaSF+
	CTYuMZz2zaaAWWiaKPRXK5AqOA0igTxdpPlTzmF3nmoiWtTRVmw+vF0t5tviIkoUzC9bACpw21ZSO
	r2ssPD8LrfnBZb0C6MXJD3NSFd7EO4PJ5aB7TUr2Jhy+l4Whg5Rs7gAAjOWT2nbsek9LQKhNdQoOH
	Zte5m8vr0SOj4t79E4pzjUvDNc+QT1Kgr9A4C0VEJ4OQhxstPskt+51RmFMVYjxqMmubc2NkaYzc0
	+C1bnDpnIOcIcDzecMS3cK3ybnoba7C5YNPAu2ZkrsufB5rhPVB71n7mc1A8IyzfskjoFwaCNfd1u
	e/HgUR8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSNl6-00Djjw-Gl; Thu, 10 Mar 2022 18:43:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSNku-00DjhE-G6
 for linux-riscv@lists.infradead.org; Thu, 10 Mar 2022 18:43:22 +0000
Received: by mail-pl1-x629.google.com with SMTP id n2so5671713plf.4
 for <linux-riscv@lists.infradead.org>; Thu, 10 Mar 2022 10:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=tcpBRCafFc96YxnPZZLvkEaHne7CilEHy5P37o4x8ck=;
 b=drKB5SD+IaQ/lbOpJMWzuxBZpu4qNINYeoR9Dfa1/e7QULpShvQXkKLpwkaJsb6VMU
 h7zU3G6FIY+7Sle0SJkKVAHNPiMFZ6bVlATjydENqws5D712HHusL/XiAeDqNOceKXNm
 Rm6fSH1IIcLFr1IM5qO1CJkjOs7r+DfqnjffcTWhx5TJRtjQAMeQqhuwbRGTV5TnMOdn
 4V2l78p5pt6ClktPzOdsl4b7mvQWvLQH9l3Lw62pJTiZ2+jrUXm14SKaZesZpAzFy/oh
 dEIOvI7ua2moWSWIIzIqil/kSW7dYuncbDWtBOobJcTIQVAPUqDyaTM5p6zQdm8Yhkys
 jTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=tcpBRCafFc96YxnPZZLvkEaHne7CilEHy5P37o4x8ck=;
 b=JDd3I+p2opK3fuxryA09Hwb2xbjq/EoUIMqGVcnFEJq9lHhJxNokWEwx9GdIgaqFTd
 Ofq5R9JXULvE9mZlN/Ps6+ASoiEa95m9y6pKknDIQ4LFRqG1QQCVxgO6Da2AgwO4Ystf
 vSAEt2zCDndvR9Ll2T7F9he2hs+SZGl5E3MkL+kDZI79lt8nqBckJwTZsh+LsdzhWnnO
 lQC6cr730YMoM9DOZ4eWv4rbCe3HMgCsn8k85Ij6pAcbk/eOYtoHi4q1XkeBOkhKfXfy
 +gRfXk6jw05kuGdUx+b5TLHOD0WbryPMh74wC/1CPmKqEV/6g2P5hdfB2fJhkzWC4Y9H
 4u1Q==
X-Gm-Message-State: AOAM5316NEu+lp++pkNLsJW+ChYW6cOwNMh4wBt5XTfTBwOHxoHU3tr8
 Dav8wlhOe3hGTw7/Vl4whbfrQw==
X-Google-Smtp-Source: ABdhPJy7mK7tcW9bJZHWeSSSFfJysyM03XwzSfo27k2AdDj7qjT5wZlQfOtMqBxnANvtn5ZXO39LUQ==
X-Received: by 2002:a17:903:1108:b0:151:9c42:7d1 with SMTP id
 n8-20020a170903110800b001519c4207d1mr6587067plh.54.1646937799272; 
 Thu, 10 Mar 2022 10:43:19 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 i7-20020a17090a65c700b001b936b8abe0sm10434790pjs.7.2022.03.10.10.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 10:43:18 -0800 (PST)
Date: Thu, 10 Mar 2022 10:43:18 -0800 (PST)
X-Google-Original-Date: Thu, 10 Mar 2022 09:32:08 PST (-0800)
Subject: Re: [PATCH v11 1/8] RISC-V: Enable CPU_IDLE drivers
In-Reply-To: <CAK9=C2VzzT=GDyuptuxQj0y++Rb0SaZXCuoL1+ncpGWcYHqr1g@mail.gmail.com>
CC: pavel@ucw.cz, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 daniel.lezcano@linaro.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
 robh+dt@kernel.org, milun.tripathy@gmail.com, atishp@atishpatra.org,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 liush@allwinnertech.com, anup@brainfault.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvm-riscv@lists.infradead.org,
 guoren@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: pavel@ucw.cz, apatel@ventanamicro.com
Message-ID: <mhng-203b51aa-0594-403c-9b79-2eb763fabfd3@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_104320_546986_9113421B 
X-CRM114-Status: GOOD (  14.89  )
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

On Sat, 12 Feb 2022 04:49:46 PST (-0800), apatel@ventanamicro.com wrote:
> On Sat, Feb 12, 2022 at 5:13 PM Pavel Machek <pavel@ucw.cz> wrote:
>>
>> Hi!
>>
>> > From: Anup Patel <anup.patel@wdc.com>
>> >
>> > We force select CPU_PM and provide asm/cpuidle.h so that we can
>> > use CPU IDLE drivers for Linux RISC-V kernel.
>> >
>> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> > Signed-off-by: Anup Patel <apatel@vetanamicro.com>
>>
>> This is quite... interesting. Normally we have one signoff per
>> person...
>
> I was working for Western Digital (WDC) when I first submitted this
> series and recently I joined Ventana Micro Systems.

IIUC that's the correct way to go about this, it's certainly what I'd 
do.

>
> Regards,
> Anup
>
>>
>> Best regards,
>>                                                         Pavel
>> --
>> http://www.livejournal.com/~pavelmachek

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
