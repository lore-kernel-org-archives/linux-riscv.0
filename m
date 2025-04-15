Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C986C369B4
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AmchuaLxxQS8bk9LHkgtOtNZLf1g5Ll8jkFpmsQt5o0=; b=Ji1SRglqrh36nn
	4KPuBFCUtr9tKVDItT2pjUxm9jyyYpVgS6X5Fac1tHDjuLdNCVDaN3aitJqzQJc3OlymL7wqtpvfk
	I0smI1Mf+9JKPS7Dt4sU+9ZLMVT7e0C6Z2uSUf9SiuDKc9jmqOlELg9LHJj0RivovN1L1pe5E93ev
	NF1wNYlOtrDAQqBlpH2IzQF9TxkfKLFa5x7lRuwmIJDKWDLyImoNGfhut+iYfukeZXfkAyEZUg5FV
	YJhGZ9R0jfCcY7nkQoK2OwBlACAbPMrdZCGpRP90BTvh2Axv7Y9Qxi1dHAz958DGGCzsgI4NN7+Iw
	3eaDM/dRwC0SclNb3yjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fST-00000005kj2-13BK;
	Tue, 15 Apr 2025 12:32:09 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eZr-00000005ZNA-2t0Q
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 11:35:45 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so967120866b.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 04:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1744716941; x=1745321741; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pkqqzYwJDoJuIeZZPwpHJ2MRsjSPAwBXLsvMGsDE+Bg=;
        b=mz6Raxpr6AlObo5/8sWyn3iMvA9qv/aslarXmLLYZf4qObXG/Im7/SqQyEDyGsUjfz
         OFHk1+JEjKwnCsUxPMSo6jynw7vR68MIpHtZVIEJF87mNR4tFr7Zqkc1UHkvKLJmX/Zk
         bYC7VhK1eBhDY1E+XixbdMZMncDra8N0zlb7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744716941; x=1745321741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkqqzYwJDoJuIeZZPwpHJ2MRsjSPAwBXLsvMGsDE+Bg=;
        b=Xi2f5diMWN/DILgJQXJBd0tzEVsDU4NthB3Wnbhic0byIcSi9aPv/qFn/sYsFCgOpk
         h0E57PVmjzk7ZBaLRfhwFN/0MWVMZE5soYg9Hsa8PDSKrFrzqo4Q1sfSaxcRswp0sKQx
         958wGG/ZaH2qkG0MA1aSPSzRh6aaOCkMWj5KHNjV0Uaq5fTVDhfaGceUuDyofImGjzyP
         xE4sgNVMMKoBYIfaVFnV+JXQOZhfN0+mWTAKMyBJipzIlkj0o4Ew++gbNvKmnV7hofBz
         yawlrZtd5WJ2l2YvoSht0q23iDVKoQHVyt7sz77v5xY2tF+4nQ9614aqzfneSODcs5j2
         tZNA==
X-Forwarded-Encrypted: i=1; AJvYcCW1krA6pwtABetwmWmCJM3l6GY3TQxp7SM1HwDKzOzF5kpd7W9ykzwDuQkVxti66nqILBO39O+l59094A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjVmESDNUYANVjj7TwDj64FFCIccgTAz2XOLWTrVRugTytp8t7
	1ixLnzo0MSAzQjRrvtGx/Sg8hqey0Z4GwhSnsNGfpKWb21fughJ3TxgQg1O8J8+KIn2EvEryyPL
	EKZV4rc7Q6pOx0ptjwnMH5/ltZZA=
X-Gm-Gg: ASbGncvFfuUzcclc6XIKwrXTjC5TgP7xghMATM/qtD7vfb+9F7hLTCDvCWzpzMVQA3H
	RaMd5V2NSTx+Wjl9BqNMZ7LDDEJRYAuH9YyhWsVGNKEqd4zr2TSrR/VuFd0F9P8x4mSzuX1Civh
	VbgKmRsv5PkQSJ1w4p8cvaOg==
X-Google-Smtp-Source: AGHT+IHYtWmxRb1h/9Ed6RQJAlthThOKISfswlcnjLlsTmTRhCoOZakeQRtjzFuee85QkqC4Mrvb3LbI6E4eNg9sJ7k=
X-Received: by 2002:a17:907:3f1d:b0:aca:d2f0:d291 with SMTP id
 a640c23a62f3a-acad34449acmr1560876866b.5.1744716941335; Tue, 15 Apr 2025
 04:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250404062235.671872-1-joel@jms.id.au> <4f58ae70-16c8-48a4-9eca-35c61e7c8a58@ghiti.fr>
In-Reply-To: <4f58ae70-16c8-48a4-9eca-35c61e7c8a58@ghiti.fr>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 15 Apr 2025 21:05:28 +0930
X-Gm-Features: ATxdqUFwEZoPS9UEp2TtK6MpsalUmg531xlh2-kkZddRChaVG8L1BnWuCaMiKsc
Message-ID: <CACPK8XdCPWRz37DoHH9rG23R5+4-FEe_HyjeuLL+hmFU0kS+XQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: config: Set MEDIA_SUPPORT_FILTER
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_043543_840995_2AD7B748 
X-CRM114-Status: GOOD (  18.73  )
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

On Tue, 15 Apr 2025 at 18:32, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Joel,
>
> On 04/04/2025 08:22, Joel Stanley wrote:
> > When Hal enabled MEIDA_SUPPORT in order to add the VIDEO_CADENCE_CSI2RX
> > driver in commit d8a7d89abb09 ("riscv: defconfig: Enable StarFive JH7110
> > drivers"), it turned on a few hundred (254) other MEDIA drivers.
> >
> > The subsystem has a option for this very case that keeps the other
> > drivers disabled: MEDIA_SUPPORT_FILTER. Turn that on, and
> > MEDIA_PLATFORM_SUPPORT, so the CSI2RX driver stays enabled.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> > The filter option only appears in a small handful of arm32 defconfigs
> > (and I maintain a few of them). That's because MEDIA_SUPPORT_FILTER is
> > normally enabled unless EXPERT is on.
> >
> > The root of the issue is the riscv defconfig selects EXPERT. Most
> > arch-wide defconfig don't have that on. Need to get to the bottom of
> > that, and perhaps disable EXPERT?
>
>
> I could not find the specific reason why we enabled EXPERT in defconfig.
> Given the description of this config
> (https://elixir.bootlin.com/linux/v6.14-rc6/source/init/Kconfig#L1545),
> I think it should be removed from defconfig instead, that will fix the
> "issue" your uncovered here and maybe others?

Yeah, I agree. I've prepared a patch that removes EXPERT with some
commentary on the fallout. I'll send that now as a replacement for
this patch.

Cheers,

Joel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
