Return-Path: <SRS0=HcYa=DW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E318C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2020 14:49:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00AAC218AC
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2020 14:49:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yoUibJuo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4M9tXza"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00AAC218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZeFKYh1ojFWeIxzasSGGtNEBvN1DcAIb1gXOIoASIOs=; b=yoUibJuokHyFPwTpLDr8BZdHr
	GCd4Aa0BitACVwkBCh/ABH9CZiyb6e3BvQlamZwQkCAV3UOXESMp29hQk4z2V904CjQJ+PjdaDozR
	pUpN78j8OaP1++bqAiU8F/G5H6WPZuHGUQLHkqJSGHGaWeUc8z5hjEw/b3dfFL71dzAFResUcuPYA
	tIpAC+LU2cN5Trc64EOLHttAh/V5KObctMIo0JdoakUusF349TfURYNWIgz3DGmPQtcn03tHOKX8X
	gjRj1Nu8+7tw/sY9UPK7O8DOI2CDs69W6Kzju7G2DujBzdQbn5ZNIq1MHWMQB7YreW3d8RE0wcq22
	EpYUFTeHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT4ZA-0006IQ-7m; Thu, 15 Oct 2020 14:49:16 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT4Z8-0006HV-A5
 for linux-riscv@lists.infradead.org; Thu, 15 Oct 2020 14:49:15 +0000
Received: by mail-ej1-x641.google.com with SMTP id qp15so4045098ejb.3
 for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2020 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=bC6Nl9n/zHgP1uI3o+7xI4KbkfFL+8Ry+Pfph2DVdA4=;
 b=O4M9tXzaT6OTcXbp3RGumZRRBkKLagSkr9ylWhmM2HX5xzYkjELZJbAEJAXiCPpWMk
 qT2ss3NXSn2uoj1L0HYV+yniDK1h8k41/mwYbO2t5ljw8H6V7ZJHx53nHHQzVm5PwtRg
 rniEZobRWrtQ4aN1RMEacxfYStEanHAly/fvPlXahpriGaWSGlF2X4uX09pUPgXrPmJa
 cTG6jU8+UrL9ibJCd0eqGjQWsRwrusL2jWDVv9aVDT7Q5b8FK5cHl+Cd3BXWDUXvwqpd
 hTTM5EAIH2Qbsi5YYgGycKzjww5pwUAXrLfgi/5BrV38a9gCvfBnM5i29Sl2ZKjvFE1a
 dyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=bC6Nl9n/zHgP1uI3o+7xI4KbkfFL+8Ry+Pfph2DVdA4=;
 b=DbG2BrWT194qUTV3AWE52/DfpNXzS42lNc0LZlksHmDE9p9qXIsvOp3eUXxLQ6I7Qk
 j5V+//ZGXdRYmoxszwNLhmsn7KULiCbPe+4AiQ+PD8wV0iKc9DS7A0U0nX+wHvNLbw3M
 /AzNfabtz9uiTTW4iR9KixGN4FKOkOZfqOd7tYop2nVCvhY7RhUu1QdieH1UDwaXOlOj
 67/8TfGCvuBwY/tCnm5myOye0Xlbjr3Z4+RL7JtlL/j04V2Y8aFcOWZ/b0fTn/sScExH
 KNoTswc5vFRFo0Zmz2QJiKE8rK9Q7UHuFwZP8bcl9e3CVn+O11xsDp6d9YCV/pduEbHW
 LQWQ==
X-Gm-Message-State: AOAM533AefozRiXQR6aAVHWukS7VNAT6uCT+MmnehJ1Urm1SyM5dvQuP
 TV4oFZu0+t0S46Bmm+vMIP+jBE272pI=
X-Google-Smtp-Source: ABdhPJxr0HXg+w6OMU/X8WM2yd7oj6YKVweugY0BRAkBqIGztsdcTDwYdmEKLsXKjPgdz8FGo8S6QA==
X-Received: by 2002:a17:906:c315:: with SMTP id
 s21mr4644832ejz.296.1602773351336; 
 Thu, 15 Oct 2020 07:49:11 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 j18sm1676259ejc.111.2020.10.15.07.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 07:49:06 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1kT4Z0-0000j3-2J; Thu, 15 Oct 2020 16:49:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v3 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
References: <1602770907-61852-1-git-send-email-sagar.kadam@sifive.com>
 <1602770907-61852-2-git-send-email-sagar.kadam@sifive.com>
Date: Thu, 15 Oct 2020 16:49:06 +0200
In-Reply-To: <1602770907-61852-2-git-send-email-sagar.kadam@sifive.com> (Sagar
 Shrikant Kadam's message of "Thu, 15 Oct 2020 07:08:27 -0700")
Message-ID: <87mu0nr1ct.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_104914_362406_D51D624D 
X-CRM114-Status: GOOD (  23.84  )
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
Cc: andrew@lunn.ch, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, linux-i2c@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>>>>> "Sagar" == Sagar Shrikant Kadam <sagar.kadam@sifive.com> writes:

 > The FU540-C000 has a broken IRQ and support was added earlier
 > so that it will operate in polling mode, but seems to work only
 > in case interrupts property is missing from the i2c0 dt-node.
 > This should not be the case and the driver should handle polling
 > mode with the interrupt property present in i2c0 node of the
 > device tree.
 > So check if it's the FU540-C000 soc and enable polling mode master
 > xfers, as the IRQ for this chip is broken.

 > Fixes commit c45d4ba86731 ("i2c: ocores: add polling mode workaround
 > for Sifive FU540-C000 SoC")

 > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
 > ---
 >  drivers/i2c/busses/i2c-ocores.c | 22 +++++++++++++---------
 >  1 file changed, 13 insertions(+), 9 deletions(-)

 > diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
 > index f5fc75b..1dab02d 100644
 > --- a/drivers/i2c/busses/i2c-ocores.c
 > +++ b/drivers/i2c/busses/i2c-ocores.c
 > @@ -686,17 +686,21 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 
 >  	init_waitqueue_head(&i2c->wait);
 
 > +	/*
 > +	 * Set OCORES_FLAG_BROKEN_IRQ to enable workaround for
 > +	 * FU540-C000 SoC in polling mode.
 > +	 * Since the SoC does have interrupt its dt has the interrupt
 > +	 * defined but it should be bypassed in driver as this SoC has

NIT: Looks like there some commas missing and the wording sounds a bit
odd to me. What about E.G.:

     /*
      * Since the SoC does have an interrupt, its DT has an interrupt
      * property - But this should be bypassed as the IRQ logic in this
      * SoC is broken.
      */

 > +	 * a broken IRQ, hence update the master_xfer to use polling
 > +	 * transfers.
 > +	 */
 > +	if (of_device_is_compatible(pdev->dev.of_node,
 > +				    "sifive,fu540-c000-i2c"))
 > +		i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
 > +
 >  	irq = platform_get_irq(pdev, 0);
 > -	if (irq == -ENXIO) {
 > +	if (i2c->flags & OCORES_FLAG_BROKEN_IRQ || irq == -ENXIO) {


Alternatively you can move it after the irq = platform_get_irq(pdev, 0)
line and just clear irq, E.G.:

irq = platform_get_irq(pdev, 0);

if (of_device_is_compatible(..)) {
   i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
   irq = -ENXIO;
}

if (irq == -ENXIO) {
..

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
