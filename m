Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1AFC3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 18:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8EJR5rkN0pcINiEcwzoTWZXd4qtFVH/YBvsDd6HwDL0=; b=G6DXfRcy7M16X2
	kZRZS5v9EkkCtlMyBpleqfjFla3nOkWdMU7H7vr7EPnLvk1gr2iQCVylN1gbaSN8sd9NF1b/bIE9q
	BfJc8/6EPaiivsQhUrPIvcRdKRwKlA9/UFaAbpDiou3scHnLnFcz5FZlE7IJEU8LOcFQlP+Ht92gj
	GLvFtFBRHlO2jUb59JYOwCp1moZ9hw1NmWUyMc/4Ixdwhj41L4noitXePqHil9NRo+sAOiIjQZEXI
	bLeHE2qVu7uoYTByx/TX+GINszjQWc4cIvxFApsLQjOJlUymZ1jH/CE0mOfSz7H4s0SHF23HnQmzF
	jp6cFlBnUkEqnvSO00BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVCh-00Dlm8-BG; Thu, 05 Jan 2023 18:43:03 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDFSX-00GA2r-Nw
	for linux-riscv@lists.infradead.org; Thu, 05 Jan 2023 01:54:24 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id EFC9424E0DF;
	Thu,  5 Jan 2023 09:53:53 +0800 (CST)
Received: from EXMBX163.cuchost.com (172.16.7.73) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 5 Jan
 2023 09:53:53 +0800
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX163.cuchost.com
 (172.16.6.73) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 5 Jan
 2023 09:53:53 +0800
Received: from EXMBX161.cuchost.com ([fe80::f152:b9a3:2243:db3c]) by
 EXMBX161.cuchost.com ([fe80::f152:b9a3:2243:db3c%15]) with mapi id
 15.00.1497.044; Thu, 5 Jan 2023 09:53:52 +0800
From: Leyfoon Tan <leyfoon.tan@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet <corbet@lwn.net>, "Alex
 Shi" <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v1 1/2] dt-bindings: arm: move cpu-capacity to a shared
 loation
Thread-Topic: [PATCH v1 1/2] dt-bindings: arm: move cpu-capacity to a shared
 loation
Thread-Index: AQHZIGczv+ER1RubV0i+ee2HiF67i66PDikg
Date: Thu, 5 Jan 2023 01:53:52 +0000
Message-ID: <9350bdbcd0604507812a52e705fc3f77@EXMBX161.cuchost.com>
References: <20230104180513.1379453-1-conor@kernel.org>
 <20230104180513.1379453-2-conor@kernel.org>
In-Reply-To: <20230104180513.1379453-2-conor@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_175422_703102_9B55E502 
X-CRM114-Status: UNSURE (   9.91  )
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



> 
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> RISC-V uses the same generic topology code as arm64 & while there
> currently exists no binding for cpu-capacity on RISC-V, the code paths can be
> hit if the property is present.
> 
> Move the documentation of cpu-capacity to a shared location, ahead of
> defining a binding for capacity-dmips-mhz on RISC-V. Update some
> references to this document in the process.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Hi Conor

I plan to move cpu-capacity.txt binding to generic directory as well after [1]. Thanks for your patch series helping this.


[1] https://patchwork.kernel.org/project/linux-riscv/patch/20230103035316.3841303-1-leyfoon.tan@starfivetech.com/


Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Regards
Ley Foon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
