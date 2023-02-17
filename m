Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E23EC636CC
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 00:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScZhCNxw/V5mB9Ct7FxpG1lvDl70HBIXAFjb1pRsVjs=; b=doTYwLqT72qym7
	QLncU5hXmJmzAekC2bAhcmer7ok1gkLKlkPi4as2xfRZw1bMwTv4gObJnN7TIbK6kbv9BJ2DHtpnr
	IUzg+G3rlWKcxpo+LBnrFo7X3Kkn/kt0VFYfu4Wke/FW2VE4VvMTQNasBLAEV4WZkAUQ9Gy8ICXJH
	pizE2ysIp1kfw1opV5Xs9IFq2dJWhzd7iCZiYfZ4RT//Mfm/PzGnXdJFfiYwcdyNcqnPMO3PKnkJR
	yBgtQ3lcyvEiQaUs5wYnhVIJ9EJziPaXs1igzWSee6pjpj9/osJMR5//Md9Yb8QyccYmLe94JSGf5
	Tvl2AH9OnT/+U4obGjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSogR-00CDwQ-2p; Fri, 17 Feb 2023 00:33:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSogG-00CDtm-In; Fri, 17 Feb 2023 00:32:54 +0000
Received: from [192.168.1.90] (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2189766020BD;
	Fri, 17 Feb 2023 00:32:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676593969;
	bh=Pijk7J1JiCVDIPHd1Fu56Q59b7X2BTHU0d+zzfSw4ok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R2YHuHryIxI4sX2DHvXuf3KkHJD0wdjhm5wp/kDeuQ1BcrJNTcNmeQunFVnY4zdAs
	 uTQOGAl5b/d/h7z6f6tfbukkf5pEC+9omQGycaFq8ETbHgv9NFKIQaxQcDv3QEotNs
	 2U5oXYEiCqKvOl9eqGHT+AeXqkuKIJZHwEjpIvOB2Sa9HhzhgvFfPXT4RtlKegzlah
	 ZpcJWmvUYMyQxYyzZfdcZOUodk/yfGp5SwUOtDRVS3GQBvcxq01CQgBDOgWHPKhSkN
	 OAGvg9p1k+jg6j0+p6EWD1tkh3ghxG3KHv5Aq31mk5CpBrQ2PPIIyohNjZoTTEp114
	 2EKZugb5oSkmA==
Message-ID: <a824a7f6-0a62-7cab-180b-f20297311a2b@collabora.com>
Date: Fri, 17 Feb 2023 02:32:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 07/12] dt-bindings: net: Add StarFive JH7100 SoC
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
 <Y+e74UIV/Td91lKB@lunn.ch>
 <586971af-2d78-456d-a605-6c7b2aefda91@collabora.com>
 <Y+zXv90rGfQupjPP@lunn.ch>
 <cfa0f980-4bb6-4419-909c-3fce697cf8f9@collabora.com>
 <Y+5t4Jlb0ytw40pu@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <Y+5t4Jlb0ytw40pu@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_163252_863263_B08951EA 
X-CRM114-Status: GOOD (  13.07  )
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

On 2/16/23 19:54, Andrew Lunn wrote:
>> I gave "rgmii-id" a try and it's not usable, I get too many errors. So
>> "rgmii" should be the right choice here.
> 
> I would actually say it shows we don't understand what is going on
> with delays. "rgmii" is not every often the correct value. The fact it
> works suggests the MAC is adding delays.
> 
> What value are you using for starfive,gtxclk-dlychain ? 

This is set to '4' in patch 12/12.

> Try 0 and then "rgmii-id"

I made some more tests and it seems the only stable configuration is 
"rgmii" with "starfive,gtxclk-dlychain" set to 4:

phy-mode | dlychain | status
---------+----------+--------------------------------------------
rgmii    |        4 | OK (no issues observed)
rgmii-id |        4 | BROKEN (errors reported [1])
rgmii    |        0 | UNRELIABLE (no errors, but frequent stalls)
rgmii-id |        0 | BROKEN (errors reported)

[1] Reported errors in case of BROKEN status:
$ grep '' /sys/class/net/eth0/statistics/* | grep -v ':0$'

/sys/class/net/eth0/statistics/rx_crc_errors:6
/sys/class/net/eth0/statistics/rx_errors:6
/sys/class/net/eth0/statistics/tx_bytes:10836
/sys/class/net/eth0/statistics/tx_packets:46

> 	Andrew			
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
