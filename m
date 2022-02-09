Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05988C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 23:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdIxI1nloBWvnD4CX6AIAbWeU+kUE8PQ4m03OaC4Prw=; b=Mu15hq0RLXg98W
	IlgIUQrrRIe8yihYU7Osmlc7sJmC08Pq+6K01P94vXOd/iOH7DHx1Xn1CuHPyldCP8iLbhl/AVO8+
	sulS033ey12grPSRR0c7ITQC8vvEfxtlDZV/4+iJ5rEzdxNSyu6GZGRR9qjqe28LtNtQye4Tdbpf+
	U0qtx/HmxH8Dy+da6TVPtCIvjAV7xuYfGvfyxB4Wpk+4Dj/dLVzgYeTQpYf7KltzpKScbjiz+/LM4
	ACpDdXljUWFwgKWtNHqa9bZ4XLEsmH2mJfhfuztzHLzINFqGTMSx/SO/OUVOeamq7eyXCOAC35bxO
	CEGi36A+Su/DGpu2fKQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHwRg-0023KP-1P; Wed, 09 Feb 2022 23:32:20 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHwRd-0023JM-4X
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 23:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644449535; x=1675985535;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SCi2xcOs63Mel3nuQiDXDDze0xfHJgyKIw0uLAqxVp4=;
 b=IhMMlSUJKNbEP28Zou/svX8YxPMKU5ck+i0JkqtUbc+Uye3B1+tX81sE
 frzIbHb0mARzmRgNuQMI6JoaGatgFzaPdG2GbhRnqqAYkE0PM7RdM6058
 OCxup5UJn6KBRw/SZQiOvbxUVvMAso0Goy4yy9nqgHsG9e3kEN08nZg7e
 XI+vyf1MA0wrQ+q6YfjGzqCZ2eJ2uR3V80u56MVPgUvLx7/TfsIOdz4Az
 OMAj8aBSt8FrMRK5mLRxafkFjAHWNrJtYum6n+jX+JJPRAARpUXSdtOJm
 PunvZodcVp8m9kFFiDKbS8namgTMsooLbx+cO9zp0kMFLYiF3cYdNH+T7 A==;
X-IronPort-AV: E=Sophos;i="5.88,357,1635177600"; d="scan'208";a="192545047"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2022 07:32:13 +0800
IronPort-SDR: Bw+roP+/EJpUc5HCd/ZAHBeGwKg+4m8oLdtrdAwB5vjEKsvfXXBLsalqlkPbeV8aJZba9yZADv
 nCscByFAHYRYMCWCGyGIDAy8n6zD/E9CcpoSVRtg5W6wy//bvSVfagEpTNhFYb9MNz6EyeAchS
 gOIylIMSAFrCcEQhgvt6YYqus8aSatJyIEDjTypF79uXegCihC9tBILpi3KUys+434r7u/ZpVY
 sh8eNqmRMrNHp7idcXyuNsh4ZihY2n/l6QlgARIVtA5EVrdwUUg5yCcqhZy6Xrg+egDd/1zdWV
 y9+2BU9AI5pDX96Kxmt5dI7h
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 15:04:02 -0800
IronPort-SDR: XLSy/DJmCUXNclrlTtwdbSWev3q17Yjjyd/eoFKZPxwraFOn/iq10p+INS8yhay5IekeRxrVLq
 5z6/1QDmdCyXfP7ZVY9hPvM1DKxrM2JFOUvVlZyl4bQyZmdkdeRxO9ag+NAgFLnmznsBHZSxGC
 ofTlvvfA11jIbw4nKSYWOKZOiOma1ZFEtIQjCJ0LZqFBbVFg4ndCsYKIq5GzK1c/t3It7rCmu9
 xOxD/wPy2a7qjE18xaJDaGs5g7SA2pA5Ml8r05zpqyH3g7lQ6N4Ui0AaaNczACbPRi0/zGtGts
 2d4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 15:32:15 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JvGPV0jxyz1SVp3
 for <linux-riscv@lists.infradead.org>; Wed,  9 Feb 2022 15:32:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1644449533; x=1647041534; bh=SCi2xcOs63Mel3nuQiDXDDze0xfHJgyKIw0
 uLAqxVp4=; b=ZRVIrmYj3XrTAJf0bnCsH4qtvNW0lUuFx/jJpWP8hLrqcOQmCjH
 CS3UrT8uPJ31QdHyUUwNLCHm7OOsAj1e34aBO71VmFXG2NcDvCBhyhFSyiG4fr/U
 L2FFphXB3QBK+lw2V84dy18E+QBE3SP2Yx2dO9XcD1KO4LztCZmKEEQItl6U8g/H
 WVkkyb/6lPH3M4mOB1fqrMeaKI5WtnpucaK4rARJudXqICvOtws0Z41hzi4zQHS8
 phkVH8bXie4WlQPTWBMTcJ31yPyIxksSNokHNWC98vJi1YLHjlRqrV8U1YvP+e9J
 btSV5NXYRLTD1QYQVM7bpYz1TYQkTYU6JGA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id AqSl9THOE86o for <linux-riscv@lists.infradead.org>;
 Wed,  9 Feb 2022 15:32:13 -0800 (PST)
Received: from [10.225.163.67] (unknown [10.225.163.67])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JvGPS2bf7z1Rwrw;
 Wed,  9 Feb 2022 15:32:12 -0800 (PST)
Message-ID: <2b574c51-5039-5145-b1b2-a139c27daa96@opensource.wdc.com>
Date: Thu, 10 Feb 2022 08:32:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] pinctrl: fix loop in k210_pinconf_get_drive()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Damien Le Moal <damien.lemoal@wdc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Sean Anderson <seanga2@gmail.com>, Palmer Dabbelt
 <palmerdabbelt@google.com>, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20220209180804.GA18385@kili>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220209180804.GA18385@kili>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_153217_222898_6F8F446A 
X-CRM114-Status: GOOD (  17.44  )
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

On 2/10/22 03:08, Dan Carpenter wrote:
> The loop exited too early so the k210_pinconf_drive_strength[0] array
> element was never used.
> 
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/pinctrl/pinctrl-k210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index 49e32684dbb2..e3d03f2de7ef 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -482,7 +482,7 @@ static int k210_pinconf_get_drive(unsigned int max_strength_ua)
>  {
>  	int i;
>  
> -	for (i = K210_PC_DRIVE_MAX; i; i--) {
> +	for (i = K210_PC_DRIVE_MAX; i >= 0; i--) {
>  		if (k210_pinconf_drive_strength[i] <= max_strength_ua)
>  			return i;
>  	}

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
