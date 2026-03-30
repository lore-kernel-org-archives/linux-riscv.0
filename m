Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB8BFB3CE8
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 09:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xc/LC0cxh0/7Kk2mYPZbM6N0i0YgDZqaFltSbsVqWwU=; b=uxMzQKBrkxqz1A
	bKwWGMSd5kt50ZZZ/82Eou+GmoLmzdcMJ1R8T04UTtZY5KpH13c+cErJUFEpVS77Spi7TwGTv8M90
	JnBGs1gfuSS49ue3yolFa2cWfbeh9Eb/eBLixaLqsO4O2GxoQPBegzWsH0J2OnbAhmrdilBZfcHiN
	Y/N3vtF5CcWjl/KdLpxXjlU7+mD6+SeaY4vE1BcYWdpmpHDdXSELzDhx797xBfr52OVEuvGRV4YIs
	qa3tjmTrIJoPGBXIfeSz2HhkdGLwu+GqVkFdNtna9ishnOrCfXh5QjGQF4weGAgvhPVFoJ/fuwGus
	hZFJ+8h/d7iCdsO2SU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78rM-0000000AxWK-0Os9;
	Mon, 30 Mar 2026 09:24:36 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78rI-0000000AxVj-2hHF
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 09:24:34 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2b081e87eso280214e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 02:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862670; x=1775467470;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CbJf9Iw+tHrCrJt1ufQhWH5yjcoDbD42PT8F9ETtZDY=;
        b=lTCPSD0NZmYIGByb2S9A7rJxbFNBv2JPgCDcJzLn8rXVph72UeNYxmxF+1diBPJp1I
         9J1cec6R+2TnXFiDvDQ3Ah5gsI3m2aboRifx9TdjXd5a/W217Reti7n9voc+HoR4hwWm
         tjgYzoX14Zge4PBjBNGDWkdt/h3n0myu88lQIoClARqYrE/hgkSOvhsxqMsbvdlkqyua
         qkfAgDob7dN5g4q1pI68Eg6FjULa8zslSsimScXihFYLzV1w6SbtbezNzsJGOV/ZYkzy
         dqINZoiKQP7miLPTqWtW8RwlcwTOsQp0QVImxGrgEe6a6wJ5XDspzfsOHoGBTwvzCckb
         EqjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7xGOQgOqbNTjtRsBVriKJbUc1KMCqQiRhqtPjJJ2oRXfHRMt3O19z9dFMli139GIU4yvydnWVCakh/g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2vDuvYulXO56CYVsCb6EfAlH18M2B2sxh6uyKGmq5j43FBGDL
	nox0hYhXAzoTB4jOeGOOl707AlXauJL4qigCMIvHq3U48pJ5bS2MtOLkHUq8akhE
X-Gm-Gg: ATEYQzzihFRyrWOk6nP27KLiejwZkndtGv8ZClpszU8JE1ypYRsmhdCKQgNh9RYavZB
	PEaQuvF24GXsYV/H9t09h02o+TgMcXeN7ZUpnY9gYBdUw/BRfsru+TN00J88ChB4tK8/d4pyZ+2
	KpsEbd6kgmR5yHiEqSICRSWsKSJdAtD73HTRQt0fMBGhTgIIImrbDZm2gVohgqTtP+xqG0RUtXm
	nNdxruJVbGnMkkQTdAYdEjIgZSvH0tq4iiJiKpMI5TIcaUBuDNQEff3JkxDSfDGWsI3J2fxHInV
	sIrQDakbVPDjeoAL0YL0/R/ERL9W+HrTqDZwKaBuINbQ1wKO46uwcZzGfAOqaeHZsIP/u6Tup4J
	u1PXGKkNbAE9k6mT/go30CxoQeBJJsjVWTtq+wlkrY/nfoJQaKexdHJeYswdHSFxesc7uq+xOl1
	7WdikbeoAjwn59efSIZrqKUU16UKpkkXp35ZZIFi3eOJBA310=
X-Received: by 2002:a05:6512:3096:b0:5a2:7ce7:e3c1 with SMTP id 2adb3069b0e04-5a2ab92ae38mr2553569e87.8.1774862669672;
        Mon, 30 Mar 2026 02:24:29 -0700 (PDT)
Received: from localhost ([176.106.245.85])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13b13bbsm1534889e87.0.2026.03.30.02.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:24:29 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 30 Mar 2026 12:24:24 +0300
Message-Id: <DHG0B03HM9S2.2QXKTJEGPI65B@altlinux.org>
Cc: <soc@kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Hal Feng" <hal.feng@starfivetech.com>,
 "Conor Dooley" <conor@kernel.org>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
From: "Ilya Sorochan" <k0tran@altlinux.org>
To: "E Shattow" <e@freeshell.de>
X-Mailer: aerc
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
 <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
 <DHCYMK8FEH10.1Y1YWLL3J1HSK@altlinux.org>
 <ff792101-61e3-4470-9c5c-eea375edc9fa@freeshell.de>
 <DHDFR4K758TP.291K17J2J5VL7@altlinux.org>
 <a77f7c9c-4357-47df-95e1-f6e0f5a7c02f@freeshell.de>
In-Reply-To: <a77f7c9c-4357-47df-95e1-f6e0f5a7c02f@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_022432_709237_5A4D7F92 
X-CRM114-Status: GOOD (  10.67  )
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

On Sat Mar 28, 2026 at 1:07 PM MSK, E Shattow wrote:
>>> I'm glad you sent a patch, but I still object for the other reasons
>>> mentioned.
>> 
>> I'm glad to talk to competent people in this space, however I still hope that
>> the kernel will refrain from breaking this feature until it is really necessary.
>
> I hope you'll continue on to review the BootROM r.e. effort and cite its
> code snippets in patches so adding bootph-pre-ram hints covering the
> eMMC SPL boot method from StarFive Loader, retrospectively describing
> the SD Card SPL boot method from StarFive Loader, and/or secure boot
> crypto accelerator functionality in the starfive crypto driver (what
> does command=8 and command=9 do exactly?) The exact nature of the bug in
> StarFive Loader UART XMODEM incompatibility could use a proper
> description, and SPI Flash configuration parameter analysis, too.

Unfortunately this is beyond my competence. This exact issue was fixed without
any r.e. only using git bisect. And while it might be interesting diving into
learning how things are I'm not sure I will.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
