Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBB7C67871
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 02:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhIDBJKP3+hTVovJc295l3TuuLyTg+HaZQl4frNcec0=; b=4mAL0cC4sRK9uO
	J2m3nN3j3pc6zH1zbh7EEPMJmtaUrfviYjnJwXc4ey//VYXZyh0UUVos72rPXCH6pWiUarexhUYcK
	lH7CncxbOR0vJUFu3gxbgONuZPVjm8rbLJNM7h+Bhdwr5v8MWRE/ceqJLeIJ4s/8PDte68+P5fBR2
	Ur52Qc7sFrJNFveMErRYqZF684MsEI9xWEYsNEc3zJQSh2C4oAbDJXnA4zsSF7ZP7Y36qYbgCfjPG
	5/IYaioiYizh8iaaWNayXyMQQmDZJla2St1d8TQNv+2tFgWuXay9HS77Rotos+2T2ITHC5GIwgj72
	HeaAJwA5ENtnCB+U9Jeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHbs5-00Cew7-Gu; Tue, 17 Jan 2023 02:38:45 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHbs2-00Cesg-6w
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 02:38:44 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id DDA9324E25B;
	Tue, 17 Jan 2023 10:38:12 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 17 Jan
 2023 10:38:13 +0800
Received: from [192.168.125.72] (113.72.144.207) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 17 Jan
 2023 10:38:12 +0800
Message-ID: <7e641f5e-2d06-43c4-7c9b-9449ef567612@starfivetech.com>
Date: Tue, 17 Jan 2023 10:38:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 0/5] Basic pinctrl support for StarFive JH7110 RISC-V
 SoC
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, <linux-kernel@vger.kernel.org>
References: <20221220005529.34744-1-hal.feng@starfivetech.com>
 <Y8BfvQCFNz9KNrDY@spud>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y8BfvQCFNz9KNrDY@spud>
X-Originating-IP: [113.72.144.207]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_183842_450328_D8343872 
X-CRM114-Status: GOOD (  10.94  )
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

On Thu, 12 Jan 2023 19:30:05 +0000, Conor Dooley wrote:
> Hey Hal Feng,
> 
> On Tue, Dec 20, 2022 at 08:55:24AM +0800, Hal Feng wrote:
> > This patch series adds basic pinctrl support for StarFive JH7110 SoC.
> > You can simply get or review the patches at the link [1].
> 
> > [1]: https://github.com/hal-feng/linux/commits/visionfive2-minimal
> 
> Do you intend submitting a new version of the patchset to address the
> comments about the bindings, or are you waiting for comments on the
> code?

Sorry for the late reply. If no other comments, I will fix the current
known issues and submit a new version. Actually, I am busy with some
other things recently, and I will reply the comments as soon as possible.
Thanks.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
