Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEEECCF9F8
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 05:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8f1dgPxaTVRs9m8nu5ERNSltHm3gcbPTYASjPFQdyxI=; b=0Njznv8mPftU7k
	2RM5PTBTAadVqlUY0KbscJiG66h58iMsuPUriWpNjLiLsNTWHYpQpnaPw9+EqqyYFpSQ03pvCrrrI
	iDVcdILIURGNzb30OKb0l0EE4DYKUUZZE4V+Itl+6Ao++2XyUnxSaCDRgtlu1YRWaTzGlPHrYDNEt
	KnRvtIvO58HGFD1PKKx/20mS8RG5GPtXNc/IhJVny74x6qAyPoA/FLaQhVBzR8zVsN9TYsWYct0af
	VoxzYsOqBL+nsY6Xyk3ulp9CWrZg3w6oZpy6+x7GBw2LAOTeJFkuLJx9P07EbusLJrXX0GWI1yvVS
	+g4eRrzJysSS0YSyhVNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsdu-0000000Et8A-1oz8;
	Thu, 06 Nov 2025 05:34:42 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsdq-0000000Et7D-1CMs
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 05:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=acX4/obtZc57euus2wjyzRPxFvGCI3+UJzV/4FNBXzk=; b=s1C6BXEr5oJ1X/hOzOEhUfuaB5
	PBHVKBjGhz8gKMjiYNB+Dg48gQWnPEY4iLHhvBzl58ZOdSaNl/T+vH+MBHhl1h29a85uLcAq8wgPN
	D0mR1W/k5TRhk9GQ6ZldtCTZ5R4QhvnjCrD6NbBns+QugXZBaSGVOedo+WOfgsH9E3WXBw4qWTuS8
	ca0IrnP89cA5iyBcwp/DgbgDS5Z+nk4dOCEqE7xuP64UOBv1+F30XzP47X4pSkyxw+gektOryglGt
	wsXV576Lr9NCtkj2OlIriw3BmmHf5UJJquHQYSFjQB4N+XC3Pf9uCZwoelOZj2zpiVN2waRzyJAtP
	CDgTiJnA==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vGsdf-0000000B370-2CgX;
	Thu, 06 Nov 2025 06:34:27 +0100
Date: Thu, 6 Nov 2025 06:34:26 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: fix detect issue
Message-ID: <aQwzYrmv5TAIuqTh@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com>
 <aQvTMM0S16gOdiAN@aurel32.net>
 <12878F9DA586AA19+aQv0bKwLTzw_kJOq@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12878F9DA586AA19+aQv0bKwLTzw_kJOq@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_213440_497152_45F12E4B 
X-CRM114-Status: GOOD (  21.22  )
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

On 2025-11-06 09:05, Troy Mitchell wrote:
> On Wed, Nov 05, 2025 at 11:44:00PM +0100, Aurelien Jarno wrote:
> > Hi,
> > 
> > On 2025-11-03 15:06, Troy Mitchell wrote:
> [...]
> > >  	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
> > >  		spacemit_i2c_reset(i2c);
> > > -		return -EAGAIN;
> > > +		if (i2c->status & SPACEMIT_SR_ALD)
> > > +			return -EAGAIN;
> > >  	}
> > 
> > This makes the resulting code, while correct, complex to understand as 
> > it is now two really different errors, as you explained well in the 
> > commit message.
> > 
> > I therefore suggest to organize the code as:
> > 
> > 	/* Arbitration Loss Detected */
> > 	if (i2c->status & SPACEMIT_SR_ALD) {
> > 		spacemit_i2c_reset(i2c);
> > 		return -EAGAIN;
> > 	}
> > 
> > 	/* Bus Error No ACK/NAK */
> > 	if (i2c->status & SPACEMIT_SR_BED) {
> > 		spacemit_i2c_reset(i2c);
> > 	}
> Thanks. I'll fix it in the next version.
> > 
> > 
> > >  	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
> > > @@ -491,6 +492,8 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
> > >  
> > >  	spacemit_i2c_init(i2c);
> > >  
> > > +	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> > > +
> > 
> > This sounds good to start the transfer with a clean interrupt state. I 
> > just wonder if it should be moved to spacemit_i2c_init(), ie where the 
> > corresponding interrupts are enabled.
> Uh, We can move it actually. But is it essentail?

For me ensuring that the interrupt status is in a clean state after 
enabling the interrupt is part of the initialization. Furthermore if 
spacemit_i2c_init() has to be called from another place, it's very 
likely that it's also needed to get interrupt status in a clean state.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
