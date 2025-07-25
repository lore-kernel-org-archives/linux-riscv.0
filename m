Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18E8C83F26
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 02:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8bDs5qb1xLgnPUw4BO6DIO5XylRXa5p4WvbZ91PMnI=; b=Jn3y+fg8YVXssF
	ybtZvbwGGCRmfnhM4PwDhk1+EozIU//hfnsHSlaUYDSE9J9HvgaUnVyFsnqvV1YNAI1+EePUb2yka
	dH7zCLsCVGTqnPdjn7YcHP6vB0EQcJtHoa4yMgxRuvg5j4fY9LK0vLsn7QoseMQykX/Z1VoBZTDOB
	Nq/CFprVl/zQW1HUW7EE/1RjkRRA0gjRHFNsbrPcedSgYdcts3BybHDG9zWfluLGDR3mzImFkMbBZ
	qfE/y9HXvLI3mXtjXFGna0iXCuYUM13T8K+xe0bYWooeSapIeyTBj378iO/QLnOSbtJHpnLTkJdvf
	65VlUsEgYlxBLPpoeTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf8Nr-00000008uxi-2PAW;
	Fri, 25 Jul 2025 02:42:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf8Nq-00000008uxN-0Kar
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 02:42:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14AC6A53729;
	Fri, 25 Jul 2025 02:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C483C4CEED;
	Fri, 25 Jul 2025 02:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753411324;
	bh=/Wzdxi+FPpqqrFYqJSRrwfVEvytWS2E7haaA0G+djCQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Q05+ipRqgOKM9ulQakC4Kame56xoZ1ktwQHG4p2XBCrUmptyrixMs8W8cOvssYCow
	 SWBf+2skMIYvclwUtHY3/YFK/UX5AOCoBMWxcxUT+YeFIVQTbZIcuYEaoeKhX+kXrL
	 01haOR6mUd1yntkZX/f/zSjiuWUpVAGqlXdf/koCEXeNHG3VB7H29ygNRZyoj3sFUL
	 A6KVg7mtkASoNgEZNnRSwB8hVkUFf27iIQS1H3cqfbmhKC0LqxQ4/cYT6MhfoLaXah
	 SlU7/TNbf8Q1pyv3YMZU7dZscywJvpjvS2DtoFSV9jHEbJU+w9gbw7JY3uNfDhvqdY
	 Uh5du55PTEkEQ==
MIME-Version: 1.0
In-Reply-To: <20250704070356.1683992-9-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com> <20250704070356.1683992-9-apatel@ventanamicro.com>
Subject: Re: [PATCH v8 08/24] dt-bindings: clock: Add RPMI clock service message proxy bindings
From: Stephen Boyd <sboyd@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Rafael J . Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Date: Thu, 24 Jul 2025 19:42:03 -0700
Message-ID: <175341132347.3513.7184287611040628050@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_194206_189287_FB58B3D3 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Anup Patel (2025-07-04 00:03:40)
> Add device tree bindings for the RPMI clock service group based
> message proxy implemented by the SBI implementation (machine mode
> firmware or hypervisor).
> 
> The RPMI clock service group is defined by the RISC-V platform
> management interface (RPMI) specification.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
[...]
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller {

Maybe the name should be 'clock-service' then? I don't understand SBI so
not sure why this is in DT to begin with. Is something consuming this
node? Or a driver is binding to it?

> +        compatible = "riscv,rpmi-mpxy-clock";
> +        mboxes = <&rpmi_shmem_mbox 0x8>;
> +        riscv,sbi-mpxy-channel-id = <0x1000>;
> +    };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
