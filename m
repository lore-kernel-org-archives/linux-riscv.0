Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6DAC54E66
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CyoldhHfuUbkh1suX7Hr1hgGb6rzLMjpUvC9lsnvc4Y=; b=1vP4CuFlWP2vp6
	yttYqlnH7Y/meRs0pCq6NAeMH/brL5WN67VTVwHintVUyka8NQsEPNj2a9ts65I3fvt1dbJQsvBmn
	frscPNBChU1BKFDH8BKT8aSybh2+BMsoEdfymYXjDHoPZD8oWqKkgJCR6l+ufSlDb5eL+C++XmtbS
	PAFtm20MDKh7GuuHmEKVQy+7Y/JL14r5R1mqUIXpqN+TXHjQbDpotg31PzXwb2XQuZ6hlMknZffK/
	duZ62dQ8lzq9MokjOw1TjoOb9tiNKCmBcxJqiXETIhNoJ6eXoMsgkE7zP+cjmwYNNiMnU6Hv8t/gU
	AyQnE6cC65mmZEUC2cyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl2mW-0000000H8E8-2Rpo;
	Fri, 15 Mar 2024 08:19:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl2mT-0000000H8Cl-1GoW
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 08:19:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A30D16153F;
	Fri, 15 Mar 2024 08:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8475EC433C7;
	Fri, 15 Mar 2024 08:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710490747;
	bh=/eKPOjIMzBEqqdf481aoLuRA42OFb7oCAyDNb31yBt4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b+tIHes/7nOkDS7dxeJm8C6GAQoK+SGnAhxi3W06JsHEEleW8rRtRvjMo6vW/wGil
	 iKFeHErxfzh55jV2f89qVKAVFzdElDPYzLbfcOw3Oo3VW1wa30a3WFdOKCNsCLS2kT
	 WUAwlWYbfMteaBBWzbaC0hSPIAH02HwoPXO6Ms+i8IGwFfyHji29MUS6f1sHWpn67W
	 8nenEV9NH0t8q4S2FtSCV4FT6WxWBwt0046ySc731HDZefbrB0McXYD6c9GUTi4Bo/
	 WsdQev6Sb4C6zYaB2s3IxITTzNpa2AJxw5BlGhhZYBgdNriu7H8OCTH+YYcmz2XK1n
	 LYvP02JH1Ltfw==
Message-ID: <2b0511af-1b5b-4c90-a673-c9113bb58142@kernel.org>
Date: Fri, 15 Mar 2024 17:19:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] riscv: Kconfig.socs: Allow SOC_CANAAN with MMU for
 K230
Content-Language: en-US
To: Yangyu Chen <cyy@cyyself.name>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
 <tencent_0432DA968E39B81431F921F38D747C008208@qq.com>
 <ef8df22f-dac8-4652-bf17-d10254e6abfb@kernel.org>
 <tencent_E56A833916E00EC7B4840C34FAF1250ADE0A@qq.com>
 <20240305-fascism-enrich-06483ddeb149@spud>
 <311bdf17-c16f-41d8-8366-10f9b00adf27@kernel.org>
 <tencent_FF86EF51905CFBDF1102F721663984B2F105@qq.com>
 <tencent_9543398AE3BAC424842837CEF01508D6680A@qq.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <tencent_9543398AE3BAC424842837CEF01508D6680A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_011909_472541_AB5BDC94 
X-CRM114-Status: GOOD (  21.41  )
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

On 3/14/24 01:56, Yangyu Chen wrote:
>> Hi,
>>
>> Thanks for the review comments. After thinking about it for a while,
>> I think we don't need to change it as we have changed the help
>> message which deleted the "K210". And the dts on k210.dtsi shows
>> mmu-type is riscv.none, I think if someone noticed this would know
>> why it fails to boot on the S-Mode MMU Kernel on K210. The only
>> special thing for ARCH_CANAAN is that a loader.bin will be built
>> when M-Mode is on arch/riscv/Makefile. However, Canaan has no other
>> M-Mode chips except for K210. So I think we don't need to change
>> it.

You completely lost me here. I do not understand what you are trying to say.

>> Another reason is that SOC_CANAAN for K210 is somehow hard to change.
>> If we continue using SOC_CANAAN for K210 but not for other Canaan
>> SoCs such as K230, it will cause some confusion to users. If we
>> rename SOC_CANAAN to SOC_CANAAN_K210, it will change many drivers
>> in many subsystems like my patch v5 [1]. So I don't think we need
>> to fix it.
>>
>>
>> If we don't change it, A concern for this is that some drivers for
>> K210 will be built when SOC_CANAAN=y and if we add this to defconfig,
>> all riscv builds will also build some K210 drivers even on MMU. But
>> I think this will not be a problem just need some memory/storage
>> for a slightly bigger kernel. Also, we will enable some new configs
>> in defconfig when a new soc gets supported, it's normal for K210
>> SoC drivers.
>>
>> Thus, I think we don't need to change it. If you have some other
>> opinions, please let me know.

1) Rename SOC_CANAAN to SOC_CANAAN_K210 and use that for any conditional code or
driver selection that is specific to the K210, which is what's done now.
2) Create a "new" SOC_CANAAN config and make SOC_CANAAN_K210 depend on it and on
!MMU

You could also add SOC_CANAAN_K230 if needed and make it depend on SOC_CANAAN &&
MMU.

With that, dirvers common to both the K210 and K230 can easilly be selected and
selecting SOC_CANAAN will end up either building for the K230 or the K210,
depending on MMU being set or not.

That's my 2 cents. Feel free to ignore. I am not involved that much with riscv
these days and I am far too busy with other kernel areas to be of any help. But
I really think that allowing building the K210 when MMU is enabled and "hoping
that the user understand his mistake" is not a great approach.

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
