Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C23CD4F4C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 00:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haElhgmPJq9IzE1zBQUu5orjyDPxmZewoZ5xtVSx/fc=; b=f+Z5t7qCZyQd4/
	1egaKhkrrQqNZsl5P9FAK81497OFgBXKrg6PgBpESojfGaGO90NASyPF21z0upnR1TJBKn1PB2zsP
	/q1l+8YN3OZjM1jT0aB3QrG/chYpMGbKD/dJJh3ROtvNpewcePgPspwHl/NeBaydr8WyVujJ/9L1z
	AoLj9A6TAm4+x4QHT6WLR3EcabwQZ2QXbiPp9DpBiXAqGPpQpqxy238jqTZnOUFxSjnVQcmIlXNkE
	UMsc3ni7Kr60kEblM3NU2WK1aka43ueTyV6lvfjJmyC+fmzg4O5ISj67AIiGEUmz7/Vto1QcqqpfC
	9juEx9QnsHqKfxMfJl+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm0YK-00000006ViP-28nz;
	Thu, 05 Sep 2024 00:40:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm0YH-00000006VhK-1yWN
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 00:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8F3AEA405F8;
	Thu,  5 Sep 2024 00:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DEAFC4CEC2;
	Thu,  5 Sep 2024 00:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725496842;
	bh=FVysMeyY5spx1TFwKXCAd+YRLTELmrOLQ+sRwiAEW5I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dxHAodEkLxtE5mwo6bG9hiGDxi9mrqwXbmBCI+QmYLmPlNASWYzAD7mX5Qzam7c01
	 pNJ8dFSjrq8i1hAuDgXvPvqTbWBNY1lWr5F7DtfwAnBhavtgIeUdnVUwGOA4sDKSbc
	 UbPj1j617IbaHO9txHBrEhMr0G0AVsxHt2Uus5iTAqWAvTuhGOkVamKtI2LyaYqTis
	 47cIHg+7oTB2VCmIEGg5Bq1fvcMV5mKbiEPcXz1t60JN38GpaiuMoA+RpmDWVg1ywP
	 5ohLHA0bVU6/zytbiFRBVgnRZz+nSgurBucux68+jnzGNjouZv2ej3FzqHDrIkDs64
	 bGHpF/ZjU37wg==
Message-ID: <e60cf1e7-3fb8-45c7-9876-0945e3fda9cc@kernel.org>
Date: Thu, 5 Sep 2024 09:40:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: k210: Make (p)clk local to k210_fpioa_probe()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org
References: <77f543046d4d5c19206f829ddcf8e093d3e3f6da.1725440917.git.geert+renesas@glider.be>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <77f543046d4d5c19206f829ddcf8e093d3e3f6da.1725440917.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_174045_681327_ACAE4CD4 
X-CRM114-Status: UNSURE (   4.50  )
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

On 2024/09/04 18:08, Geert Uytterhoeven wrote:
> There were never any users of k210_fpioa_data.clk and
> k210_fpioa_data.pclk outside k210_fpioa_probe().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
