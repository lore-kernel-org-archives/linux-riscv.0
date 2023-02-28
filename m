Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C136C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 15:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7oLUP3+Sm7bSwoIl0Sgf/YUYJAgLaW+goFhw6Zmcxg=; b=08rwfo9EgDRtsP
	AH5tsYWghXZfnQ6/5WLz1uwUVVY4O+ehdyUr3C+NfPaYN/vjZwvKfJN8ZMFp2ZU+YKeJz+wknWLr+
	qW2heVdPsjP460sBJTebSnzeVOp7GFXJAYHJu9y6PIunhJfaVjqFF3sJIxGTnK2ySgAz0/OzsJWOe
	H7mbk3rrA1h6ErZjyFxljJmfCJl/+GEaRyrO6clvuQMgEXZv+TjoA99nAzqka+jPCbi1psnkfIPhZ
	15A+6kWMoz2RXM3LWWU9riA0ISl7OMoaV/N4U82Lbs9gaeoN23knSq5S3puZcxyGg2keXDAOB/f25
	Spm4InCwdr+qftapdSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX1yN-00Degu-D8; Tue, 28 Feb 2023 15:32:59 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX1yK-00DegS-1i
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 15:32:57 +0000
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 012333F5A5
	for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1677598374;
	bh=MxHdDFD0LZ4lqDSuQ7dNAtCj1307wWzr5tZplqj4BbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=nvzJMryAtGoQUlXxmAugjKDlF4cew2WJPboIVJHi+UR4qik1cNK9ZCzm7MXE1Xf9I
	 XRTeF7ITRB2sjpmM/B4gGlh9HjDkTESzuKhy8WXm8MhlJM3sMHjX/iHnmHdo+FGS0O
	 jVJsCFanpvOKmC/liloaeWLuIYSQbSFHtdiLmKKCwi2+kRYIDI+Q/niqhQ11Jbtacq
	 t477EZPRthPgGrZbMaOj9qu62plD3PRIhSLhT3dFSUX47Dx86QbTmtqm+bB3bQ6jPi
	 HRMfzAMJG8xgyBQ+Ine/B6DgIMGRGU88824G7C+m291VLM26ndg2y950qvl4k525rs
	 l0Szjk/ybGy3w==
Received: by mail-qv1-f70.google.com with SMTP id jy22-20020a0562142b5600b005710b856106so5386788qvb.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 07:32:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxHdDFD0LZ4lqDSuQ7dNAtCj1307wWzr5tZplqj4BbA=;
        b=yvCZ72xVR5rP+yuGwpmgVU6bUtKPasPq0+LC8ezf7C7+oiB6PyPye5+wcWzelHcaNP
         VRF2BNnLj7JcbtsztjDp7cMbleO9Msar61g72Ni7HQcwYy4g+rlfvOFXdpcMoiBEeRR/
         rRRtTT+T2ut5ZHnLKMcbuUr+Cwt0F7Y1hAl6pxS8XhyrEfuqM1FJ43ziWh2ecSfyoPZd
         6a388KQVWEOAc6814FcpRjnjGDkA//l+brq35Pg9iybB4eNJII4J+HHwpmlwcl9chNOX
         5CC8VepMki6/ymZe3eALkdVPl+EpIMCyXf8Pm8coldHpnyIb6MZ1/wzNrwZ9LmoUaXmA
         YbeA==
X-Gm-Message-State: AO0yUKXvpgnwzlbxSJy4Kg+4lUqs8KA2Kmq5EO2BRicG7GgXBEn2INcB
	Oo/uO8OJHnlmNwVxDhRbzKeholl05xSMtFZ4KS3Eoljtoui8P36Censj4OFOOb6GX2/7f8JIUhE
	Z7yvvyQ4o8yPR0b/1MJFpo5ahTwKVNZdiR1qXYvf931fVO9+CgF2HuS1VB6Wmgw==
X-Received: by 2002:ac8:208a:0:b0:3bf:ba7f:58f8 with SMTP id 10-20020ac8208a000000b003bfba7f58f8mr920411qtd.3.1677598372902;
        Tue, 28 Feb 2023 07:32:52 -0800 (PST)
X-Google-Smtp-Source: AK7set+vE60RGwdOA8UUFJRwNsAQZ/kwLQYFX4Nc9zP11EaSjRPR4xRHceTxsK0vKVbpvi3VXQAqOdeQU2k/GNXG/Io=
X-Received: by 2002:ac8:208a:0:b0:3bf:ba7f:58f8 with SMTP id
 10-20020ac8208a000000b003bfba7f58f8mr920400qtd.3.1677598372674; Tue, 28 Feb
 2023 07:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
 <20230220081926.267695-3-xingyu.wu@starfivetech.com> <CAJM55Z823iqUqD8enM0qJ_MA3Tw94Mn0mq71fbLT1Qjo2s2J3g@mail.gmail.com>
 <0ffb02d2-0bbd-fd0d-b0f6-cb5605570050@starfivetech.com> <CAJM55Z_hRpUYueZ-XuWUx1NfAsL9E+-4ry9TYeRWM_bKXvym-g@mail.gmail.com>
 <Y/3coFvMWOLaaY9p@wendy> <545c23f3-1d68-2bff-89d9-584e3ca31044@linaro.org>
 <Y/3hVlp/YPnWHDCX@wendy> <f9e380f6-334f-11fa-1118-8d6c3c9befaf@starfivetech.com>
 <d2aada79-61c4-0cc7-7b09-058564ed9fce@roeck-us.net>
In-Reply-To: <d2aada79-61c4-0cc7-7b09-058564ed9fce@roeck-us.net>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 28 Feb 2023 16:32:36 +0100
Message-ID: <CAJM55Z9G5omehjgDJncPmN6n7zUCVwrMuqDKLXCDs95LtN66MA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drivers: watchdog: Add StarFive Watchdog driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_073256_451974_EC39EA45 
X-CRM114-Status: GOOD (  24.82  )
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

On Tue, 28 Feb 2023 at 16:10, Guenter Roeck <linux@roeck-us.net> wrote:
> On 2/28/23 05:16, Xingyu Wu wrote:
> > On 2023/2/28 19:11, Conor Dooley wrote:
> >> On Tue, Feb 28, 2023 at 11:57:58AM +0100, Krzysztof Kozlowski wrote:
> >>> On 28/02/2023 11:51, Conor Dooley wrote:
> >>>> On Tue, Feb 28, 2023 at 11:36:49AM +0100, Emil Renner Berthing wrote:
> >>>>> On Tue, 28 Feb 2023 at 10:44, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
> >>>>>> On 2023/2/26 22:14, Emil Renner Berthing wrote:
> >>>>>>> On Mon, 20 Feb 2023 at 09:21, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
> >>>>
> >>>>>> So the dt-bingdings need to rename, and which one could be better,
> >>>>>> 'starfive,jh71x0-wdt.yaml' or 'starfive,jh-wdt.yaml'?
> >>>>>
> >>>>> Sure, starfive,jh71x0-wdt.yaml sounds good to me.
> >>>>
> >>>> I feel like a common comment I see from the dt folks is to not put
> >>>> wildcards in filenames & just pick the first compatible.
> >>>> I could very well be wrong on that front though...
> >>>
> >>> First compatible is a bit better, unless you are sure this will cover
> >>> all such compatibles now and in the future. For many bindings the
> >>> family/wildcards were fine in filename.
> >>
> >> Ahh cool, good to know what the specific policy is - thanks!
> >
> > If this watchdog driver is improved to also support JH7100 in next patch,
> > it seems more reasonable to rename the dt-bingdings to 'starfive,jh71x0-wdt.yaml'.
>
>
> Up to the devicetree maintainers to decide, but I for my part never accept
> wildcards in file names. You can not guarantee that all of jh71[0-9]0 will
> be supported by this set of bindings. On top of that, when / if you add
> support for anything outside that range (say, jh7200 or jh8100 or jh7101
> or whatever) you'd have an even worse problem. Are you then going to suggest
> renaming the file to jhxxxx-wdt ? Or one digit at a time ?

Makes sense to me, in which case this should be called
starfive,jh7100-wdt since that's the first SoC to feature this
watchdog and will hopefully be supported in the next version of this
patchset.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
