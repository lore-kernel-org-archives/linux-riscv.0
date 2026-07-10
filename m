Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35DBC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 12:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rAIjQeYQ1BUxM3QDYAC+YL7btiggP1bgkk1W3UODmk=; b=caNw1jqWbdLOl4
	b47SOzHY97+CnhIrqmreB/h8jpnEeAFepau5/byzUx9n7UooL+bkYFouIVwAgk81qe7hpClVqQjvw
	g1q/6XyUS1y7AEo5RNGyp7ibpXdutFgNRCQsH5P+KDuFlUF92afbAcJtMm426YpM8Za/NplreBksp
	c8VBPCcanQcJMYZicY7zBeyaDJWo4ARvXg4UXe0liPaiuZUuGQEpnrrHeCWve+KrTwgIWJZs2Q2MN
	XryVAzhaP9JrTblXn0epq1BLoarYv/nI/dPF30OrqR2UJ1EXaBKRyGWbJ2lp2iUrnJHkR71WJI03L
	W22KN1QLgjt0P5n2lEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAYj-00000004w2A-1mQ4;
	Fri, 10 Jul 2026 12:42:25 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAYh-00000004w1j-2bsS
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 12:42:25 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-902f92b8504so3390796d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783687342; x=1784292142; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJBwqL8OFuvpdmiP4qvFBor8YyEfp6aV/aiB/sY0dm4=;
        b=TIWBNIdTdlmU5d1UtF5i3vXKRxYVLObImbB6qNHH00W/xMj28+tY5AzYFg/KpFcEwR
         sEAXZXYvFU9m8+s87XNN9NExOADYuUWUQX+yFRwVOA+Ml/Z0NhipNNzGmT0xPkE2hW88
         QXERfnwoYezFKBAuJ/Di4QL7o8oumx/ENjGVRbRWNDnOS5/kwUQxc6aPGOzVnfe0KzTm
         zUmNHQVtRkooAyxo1w1dVo+vB6iZk7Y9l8ncuPmt76YG6J7BzPomYL+AWiUZeh9/QJ9S
         BLTfsewYJRguTAStzhZ0Tuwz9y73YO66EYLMNvGRRBhK2SiSAlZCP3/XmzwK89vatnVK
         bM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687342; x=1784292142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJBwqL8OFuvpdmiP4qvFBor8YyEfp6aV/aiB/sY0dm4=;
        b=UUblgLrFOFikSRCQaawwI53XDFNb0BuXZu9KBWiaGXsx986XinLIdPygzpTNOVEcP8
         HNwxBhWJQD+Ol1oFIWFaS8ndK0FbzT9HNradHDV89+MxqH26pUYAyH+j/3Ertrv7E5FX
         5fffSyuEXrTQh08qvpMMMJdobWC9H/QaSKdkKpI+0cebR6GOCi0tXMfndW3gXLefhCUY
         8wr9rAEaieEFxgMSJthQ1lT2wnBSKmibT80Ovje29mStynF7um3rIlqOPoqafI/u9fwq
         HMj0xxGmcYtDUTCDDz2bQHueNA7UMaELnbH4A/9P6yGrqY4aLe1zUniX7azlXtkyZNZE
         w1kA==
X-Forwarded-Encrypted: i=1; AHgh+RrJLwV30E6y1lZNrp9CvYwosc217ThePlNvKcVb2MxEFjc0Qq/bNH8bFFG72iIzFQg7IRZAG7KrJsFKQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPtl6s5OvY8uRWDM6skLrKCyff5QK/Jr5Tu31jAf6Bnna+n/Ov
	ZWOHgWXoc2iTZiUlgAMft5mlAR2ifFyF4LHimlFnksx2dthYkH9NSxcsntnx3R7gqA0=
X-Gm-Gg: AfdE7cnNQBh65vdTm0kjTSr6ELYULokw3dED8C43GmlRQFAb1XBD6a0v+TJVV+5UVv5
	WAZNp8CIC6TK2qm7KL03Yh37JeNoflrR/KXsl5eH0UoupJtkjwCSIEEYw4eR+pIVma8t9fS5DB7
	e0ky9pEb0WdKXftK/TchRk9JksSpMzTZNylvBpWgu71aLo3d8rabh/m3MH4CzNsK1pJzcXccncJ
	64GAFtDdH6ZX9UmME+/7E8aHJDoWcsOVqT1V8bJ2KVFhVwXe6sJeOV22FV5PAHe14hrrXU6CwOX
	iY0/re3BP0k6/hAhilRjVAAhn8REm1OCVMbuU0VoBurm4CK2ihSHBXVAXohZbvCmpkF3E9hdHPj
	Zbldee5kF2o06/+4jk0+feTRRc63KLMEeCvM52hvY8bfVdtkijPCOS3i1Wy/dr1/eKYaVnb/Ijo
	T36ggsY69CbAjv
X-Received: by 2002:a05:6214:5704:b0:8e9:f5de:d5b5 with SMTP id 6a1803df08f44-8fec3a038a2mr127470696d6.44.1783687341764;
        Fri, 10 Jul 2026 05:42:21 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1d22bsm40069556d6.32.2026.07.10.05.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:42:21 -0700 (PDT)
Message-ID: <3cece33f-375f-4cb2-b07d-e75f065fe5ea@riscstar.com>
Date: Fri, 10 Jul 2026 07:42:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] PCI: spacemit-k1: Add multiple PHY handles support
To: Inochi Amaoto <inochiama@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>,
 Nam Cao <namcao@linutronix.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Xincheng Zhang <zhangxincheng@ultrarisc.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local> <alBNXgMAwXPKwiJ2@inochi.infowork>
 <alCoTEDUY8AO9OzD@ashevche-desk.local> <alDNlfb0_T9g-ATO@inochi.infowork>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <alDNlfb0_T9g-ATO@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_054223_951114_A4978F34 
X-CRM114-Status: GOOD (  14.46  )
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

On 7/10/26 5:55 AM, Inochi Amaoto wrote:
>>>>> +	k1->phy_count = i;
>>>>> +	if (k1->phy_count == 0)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	return 0;
>>>> This doesn't seem correct to me, I would expect phy_count to be assigned only
>>>> when it's valid. (Yes, perhaps 0 is the same as it was, but semantically it's
>>>> different 0 in this case.)
>>> I guess you think 0 is a valid number? I can not understand what you thing
>>> Assign this to 0 if there is no phy is fine to me, which shows there is 0
>>> vaild phy found.
>> Isn't it already 0? Semantically code is wrong in a flow (not in the result).
>>
> In fact it is already 0 here. But I am not understand why you thing is wrong.
> Could you explain it in detail? (Maybe you think it is not good to return
> -EINVAL?)

What Andy is saying is that assigning the value of phy_count
before checking that it is valid is not the expected order of
things.

The point is about best practice, not about the end result.

Best practice would be "don't touch anything if the return
value will indicate an error."

And therefore, better coding practice would be to check for
a bad value, and only after that has been done should you
assign the k1->phy_count value.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
