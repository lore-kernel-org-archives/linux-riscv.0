Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9C2C87FC9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 08:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=g2tRdsKNsR1Y0kyCSL6NioUaUQbIFNSC48VB5zPVidk=; b=fG9aVqHwHMLLxh
	ytLlYAugKVIcU66qF72c3jq5AgVez7Q4DTn2vfJiNqIOq0k+wwT7R/v+FLthe4jFh4kpoPcNvEtCh
	daocf860duh5FaTV+JhyKuCLecZt7zBaeFAAClwcGVK/5Etjg5G39A3X6KSWr1+t1DrEDTpcgTKKg
	X1VFa50fAcjWEindfqEq5ELr6EHSyzbBQjqeQT10d+yaI/RvglzQP5UVBsFoKDH5tpeY1NOLuzZHr
	U9M4fq9JLMr+J7uBUy4JRSxq+H0q1GkdS+w7X8iyLIz1h05FtorzllkzQyqsUDTyTGjTnEu6+/uuw
	juGCMQ+QNFW4VXFioiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2f2-0000000139v-3w3l;
	Wed, 30 Jul 2025 08:59:44 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2ey-0000000138U-3mNO
	for linux-riscv@lists.infradead.org;
	Wed, 30 Jul 2025 08:59:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753865965; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dNfxMXyAnla49jgW2c33xHrSsnCggRDCEiFeTdIXjfFUmpfljsfPKOiMLp/QLeaajFG7peB83sJw1wXGO/ethj54yKdwGZaJGAYSflOEvmjqdUIFuBfbN6y1/FzPNqApyAbuMV3hUSyJUnRBdIlhIOz4dDlZThzWXyhKVFgYauY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753865965; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=csMH/a7CuLi98rP76wPm7ik8nJt/5CG8BcS5XgZHGLg=; 
	b=PPNHY3uSej9nroHf+4DNi01S2utAi6nULNvFsL25YhqtSZ9cwqrvhxuggej9LYQ03D81CfYXRy73tld7AbfTTgfx36wjT1km0Ez3+6/cmRkZAYhkaDXMjVCmE9Nmb3R/u3leuQ/McJ0FqbC6+n3Xi6Sa7MmSNeQgfsbn/xdp8Cg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753865965;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=csMH/a7CuLi98rP76wPm7ik8nJt/5CG8BcS5XgZHGLg=;
	b=XZ2Qt22C76deLVeeGbB2YCX999Qnds7uWW9D+fwyb45w3adog+fCgeyAUbvrJLts
	Q/RXV38I8LD65rYGJNzY3SZORT1mTgaKt03BF6aF7S+WBn6icemRklr81CGUH5hpzIx
	S4pSORWmcrcaFHZLk4xEPjq6Kw32SrKpakN2BLEU=
Received: by mx.zohomail.com with SMTPS id 1753865961898804.817941782255;
	Wed, 30 Jul 2025 01:59:21 -0700 (PDT)
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
In-Reply-To: <bfvsmafcsxy4gr4dsprn4z4yl2lltgje2oilsny7vanb7rsolq@t2prbsfisioc>
Cc: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
	 CV1800B SoC
Message-ID: <1856fbcb55769ae0.5ecf256b8267239e.f51806827c8576a5@Jude-Air.local>
Date: Wed, 30 Jul 2025 08:59:15 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_015941_309832_4C18635C 
X-CRM114-Status: GOOD (  32.80  )
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

On 30/07/2025 14:05, Inochi Amaoto wrote:
> On Wed, Jul 30, 2025 at 03:57:09AM +0000, Junhui Liu wrote:
>> On 29/07/2025 16:31, Inochi Amaoto wrote:
>> > On Mon, Jul 28, 2025 at 07:03:23PM +0800, Junhui Liu wrote:
>> >> Add C906L remote processor for CV1800B SoC, which is an asymmetric
>> >> processor typically running RTOS.
>> >> 
>> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> >> ---
>> >>  .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 79 ++++++++++++++++++++++
>> >>  1 file changed, 79 insertions(+)
>> >> 
>> >> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
>> >> new file mode 100644
>> >> index 0000000000000000000000000000000000000000..2061c2fd6ba343c09b1a91700ea4a695d2b57f81
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
>> >> @@ -0,0 +1,79 @@
>> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> >> +%YAML 1.2
>> >> +---
>> >> +$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
>> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> >> +
>> >> +title: Sophgo C906L remote processor controller for CV1800B SoC
>> >> +
>> >> +maintainers:
>> >> +  - Junhui Liu <junhui.liu@pigmoral.tech>
>> >> +
>> >> +description:
>> >> +  Document the bindings for the C906L remoteproc component that loads and boots
>> >> +  firmwares on the CV1800B SoC.
>> >> +
>> >> +properties:
>> >> +  compatible:
>> >> +    const: sophgo,cv1800b-c906l
>> >> +
>> >> +  firmware-name:
>> >> +    maxItems: 1
>> >> +
>> >> +  mbox-names:
>> >> +    items:
>> >> +      - const: tx
>> >> +      - const: rx
>> >> +
>> >> +  mboxes:
>> >> +    description:
>> >> +      This property is required only if the rpmsg/virtio functionality is used.
>> >> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
>> >> +    items:
>> >> +      - description: mailbox channel to send data to C906L
>> >> +      - description: mailbox channel to receive data from C906L
>> >> +
>> >> +  memory-region:
>> >> +    description:
>> >> +      List of phandles to reserved memory regions used by the remote processor.
>> >> +      The first region is required and provides the firmware region for the
>> >> +      remote processor. The following regions (vdev buffer, vrings) are optional
>> >> +      and are only required if rpmsg/virtio functionality is used.
>> >> +    minItems: 1
>> >> +    items:
>> >> +      - description: firmware region
>> >> +      - description: vdev buffer
>> >> +      - description: vring0
>> >> +      - description: vring1
>> >> +    additionalItems: true
>> >> +
>> > 
>> > Why not allocating these region dynamicly? I do not think firware is
>> > always avaible before staring. Allowing dynamic firmware give us max
>> > flexiblity.
>> 
>> I'm afraid it's not easy to do this.
>> 
>> For firmware region, the RTOS firmware usually needs a physical address
>> to link to, and I have researched and tested two RTOS (RT-Thread and
>> Zephyr) on the C906L, both of them do not support position-independent
>> execution or runtime relocation. Therefore, a reserved memory region is
>> needed to provide a fixed physical address for the RTOS firmware.
> 
> I think it is simple and possible to add PIE support for these RTOS. As
> the memory of CV18XX is limited, I do not want to see some reserved
> regions. This may hurt users who do not need this.

Thank you for sharing your concern about the limited memory.

However, I think I have to wait until some RTOS supports PIE before I
can continue to advance this patch series. At least I haven't found any
guide on compiling RTOS firmware with PIE support for the two RTOSs
(RT-Thread and Zephyr) I'm currently testing on the C906L.

Besides, I have searched the existing remoteproc drivers in the kernel,
and haven't found any driver using dynamic memory allocation for the
firmware region. It may take some time to implement this feature if we
really need it on CV18XX SoCs.

> 
>> (In fact, there is already a reserved memory region for the C906L in
>> cv1800b-milkv-duo.dts)
> 
> This is just preserved for vendor zsbl and I have a plan to remove it.
> Always let linux take care of all memory. It is good to support all
> firmware implementation for CV18XX.

Got it.

> 
> I think it is always good to use remoteproc like this:
> https://www.kernel.org/doc/html/latest/staging/remoteproc.html
> 
>> 
>> For virtio-related regions, the RTOS firmware also needs to know the
>> shared memory regions for communications at compile time.
>> 
> 
> I think you should investigate this and check if there is something you
> missed. I haven't see any reserved region in remoteproc binding mentions
> virtio.

Currently, in Zephyr, the only boards with OpenAMP sample support are
the i.MX and STM32MP series [1]. Both of them define reserved memory
regions for virtio and vrings in their respective Linux kernel device
trees [2][3]. These are the only available reference targets I have at
the moment.

Furthermore, searching for the keyword "vring" in the remoteproc
bindings yields many results, which I believe mostly pertain to reserved
memory regions for rpmsg/virtio.

$grep "vring" -r Documentation/devicetree/bindings/remoteproc | wc -l
24

So, at present, all my references use reserved memory for firmware
regions (unless there is specific memory for the processor in hardware)
and for virtio-related regions. Do you think there is anything I might
have missed, or should some new feature be implemented?

[1] https://github.com/zephyrproject-rtos/zephyr/tree/main/samples/subsys/ipc/openamp_rsc_table/boards
[2] https://github.com/torvalds/linux/blob/v6.16/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi#L33-L49
[3] https://github.com/torvalds/linux/blob/v6.16/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts#L68-L97

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
