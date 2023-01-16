Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE33FC54EBE
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 10:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTAnleexo4MFh4bFnAGE7lQYX92+ixjIoAGpHVjNf8o=; b=QUF9zEJO/fkqHn
	e2y9151x0Y1Ti9ZQo4eQ5272PdCWsUyMQVFf7bnRWW4YvlON9152Y4Q4SDgEr85LmnYHkPPv8htbw
	YjONLo4jH6LKYcg3YQA0RfhtA7Uolp0FQoJSoyJjYneIwpg+4curttnQTZFwjLedJctOprtuXQj9+
	LiGCUnty1WPs81cm/+f5fJtXDXicS43F89PAz/m+U+s4SbZbJa9Nyij9LSfuvO99Wij5/GJPODNAq
	z+alWnNm90cEdiKPzWQTnyktjJEl+TxrKy62hphpixTiFtcrgNW0m/9ztD9tnVUELccJz8WAV8Xtp
	ngT8tKdGE15L77uMOBtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHMVE-009apd-Nx; Mon, 16 Jan 2023 10:14:08 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHMVA-009am6-GO
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 10:14:07 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 51ECD24E02F;
	Mon, 16 Jan 2023 18:13:24 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 16 Jan
 2023 18:13:24 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 16 Jan
 2023 18:13:23 +0800
Message-ID: <899cbd21-1ac9-682e-7d07-f8a3c49d4504@starfivetech.com>
Date: Mon, 16 Jan 2023 18:13:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: Add mmc node
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	<linux-kernel@vger.kernel.org>
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-4-william.qiu@starfivetech.com>
 <CACRpkdbjaiDhPcVH115w25oxseWrz=Yb-ugkmCOiqhRDmDZj5A@mail.gmail.com>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <CACRpkdbjaiDhPcVH115w25oxseWrz=Yb-ugkmCOiqhRDmDZj5A@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_021404_761542_61541ADA 
X-CRM114-Status: GOOD (  11.30  )
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



On 2022/12/9 5:15, Linus Walleij wrote:
> Hi William,
> 
> thanks for your patch!
> 
> On Wed, Dec 7, 2022 at 2:17 PM William Qiu <william.qiu@starfivetech.com> wrote:
> 
>> +                       starfive,sys-syscon = <&sys_syscon 0x14 0x1a 0x7c000000>;
> (...)
>> +                       starfive,sys-syscon = <&sys_syscon 0x9c 0x1 0x3e>;
> 
> These are registster offsets and shifts. Don't define such stuff in your device
> tree, use #defines in the code and just provide the phandle.
> 
Hi Linus,

I'm sorry to bother you, but as for the definition of syscon, after discussing with 
my colleagues, we think it is easier to distinguish SDIO0 and SDIO1 by defining it in
the device tree, and the code compatibility is better. I expected to discuss this issue
with you in V2,, but I am not sure whether you have seen V2, so I can only ask for
your advice in V1.

Best Regards
William Qiu
> Yours,
> Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
