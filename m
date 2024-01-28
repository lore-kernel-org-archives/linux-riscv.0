Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A11C47DA9
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jan 2024 18:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SXzfEbatYBBfy9XgODhSG3BVM2WFIQ/MYv8ljLwPt0Q=; b=IMup4832829J7s
	Ba6cJXzZiliLdzLuZziQs29HyulG8e+frMoqs2fsz5Oxg+YbUdwLGr1A3qterlAleWOFjn+36Mtd2
	3GQf6lEXVpQAUDxoR60YhsnnMfsmfk+biLkJejmWgON6wrPNPzaZCEJTCG4uD75fuEHYEAXnFOkxy
	R2IhOo5hKpG2syAErik0Jl0CcNFnSzSOjZmG/ClrpH1qdhZ2bIVfHa4PARL/l+CVdMZ8owO/gBNBv
	WPvSLnvGkT4hv/sRJwL4uiH+G9e4WtP1R6npk0PgxnmtJLeKrs2K9UcKOUKqUXrZJWy/7pd9dMfQv
	nBYNUbWmfrJn/ERj6nog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU9om-0000000ADyq-4B1K;
	Sun, 28 Jan 2024 18:23:45 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU9oj-0000000ADxR-46tb
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jan 2024 18:23:43 +0000
Received: from [192.168.123.161] (ip-178-202-040-247.um47.pools.vodafone-ip.de [178.202.40.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 3DEB63F2CA;
	Sun, 28 Jan 2024 18:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1706466218;
	bh=Vutysr8zKp94azivfu5X8ZtSSGaT9WFnXqrtSd/Jfpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=BzuF8bzUYA4t+yxx6PQycQS2U0JOsRK15YX6jpA/cIdC/LtCrqjhTAc1GDGQHC8S5
	 PkncFd4yspBegHIhL9r4HaKXwhcbboBrohdvi/PiewF49cbKQ9yt+pi6FeKddDGG6p
	 WK+KyyQBfLeEq5RqC3uNKmNWhZyAt+oFC7Pv+MYefkkwqx99PPF15XJOtDvlv65ESu
	 P98N0bXOT27F25UfRNzn46YitsyxrbcB1cOM0EmtMsPzNpT33onSeyUZBxbxhWHt6B
	 peORJ9cMegLl91r3oSEQBK5B/BYIKh+I31hbcdY/NGf70Va4ou/c0hUZ8+q+EVwvqZ
	 ylMv858ZtReew==
Message-ID: <3f751ed6-871e-424e-a50e-4362e1bfb527@canonical.com>
Date: Sun, 28 Jan 2024 19:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: riscv: cpus: reg matches hart ID
Content-Language: en-US, de-DE
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240128180621.85686-1-heinrich.schuchardt@canonical.com>
 <20240128-simile-endocrine-9e8af979d361@spud>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20240128-simile-endocrine-9e8af979d361@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_102342_268154_7651C06F 
X-CRM114-Status: GOOD (  15.77  )
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

On 1/28/24 19:20, Conor Dooley wrote:
> On Sun, Jan 28, 2024 at 07:06:21PM +0100, Heinrich Schuchardt wrote:
>> Add a description to the CPU reg property to clarify that
>> the reg property must match the hart ID.
> 
> That is the expected usage alright. Did you come across something where
> it was not being used in that way?

No. I was simply missing it in the documentation.

There is a page 
https://www.kernel.org/doc/Documentation/devicetree/bindings/riscv/cpus.txt 
but that seems not to be generated from the kernel tree.

Best regards

Heinrich

> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Cheers,
> Conor.
> 
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>>   Documentation/devicetree/bindings/riscv/cpus.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> index f392e367d673..fa9da59d9316 100644
>> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> @@ -74,6 +74,10 @@ properties:
>>         - riscv,sv57
>>         - riscv,none
>>   
>> +  reg:
>> +    description:
>> +      The hart ID of this CPU node.
>> +
>>     riscv,cbom-block-size:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       description:
>> -- 
>> 2.43.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
