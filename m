Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE81C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 05:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJc30QcUTajWHNsQGpoC5xbzlu4SUj6f6gG/WkorfVI=; b=iDjKAnVlzr56F8
	BlFL8AbMRirYDgYqbaJyA8Z0xJkl1ZmYVg3nx8MDy4T01y8Bg3ZwvJU3UPyueLygYdGvxl5Z29pTJ
	8fQ1j3KypyaCTdbKc5lbiH8rc0QMdD2haANH6pSBMKI3JOGfjTBqXLaQizUXlVtyo7aQ6+6T7kiy0
	lNuVX/Z87xNZ9dBSx2jolxKHif6tc6l8sLjvg68sLtmXknxoRuHeryg8v7DY6A+Zx+99kdlv+A1mA
	v+mZOClrbHoiXFQOMj10rMXBSoEOOfDzJnANgzmHWQ6ML71vtExKCwkn25BMTFWWybDin7OaK8aIy
	W/J2tetQVIEvdGRDErwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1KLD-008vu2-0j;
	Tue, 23 May 2023 05:13:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1KLA-008vtT-1o;
	Tue, 23 May 2023 05:13:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF505623D7;
	Tue, 23 May 2023 05:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA81C433D2;
	Tue, 23 May 2023 05:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684818823;
	bh=6D94mun2nq2a6rgrNgAG6eqYFY3YSRvDHEm/wXa3MEs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=hFXtEdFF5WW1naH8T8Llt7FJKEzdSx2pyK7L4jToO6OTUEWX/FMm5eb98A7uwuVnV
	 aFhJHCSM6nKoOTPR+9u6WZZdpaiXerBdz4L1xQEqilyLJZEs+sd0d00LFUzWNaSx+U
	 M9sJOS3FvHGhF9fWKhySPrKZoGOV8ciVHJxaLROyPoAHvgX3ObhCN3/VD+9h61d0a+
	 UzkVEh5naVWmrlzuulKQG3/o81iBmyE2SbmURIFbzutF7OBhkA45JFJoNe9yjwIfYo
	 ViNVUrZ3412DegsiO/QGI14Ig/auT8fmYKIIwm6jRT9Jo59EB/gxzR5YQfOQ9UKVGV
	 0+ggE3x3HWsbg==
Date: Tue, 23 May 2023 06:13:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Conor Dooley <conor.dooley@microchip.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/3] Add JH7110 MIPI DPHY RX support
User-Agent: K-9 Mail for Android
In-Reply-To: <7d4c3c08-6590-5947-92c6-1425c0cb662d@starfivetech.com>
References: <20230412084540.295411-1-changhuang.liang@starfivetech.com> <93d39956-25c9-971b-e73b-09c69e803341@starfivetech.com> <20230522-extradite-nastily-c2a88cfd2f02@wendy> <7d4c3c08-6590-5947-92c6-1425c0cb662d@starfivetech.com>
Message-ID: <039744BB-E0C2-4311-A663-DDDD819A219D@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_221344_646536_625A0D8D 
X-CRM114-Status: GOOD (  11.73  )
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



On 23 May 2023 02:02:24 IST, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:
>
>
>On 2023/5/22 21:11, Conor Dooley wrote:
>> On Mon, May 22, 2023 at 09:00:04PM +0800, Changhuang Liang wrote:
>>> On 2023/4/12 16:45, Changhuang Liang wrote:
>>>> This patchset adds mipi dphy rx driver for the StarFive JH7110 SoC.
>>>> It is used to transfer CSI camera data. The series has been tested on
>>>> the VisionFive 2 board.
>>>>
>> 
>>> Can you help to find the Vinod reviewed this patchset?
>> 
>> I am sorry, but I have no idea what you mean.
>> Are you asking if I can get Vinod to review the series?
>> 
>
>Yes, I need his comments.

No, I cannot. Maybe you should fix any outstanding comments and resubmit?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
