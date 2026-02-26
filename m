Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A03FCE08C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzqDC12qJ+ns5MFCYlqKKf53/6uisEz/6P+KyojPpmg=; b=fjKz4hXYg5QanD
	qvqCf2UJWohiP8oqNChjtftqwQKH5FJmcgR74BOfSgDJzcoJwepTNkuRKocm4jfXd3t7H/oWQyGTD
	GZYK8fQvCy3PFMdLvJ8T4Y3wCeKbMCAiSS5UWC+WTr96hiBmria2hEf/Rh73hdE0nqMM0bWcdmFGN
	zbzXqX50X10VZRS53iwGqTsZZHC/m0I7yWzrUfPv8eDLG3l8geAnVTf5tZdJg7+eGsuX8qOA0UUwp
	d5fg1h7Nrz5FEPqVgvn3Mq3qQvvJniMwchrZnA+EvsaZfi/jgu1OkQZDVn/xO1rqDkG742YSHlPd6
	rHn0fM9nMv7ypMKR6hLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcWk-00000006MJh-3DE6;
	Thu, 26 Feb 2026 14:39:42 +0000
Received: from mail.bix.bg ([193.105.196.21])
	by bombadil.infradead.org with smtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcWi-00000006MJF-2xpg
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 14:39:42 +0000
Received: (qmail 21106 invoked from network); 26 Feb 2026 14:32:58 -0000
Received: from d2.declera.com (HELO ?212.116.131.122?) (212.116.131.122)
  by indigo.declera.com with SMTP; 26 Feb 2026 14:32:58 -0000
Message-ID: <b51a62513daa9d2390031ec350e0b33bdb7e54aa.camel@declera.com>
Subject: Re: [PATCH v5 2/2] mfd: simple-mfd-i2c: add a reboot cell for the
 SpacemiT P1 chip
From: Yanko Kaneti <yaneti@declera.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Lee
 Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, Troy Mitchell	
 <troy.mitchell@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, Paul
 Walmsley	 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, "open list:RISC-V
 ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support:Keyword:spacemit"	
 <spacemit@lists.linux.dev>
Cc: "open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Date: Thu, 26 Feb 2026 16:32:58 +0200
In-Reply-To: <20251102230352.914421-3-aurelien@aurel32.net>
References: <20251102230352.914421-1-aurelien@aurel32.net>
	 <20251102230352.914421-3-aurelien@aurel32.net>
User-Agent: Evolution 3.59.2 (3.59.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_063941_104521_8F13EC33 
X-CRM114-Status: GOOD (  11.90  )
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

Hello,

On Mon, 2025-11-03 at 00:02 +0100, Aurelien Jarno wrote:
> Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
> v5: no changes
> 
>  drivers/mfd/simple-mfd-i2c.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 0a607a1e3ca1d..542d378cdcd1f 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -99,6 +99,7 @@ static const struct regmap_config spacemit_p1_regmap_config = {
>  };
>  
>  static const struct mfd_cell spacemit_p1_cells[] = {
> +	{ .name = "spacemit-p1-reboot", },
>  	{ .name = "spacemit-p1-regulator", },
>  	{ .name = "spacemit-p1-rtc", },
>  };

Perhaps its safe to merge this one now that everything P1 and I2C is
already in linus tip ?

mainline + patch + dts bits enabling i2c8 on the OrangePi RV2 and R2S
allows both to soft reboot as expected.

-Yanko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
