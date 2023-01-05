Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5043C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 18:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AzY9IoHYBPpYrIgaEN2QtFkqKtHgYp5t+bqaZGwVOEM=; b=U5mD3ZINJ+TmDD
	z5U7hXVrj2DnkX299tJpdtA7hxRfjudbQSA0RDqHTKGl/lvP1J4xHj4WV43hnKt/6izAtqzsKUFAx
	+dplJL6HNF+9+VhyiAisehmCv2ryy0+SL1fvtVpyD8HOkWE9/xWz9BBIupF2XrS/Zgg/Rne65hf8j
	JVBd7iCKOtW3etoXY+tdLdTpm8Q0AyNGrbFodM3ql/aOfh3VR+Gnj17RjVFfosEJpsSl0axl6weIO
	VRLrDqfYwjGFKH203HabW6+RS66iXH26KorUEwJBmrjgf9DyZLeMPxdjtC5C4s5DA84POYN9Ced2o
	+utSuvbG0S32pXO0A/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVCl-00Dlpr-Fr; Thu, 05 Jan 2023 18:43:07 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDFUI-00GCHw-9d
	for linux-riscv@lists.infradead.org; Thu, 05 Jan 2023 01:56:11 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4F55424E1AB;
	Thu,  5 Jan 2023 09:55:53 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 5 Jan
 2023 09:55:53 +0800
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 5 Jan
 2023 09:55:52 +0800
Received: from EXMBX161.cuchost.com ([fe80::f152:b9a3:2243:db3c]) by
 EXMBX161.cuchost.com ([fe80::f152:b9a3:2243:db3c%15]) with mapi id
 15.00.1497.044; Thu, 5 Jan 2023 09:55:52 +0800
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
Subject: RE: [PATCH v1 2/2] dt-bindings: riscv: add a capacity-dmips-mhz cpu
 property
Thread-Topic: [PATCH v1 2/2] dt-bindings: riscv: add a capacity-dmips-mhz cpu
 property
Thread-Index: AQHZIGc9BMS8YNU6e0GmWB/Wrj6HBK6PEFog
Date: Thu, 5 Jan 2023 01:55:52 +0000
Message-ID: <e2241591f14e4e0aa92d33b2f8d78f75@EXMBX161.cuchost.com>
References: <20230104180513.1379453-1-conor@kernel.org>
 <20230104180513.1379453-3-conor@kernel.org>
In-Reply-To: <20230104180513.1379453-3-conor@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_175610_652935_AD67EEF4 
X-CRM114-Status: GOOD (  13.47  )
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



> -----Original Message-----
> 
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Since commit 03f11f03dbfe ("RISC-V: Parse cpu topology during boot.") RISC-
> V has used the generic arch topology code, which provides for disparate CPU
> capacities. We never defined a binding to acquire this information from the
> DT though, so document the one already used by the generic arch topology
> code: "capacity-dmips-mhz".
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml
> b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index c6720764e765..2480c2460759 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -114,6 +114,12 @@ properties:
>        List of phandles to idle state nodes supported
>        by this hart (see ./idle-states.yaml).
> 
> +  capacity-dmips-mhz:
> +    description:
> +      u32 value representing CPU capacity (see ../cpu/cpu-capacity.txt) in
> +      DMIPS/MHz, relative to highest capacity-dmips-mhz
> +      in the system.
> +
>  required:
>    - riscv,isa
>    - interrupt-controller
> --
> 2.39.0

Thanks Conor.

Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Regards
Ley Foon


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
