Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5AEF364A1
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 16:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFCH1+fY+fUQXn27bdZB2kdHJYkf7fowTJN8Wl8RySU=; b=41nLvPKn1iJETG
	1sMMZu62ouVnvUtSit1h8Uc+/Hvy9YYS2XWEscNx/nbdo41PmCRtRVqzQry5BH3We0LmHSvfiqEGd
	dWpDgnj3Z7ObBTE8iq5IY2lzbbQUFc/b0zd9L1im56h2WBNyC5mBGV/BBUtND7VkjHthVKTVoV4JO
	8rrSSgFgzlIIXAyfr7FWIpFNs8YAkxAE7JfP5Wr6WhqeRKdm9g5qMN1vytyEgqxXFN2MiHAyXRBtv
	z3YfB+lFnUabjVBLDB0HnSFDHZa3QvxGi/Y4opVKkJpJdroq3pyPpMbvivOdW8itObJLWlAw/WKkr
	5ekbEC4Qvv98SVHZNs8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAsNJ-0000000AwPH-25rq;
	Thu, 09 Apr 2026 16:37:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAsNI-0000000AwPA-1LqM
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 16:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A31B60125;
	Thu,  9 Apr 2026 16:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F558C4CEF7;
	Thu,  9 Apr 2026 16:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775752619;
	bh=KOqlFVVDPA8Z6Cqw5fEN1sKBxBwUNHbyg8QMlZBZyrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tO3ctKOrVZJRL2kFL4/4QiCi7kgQpYRH8DHsDAjExEVG0fet21rxehQ7U/a013N79
	 txPwkC0SXW/3sECmTbpGrFJWXhE6UkSQ+sdCLl/Ex2orjqw/sGnQsWBXSrnI0DW1DI
	 zEUX820CBJKJOTJwmTGavTqwDwKaZr0atzyIMqHt3GKy3wp+OgK6g++w3Y5ysEby+K
	 eDYsNJlF6F0ZxGEKoUcDgnn0AilzsGZoJKiR3Gfi/KwSBxvpdXfnO+fqFRgmdxnIVu
	 w9C5JZLKcrIiJC4cGiu1FgBXMaRW4wOq73cVlzB1i2nTRB+Bmv9O9lhwavEoJMPf61
	 U40a0PcHRSnNw==
Date: Thu, 9 Apr 2026 18:36:55 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Aurelien Jarno <aurelien@aurel32.net>, Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v7 0/2] i2c: spacemit: introduce pio for k1
Message-ID: <adfVk82OC1c3Zn8a@zenone.zhora.eu>
References: <20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com>
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

> Troy Mitchell (2):
>       i2c: spacemit: move i2c_xfer_msg()
>       i2c: spacemit: introduce pio for k1

merged to i2c/i2c-host.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
