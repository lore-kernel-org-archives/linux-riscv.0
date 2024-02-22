Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE28C54798
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 23:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LFC8xbEqettoT25mQ7A5oOJSNymsFpLisLvG/b+X7Uo=; b=g2uqaex51VsNmB
	e0r4r1CRbtVde3mAnfT9GEmiIIEe28M/gbezH/ljAYi/cXVlJmsMSc+Zy3720TFaQM+rvwapJiDbc
	Dm28ri+ZUiu41DORrTUdmI5s/K59u03JJaaN2ix8O7cAXCglIXeYIyRJ7Cuy6TCHm9A2KUjwZQnJt
	woMZhm/2fys7IfCf5IAI9PqBWfvicYv/BArc82+6YWeb9xN19nw2uMI5AUI8RcF0a6nZO2Ymx6ZiS
	4R+NGBI7DxehPE62HUANUCPrK8jlhwvPAbqjmH/ulyuTcaDj3sbB2A0lsJAHBuMw7iOblaX9KtW6R
	/oBWfJ0xv4oyCgUAFgeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdI3M-00000006ttk-1a8F;
	Thu, 22 Feb 2024 23:00:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdI2y-00000006trI-06uZ;
	Thu, 22 Feb 2024 23:00:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FD8EDA7;
	Thu, 22 Feb 2024 15:00:42 -0800 (PST)
Received: from [10.57.10.154] (unknown [10.57.10.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19E2F3F766;
	Thu, 22 Feb 2024 15:00:00 -0800 (PST)
Message-ID: <27ad9614-e3de-4965-9f4e-865bc541eb4c@arm.com>
Date: Thu, 22 Feb 2024 22:59:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 02/25] genirq/irqdomain: Remove the param count
 restriction from select()
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <20240127161753.114685-3-apatel@ventanamicro.com>
 <e42b76a9-fc5f-4ab7-96a2-629261a9c983@arm.com> <87edd4a2fo.wl-maz@kernel.org>
From: Aishwarya TCV <aishwarya.tcv@arm.com>
In-Reply-To: <87edd4a2fo.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_150008_166233_F60062E5 
X-CRM114-Status: GOOD (  14.19  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 22/02/2024 16:28, Marc Zyngier wrote:
> On Thu, 22 Feb 2024 13:01:32 +0000,
> Aishwarya TCV <aishwarya.tcv@arm.com> wrote:
>>
>>
>>
>> On 27/01/2024 16:17, Anup Patel wrote:
>>> From: Thomas Gleixner <tglx@linutronix.de>
>>>
>>> Now that the GIC-v3 callback can handle invocation with a fwspec parameter
>>> count of 0 lift the restriction in the core code and invoke select()
>>> unconditionally when the domain provides it.
>>>
>>> Preparatory change for per device MSI domains.
>>>
>>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>> ---
>>
>> Hi Thomas/Anup
>>
>> Currently when booting the kernel against next-master(next-20240222)
>> with Arm64 on Qualcomm boards RB5/DB845C, the kernel is resulting in
>> boot failures for our CI. I can send the full logs if required. Most
>> other boards seem to be fine.
>>
>> A bisect (full log below) identified this patch as introducing the
>> failure. Bisected it on the tag "next-20240220" at repo
>> "https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git".
>>
>> This works fine on Linux v6.8-rc5
> 
> Can you please try [1]?
> 
> 	M.
> 
> [1] https://lore.kernel.org/linux-kernel/20240220114731.1898534-1-maz@kernel.org
> 

With the patch[1] applied on next-master(next-20240222), successfully
tested booting the kernel with Arm64 on Qualcomm boards RB5/DB845C.
Confirming that the patch is resolving the boot issue on RB5/DB845C

Thanks
Aishwarya

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
