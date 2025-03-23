Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0BEC36002
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Mar 2025 13:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Edemc5UUdaoyRsda7fASASBv+Ko6wvaDymSA/GnLrs8=; b=3ifQptrjMoEY/9
	W7WFflQS9FY78zTXDI+QFoucHDEUZbClrZ3mjxWf83pAlWWZMeN82yxQNitKhdcDqbE4QfVnbUT8l
	ph5cEtUTHwNQ2+6xmxb3v8LnXQNZADjZNB97LbD/0/LA2pwvWFcv21e0fkIm6PBAKTAxDhukNJ6Jd
	ggH4DHxgfaz5mZl08+R6tiCpDsmjk05jlrE/DHaqxzbE3RE09tibq+naHl/FIk+RdQDIVTyvgjrQK
	UfIgJknPvjHZqOYgbDbtPaaupnblLLJ11ZIijyAMnt2je6hDa7TGYOhzCnxSuyWk41ful+zlWZpGE
	wTyKxfb8pIvj9k++CRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twLIt-00000001FLG-3uD4;
	Sun, 23 Mar 2025 13:23:51 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twLIs-00000001FKb-1Mud
	for linux-riscv@lists.infradead.org;
	Sun, 23 Mar 2025 13:23:51 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-85afd2b9106so378288539f.0
        for <linux-riscv@lists.infradead.org>; Sun, 23 Mar 2025 06:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742736230; x=1743341030; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vOluyEJJQfX6U4qT7bfq8l8QHshCFBSDzvPzJIBTv80=;
        b=UcHBaeOA9ldgzPwTNJfOFsA7aLl8oFY5XiBKkJI5xC52iiXaYJo2MqhnXwa3iX4rJU
         FPHTsnU/jvZNJF21PMq1CSe4EUX6HLvp0AEm2YGPchWxWW9brY/FmhV1QUi8mHFBX3hA
         aD5KlejM5iFzDaNHswEc3fKPoQUZk4pmeRfs5Vx0ANeTqEkLQQG/ToGxUG2TtCnfM5qD
         j0gMUK7jTdrjv6SHw4gOZgh3Vh/86UVb9PpdrjbQC6SRSrkF6Yjg46vUgt3gK6V7Xoff
         ipTpCHeA/IO0eoQGIkHqVxdh9XVHMmtPsgbXwHZdcQEFWCF4PUR91JywHAoZRCEdcIy5
         uIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742736230; x=1743341030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vOluyEJJQfX6U4qT7bfq8l8QHshCFBSDzvPzJIBTv80=;
        b=F7856jSHri7JE/X4MVtdiFRr5KUmC/ZfSG2CIhyVcMENa3HpiAkvHU3pWSSYSf3qoA
         Sm4TzPlIDBo/ctEaqohlrcjjA7fD5KmNCHHToTHjvYk3GFKi1OiqhR9eXiYxdBTyVruh
         JnkRmkXmuPfB0cWDjVygTPxpyQmhtssDWXdHmhmSgYgEm+ETo72Xw7d3zX46K5pRzf1H
         VmEuKtQJQlQyMDdxu0OIovRuoyxbb7lyFUnyANVV9qoOxNLFnVj00jLJhcBHDyvN4gh5
         zGowK4nqCSPi6Aceg73CP4Q9oIFkY/xMZjlDqJMa+Tul7zZ3PruulvIDCoDxAhviWHCW
         vqKA==
X-Forwarded-Encrypted: i=1; AJvYcCWuxCqv2YvauWChH9hLLUxp9O3bj7NNTtsiiymEhaeYjI4hrEVxqX9h6qijd6nQZgt+3znpU8rYUsd51g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWDIF/Ps1NYTjGlRlA4tEtP9F35QPUXgr8g21+H436o5qD92XD
	e7KfxFlXtS9eKs3BVO20WWxxnKer9boCKaqat/FqQWZH+Fh5yz4K67buZjjk0hg=
X-Gm-Gg: ASbGncu8HY1A245NXqiHHjpXTZH+V8iG7npi/TaZ/x316Blt++feru3gQao3N76qiQa
	FCo2PLNTIY42fkChfz1TlAL2lIaRtCJ6ynMJAS1owB+MXw9Rtkv9SROQm5a2IPlSYHQGN6BCy7k
	ZnN2UuH1A/rCUwPrwxqQAvQ8Dytry9vDbJNq11O8h9fMJN1mm4bA7+Lr5L/pgMXQPpfmtjcBcN3
	xHeRFt5ToEg/vVC/8DspeVC3nYjLlVwHeAm7cT4d53f2W1saAAl940fxCAI5Z6kilG2nbihuUtZ
	YWeZYMyxEu7m1XgkSUwNjysEGUiZPioh4h73WoO2dPK/Sx2YNja2lrsXdEu+ohMq3Q9iz3o7lvA
	wstkFSbe52K2ayePRoD0dUR6H5Y9w
X-Google-Smtp-Source: AGHT+IHvNHoOTQ7GjqXvKjbkWRzMHajkOVeKgTFwJL+MCalCStZsW2aoR41uPaZSxapIX+qE0BXZHg==
X-Received: by 2002:a05:6602:7512:b0:85b:3c49:8825 with SMTP id ca18e2360f4ac-85e2ca62dd3mr974589339f.4.1742736229595;
        Sun, 23 Mar 2025 06:23:49 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bc13d74sm125798039f.11.2025.03.23.06.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 06:23:49 -0700 (PDT)
Message-ID: <b5af3a7a-c5da-497a-ad67-c99edfdf665e@riscstar.com>
Date: Sun, 23 Mar 2025 08:23:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 7/7] riscv: dts: spacemit: add reset support for
 the K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-8-elder@riscstar.com> <20250322164830-GYE11633@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250322164830-GYE11633@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_062350_371938_1AD4756B 
X-CRM114-Status: GOOD (  17.71  )
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

On 3/22/25 11:48 AM, Yixun Lan wrote:
> On 10:18 Fri 21 Mar     , Alex Elder wrote:
>> Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
>> currently support resets but not clocks in the SpacemiT K1.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> index 09a9100986b19..f86d1b58c6d35 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -350,6 +350,18 @@ soc {
>>   		dma-noncoherent;
>>   		ranges;
>>   
>> +		syscon_rcpu: system-controller@c0880000 {
> I'm not sure if syscon_rcpu is good name to go, it's AUDIO Peripherals
> in docs, see
> 
> 7.2 Main CPU Domain Address Mapping
> https://developer.spacemit.com/documentation?token=LzJyw97BCipK1dkUygrcbT0NnMg

They call it "AUD_MCUSYSCTRL section <RCPU(0xC0880000)>",
where the registers layouts are defined, and the register
names use the "RCPU" prefix by convention.

I guess I could use "AUDIO" instead, but I think it's
"RCPU" is a little better because of the way things in
the region are named.  It's a little like how "pll" is
used for the DT node name for things in the "APBS" region.
I don't really like that, because the connection between
the two isn't very clear.

>> +			compatible = "spacemit,k1-syscon-rcpu";
>> +			reg = <0x0 0xc0880000 0x0 0x2048>;
>> +			#reset-cells = <1>;
>> +		};
>> +
>> +		syscon_rcpu2: system-controller@c0888000 {
> not found this address mapping in above docs link

You're right.  I was following what the downstream code did.
I'll gladly just include this in the main "RCPU" node.

Thank you very much for the review Yixun.

					-Alex

>> +			compatible = "spacemit,k1-syscon-rcpu2";
>> +			reg = <0x0 0xc0888000 0x0 0x28>;
>> +			#reset-cells = <1>;
>> +		};
>> +
>>   		syscon_apbc: system-control@d4015000 {
>>   			compatible = "spacemit,k1-syscon-apbc";
>>   			reg = <0x0 0xd4015000 0x0 0x1000>;
>> @@ -518,6 +530,12 @@ clint: timer@e4000000 {
>>   					      <&cpu7_intc 3>, <&cpu7_intc 7>;
>>   		};
>>   
>> +		syscon_apbc2: system-controller@f0610000 {
>> +			compatible = "spacemit,k1-syscon-apbc2";
>> +			reg = <0x0 0xf0610000 0x0 0x20>;
>> +			#reset-cells = <1>;
>> +		};
>> +
>>   		sec_uart1: serial@f0612000 {
>>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>>   			reg = <0x0 0xf0612000 0x0 0x100>;
>> -- 
>> 2.43.0
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
