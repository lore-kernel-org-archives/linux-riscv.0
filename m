Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DCCC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 22:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jfm2DeaLZWv+8klZXflAyYmq/0Y2QZ6iRzgObCTblc=; b=SSNed6F6lOQySe
	8MJ4jBq+YndZdDRqHG/djCXXnm1qdAokX/Xely8GFLTffU8B5FDIs4D58wOqHLeKe0XyB91TDP4cz
	f7abPMcvn0s2e46W9Jby7URXkMsIuaVNIxbtKbgY+Vuah5J9G6JQYS/cAdZ1uqyepM7T3b/9kGFtv
	PSWK+S065iOQfrS139xoMdF02yo5iv5BqDl42+5VwktPHbY+fmIwg/ZfLbf7U7bfxkkSX1Q2OzB8C
	n10DbKihQZaXHdtlugU69yiv2rlmp0Bhl7s8bxxVu0GRYnl3/iWvLsnKapMcY8I7BHWrIENTYBcy8
	7U5o6Fccu7LjBTsI8WFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxETM-002CSS-0O;
	Sun, 29 Oct 2023 22:41:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxETI-002CRt-2G;
	Sun, 29 Oct 2023 22:41:29 +0000
Received: from [192.168.1.90] (unknown [188.24.143.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E600166072BB;
	Sun, 29 Oct 2023 22:41:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698619287;
	bh=0moYwqGPpKpcCgWCZCbmjb3SQL9UUK8AXxSzTD9M6EM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GAp2S5LeolDNT0oMnIU1XOERBBbWg8wPe66a2v7uBCjT0XEL2uOR/xK2jM76GBNkZ
	 g5e8MN3Pt/i8oENbgyJip/7sswIfxUCXn6Wf8pQPBuWG4ooO+Xwwg7SxnSXhjTR8Bj
	 7Gehm8n2sgo2owH/pQiU4GNiOwJ0NV02FY6al52pwfxMy2bvUEJLGYgGmmyh6YsYmn
	 6S7/LpukLMtkMX2I25Aq/nj4WJiDUYBxGEX9+rYfeu6ED1sW483Hfh/3UvoGp8rMu8
	 UagKsbwJ2EUikHgocGXGOchFcKp/R5ps4nE8Lm2T+ymGrnlu0EH04pHnvNsCiq15Tz
	 v/DIB0SxCyOKg==
Message-ID: <f05839c0-7a78-4616-bedc-6a876b7f4bb3@collabora.com>
Date: Mon, 30 Oct 2023 00:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] riscv: dts: starfive: visionfive-v1: Enable gmac
 and setup phy
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-12-cristian.ciocaltea@collabora.com>
 <f379a507-c3c1-4872-9e4f-f521b86f44d4@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <f379a507-c3c1-4872-9e4f-f521b86f44d4@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_154128_886185_85678CBC 
X-CRM114-Status: GOOD (  10.44  )
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

On 10/29/23 20:45, Andrew Lunn wrote:
> On Sun, Oct 29, 2023 at 06:27:11AM +0200, Cristian Ciocaltea wrote:
>> The StarFive VisionFive V1 SBC has a Motorcomm YT8521 PHY supporting
>> RGMII-ID, but requires manual adjustment of the RX internal delay to
>> work properly.
>>
>> The default RX delay provided by the driver is 1.95 ns, which proves to
>> be too high. Applying a 50% reduction seems to mitigate the issue.
> 
> I'm not so happy this cannot be explained. You are potentially heading
> into horrible backwards compatibility problems with old DT blobs and
> new kernels once this is explained and fixed.

It seems the visionfive-v2 board also required setting some delays, but
unfortunately no details were provided:

0104340a67b1 ("riscv: dts: starfive: visionfive 2: Add configuration of
mac and phy")

Thanks,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
