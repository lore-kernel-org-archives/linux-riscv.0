Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B0BC87FCC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 09:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=MklzSV48AXduafEh1esM3Ubh8dPEL/uU8L6yIJ6tPgY=; b=UqMYhFNeFWMc4E
	+vdFgrhqQHew+qRwuydZ0ds2ZSDebaSj5kzsMsF/dxdmxPIAsc6vmBL9HIZbWlOPMqmwh3ZAwKb0H
	EdT91jRApsBHY4tgd2Fk+JT8bhC49vwv4F3fFM/Ycc6AbupHgKCKlLaJfM0/fXgowTuUzkc+LmQ/T
	9IXIHo03n5tl2rVzLg7IqpHHE7sR6JPlvd2jSVeUh04El+hsrOy3PJ/ltMndayFN4qtot9mbsoTsM
	8xbplorOrIlApydt0cApYRKg5kS/6M5L4cSJIDgwIalDhSzeJsFtlOaDZmywgST+IZk6EkJiPTqID
	lDDdx/681g38jcDKFssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3Uj-00000001AW5-2mWu;
	Wed, 30 Jul 2025 09:53:09 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3UH-00000001APg-05FB
	for linux-riscv@lists.infradead.org;
	Wed, 30 Jul 2025 09:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753869145; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gcHqa9+feDNFMDsVs2TKqy6ps4OyVJb9cCdGcEtwBNrjmGjeKe2b9692OfNvTSkebS7TPb9T/ex/zfkfUW575UsaALHUdCu0wOhLY6Q87piyyd/UF+JylhluhCA3apMrNFK/qmYepeCWytfZXWN5JGER497ny75NlVN8ohay5PE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753869145; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JwbmBBrKqJgjxoU8yUqfgZbbSm+7tkuGLcAqTkpXgSU=; 
	b=SX8fEUcfQE5eeW+CWLFaw6HQGGvEXoPtfXJEYTlBa3peeRDMVd921iLjYWZdYb1/FuZmw20Tj8xo3/zzI5haL5mTXxVkDMoRQ7wmRiGPmklYjPfrOvCcZM6orkSeVbFHrNQaSYgQ0lfCOvN6PWDBZ1Gi7ihxICZRbxffT7egj9g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753869145;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JwbmBBrKqJgjxoU8yUqfgZbbSm+7tkuGLcAqTkpXgSU=;
	b=cSAX2A70YQVbB7mKDqeCL8nckPbab9p/s+ClAjOPv46etJFI1CNgCrlErrY9sW/E
	j2LOIQh7/ZcRJA7lFLxmkD01pPJ/UhNuDmVUtOp0Rb3uWm80B3QEOVCTZJCk2afelsA
	jEREZFw4erDxzPGDRaAXdf1tJFinStnRZNiB/5dE=
Received: by mx.zohomail.com with SMTPS id 1753869143747974.5396900815683;
	Wed, 30 Jul 2025 02:52:23 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, 
	"Bjorn Andersson" <andersson@kernel.org>, 
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>
In-Reply-To: <4137240e-a5c4-427b-900c-ae062aa9a9c8@kernel.org>
Cc: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
	 CV1800B SoC
Message-ID: <1856feaf769f30d8.54513078e677e4a4.cf6de7e2e9832713@Jude-Air.local>
Date: Wed, 30 Jul 2025 09:52:14 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_025241_419970_A37B11EF 
X-CRM114-Status: GOOD (  16.94  )
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

On 30/07/2025 08:47, Krzysztof Kozlowski wrote:
> On 30/07/2025 05:31, Junhui Liu wrote:
>> On 29/07/2025 08:27, Krzysztof Kozlowski wrote:
>>> On 28/07/2025 19:13, Junhui Liu wrote:
>>>>>
>>>>>> +    description:
>>>>>> +      This property is required only if the rpmsg/virtio functionality is used.
>>>>>> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
>>>>>> +    items:
>>>>>> +      - description: mailbox channel to send data to C906L
>>>>>> +      - description: mailbox channel to receive data from C906L
>>>>>> +
>>>>>> +  memory-region:
>>>>>> +    description:
>>>>>> +      List of phandles to reserved memory regions used by the remote processor.
>>>>>> +      The first region is required and provides the firmware region for the
>>>>>> +      remote processor. The following regions (vdev buffer, vrings) are optional
>>>>>> +      and are only required if rpmsg/virtio functionality is used.
>>>>>> +    minItems: 1
>>>>>
>>>>> Why isn't this constrained?
>>>>
>>>> Do you mean a maxItems should be added here?
>>>>>>
>>>>>> +    items:
>>>>>> +      - description: firmware region
>>>>>> +      - description: vdev buffer
>>>>>> +      - description: vring0
>>>>>> +      - description: vring1
>>>>>> +    additionalItems: true
>>>>>
>>>>> No, drop. This needs to be constrained.
>>>>
>>>> My intention is that RPMsg/OpenAMP is not the only use case for
>>>
>>> We don't allow such syntax, that's not negotiable. Why 322 redundant
>>> memory regions are fine now?
>>>
>>>> remoteproc. There are scenarios where the remoteproc is just used for
>>>> booting the remote processor without any communication with Linux. In
>>>> such case, only the firmware region is needed, and the other regions may
>>>> not be necessary.
>>>>
>>>> Additionally, the remote processor might reserve extra memory for custom
>>>> buffers or other firmware-specific purposes beyond virtio/rpmsg.
>>>> Therefore, I think only the firmware region should be required and
>>>> constrained, while allowing flexibility for additional/custom memory
>>>> regions as needed.
>>>
>>> So how does this work exactly without the rest? Remote processor boots
>>> and works fine? How do you communicate with it?
>>>
>>> Please describe exactly the usecase.
>> 
>> Thank you for your clarification.
>> 
>> The C906L remoteproc can run at two use cases:
>> 1. Standalone mode: Only the firmware region is used. In this case, the
>>    remoteproc driver loads the firmware into the firmware region and
>>    boots the C906L. The C906L runs independently, without communication
>>    with Linux, and the mailbox is not used.
>> 2. OpenAMP/RPMsg mode: The firmware region, vdev buffer, and vrings are
>>    used. In this scenario, the C906L runs firmware with OpenAMP support
>>    and communicates with Linux via the virtio memory regions and mailbox.
>> 
>> To summarize:
>> - Required: firmware region
>> - Optional: vdev buffer, vrings, mailbox
> 
> How does your driver behave in (1)? Does it work?

The driver inits the firmware region and loads the firmware into it.
Then it sets the enable bit in the C906L's control register, set the
reset address for the C906L and deassert the reset bit for the C906L to boot it.

Actually, the current driver only supports the first case, and it works.
The second case is not implemented yet, but I believe it can be
supported based on the current code structure. I originally intended to
submit the OpenAMP/RPMsg-related bindings together with the driver
implementation; however, I was advised to finalize the bindings in v1:

https://lore.kernel.org/linux-riscv/PN0P287MB22589781F2D49353E7C66C46FE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM/

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
