Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61738CAC5B0
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 09:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/by4hWJZwOGMuLKhbvQixZi8j/mSCXNJVcW+O8f7uo8=; b=D38CBd1Zs/U8wr
	hbD4CRq4R6EhF1IgWdkm8PiMgtyHl12EBQ1wW7cBdl9E8k6DSdqbq1SQjHF/lbDEBKy0Uv8XTzjt5
	h55XTpHpCzKnNOVk9rCI0LbwfDYtOJYeEA7F68MK6Z/TvOithInuyp65NOaaImxMYhJ44NuU9DS8U
	exlCw5nJta6KRUhoRYZHoFSVfDjNM3liBqcqHdOwY7myUX5Jy6bR5p4/enns3dfGHWuCggOVdNCqt
	BitE3fyrQu/05oqnaKLcQdc+ceSW/pcdyWIa2P0ho8K4yJWI7Lwoa/jJQKospsgFlfv92cw2VsxpL
	DMiskoPaQTcN7qHFpfsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3A07-00000001w3T-3dFz;
	Mon, 29 Sep 2025 09:16:55 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3A04-00000001vtT-12T2
	for linux-riscv@lists.infradead.org;
	Mon, 29 Sep 2025 09:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759137359;
	bh=KeVkegvpdMgh47tnqmI3xOua1lgqp1cz8RZNtr7UffM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=KLhSDn6IBsZmWQtzF/f/Zsyev6LZxPqwUzOAXeDRh09r1/PnwZa7soxBpCGCAaK7h
	 DkM99ViR460i1OdO9ax2FYT2Xs0p5l7ZhmSk/+5aoGwYHbLrU6iKj9glFg+jQgQ8WD
	 ashLz5+bJNFNlfEQIIzdv+xo0/Z6Lht4PQyROGOs=
X-QQ-mid: zesmtpsz4t1759137350t17f23be7
X-QQ-Originating-IP: FVLep5dVBtmVD5DCpCmR0xTVH0ACm5Z5iCCpFlyvgyw=
Received: from = ( [14.123.252.176])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Sep 2025 17:15:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 981246392991954728
EX-QQ-RecipientCnt: 9
Date: Mon, 29 Sep 2025 17:15:49 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3] i2c: spacemit: introduce pio for k1
Message-ID: <A6E9D3643EC66124+aNpORZx6yq8VOfd8@kernel.org>
References: <20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NJcWJJyfcVSIE+dZGnLUCuQBwYiiXz1dGQt5VB3R/aE04qlDSLZIAkQt
	YNnF67pY4NqjBJS7S1U58lSJ9l+OTKlyCzfmceYSbTL+mR4oq+3+rV/n8Kdu6TeQAeoB6jT
	A0/qviKULd3LHkGnIzkTm8WylPHCGbkvpP/R52bgQDCJSEhO1qqYWUgb13WGwWSTmUGlG5a
	SyL5XytTF6r+UBPzliJrvcW8Q9Ujn+kHQfa5xo1VgkhsBs/PBDgBmmehLKGxThxQxXqMeRj
	F7uPtBSykgJRqqnwMF8RqZu3CkAMHFFpyW2iCx2bTPoC+WIkTc19BXHH3ArRPkA4Chsh10d
	5kZbr9H/muJTLSbolyFwCxhQ2H7Izx+0Yc/ZizzXhhuUaDBiaKNb5KRS8wfYHAG61gJdfR4
	9hK1qrPNyd4PtKkktB5cRlLGUSbR2WerX4+OXZJr65JG78DgUWtHELkYnV/tlfw3PSPmpi6
	VEvU9a6RhpvJAYAmyXBEjiz11wyqJDpcktNw2HyQj0jkFetEhdGhsRJDJ95/c16V9xFKC8g
	TqjiMcGD11K4jprS1psn/oG3r/mtdFJj71zZqhXQnQEe8kAOyXCNJi15ly+vu8V20HRejNl
	ZPgpdJu/AVx9ca/7Cbmfe5Pm34CbWvdTrn3YE1SdQYDro5wrc6pT+rRYWiw6GXl1eZUSHRX
	oO+NcFa2gq3itmRV/8Zo2NiWy5mNdBLYPzHZt2+bLfwE9fOMz3zDWVPsI9Cxd00k9VXM2Y6
	Wa0qBx765KLSUI26Nmj7WZUlBPKVVmWuEyGQg7E6/ss6c/Qxp4irbhnRYY9rdvyVHbfOWWH
	GTkKjPchdiLJBHx86y5a/Z4AkMzp6BAGDWlHfFXUR9wQbfIBIgOZOQLK8ooeRlnuQztHnw7
	FR4YBn9CE+pRJu9Qm9QBxkriRvg4x/vwDjFKaBguBm5mGE4ZPeQ4ZGkzrlgi+zyQwnyHzyW
	kyeapqnKFWEoyPkpZDDHpRtImxtVatSrtZTKKrhDaLK4Zwfm4pLCbSD+U6IaYdMnRFvksRi
	ZOVN2IMhsrXb0RPwq9KkjlOFnLSAH2rGjyrPxMolXL7x5xbegKW9sioQPuaHYrUfRwHS3f/
	Aiib/X+kum9LJUmaM+8QoE=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_021652_968562_1EDD333D 
X-CRM114-Status: GOOD (  17.48  )
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

On Mon, Sep 29, 2025 at 02:07:49PM +0800, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changes in v3:
> - drop 1-5 patches (have been merged)
> - modify commit message
> - use readl_poll_timeout_atomic() in wait_pio_xfer()
> - use msecs_to_jiffies() when get PIO mode timeout value
> - factor out transfer state handling into spacemit_i2c_handle_state().
> - do not disable/enable the controller IRQ around PIO transfers.
> - consolidate spacemit_i2c_init() interrupt setup
> - rename is_pio -> use_pio
> - rename spacemit_i2c_xfer() -> spacemit_i2c_xfer_common()
> - rename spacemit_i2c_int_xfer() -> spacemit_i2c_xfer()
> - rename spacemit_i2c_pio_xfer() -> spacemit_i2c_pio_xfer_atomic()
> - call spacemit_i2c_err_check() in wait_pio_xfer() when write last byte
> - Link to v2: https://lore.kernel.org/r/20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com
> 
> Changes in v2:
> - Patch 1/6:
>   Patch 3/6:
>   Patch 4/6:
>     - nothing
> - Patch 2/6:
>   - remove is_pio judgement in irq_handler()
> - Patch 5/6:
>   - fix wrong comment
>   - In spacemit_i2c_conditionally_reset_bus(), once the condition is met inside the loop, it should
>     return directly instead of using break.
> - Patch 6/6:
>   - add is_pio judgement in irq_handler()
>   - use a fixed timeout value when PIO
>   - use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO
> 
> - Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com
> ---
>  drivers/i2c/busses/i2c-k1.c | 206 ++++++++++++++++++++++++++++++++++----------
>  1 file changed, 161 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
>  static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>  {
>  	unsigned long time_left;
> @@ -310,10 +376,16 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>  
>  		reinit_completion(&i2c->complete);
>  
> -		spacemit_i2c_start(i2c);
> +		if (i2c->use_pio) {
> +			spacemit_i2c_start(i2c);
> +
> +			time_left = spacemit_i2c_wait_pio_xfer(i2c);
> +		} else {
> +			spacemit_i2c_start(i2c);
I will put i2c_start() out in the next version.

                        - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
