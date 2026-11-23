Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8C5606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 22:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tEBb6eOo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=bD9D/dXj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vw7uFqlaxsHzhMsuopjIprxi4V5EuzCgF9l51B0NeUc=; b=tEBb6eOoYbHCgWC4+2iyXntdU2
	uIRgGtfLYO7LDsibgOykq81FAezO0sRC+Ds+KSuTZe5eQ8XRQug5TuWIlM3e8SidoRhdv7jsJFh1f
	hd2zLxy+/txkhlBfemS7oW3Qot8qrwVjTZju6XLWNm5elpqSXR1IVccWEiajZevcc2rPJx49OeqSB
	UZaiBS4rbuzvj+cLeV8/zBjXmgYn+6EkQx5hztYgzG+FMCSV84InH/xTZUhHPnS9CjwcM0rru8oiH
	JnxxiTbu2/URYaF5oVp3x38/cL/UZwdlChO8/ZAaIcdZHEYijkwuvMkoGe1mTR/3qVKteDBz1ALK6
	lVuL8ZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcRl-000000054CC-1t2z;
	Mon, 23 Nov 2026 22:23:37 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcRi-000000054Ao-2RRJ
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 22:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Vamf6qewNSAWnl7V8j1ewD5Z1Pgf95ZZp/ReDU0LPuc=; b=bD9D/dXjIpyZzr4c6I0jQ2QMQj
	ehgl7iCDnWoNXSx0YhEvnJ5cJGCAeC9cTolz8PZuvoDvkCHiHjHUfx6ya/lKMc6sQ8vCxdemkkfDB
	wvYTduI7EmGjMH0al98IhmI1mLwxlTfedk+C1UmToX0/jHnw1AId6wT5nWqthkp7YI5CZe2jOYvjF
	z8K2vxzl4W1h1+ULTvWHTMN5+MdNWWQy+btnxEgU0Cs0oPHoIYdwTNMwiJjnfckE/nly/OOV6rn+9
	U8U6dcr9vR5D2ftpSNONQP46crIDrAX1wzx/12EvyAcVySUKmrHa7TcbqkBbl2KIaXHNjczmurWlw
	RWc75JOg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xVcRe-00000007bY0-3lpJ;
	Mon, 23 Nov 2026 23:23:30 +0100
Date: Mon, 23 Nov 2026 23:23:30 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 3/3] power: reset: Remove SpacemiT P1 reboot driver
Message-ID: <awS84s2FVdzy3j4Y@aurel32.net>
Mail-Followup-To: Anand Moon <linux.amoon@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20261118104935.1716-1-linux.amoon@gmail.com>
 <20261118104935.1716-3-linux.amoon@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118104935.1716-3-linux.amoon@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_142335_041267_B01798C3 
X-CRM114-Status: GOOD (  18.64  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Anand,

On 2026-11-18 16:19, Anand Moon wrote:
> The SpacemiT P1 reboot driver uses I2C-backed regmap operations to
> request system shutdown and restart through the PMIC.
> 
> The system-off handlers run in atomic context, where regmap operations
> may sleep. This can trigger invalid wait context and
> scheduling-while-atomic warnings during shutdown or restart.
> 
> On SpacemiT K1 platforms, system poweroff and restart are handled by
> OpenSBI through the SBI System Reset (SRST) extension. The Linux PMIC
> reboot driver duplicates this firmware functionality and is no longer
> needed.
> 
> Remove the driver along with its Kconfig and Makefile entries.
> The P1 MFD driver and its other functionality remain unaffected.
> 
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> New patch
> ---
>  drivers/power/reset/Kconfig              |  9 ---
>  drivers/power/reset/Makefile             |  1 -
>  drivers/power/reset/spacemit-p1-reboot.c | 87 ------------------------
>  3 files changed, 97 deletions(-)
>  delete mode 100644 drivers/power/reset/spacemit-p1-reboot.c

The patch is correct, but you might also want to remove the 
spacemit-p1-reboot entry from drivers/mfd/simple-mfd-i2c.c.

Anyway, while I support removing this driver on the long term, it might 
be a bit early to remove it. Indeed, while the driver is available in 
OpenSBI 1.9, using this version requires either patch the vendor U-Boot 
or using the upstream U-Boot which still has some limitations (thanks 
for your efforts improving it).

At the end with your patch 2, keeping this driver a bit longer doesn't 
hurt, as it is only used as a fallback if the SBI SRST extension is not 
available.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
