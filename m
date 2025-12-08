Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFFED3B7EA
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 22:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8x1NDFAjPAZ7Pp0nUjR0kJM9gAa1GLpaFb+kApP0B0=; b=JsVw3e1qOd2a3Q
	C9DjiI5npgxV7TKkKI3rzCGzRxfv8+8iNuN6R1ReE1CbnSNHWw8HcWckk4gG9bPvMe78AMvwKuc7k
	VeFS+LtX3EPxAaJniSwv94jfw+yGFHUu16flHgc+fADSfAM+eDZXjtOa4K6gdDq6I8moEZOU4glhr
	wyQbfdepST3TYGuP/Is97PQumbIJjOmVBVEYX7oiaBGhOk+UwiGFygZK+g63oN+iEOOqc+Lhafo6e
	oW6U1UIs703BBiiSMtXre9aKfSN9ibZThR4fNn7snFDR2ltDlSWBXKoDddqJSS6AnsrQi8E7qk7iF
	bLVfS2AnJeEINunEONuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSjQw-0000000DZcy-3LG6;
	Mon, 08 Dec 2025 22:10:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSjQt-0000000DZcA-3cmf
	for linux-riscv@lists.infradead.org;
	Mon, 08 Dec 2025 22:10:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B9DCF4E41AF2;
	Mon,  8 Dec 2025 22:10:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EE9B606DD;
	Mon,  8 Dec 2025 22:10:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D1B3103C8D5C;
	Mon,  8 Dec 2025 23:10:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231811; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=mWYWUqUd6OQt7ZTmYi9XvKs64pHlmAY9QPRYKKtCcFM=;
	b=Rt24g4myiXVnNAovrP9jmwGnftV0vDJl4Pb6W9vWLh7F7cxwRKWvMSxvvJilWNvYoBFu3Z
	EQ2LIYI3Zzn53izvjSbY3Bqm/c6y/2svxnL2eelGeqq6n+hovdbER0s10q12AtvO6texI2
	1pnme6q7Krn5NRMlM5Lrl9wOQUONd25MzixAhudxvBzcPVgx6LOm4utGikX3ySF0avryUb
	RKHvAfiBuyjK70bta4tdNw+wmokJzX8dS+NPm5DficVcGyhgOviL9vJ9NBsuBIYAweJIFq
	iwslDl/nfwQhPUsC0l3rB1MPDauYaHnuVVXcn8GMDc33BzGSeJt9HaDVWurhjQ==
Date: Mon, 8 Dec 2025 23:10:08 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH v3 2/4] rtc: spacemit: MFD_SPACEMIT_P1 as
 dependencies
Message-ID: <176523152359.342815.11295458688296790112.b4-ty@bootlin.com>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_141016_046471_9744FAEF 
X-CRM114-Status: UNSURE (   7.78  )
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

On Tue, 18 Nov 2025 14:08:06 +0800, Troy Mitchell wrote:
> RTC_DRV_SPACEMIT_P1 is a subdevice of P1 and should depend on
> MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
> does not always respect the parent's dependencies, so 'depends on'
> is the safer and more correct choice.
> 
> Additionally, the default value depends on MFD_SPACEMIT_P1 rather
> than ARCH_SPACEMIT.
> 
> [...]

Applied, thanks!

[2/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
      https://git.kernel.org/abelloni/c/16bd954c9336

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
