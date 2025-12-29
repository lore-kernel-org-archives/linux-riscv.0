Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4B8E92724
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 14:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wiwZms3kQiSk/Z5XURH65z5ZpNpL+jMeen/TXEa59k4=; b=cnDx/Wj1meMzQV
	lm+O93wEfWodgBuGgatdkX6h7BmBwLabURc/Bl01B+NUA/+cRjqvJpkw53JV1SP2TN+7OlqM0+/9e
	LBsFpFvBsfKd1/HMUZlqWSSFyobuNYt7ZGMV9MYoomyt8lYhnoUrglqsItZW9RMDpxDshT/3eHxel
	msQfUD4cBThqU+mWAevLUh5JAbcGjVnrmdM8ytPcezNPEEKFzJZrkRaLnuKVCG4P/MrmSUChsoUbm
	MfsJ9xm673u6J6v1yeB3ufiqrpxOGOYXGbG0OTyqwLYRYQ3yul+zCM9fYBT+UT0MI5qwuL+pLyGJi
	ga+9KZLKVWRNmHBiXDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEOS-00000003my7-1EtD;
	Mon, 29 Dec 2025 14:38:44 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEOP-00000003mxj-2L60
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 14:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=0orO2Mu5RW0+CIqVx1kqy5o1A29osmYYi9KlgczG9N0=; b=qNKoPPdKDzv26nsl3UgI0IImCL
	3CcL58xm2LKXUlLmDSaMrfpEW6C5II/z/AAGkvN3G6JY2hwP3dAfIIT4KMjq3MuUeZXSIfu9x6JxR
	VsKe7UyfNUpJKVhvariW5A9qrJ5i7Iw8HfNcuW6IjsAwioVqLfqaf39hRfTCmorSRpeBGskqGmnpe
	MQ0ngCJdSUwlzuPjvCpvWBEua6ufgjCrHIgO0zJjIB40X434WQE//LqP+U5TPDFJiDUA1VO1r23R1
	rAvPhcC6ewjI2htFShs3Lylu+XtHGOWLin63CVTPhnPLhnYJXlhrehCX0OUe6DcuB4+kfQcAthWe6
	AAeYNoUA==;
Received: from [2a01:e34:ec5d:a742:6075:34ff:c68a:2cc7] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vaEOI-00000003LCa-1jo4;
	Mon, 29 Dec 2025 15:38:34 +0100
Date: Mon, 29 Dec 2025 15:38:33 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 0/2] i2c: spacemit: introduce pio for k1
Message-ID: <aVKSaXWr2d0H2d65@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_063841_598829_2C5F432A 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

On 2025-12-26 11:31, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Troy Mitchell (2):
>       i2c: spacemit: replace i2c_xfer_msg()
>       i2c: spacemit: introduce pio for k1
> 
>  drivers/i2c/busses/i2c-k1.c | 307 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 230 insertions(+), 77 deletions(-)
> ---
> base-commit: 8dd7d777904fbe2e684d1f1942f81256ca6fd312
> change-id: 20250814-k1-i2c-atomic-f1a90cd34364

Thanks for this new version. Both commits are:

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
