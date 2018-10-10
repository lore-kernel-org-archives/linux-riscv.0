Return-Path: <SRS0=k7QB=MW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE75C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Oct 2018 13:01:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BB6D21479
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Oct 2018 13:01:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DJ9xio2W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BB6D21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+LuQoR/x6r8RjlaLf5wrbxHXxpgCoRtHUvFy5nPvs4=; b=DJ9xio2WAkzVbl
	rN1wb5KI8P8TLxLYfv7IEh7yISCiYwEnbIqDeioc7jF2p0y5A6atnfM8nL8fJfjHq6kgNLH08Ko/H
	Qvftz3p6dM0sNpdoQjdVoJcmFtVQAAWQ/hMDKA0tyztYVLMIpSM5TlqQqq/KA9nNrgoZJYxby3vnV
	RkcWNxHb+UmKQKGWseHXFswWvEKpxEhF8w3/LTl/XPfPR7M988DnjnMdR7tmpdHwo1XV2Kb65HSsz
	3TFNPg8mn+hWx+gPX6KdE435NpFGnIYS0P+gIs5/p2gIxLx4E9AVI4nwBL4FRn+OTxpNJ1b8EmrNJ
	3Hw0Np2FzAdqTivIqFBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAE7h-0006Rj-Hj; Wed, 10 Oct 2018 13:01:57 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAE7Z-0006Pd-3o
 for linux-riscv@lists.infradead.org; Wed, 10 Oct 2018 13:01:55 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 99608B09C;
 Wed, 10 Oct 2018 13:01:35 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 4/4] gpio: sifive: Add GPIO driver for SiFive SoCs
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-5-git-send-email-atish.patra@wdc.com>
X-Yow: Are we THERE yet?
Date: Wed, 10 Oct 2018 15:01:29 +0200
In-Reply-To: <1539111085-25502-5-git-send-email-atish.patra@wdc.com> (Atish
 Patra's message of "Tue, 9 Oct 2018 11:51:25 -0700")
Message-ID: <mvmo9c22bx2.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181010_060149_303647_7416F455 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linus.walleij@linaro.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 hch@infradead.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181010130129.C2Y8gJgIJwXRmNjuiuEhtSwR-u3nblsy2EnSver5-Us@z>

On Okt 09 2018, Atish Patra <atish.patra@wdc.com> wrote:

> +static void sifive_set_ie(struct sifive_gpio *chip, unsigned int offset)
> +{
> +	unsigned long flags;
> +	unsigned int trigger;
> +
> +	raw_spin_lock_irqsave(&chip->lock, flags);
> +	trigger = (chip->enabled & BIT(offset)) ? chip->trigger[offset] : 0;

This should use test_bit instead.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
