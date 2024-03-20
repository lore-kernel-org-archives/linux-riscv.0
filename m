Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9D5C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 07:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzESmevDWssnsr8zPFItCHJyKHrtPPr3V4AdtIhieoc=; b=zMYs0QtGkcKI7upDlYuXap8Jot
	HcTUv3cAkCaQWZOnyF/r0STxxTH4UJKFam75aOtJrNc63qUR6ifCZSWt7gEthMctdatsESEg31iZC
	8kPohmEWEz9eYZJMc4zigTeo/Igcf7n5cf1L+Y2F/qsn+QgDCyp60fxRfiHUK27qI1PwSemLH8Bc8
	ItlYF8dv36Bhr4Q2CCiblA1jLdvIbEA6Jmu/KvSQBWG3h+QSO0FuLaE0NqEdKOd3UL8apDJ77MlT6
	75j62V0A6OUWf9KHjJf5aa2QWgxyftgBpZImUeyh2WivFdpyFHJ3/G1hnAq6W1uwWdugGCOUgNLGf
	r4txcQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmq7j-0000000FrYF-3RVy;
	Wed, 20 Mar 2024 07:12:31 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmq7f-0000000FrXW-3f9w
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 07:12:30 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3c38f4e18eeso1455596b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 00:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710918746; x=1711523546; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhuMvCo3TgtaW8PwFw7FBLn/PThKgsQ0zRt/0tBJ7iM=;
        b=kHkDo5bxDKyI3Z3aU/+kyky05yyuG2kYrB25UwB9cKCHSuKlX9KQ30Dj0eqrP6jiP7
         ZCQi26t92SZerLUqvlDX04lq7rMGreSrX4DUbJPGifvS/os4t4Bp66bB9gUxDAr+sjSY
         AX0xoAmgslg9SlG8QxBuaMf/8lGi68IdNd7WHH8JMVmTGRnuLHt/icatcssU3MBYNf+m
         fa447jaPieaLiK4+svbSaE6mhBDJzKQFwBLIEG6ft4kUyl5ofp/DVWzI1MWQs7RyNZK9
         MgJ8xHNPLWqbRHJa+crdyh7runxHdWOgY6tMKrg3FTDfPcd39/inNi0JQwWrOkgQWJsi
         sLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710918746; x=1711523546;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhuMvCo3TgtaW8PwFw7FBLn/PThKgsQ0zRt/0tBJ7iM=;
        b=bW3ve0O5BMq6wkMKQ5hQR3q0EK1MqhuntZk64SU4YrQ/hBzFXB/6zjbaO/a1gCGqy+
         OK/RVin+KNvpX50KqxAwzws+1eHzxGFz7pa9DBtEjkmGIxPeHYgljZcKHvWtN4tBWH1W
         twqyjy4Aoo4jaHX7dcP8kv0xEH4ef+QebUvJ6qWLIo1M0wITUjJuNyrh7ixCypvrgbLX
         ogeczbv/D2FejhEoewoRpy5PYtJKdyWcg7PPKAr5bJ7m7U8SVfm4+XB/N2sVris8VoPA
         dUPZwp1Y9fRvyMhTiwrvqpE0/Fi8qnFPgRki3gaWhPbZImGj9GJkQBzPyWwXG+SsnemB
         hWqA==
X-Forwarded-Encrypted: i=1; AJvYcCVagzR1/o+L9rGx8gJjTXHSs987EoSv45wHBsr1ImbCYcsFvtOccaQlb3EZn+bqnmJbUD77dizBVJeBagGmGr67tdDeKEs68HkMTlbQEvCB
X-Gm-Message-State: AOJu0YxAMSXjM7qAvmvEEJK4wArBV1adHd7U5X5JfWIwrCGwWZi+TuAB
	ToI/PrC/f90FqV0BBHlf1FhfySM5xVQ5qWjxSxXFK7g/WidV3vDV
X-Google-Smtp-Source: AGHT+IFYjkAhJU6qgZKZ1Sxu70SlW955OlQtKscMfS6t4l/5ITm8Mj2uH+x1X+AJ/XOFEtz5dOqgiA==
X-Received: by 2002:a05:6808:b04:b0:3c3:59ef:821e with SMTP id s4-20020a0568080b0400b003c359ef821emr4183108oij.48.1710918746273;
        Wed, 20 Mar 2024 00:12:26 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.232])
        by smtp.gmail.com with ESMTPSA id ks11-20020a056a004b8b00b006e647059cccsm10918577pfb.33.2024.03.20.00.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 00:12:25 -0700 (PDT)
Subject: Re: [PATCH v15,RESEND 22/23] PCI: starfive: Offload the NVMe timeout
 workaround to host drivers.
To: Keith Busch <kbusch@kernel.org>, Kevin Xie <kevin.xie@starfivetech.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Minda Chen
 <minda.chen@starfivetech.com>, Conor Dooley <conor@kernel.org>,
 "kw@linux.com" <kw@linux.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "daire.mcnamara@microchip.com" <daire.mcnamara@microchip.com>,
 "emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Mason Huo <mason.huo@starfivetech.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>
References: <ZeCd+xqE6x2ZFtJN@lpieralisi>
 <mhng-87e7ef5a-d60b-4057-960d-41bc901b6c7f@palmer-ri-x1c9>
 <ZedAn8IC+Mpm4Sqz@lpieralisi>
 <ZQ0PR01MB0981BC562E837B232B419AC28229A@ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn>
 <ZfJmMcs2UThVSC4v@kbusch-mbp>
From: Bo Gan <ganboing@gmail.com>
Message-ID: <16a1e6c6-2e2f-08e5-8da0-1462cec57e1f@gmail.com>
Date: Wed, 20 Mar 2024 00:12:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ZfJmMcs2UThVSC4v@kbusch-mbp>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_001227_955291_C3077E45 
X-CRM114-Status: GOOD (  20.56  )
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

On 3/13/24 7:51 PM, Keith Busch wrote:
> On Thu, Mar 14, 2024 at 02:18:38AM +0000, Kevin Xie wrote:
>>> Re: [PATCH v15,RESEND 22/23] PCI: starfive: Offload the NVMe timeout
>>> workaround to host drivers.
>>>
>>> On Mon, Mar 04, 2024 at 10:08:06AM -0800, Palmer Dabbelt wrote:
>>>> On Thu, 29 Feb 2024 07:08:43 PST (-0800), lpieralisi@kernel.org wrote:
>>>>> On Tue, Feb 27, 2024 at 06:35:21PM +0800, Minda Chen wrote:
>>>>>> From: Kevin Xie <kevin.xie@starfivetech.com>
>>>>>>
>>>>>> As the Starfive JH7110 hardware can't keep two inbound post write
>>>>>> in order all the time, such as MSI messages and NVMe completions.
>>>>>> If the NVMe completion update later than the MSI, an NVMe IRQ handle
>>> will miss.
>>>>>
>>>>> Please explain what the problem is and what "NVMe completions" means
>>>>> given that you are talking about posted writes.

Echoing Keith here. Why are you treating NVMe completions + MSI as a special case?
What's special about this combination other than two posted writes? I own JH7110
visionfive 2 boards myself, and if I'm not mistaken, there are two identical PCIe
controllers in JH7110. The first one connects the onboard USB controller of vf2,
which also enables MSI interrupts. How come this exact problem not affecting the
USB controller? The commit message from Minda strongly suggests it does, and also
for R8169 NIC. Thus, why would you suggest the problem is confined to NVMe?

Bo

>>
>> Sorry, we made a casual conclusion here.
>> Not any two of inbound post requests can`t be kept in order in JH7110 SoC,
>> the only one case we found is NVMe completions with MSI interrupts.
>> To be more precise, they are the pending status in nvme_completion struct and
>> nvme_irq handler in nvme/host/pci.c.
>>
>> We have shown the original workaround patch before:
>> https://lore.kernel.org/lkml/CAJM55Z9HtBSyCq7rDEDFdw644pOWCKJfPqhmi3SD1x6p3g2SLQ@mail.gmail.com/
>> We put it in our github branch and works fine for a long time.
>> Looking forward to better advices from someone familiar with NVMe drivers.
> 
> So this platform treats strictly ordered writes the same as if relaxed
> ordering was enabled? I am not sure if we could reasonably work around
> such behavior. An arbitrary delay is likely too long for most cases, and
> too short for the worst case.
> 
> I suppose we could quirk a non-posted transaction in the interrupt
> handler to force flush pending memory updates, but that will noticeably
> harm your nvme performance. Maybe if you constrain such behavior to the
> spurious IRQ_NONE condition, then it might be okay? I don't know.
> 

Also copied Keith's latest reply below, and I also have the same doubt.

> Hm, that may not be good enough: if nvme completions can be reordered
> with their msi's, then I assume data may reorder with their completion.
> Your application will inevitably see stale and corrupted data, so it
> sounds like you need some kind of barrier per completion. Ouch!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
