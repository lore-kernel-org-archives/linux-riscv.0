Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C18BC83F26
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=w3XeW7oVS1NcL6seuRuhvChJsEAfHYeQ9ZVRQfA7NV0=; b=2sxmpGlFfp68hV
	REEOMfGMJVBZnHWnTG6l18rCXv9nnkuE/XDAX+mtM5+m0uTTgwc+5NCc8PUXAoNHIjLuURpVgjhDp
	uUGmoZYp+eK95h6BSfP7KcXDwjBPnxbxKePK6AYppcGx8Dbywu7nMawMkwlMv/HVkyUo9wzvK/GQG
	RkfnJInvYEmxwk0nkXVc/WeuR9AIb7PeC1nP/L2sXvHFlPYcDcc6KIbJ84020T9l1ZM1P3IMbo4JX
	bE3s5FjP9qsSJkmX8WOYckWRWdfmEgkk4CXduL0c9ytddpHedZq33/bl5PqUjCfwwDiGxG/5zhZ/g
	JeX22frRC41DVeKxn4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRn7-0000000F7PU-3X2R;
	Mon, 28 Jul 2025 17:37:37 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRPi-0000000F4ry-2Q3w
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 17:13:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753722797; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DyeAj1vuOJX4gjpudAMnSDJhzX2qgPiz0DuR0Tt1JU/ZcSC/UsHvndDivcenloRdTkILKKSlxF1Ca5zpCaMR4I5vfcCbgANhdz2A9e44OmzlCg0C21OVKbRGcFPO1Zt8F7f2OG1fIW3dLFhkRgkFw9hxtrBT6WRA5V1fOGUmo2E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753722797; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7nyI91Gx9WQnBf9pyvb0BXaqUgm6dK2RhJMrNVE6CmM=; 
	b=CZjkeooRlycc6Dx2U93rSmgTX+y4K5veGDh0fAKEGZB77kVSIAC2c1gZlHhCJPD0RPfkzoOZIx7wxarydXlqpC3kUVl/kIUqL2rL65n1rifqNr2XCdakWor1+j0A+SiliuzoIyqv8MGLVmqC9A/a5lQMwtUeu1upkuV8KW9XsHA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753722797;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7nyI91Gx9WQnBf9pyvb0BXaqUgm6dK2RhJMrNVE6CmM=;
	b=aArmC+xRg0/DrzPIr0y1SP32KRg+iZ922Xd8/MVsJeUNw8cCbu471AAFYdfIYHzM
	991JLY2yILIIoa+zR71Zj9egMIkOr771Ml/sa+g9T8e9ByCjX5hgDGoZA9ToljB1RzG
	bvqeA5SCM5KvJ/JwAQefHK9j2WA0mTJ+JIaxgV9c=
Received: by mx.zohomail.com with SMTPS id 1753722795361320.37867733484927;
	Mon, 28 Jul 2025 10:13:15 -0700 (PDT)
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
In-Reply-To: <3864e374-b045-4317-85bf-ec3a2d3d7940@kernel.org>
Cc: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
	 CV1800B SoC
Message-ID: <185679960f220550.906528684e28f712.ba6c1f3fdd9df549@Mac>
Date: Mon, 28 Jul 2025 17:13:10 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_101327_000383_773D4D8C 
X-CRM114-Status: GOOD (  19.11  )
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

On 28/07/2025 15:11, Krzysztof Kozlowski wrote:
> On 28/07/2025 13:03, Junhui Liu wrote:
>> +
>> +  firmware-name:
>> +    maxItems: 1
>> +
>> +  mbox-names:
>> +    items:
>> +      - const: tx
>> +      - const: rx
>> +
>> +  mboxes:
> 
> First go mboxes, then mboxes-names. ALWAYS.

Thanks, I will fix the order in the next version.

> 
>> +    description:
>> +      This property is required only if the rpmsg/virtio functionality is used.
>> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
>> +    items:
>> +      - description: mailbox channel to send data to C906L
>> +      - description: mailbox channel to receive data from C906L
>> +
>> +  memory-region:
>> +    description:
>> +      List of phandles to reserved memory regions used by the remote processor.
>> +      The first region is required and provides the firmware region for the
>> +      remote processor. The following regions (vdev buffer, vrings) are optional
>> +      and are only required if rpmsg/virtio functionality is used.
>> +    minItems: 1
> 
> Why isn't this constrained?

Do you mean a maxItems should be added here?

> 
>> +    items:
>> +      - description: firmware region
>> +      - description: vdev buffer
>> +      - description: vring0
>> +      - description: vring1
>> +    additionalItems: true
> 
> No, drop. This needs to be constrained.

My intention is that RPMsg/OpenAMP is not the only use case for
remoteproc. There are scenarios where the remoteproc is just used for
booting the remote processor without any communication with Linux. In
such case, only the firmware region is needed, and the other regions may
not be necessary.

Additionally, the remote processor might reserve extra memory for custom
buffers or other firmware-specific purposes beyond virtio/rpmsg.
Therefore, I think only the firmware region should be required and
constrained, while allowing flexibility for additional/custom memory
regions as needed.

> 
> 
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  sophgo,syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      A phandle to the SEC_SYS region, used for configuration of the remote
>> +      processor.
>> +
>> +required:
>> +  - compatible
>> +  - firmware-name
>> +  - memory-region
>> +  - resets
>> +  - sophgo,syscon
> 
> Why mboxes are not required?

The reason is similar to "memory-region" above. The mboxes property is
only needed when RPMsg/virtio communication is used. For some use cases,
the remote processor does not need to communicate with Linux at all, so
the mailbox is not required. Would it be necessary to require the mboxes
property even in scenarios where mailbox communication is not involved?

> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    c906l-rproc {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Thanks for the information, I will change the node name to a generic
"remoteproc" in the example. (Although it's not in the list, I think
it's generic enough)

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
