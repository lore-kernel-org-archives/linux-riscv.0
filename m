Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A937D43358
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Dec 2025 21:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjrtU3JitH8mLNMMNxh6BHA0vRFlnbN+N4nphzfycFA=; b=wNZdEdNlvpOUfj
	7HgLCmcpV05AE9nRkh0sJmbN218/uHtcRL5tMXGOCM+lQckrg4ItMz7+M53tNZnZZtIL/TilWsWBF
	dG7y6S1MtHmStApyPI5x/u2mgXrc4xY7H437pwDzBE/e+Gcj+gje+ssAYO8FqiYpUXL3KSABsDWJ2
	SSFnxwmZmazkYvrRGYSCCd0iiGC0+VwuR3DvSF+F0cSzbmpJKjF0lxC7RHhR0p6z6S1g6yvFPHro0
	8YlddsUfUTF4NqXTSqaq5qLzDXiWlwQ6gQTHmOEX/E4/HKLziMEKGKXDFX4EPj1DYLO+Uw9bhJG+i
	xB+3aeBbjkscJPCEU9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vToDN-0000000HK90-3N3r;
	Thu, 11 Dec 2025 21:28:45 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vToDK-0000000HK7y-28R6
	for linux-riscv@lists.infradead.org;
	Thu, 11 Dec 2025 21:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=6MsdFVVQ8jNSVrsm8cEGsnJYlrkCyq+u89Nh4N01Z3A=; b=tKxLktc6JJWcsUQBFJ9/YE5ABz
	0UiekIOO2eZG2uie0nZ2etX23Gn+vTBJzzBbcPRVQB3aOdLw3Frxmb7TuSMcjx0QgvhroYHV8MggF
	PvlN/O7RCIs0ZjO5IhwLeCD9EA2Opyig4gbDjI9hzU2SvNIiBzCzarW743CPSbdbF0FMR5mk67wRb
	iolpysIpPi7cQu+WvLeEe2IBheZzBY15qc+JQE+XNTi3XxcnF+MaJSMLfGWCjtofSnfitvfmO4JMW
	CNgP0ApCD3osL/sKvzXYrlaXvQRgS0wrlWM/x+w7OMoVsHyP8a64Tq212u6Hn+ntEIv4UndR3NkPs
	Qg8SmRVg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vToD2-0000000FzHb-3yBj;
	Thu, 11 Dec 2025 22:28:24 +0100
Date: Thu, 11 Dec 2025 22:28:24 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: introduce pio for k1
Message-ID: <aTs3eNLCKTR5boro@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com>
 <613db920-6025-43cb-a733-d58f65363caa@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <613db920-6025-43cb-a733-d58f65363caa@riscstar.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_132842_984775_01CFA652 
X-CRM114-Status: GOOD (  13.03  )
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

Hi Troy,

On 2025-11-07 09:50, Alex Elder wrote:
> On 10/9/25 4:59 AM, Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C in atomic context.
> 
> (Sorry I haven't commented on your earlier versions.  They
> included other changes to prepare for this; I'm looking at
> this patch in isolation and haven't reviewed the others.)
> 
> An aside:  I notice the #includes are indented an additional
> space in this source file;  perhaps you can get rid of those
> (in a separate patch) at some point.
> 
> You really need to provide more information about how this
> is implemented.  This patch makes non-trivial changes to
> the logic.

What is the status on implementing the changes asked by Alex? Do you 
need some help with that?

Thanks
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
