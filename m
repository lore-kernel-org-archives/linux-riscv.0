Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEDEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Dec 2021 08:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIOXx1N960dZ9LMQn7j69fmAf8BhiLxjS0018AGppbk=; b=L8leSGDifoh6eM
	RD8ytiAA0KkTCAys4NgNY5ghyrITg3NJxmLpj5/06RcbSJ5lKFbiwvwme9VGZoecUhOh2lxQE26Kx
	FNAAuLjvI5ucz2ZJB9lxTVLW5kYnOxMh5LiLllfcKnF8WiQFW0OIMhCeG5m8ZF3Ukd2vbJUjm7gm3
	9mwBoZ2ZlB7hvyVIJ1rlxY7OOZXpmXnt5ilADk0z3iAGHaaShByVL3FIG8tYtcdsBP9x8OoO8ALHn
	JPoOTri4v5Oz6mDzCca2p5f/Cii4Aj39SMX1Jze7kLo/u26bMvbiN9CAGu1ufpz0ygRj5qzeLlLE+
	tRhYwoeyWBzZBUIoRzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1musMP-00BhkK-A2; Wed, 08 Dec 2021 08:31:33 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1musML-00BhjE-P0
 for linux-riscv@lists.infradead.org; Wed, 08 Dec 2021 08:31:31 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4J89P40jSzz1r877;
 Wed,  8 Dec 2021 09:31:20 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4J89P36P6wz1qqkC;
 Wed,  8 Dec 2021 09:31:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id BADRdZDQlkw7; Wed,  8 Dec 2021 09:31:19 +0100 (CET)
X-Auth-Info: tna6jNS7OLYeuupep279fwxSQb4u5tIM75GH2/x8Ki5BnDbR5rcv9nJuNY1bNTwr
Received: from igel.home (ppp-46-244-185-244.dynamic.mnet-online.de
 [46.244.185.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  8 Dec 2021 09:31:19 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 8588A2C3839; Wed,  8 Dec 2021 09:31:18 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Zong Li <zong.li@sifive.com>
Cc: mturquette@baylibre.com,  sboyd@kernel.org,  palmer@dabbelt.com,
 paul.walmsley@sifive.com,  lee.jones@linaro.org,
 linux-clk@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/1] clk: sifive: Fix W=1 kernel build warning
References: <d2e681e5ea31c62529b619a3777570b4792e0684.1638928796.git.zong.li@sifive.com>
X-Yow: Three attractive BANK ROBBERS are discussing RELIGIOUS DIFFERENCES and
 MAKE-UP TECHNIQUE with them!!
Date: Wed, 08 Dec 2021 09:31:18 +0100
In-Reply-To: <d2e681e5ea31c62529b619a3777570b4792e0684.1638928796.git.zong.li@sifive.com>
 (Zong Li's message of "Wed, 8 Dec 2021 10:04:22 +0800")
Message-ID: <87pmq7qyzt.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_003130_008970_B0AAFFA4 
X-CRM114-Status: GOOD (  11.01  )
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

On Dez 08 2021, Zong Li wrote:

> diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
> index c220677dc010..c8271efa7bdc 100644
> --- a/drivers/clk/sifive/fu540-prci.h
> +++ b/drivers/clk/sifive/fu540-prci.h
> @@ -13,4 +13,9 @@
>  
>  extern struct __prci_clock __prci_init_clocks_fu540[NUM_CLOCK_FU540];
>  
> +static const struct prci_clk_desc prci_clk_fu540 = {
> +	.clks = __prci_init_clocks_fu540,
> +	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
> +};
> +

A header should only declare things, not define them.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
