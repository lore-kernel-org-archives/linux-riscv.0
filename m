Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844A3C87FCB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 03:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=NFA/H7jV18eOPtc3W1dPyfldpIvDkUE7lTmDbW24AFY=; b=0vnNqONlPXLqJq
	b++awcAjB8H1+frSWqsZRTqeBI2q3gPblVZl1sN2/34PUt4kfnT9Ey1gpPj2OqFssmipHoMx3YsgK
	OeojJlBVPSYxzvN0sjx1NBp2qnPjh9FYSA2BoSVeShXPcDTgwv6Ol2QRe1wLJvoew5Me2bzcjwdyM
	KGN6YoUZo/PEpiQv7yK6QxZmaGRC+aS+RXch9SbrUbj8+Ei8CMVV+SQe12p/XEOnBNJb/LXc1RtDd
	7Ht/42Kj/XWD8pn8kdayYe6j530+Nn7xLGuoFTPWGHDzP2+yCp+tvvjo+9DBaf3ibrreo47N8UKxh
	GcE1/dxMaV8+T3PFmshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugxwc-00000000eNO-33Un;
	Wed, 30 Jul 2025 03:57:34 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugxwZ-00000000eN1-1qQU
	for linux-riscv@lists.infradead.org;
	Wed, 30 Jul 2025 03:57:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753847840; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NCuR8+FsGRD+jtnwdfMXS57jZARc++6hqANo5M4wHJXIuSmXFNDZJA+aAe8jF9nHRkYNMTGYOZbkoklz/QH+MYNAaJ9YSS4a/Hn7Jf6QsQzdJKGKcd3iM2w6sLxmYLioTyQYs6PESJsrHMezF7G2Gb9nnJ0UZz1v2SjTHqKXJVM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753847840; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ASOku5JSU5RCbAivVDsH/TwJN9/qPsflUf5UEdZY4Mo=; 
	b=B5qiUKAGkt8yrocZXi+vDyEzG1JGHCwYFheflZLFOUJeDlSnJfkaTTHN1HwG0UmJ2uaauj3iYN0DwG2uyrQmB8MBxifdMnU8pE1jKJXf8raCNLdSOxHn0ktF+SXW8FaMU6Rrtk8V6jb4MCcgRa6Sg2CblZAYIDqtvmJd7EFt/K8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753847840;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ASOku5JSU5RCbAivVDsH/TwJN9/qPsflUf5UEdZY4Mo=;
	b=AdgxG56RP5DB/CKLfrO5XyJbqz+zw8NrzBq8JzcUEIJFwpTCI6B6ZoS3fLYSrjAG
	c9VhF2R7O4V9hQMgZSxHo7M19jJZbvSC2fMUElK4xT8F9ok5nbm7bJ6dsp2B4OslD35
	BJ7iJ02bePpUDvz1N2STaW0/s0AsKa39PVAtWMrE=
Received: by mx.zohomail.com with SMTPS id 1753847836673828.946911370315;
	Tue, 29 Jul 2025 20:57:16 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Inochi Amaoto" <inochiama@gmail.com>, 
	"Bjorn Andersson" <andersson@kernel.org>, 
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>
In-Reply-To: <jcpr5tg7jyyyqmaujegeuq5j3dqz4rrgxfz73rl55l3jibtq63@3w7bzux2b2je>
Cc: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
	 CV1800B SoC
Message-ID: <1856eb4ef9c9b448.51cf78412ad49c56.737f9c77b35de27d@Jude-Air.local>
Date: Wed, 30 Jul 2025 03:57:09 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_205731_833085_F8ED797D 
X-CRM114-Status: GOOD (  15.44  )
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

On 29/07/2025 16:31, Inochi Amaoto wrote:
> On Mon, Jul 28, 2025 at 07:03:23PM +0800, Junhui Liu wrote:
>> Add C906L remote processor for CV1800B SoC, which is an asymmetric
>> processor typically running RTOS.
>> 
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 79 ++++++++++++++++++++++
>>  1 file changed, 79 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..2061c2fd6ba343c09b1a91700ea4a695d2b57f81
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
>> @@ -0,0 +1,79 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Sophgo C906L remote processor controller for CV1800B SoC
>> +
>> +maintainers:
>> +  - Junhui Liu <junhui.liu@pigmoral.tech>
>> +
>> +description:
>> +  Document the bindings for the C906L remoteproc component that loads and boots
>> +  firmwares on the CV1800B SoC.
>> +
>> +properties:
>> +  compatible:
>> +    const: sophgo,cv1800b-c906l
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
>> +    items:
>> +      - description: firmware region
>> +      - description: vdev buffer
>> +      - description: vring0
>> +      - description: vring1
>> +    additionalItems: true
>> +
> 
> Why not allocating these region dynamicly? I do not think firware is
> always avaible before staring. Allowing dynamic firmware give us max
> flexiblity.

I'm afraid it's not easy to do this.

For firmware region, the RTOS firmware usually needs a physical address
to link to, and I have researched and tested two RTOS (RT-Thread and
Zephyr) on the C906L, both of them do not support position-independent
execution or runtime relocation. Therefore, a reserved memory region is
needed to provide a fixed physical address for the RTOS firmware.
(In fact, there is already a reserved memory region for the C906L in
cv1800b-milkv-duo.dts)

For virtio-related regions, the RTOS firmware also needs to know the
shared memory regions for communications at compile time.

So, reserving memory through DT is necessary for now.

> 
> Regards,
> Inochi

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
