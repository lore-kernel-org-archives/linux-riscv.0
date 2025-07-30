Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A59C87FCB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 03:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=dqN3PWpnSSCqeTV5iM/gFwoaXMjhk5mQPqBvEFJouAc=; b=H6mx0eR9g/PrqG
	nLC8UY83Erbzpj9Tmj3CF0sJtFwaEphdzxagaS2YS6nFF5EsCPPI0sj6kBYrSTeJ6Kc6Z9hNDPJ1z
	POcAaFcVtSISxj6ojzn7ke1IH6h+p1gTOFNyKnGsgmpJLCbBMnVjSibz4nhV7upUVLDM6QeDKTgzL
	t/kxnoge9Nbry5oKy+WdntYOfZ0qiEMgkbc6EfpEsRj/7xc/VtIcyNv4WLKcK5C0vCxubeWhNxlEc
	7bsBuudl8NDmnq1++w/xJTKsOVrJBUJPiGtcWO/GbO273IceZ3oDDyOjyP0bGxfk7wJeqLeWlQtlP
	HzUx4PITgKBTAyZ2HdJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugxXm-00000000cGI-3Str;
	Wed, 30 Jul 2025 03:31:54 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugxXi-00000000cFo-3wzp
	for linux-riscv@lists.infradead.org;
	Wed, 30 Jul 2025 03:31:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753846298; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ezBzqJB56c1miHFXcMTWwIQnARYDgvONAST09HSTlXIdTc5Oyuwbece6Q6hbRu19qzxpXQyP+Ri8d4HmC8T0TzjsSVuuFn3W5IoKFG5ZJjTlXM+xKpqoSUyDs5RsKpx6ZpjVuzUAnh60Uk8dT2x+V46NU0ESTv9mRB3w00VvNPQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753846298; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0iSJ3Kr1iquFsEaFYZYQunG3FhEI8rJM6UK4xjhKbMo=; 
	b=laocn2/YpsMzSuK4/HJD3XQbkTjgCDnYQbkYgdDSEqiQg5bs3ggxrpue5V0qtTl49tiJx8WX4odNOEAoB09qAn6D/FUbN8VTDB9PGHNP0JAKZTVCTbw0xWd8jzHpCeMEdxcgjp2FNSCuYbPT32zZ5dHv1GZctaG0IH17VOlKlsw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753846298;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0iSJ3Kr1iquFsEaFYZYQunG3FhEI8rJM6UK4xjhKbMo=;
	b=anpXcqJ7jz1fCyVmJQqEwO4uGzIAJAiI6kljdDFlpHkpMQxAdUXzHh1xk1MHCjz5
	u9ZSDGcNFQGowrt9ieLYx9YPwiRnEBYMyQAPjmv39JtD/kWZyYj3RveK762QmuPhRwX
	QSPODxowaRR76HgP8cBd648UVYPNL+d0Naz8k8H4=
Received: by mx.zohomail.com with SMTPS id 1753846295024259.9063222071202;
	Tue, 29 Jul 2025 20:31:35 -0700 (PDT)
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
In-Reply-To: <f1b90b0f-f7a7-4117-9d36-046c4ca9c19a@kernel.org>
Cc: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
	 CV1800B SoC
Message-ID: <1856e9e7bfdcb6a8.1f73e6be0161d31f.3ad0845628cf3b62@Jude-Air.local>
Date: Wed, 30 Jul 2025 03:31:26 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_203151_363316_FC568F64 
X-CRM114-Status: GOOD (  16.03  )
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

On 29/07/2025 08:27, Krzysztof Kozlowski wrote:
> On 28/07/2025 19:13, Junhui Liu wrote:
>>>
>>>> +    description:
>>>> +      This property is required only if the rpmsg/virtio functionality is used.
>>>> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
>>>> +    items:
>>>> +      - description: mailbox channel to send data to C906L
>>>> +      - description: mailbox channel to receive data from C906L
>>>> +
>>>> +  memory-region:
>>>> +    description:
>>>> +      List of phandles to reserved memory regions used by the remote processor.
>>>> +      The first region is required and provides the firmware region for the
>>>> +      remote processor. The following regions (vdev buffer, vrings) are optional
>>>> +      and are only required if rpmsg/virtio functionality is used.
>>>> +    minItems: 1
>>>
>>> Why isn't this constrained?
>> 
>> Do you mean a maxItems should be added here?
>> >>
>>>> +    items:
>>>> +      - description: firmware region
>>>> +      - description: vdev buffer
>>>> +      - description: vring0
>>>> +      - description: vring1
>>>> +    additionalItems: true
>>>
>>> No, drop. This needs to be constrained.
>> 
>> My intention is that RPMsg/OpenAMP is not the only use case for
> 
> We don't allow such syntax, that's not negotiable. Why 322 redundant
> memory regions are fine now?
> 
>> remoteproc. There are scenarios where the remoteproc is just used for
>> booting the remote processor without any communication with Linux. In
>> such case, only the firmware region is needed, and the other regions may
>> not be necessary.
>> 
>> Additionally, the remote processor might reserve extra memory for custom
>> buffers or other firmware-specific purposes beyond virtio/rpmsg.
>> Therefore, I think only the firmware region should be required and
>> constrained, while allowing flexibility for additional/custom memory
>> regions as needed.
> 
> So how does this work exactly without the rest? Remote processor boots
> and works fine? How do you communicate with it?
> 
> Please describe exactly the usecase.

Thank you for your clarification.

The C906L remoteproc can run at two use cases:
1. Standalone mode: Only the firmware region is used. In this case, the
   remoteproc driver loads the firmware into the firmware region and
   boots the C906L. The C906L runs independently, without communication
   with Linux, and the mailbox is not used.
2. OpenAMP/RPMsg mode: The firmware region, vdev buffer, and vrings are
   used. In this scenario, the C906L runs firmware with OpenAMP support
   and communicates with Linux via the virtio memory regions and mailbox.

To summarize:
- Required: firmware region
- Optional: vdev buffer, vrings, mailbox

Then I can add a "maxItems: 4" to the memory-region property and remove
the "additionalItems: true" line.

Is this approach acceptable for you?

> 
> 
> Best regards,
> Krzysztof

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
