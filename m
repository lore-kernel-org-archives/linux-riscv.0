Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2F4CDD578
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2024 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asavxbD0MDf4o1MhxOKJQSnL1JcFs2poXM9JDJ3g1oQ=; b=qP4xa1rzDlHd2i
	4NymDE7HXH7gwyCgyVCGwvOlRwtmaNLVt7qOhjq/K7qENDfSgK9/3Dn15GHiypLTBLEEDVmBJJIQ9
	hU4q1oYKc7zXpAizMuXhkSZPt9FmJsvl2BU5T6bIySi2UgZZKToIHQhNgj7BJjZHacFbAhlxOOgAg
	0BsxnNS/mlO66tepbL+KZAnzky+abWlDz4awS/OtKOqcR+LMpQ2HShB7jQShnQ4lYWBdWGVEcHfFt
	bwhEXul3NT8N71DGBsDOGdkX0GefI7+SdoIFvosgZsov5+VbxryM6u9/FMpFaosg9XX0y1PZBywXQ
	d2FqAzFsoOcZlguFGGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srHJ3-0000000ALeT-4292;
	Thu, 19 Sep 2024 13:34:49 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srHIz-0000000ALdz-18u6
	for linux-riscv@lists.infradead.org;
	Thu, 19 Sep 2024 13:34:48 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240919133440euoutp01647db1ff039677fb07ce02253c34ded8~2qJiA1Lcu1074210742euoutp01Q
	for <linux-riscv@lists.infradead.org>; Thu, 19 Sep 2024 13:34:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240919133440euoutp01647db1ff039677fb07ce02253c34ded8~2qJiA1Lcu1074210742euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726752880;
	bh=qdQmGPg1VSoETKo0WkuqbZ5bGtJYIv7EsxGdlDTXxlk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=J8+5Ug+94sMToCkP8VcVChErqdAwMzrQM/gW991Xcp7aENee+obALCkBG4LWQ/6dA
	 4MaGXjIRLcmwMDTUIAPCbGfV8z5WYWUQ7++NKeSg/GVK5b79qwbjqsQsScY1eCPNzy
	 TgxmUIWZVEd5zinlbA6ZOqKt1VAr6G+El6zrg2Lo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240919133439eucas1p2bd40e63a5713a562e52350a503fa7363~2qJhlEd0f1199611996eucas1p2U;
	Thu, 19 Sep 2024 13:34:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 01.8F.09620.F682CE66; Thu, 19
	Sep 2024 14:34:39 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240919133439eucas1p1a3b58253a5ca27bec1de16a4fbf810ab~2qJhCQL3A0314603146eucas1p1c;
	Thu, 19 Sep 2024 13:34:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240919133439eusmtrp241b3dad78a800859ec3fd5d365e9e3aa~2qJhBRxbK2225422254eusmtrp2Q;
	Thu, 19 Sep 2024 13:34:39 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-c1-66ec286f649d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 36.89.19096.E682CE66; Thu, 19
	Sep 2024 14:34:38 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240919133438eusmtip299f5d7d1b3bbe5025126ec0e54560662~2qJgSxhmX1933219332eusmtip2l;
	Thu, 19 Sep 2024 13:34:38 +0000 (GMT)
Message-ID: <ac18a7a4-8249-4903-9d25-eb0d20fffb65@samsung.com>
Date: Thu, 19 Sep 2024 15:34:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 2/3] dt-bindings: mailbox: Add
 thead,th1520-mailbox bindings
To: Rob Herring <robh@kernel.org>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	m.szyprowski@samsung.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20240918203627.GA2069046-robh@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBKsWRmVeSWpSXmKPExsWy7djPc7r5Gm/SDDY/lLHY+nsWu8WaveeY
	LOYfOcdqce/SFiaLF3sbWSyurZjLbvFy1j02i8u75rBZbPvcwmax9shdoNjlHmaLtln8Fv/3
	7GC3aNk/hcWBz+PNy5csHoc7vrB77Jx1l91j06pONo/NS+o9WtYeY/J4v+8qm0ffllWMHpea
	r7N7fN4kF8AVxWWTkpqTWZZapG+XwJVx4VY3Y8E+zYp5K7YyNzB2K3YxcnJICJhI7Py9h72L
	kYtDSGAFo8Sktr1MEM4XRom1mx6zQTifGSVWNqxmhmmZ3NAP1bKcUeL/iy5GCOcto8TWaV3s
	IFW8AnYSC37PYQWxWQRUJeZtfcwKEReUODnzCQuILSogL3H/1gywemGBSImeF48YQWwRAUWJ
	323TWEGGMgvsYpK417qHCSTBLCAucevJfDCbTcBI4sHy+WBDOQXMJaafvsYKUSMvsf3tHGaQ
	ZgmBzZwSrx5eY4e420Xi6NftjBC2sMSr41ug4jIS/3dCDJUQyJd4sPUT1J81Ejt7jkPZ1hJ3
	zv0CBgYH0AJNifW79CHCjhK/Xv1jBglLCPBJ3HgrCHECn8SkbdOhwrwSHW1CENVqElN7euGW
	nluxjWkCo9IspFCZheTJWUiemYWwdwEjyypG8dTS4tz01GLjvNRyveLE3OLSvHS95PzcTYzA
	xHf63/GvOxhXvPqod4iRiYPxEKMEB7OSCK/4h5dpQrwpiZVVqUX58UWlOanFhxilOViUxHlV
	U+RThQTSE0tSs1NTC1KLYLJMHJxSDUxrWM0Ujt3U/9xkdXkbZ3z/nwnLeVvUvk9qLH4dvirm
	+qTaJcGPhAIftdlMy/6vfO2azlWvffbfWG7dr1jKxV4X3vlk5qVVx9wzhS9p/Mx58bRt5dqO
	U9Hbb3DM3GjWqDGj49Uha6sKRS3xZTcif3Qv31mW8oW/1DXkhr26u4+WSQSTIXtr/uZLNZkp
	q862n5v1db3U7dT09z2asj7dx1tO7bIs00w9ktMUHnAluMT2/A8PhoS+pTkrHhvJrjzcf2HN
	0+RFa3Yaz61tfKp1n9nP9u3b1V/eZ8S0GBUEzNXJ+cPPlKK202yug+fFUA3et+fkQ+P7bbiW
	dOScTSgurlq1/0PQ1b16LpxWEc1dT5RYijMSDbWYi4oTAZMSovPrAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsVy+t/xe7p5Gm/SDI7+s7DY+nsWu8WaveeY
	LOYfOcdqce/SFiaLF3sbWSyurZjLbvFy1j02i8u75rBZbPvcwmax9shdoNjlHmaLtln8Fv/3
	7GC3aNk/hcWBz+PNy5csHoc7vrB77Jx1l91j06pONo/NS+o9WtYeY/J4v+8qm0ffllWMHpea
	r7N7fN4kF8AVpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZa
	pG+XoJdx4VY3Y8E+zYp5K7YyNzB2K3YxcnJICJhITG7oZ+9i5OIQEljKKHHi9hNmiISMxLXu
	lywQtrDEn2tdbBBFrxklJmw+xASS4BWwk1jwew4riM0ioCoxb+tjVoi4oMTJmU/AmkUF5CXu
	35rBDmILC0RKnD+3H6xGREBR4nfbNFaQocwCu5gkDn3fA7XhC6NE169uNpAqZgFxiVtP5oNt
	YxMwkniwfD5YN6eAucT009eAbA6gGnWJ9fOEIMrlJba/ncM8gVFoFpI7ZiGZNAuhYxaSjgWM
	LKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECI33bsZ9bdjCufPVR7xAjEwfjIUYJDmYlEV7x
	Dy/ThHhTEiurUovy44tKc1KLDzGaAsNiIrOUaHI+MNXklcQbmhmYGpqYWRqYWpoZK4nzsl05
	nyYkkJ5YkpqdmlqQWgTTx8TBKdXANEPyvN1RKXffko7INrWyl8HcYQnrRQ9X531f9/X3zv6+
	pzGRbMf1Pyz/cfXJlPgI+zlaDcaJnj1HBSd8PBh096nzhIBdQg/9P21cIL991w/pz1E97fYM
	8+uWbfJilDX8/iFQODN+vmumlvA+Mz2r7U6pRQvYfvy/nD9jzbVp0fOnh67M/vTg+ePGk4sU
	M2xSbkz40av5Zcm3pzUVCltzWGZHf5s87YuwwjuBkvZ30zyc/XmUNgfukZQVndUwp3hRaueu
	dAXDWAGP69PnT9uukJgxy7sy8bz8nt3Rk3MPLfUUn7pePW9T1ewNNrsWdUrVTmzcKS71qe/m
	ZKGKrOnOZU958s9JSH7K9U2TLMkTV2Ipzkg01GIuKk4EADy8P5N9AwAA
X-CMS-MailID: 20240919133439eucas1p1a3b58253a5ca27bec1de16a4fbf810ab
X-Msg-Generator: CA
X-RootMTR: 20240918134926eucas1p1df23a583b356505939d4c5501bd6c80f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240918134926eucas1p1df23a583b356505939d4c5501bd6c80f
References: <20240918134901.193033-1-m.wilczynski@samsung.com>
	<CGME20240918134926eucas1p1df23a583b356505939d4c5501bd6c80f@eucas1p1.samsung.com>
	<20240918134901.193033-3-m.wilczynski@samsung.com>
	<20240918203627.GA2069046-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_063445_854807_31DB89DA 
X-CRM114-Status: GOOD (  23.72  )
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


Thank you for your review ! Will make sure all feedback is addressed in
v2.

On 9/18/24 22:36, Rob Herring wrote:
> On Wed, Sep 18, 2024 at 03:49:00PM +0200, Michal Wilczynski wrote:
>> Add bindings for the mailbox controller. This work is based on the vendor
>> kernel. [1]
>>
>> Link: https://protect2.fireeye.com/v1/url?k=385466ab-59df7384-3855ede4-74fe485cbfe7-af60aa2866e904f3&q=1&e=e3a5dfb9-1855-473e-9766-37a7ab5fbec5&u=https%3A%2F%2Fgithub.com%2Frevyos%2Fthead-kernel.git [1]
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  .../bindings/mailbox/thead,th1520-mbox.yaml   | 83 +++++++++++++++++++
>>  MAINTAINERS                                   |  1 +
>>  2 files changed, 84 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
>> new file mode 100644
>> index 000000000000..f446fae76398
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
>> @@ -0,0 +1,83 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +
>> +%YAML 1.2
>> +---
>> +$id: https://protect2.fireeye.com/v1/url?k=8a32b8a9-ebb9ad86-8a3333e6-74fe485cbfe7-0fff00bcf0ce8f57&q=1&e=e3a5dfb9-1855-473e-9766-37a7ab5fbec5&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fmailbox%2Fthead%2Cth1520-mbox.yaml%23
>> +$schema: https://protect2.fireeye.com/v1/url?k=6b7f6c2c-0af47903-6b7ee763-74fe485cbfe7-f082b0e2a978f637&q=1&e=e3a5dfb9-1855-473e-9766-37a7ab5fbec5&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
>> +
>> +title: T-head TH1520 Mailbox Controller
>> +
>> +description: |
> 
> Don't need '|' if no formatting.
> 
>> +  The T-head mailbox controller enables two cores within the SoC to
>> +  communicate and coordinate by passing messages (e.g., data, status,
>> +  and control) through the mailbox channels. It also provides the ability
>> +  for one core to signal the other processor using interrupts.
>> +
>> +maintainers:
>> +  - Michal Wilczynski <m.wilczynski@samsung.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: thead,th1520-mbox
>> +
>> +  reg:
>> +    description: Contains base addresses and sizes for the mailbox and remote ICUs.
> 
> Drop. Redundant.
> 
>> +    items:
>> +      - description: Mailbox local base address
>> +      - description: Remote ICU 0 base address
>> +      - description: Remote ICU 1 base address
>> +      - description: Remote ICU 2 base address
>> +
>> +  reg-names:
>> +    items:
>> +      - const: local_base
> 
> Just 'local'
> 
>> +      - const: remote_icu0
>> +      - const: remote_icu1
>> +      - const: remote_icu2
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: Interrupt for the mailbox controller.
> 
> Drop description. That's obvious.
> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: Clock phandle for the mailbox controller.
> 
> Drop
> 
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ipg
>> +
>> +  icu_cpu_id:
> 
> Needs a vendor prefix and s/_/-/.
> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: CPU ID for the ICU.
> 
> Constraints?

There are a total of four ICU's, so this could be constrained as you
say. Thanks will fix.

> 
> Nowhere in this patch is ICU defined.

ICU stands for Interrupt Controller Unit. Will make sure it's properly
documented.

> 
>> +
>> +  '#mbox-cells':
>> +    const: 2
>> +    description: Number of cells required to encode the mailbox specifier.
> 
> You need to say what each cell contains.
> 
>> +
>> +additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - icu_cpu_id
>> +  - '#mbox-cells'
>> +
>> +dependencies:
>> +  clock-names: [ clocks ]
> 
> Core schema already does this.
> 
>> +
>> +examples:
>> +  - |
>> +    mbox_910t: mbox@ffffc38000 {
> 
> Drop unused labels.
> 
> Standard name is 'mailbox', not 'mbox'.
> 
>> +      compatible = "thead,th1520-mbox";
>> +      reg = <0xff 0xffc38000 0x0 0x4000>,
>> +            <0xff 0xffc44000 0x0 0x1000>,
>> +            <0xff 0xffc4c000 0x0 0x1000>,
>> +            <0xff 0xffc54000 0x0 0x1000>;
>> +      reg-names = "local_base", "remote_icu0", "remote_icu1", "remote_icu2";
>> +      interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
>> +      icu_cpu_id = <0>;
>> +      #mbox-cells = <2>;
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7331b30deef8..49198b2ed2e7 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19719,6 +19719,7 @@ L:	linux-riscv@lists.infradead.org
>>  S:	Maintained
>>  T:	git https://protect2.fireeye.com/v1/url?k=a5b0cb39-c43bde16-a5b14076-74fe485cbfe7-e7359d7be6d6a5b5&q=1&e=e3a5dfb9-1855-473e-9766-37a7ab5fbec5&u=https%3A%2F%2Fgithub.com%2Fpdp7%2Flinux.git
>>  F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>> +F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
>>  F:	arch/riscv/boot/dts/thead/
>>  F:	drivers/clk/thead/clk-th1520-ap.c
>>  F:	drivers/mailbox/mailbox-th1520.c
>> -- 
>> 2.34.1
>>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
