Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8E8C4361B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 09:55:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CBF82310B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 09:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CBF82310B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CttTOIV++bO86suZNCvoA5xD2KGQbqM3DD1XX+lzQI0=; b=YXFqd9rDp7QsnFiF+gc3bmH48
	/KHb53UbV62sIaEtHofDTVrPIkE6Y1dlFfI051eSdlOSjExKqGg4+7tqvlqoS0OMqLT/83QQRiqz6
	tk+OLF+eRgsiU0yn9bA7xwYd+CI2ZPitUxWi/yIZknknW90aSR/c0EJbXjefcZwYHDsazaUo4Jhac
	c1BxqKLfhYIqBXKuKISo6N6AmwAnxZuohzmR1KXUk5s3xZpU0pIBbEHwk2vIwEvp2qUPlCxD+a83A
	Wv/+BqE+dCD6kfXqMUOhm4lwP+IJL9OnGgGDUguNU8hYFsCPh2oK+z8YmGpGFatxxQOb2PUHED/PC
	C+U4FYjeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmDEa-0001pj-CT; Mon, 07 Dec 2020 09:55:08 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmDEX-0001oR-Ht
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 09:55:06 +0000
Received: by mail-pj1-x1044.google.com with SMTP id b5so3257928pjl.0
 for <linux-riscv@lists.infradead.org>; Mon, 07 Dec 2020 01:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c1ijwXEzq1R0G/4ZNI3/fhePYdLBTc+lajLyuEz2YUA=;
 b=uKCAswN8orDkk/9ArXT99bgGq9YbfSr2CYZlDHndf5XxHIHWtM3NBBtvCW+SjDNu8u
 XtEGLeizBhkVDpju/kSCp4aApXDkrlqPAoLtLrqpkIVc75TIxejZMgTiwUe4rxMnLnu8
 pqJx4sRyEQce9iZaeE03pjSD6jGh+4X1+FqxqYCkznJYSjSYheUS6rBI7rwKdOFw+dJr
 OS6I3VwTQkyxRHeufP9ExGOihDKn4rqrXPkmysWDkvtQNxRaL9Kfw2+6X8MSHtjc8X1w
 0p8F8ufzKvZ8FdZlFOIk+OTsoRGM7KRl+Ek7d6ZAz33PikOHJokFdA44u/qIafzzAt51
 CVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c1ijwXEzq1R0G/4ZNI3/fhePYdLBTc+lajLyuEz2YUA=;
 b=IT+svnr4ebB1CntEnw8/XlP1zB4Yj1fReo3AIQVxFs5S2wIM2Q2taGWXwg6acTVKer
 vTXuRU6IQ1fZkKsI9Ki7WD1zOut+kcLRuy+DmsNiQCjPp7whIjEA1ehf1+7KLMdA5/hI
 qfg34PPCu6+VA6ggCKccfWnQu3cUe8gyBfHjzkM9sAjB/igpbGvtH0luJegqFiShOp2D
 Ol0gfVyoMApxMv/5wK+PwCMvyb3P/yOr08RQzS+tAdxnC7tuh3yWmyAG6s0ohMWHgMAH
 zSFEzveaicDhki1L96dTYaD5UnJ6lGHlLHBBj7tB7CAZfVv8n4kKx9lXGCSMfdKr5E/4
 AP9Q==
X-Gm-Message-State: AOAM530FLskV8fe14cJyj0f/IQ671JweNdhV5hgaojrYkLmPxfH67Hwo
 Tz9cGtPkOQ1PSfNULKHi4yFxSp1flZkkyp4N8zM=
X-Google-Smtp-Source: ABdhPJz/GBtiiv3mD5g76WW5o3RgzSnYQjU0y/kBGXP1kpjxGOA1HFRkaaFFh1hoKYOerS2jhHX73Xl3+YMDbw0l4EM=
X-Received: by 2002:a17:90b:a17:: with SMTP id
 gg23mr16092108pjb.129.1607334901092; 
 Mon, 07 Dec 2020 01:55:01 -0800 (PST)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net>
In-Reply-To: <20201203191135.21576-1-info@metux.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Dec 2020 11:55:49 +0200
Message-ID: <CAHp75VcwJw6Dgpi2Oou6eBkL2oO1vmPUYaU5z4V3gFYTCCQ7PQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drivers: gpio: put virtual gpio device into their
 own submenu
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_045505_676185_729D0F06 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 3, 2020 at 9:22 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Since we already have a few virtual gpio devices, and more to come,

gpio -> GPIO

> this category deserves its own submenu.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
