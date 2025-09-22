Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5B7CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 20:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLqXVVu67OqY1t5uEtOoR+h8jpmwlwBlgTuZpiqo7Q8=; b=YUXxX6K6iBu+q8
	RO1ZpwBeJn7HDIizBgoVFtbhZmMATiPGf1S9MjKXDNDEkiAuzGfstAMvelcefENQtxuoO+cOibYsg
	Xe5cD0QTGqU7iJtnXq7ZbpVSGs3OCizELpjL8CfF+PXixYZ7N2gkOikuhRnZnIp/kS2yGOjeW+9EY
	fCV4GaNp+GvvEfYjknxmXaO3DGyG7qVDuo7c4wyx78sQlnrEMRgeThRQo+C6WmXOBy+xKijA42ikb
	SHx5trekFzxlICPyPhrTeZr1nngpi63GFDoqlo6wu5npwRdQ0rioSy3pVBY920n6VHk234KdHJVfk
	iqdN5eWwZVzajRHIGcCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nZf-0000000BV7M-2Snw;
	Mon, 22 Sep 2025 20:55:51 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nZc-0000000BV6Y-2U1M
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 20:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=cRFwK1pxi/SZ8dEX9JP4LGjTwxzF/2UPH05MAWDWiCM=; b=W92NzEjgy5lxNqfQw08KL+V9t6
	m0CT/hubY0h540cMF8PTPLCcb4GYisVHRJo1d2FOPObc/RofuOUHYNjrgslYCkjpgE5T6Ts5RZcBA
	pxG130bkqm85LG3NAvqP1PWU7WQxyyKDPOuLh1eliDwGXS3Q1hCnFuqQTH2Gf3ub7p1DAJ1przJ9Z
	ofpmlwh+5CYZHvi079Y6rXGwuA50nINfXAe/bd3HWlqMCxIzXfdF+x/JzZeswynlJq5RiiPaISjvV
	PWoszQ5xYuYbuGl1OFAS7FsWdaDPffKZ5bT86ER6Bevtsnc0jast+3EGCcR/KvWOxeQ4q14r/gw2L
	ilZZLoqQ==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0nZO-00AlR7-2f;
	Mon, 22 Sep 2025 22:55:34 +0200
Date: Mon, 22 Sep 2025 22:55:33 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 0/6] i2c: spacemit: fix and introduce pio
Message-ID: <aNG3xXKEYvhGfKjb@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_135549_070436_371F147E 
X-CRM114-Status: GOOD (  12.59  )
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

On 2025-08-27 15:39, Troy Mitchell wrote:
> Previously, there were a few latent issues in the I2C driver.
> 
> These did not manifest under interrupt mode, but they were
> still present and could be triggered when running in PIO mode.
> 
> This series addresses those issues and adds support for PIO
> mode transfers.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Thanks for this series. Based on it and with the few fixes suggested in 
the individual patches, I have been able to write a small power reset 
driver for the P1 chip, supporting reset and shutdown. I'll post it on 
the list in the next days.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
