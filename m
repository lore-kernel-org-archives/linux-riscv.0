Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D35DE784BE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 02:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXQc0VD6NwD3VPa/YZ0BgEeSuNFW0WTuVty71ieG5ko=; b=Op5HqK81DihQjT
	BZQwUHyjzA6lRYbCmsBf7WOmCHcpp3N1TXF/e+jtDYlMwVjX49g2//0lrAFUDjBy1rcXNcJJS0C0+
	ofWzxWzNnIyrrFX4XC5MyY9vZnJrbuZrBIFZMMwy3HEtU1cMDckH5Ewk9ZU7hZHkmGgD10jahnAZ8
	Soml44l0Tcph70zxxwTqvrQeT4rRccjM85UhvbbDfP2Ql+MyiKv5iY3x0Jxd9giaMQFIzgfvSrOws
	bVTNejZmJm9HNZvbzBm2pPrgeMlolF3JIRyPSsOBF5pKe0cyOeoAt8dF6NngLjPdY2HhweH1I9+3H
	2yrQ3CuYCrYQ1M33n8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va2df-00000003DXX-2yq0;
	Mon, 29 Dec 2025 02:05:39 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va2dc-00000003DWG-23FL
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 02:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766973842;
	bh=OqWMuLjdapot//N3NvuB4l+zklMrdOffEYwGgfD2C90=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=O12pKL+GYsdHKo5EWgLdpZaDQ3sxefz3x6lmXWSYCTuCewSTnpj0jw/kG+VhkComT
	 z8I5d75r2/6Ar7+57CX0CUea+UXYu3M5/gbPnfaNyB4XMAvukQNYYoUBieF6FzLWNq
	 XVE5Guxs9XAYQPWHLLZWddMjyLBYp+hzY4pozPPs=
X-QQ-mid: esmtpsz10t1766973833t9bb2683d
X-QQ-Originating-IP: S/Zy3Pu7yfoJ+ndNXakBGuGQdXCO8KvbiFwk2sGnHVQ=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Dec 2025 10:03:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17634020045709217909
EX-QQ-RecipientCnt: 11
Date: Mon, 29 Dec 2025 10:03:51 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 2/2] i2c: spacemit: introduce pio for k1
Message-ID: <68BEF1A67DD3F4D0+aVHhhzvaM49Mm-0d@kernel.org>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-2-023c798c5523@linux.spacemit.com>
 <86c5e338-e630-4933-a123-cfa1201495ed@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86c5e338-e630-4933-a123-cfa1201495ed@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OURTxbnUKnoogJPvoj13Ldped4AdrgCiqhWgyUFG+beu09Aa3dKauLyg
	7ot5VkX8jeDuaN3hTyrtilEEgprGAEwkCi71eIadFgm+R7PWYdr9KFOs5s1Ac7JeDYEkBOy
	oBp0mWigBuSVdCJU6NcbwyZu516r4rU+N80iR7ULwOj5O/ZKvg+9LdqlAdZL3Js96MBBF1C
	nQsD4rQB7FthZsSvoZgRiNK+QU7tVO0zA+RcBgEkZyRBiA7ynEzSseBPQIM3Zx6uH8Xk93g
	yH40/RVK3B3gUsdSBtsCvKGcfwZHsGqHT0bLvLVyuaKc43RHL2dsqLcmsRuBWTCX7rOKJGf
	BXUo2TAB9w9Vh2Zb0SyNfdBAuRxMI3d98XM0jXuD7WhtXHEKRTsqHn7EThzwr0DcxmDg93/
	iNU6FXXz+ATuJFKRTz3vLVqUF93fnrzyKbEb/BBd+bHzkS5v6kBqE7SbklchhsJRV72tu4H
	tCqbt7rfmWKGtvy0Tq+ZYfbivE8iOUlzpJ6puEbUeSt279hxivXtmdVyh+gzhvRxt9SnF8D
	9ZvIBqv+aSk5YIJuAl+KO8PiZNB8LqwrKec9IjvsjiGOho5Y2qakjvUNuqrv+jmDCd/u+uS
	yv1K5+F55AUgrq+RbpXO1WI2QQS1CO37fgDeMINpUxe1h5ONT/o54jYH4jEmBctn+u7q6nk
	sRLLR1LMyP2u4lZWJqwo65wJqeMKrf9lkj8VdMOtTyEzl7KyrYbUA04bShZVtAX9KJSJPv4
	kI6WG+ADmgP+qFpCShJ/cEA4/tuBjyfBzkYQICr2SVLzh8erm75CibMRRmNGZ1YuSIheJ7u
	8T6PfS2qfO9N6Yfd2BwOzKK+3v/KJdbLSwrOolyey0MAqKkDRMj4zIyO8lZfRdqjojeEVnr
	Kgh590EQJBuL7cJQPoX6dx5vtnGqYxeT/5aCxDzphfeCRNys9N9j0xqMODxjaqb8IhcGrTj
	VPQTwGVEIfyHfwTFaWBLHxD9Xcz5PUyUQB8DUaTO+gzcCILSup9fan6bm7IoBl8pSUV/aOJ
	12jgu1/ASBPY5WjTKnHphrKw0/FdOJaGqRBK5nZpTI4PrbxJXzRocAhfWaAGempX5e08LYo
	TQzLL5tEsTxDrDibZiFVvIJKn7HshmWeQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_180537_224824_6B8D4EBE 
X-CRM114-Status: GOOD (  36.63  )
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

On Sun, Dec 28, 2025 at 05:24:26PM -0600, Alex Elder wrote:
> On 12/25/25 9:31 PM, Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C in atomic context.
> > 
> > When i2c xfer_atomic is invoked, use_pio is set accordingly.
> > 
> > Since an atomic context is required, all interrupts are disabled when
> > operating in PIO mode. Even with interrupts disabled, the bits in the
> > ISR (Interrupt Status Register) will still be set, so error handling can
> > be performed by polling the relevant status bits in the ISR.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> This generally looks good and what I say below doesn't
> really ask for functional changes.
> 
> I have some suggestions on comments to improve readability
> of the code.  I still have a few questions related to delays
> and timeouts, and when you enable TX and RX interrupts.
> These are more about explaining/justifying what's going on,
> though in some cases they might imply an improvement that
> could be made.
> 
[...]
> > +		 *
> > +		 * For the tx empty interrupt, it will be enabled in the
> > +		 * i2c_start function.
> > +		 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
> 
> I don't think the TX FIFO empty interrupt is "erroneous" in
NO FIFO NOW. Data Byte Register(DBR).
But the comments below still suitable.

> > +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
> > +{
> > +	u32 mask, msec = jiffies_to_msecs(i2c->adapt.timeout);
> > +	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
> > +	int ret;
> > +
> > +	mask = SPACEMIT_SR_IRF | SPACEMIT_SR_ITE;
> > +
> > +	do {
> > +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> > +
> > +		spacemit_i2c_clear_int_status(i2c, i2c->status);
> > +
> > +		if (!(i2c->status & mask)) {
> > +			udelay(10);
> 
> You are looking only for TX FIFO empty and RX FIFO full
> interrupts.  In this situation I *think* you have several
> possible interrupt conditions occurring.  Some questions:
> - Would observing one of the other possibly conditions
>   at this point be an error?
> - If so, is it OK to simply ignore (and acknowledge) these?
actualy, we can.
but I think it's better to check error here.
> - Why is the 10 microsecond delay required?
To ensure hardware stability, even in interrupt mode, the bit is set
first before the interrupt occurs.
> - Is it reasonable to delay if you see the RXHF condition?
The delay is only taken when none of the expected bits are observed.
> 
> > +			continue;
> > +		}
> > +
> > +		spacemit_i2c_handle_state(i2c);
> > +
> > +
> 
> Delete the extra blank lines here.
> 
> > +	} while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0);
> > +
> > +	if (i2c->unprocessed)
> > +		return 0;
> > +
> > +	if (i2c->read)
> > +		return 1;
> > +
> > +	/*
> > +	 * If this is the last byte to write of the current message,
> > +	 * we have to wait here. Otherwise, control will proceed directly
> > +	 * to start(), which would overwrite the current data.
> > +	 */
> > +	ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> > +					i2c->status, i2c->status & SPACEMIT_SR_ITE,
> > +					30, 1000);
> 
> Why is 1000 microseconds the correct timeout period here?
1000us is sufficient for the hardware to respond; if it still doesn't
work by then, it's considered a hardware timeout.
> 
> > +	if (ret)
> > +		return 0;
> > +
> > +	/*
> > +	 * For writes: in interrupt mode, an ITE (write-empty) interrupt is triggered
> > +	 * after the last byte, and the MSD-related handling takes place there.
> > +	 * In PIO mode, however, we need to explicitly call err_check() to emulate this
> > +	 * step, otherwise the next transfer will fail.
> > +	 */
> > +	if (i2c->msg_idx == i2c->msg_num - 1) {
> > +		mask = SPACEMIT_SR_MSD | SPACEMIT_SR_ERR;
> > +		/*
> > +		 * In some cases, MSD may not arrive immediately;
> > +		 * wait here to handle that.
> > +		 */
> > +		ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> > +						i2c->status, i2c->status & mask,
> > +						30, 1000);
> 
> Same question in this case.  Also, symbolic constants for
> timeouts are often better.
See above. Thanks. I'll define it.

                    - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
