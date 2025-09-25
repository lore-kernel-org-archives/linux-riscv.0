Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA38CAC5B0
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 20:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1X+QUQRO6lhl339HJPktnGK9UV4xrmFPygkCk8kqmsY=; b=pyKwf8RvvDVQ3x
	QesoDKGsIFwTX9c51tEzD9AfCbbD40pJc78akUEuAPwr0ubA3WJkBwPQL9FpGUaguPNjzt6+eGeSB
	7zDzLRMk1UpQoUUGxAbloRoN+99LbQiVy3GbPgT+myEA33ElBK4ritjaoyxYuJw3mz3kwUGD5Ksle
	h8ns75V0GBpJifyW0lY4dM9AddBPfH0NGqkGvZ+bWRFn4xLGTj2x8HsUKfbn2n8BtPa3MZiS1gRH1
	iPGmhR98Y4Q/mGot+97xpvIb08mKboah3LxKrt160H4XaxcvtfHNA+qtFEVjaMXGrzHRhAIt96T4x
	tgVPmQu1/VnXgVIJVCEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1som-0000000CqtZ-3OJd;
	Thu, 25 Sep 2025 20:43:56 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1sok-0000000CqsB-0NC6
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 20:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=4UPhqJyqDdo7HbLIJEZkSkpz7oEBPZnMvb+OE+vj1Tk=; b=Y++JrFAP3VKxvpNaqvNc4EQ2pR
	Yj4CCRh4oszZX/r7zlHc8pClbJY2nknmq24lnXbUOeDda10jn3Gxd8tGHFjfkYzkkYloxb55qgFBX
	tafaVKHFiFOymh6Fc/BlK4mt3wI9oZpMzcvouwaJq50Z60Ep/q69VQSf9PWsLfXNWe94830S/rxz1
	rW8XLkHq511xIVVEBRfYfJdgaIaShOZK/OCatkwKY5s2uhccloMD8o4GnmqgUhnn87gBIoRKTCN/k
	53tdIalX48djp/JM/awZJgBolzv04mBcYC18gtMj32VsJBjT8pRqig3mPKxI74UbFvYRP6ryaPADR
	AJQ5oHHw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v1soc-00F9XR-00;
	Thu, 25 Sep 2025 22:43:46 +0200
Date: Thu, 25 Sep 2025 22:43:45 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 5/6] i2c: spacemit: ensure SDA is released after bus
 reset
Message-ID: <aNWpgYjiMtZJrBOm@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-5-46dc13311cda@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250925-k1-i2c-atomic-v2-5-46dc13311cda@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_134354_126601_3E8F5E47 
X-CRM114-Status: GOOD (  12.47  )
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

On 2025-09-25 10:02, Troy Mitchell wrote:
> After performing a conditional bus reset, the controller must ensure
> that the SDA line is actually released.
> 
> Previously, the reset routine only performed a single check,
> which could leave the bus in a locked state in some situations.
> 
> This patch introduces a loop that toggles the reset cycle and issues
> a reset request up to SPACEMIT_BUS_RESET_CLK_CNT_MAX times, checking
> SDA after each attempt. If SDA is released before the maximum count,
> the function returns early. Otherwise, a warning is emitted.
> 
> This change improves bus recovery reliability.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
