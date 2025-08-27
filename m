Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D9BCA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwCV5fu5En8TA/mV6oDn7BtLnT2R1RwQc2ISbbPDcv4=; b=zlWIPlKPO/SxiM
	BSE/PBOlPzDCRs3Cz2bvb3CnfZWHtk1Wx3AN8on8tHNrYmqB4HkivppecQ4sf+87SkM1s0jH6DQn3
	Ks70hXOzhlF1+5/1zifysaN9g2WtdTYdpbx/gMB3eOH+cv5+dQgXE97PO3u29qZI2bjfGgD7kLoK8
	0pztIAZxb23LSXTo1b2Mk8aBYlcHVY5Ef11On5A15epusqfaZ/zHWTY19sKiCclJ64Auebbn5CBkv
	ozwpbGAMild9cFaslVfhL1rhOntEbzjcGGXsHkJ2EH19iyr7OF7ND+yHyq5G2356tJ1gYJFy9sFaK
	6OS/ZAfxP0c1dP2qdoXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDzx-0000000FAEm-0kdT;
	Wed, 27 Aug 2025 11:07:25 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urCXk-0000000ErK2-1jlb
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 09:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756287130;
	bh=6eeMVxwkfOT98px7m/TPeZ9Mrao8kB0xahBdzHlt5JQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=HtLJXVpG4TrcZO9ggBhvYTCVTvCxJ6AjCNqaUTFN+wSBSI358rUSfVNxdEtzaKTyW
	 e2tOQ3Thfxx+VaonXUS9TlihICGwhVPosJ12HaYsj+qa6gKx6XJv13NjH5iOzAiKB+
	 AWjLHc57wTlLeq0vZFeyF2wSAVReSBJ49oAORpGI=
X-QQ-mid: esmtpgz11t1756287123te9b25669
X-QQ-Originating-IP: YulJEb3+/X1m8HZW1gm5HQdoovwYx9pwQ5ltU3NREuQ=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 17:32:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4606825760503529289
EX-QQ-RecipientCnt: 9
Date: Wed, 27 Aug 2025 17:32:02 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 3/6] i2c: spacemit: disable SDA glitch fix to avoid
 restart delay
Message-ID: <DCC64908985C6746+aK7QkmNHa_QMRfgh@LT-Guozexi>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-3-e59bea02d680@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-3-e59bea02d680@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OSUW9vQLVhiZfERrVpjaLNcVCB83QdYWKIeN0TNgaFnjhSMj2TXYNb+x
	rWZRWnVpQfJaQLaOJXtIvkRbyLto8AaOX6NeRh4NaVxe5wI6Ff87s+oWMgGjUOBZDMD+x4u
	QpUhtqYzpSs4jVDse4ubDru+9seIlXoY2rSYoxHvo/MNeZVZ8GPiQEkzZBLKu7wdsXShx+d
	rJroyuQ5jJ6nv5tBflFAvSLAGuZ9nAp9c/gHAe+3lUtEu3suCBbD3MEc1HfYdm4uGKvrlfi
	IBh+U9B7cVhD20rlNlx9MuNHv6ZUEhE19Fzm5GwPsWoT3HyQop6x3eh2ct/nMr+mLoNoJpW
	2nhGCFmlyV7IjEEzCzUgVIIdh8SqQlzpx/OawT+flYX+5TLMHi0j6dY/MFGdlbckXQaXqIN
	8xeGow/PzLC/OW1NlYP5FA7vsvF52QDCaEuYePwgXGM/tzhJwRz0ILYeooFW9F4NvLHyTa4
	wZLQRW2l0ja8tmUt2ymXSGLBsDCadp7EZB0uIFV5jDZWW1Y09BvJDdW+f2+KN+7VpudNDDy
	8a43vdK89tq0HH3QvXXZnyFaxA1drfYbvNfuGO/Hn8l4aG6fGtPFWaa3gGmuIEkWyxNHkGF
	o/uwO+vm5UspXY13MWSZm+ndk2Vu4OSEs2TMfr2g7yGEadQ/IAg4GY6pR9o+o8AZyh5+IOH
	VG5dYxoRpg6f83HxD1vbOkUAUtVVFOY+308V9QWtdro5JPNkhGQlfjSRoIdYm6Er0+OUwMg
	s4yg5OzNJfJZKc04FLkpbvbbYvDl0v42STC/x7RDwv7LUUWsfI6B5czaPW6tJVuLD0k1rkv
	tAxZ7gki6NwS8V3GYMSEmyPbPwpuVsMVwCWf4HQTpx9hRZ5eUr3oJzVTvayTVbUcYGUE4m2
	KVYtWWPqszjTE9UYzj/wGHHRJZnE/iNYtLhv4HmWWl8krUq6mBehs23VQ3o4eDOFqKHPiAT
	zZ71pk4OqABtijsROLYdeyVIuT/ShYYvCul70TS7VIoQXYZX5MrIzsGTE8wvoidY0BOSWqs
	wasneLhp9ZhTMDkwOkTx6Dy1Np+Xoq/W2W9VHdjAyKxV4LBldT5b6PrKQ0Ae5tEe7tPuOuX
	A==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_023412_983451_A393C5A6 
X-CRM114-Status: GOOD (  21.09  )
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

On Wed, Aug 27, 2025 at 03:39:10PM +0800, Troy Mitchell wrote:
> The K1 I2C controller has an SDA glitch fix that introduces a small
> delay on restart signals. While this feature can suppress glitches
> on SDA when SCL = 0, it also delays the restart signal, which may
> cause unexpected behavior in some transfers.
> 
> The glitch itself does not affect normal I2C operation, because
> the I2C specification allows SDA to change while SCL is low.
> 
> To ensure correct transmission for every message, we disable the
> SDA glitch fix by setting the RCR.SDA_GLITCH_NOFIX bit during
> initialization.
> 
> This guarantees that restarts are issued promptly without
> unintended delays.
These are the restart waveforms before [1] and after [2] disabling the fix.

Link:
https://psce.pw/839rzq [1]
https://psce.pw/839s4q [2]

---
And I'll put above information into the commit message in the next version.

                 - Troy
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index d342752030d077953adf84a2886211de96e843c4..c1656b78f1681729ccc2ebca6e290259d14889d9 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -14,6 +14,7 @@
>  #define SPACEMIT_ICR		 0x0		/* Control register */
>  #define SPACEMIT_ISR		 0x4		/* Status register */
>  #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
> +#define SPACEMIT_IRCR		 0x18		/* Reset cycle counter */
>  #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
>  
>  /* SPACEMIT_ICR register fields */
> @@ -76,6 +77,8 @@
>  					SPACEMIT_SR_GCAD | SPACEMIT_SR_IRF | SPACEMIT_SR_ITE | \
>  					SPACEMIT_SR_ALD)
>  
> +#define SPACEMIT_RCR_SDA_GLITCH_NOFIX		BIT(7)		/* bypass the SDA glitch fix */
> +
>  /* SPACEMIT_IBMR register fields */
>  #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
>  #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
> @@ -237,6 +240,14 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
>  
>  	writel(val, i2c->base + SPACEMIT_ICR);
> +
> +	/*
> +	 * The glitch fix in the K1 I2C controller introduces a delay
> +	 * on restart signals, so we disable the fix here.
> +	 */
> +	val = readl(i2c->base + SPACEMIT_IRCR);
> +	val |= SPACEMIT_RCR_SDA_GLITCH_NOFIX;
> +	writel(val, i2c->base + SPACEMIT_IRCR);
>  }
>  
>  static inline void
> 
> -- 
> 2.50.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
