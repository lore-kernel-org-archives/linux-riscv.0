Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6774DCDE000
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 21:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7Jk8+1xIJBhEDMzFNpXRk/g+gW1aQ4zwGhPBRmFVhU=; b=NYLk2YcYwQ7zjA
	sD5ognguAbYmHxF0amJXgn+kGvImn66E2kfBs1SHRaVKmmkdDbxNDvYDbh2gjK5psWXQ0vy9icgcp
	nJPJdA4tg3UiuvgOwqS2BJNB/y87EH+y796JKRFqzWl3arzpH1wkwMB7BZA84hbOlk5oyZHiRuDiZ
	guG3VpXNpKYoZBWppEsz9hFDbfp2L/41930Y25ABVZYHfyn1PmWsS8PLe/eKMY78jrdbNHIok+2m4
	/mJNw+/Nt3cD2k5ZWlA2pR/uQaqepvjL6v+HK4omkXwrAeZFxEbelzcG3MyRRJA6gs13f3hgXF3h0
	sBg6U3paUNa55Y4FIN1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcUwr-00000008ME3-0bSS;
	Wed, 24 Jun 2026 21:15:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcUwn-00000008MDc-3v1M
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jun 2026 21:15:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B09AEC6B3B8;
	Wed, 24 Jun 2026 21:15:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94EE7601C5;
	Wed, 24 Jun 2026 21:15:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A6A8106C8468;
	Wed, 24 Jun 2026 23:15:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335745; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=JYNVb3iyAzsQp26XZiaX43GwZ4bhM070s2F68aaiHHE=;
	b=A13nZ6OshjjcHVpIWLWQX2BnuR9Z8gOZgpC9roAV/gM4/EZcRrHtWTAIIP9gEBuJTDs9f0
	djoCp8RN8nKaVoX0w+dscotNUtwR1l+/4lra7svZAYdMGawodoWMVHjQkc/1v/tyEKkKuf
	pqmYqwxpEu7CCN047+4mvYP/+ly/kHRepc20lgFUVtM8jXIfBbS3xKf38B75vTLkFQw9xi
	G9GdSvdkx/MObj2e3//uFHzfQOWj5WsZG4k/GEVLGqUw9p2AfkHqDoYN3lGa/63AuNxauw
	i10nSLVWM/Pq7jkSzCauacXluEgyNGFYmVBKoM712xnBbh2KFp59KhRMPIRakA==
Date: Wed, 24 Jun 2026 23:15:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] rtc: mpfs: fix counter upload completion condition
Message-ID: <178233558792.1517260.5634581783722495256.b4-ty@b4>
References: <20260513-panhandle-ashy-70c6abf84d59@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260513-panhandle-ashy-70c6abf84d59@spud>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_141550_155087_1EA8E50A 
X-CRM114-Status: GOOD (  13.40  )
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

On Wed, 13 May 2026 18:55:55 +0100, Conor Dooley wrote:
> The condition that needs to be checked for upload completion is the
> UPLOAD bit in the completion register going low. The original iterations
> of this driver used a do-while and this was converted to a
> read_poll_timeout() during upstreaming without the condition being
> inverted as it should have been.
> 
> I suspect that this went unnoticed until now because a) the first read
> was done when the bit was still set, immediately completing the
> read_poll_timeout() and b) because the RTC doesn't hold time when power
> is removed from the SoC reducing its utility (I for one keep it
> disabled). If my first suspicion was true when the driver was
> upstreamed, it's not true any longer though, hence the detection of the
> problem.
> 
> [...]

Applied, thanks!

[1/1] rtc: mpfs: fix counter upload completion condition
      https://git.kernel.org/abelloni/c/9792ff8afa90

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
