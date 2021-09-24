Return-Path: <SRS0=er6D=OO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B7EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 16:18:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32DA260F4C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 16:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32DA260F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jrTLJRhBgxLm26uPSLUVXwcJuUVptccnonluo2PzMU=; b=z2sHyLejPVqEy+
	tUU7n5CH1b0N6GJs/TSXuPRX+MTbeSnGB6b9Y26c/eidRzWioZcFiQPZkZtWhcJDZa6k4jJho1On6
	hKzZgSu1AFk9On1Use9g2HqA0ZeUJsoPXwCLezxq+q4HhujG8Xd/bxP9DC6HbIkNzeRGxh5FlVH+w
	qdP0ZGOvZLKvt2Nij+Dh/qgtJZ0aFcDz+EPAWTkTnrBD+np7oGrKOSqjMIcKpJUf8WDZAkxeLMF8P
	Lbgdb6ecLKp0Wtekcp6efYDAsg+8UgVc40c/Y9Ix8G+HlBikBahFJ+JbnhPN+cHj2Gu6l524sSMMN
	6HmrC1+ZfFz2ljsCdwfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTntM-00F2ct-49; Fri, 24 Sep 2021 16:17:40 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTntJ-00F2c1-6R
 for linux-riscv@lists.infradead.org; Fri, 24 Sep 2021 16:17:38 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 045FB40192
 for <linux-riscv@lists.infradead.org>; Fri, 24 Sep 2021 16:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632500251;
 bh=KBx9ZIG9pk67r6r2VuWSGeMfVxfkgdUANVfh9snsj/w=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=dAswSHzKl0s707SiR8y4pAWH8sLZR1SHbQdcA4Sam7G0IYZZusLLbXYjs0/Tsbrab
 eOns1KAmUJJ5hJF0GKE77IKxNVXX17LZsCIKATvK3WocfIeZK1ONyAJx3VIUmiAe4s
 PwAjf4STtL+YYllhQa3gYx0HKlbHsE56UJHcGmUjr6c1WIXRlx4AglOqOUpwRfS/Qp
 ZcPBjdMZ3oBaKantx/+dwIXI0Z6MPQX1nGbqQryVz72JVBQa9WO9Cx/MH+4kvEPyJ3
 0yz1/kvo8YIXNWp2X9EZTqshHitYkbMXgjRctRqdpGAQftPO1nNa/SiyktL64SfcCx
 mPB0iiL3q5v8Q==
Received: by mail-ed1-f72.google.com with SMTP id
 w24-20020a056402071800b003cfc05329f8so10787565edx.19
 for <linux-riscv@lists.infradead.org>; Fri, 24 Sep 2021 09:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KBx9ZIG9pk67r6r2VuWSGeMfVxfkgdUANVfh9snsj/w=;
 b=w2MKTIzilfSezNQguzuaVotgeq6xOgXCnN5vINoNGFC2Hujo2F5vE7U6u2KuNkUnlA
 QAlw49v6qigizljPfC05P/MowB0K3l3AwLpWzZMOkI60o9sPRH7RuUelXu79cM+mHQm8
 mc5ir2xKJk5zrEKbIzgrr534H8HkFZhHOdPBKzw0eRBFVEjX7LUHHAX/7ngWtQ/pSC10
 nsyPA9/EhMheT+9MrzLjCmyjlUt9W/08sOcSNIuUYoFip2TMtZIZrwDDVnXsA8xgwYm2
 qVFRpbRVOuXuCC29lhH//A7jK3ttaXqWui2YCoKu6D5c3RWW9+W+3eB0zN1UdyekweK6
 MEAg==
X-Gm-Message-State: AOAM530NtIBRT/UQZ+nA0YNGaxqMaQXkx8YjpE/wJytET2NHf6XgYIwM
 ed+ZDEhtlMaVyZ1whOf83o5FxgZeV0K3t4cTiQMzfQm/CUavYsRdgZVLM55KlxQr2NTMe8ya8Lk
 08Z4Ig4X1MVqUAr93++w67uZ6+UkWpr8qniQu0c/UmXZBWPoBeLklma1xUUnziw==
X-Received: by 2002:a17:906:6d9a:: with SMTP id
 h26mr1977393ejt.96.1632500250642; 
 Fri, 24 Sep 2021 09:17:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwku+XUwuiLJ01GyS7qt08lWT0BlPKeGf2p9ERVpv0HQ7csZAV1Ggp34V7Bt8BIK//306rSX3iJJt7v7/BJKo8=
X-Received: by 2002:a17:906:6d9a:: with SMTP id
 h26mr1977374ejt.96.1632500250436; 
 Fri, 24 Sep 2021 09:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Fri, 24 Sep 2021 18:17:19 +0200
Message-ID: <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
Subject: Re: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: Support Opensource <Support.Opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_091737_433594_6FFC01DC 
X-CRM114-Status: GOOD (  25.78  )
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

Hi Adam,

On Fri, Sep 24, 2021 at 5:04 PM Adam Thomson
<Adam.Thomson.Opensource@diasemi.com> wrote:
>
> On 21 September 2021 06:34, Alexandre Ghiti wrote:
>
> > The SiFive Unmatched board uses the da9063 PMIC for reset: add a restart
> > notifier that will execute a small i2c sequence allowing to reset the
> > board.
> >
> > The original implementation comes from Marcus Comstedt and Anders
> > Montonen
> > (https://forums.sifive.com/t/reboot-command/4721/28).
> >
> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > ---
> >  drivers/mfd/da9063-core.c       | 25 +++++++++++++++++++++++++
> >  include/linux/mfd/da9063/core.h |  3 +++
> >  2 files changed, 28 insertions(+)
> >
> > diff --git a/drivers/mfd/da9063-core.c b/drivers/mfd/da9063-core.c
> > index df407c3afce3..c87b8d611f20 100644
> > --- a/drivers/mfd/da9063-core.c
> > +++ b/drivers/mfd/da9063-core.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/mfd/core.h>
> >  #include <linux/regmap.h>
> > +#include <linux/reboot.h>
> >
> >  #include <linux/mfd/da9063/core.h>
> >  #include <linux/mfd/da9063/registers.h>
> > @@ -158,6 +159,18 @@ static int da9063_clear_fault_log(struct da9063 *da9063)
> >       return ret;
> >  }
> >
> > +static int da9063_restart_notify(struct notifier_block *this,
> > +                              unsigned long mode, void *cmd)
> > +{
> > +     struct da9063 *da9063 = container_of(this, struct da9063,
> > restart_handler);
> > +
> > +     regmap_write(da9063->regmap, DA9063_REG_PAGE_CON, 0x00);
> > +     regmap_write(da9063->regmap, DA9063_REG_CONTROL_F, 0x04);
> > +     regmap_write(da9063->regmap, DA9063_REG_CONTROL_A, 0x68);
> > +
> > +     return NOTIFY_DONE;
> > +}
>
> I will talk with our HW team to clarify, but this sequence looks to be very
> specific to the needs of the platform in question which doesn't feel right to
> me. As was mentioned on another thread as well, the watchdog driver already has
> a restart function to reset the device (and thus the system), so I don't believe
> we should have multiple of these.

From the discussion that happened here
https://www.dialog-semiconductor.com/products/pmics?post_id=10052#tab-support_tab_content,
it does not seem possible to use the watchdog on a chip whose OTP does
not set AUTOBOOT. But anyway, I'm looking forward to hearing from the
HW team :)

Thanks,

Alex

>
> For board specific sequences, there are machine quirks I believe which can be
> used to handle stuff like this, if this really isn't a generic solution to fit
> all cases.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
