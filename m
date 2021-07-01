Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBE6C11F64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 20:33:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7238E61263
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 20:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7238E61263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z85LmVg8r4TZZ9GWlrudH+FZQfhGerghmRMRid6tIPk=; b=KHkBzZUFF3DDa6
	5mRMOdWMwhDtSmcBHiYSuTrlqlIYKvDIsurunlbJYYcF26yUuk9VnLb6Hr+JYwpOyWjrLs7rLPlza
	KlX2QNbSbGqoTFtUdCFW7QtuD9ogBZe8ra0OtJ9lu6JenGVypkTabRKdS+YQxWJb65/m8o1vGEekr
	KpPGuP349TqJx9E6S8ncmAsrMV2AIqR5hWd6VXkKFaUwAjPgWAHX89Tnj/mCvWIQWsC0AB456fhdX
	sZxJzQT7An7BkHn5Kq52yDBtf8ZXDp8oxasaRXRB8+zlxP19kE6bR/vZrhWY2t3j3SVdX43tDU977
	9b0WSIfmoo8VzUwq6+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz3NX-0016Qe-Gt; Thu, 01 Jul 2021 20:33:43 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz3NU-0016P4-DY
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 20:33:41 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so4690895pjo.3
 for <linux-riscv@lists.infradead.org>; Thu, 01 Jul 2021 13:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OJw8rDzzQy3DhiLUvJQW+Qdo9Q9Meb8jwgwdAgUtwaA=;
 b=tjNf5cxiic1IPqklXIFZcopMA88yLPj7nHk9KKLZZCgnA0o/97EhJzWO3mqfHkg89j
 kAvRHnAzxJSzeRsj/R1Zs/iQhGksf/npipynnWtszL2uJSpvaki4kcXwIWo7jKepEU9z
 AkvXC7nruuQI0yxo9nu0Zsq5lpZMHPR9eIKAo33JCgWztrDpK9LqDUDZxTKHqX79Et+0
 tOVNAqJxr7h0M31yRL/TyIChS9QJCX8yhqqE2EuHgPEvtzYiYLIRGE2d9f5vgNazBLv+
 /UJF+LPAjXVH2hfPv2RyTYowAdt+Bpf0XiS2sEUhUqR5QCAmXajtoo8vcnACnaYC80CW
 iRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OJw8rDzzQy3DhiLUvJQW+Qdo9Q9Meb8jwgwdAgUtwaA=;
 b=Qal+nG0At13Pq9LMXbf6fwaG9T7Lfci/UuJLfx6o79VDqwCNwx4Ip9/W9jbaGwm/Sr
 2uyQ/bWKoUbrqmIUaTjzUYirXnEmLuVKHnEmPGC5LFy1Io5Xcr2fWv63LwwZRFweLWnr
 fXOvsD1ZXMDt4Le/W15S7gvOGPZRjOq7ROh0BZ3Pc7EESP2QNSEkAgA602cLn05g6z7S
 WNloUS+O0VZokkISKlsLHct+6Yl6MknDbLGCRslyjNl0lFiKXch/BWVWpmpAdsCqMK0Z
 G56AoEuW5ivOnNTXnlMbD2PLv1ivyWNiQD2Jb/SPZZlFZxc9en0lxo5mBT9FNREdY5Ah
 J/Lw==
X-Gm-Message-State: AOAM531qSrgaXAUgABz/ImqvRSIx48AlvoWdzVwQdIvyf2if3Z9xHYxg
 E4tkWySmgwWS5OoYLsd8k8BtbQ==
X-Google-Smtp-Source: ABdhPJxg+Za0ZEhKlCUXAe3lsXSkyHKiJcX76VwoRNv8bPZ+omjAiffeUdkx0JcSCtpRpL5AW22CoA==
X-Received: by 2002:a17:902:c086:b029:129:3680:32f0 with SMTP id
 j6-20020a170902c086b0290129368032f0mr1419861pld.47.1625171616680; 
 Thu, 01 Jul 2021 13:33:36 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:8fd:ccc0:a9a:cf98])
 by smtp.gmail.com with ESMTPSA id d3sm501203pjo.31.2021.07.01.13.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 13:33:35 -0700 (PDT)
Date: Thu, 1 Jul 2021 13:33:33 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Michael Walle <michael@walle.cc>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Fu Wei <tekkamanninja@gmail.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
 Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
Message-ID: <20210701203333.GA963857@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <8c59105d32a9936f8806501ecd20e044@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c59105d32a9936f8806501ecd20e044@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_133340_504912_A5AECDE7 
X-CRM114-Status: GOOD (  14.81  )
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

On Thu, Jul 01, 2021 at 08:39:40AM +0200, Michael Walle wrote:
> Hi Drew,
> 
> Am 2021-07-01 02:20, schrieb Drew Fustini:
> > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> > BeagleV Starlight JH7100 board [2].
> > 
> > [1] https://github.com/starfive-tech/beaglev_doc/
> > [2] https://github.com/beagleboard/beaglev-starlight
> > 
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> 
> Could this driver use GPIO_REGMAP and REGMAP_IRQ? See
> drivers/gpio/gpio-sl28cpld.c for an example.
> 
> -michael

Thank you for the suggestion.  I am not familiar with GPIO_REGMAP and
REGMAP_IRQ so I will read about it.  Is the advantage is that is helps
to reduce code duplication by using an abstraction?

I did notice that the gpio-sifive.c driver used regmap_update_bits() and
regmap_write().

I suppose that is better than writel_relaxed() and iowrite32() which
this RFC driver does?

thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
