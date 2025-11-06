Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10674CCF9F8
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 01:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y80hUKGJ6jjmYkhm2GVd0gxLy5tAhvRHiYpsQehTK3Q=; b=BYUU4tpM//H0iV
	mWlGZhYtw3Y8bZGHe7/4Py1BIMCzFrDmNiv9AwA7W/WB9/fBqHh5cV5CHArzhD87rgT8X9WMlzpwc
	LYxxsCY2SzQCF2UtOQ+ZQ3tDp5t5m0/UFZNXNFICB38Lmd2HOiY04tQZkQDnPoTod5qHiKB+gjX1I
	iYxegzPkNXV1o6omR3HVL/lurIQRbqqwteNxIFF2EffkAsh4PYvma7sztu7MDAz4Qn69qJSrZoNxy
	Wc5Xv6yDlojzzMoJ+0gXoKFlulVizCE84cvuo47SqnqiovZGNtFjMma2kDeLafX4DLsYLTCswMxSO
	mnHCqTS5gI+BLJN1MHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGoSY-0000000EgSs-0WbJ;
	Thu, 06 Nov 2025 01:06:42 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGoSU-0000000EgR9-3WBg
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 01:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762391152;
	bh=JFkF8UkYbaaB7pjH4epayy6X+f7NP5eH8pQou+XQb6o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=m51hBwAA1qD/Q91GT1229VZcMB461RwPMwrR4HzaoR269O7/WIPSY7w8Qi4D6KWYx
	 oLEJQb1OxT9UwW/SFrHwvfaRPs7WPNNp3KV+Nly5NUHxe0aUEPe7SFEKkeyw9JDCDf
	 ok6hzVm0g9E/9ZoBixC3Kwk8TSasO/kJDBAQ/GaM=
X-QQ-mid: zesmtpsz7t1762391150tf3744dc0
X-QQ-Originating-IP: KsjedbsCDqWW6E9h2I75XKG5hzaDuX8RrfV6cNDgNwM=
Received: from = ( [183.48.244.176])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 09:05:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10819907063905437385
EX-QQ-RecipientCnt: 10
Date: Thu, 6 Nov 2025 09:05:48 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: fix detect issue
Message-ID: <12878F9DA586AA19+aQv0bKwLTzw_kJOq@kernel.org>
References: <20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com>
 <aQvTMM0S16gOdiAN@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQvTMM0S16gOdiAN@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nlpn2WSBPiqi09mhGkZ7fY468yzybPrr6Z+vDJ4hmUCqZrw1ozcSySjS
	ybAOJ/H0GfQzr8GArfOOLaQbhs+bWFGELNQacTYPIiE5uKywRbwU8OPIEOGgmHHqq9THNuS
	Q5LZY6S6VWbuBAByqCgFyNNMLstLK7KjDydNDgq8fd8CW2T1JfGbgk3Z3Yd/ZDwnYDwVamw
	qOBNb1Z6xTxvP8oWVBdiMfBBKSpY7PT9orEGtr7sragNF+Pq6/W7ddV9icIXhVNfgZrirLA
	OWtIPGVD29wVwaUgGOUMD3tFplJgYa7c1uVpE0YR5HZ3pXcWBzV+AmKyC0scSxDgyBSwoVC
	9cSIMUlcd4c355vzT6em/tAW+ovKoxHq2MkztyByNUNYhalhCJ72EvagJ0kEpDI2Q8FFl10
	voyUyOg7+4w1D0tp2SOYINfkTHuj9TeLT9dSfgqg24b5r/DnQWruax55FDWeBtjhqtR29jj
	0GfQmjQ4ZPaamw3DneQ8OhsJ6WTE245cj6bKyb3ti/K0DfKEEmabZ+XODe81hhnhBKtWR3o
	KSdNclTGeK26yqyCWR8V4+w09oRwmtf0J11Z/nIh/S81xzrr6UIUXLkFXdiMcmaOG0gZ1N5
	xIKXZEK9VH5/OCF2hPsgM3A9eYsXlzgnQKb+jE+OrG2Ueo5ynGD5F6T32cIEO/JfshrlIhQ
	7gzD7k0g+TCCVpVJepuV4LOkWToB6UgnzFE6ADewCaVyLAZnQ2KX53pq6yjvqq35UXSFwFm
	r1chXQBsK1lmkgAt1BEiTCCD/niw9UItVV8UDvO36KAEVkwl3ZgvZLx9638WZ1edbZ5ez2C
	fjCYnh0eQkFOk1N1NGg7iceb2AYgvmw4sIUW193P6XCvKWOEcke3QEjTdJvuDUbfVSl1ny+
	mJGbN7tzvaAGdQJphgwQ7nyqsu7dnj72qvRoT8YpjASlll7DC0zGTS4Ck5guWRPEcZBLGHz
	1no/6TdUcXzVKSOnmSsSw6gcnOdvKaG+pQew6w83spvr/RZXWsT12OSdW9tn5rpU6mh8S1A
	se83iPF0k3GgV0VfyE87KvlSunLBHVauntJu9V86P6DPgxZG3ewUn4Q+iycfXIeAR+Omvlg
	l3elE34njNxUCrnA0i8CG4Zsvl+tUYdtQ==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_170639_262523_7FBC7917 
X-CRM114-Status: GOOD (  16.75  )
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

On Wed, Nov 05, 2025 at 11:44:00PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-11-03 15:06, Troy Mitchell wrote:
[...]
> >  	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
> >  		spacemit_i2c_reset(i2c);
> > -		return -EAGAIN;
> > +		if (i2c->status & SPACEMIT_SR_ALD)
> > +			return -EAGAIN;
> >  	}
> 
> This makes the resulting code, while correct, complex to understand as 
> it is now two really different errors, as you explained well in the 
> commit message.
> 
> I therefore suggest to organize the code as:
> 
> 	/* Arbitration Loss Detected */
> 	if (i2c->status & SPACEMIT_SR_ALD) {
> 		spacemit_i2c_reset(i2c);
> 		return -EAGAIN;
> 	}
> 
> 	/* Bus Error No ACK/NAK */
> 	if (i2c->status & SPACEMIT_SR_BED) {
> 		spacemit_i2c_reset(i2c);
> 	}
Thanks. I'll fix it in the next version.
> 
> 
> >  	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
> > @@ -491,6 +492,8 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
> >  
> >  	spacemit_i2c_init(i2c);
> >  
> > +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> > +
> 
> This sounds good to start the transfer with a clean interrupt state. I 
> just wonder if it should be moved to spacemit_i2c_init(), ie where the 
> corresponding interrupts are enabled.
Uh, We can move it actually. But is it essentail?
> 
> >  	spacemit_i2c_enable(i2c);
> >  
> >  	ret = spacemit_i2c_wait_bus_idle(i2c);
> 
> Anyway:
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Thanks!

                          - Troy
> 
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
