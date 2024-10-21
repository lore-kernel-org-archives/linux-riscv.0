Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D214AD15DB2
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/UOk0qPi1biMM+Tv3khJw0YtzEEDjnOmGQsekKgKEc=; b=fndJKBKOYTy7SbzXzHAMK2zQQ8
	HpGgbjFG3Fh/R1br6CLbEl/DqmgCdZm4BRiA/kmSGbskA5hX50lIiSOMsTpRm1jC3V6YVif9RV5WK
	JNqlNVf2rOt46JPmPxk+Iq4hbhTr0lEFrwJTyHG0Nf85nToX1SXV7ZxyUQUshx6sHQNa4THH2R7Fw
	yeZaX2MrETNuCw0NCp7HsLmBbs+3aYSQVGOeUkhaMpUS0okyulmehvrV1/CU1bfMj/wdw3H/q7BVI
	cJjkFpYqrkJbUHPWChVUl/89r+3xHC1SEKjbAjiVb44Y68IopqWpnmjVg5+CMsdk/L+BWLUAtFAOz
	nA9VPC7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2uYc-00000007pdv-3LkB;
	Mon, 21 Oct 2024 15:42:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2uRZ-00000007oOh-1wv0
	for linux-riscv@bombadil.infradead.org;
	Mon, 21 Oct 2024 15:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wiskvmF9VvUZk+8tpb5dq40Y3ixtn7Em19zbs6VX0J4=; b=EaRkhStYrrGSgYRXq9NCpwQvzF
	FSr92js68FYw5Ys2QuQXY6emtVhqBEvbAdrVGxIJXpcr019YEVGlGXKCrs4azgSX6qm5fBNmRslg8
	9f5dh8HIA7IzWXsxPv5y9h0RJeJLGZNMCxshBklclDcoOyRR6liRoD+3Byo/sjNy9hLugd6Fx+16B
	c0yz+7vlVthphmSwVQmiwzdo6bp07ZQY1Auys54MVC7Xnit9tJW4/UUoN7l4T5e0DKTP6mJq/5TWl
	jVxTD831Wd4xa9t4+bIEjWihfBhF8yQYV5/KXeSpzgmt/L/gCMHZpeGlaEY01TBsPt+uZntlGQu20
	3QrpaG5g==;
Received: from mail-gw3.jing.rocks ([219.117.250.209])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2uRV-000000080EO-2UbN
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 15:35:39 +0000
Received: from mail-gw3.jing.rocks (localhost [127.0.0.1])
	by mail-gw3.jing.rocks (Proxmox) with ESMTP id 9BC18347B8;
	Tue, 22 Oct 2024 00:26:18 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jing.rocks; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail-gw; bh=wiskvmF9VvUZk+8tp
	b5dq40Y3ixtn7Em19zbs6VX0J4=; b=RG14wvzxxl8/UKibxzjMT/EE3rjypWJ1R
	Yb3a7/eMsky6e2AG8roWxoTfMl8w+3Q3GBDbBl1yCDdfn5io0YZSTSa36bsY2QNF
	xyy1qOZw7R7aWkPt3Tq0ZMqZY+Mw2jkcKN3AKCAlSusjZECiUfREyFFC/l2etPgN
	ZtGsmaIGsgZClO2g/U4nWSmWtEeMVdAPcmPCJavu6RH5KcN+/zaZl1e1zq/HjxJ5
	8Ut+YFKynUS2BUS15ouUQPpn9U5gt0PqrUzSS/eyBaTvotMGw1RWVuAEK6fkvE9E
	OwtrKmnYLZcdGdDM/byHU+bK1nr2N5Vf+1HSkmHRlMJh9Ar4eaIUw==
Received: from mail.jing.rocks (mail.jing.rocks [192.168.0.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw3.jing.rocks (Proxmox) with ESMTPS id 480033470E;
	Tue, 22 Oct 2024 00:26:16 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jing.rocks;
	s=default; t=1729524376;
	bh=pJuI/9yq3jhzCnW1lWIwI9WPmcku8REQsfB23Vm5LV8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a2Y4a2U+CPKhrj1/x9hQy7O6k0w5CPzuBQy6ObsJGEvSKzWuHS3ZfrBUHg2tBHMVt
	 TL35WOBoCaFFjW552MulWlmZHGNR9gghhatn0c3CsPX3qtPIXkRKO7MkUmr7D32zcJ
	 WGCCArq6oDjEQsrCB7cSJd8EHdLq9tm0g1/wzRzUCpd7bBe9Cp0hRrmvCAWksiJP2r
	 lSQD5Jqb5lmDblZoeOYh75nHjM/rA3X1hHGB3gMbllnm9WFnCaynkMs04I3b3Yf5ID
	 2EVL/zJ3022NfbAR7rMd2sNQ79/I7egw9qofz0kCqBcQl8X0z9M+mCehiHq99CRoSu
	 x2zmwJAjWSzLw==
Received: from mail.jing.rocks (localhost [127.0.0.1])
	(Authenticated sender: jing@jing.rocks)
	by mail.jing.rocks (Postfix) with ESMTPSA id 1670B39AF0;
	Tue, 22 Oct 2024 00:26:16 +0900 (JST)
MIME-Version: 1.0
Date: Tue, 22 Oct 2024 00:26:15 +0900
From: Jing Luo <jing@jing.rocks>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: William Qiu <william.qiu@starfivetech.com>,
 linux-riscv@lists.infradead.org, Jaehoon Chung <jh80.chung@samsung.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, Sam Protsenko
 <semen.protsenko@linaro.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ron Economos <re@w6rz.net>,
 stable@vger.kernel.org
Subject: Re: [PATCH] mmc: dw_mmc: take SWIOTLB memory size limitation into
 account
In-Reply-To: <20241020142931.138277-1-aurelien@aurel32.net>
References: <20241020142931.138277-1-aurelien@aurel32.net>
Message-ID: <63780c938a9d2b640b3ef8c2c577383b@jing.rocks>
X-Sender: jing@jing.rocks
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_163538_100799_379903ED 
X-CRM114-Status: GOOD (  20.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2024-10-20 23:29, Aurelien Jarno wrote:
> The Synopsys DesignWare mmc controller on the JH7110 SoC
> (dw_mmc-starfive.c driver) is using a 32-bit IDMAC address bus width,
> and thus requires the use of SWIOTLB.
> 
> The commit 8396c793ffdf ("mmc: dw_mmc: Fix IDMAC operation with pages
> bigger than 4K") increased the max_seq_size, even for 4K pages, causing
> "swiotlb buffer is full" to happen because swiotlb can only handle a
> memory size up to 256kB only.
> 
> Fix the issue, by making sure the dw_mmc driver doesn't use segments
> bigger than what SWIOTLB can handle.
> 
> Reported-by: Ron Economos <re@w6rz.net>
> Reported-by: Jing Luo <jing@jing.rocks>
> Fixes: 8396c793ffdf ("mmc: dw_mmc: Fix IDMAC operation with pages 
> bigger than 4K")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Feel free to add:

Tested-by: Jing Luo <jing@jing.rocks>

This patch not only fixes the kernel log spam by dwmmc_starfive 
reporting "swiotlb buffer is full", but also seems to have fixed a 
serious bug that causes data corruption on emmc (as I reported to Debian 
[1]), which at least can be observed on both Visionfive 2 and Star64 
boards. To add a cherry on the top, with this patch applied, I see 
massive performance improvement (sequential rw speed) on emmc: with a 
quick-and-dirty test using `dd bs=1M`, on Visionfive 2, it goes from 
28MB/s to 42MB/s (+50%); on Star64, it goes from 13MB/s to 46MB/s 
(+253%).

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1085425

Thanks & cheers,

Jing Luo

> ---
>  drivers/mmc/host/dw_mmc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index 41e451235f637..dc0d6201f7b73 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -2958,7 +2958,8 @@ static int dw_mci_init_slot(struct dw_mci *host)
>  		mmc->max_segs = host->ring_size;
>  		mmc->max_blk_size = 65535;
>  		mmc->max_req_size = DW_MCI_DESC_DATA_LENGTH * host->ring_size;
> -		mmc->max_seg_size = mmc->max_req_size;
> +		mmc->max_seg_size =
> +		    min_t(size_t, mmc->max_req_size, 
> dma_max_mapping_size(host->dev));
>  		mmc->max_blk_count = mmc->max_req_size / 512;
>  	} else if (host->use_dma == TRANS_MODE_EDMAC) {
>  		mmc->max_segs = 64;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
