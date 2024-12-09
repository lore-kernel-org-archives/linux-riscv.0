Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E52E77173
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 09:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOvyC2BjE4c08refdQj0Eld3bitJKtqFRbNtJcHUcZY=; b=iqtPCY6mXYyEU9
	w2tzvQg/NNJm//FF9RlAHBgEJ0/u59na+RGUf/hYAlXsJV2QvpeYeLzEQGVatqWmD/Vk+1x6hJ1Ar
	WIO/Ac7kwka7IQP1HUiXoj4pcGaCf7pEmCYzJIkvDugaBDxHEFD4YbBkGVv1h3V7O6IwAHaSbDL0N
	PUBTuqA1jpqiUpkpaWmzqR6/tI1h6Wo5Bfda+/74FoqAf/JB/HK47jvGMj+IMfQfqoH1QzC3f3o+0
	7AvhsHVzM92ZrYsydJKFWz2DbkAulCaopR3r9WSbrBPJgRAbz8im/aF2yN5B39ytzSqyP8qomUwPX
	mLLmsWZsW9y78Fgh83cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKa4K-000000075ZV-2PN8;
	Mon, 09 Dec 2024 09:28:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKa4I-000000075Z2-0unF
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 09:28:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8D7D9A411B2;
	Mon,  9 Dec 2024 09:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5347C4CED1;
	Mon,  9 Dec 2024 09:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733736520;
	bh=WDjI4g0DfIOL2DK5+4PccwTUMKhSJ21zH9e8E8kHm0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u2C0fyFXkAZT9B9Mdt9WymIJjq0UTLu0esOTlK33rJm7rq7Na7iVBlK56QvB3rL30
	 Zi2PNNzreCGyR2pkLMGu4+0A1oNUWrl4FPQIaUSExQTQoeclU+j4mA1cbmt9sfBRbV
	 4ffcZGL7ZENUA4x6AgMNEIACyXqM3mDkMG8IheOzsQSwJYiY6CJE4zoxf13/GUN68H
	 VPsG7fwN+KcO96ZXpuEaZwneue5BIA9jmYC2fQ0Jr3Gq+HLG7O8JmNhvR0v/4PFsUv
	 IeozQ597DcQKIv+9QiRsK0BDklH0ABKNmDMgbmnt3UuGl1ZaUL2ic16cmr9TenQn1G
	 g9CTTLCQwaRKg==
Date: Mon, 9 Dec 2024 10:28:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de, 
	unicorn_wang@outlook.com, conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com, 
	krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	tglx@linutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
	fengchun.li@sophgo.com
Subject: Re: [PATCH v2 1/3] dt-bindings: interrupt-controller: Add Sophgo
 SG2042 MSI
Message-ID: <ww2npib4iyivjqp4l4rdilry2iz2svtidue34v4bebkfmuzpnv@o6ujlbilrtw6>
References: <cover.1733726057.git.unicorn_wang@outlook.com>
 <8f857ba0d281010ddfb53d12b3dd66733ee6a810.1733726057.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f857ba0d281010ddfb53d12b3dd66733ee6a810.1733726057.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_012842_325037_A1F2104C 
X-CRM114-Status: UNSURE (   8.05  )
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

On Mon, Dec 09, 2024 at 03:11:29PM +0800, Chen Wang wrote:
> +  msi-controller: true
> +
> +  msi-ranges:
> +    maxItems: 1
> +
> +  sophgo,msi-doorbell-addr:
> +    description:
> +      u64 value of the MSI doorbell address
> +    $ref: /schemas/types.yaml#/definitions/uint64

reg, as asked last time. 'reg' does not mean you need to ioremap it.



> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - msi-controller
> +  - msi-ranges
> +  - sophgo,msi-doorbell-addr
> +
> +additionalProperties: true

Nope, this cannot be true. There is no single device binding like that,
so do not introduce your own conventions.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    msi: msi-controller@30000000 {

Drop unused label.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
