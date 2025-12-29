Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE22CD3B7E5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h25FgFq4+iwNtX2M1vM4WTARPX/DRdidS51Po9RbqY4=; b=prcqOaFe3F+mD2
	a6/z5VUg1iy5z92UMyiFHQxcF3XWdbkFyffvYBHF6FA8X6tiujXsEUllxSexSzQ3DaF3ecBrh0/UY
	xnTzOGEsuJO+dmUZsvrOzX8eCs3zi8tw53fv7oIXVatVEU8+SeU3YLKtMfzrwDoDH1r6x+9GKv5e1
	HJ9Agr0WJWC3rDEYcOJcAFh1GIdPII+wZlTnLpk6Es3ZXB5+hNOVo5M1+zrsPO3pGz2knxneUR0F3
	b5dU3C+Bqtg+uoOn2wsZBlKuJQW0Q9vjCM165Tha2dRCCs/rNCrectFM6CYs0rr9DzG5VL3urXtfP
	BF5rbTULNJ8kc5ou4snw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaDhs-00000003lBI-3QQl;
	Mon, 29 Dec 2025 13:54:44 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaDhp-00000003lAk-2xy6
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 13:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=xX1Wx+X0ubY/b0ellvNUrpD4D9Hg7TMLd6W83ThtCz4=; b=ggtQLHr33ZOQz8YlJhjK/yNRDX
	pQvy/m1tP3q/9UW+xzfEeS5mGhpisIbPUIgnGEfInpduoetS19YkyyNSl6OOdoxK6KLMD1WaNubJM
	UPyF9GrSpxsbatRk0Lu8/u4KvYEalB/sKNjd4u5B1ISocW0l3+Lq1nmJMlEAQCr5huLmHngyEOCgC
	dyPv0YE/3hJwIrL5CEeWrVQ5fbpK6kiwGpATHuEwHoYKZosWDI56K0wJXESuGKF4HsnANcq6jw84B
	wu7QmmTVsOAGchIypX2pBjmJ0+PE0ekqzhISGeIM5/8+gtN5STFMkWqSah94uLI60XEqRkY3Y8o2Y
	7D6XXY2w==;
Received: from [2a01:e34:ec5d:a742:6075:34ff:c68a:2cc7] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vaDhV-00000003In1-3IyK;
	Mon, 29 Dec 2025 14:54:21 +0100
Date: Mon, 29 Dec 2025 14:54:20 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 2/2] i2c: spacemit: introduce pio for k1
Message-ID: <aVKIDOj6x_BYEttg@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-2-023c798c5523@linux.spacemit.com>
 <86c5e338-e630-4933-a123-cfa1201495ed@riscstar.com>
 <6D29D0765AB5632A+aVHiZ9Wph0hNzqDY@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6D29D0765AB5632A+aVHiZ9Wph0hNzqDY@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_055442_203831_892FB16E 
X-CRM114-Status: GOOD (  15.53  )
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

Hi,

On 2025-12-29 10:07, Troy Mitchell wrote:
> > > @@ -474,6 +608,11 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
> > >   	unsigned long timeout;
> > >   	int idx = 0, cnt = 0;
> > > +	if (i2c->use_pio) {
> > > +		i2c->adapt.timeout = msecs_to_jiffies(SPACEMIT_WAIT_TIMEOUT);
> > 
> > Again, why is a rough 1000 millisecond timeout OK for PIO, while a
> > fairly precise timeout value based on the number of bytes to be
> > transferred and the transfer bit rate computed for interrupt mode?
> Sorry I didn't see this.
> 
> In interrupt-driven mode we wait for a single completion event, so the
> timeout needs to reflect the worst-case transfer duration to avoid
> spurious timeouts.
> In PIO mode the loop is driven by FIFO/status progress, and the timeout
> is only a safeguard against a stalled bus rather than an exact transfer
> time.
> Therefore a simple conservative value is sufficient there.

I do think the PIO code is correct wrt timeout. It is not possible to 
predict the time of a transaction as an I2C peripheral can slow down a 
transaction by pulling the SCL line down. Therefore a fixed timeout 
should be used in all cases not only for PIO, and this matches what is 
done in all other I2C drivers.

That said it's probably out of scope for this patch series.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
