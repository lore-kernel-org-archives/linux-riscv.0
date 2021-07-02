Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D2AC11F68
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 16:04:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35111613F7
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 16:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35111613F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uag8MR1iPSKYlkGi+qOC7SPIeDQzvdaUZUjgUOX0poI=; b=DWOBbjartIaxbA
	75nVqBhoRYIJAw99zCtwrfOqoUvuMy/S0g9KCPAAMnrgpcMxZLi0SPtcchtireLCTKfs9c+q00fkO
	taulcddsRVXYEtPg139+OKQFpHcBzpOdU2iKzOH8CyVGJq+BbK3x7tUevTNTepoRIOHoq/3CV34eg
	uaBrAN0MNIN9/NyHg2lf+Yb/I2AwEsQHH1QoAdgVB/p6yxpQrvVn9RWT3kzZ4qEi8l5ZhYiO+rj6B
	kdWmcEUkqcWtM8KK6QvpOusSIcB6Iu8tobhDUu4D4kPs4EPJ5B18rgsHjVtaQ1rHlWM+PuDJAQ9GA
	hB6OxXgqIEDLlpaGntMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzLe8-003UnG-LL; Fri, 02 Jul 2021 16:04:04 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzLe5-003Um5-HK
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 16:04:03 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 p17-20020a17090b0111b02901723ab8d11fso6354986pjz.1
 for <linux-riscv@lists.infradead.org>; Fri, 02 Jul 2021 09:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+LJxKyVwoQ+McSsqpufkf/CYhmI4kyUuSVLHiImkPFk=;
 b=KnJsFvBpqL0laNoKqrPj5CdbK3FVhLgqkbPSRmYyPg1p2wAhvTkQOQ22fwT0eXUXFd
 7lWVchk2oZ8YShvCcZdqdfvxzNk4FU5ZPqHK5YrEUN1opsTmHcLv24qgPJkJjNqzRkWb
 TwuMhHwUIw561vklch5cYfbA0IQRsF+K38nz2zbM3fjApX7GsoBp/saoLrl7h7QKBS1t
 CHls9gLe2eUz0LOcOevl8AQi2KeJjvfD8hYx7co0MFZwSh8zIgBq/hHyUCUsz91BBHEn
 czKTssMkgy/94ip1d5kDPdD35s/WyYnXjvDe/AeYPMQ9W4CvGPOoKMNAjhRj+AqUKSXg
 Af/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+LJxKyVwoQ+McSsqpufkf/CYhmI4kyUuSVLHiImkPFk=;
 b=p8L2crhFalhoWDib8SURJR1q1S6CVwrpfddJ2jvSRelXxXFQEey4B7sS7761Ilo5tj
 /Wnmn9MVrmtHU62PFYGImQQQeQ1QicPatXDC2IBKbdNtC0QRX0o2rPamvbZDgwpWYVgR
 UKfmDCchNFE9MYe2TcfAsMAZkYqr2qZXK/4uDTewilCcQZj+PvFU/+qLnRnBWXwysqLp
 C3+MJTF07Gu/D5jS9lSmUsQjXQRycwmZ5SMJ9r3x2xJ12BmzUFU6bOlKeqeWfZyainOq
 Cg0UgK0nFRBEUg1nxfyAUO2Mhjh46tsE6rKYVyd4SSeW//0mOcnOLtu8L1gQdCAVu/B+
 JGnw==
X-Gm-Message-State: AOAM530OtWdq7IgdI+gDKUdY4jHKs00+TJ9wCkDqrr4iGf0E4RXXQmw3
 V5L8wPxhAAztzTyJDFzS5LztfJIU0OhrRMIGJfM=
X-Google-Smtp-Source: ABdhPJxunKummMJzWu/tehysV7Xsz1mBbx1VNw8K62HhbO027E9yy7oOifD4dymMRm7PjyxqE1uMt4oWnIRqaEZrUQs=
X-Received: by 2002:a17:90a:af90:: with SMTP id
 w16mr457973pjq.129.1625241837450; 
 Fri, 02 Jul 2021 09:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
In-Reply-To: <20210701002037.912625-3-drew@beagleboard.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Jul 2021 19:03:19 +0300
Message-ID: <CAHp75Vc7kFk_SC8MSmFE5mBt53=4yUnxpSpr=cxZ+7eA-t1r5g@mail.gmail.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
To: Drew Fustini <drew@beagleboard.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Fu Wei <tekkamanninja@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_090401_622636_F11BC4D7 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jul 1, 2021 at 3:23 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> BeagleV Starlight JH7100 board [2].
>
> [1] https://github.com/starfive-tech/beaglev_doc/
> [2] https://github.com/beagleboard/beaglev-starlight

> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Seems some Co-developed-by are missing.

Brief look into the code brings the Q. Can't you utilize gpio-regmap
here? Why not?

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
