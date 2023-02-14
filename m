Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B317CC61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 18:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1McEpJYMpTx3pLdo6MYytjPwdyYS+90aCHMa4jzsVw=; b=Vl/gXl1dv2V4NX
	7kxNA0AIDxVNwEAMRGtyc45IqLba65/z5auCKtdcuGQC6xYCQz3PchC1VOhvyO04xv3yr4GGk2DDu
	zY+7RBkklHxvcUXaNPM+/yfvnZQpT3f4/q0f+EFG7OiUgEO3UA/OmITA+CvmwNE6M9ks1/7ZKHb85
	/KE4KEttLPfC8Y3Xn2LpBm4tGuAh/xJ80AWW31AkS6u0qW/jgz/ckEIK6Xau4fbL8eYKy1DhJfDLH
	azBF0DSb5YG3pOuQlcZLMh67yIRMg+hIzrc7Gd94tvVEf5hQOonC2fLeic7hYBzsdBEVYBwH6nJbx
	6WZWa+xp2AqhZBldPTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRzqh-0038bU-MS; Tue, 14 Feb 2023 18:16:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRzqU-0038Wa-05; Tue, 14 Feb 2023 18:16:06 +0000
Received: from [192.168.1.90] (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6C1676602173;
	Tue, 14 Feb 2023 18:15:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676398558;
	bh=5hcGfDEKZbuq1K1R1fzKCojapW7pZt9UpkfXsZpC37k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mkJXs6fJXY0R907DKGgGIUBpVBXxy+M8+xzjMfC0pL+bEFibFu2ppPNSpU4aoo2c4
	 6nxirK0aH3u6olBONZuv6ZtNVhycTbZUau/rNsS3Kn0iLJewqmtc4E4Y69ixAum8lv
	 7xIul9YFjLuR74bir5EK2jXls83EwN77KOW9PKYbL1IFf2g91Iryq+atHNZ92mJdxn
	 kFAx8+Flg+O0ky4nrE4hyDKfmTAJCDkAAIB4b41wMiMYN7inEsqyF40474bIzJ1qAs
	 jInKQQWgMQxO/zUajXkrPZ0CCh7lwIUopAntCu8Dd7E49ApII4F7mmqpUyaW+04/CV
	 jU8dok6WDTRsA==
Message-ID: <4432311d-887b-3010-b9bd-09a5867f620d@collabora.com>
Date: Tue, 14 Feb 2023 20:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 11/12] riscv: dts: starfive: jh7100: Add sysmain and gmac
 DT nodes
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-12-cristian.ciocaltea@collabora.com>
 <34d5e299-3b4b-d176-0010-a9af1220f2e3@linaro.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <34d5e299-3b4b-d176-0010-a9af1220f2e3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_101602_194882_412814B6 
X-CRM114-Status: GOOD (  12.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/13/23 11:26, Krzysztof Kozlowski wrote:
> On 11/02/2023 04:18, Cristian Ciocaltea wrote:
>> Provide the sysmain and gmac DT nodes supporting the DWMAC found on the
>> StarFive JH7100 SoC.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>   arch/riscv/boot/dts/starfive/jh7100.dtsi | 38 ++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
>> index 88f91bc5753b..0918af7b6eb0 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
>> @@ -164,6 +164,44 @@ rstgen: reset-controller@11840000 {
>>   			#reset-cells = <1>;
>>   		};
>>   
>> +		sysmain: syscon@11850000 {
>> +			compatible = "starfive,jh7100-sysmain", "syscon";
>> +			reg = <0x0 0x11850000 0x0 0x10000>;
>> +		};
>> +
>> +		gmac: ethernet@10020000 {
> 
> Aren't the nodes ordered by address?

Right, I missed the ordering trying to keep the related nodes together. 
Will fix.

Thanks,
Cristian

> Best regards,
> Krzysztof
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
