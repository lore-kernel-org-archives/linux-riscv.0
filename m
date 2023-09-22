Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69445CD4F46
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 09:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9wnxz1PU0k7+hiAcJy0XI2nXtH46SmTIuK2poyjDFw=; b=dmCS06ghKj+CGj
	g9sthrMzhZ0ykUIHiOuJhej8jP6YUL7pQsTw83cdTbBqDkKGPgTqtamGXzrjLbjIrTuKJqQ7s9RN7
	6dkQzw5stf9q2n4HDLZB40UVt7EWqIIeY269AlMiUrysWvdV5rNwh11v1sAmtJbHDQc+Wn5WyH/bk
	pB8N8H3dgt+VW+tX1RJszs9mNJsFGDX4GAAGWhV9VUNUo2J0FT4Sd8HdXQAM40tnNnM7JmkpKoSx6
	1RDMPT00cPabbQcrkYBf1PEfeK2HydnKT2Dipl5Zi+rWWubhVGgtfEtlEnzPL4J0IhFoC9p/0RU2D
	IOCfoysRDtGXQnqcRjrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcqW-008e8u-34;
	Fri, 22 Sep 2023 09:53:12 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcqT-008e8K-2P
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 09:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PfpXL8SqEtEFQf0dEBQ/e+lrPG0zgFX2nDS/MPjPwEY=; b=UjINRbUSHXIn4r7OlxYG4uiN0m
	7U8XsaU8T4IaLIdP3i7lNl4cmqTPaXoIUH0dPZ1V9SHCfoB30b3bIpZM66FLSBFBrdTO1zHFahwRt
	EUO30V1px1Bcle0XIsZBbSx075lhWrGA9+bc/6ZLquCDcMtAQIhiLzgWrGWjq57yOzGt/cxFqqAXB
	I0nwsi+px8dpkbfmsZXo+s2YLTzuJwZNGBWuU1T44bnqIKUVrEkZleJ4+AWjIeCoCAPBEOD54PsYK
	+fAiRJLIjYzYXIYcM+WEIz0Vg/IbTIud6rUlWeA33ylbeWOTA85NuB52/oE8dKsBcArrEMaz95Ib9
	w743t+UQ==;
Received: from [134.238.52.102] (helo=[10.8.4.124])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qjcqN-00CZPi-Fr; Fri, 22 Sep 2023 10:53:03 +0100
Message-ID: <0bd1742c-fa39-4f63-a594-6d325dc6b062@codethink.co.uk>
Date: Fri, 22 Sep 2023 10:53:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] serial: 8250_dw: Add Sophgo SG2042 support
Content-Language: en-GB
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wang Chen <unicornxw@gmail.com>, linux-riscv@lists.infradead.org,
 conor@kernel.org, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com
References: <20230915072558.118325-1-wangchen20@iscas.ac.cn>
 <803daa8f-f4bd-34b7-f826-89e1db5f24f6@linaro.org>
 <CAJM55Z-GMm5Hmk7-QWt8Prvp7qyFzOrQVjOjB7jfoX-oiT_C1A@mail.gmail.com>
 <862905cc-48c3-2dc9-6032-6ee189a629e6@linaro.org>
 <CAJM55Z8WDcjRER3ffnj+6V=QWEmudZyaO9z2iPUvreU1okq27A@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <CAJM55Z8WDcjRER3ffnj+6V=QWEmudZyaO9z2iPUvreU1okq27A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_025309_862018_8CF02593 
X-CRM114-Status: GOOD (  19.37  )
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

On 15/09/2023 11:23, Emil Renner Berthing wrote:
> Krzysztof Kozlowski wrote:
>> On 15/09/2023 12:02, Emil Renner Berthing wrote:
>>> Krzysztof Kozlowski wrote:
>>>> On 15/09/2023 09:25, Wang Chen wrote:
>>>>> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>>>>>
>>>>> Add quirk to skip setting the input clock rate for the uarts on the
>>>>> Sophgo SG2042 SoC similar to the StarFive JH7100.
>>>>>
>>>>> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>>>>
>>>> Missing SoB.
>>>>
>>>>> ---
>>>>>   drivers/tty/serial/8250/8250_dw.c | 5 +++--
>>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
>>>>> index f4cafca1a7da..6c344877a07f 100644
>>>>> --- a/drivers/tty/serial/8250/8250_dw.c
>>>>> +++ b/drivers/tty/serial/8250/8250_dw.c
>>>>> @@ -770,7 +770,7 @@ static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
>>>>>   	.quirks = DW_UART_QUIRK_IS_DMA_FC,
>>>>>   };
>>>>>
>>>>> -static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
>>>>> +static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
>>>>
>>>> Why? What is wrong with old name?
>>>>
>>>>>   	.usr_reg = DW_UART_USR,
>>>>>   	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
>>>>>   };
>>>>> @@ -780,7 +780,8 @@ static const struct of_device_id dw8250_of_match[] = {
>>>>>   	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
>>>>>   	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
>>>>>   	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
>>>>> -	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_starfive_jh7100_data },
>>>>> +	{ .compatible = "sophgo,sg2042-uart", .data = &dw8250_skip_set_rate_data },
>>>>> +	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_skip_set_rate_data },
>>>>
>>>> So devices are fully compatible? Then use compatibility and drop this
>>>> patch entirely.
>>>
>>> I'm fine with this, but these are two different companies and SoCs that just
>>> happens to have both implemented the Designware UART with an inflexible input
>>> clock. So if fx. a real quirk is found on the JH7110 then we'd need to either
>>> change the compatible on an unrelated SoC or change compatible on the JH7110 to
>>
>> Wait, why? The compatible is still there, so you just add here proper
>> entry, if ever needed.
> 
> Sorry, I messed up my example by writing JH7110 where I meant JH7100
> 
>>> something like "starfive,jh7100-uart-with-quirk" and "starfive,jh7100-uart" will
>>> forever be a quirky way to spell "dw8250 with inflexible input clock".
>>> Is that how device trees are supposed to work?
>>
>> I don't get this part. But anyway if the blocks are really designed or
>> done independently and there is no shared part, except the DWC block,
>> then indeed the compatibility might be just a coincidence...
>>
> 
> It is. Sophgo and StarFive are not the same company. Sophgo are using RISC-V
> cores from T-Head and StarFive are using cores from SiFive. They just happen to
> both use the Designware UART in the same way.

Out of interest, what's the issue with just providing an fixed clock in
the device tree for these machines?


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
