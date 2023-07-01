Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D92EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 21:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLA6dEDO0fjMa5Q7WmqZql/yWYn+9taIv6cgQ916J4A=; b=Mf3oVzRIXQclw0
	iubySLt3Xscq361bTKXgL4hvdHJD1mDRUMiFDuUiFM6ez6H6qxrRV/pcGZRRdM9mG+KDlt25kfh6j
	ZtPue0qJlTunTsKMDYIHs5EYUUYT1AJrVW7v4sBBuHm49Q+b7jOlbAMVehglNu+tY0XxCJ/FFNoGq
	LYtFR4ZSVePjv1JKzCcSKilQSKtMmq9B2Ky+OaDRfwKjoVevgyzO2JFaIJz2yBbtc0qyvAXSLq0B7
	cpCvO6HdEYTWXcdfaF69th9WB23PH8g3AMqfKWdB4E+z0og6BpnYJsg2zxkiugfGeCYKcrQ3oO+TT
	CusAdYDT8CLj+N+/8KMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFibC-006gz6-35;
	Sat, 01 Jul 2023 21:57:46 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFib9-006gyB-1T
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 21:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=ESQh2Q+J0+KOjCLAOqWvKR9Wn07hny/kQnYrkVfd2nY=; b=mAwVwZr09EuuZKp7Y+ECNtX51Y
	oI3ITdXfeLoYBRrKusNNTP+RcyoFKTvFyEg8vaAKa6DQ4l8cENWzCoJhljV4y1CloXdDTyRXtjnZH
	J/SNNfOAYXZXfg1vQIQbQvfEIIStc3YA63+ysm+rMCw5qWtgEmP/l8BOP+RCAa5dLbSTOz3z8Gz1E
	B4rlSZ1QcYSpSSCVFOGS0Y/8Nc6jDHOy92CtMjZ36Q83AHZNT/tHIq3pLJR3tlQQFSleuH3G+f0aS
	Vh84GN/g9VrjftL4T+mipsknLVqp7N/JG/F/zUg5BK8Fu9dzLLCERPnHv77CyYQNuyIP2QMLaLdLP
	+ebmeOeg==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1qFib4-00F8qC-PV; Sat, 01 Jul 2023 23:57:38 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1qFib4-00FE57-0Y;
	Sat, 01 Jul 2023 23:57:38 +0200
Date: Sat, 1 Jul 2023 23:57:38 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Guo Samin <samin.guo@starfivetech.com>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: Re: [PATCH v6 0/8] Add Ethernet driver for StarFive JH7110 SoC
Message-ID: <ZKChUuUpCgh/jPSU@aurel32.net>
Mail-Followup-To: Guo Samin <samin.guo@starfivetech.com>,
	Jakub Kicinski <kuba@kernel.org>, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230313034645.5469-1-samin.guo@starfivetech.com>
 <20230313173330.797bf8e7@kernel.org>
 <51102144-1533-d2f7-5fde-e01160a6f49e@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51102144-1533-d2f7-5fde-e01160a6f49e@starfivetech.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_145743_667915_F2ED5FC2 
X-CRM114-Status: GOOD (  13.22  )
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

Hi,

On 2023-03-15 09:31, Guo Samin wrote:
> Re: [PATCH v6 0/8] Add Ethernet driver for StarFive JH7110 SoC
> From: Jakub Kicinski <kuba@kernel.org>
> to: Samin Guo <samin.guo@starfivetech.com>
> data: 2023/3/14
> 
> > On Mon, 13 Mar 2023 11:46:37 +0800 Samin Guo wrote:
> >> This series adds ethernet support for the StarFive JH7110 RISC-V SoC.
> >> The series includes MAC driver. The MAC version is dwmac-5.20 (from
> >> Synopsys DesignWare). For more information and support, you can visit
> >> RVspace wiki[1].
> > 
> > I'm guessing the first 6 patches need to go via networking and patches
> > 7 and 8 via riscv trees? Please repost those separately, otherwise
> > the series won't apply and relevant CIs can't run on it.
> 
> Hi Jakub,
> 
> 	Thanks a lot, I will repost those separately.

Unless I am mistaken, this patches haven't been reposted since them.
Could you please do that?

Thanks
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
