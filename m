Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2440606A31D
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 12:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z/KrPfbo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cjfPdTZG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+eEsAagX4v47Dz1UdI5NOXeuW9+bKyjOXDo3uHkA1aM=; b=z/KrPfboU2tx3x
	Y6l/N1vbb9V0AtxqWzg9kAIVWlSAGgXPTPnARcbpIYz85hmoRR5d3XhwZBrvIUKT/2Mij1oWePeqq
	GSDlsfkYXDZdRQwQXxGbogKDzAgAiwH24NuivMdbgwRpyjjl4naiy3cevhaJAzoxhHKUWuoaf8ETW
	FHqoI3PzAsbV4+hOTfc8KqUGUByuvhQioQ2mt62XNBDqkpRVh5JrI3glnt6XKwXo2Jx64n0D71NYN
	xsplRSdQYlza5h45AHxmeuxvVXtMGMHSpfxhkvbReLd88keSqWuXJE/mMD5m9KGVoiqoAulyVaWwZ
	URgDe1aEXZyW+eBJWHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ99l-00000009hA5-2lC5;
	Tue, 20 Oct 2026 12:41:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ99i-00000009h9Q-0GWw
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 12:41:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1047C4E41290;
	Tue, 20 Oct 2026 12:41:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D86FF60393;
	Tue, 20 Oct 2026 12:41:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E52C10328C52;
	Tue, 20 Oct 2026 14:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792500078; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=cCQtOg6Y7MZjLhYmi+fpS5EWVnteI9TG9obXYcVMP/4=;
	b=cjfPdTZGWbI7kobCzZP3/M/Y59jf88KfZnZHbA4KI+yM+q6IpuNeQCHWt6inBU5Smx+KzO
	3U/3jftAGPXUaDnJZ2Ub7WhVQSWq8PVIeUyIJw8hoGW+BYDmE+rsmKVV7TfjRQs8c3aO3l
	YsV8/grT8UFjTkCrNwVzPlcfArFhtdoSKC2qrC7XWwphGOI/FlRsyLvqJ0uQgh4ob1WNkg
	rT7ol1xSGJSBpeHzDgpKZU+ChWG+lPX15sNrJK598kNsV45QIszDgzFhUX7748Slsqockd
	bIfuJibvsWhtfq4axhFD+LF55Q/JZ0KB+TWzpcpMgQ4+mTHFS/N6e3t32+mMfA==
Date: Tue, 20 Oct 2026 14:41:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: mpfs: Fix alarm register word order
Message-ID: <179250004574.303413.14716075663642251592.b4-ty@b4>
References: <20261019151024.2232338-1-pocj8ur4in@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019151024.2232338-1-pocj8ur4in@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_054126_245499_47B65619 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 00:10:24 +0900, Baek Kyu, Kim wrote:
> mpfs_rtc_readalarm() swaps the low and high words of the alarm time.
> The RTC core reads this value during device registration to initialize
> its alarm timer. This can populate the cached alarm and timer queue
> with an incorrect expiry time, or leave an enabled hardware alarm out
> of the timer queue if the decoded time appears to be in the past.
> 
> Read the low 32 bits from ALARM_LOWER_REG and place the masked high
> 11 bits from ALARM_UPPER_REG in bits 42:32. This matches the layout
> used by mpfs_rtc_setalarm() and the low/high assembly in
> mpfs_rtc_readtime(), so the RTC core imports the programmed alarm
> time correctly during device registration.
> 
> [...]

Applied, thanks!

[1/1] rtc: mpfs: Fix alarm register word order
      https://git.kernel.org/abelloni/c/d691a96370b6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
