Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A540FC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=STRSlhx7gqcGio3oEUBmdAywbwbdWRo+uOqf8clyueo=; b=B1M7ArUK+suEH2
	a4h6L5+oFZU/8MN/PsZzblpVOV7j/cwDq5HK5JTvu1AkWT4xcn0WUs3raux2UH6M8LDKl4m/5bDfj
	bx6PpmYapj01l4Oa2Xoxo4+ZVcHQctK7Verv78KCWzpT/P1EWJHSOddJ+KkfL1YgwZF/eZSw2mGoO
	Emq0L7gsJ49E2+iXYgAfIwHmkddVRbaEp4PheYuSoimCDeI+AbhQrTQ0WafFm5W4b01t+OhD21uDE
	NW2gPDYm1WxdQv1vT+x8XUlhwA3d0i5sWIiCaQklHM2sTSaWwd8WD1UK5/sAQ+PjGDqBuipx7czBH
	M8OI3rCDzKOQqwoRgurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3bbB-0078ra-7A; Fri, 09 Dec 2022 11:31:25 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3bb7-0078px-Q0
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 11:31:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1E28F24E234;
	Fri,  9 Dec 2022 19:31:09 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 9 Dec
 2022 19:31:09 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 9 Dec
 2022 19:31:08 +0800
Message-ID: <8c40646b-3422-c2f5-49c3-60a2beefbcff@starfivetech.com>
Date: Fri, 9 Dec 2022 19:31:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
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
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_033122_018953_25F11AA1 
X-CRM114-Status: UNSURE (   9.66  )
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

I will use #define in code instead in device tree.
Thank you for taking time to review and provide helpful comments for this patch.

Best Regards,
William Qiu
> Yours,
> Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
