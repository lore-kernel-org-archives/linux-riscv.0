Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0992C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 06:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZcAPCuaLnF6CR/5H+6EM36extAiv31R2A/Jn6+fUMI=; b=oRVC78fcU+O3ia
	xJbISKdQ3VtesZ1+Pe7ue329VjGd0C+SmdI5ECSE54wJIvls/gyoQBlcM5kKcTvMeXFsr6BAR0EZo
	ZYlmW3dYPjmLNxQLYb5LqkTxlX2MioSHhNS5TCTJO2KlD84+Eyy1cFeggFPe5ZYr3dxQVOD1ebAiL
	tFsDfYoTqHwgr0c/fpDOGw4pFImUjdcY4enJ3RqpIFXeJUjZ766/oX5w0MtEcIoSrBV+L9Yy1+/uF
	lk1r8VdREunjoEcCapMxxT4+DAGPEc5ReNuEcVkVRJvJAbQcE5mo7LLsBuqibpKby7HfSWUm/cDiP
	eMXRga6YEjRueGtmqsuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRKR-0013ev-1h;
	Mon, 15 May 2023 06:05:03 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRKO-0013bk-0G
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 06:05:02 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id BD54D24DB84;
	Mon, 15 May 2023 14:04:27 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 15 May
 2023 14:04:27 +0800
Received: from [192.168.155.85] (202.188.176.82) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 15 May
 2023 14:04:24 +0800
Message-ID: <3ec4b399-48d8-0129-85b7-0fe30e6de9c5@starfivetech.com>
Date: Mon, 15 May 2023 14:04:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v7 4/4] crypto: starfive - Add hash and HMAC support
Content-Language: en-US
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: "David S . Miller" <davem@davemloft.net>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230504073400.1170979-1-jiajie.ho@starfivetech.com>
 <20230504073400.1170979-5-jiajie.ho@starfivetech.com>
 <ZF4bKe0YkpcQakLs@gondor.apana.org.au>
 <2ae2d187-5db7-9207-7846-1a80e87047b2@starfivetech.com>
 <ZGGz4YFDMKQThG2x@gondor.apana.org.au>
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
In-Reply-To: <ZGGz4YFDMKQThG2x@gondor.apana.org.au>
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_230500_280706_BB3FD64E 
X-CRM114-Status: GOOD (  13.09  )
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

On 15/5/2023 12:24 pm, Herbert Xu wrote:
> On Mon, May 15, 2023 at 11:27:35AM +0800, Jia Jie Ho wrote:
>>
>> I've added COMPILE_TEST in the Kconfig, then ran make W=1, sparse and smatch.
>> However it did not produce the error message.
> 
> I guess you weren't testing on a 64-bit platform.  BIT(2) is
> an unsigned long, so ~BIT(2) is 64-bit long on 64-bit platforms.
> 
I am cross-compiling on a 64-bit platform. 
I'll check my compiler settings again in case this masks errors in future patches.

> You're trying to feed it into writel which takes a 32-bit value,
> hence the warning.
> 
> If you have to use the BIT macro, then you need to cast the result
> to u32:
> 
> #define STARFIVE_IE_MASK_HASH_DONE ((u32)BIT(2))
> 
> But it's probably a lot clearer if you do it as:
> 
> #define STARFIVE_IE_MASK_HASH_DONE 0x4
Sure, I'll do this for the next version.

Thanks,
Jia Jie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
