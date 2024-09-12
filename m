Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807FEEE57FD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 02:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxh6n4k5/zoNrM/dv/AqSyGN852bp0F3wJO/Q9RqJWc=; b=LVO6RMnRt0aGeM
	Bned7onewGa/zAzETj5Mh4RnJZeVoqjY2fuL2byVXsRJDse+fc0s9VViT9J3UxmlzBJuKnP5KSFIx
	Wpc+HwLZt5JCaBmdUYBhhDuRiWArfoxUJEM4hg3Sb+sp9Wuig6ifKqyUfImM6ISQZist3SGrSos8K
	1GFxkkRMcUMymnQvyDqO10tDJ/FMYyle5VOFmhnTjVj6VB6wnOi290cpclMoZcuMSDO+BUs98kV/P
	2WI3uDOKF48JobzXPaHA+96S+EnlzhFpB8ofBfGG2aCDdaDXe0WtwkZyqUlx9tG34geLqhofVNYbn
	ahmNdAuzqnLYp0iHcivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soZjW-0000000BdFP-18dl;
	Thu, 12 Sep 2024 02:38:58 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soZjS-0000000BdBS-1cuy
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 02:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726108707;
	bh=+pRg9X4n7TVLk4pJltxMi594tN+w+P/Lvm16g3XG4LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=peKqk4cs180aavfC0fJb7+ZJgM1PWeO+aiWSCJfMw5udiEZdCCvzeedCofaGHqh/7
	 0AquK90DkBPQZvkGJxx4bkGK/iYwErDqEE98uOHeHynQMHmi7JNs8fBeEeJfPAD0Tc
	 rFbxqXgwKYsrpS2YUuSs3JavAXmzdRlR3SI8FI9E=
X-QQ-mid: bizesmtp90t1726108703t4wrs7qk
X-QQ-Originating-IP: WA3jwlK+hZurhA4Tg3wzuZx/vI63xq+b6Mf+xnbk/es=
Received: from [10.20.53.89] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Sep 2024 10:38:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15563347605386470238
Message-ID: <DBEFAD22C49AAFC6+58debc20-5281-4ae7-a418-a4b232be9458@uniontech.com>
Date: Thu, 12 Sep 2024 10:38:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 1/4] riscv: dts: starfive: add assigned-clock* to
 limit frquency
To: Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org, gregkh@linuxfoundation.org, sashal@kernel.org,
 william.qiu@starfivetech.com, emil.renner.berthing@canonical.com,
 xingyu.wu@starfivetech.com, walker.chen@starfivetech.com, robh@kernel.org,
 hal.feng@starfivetech.com, kernel@esmil.dk, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, richardcochran@gmail.com,
 netdev@vger.kernel.org
References: <D200DC520B462771+20240909074645.1161554-1-wangyuli@uniontech.com>
 <20240909-fidgeting-baggage-e9ef9fab9ca4@wendy>
 <ac72665f-0138-4951-aa90-d1defebac9ca@linaro.org>
 <20240909-wrath-sway-0fe29ff06a22@wendy>
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <20240909-wrath-sway-0fe29ff06a22@wendy>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_193854_903846_EDFABCF0 
X-CRM114-Status: GOOD (  11.94  )
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


On 2024/9/9 19:17, Conor Dooley wrote:
> [6.6] in the subject and Sasha/Greg/stable list on CC, so I figure it is
> for stable, yeah. Only one of these patches is a "fix", and not really a
> functional one, so I would like to know why this stuff is being
> backported. I think under some definition of "new device IDs and quirks"
> it could be suitable, but it'd be a looser definition than I personally
> agree with!
These submissions will help to ensure a more stable behavior for the 
RISC-V devices involved on the Linux-6.6.y kernel,and as far as I can 
tell,they won't introduce any new issues (please correct me if I'm wrong).
> Oh, and also, the 4 patches aren't threaded - you should fix that

I apologize for my ignorance about the correct procedure...

For instance,for these four commits,I first used 'git format-patch -4' 
to create four consecutive .patch files,and then used 'git send-email 
--annotate --cover-letter --thread ./*.patch' to send them,but the 
result wasn't as expected...

I'm not sure where the problem lies...

> WangYuli.
QAQ
-- 
WangYuli

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
