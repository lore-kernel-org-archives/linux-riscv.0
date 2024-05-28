Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B7EC25B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcUvBS6x754herbzdk50rf9NwBUUYmKHd9GwkwH7Fjc=; b=PcCYbGNJUYfpegr4F4KDci/b5y
	NoB1XDY4UDk8MN/3hxEy3LwPMrOz69PW+Vpe2lY6aGYCQyEWtAU/FejoconwQev5rae316BTLGEny
	q5RA8ZcbeY1QDbjgbvlYMUV0yPnt6SUG4hxndovzpOMaZj9Yw6+xXiNe2KSh5xU6gGe8BiljJ2gVR
	7DAEHKBmZv6CsWGSy2OLTPq6lhH7BviwXY8nm5SqcXVrzYdjuEoYrjkkxZHZ/189xpbcHNHJwyQrL
	ZqaBuN0PYfbPNVbIHRo94DCfJKhB0zKH8Z9O5D6YZkAMwQ3jim/Sgs4Bsj8B/fjxufnH4ia0shOGM
	GFtzweuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBuuL-00000000LBB-01kE;
	Tue, 28 May 2024 11:22:21 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBuuG-00000000L8d-48ms
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 11:22:19 +0000
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
	by cmsmtp with ESMTPS
	id Brlys20odrtmgBuu4s30g4; Tue, 28 May 2024 11:22:04 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id Buu2suxbsiKqRBuu2sg1uW; Tue, 28 May 2024 11:22:02 +0000
X-Authority-Analysis: v=2.4 cv=I9quR8gg c=1 sm=1 tr=0 ts=6655be5a
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=TpHVaj0NuXgA:10 a=-Ou01B_BuAIA:10 a=VwQbUJbxAAAA:8
 a=_jlGtV7tAAAA:8 a=PHq6YzTAAAAA:8 a=HaFmDPmJAAAA:8 a=HUZBgE9acwSnwOzeVl8A:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=nlm17XC03S6CtCLSeiRr:22
 a=ZKzU8r6zoKMcqsNulkmm:22 a=nmWuMzfKamIsx3l42hEX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hw6FK+OS+RQG3VzJoQxH+zcl7pjy/9p2BHbiD1a6ayA=; b=Qm8HQ2lM9suyzWh9uYKVG9BMGy
	CyiD3PoFh/66CXhFbxY4RD//aYD6j3QstwcuUFJ0dFQVBNPy47D0eDt7My2tu8p5nR1nfBPfFh1y9
	woyFsBrY1vweaSLBgW3i9pwjtwuSPcXD1VMnNrmmSeuzxC8HDtPMVuY3kGxz0ntFdozcw/vAYKgpT
	uIxsre7QWqsuawjcfOjp0BlFGbP1qv4g9bp6kQvHwc9Khz2R+Lme+WWm+FvdtS3fVEANSHu8j9hc6
	2aE9WNK9Dex9cWKPcukdpohRD46Z61VQQZIUoVCQt6wAdrwDRoeylOaHSA9jJaTvkbZP60PG9ONl9
	VyLld57w==;
Received: from c-98-207-139-8.hsd1.ca.comcast.net ([98.207.139.8]:40542 helo=[10.0.1.47])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <re@w6rz.net>)
	id 1sBuu1-002oBt-0z;
	Tue, 28 May 2024 05:22:01 -0600
Subject: Re: [PATCH] clk: clkdev: don't fail clkdev_alloc() if over-sized
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>,
 Guenter Roeck <linux@roeck-us.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>,
 Yang Li <yang.lee@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 regressions@lists.linux.dev
References: <28114882-f8d7-21bf-4536-a186e8d7a22a@w6rz.net>
 <E1sBrzn-00E8GK-Ue@rmk-PC.armlinux.org.uk>
From: Ron Economos <re@w6rz.net>
Message-ID: <37dae7f1-d11c-2793-796b-822cbc3d7a31@w6rz.net>
Date: Tue, 28 May 2024 04:21:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux armv7l; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <E1sBrzn-00E8GK-Ue@rmk-PC.armlinux.org.uk>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 98.207.139.8
X-Source-L: No
X-Exim-ID: 1sBuu1-002oBt-0z
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-98-207-139-8.hsd1.ca.comcast.net ([10.0.1.47]) [98.207.139.8]:40542
X-Source-Auth: re@w6rz.net
X-Email-Count: 14
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNqthTjw4yCm3C773mOHh3dJo8JzFjGFJnsnzEuS3H0EGYiD5aHaUYESI8/a4KorPEHISIsDPBKYnBdMEIZu2HNXVkrpldiW7XQss2TF4ckRhHHNN/cC
 wZvwkjn+7I6tTLqIVA4Rl4dmnMEY858vMTaH9nqfAHwKPwLuWXgBApTqsXF8v+lwTQqzewGX1SqraWm+AO19I3B5xmEoSJOA26o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_042217_139009_72516CE8 
X-CRM114-Status: GOOD (  19.35  )
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

On 5/28/24 1:15 AM, Russell King (Oracle) wrote:
> Don't fail clkdev_alloc() if the strings are over-sized. In this case,
> the entry will not match during lookup, so its useless. However, since
> code fails if we return NULL leading to boot failure, return a dummy
> entry with the connection and device IDs set to "bad".
>
> Leave the warning so these problems can be found, and the useless
> wasteful clkdev registrations removed.
>
> Fixes: 8d532528ff6a ("clkdev: report over-sized strings when creating clkdev entries")
> Closes: https://lore.kernel.org/linux-clk/7eda7621-0dde-4153-89e4-172e4c095d01@roeck-us.net.
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>
> Please try this patch, which should allow the platform to boot, bit will
> intentionally issue lots of warnings. There is a separate patch posted
> recently that removes the useless registration with clkdev.
>
>   drivers/clk/clkdev.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
> index 6a77d7e201a9..2f83fb97c6fb 100644
> --- a/drivers/clk/clkdev.c
> +++ b/drivers/clk/clkdev.c
> @@ -204,8 +204,15 @@ vclkdev_alloc(struct clk_hw *hw, const char *con_id, const char *dev_fmt,
>   	pr_err("%pV:%s: %s ID is greater than %zu\n",
>   	       &vaf, con_id, failure, max_size);
>   	va_end(ap_copy);
> -	kfree(cla);
> -	return NULL;
> +
> +	/*
> +	 * Don't fail in this case, but as the entry won't ever match just
> +	 * fill it with something that also won't match.
> +	 */
> +	strscpy(cla->con_id, "bad", sizeof(cla->con_id));
> +	strscpy(cla->dev_id, "bad", sizeof(cla->dev_id));
> +
> +	return &cla->cl;
>   }
>   
>   static struct clk_lookup *

Works good. Here's what it looks like on HiFive Unmatched.

[0.389138] riscv-plic c000000.interrupt-controller: mapped 69 interrupts 
with 4 handlers for 9 contexts.
[0.390710] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[0.392743] 10000000.clock-controller:corepll: device ID is greater than 24
[0.392792] 10000000.clock-controller:ddrpll: device ID is greater than 24
[0.392820] 10000000.clock-controller:gemgxlpll: device ID is greater 
than 24
[0.392847] 10000000.clock-controller:dvfscorepll: device ID is greater 
than 24
[0.392876] 10000000.clock-controller:hfpclkpll: device ID is greater 
than 24
[0.392903] 10000000.clock-controller:cltxpll: device ID is greater than 24
[0.392929] 10000000.clock-controller:tlclk: device ID is greater than 24
[0.392955] 10000000.clock-controller:pclk: device ID is greater than 24
[0.392981] 10000000.clock-controller:pcie_aux: device ID is greater than 24
[0.394620] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[0.413222] SuperH (H)SCI(F) driver initialized

Tested-by: Ron Economos <re@w6rz.net>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
