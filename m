Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0282C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 14 May 2022 12:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6e7lNlYf8B1ZgJrxaJgoQfJFnMjCf4BTpqQhi80CD64=; b=0XGblQSNSs4mSI
	NvPiF0DrvQlsvjX2RPGG60biGCK0jPgyAt3bqFjsDhkLExq8rjqfmeB8euc2cgAGaJm+MO5vwDyOO
	GfFP6xSbFLeloUC133vlkOxWTFbdnqxt7jac7X48NfmnDH4nQ8Qbsix+bERQObm5yGPh+DWFt6O91
	Fbx4kfjPpmq0c9SyMmGqvNav2jmhrfBKMdrR7OYYNhCHgJ4pMdZ1yGAX5Do/4PmHHSP4rBPo+3eLO
	ynki92usignHwM3lpRXhFKPzs+aTutsI03p/8IHk/hU+HPX4kS0TJVoHN7knSi9isAcSrVUqFCdwS
	5U3idGXEp5WlGib5/eqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npqje-001Opu-4a; Sat, 14 May 2022 12:19:02 +0000
Received: from mail-qv1-f43.google.com ([209.85.219.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npqja-001OpC-Da
 for linux-riscv@lists.infradead.org; Sat, 14 May 2022 12:19:00 +0000
Received: by mail-qv1-f43.google.com with SMTP id n10so8809163qvi.5
 for <linux-riscv@lists.infradead.org>; Sat, 14 May 2022 05:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OtoP2XbqVMyoMGXah/2mkYSD35yqmPo/cBhku3xFzP8=;
 b=3nCvIvL2GFjaArRl8XYlmcHL/WUqTxq0WMgbQEskz3uBq4ABMGbiMhTDY9R9G8oDY/
 Q7NUVSTZKgUerdL51KrkOLz6QvxRAqNySQ9/Z0ZmHBGBUQ/qKUA8v9SLkr3tXnPWpn3Y
 TJfoBzXRMJa74j1mBcSkPcYZYXWb8LWh7tdi9hUWTZd7HCioUasXRnfkhRGI5zt94bUm
 WcuHPkg0IK+afAlH8hpHz4GrwU3f6uFFOivUu86pxUA01nOHrWRSruvSj6uhJy4lx21G
 9Nzn5YTsET8sVr7M6IKofJ2uXlVnFYFBqq2Hs+4URdBnngmDAVge0lBMMKQxTX1Zydw2
 wKjg==
X-Gm-Message-State: AOAM530GmuyGHlRVG3VhoFM4Uy3Pi1xf0b1F8L0j/Zuvq0GO4yHIPOTR
 LnyDPzyBeEyOsybNl6jFW2a13Jfqjcj31g==
X-Google-Smtp-Source: ABdhPJxOuQjstXnyHVl9TMWqMFknxz25Bh7zdE3TVM7sqzrkA9e1Rkd3ard4eoXp/vDkuNg9gmI3fg==
X-Received: by 2002:a05:6214:20ab:b0:45a:cb44:7d44 with SMTP id
 11-20020a05621420ab00b0045acb447d44mr7954286qvd.63.1652530735993; 
 Sat, 14 May 2022 05:18:55 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 a18-20020a05622a02d200b002f3f087c919sm3203230qtx.97.2022.05.14.05.18.55
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 05:18:55 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-2ef5380669cso113489097b3.9
 for <linux-riscv@lists.infradead.org>; Sat, 14 May 2022 05:18:54 -0700 (PDT)
X-Received: by 2002:a81:7383:0:b0:2fe:c9e4:cac with SMTP id
 o125-20020a817383000000b002fec9e40cacmr3999688ywc.383.1652530734763; Sat, 14
 May 2022 05:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220503172926.08215c77@canb.auug.org.au>
 <3f94c9a8-c927-5cc0-7d67-4b21c3d9dbaf@microchip.com>
 <9a424be9-380f-f99c-4126-25a00eba0271@microchip.com>
 <20220509141122.GA14555@lst.de>
 <dd946220-eaf6-773a-06b4-307cda466c9c@microchip.com>
 <505d41d1-1bc8-c8bc-5ebb-8a2b7934f3de@microchip.com>
 <20220511062232.GA32524@lst.de>
 <102578f2-5c10-e9c2-c1ef-e76ba90d011e@microchip.com>
 <20220511064832.GA761@lst.de>
 <2c0e2fbe-4e45-4acc-c2a7-4f4dcf9161a3@microchip.com>
In-Reply-To: <2c0e2fbe-4e45-4acc-c2a7-4f4dcf9161a3@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 14 May 2022 14:18:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJuErxg16jFQEJhMwTgAt2AcHOGck1REZY6j0OpWwH+w@mail.gmail.com>
Message-ID: <CAMuHMdVJuErxg16jFQEJhMwTgAt2AcHOGck1REZY6j0OpWwH+w@mail.gmail.com>
Subject: Re: linux-next: Tree for May 3
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Linux-Next <linux-next@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_051858_494616_EBC61533 
X-CRM114-Status: GOOD (  15.48  )
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

Hi Conor,

On Wed, May 11, 2022 at 12:13 PM <Conor.Dooley@microchip.com> wrote:
> [    0.000000] Kernel command line: earlycon=sbi debug

That should work without the "=sbi" part.

I've used "earlycon" and "earlycon keep_bootcon" successfully on
icicle before.

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
