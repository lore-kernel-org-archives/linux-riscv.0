Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871FBC6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 03:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2s7m/O3Dmnqo/zUOjNhMaDdgaNCPlkMsHGb7aWsey0=; b=XNStGB9l5Yxnlk
	IwVnrH0SJr6yB76KBUZdPn26DvFgU7JRdoUeqC00MHds1hrRXsmN5xvnhhmQt70M3pAMo+WJtK9xO
	I3LLWXIwLlhlp+fPY5vs2EGMvpnOZD6XWbuIE9CY41N9RTlTjdBkApyp2pSNtny6DXwAwECs7Qzi8
	2933DdC2RRIzWh6swh9cINoKw2MSvQjpvR+kad8T+yoWskp0IfmoSebJjdfyGNWi65bMQ0CiKS0La
	GivcbKeo7pibX2t2cWFJ1dYi6FwiXdPuEURxklEcz20dB83PeIoKHRXKiw5eHRbE+oQg2GYFVGiBt
	2WnPc24h0lHhhfNgtF2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcI49-00CBln-0V;
	Wed, 15 Mar 2023 03:44:41 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcI45-00CBjd-0I
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 03:44:39 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2F8E924E1A6;
	Wed, 15 Mar 2023 11:44:04 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Mar
 2023 11:44:04 +0800
Received: from [192.168.125.128] (113.72.145.194) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Mar
 2023 11:44:03 +0800
Message-ID: <729b1b69-aba6-4623-cf78-b08562d30d76@starfivetech.com>
Date: Wed, 15 Mar 2023 11:44:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/11] Add new partial clock and reset drivers for
 StarFive JH7110
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230314124404.117592-1-xingyu.wu@starfivetech.com>
 <de14f63beb2b3e424ec2375187c8087f.sboyd@kernel.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <de14f63beb2b3e424ec2375187c8087f.sboyd@kernel.org>
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_204437_428385_D134553D 
X-CRM114-Status: GOOD (  10.00  )
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

On 2023/3/15 8:30, Stephen Boyd wrote:
> Quoting Xingyu Wu (2023-03-14 05:43:53)
>> This patch serises are to add new partial clock drivers and reset
>> supports about System-Top-Group(STG), Image-Signal-Process(ISP)
>> and Video-Output(VOUT) for the StarFive JH7110 RISC-V SoC.
> 
> What is your merge plan for this series? Did you intend for clk tree to
> take the majority of patches? We won't take the dts changes through the
> clk tree.
> 
> I think Philipp Zabel reviewed some earlier version of the patches and
> provided reviewed-by tags. Can you check if they can be added here? If
> so, please resend again, or get those merged through the reset tree.

These patches add new clock & reset providers based on the basic clock & reset
of the minimal system which Hal.feng had submitted[1], which are used in USB, DMA,
VIN and Display modules that are merging.
[1]: https://lore.kernel.org/all/20230311090733.56918-1-hal.feng@starfivetech.com/

Oh I checked and had not received any comments from Philipp Zabel in earlier version
of these patches. Maybe it was confused with the patches of the minimal system.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
