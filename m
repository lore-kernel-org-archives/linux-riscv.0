Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80D7CCFA05
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 01:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIygv/Ij83pDjNVeQLl2PNUY/20Ecf0skE/3JkgmHwc=; b=bN+94Zi/y3gsqh
	olt3RLDnoreAZp1jnvCjYZtcczAVaj5ViXbkcDuO4b6S+U4iGK/s0D+itWJNRDwjzziBc8xkzTQCr
	bmuxzZbEMr5VT0lTCn5LFVINTXUKuG7V8aUVC6re5FLxLHtOIiQuj29yJGH8ayX6H9+R0KccwyPdW
	t6kl0BQN5H18Y6xUrbkgA7GUCvzTU8IQtW9SviJtoA4Vn1X0w6rHL4XDn5FmNpxgEcf000rduinHy
	SybRUqxGLxBt96bPCNvy4cU+HwBDSFhuJpzxNDj6T0nNgN8CGqkih/X0oNqqT4sbSvg7PJBRW4a87
	ZE/rRdDcOecsPin2Ijdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBCh-0000000GV97-1fA2;
	Fri, 07 Nov 2025 01:23:51 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBCd-0000000GV7G-0A2v
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 01:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762478569;
	bh=t7tRvyZ7ednKIkr3XeRZc9amYYNTVix6VkI2QvXO0V4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=CZ3ws+h3j0d9TEdczQzd43r2NzM/WoFr3UPHJ30mryhpuiezKavMg0c3hMzMkrdaV
	 xTxV+gqCxQG8ppTTvYunLvhtU6yhrKD6+hQOq3jwabr7VcMf+34UGJoR7Gih2EjqtT
	 epJlf8aQWNdTwYBJwjs7cbH9zgO912LnRRpnbxOQ=
X-QQ-mid: zesmtpsz3t1762478566tf97beed2
X-QQ-Originating-IP: Jv1aKYQ/MjyLhPILSXPUmj2hn/opOWyMKd601+FeEek=
Received: from = ( [183.48.246.190])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Nov 2025 09:22:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13905674889772998339
EX-QQ-RecipientCnt: 10
Date: Fri, 7 Nov 2025 09:22:44 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: fix detect issue
Message-ID: <28675E3B65BB7C20+aQ1J5NTKx6i623ju@kernel.org>
References: <20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com>
 <aQvTMM0S16gOdiAN@aurel32.net>
 <12878F9DA586AA19+aQv0bKwLTzw_kJOq@kernel.org>
 <aQwzYrmv5TAIuqTh@aurel32.net>
 <0E2B2679F0650AE1+aQw0VgKNbcFqDH33@kernel.org>
 <aQzmHB2FaPFS4qwj@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQzmHB2FaPFS4qwj@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NhdiEwnVOUqExbdtneD2Nu7ZvMKRJvSXJb3DC08ek4AVlnHiOQCf8xaL
	2LVw1ILvRSjSVTkzdKOyYZPPKLAXX1YIMc5TCutKiqw0Hk58pir8CcQqSInwiTeBBsMSZt/
	VDC4ZMk+OSC+T12JfVIpOovBi7reZjxUbzEMYK0ss9aSYvzD6frpF1XYJ+mQYZJUrV7GZak
	IUt7L9dn2OQlYD4YloRLEmj79MuzKMVL90zaMM/BxMAjLJ4ukj1cc0mDn87/2INh+/LgbE7
	Ru0Zp8gmwXH2lQvk6jxQa4GJ4oedcHZREEWCI6yMsZwz8lbd8b5m07TmyWqHIwGlhZCaQER
	FncKk8HDoM6tjwgATCtAdhjmzH1P4MrKci3K/UBGGUVLSUp8lIGyJr5/gjUS0srbiE5gbyf
	NocdKk1Lz38jCHGr990c1cG19xtqoUq3bA5h3LkPYdOqqOjpVSmyxi5N6Aj6UzA3ckVzHoq
	xM4WF6SbPufYOIKChuH2wMktVwrJiD5mNmey7jYDZG2gKj4ifzxYwpvO/8GGEpNINHMHOxD
	TViDTem+mKHIWuidtMjPzQ9zMxefUPAF4dNcxKz49VH5DhprVggE3SWsUbQwjT9UXmnpF9Y
	0iW0MhUwjeN3+NfgiyRywO6HA3I+btzn/0RmVGUqvbsY32yBPFzmWaq/W9pYQ38li8xrjl1
	H5CjXkOT3bLtp70ut9K3P6dcwVunZX2i/mhnRLmj/AerOX925ozTdufIwHnnVFJiMAnjlUs
	mb6+H0k1rD+1MD2W3cuN5oes99VFj4zCzTWCyl2iI60PlIvBRX81jcwJ3pt5iLEyKIqvAl9
	8d4KkJXyinc9Q+jNPWCWEFxvEPWKsOZ1YZwVjCZCEO5++vmDhubCpdFaehTBIS3oNskmzOh
	2JkFgG2aQ2wYf0UEVEXwRqXgeFDTVBkkJIeQx0vbjaaBqvR9wpQEdAgqOuuboDcokixwzsG
	q5pPbpYueZnmk1Kju+Lhg9MR4fBJc+yyb9aGsllhBFdJApUmeSJ/pOktS7a2oUuFlCqfUmi
	Eb7XR+kptktCVVdWPQwbB3AJdYrqRWU45cW90i0qtgMhqyRdmkr7KayD76RvQ=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_172348_269148_71508393 
X-CRM114-Status: GOOD (  30.82  )
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

On Thu, Nov 06, 2025 at 07:17:00PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-11-06 13:38, Troy Mitchell wrote:
> > On Thu, Nov 06, 2025 at 06:34:26AM +0100, Aurelien Jarno wrote:
> > > Hi,
> > > 
> > > On 2025-11-06 09:05, Troy Mitchell wrote:
> > > > On Wed, Nov 05, 2025 at 11:44:00PM +0100, Aurelien Jarno wrote:
> > > > > Hi,
> > > > > 
> > > > > On 2025-11-03 15:06, Troy Mitchell wrote:
> > > > [...]
> > > > > >  	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
> > > > > >  		spacemit_i2c_reset(i2c);
> > > > > > -		return -EAGAIN;
> > > > > > +		if (i2c->status & SPACEMIT_SR_ALD)
> > > > > > +			return -EAGAIN;
> > > > > >  	}
> > > > > 
> > > > > This makes the resulting code, while correct, complex to understand as 
> > > > > it is now two really different errors, as you explained well in the 
> > > > > commit message.
> > > > > 
> > > > > I therefore suggest to organize the code as:
> > > > > 
> > > > > 	/* Arbitration Loss Detected */
> > > > > 	if (i2c->status & SPACEMIT_SR_ALD) {
> > > > > 		spacemit_i2c_reset(i2c);
> > > > > 		return -EAGAIN;
> > > > > 	}
> > > > > 
> > > > > 	/* Bus Error No ACK/NAK */
> > > > > 	if (i2c->status & SPACEMIT_SR_BED) {
> > > > > 		spacemit_i2c_reset(i2c);
> > > > > 	}
> > > > Thanks. I'll fix it in the next version.
> > > > > 
> > > > > 
> > > > > >  	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
> > > > > > @@ -491,6 +492,8 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
> > > > > >  
> > > > > >  	spacemit_i2c_init(i2c);
> > > > > >  
> > > > > > +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> > > > > > +
> > > > > 
> > > > > This sounds good to start the transfer with a clean interrupt state. I 
> > > > > just wonder if it should be moved to spacemit_i2c_init(), ie where the 
> > > > > corresponding interrupts are enabled.
> > > > Uh, We can move it actually. But is it essentail?
> > > 
> > > For me ensuring that the interrupt status is in a clean state after 
> > > enabling the interrupt is part of the initialization.
> > Yes, I agree that.
> > > Furthermore if 
> > > spacemit_i2c_init() has to be called from another place, it's very 
> > > likely that it's also needed to get interrupt status in a clean state.
> > Why we need to call init() in other place?
> > Could you give me a cese?
> 
> Currently there is no need to do that. However if the driver is extended 
> (e.g. to add new features) and spacemit_i2c_init() needs to be called 
> from another place, it is likely that a reset of the interrupt status 
> should also be included. Therefore it's better to just include it 
> directly in spacemit_i2c_init().
I'll move it in init(). But it's not for reuse.
It's not for reuse, but because the name init() should indeed ensure the
hardware is in a clean state.

Thanks!

                                      - Troy
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
