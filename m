Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12F8CCFA03
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 05:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDZLi4SEqxOZgcNrDv6Epy0AN6FdkmiWT601AFFHuuU=; b=dXq5KyDMagYm6b
	jHc0HthRGioO0h3ADoIlTf4OY5svjBK0Wq5WCfPI3Bjw78ZDs2SRpmpx9M5pNeMEsQQo1ShueY1C/
	djXsAbnJh0O5Rph/09h4RpP4LTc6+n1qNuoFIy6aEa7ugzuwF3zKgusH/Y9gmyRFwckIpxWo2p11e
	ehaxmtt7BXIjCH5J8HTLggzhAIYRpb4d5dsJVr3M446A1qpaH9W4d0kaRXlG2CYs2E+RNU9+QkTC+
	Po5PKKo6tCth/ATTg91w7QC0xYJhKBwWCko2Hjm8dhQcRI7sHKo9iF2YJ8JHasHdgyhQpptj2VrKD
	s4BK3XCEwEjzV3nPPKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsif-0000000EtOt-1IZ9;
	Thu, 06 Nov 2025 05:39:37 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsia-0000000EtO6-2Avi
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 05:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762407514;
	bh=P1Rz7vX4LUWb0KmLFM3Q/aK5/FfNA1LnBQcP6+5neyY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=QtcLfTc/E1qrc5LEdEIAjAU1o6kjEqxYhbxTDsnXEiAHd2/HTs+bUf6Xi2PBXywbw
	 lC+r5MKSRuBozC9alCktQ6v+eMxiHFdAb77XhPhUxDyRQe5SWNZipstuHBu46izRVZ
	 UMQ98xrvckxrNT52sD5Jf2pmFGbJd/LgM5SaRmOY=
X-QQ-mid: zesmtpgz7t1762407512t3ee89d79
X-QQ-Originating-IP: 3VST9Ej0v63tRCSDrHmfzPvPOG/iqybQz5oibi7AIA8=
Received: from = ( [183.48.244.176])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 13:38:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8810434806403676206
EX-QQ-RecipientCnt: 10
Date: Thu, 6 Nov 2025 13:38:30 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: fix detect issue
Message-ID: <0E2B2679F0650AE1+aQw0VgKNbcFqDH33@kernel.org>
References: <20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com>
 <aQvTMM0S16gOdiAN@aurel32.net>
 <12878F9DA586AA19+aQv0bKwLTzw_kJOq@kernel.org>
 <aQwzYrmv5TAIuqTh@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQwzYrmv5TAIuqTh@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M8JnMGwRo1mQ/DUTij+F6rLmMw5PkZZKwrJ1NOFPlZPP9FxgJS6cuZKf
	aSUqtmnEk1MOzt087podP1fmhCXAu1SzJM3wFcz5Zk0Bn/LNBVRWl6E5Xbc7W8I3J0jG2pU
	CFj2i+SVqOFLJBiQjyjyZgeRxN+DA8PLFPQtM07d+LFpsUqfzQWmpHFOBY+w89rNvBJaC8a
	xPyNcO27CskSM7y0PN1MIIYeiick8WD7GlEgkRaGZ45DuE4hc9MLQXcY1qBJmNWKg6DcNSH
	P+KatW4iLof/sQBs0VCX0jY22GHZUGc+Hjv87O82iIpugNwkTWw5G/Vn+ql2IeIK8eAbxO1
	zgSV6EWtvXAphULcR4+TxmcCye88oepdDgwbon00UepVuVUQMug/cfKMm3/WICIe/8cMqkg
	whD6cIcZ+Et0eswC37cJdzuFb4y6/0zyAMQ8L2jElQhTvp16+0OF9r4ra62Orlt25qcX98A
	okGjPvOxcB6/mCRx4b2pt9HQm2ALv50SwtsoemVjNOrPClBY2LsG6ty/Z/elh4apXlz7H50
	GpS0jjV+eqAri/o2GFMqZOpvJ04TOEmkf47OYhlKMzZIWEY00iI45KEFc7ABczA1Y3mYub1
	ZBe5kLOKl/1c/fApbHK1RL2wVonTHLq8Xq2y5UuqOO4GMfUs8m2/OU6ifdr9B1qMfU3kZ9o
	MFC2J6OBQ7am2ATXl6XUcFLgE3qYyuEzOejsNDwnol9QVsDO/8bazsdvDA2OBD7Dkk7dMFM
	KRgJcIwUCRipoWx/HHdu7wL67NL5SjAMzGnVDDW8esqnLU0VPgv8wnfGYGuxYHU5TfXyi/T
	/nfVhUS0TawLPTd9y5fQbCMXAfTPASZEfcjKOJ0WQby6M1fOVlzrEoFw38AcjvxBR0hmzF+
	CKeN37R1NK87Y9HbnZmx1wFYuorNQ/qUNcBWKFmDaiudVy/9oGF2KLnYVqpbL6QAv/GGezm
	tVrEJEsS+d/6frQt3i9nLKXOX6a3k1018VPiCF6dxUTEI7nHHAujranXDqmxMHleRyfWy1U
	tqNQZV2YfS1nmcnoIh2zdfBwmOmkE8k0y9mOvuGpHp9nAmuU4wk4HArVrPOX7UV61mgp3ct
	gGROr8bFGihDgSQkHQJrwY=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_213933_573954_D94D55C9 
X-CRM114-Status: GOOD (  23.98  )
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

On Thu, Nov 06, 2025 at 06:34:26AM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-11-06 09:05, Troy Mitchell wrote:
> > On Wed, Nov 05, 2025 at 11:44:00PM +0100, Aurelien Jarno wrote:
> > > Hi,
> > > 
> > > On 2025-11-03 15:06, Troy Mitchell wrote:
> > [...]
> > > >  	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
> > > >  		spacemit_i2c_reset(i2c);
> > > > -		return -EAGAIN;
> > > > +		if (i2c->status & SPACEMIT_SR_ALD)
> > > > +			return -EAGAIN;
> > > >  	}
> > > 
> > > This makes the resulting code, while correct, complex to understand as 
> > > it is now two really different errors, as you explained well in the 
> > > commit message.
> > > 
> > > I therefore suggest to organize the code as:
> > > 
> > > 	/* Arbitration Loss Detected */
> > > 	if (i2c->status & SPACEMIT_SR_ALD) {
> > > 		spacemit_i2c_reset(i2c);
> > > 		return -EAGAIN;
> > > 	}
> > > 
> > > 	/* Bus Error No ACK/NAK */
> > > 	if (i2c->status & SPACEMIT_SR_BED) {
> > > 		spacemit_i2c_reset(i2c);
> > > 	}
> > Thanks. I'll fix it in the next version.
> > > 
> > > 
> > > >  	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
> > > > @@ -491,6 +492,8 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
> > > >  
> > > >  	spacemit_i2c_init(i2c);
> > > >  
> > > > +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> > > > +
> > > 
> > > This sounds good to start the transfer with a clean interrupt state. I 
> > > just wonder if it should be moved to spacemit_i2c_init(), ie where the 
> > > corresponding interrupts are enabled.
> > Uh, We can move it actually. But is it essentail?
> 
> For me ensuring that the interrupt status is in a clean state after 
> enabling the interrupt is part of the initialization.
Yes, I agree that.
> Furthermore if 
> spacemit_i2c_init() has to be called from another place, it's very 
> likely that it's also needed to get interrupt status in a clean state.
Why we need to call init() in other place?
Could you give me a cese?

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
