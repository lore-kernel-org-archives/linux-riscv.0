Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1F9606A33B
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 20:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QkyPyjBw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=pmYBiPny
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V0CpwQnrjLZfxVLr4Mr9Ay/Xz6mwwbyMOX54INsVz4w=; b=QkyPyjBw4lzt+Z4yRxOJAfPzPn
	JUbt5N4lwEZ7tTjt5LUYSNs4tTQ7bJxEQ72KLxdo5yOsEVRB5XJ4s8e4lyI4qO2uMp5F2d8vtWSZG
	JEUG2VVKbO0mhSerlqQ45ckCtW4ByWFvRyJcLShpLQwJ/AxF5MHo+xQcMT/O5yi4DSL9QExFPHKpy
	bSmmLK+ZXAGUZl1XnRkEdquS3oNr6ZGOFTG+r5xt5OIufTpk6HjXOwpYgPSKmpRBCWtLW3ngNQzA0
	UQwMTPmWrXN8uVrMiToqzBNoP/+C397DBp07e8jjQl590wfVPuVeQYKN1BRU5gMWDbqIbsVTDrLnO
	yQChaqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsmM-000000050oR-2aO8;
	Tue, 10 Nov 2026 20:49:18 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsmK-000000050o2-0lEZ
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 20:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Bf/AaZlKXJsIZfpfcnPrYCQ8TrA8wpK1qNvneo+qbhA=; b=pmYBiPnySBBL4gRZjkA7D5oEG4
	qsoLjT/oqrSpb2nB1K2BiwI7t+BYONzCkNvW/vYMaSImd9sOQHenUmUl4En53uLq8OhLPUfRFmWSK
	ZiBhdv8Ihhfe4SUK1fnnM4aXnxQWIltfmsqdgMkzFVufirT+q6Tk6DYT6K4QIqZ1O35exzSFfq+dJ
	iHhsnArmCOxOFTmplXA/boQc8H2a8T5+C4dTSCxPTcp7M8a7qYwfRnOT0wvIufmdXGVHTJI2lYsz/
	xaqYynG2gonG3JUWoCGzcJDqmHWPHjYrzAV+HVzCG4Lxw9g/OSxqgl8/iKFqeguAmrwPlWUpyxeis
	/Wvb8Oxw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xQsm8-00000006IgS-0eMv;
	Tue, 10 Nov 2026 21:49:04 +0100
Date: Tue, 10 Nov 2026 21:49:02 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v1 1/2] i2c: spacemit: Avoid sleeping during bus reset in
 atomic context
Message-ID: <avODPs8yytWCMxn3@aurel32.net>
Mail-Followup-To: Anand Moon <linux.amoon@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	Alex Elder <elder@riscstar.com>
References: <20261110061429.2036-1-linux.amoon@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261110061429.2036-1-linux.amoon@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_124916_232313_9F5F6228 
X-CRM114-Status: GOOD (  15.80  )
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

On 2026-11-10 11:44, Anand Moon wrote:
> The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
> to wait after triggering a bus reset request. However, this function can
> be invoked during atomic I2C transfers (such as power-off or restart
> handlers running in atomic notifier chains), where sleeping is illegal.
> 
> Replace the sleep operation with the driver's internal helper,
> spacemit_i2c_delay(), which conditionally uses udelay() when running in
> an atomic context, avoiding "scheduling while atomic" bugs.
> 
> Assisted-by: LLM
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: Alex Elder <elder@riscstar.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index ff32876e24d3..f4b21d7efaaf 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -332,7 +332,7 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>  		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
>  		       i2c->base + SPACEMIT_IRCR);
>  		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
> -		usleep_range(20, 30);
> +		spacemit_i2c_delay(i2c, 20);
>  	}
>  
>  	/* check sda again here */
> 
> base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
