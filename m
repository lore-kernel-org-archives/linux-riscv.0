Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3D9C48BC1
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 19:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERGuIeDcVoVcL0f3YH6+oPGl+xgSt5pc8ZKm1FGCtrg=; b=hHxd2EUWmkXfHt
	n9Xx6HgYt6DDZ3RQeP2qyZdgfZvMoIUK0HpYEh05zqqASPJT1aa3e8GBJKeukG+kxkrSv3XkXSVn8
	s3IOYE+QphP4tDKZAix4EnrBuqEcTXlxkvjxLSa3E1RzGBuw6J/ZiyonXkeDEDE0fFaA1xyt23plD
	uW5FYC/eG4Q7dAH06111K53ysDhQQ2+Ue6pRxmuDfJcWo8B5Aus2czfVUhPmoROxinE648y3agPS6
	1LM67e/awkSMWS8z1RCxRpxPzWLWIPrakNrfmt3z6AA1JgzwQtV4nd6XTtyHrh1gHbm58OOg/UueQ
	YO+Fu+UcYVuilOcAzl8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raLLO-0000000E7GH-1KK5;
	Wed, 14 Feb 2024 19:54:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raLLJ-0000000E7FI-0af1;
	Wed, 14 Feb 2024 19:54:55 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1707940489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pWgmODdyCFjoF/eUm+zQH2zAYiBj+QLBm/2cR/9KvCo=;
	b=r/cRE8vrZLjTq0BX5t9BwA1GKKTu+o751ptz3qrRwruArb3JNTUTIwvL9jVqH+NojBdkID
	rZhdmfFo2s2E7HoO75KRCihFE0yCxFnQ8AXfSpMdDppoKLBpKdNLNZdnBPzR15KgT+j3ao
	0EHOjuW6o809tMVRJrYmwa/A5rcs/ijfCmrN5eYPetI1ovjWXY9EMYIiGtlm7JJ7Kc6wc+
	zY9K+Q7cE7juVAN8gJ+wK/vTtCkaL7tk0vlE/hamvVHiYcEV6rRVsS+g2FdnKyem2GZmtg
	oXnGMzQKY2iDfhvxbd1a054m/kKAByqRpsvBix0C3Y3feeWpTjBQj5uxnUErKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1707940489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pWgmODdyCFjoF/eUm+zQH2zAYiBj+QLBm/2cR/9KvCo=;
	b=34shzqURn6yB6YU8XvcxFo+0c6MBj+bXOPv6t32JWTIQyXQM2Kt3gMDa4/8MXvH+YNCLSM
	4Fy9kbVaPiuWTsBw==
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
In-Reply-To: <CAK9=C2Vwtj2gZg-P73yLMxu0rPXQ3YrRRuxq6HcpHMXgs-jHaw@mail.gmail.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <CAK9=C2Vwtj2gZg-P73yLMxu0rPXQ3YrRRuxq6HcpHMXgs-jHaw@mail.gmail.com>
Date: Wed, 14 Feb 2024 20:54:49 +0100
Message-ID: <87bk8ig6t2.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_115453_342007_89EF7275 
X-CRM114-Status: GOOD (  12.48  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, "Ahmed S.
 Darwish" <darwi@linutronix.de>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Anup!

On Sat, Jan 27 2024 at 21:50, Anup Patel wrote:
>> Changes since v11:
>>  - Rebased on Linux-6.8-rc1
>>  - Included kernel/irq related patches from "genirq, irqchip: Convert ARM
>>    MSI handling to per device MSI domains" series by Thomas.
>>    (PATCH7, PATCH8, PATCH9, PATCH14, PATCH16, PATCH17, PATCH18, PATCH19,
>>     PATCH20, PATCH21, PATCH22, PATCH23, and PATCH32 of
>>     https://lore.kernel.org/linux-arm-kernel/20221121135653.208611233@linutronix.de/)
>>  - Updated APLIC MSI-mode driver to use the new WIRED_TO_MSI mechanism.
>>  - Updated IMSIC driver to support per-device MSI domains for PCI and
>>    platform devices.
>
> I have rebased and included 13 patches (which add per-device MSI domain
> infrastructure) from your series [1]. In this series, the IMSIC driver
> implements the msi_parent_ops and APLIC driver implements wired-to-msi
> bridge using your new infrastructure.
>
> The remaining 27 patches of your series [1] requires testing on ARM
> platforms which I don't have. I suggest these remaining patches to
> go as separate series.

Of course. Darwi (in Cc) is going to work on the ARM parts when he
returns from vacation. I'm going to apply the infrastructure patches
(1-13) in the next days so they are out of the way for you and Darwi,
unless someone has any objections.

Thanks for picking this up and driving it forward!

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
