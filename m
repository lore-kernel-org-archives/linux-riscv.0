Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53378C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cBOmNiyGXg5Vc4gmL1Nrq7saTJZtQZqhg56PQZJ4Z8=; b=E6QpqRZJSIcO2+
	ZcRybDY0OR8XvWCe7IzKBZuDvJtTO9pYh8YI6vVLd4Biea4ZwilrygBaP4c8S2bRqOdsBhEGE6P6Z
	0u2iOUSkFJnbG9t76U/+evDimCQrkRV7v3lxPWxv9S/TSBbffpqiBl6vLUKduUElkXjocUPnkWYAe
	dy3EHxVoWSGsIpYaCWsFDuladj0OWxCvKlJTnydOLFAJvla3Mp0Sa+zBuAscRhQIUpA6u/+VQk9wU
	yE5ENncw+YVO9h3rsLa2uKMZ/9XLy8i+qNAo8Y5k7zzErwip9NIpAZau0op8xows26CLClY0dfXSW
	ZiWM1qeG7k2kkJkwB+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPJL-0067J6-1D; Wed, 17 Aug 2022 20:06:43 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPJF-0067As-AH
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:06:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id z16so17378100wrh.12
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=UZTpqupSKgkBpic1kmmbE38yTznkCK+owr7ALBSIpuo=;
        b=ONnvtXExatPGAC8/eknlabIqwuQUJitqFeDU6iyKVknhYq9mRJVUgaW2s/7WFWlzn3
         4I6bO7BksmXFUVOTQo+3EgPrXJ1lC68V8OUxM9/0Le5LasHeV74Ro+BAK0z6yqUH3qOh
         OGjdiUMOpNCZIbN0TFs3JxCRuWhZyPiuau7oARVBknRBZVZwveudnn/hhBflTdlfwJp0
         zqRdtz4HOAEoctXS5iQSbg7kxevpTwPaVWymxqfPoCEqyegAyKI9KFrcg7pFAndgC119
         hZjazVmD1acGyLfeqZ9w7H37fQt5bDzqX+p2MWPJsdllwftjSVTbRklc2TSA5JFPeOTb
         NWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=UZTpqupSKgkBpic1kmmbE38yTznkCK+owr7ALBSIpuo=;
        b=oxnwycvVeclaeZCw4m0wrUWY2j+FWWPE/54aiJcpD/v0HAsbvDh5IK0ulBYBONOrm2
         SHsV1XMQQ/UPodqGMyjDU44+NtJfAGriyJXOKG8qYH4FCEQxtl/p9nbGPDVl+HnnAFD5
         p3vfAuGhHI2S+Cug9ZM78PEobRQegAiz9w7a982mKTs6MAQPavYy5oxf7xe6jR7uiXcw
         Z7FsfV1F5Lir8MXAnBRmstwdmgqSYsF49MVx4f+/mgLEtNlnLVDcD7+7BuTZSdYORLna
         VffXFeJVcX0ZHa0gEUkYTo5cHcmIDChMyQOZe3sFTh8Lo7jE+T+wKrXSz3PfFP6RBzz0
         iw+g==
X-Gm-Message-State: ACgBeo0nq12e24Xxf+kI28vIcMb+299qfACbB+1IY4jraDKDSPd+OHfp
	TdiEvFqbuJ4J9hIWYYWN95uTrA==
X-Google-Smtp-Source: AA6agR7BOt9pNzRcWHTxtpR3HtOvdldpTzvhVKO4AviCyWyAqHC7IF3syom/zJ4M5uYixXaWEpe8vA==
X-Received: by 2002:a5d:64e9:0:b0:220:7dd7:63eb with SMTP id g9-20020a5d64e9000000b002207dd763ebmr15274129wri.590.1660766796102;
        Wed, 17 Aug 2022 13:06:36 -0700 (PDT)
Received: from [192.168.2.222] ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id x9-20020a05600c178900b003a4efb794d7sm3065988wmo.36.2022.08.17.13.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 13:06:35 -0700 (PDT)
Message-ID: <0046d59c-6736-09c2-199d-3661e58c2928@conchuod.ie>
Date: Wed, 17 Aug 2022 21:06:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>,
 Guo Ren <guoren@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
References: <20220817200531.988850-1-mail@conchuod.ie>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_130637_624541_B2404E4A 
X-CRM114-Status: GOOD (  16.53  )
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

Please ignore this series, I accidentally had too much in the folder.

On 17/08/2022 21:05, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The device trees produced automatically for the virt and spike machines
> fail dt-validate on several grounds. Some of these need to be fixed in
> the linux kernel's dt-bindings, but others are caused by bugs in QEMU.
> 
> Patches been sent that fix the QEMU issues [0], but a couple of them
> need to be fixed in the kernel's dt-bindings. The first patches add
> compatibles for "riscv,{clint,plic}0" which are present in drivers and
> the auto generated QEMU dtbs. The final patch should be ignored for all
> serious purposes unless you want to wash your eyes out afterwards, but
> JIC the versioned extensions ever come up, it's there.
> 
> Thanks to Rob Herring for reporting these issues [1],
> Conor.
> 
> To reproduce the errors:
> ./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
> dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
> (The processed schema needs to be generated first)
> 
> 0 - https://lore.kernel.org/linux-riscv/20220810184612.157317-1-mail@conchuod.ie/
> 1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> 
> Changes since v1:
> - drop the "legacy systems" bit from the binding descriptions
> - convert to a regex for the isa string
> 
> Conor Dooley (4):
>   dt-bindings: timer: sifive,clint: add legacy riscv compatible
>   dt-bindings: interrupt-controller: sifive,plic: add legacy riscv
>     compatible
>   dt-bindings: riscv: add new riscv,isa strings for emulators
>   dt-bindings: riscv: isa string bonus content
> 
>  .../sifive,plic-1.0.0.yaml                     |  5 +++++
>  .../devicetree/bindings/riscv/cpus.yaml        |  9 ++++++---
>  .../bindings/timer/sifive,clint.yaml           | 18 ++++++++++++------
>  3 files changed, 23 insertions(+), 9 deletions(-)
> 
> 
> base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
