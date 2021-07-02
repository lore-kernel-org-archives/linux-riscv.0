Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093A8C07E95
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 21:06:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABB4C613F7
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 21:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABB4C613F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKwKip0FjehNzmZaT+nmhFDKDA0+tg4V9Mwj9yWyEcA=; b=q0/Y9/HgXcJ8mt
	YZiubNrWmQQq3+DNiu2ZSeHVL2vhpEMWaEt7VntFsIqfrVj6xPUc0KCRRnysdBU+C/fsrYGDqV9oc
	Lm+yWFmSwtoxJVb5nP3PxdfjB0EAps/cNWIEpub9EFSuQeJPodKnThWRD1SAVS064Ba+NXX79oFCf
	ZFH+Yymv2UwzA3k6evlE0owC6V2OrbZdzPPkBCgoJajpwHOrbi7Veh1WrlW7FIc7lIWnpKlaSPvYi
	CzcZF5+DzKbZ2dQJjVHbwtOSwc6jQt07yRZU+SBGwz74dCPR22ekS//ZCgaXYn990Dq+ZhhDJJuvA
	jMgLVlDON4rg6eXepBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzQMn-0044Bj-0h; Fri, 02 Jul 2021 21:06:29 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzQMj-0044Az-WE
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 21:06:27 +0000
Received: by mail-pg1-x530.google.com with SMTP id o18so10283864pgu.10
 for <linux-riscv@lists.infradead.org>; Fri, 02 Jul 2021 14:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OpVpNG5PdIOsyE2/baO4DULhvG00e5R4dqnavh04Ink=;
 b=YnRY4frEsLOR2X5JQDhXEVJjrrC12WG4u3FQOj+g2HohLvPTbY+W8HqenFA8DYsiBm
 Jg4IBRVzheBDrtbtPNHBP+bsXQvdg6SWTJpPOzs3rSyVQZt30juoJUu265W/K0miviaA
 ZSGZBPAFyJAwiDl61isghwjEA8e0uQUqhkbsfgXtoNPZit4sY2BPJJtnFZ7St/El1fXT
 lePrlDM2Vlc0zgdI6HJrUkJ02fYjf+hz+8TvjDTHr6fOhswBePCqVpqO+GqjrzIEiWuP
 KL2/npP16iMg8+YiUtwvMR8KbF+9W1KqYUUUuY8TFD2pkZ3Gaj90ggRgBJSw+K/kMBxN
 BUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OpVpNG5PdIOsyE2/baO4DULhvG00e5R4dqnavh04Ink=;
 b=LlfoIt8zv8iYkcvVQe08idpcV8SzGb1nj6cW5LlSN7MZptj3BVcV0uXK2iHEPrYEAN
 SD0GTvbJtmVYGsCoKof9tgjTlsJcao4/Twr1nETivjd7bN2yeoD37aDpePKPdpqS/QiF
 Br/Bv3Zh6Z5WtyKkfWI7rA0r3Zaud0PrBxJUGrXXXqhQCK66N4C+weDGG3hI2d8ETDsN
 l77+OY6jAxxZyMrGHFdfUnrwl+symzTe+1DwoBDIWoQRyPKIVam7pp4wtdZCaoOwl3vT
 RN66ul8d0YLwi7aSuVOQE6/sVe9on3jtMl5RuK7Gsr+aOdpQyPyrEYgx8leX7mja6CNB
 BaJA==
X-Gm-Message-State: AOAM5336MPQGh8cq9QHe2uBtpVIL2T6Gc0BEnVHIJak9D/OFMezKf/Dq
 yVvwLR96hjqg2OyQ8Kvq5THQ7w==
X-Google-Smtp-Source: ABdhPJzkAP433AVzFBS/AZjSe9EjtY4rwpCx74jnpJV7AUXJbksu88JccTFnHfpjCdDLi6sZYUNP3g==
X-Received: by 2002:a65:4389:: with SMTP id m9mr1852746pgp.184.1625259984817; 
 Fri, 02 Jul 2021 14:06:24 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:f236:257f:88f9:445e])
 by smtp.gmail.com with ESMTPSA id b65sm4409256pfa.32.2021.07.02.14.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 14:06:24 -0700 (PDT)
Date: Fri, 2 Jul 2021 14:06:22 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Fu Wei <tekkamanninja@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
Message-ID: <20210702210622.GC1035183@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <CAHp75Vc7kFk_SC8MSmFE5mBt53=4yUnxpSpr=cxZ+7eA-t1r5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vc7kFk_SC8MSmFE5mBt53=4yUnxpSpr=cxZ+7eA-t1r5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_140626_086646_2B9231DF 
X-CRM114-Status: GOOD (  18.34  )
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

On Fri, Jul 02, 2021 at 07:03:19PM +0300, Andy Shevchenko wrote:
> On Thu, Jul 1, 2021 at 3:23 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> > BeagleV Starlight JH7100 board [2].
> >
> > [1] https://github.com/starfive-tech/beaglev_doc/
> > [2] https://github.com/beagleboard/beaglev-starlight
> 
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> 
> Seems some Co-developed-by are missing.

Thank you for suggesting this.  Huan Feng originally wrote the driver.
Emil and I have made some changes to reorganize and clean it up for
submission.

Do you think all three of us should list Co-developed-by: for our names
in addition to the SOB?

> Brief look into the code brings the Q. Can't you utilize gpio-regmap
> here? Why not?

Michael Walle asked about this yesterday and it was my first time
looking at regmap and gpio-regmap.  I've been reading the code and it
does look like I should try convert this driver over to using
gpio-regmap.

The open question in my mind is how to handle the interrupt type (edge
trigged on positive or negative, level triggered on high or low).
Hopefully I can find some other examples that can help me think about
how to do that correctly.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
