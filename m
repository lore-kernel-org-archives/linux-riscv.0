Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A482C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 08:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqcs7ytvJhE0hmqZPDP6MlGPgrCfJbDxGqWZBGR8XOM=; b=H1QwLEVQfRi41P
	uGQV+3q+WMfpaYH03lGeG0Ps8iBXD11EYP49LQFxf7bQgKM6PtvJO92YIAmxeZ6LO0qChMw1iNXMr
	/5Dt4dx/+uQwvo2CBQ6rrtCd+9jEoHvxUWHKrYzhxna61fsYV63IXyzaY8IAl+L5YTh9I9qgl/Kzu
	qg2zIYHKE6krMjyUjLcK6wXGhmEKmmOutdhW1KMgL4P7oFcWMCUqOl+oAvZYTdApIIkfSOIWY7FkO
	FCdJimBEDKp7NJalxpem30ao3dARWv/PYVntoFkeIvZusASIu7+qE3z0MTgegf+GAO7bpsHX/zGrz
	tl87GJFB9qrRKV5FqZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzDQ-007fPj-DX; Wed, 04 Jan 2023 08:33:40 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzC9-007f3e-34
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 08:32:25 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 9A467125C;
	Wed,  4 Jan 2023 09:32:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1672821133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CX2NGoUNf89QdEBh+WKylLZ5iHDV6P+xXO7uYU7z6A=;
	b=XaAGmCM3jt1/wQgfq4Z0ImuBrzqfwTYgEaukK/7+47wBQu6PuzODUHLNIK7JsRAwXVUEun
	aNyEl8a9Z7E5HQxPlNeo2yMu2xBUD34iuqnD6+r38HXxuLeG/bMCjp466sKTlMpxDQ1js3
	HMMM+BK4J5k6PJ+CZCsCppx61vsFpfyfr7j5dGSkDVhww0C3y8Uome4iW2W4Oss0TZMZpo
	qOVkhCwLJrPjB5vNRbVGBy5FgrBiax+eHWmOmUa/82KYd3NeJon9PeQgqMewjO+Z7qxP/u
	8Kq0HX8JZBiDjihmn12NUdppIv+9fVr2glSqWZW8HpLzayLI152BrhmkNUujLw==
From: Michael Walle <michael@walle.cc>
To: jszhang@kernel.org
Cc: aou@eecs.berkeley.edu,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	ilpo.jarvinen@linux.intel.com,
	jirislaby@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v2 6/9] riscv: dts: bouffalolab: add the bl808 SoC base device tree
Date: Wed,  4 Jan 2023 09:32:04 +0100
Message-Id: <20230104083204.1865526-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221127132448.4034-7-jszhang@kernel.org>
References: <20221127132448.4034-7-jszhang@kernel.org>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_003221_631883_C323F84C 
X-CRM114-Status: UNSURE (   8.65  )
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

Hi,

> +		uart0: serial@30002000 {

According to the reference manual of the bl808, this is uart3. Can we also
use that name here?

> +			compatible = "bouffalolab,bl808-uart";
> +			reg = <0x30002000 0x1000>;
> +			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&xtal>;

This is a shortcut and is likely to change in the future. The xtal
isn't really connected to the uart block, but instead there is a
clock mux and clock gate in between.

> +			status = "disabled";
> +		};

Thanks,
-michael

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
