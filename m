Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFBDCA6012
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVzG/Ofx1nRJFE9FV29LlzjMdrDn7e5qaD7sWKwsHf8=; b=kunkyd383dPtY+
	lSSsjCPaU+1Y07Tvb+7HrI3N9WgaBhf+Ecu64RjifC8/iyRNO9tfmiS7SlxzTu4t3Ipnn6ZRp68WS
	JbgGf78MvUISthg6cgkLPH6haoB1xvj7YiE8Kq+v6ZK5oGsgxJeAs9epxIHRsg1vThfpZ16OUEMM0
	Ve91d3iIEkr+I+T+SM5L4NDIFCkYSiVxZRAngbw1NLgpumbd9HmFzrz/tx+oE1LQsLfVphMih9o3u
	oWwJEPFl07M4s4LinaaXAjCGVRbbu7/wmFWzpuylfxmvp9Q/qIdn1RaoMhV2xvwaQeXn/0cFf5vaz
	uA6oaqyMMlTTdA61uJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Rl-00000005yJ9-1Sqc;
	Fri, 09 Oct 2026 10:03:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Ri-00000005yIe-2yhM
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 10:03:24 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so64481955e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 03:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791540200; x=1792145000; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPWJMeDyVSRIeJtDK0w7ULZSIZyQfconBMNDwO4cVgs=;
        b=CtLOxdriMeyGRgS8HI9UhP2w4TWP3FomzEsG0cwdnyn5CbIUT8ex1i6ostpkZYUNXG
         GEJDERab8flU4O7ip4KqokO4CpN2caH8gcerjvRUnjU7t6BqWZaEJ8uwvcBPc8fM7LmM
         oHewVJ1QOwgKDsSuv0sA0qB2IaEzMrSNCdgQDEfS76XjB0G5rP1WHxtTuyhHu0wiV55v
         1EPN2xWxPy3+RrU2iOD47kBsZDmuqUtbEDjif2GXnrcN2RkXILCuQq23yo1QgC92yryT
         mntSd5XxTP6MzzRhAuf+icxck+w12AhR8HNgLHd3a6kfnfUSJ3FhLWEs0ZESbYzDxLMY
         c06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540200; x=1792145000;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPWJMeDyVSRIeJtDK0w7ULZSIZyQfconBMNDwO4cVgs=;
        b=O/gn3aFwyk8FOLSy0pmcCgm/IG75MCtmc0HqQP6WzM/N7+Mkb6/WvxXU9A15OJ28xF
         CrZaoNh7cYQ19OxIxU1QnUfujpOUqilr/tlYCEZ7HMA4KidDngQ3yfN1aPkg9xbvqzeZ
         VmyV+99E7M6xen+Pu6auQTd4L8uhPwP4HFDwyTVbJrVWXraELfqUuaJpXEmy+8/QuRHJ
         x3IhCb8IRZykjMYQF0E0aJNb9Z+a4hk2hjRd+Eb3Y7kJayD5thwp3xDUhvuaDv62Z4wv
         pKFPVgUPZW5sG4DSqsXmyF4NzDhoEFZzXTNbd6th4Qh38YzrtuO3cXf7flY/vcYu4+wl
         02kw==
X-Forwarded-Encrypted: i=1; AKwUvBznrmnT3QuR1TBIanG6TLsiZn6nlK7xjgPlrEnslCoW1EXMyko1BGDta6Ueru8vDoLPx7vWel7x9ivF3A==@lists.infradead.org
X-Gm-Message-State: AFuF++nOde3wN9RhIgoyFvxcdSWVte3ajs/2A4zg8ZJXQ4hqhUO2LQz0
	QMY7/4lHKW9u7GVPSEnA+R9INGx+1W1BWZQrkFTOogiR5f3hO8IVHGt9N0ggSKv2W9I=
X-Gm-Gg: AYBFou01aWSTIvIxndsclvMbAbvQN1O8B+JJcjArKXcxT+BvzASFkBZ0z7Erz16otJB
	w3twR9naaTv55N++xSYbgD7NWVyKY67LyN09Est0bWhcjG952BGhbw8lquDqVU5Gdk5DD3DIPSv
	ZLnhmsXuxmCzA/XR9813oA4ZmwCnh0IE4Bh3q5JuBiK40Yu3hmtUWIqrYzfWoF4fuFjOSHJsI2z
	sb7OktRg0Ah7layhjmwMH6ls6OdXnUbTWq/SXdfdhO6+ofE5E59//WTX49SPZXDzGIzrQMFydZi
	caoMnxwZ6nhzPwVVtTcRf7esrdctg5n4Z1vKGAj7P1hGScvjrEH5AVVWIoDv+IxxdujYxRriDd4
	sSEzAZVK/5QIgAr0Kc7XvtMed4JAsLPLJRjT6RHEBs1+67hesYTtrXj8VqE6FrIru9uQIfkG628
	mmDR2JyRC4eQt1jJIr89Wt4NCkymwoySkqobsg5SXjYKNdtXnNiXBYvInXZDCYQFQI8uEWlQoBr
	wsMMQmEyatV
X-Received: by 2002:a05:600c:4ecb:b0:4a1:76c9:5408 with SMTP id 5b1f17b1804b1-4a18e4a510emr26609695e9.11.1791540198883;
        Fri, 09 Oct 2026 03:03:18 -0700 (PDT)
Received: from [100.64.0.1] ([147.161.130.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm68317565e9.2.2026.10.09.03.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:03:18 -0700 (PDT)
Message-ID: <d998b030-fe82-4206-bcab-e00a53c4b28e@sifive.com>
Date: Fri, 9 Oct 2026 12:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] riscv: dts: eswin: add I2C controller support
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andi Shyti <andi.shyti@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Min Lin <linmin@eswincomputing.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
 <20260814070007.1662455-7-pinkesh.vaghela@einfochips.com>
 <a55c26e3-1bf0-4ba1-b8b9-14ad76a44a14@sifive.com>
 <BY5PR04MB70253B3321460DCF7ADB54DF838B2@BY5PR04MB7025.namprd04.prod.outlook.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <BY5PR04MB70253B3321460DCF7ADB54DF838B2@BY5PR04MB7025.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_030322_815831_49044B46 
X-CRM114-Status: GOOD (  11.58  )
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

Hi Pinkesh,

On 2026-09-30 3:06 PM, Pinkesh Vaghela wrote:
>>> +             aon_i2c0: i2c@51830000 {
>>
>> Please keep nodes sorted (the aon block controllers go below GPIO, etc.).
> 
> As per DTS coding style document [1], "Order of Nodes" states that
> "Nodes on any bus, thus using unit addresses for children, shall be ordered by unit
> address in ascending order. Alternatively for some subarchitectures, nodes of the 
> same type can be grouped together, e.g. all I2C controllers one after another even
> if this breaks unit address ordering."
> 
> Do you still prefer to change order?

Yes. I believe the alternative option is allowed because a few platforms were
already doing things that way, to avoid forcing them to change. However, for a
new platform, it is best to follow the recommended pattern; simple numerical
order is easier to understand, verify, and automate with tooling (which is on
the way).

Regards,
Samuel

> [1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> 
> Regards,
> Pinkesh
> 
>>
>> Regards,
>> Samuel
>>
>>> +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
>>> +                     reg = <0x0 0x51830000 0x0 0x8000>;
>>> +                     interrupts = <290>;
>>> +                     clocks = <&clk EIC7700_CLK_GATE_AON_I2C0_PCLK>;
>>> +                     clock-names = "ref";
>>> +                     clock-frequency = <100000>;
>>> +                     resets = <&reset EIC7700_RESET_ANO0>;
>>> +                     #address-cells = <1>;
>>> +                     #size-cells = <0>;
>>> +                     status = "disabled";
>>> +             };
>>> +
>>> +             aon_i2c1: i2c@51838000 {
>>> +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
>>> +                     reg = <0x0 0x51838000 0x0 0x8000>;
>>> +                     interrupts = <291>;
>>> +                     clocks = <&clk EIC7700_CLK_GATE_AON_I2C1_PCLK>;
>>> +                     clock-names = "ref";
>>> +                     clock-frequency = <100000>;
>>> +                     resets = <&reset EIC7700_RESET_ANO1>;
>>> +                     #address-cells = <1>;
>>> +                     #size-cells = <0>;
>>> +                     status = "disabled";
>>> +             };
>>> +
>>>               gpio@51600000 {
>>>                       compatible = "snps,dw-apb-gpio";
>>>                       reg = <0x0 0x51600000 0x0 0x80>;
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
