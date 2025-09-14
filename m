Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790B1CA0EE8
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 21:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axX90+X/xjkgBIFIpPl8nPLuo2hee1kwMVh7479Jnvk=; b=FJou5aH/T+BTE+
	KPYmtPaoXdb/F5M3cTEUy9ze6UAamBmqZjA2EfoQOxSdRGuN6UIyTz0alnFCb8zkvfJfAn/LI2ITo
	W4tkZ3VbtfrjkOcKrA1mSvWkO32iz0e4jOdqyMYTJGa+48XKbRrGp+eHVYLrwl/deh644bth8ZKkG
	+1V7jJ8mx5SpvSpsLYK+yRzXlv7O0GRXQkPswTEXcMLncl7y5VEPqfP4h32LfcOdW+uvh7qVY+gll
	88NbIiw/Wf9tOd2xgQI7E6sfm2Tqz2BgJg7lKphvEitBtTJp/G8A59UvHh31V7/lCZamM7bdzQAoU
	8Hl3bdPSMS9uguxnmaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxu5h-00000002Dm4-3L68;
	Sun, 14 Sep 2025 21:16:57 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxu5c-00000002Dkh-0kxl
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 21:16:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5B4954E40BD1;
	Sun, 14 Sep 2025 21:16:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 092936063F;
	Sun, 14 Sep 2025 21:16:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76865102F2A78;
	Sun, 14 Sep 2025 23:16:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757884606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=PrFkxRI/rM5SQxoVJY6C6jishZsikS57oIN/hwunQlI=;
	b=j+82wh8EW/26ftt8B3pTo1EF6a84LZS/ds3nQRpCwbhT3EnmTALAHRvlO8AaJPUcIhLHT/
	gl6jy60jXJho+DItqUqAiO30JedIhLNi6Q8iHiliohdlf/U1fzqVAfru1ocswYYozJrZ6b
	G8T1SuFDUk3FEl5M8tYxF5FckzXCm3SvxGXKysA2w/fNni0aqN7/YjLZ7Qrcx+e+82gmuN
	TrF/Uq8mV4ZHEstaLbfM1ST8YeXhs0i1w7ilUCrIHelmL+RBtOtGJN4y4l7FAtcPFuJc7e
	9AmDmRUv8YBvnRbWBiulqtUTQeRPGkyMscOZZNXSS0NMEANY+15EN7K4nD8YnA==
Date: Sun, 14 Sep 2025 23:16:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb+git@google.com>
Subject: Re: (subset) [RFC PATCH 1/3] efi-rtc: Remove wakeup functionality
Message-ID: <175788449957.388732.6353062596898107602.b4-ty@bootlin.com>
References: <20250714060843.4029171-5-ardb+git@google.com>
 <20250714060843.4029171-6-ardb+git@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250714060843.4029171-6-ardb+git@google.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_141652_355070_0AFD4CE8 
X-CRM114-Status: UNSURE (   6.51  )
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
Cc: Juergen Gross <jgross@suse.com>, linux-rtc@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, linux-efi@vger.kernel.org, x86@kernel.org, Bibo Mao <maobibo@loongson.cn>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, xen-devel@lists.xenproject.org, Feng Tang <feng.tang@linux.alibaba.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 14 Jul 2025 08:08:45 +0200, Ard Biesheuvel wrote:
> The EFI rtc driver is used by non-x86 architectures only, and exposes
> the get/set wakeup time functionality provided by the underlying
> platform. This is usually broken on most platforms, and not widely used
> to begin with [if at all], so let's just remove it.
> 
> 

Applied, thanks!

[1/3] efi-rtc: Remove wakeup functionality
      https://git.kernel.org/abelloni/c/50562f9cd366

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
