Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3D9C83000
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Jun 2025 03:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=+PXIzLnk7Udz+8JksSzdAgXJuxae7pvLfW/po2h9uwU=; b=eaamJc/U8xDzNa
	fs9gOJzS2QEQQni3UfazFhPOcYwe600RtMCi1JUIK/lMQbTNR6YjKFWfdtSCsR5UOLd6SMdlZ7Jmv
	BSrw9vjiAD7FJir1SUmjxRxm4HYJwTCDkUlSCENtwAovsRKivxPQ+3lFii0KTlz4YHJomzLTycoqx
	cMbcGefdniqGevrCNlKz2rkPXqwumoAllD+mISN/SDVM3qF1DwuP5lupV/0LM7Rfp6yGJSrQw0gTr
	GfdedGVXvNmMnPBTy/3nNeLgxhPJ0VqwYMuYQzPJzNzoPfpXtXxkpb/kChRDEgJ/ah4ghqQwJJCgB
	uCVXVa3sntVADSs7zEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uViZm-0000000HU3M-1vAY;
	Sun, 29 Jun 2025 03:19:30 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uViZk-0000000HU2y-0PCk
	for linux-riscv@lists.infradead.org;
	Sun, 29 Jun 2025 03:19:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751167152; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c4yg0VkzAxe6/1DNdK0m7HWg28vbCWKpN7647AxuXUIs4+J+5rDNErGq8UbeMNljwV/xVuI/0sxAnPN7hOYsdsuGCr9ok4v3rFqsU8ut8THmnixP2qtIcYIwownOETkyZK21I659cvXMH0P54yFoVCjV/2+3vPt16j8omvc7sOc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751167152; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5sZgel47h61IZI/xBdVfE3mfXZ87n6o+GU/uHbeZ/ug=; 
	b=bRmxTnwIvSybezz3VhAoC9vuoZms4A9yUx0TMg/I9rDiESy6Skst7f1kaMkuWY7N/rlEgzYr7J2QRJ1IxoMXE9URKuFbd+/Wt/knayGd18AwcGmKjo/wbYnUSNz2rmC13BLp5aQKdxVUph3g5lY3l5q3hvmkV0dK86OvfFhI8so=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751167152;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5sZgel47h61IZI/xBdVfE3mfXZ87n6o+GU/uHbeZ/ug=;
	b=TdOoCWJvcKB2dULI/kgdt/2VVSmAs1dfEHjGWJVNfGP+9cviyJ7RvFhpNbPy2bHl
	eooGQ/vp9QZr9rK1RAdOJczhfeWcZLyO27ADykvZBtpUGvZnZr68wbWu1HxriJwwTUR
	W1OtdfKk4iwVBA3zNf1u8vybSyaNxCmsHGTOA3SM=
Received: by mx.zohomail.com with SMTPS id 1751167149312644.3787975589289;
	Sat, 28 Jun 2025 20:19:09 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Rob Herring" <robh@kernel.org>
In-Reply-To: <20250625191613.GA2059062-robh@kernel.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, 
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, <linux-remoteproc@vger.kernel.org>, 
	<devicetree@vger.kernel.org>, <sophgo@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
	 CV1800B SoC
Message-ID: <184d653d449ed7b0.6a3574329a6ead7.ebc417e4db758a3b@Mac>
Date: Sun, 29 Jun 2025 03:19:03 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_201928_508248_BDDEDAB4 
X-CRM114-Status: GOOD (  19.50  )
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

Hi Rob,
Thanks for your review.

On 25/06/2025 14:16, Rob Herring wrote:
> On Sun, Jun 08, 2025 at 10:37:39AM +0800, Junhui Liu wrote:
>> Add C906L remote processor for CV1800B SoC, which is an asymmetric
>> processor typically running RTOS.
>> 
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 68 ++++++++++++++++++++++
>>  1 file changed, 68 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..455e957dec01c16424c49ebe5ef451883b0c3d4a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
>> @@ -0,0 +1,68 @@
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
>> +    $ref: /schemas/types.yaml#/definitions/string
> 
> Already has a type. You just need 'maxItems: 1'.

Will do.

> 
>> +    description:
>> +      The name of the firmware file to load for this remote processor, relative
>> +      to the firmware search path (typically /lib/firmware/).
> 
> That's the same for every 'firmware-name' instance. So drop.
> 
> Is there a default name?

The firmware name would be specified in the board device tree, and
there is no default value. For reference, an example value is provided
in the example DT.

> 
>> +
>> +  memory-region:
> 
>        maxItems: 1

I plan to add a description for the rpmsg-related regions in the next
version. Since the number of these regions may be flexible, I think I
will only add a minItems property to ensure the execution memory
region is specified.

> 
>> +    description:
>> +      Phandle to a reserved memory region that is used to load the firmware for
>> +      this remote processor. The remote processor will use this memory region
>> +      as its execution memory.
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  sophgo,syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      A phandle to the SEC_SYS region, used for configuration of the remote processor.
>> +
>> +required:
>> +  - compatible
>> +  - firmware-name
>> +  - memory-region
>> +  - resets
>> +  - sophgo,syscon
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    reserved-memory {
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +
>> +        c906l_mem: region@83f40000 {
>> +            reg = <0x83f40000 0xc0000>;
>> +            no-map;
>> +        };
>> +    };
> 
> Drop. No need to show how /reserved-memory works here.

Will do.

> 
>> +
>> +    c906l-rproc {
>> +        compatible = "sophgo,cv1800b-c906l";
>> +        firmware-name = "c906l-firmware.elf";
>> +        memory-region = <&c906l_mem>;
>> +        resets = <&rst 294>;
>> +        sophgo,syscon = <&sec_sys>;
>> +    };
>> 
>>

-- 
Best regards,
Junhui Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
