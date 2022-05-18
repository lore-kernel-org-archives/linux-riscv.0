Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C605FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mqyW6ay/7NJHw0kZspnS503gICoXzWd43xqK0s5GgQ=; b=BkBT6HQGwhseAM
	0Q7Y6FSTQywtfmzLoQeWS/fJ8FTB7fOSReo03Uu3GvC8e+h2Qvrs+sYVvccCcNuXSpHmBcv615FjC
	DFH+UhohMGGWHfnLOl77+Fd5JnHMI4OyvwjUk4+Sj7sgiaaibJGw0euDza3kaUq9m7dIkFPsBAf/r
	745d6FBJtoSN2EyiWdh2NULj4tj0Zl6XDJJf0t/FD1FLq8ZdmR76MbUYe6xCkv4DilckFt2XT2qzJ
	MhC80CdrgiZ7VNj7wz4U/qVXwq1nq/9McENFzwqcvx/wOOX/sJAzYc0djaCjB+EkRdTHPxcNJFwBl
	5Pa1TH6ttQDexaKESPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrLBh-002hAu-Iv; Wed, 18 May 2022 15:02:09 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrLAk-002gT4-Ey
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 15:01:13 +0000
Received: by mail-ed1-x530.google.com with SMTP id j28so3342219eda.13
 for <linux-riscv@lists.infradead.org>; Wed, 18 May 2022 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QMOlyN/qTFm2XsoAL3zOzGQtzc1v4ZBdV7QAODxVM04=;
 b=S0/LlJPilupWVBxbepDWd4ALkj1jqFqOGpfsYt4oZz1IbJPM2jChXarVWCnPFrIQy9
 hu+uwPwW+dDlDg40DIBipE6hUIF+wt9Go2ORD00La3rPSt5ZM4A7EA+HWaxRqKql3jBg
 PM5Z4S/a3eM9dT8FMxAWQjOUqRtNfmTPxZlmzlCrpcT9qLLizJLUhLxpkxpj1SXuGHi+
 fLtlM7OvbfQQQhfiimB6ceSJKoRTW5RkRzk+nw2SkhaqBHDUvzffTR6ZIj+tx/L5IyMl
 aZkm37p4XFtuIYaoXm4tPfoiMUacEeEXWpqPzpnl5kmFA+0CGb1S6fXTYHw1ROypza5V
 2pKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QMOlyN/qTFm2XsoAL3zOzGQtzc1v4ZBdV7QAODxVM04=;
 b=I+kJ/+r+LUyEokVro7hl8kEf+p0HfVDlp0IwHp//RZqayQAengNrFx+QjdSgGl4Fgd
 jrhnr5Ey9SVN/x3VHSE/UeTGaS5pyINTCilJm2gxt4qVFXZOWbhQANcGF1ACu2px/b2f
 INqJnj+3YeDML7zRJa7RTdzgIQYUUJFEC9tI0fMosC+nc3cGI4I2m9c1wA9rdUkLD/yh
 jYazbtKbR7uq25bCwGvvpyoctvoEhPm/IlgoYOUQxe5ptt0K0XYO8iIaFVtpo0c4r1ep
 3VJkdkSpGH/Ikh6vdqGJKz+Vn6a58YpJK2It+jH1elmnVBhiauPgVsfVW9RIsK/wvAY2
 aiHw==
X-Gm-Message-State: AOAM533q+HWVit1TQJXLWSW6cxG9QT2rJ/HnPjv8D2sWvidS0zyCEBAO
 r27S+8ZiIoz23m/9kV1LxhS+XN/yl6fIAv8OxLc=
X-Google-Smtp-Source: ABdhPJx8zUUBtXzXZ1/JGjDJmNbcSqyN0kVGya8Y12DFmgeWY/u12Mwo4rQLwdEYIPgK87Ktme506w5enXxDiPAOj64=
X-Received: by 2002:aa7:d911:0:b0:42a:af69:e167 with SMTP id
 a17-20020aa7d911000000b0042aaf69e167mr189743edr.54.1652886063021; Wed, 18 May
 2022 08:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <e6380b316db23ee03a9adbf0a7d1ad83538f9961.1652884676.git.geert+renesas@glider.be>
In-Reply-To: <e6380b316db23ee03a9adbf0a7d1ad83538f9961.1652884676.git.geert+renesas@glider.be>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 18 May 2022 17:00:26 +0200
Message-ID: <CAHp75VcWuYM=STsNW5mP19UBTkNmnhP_Ed+pUxoAhTU3JiWXtQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: Make the irqchip immutable
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
 Serge Semin <fancer.lancer@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Damien Le Moal <damien.lemoal@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_080110_557476_CC240AF0 
X-CRM114-Status: GOOD (  10.24  )
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

On Wed, May 18, 2022 at 4:40 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the dwapb driver:
>
>     gpio gpiochip0: (50200000.gpio): not an immutable chip, please consider fixing it!
>
> Fix this by making the irqchip in the dwapb driver immutable.

Same comments as per PCA953x driver.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
