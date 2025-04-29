Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD2FC369D5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 02:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=7wKT8nK6xbBiy+tKe7jM+BaM0YwndoatUIROE1tPqSg=; b=mJ9z2yLAJgW/Jx
	KyE3w0HFNK8hDfrV9GOrwvLlc92GmGzhtaxzO5PgjVisb7Zdt7RyEmGzHDfUDWKv/r55cVqlQ0oCR
	JYXAOPh9y9p3X426bqGXY36FaO239fTxw8ksu6FsKJJDdIiU8ez4heuglJKuBR55iERO1Sxh0Lm5i
	jWorfXxpWuFxIfq/F8OkJ/wf8Tn1e5VzR+nfjTBX5pd5s8Bz39Z6XKmrRjSTpWDM1TVIkKMavV5bz
	arGtjlvR90vDr4IbeOxTBmg2hpQzgkEcGopWkhmCnO4NoxIEjmbkKTCTSrFjjg25z9ekUF9wQAl8a
	0iZ0jgETN3yGkSGBW8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9aMa-000000082rh-2vq2;
	Tue, 29 Apr 2025 02:06:24 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9aMY-000000082rJ-1Ntu
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 02:06:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745892359; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Tp+ULCb/NX2CXxKOPjWGqBe0fqwgxr9x9CLyvf6rlNPNi2FiD/rBQGGwdvVcvZtL9EIB750v4XP3RrMfar1DR3mH8BxYN1Ky0qJZDJdHleEVSinQSYHF0jz60k59O1xEbj4mcgypzmq8DnuDG+fIrnNm/jGyVL6UImvmBTsy4EA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745892359; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G9pnAX/pTfcnbAMpNAi7zvp1vwdrfPjFEIddTEFp+hs=; 
	b=lFf/P1omGs/txsFeVDKuSI++OXK3BADA4furDSYctP2uJuYuqBrFGb0nczQcjlrK1FXVUUSImAYjifIyfFvvkXWPblY/st3T7wRAmpg5PSo68okLHV2u0YKgDralFA7QTjuTriUyCrPSs5DPyV+c7vqG5LyEVKCQLOn2uCNo0+o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745892359;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=G9pnAX/pTfcnbAMpNAi7zvp1vwdrfPjFEIddTEFp+hs=;
	b=UeGsPCr9GpNvuSdbeFSbgg1lMlumVw5Y3n2BCTEjDObCVF2ZR/ZJrCAQPqAooJ2U
	6v/vOUa627bOphWxQR/KNnxKdTB1U9PKeEbDtGzLNKzmD6Y0WXNRTrGesBJEpc7i4c/
	Tx7tN10wFisKubc2HsWxSqPG7IvvFHKRVF2lZLlw=
Received: by mx.zohomail.com with SMTPS id 1745892356039231.37800848772383;
	Mon, 28 Apr 2025 19:05:56 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Conor Dooley" <conor@kernel.org>
In-Reply-To: <20250428-glade-unripe-4cdb4913ede4@spud>
Cc: "Jassi Brar" <jassisinghbrar@gmail.com>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, "Yuntao Dai" <d1581209858@live.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, <linux-kernel@vger.kernel.org>, 
	<devicetree@vger.kernel.org>, <sophgo@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: add Sophgo CV18XX series SoC
Message-ID: <183aa7d7183c45f8.dee2d6a7f4d6f33a.37931e87d1f102d2@Jude-Air.local>
Date: Tue, 29 Apr 2025 02:05:47 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_190622_755294_D6FACC5D 
X-CRM114-Status: GOOD (  17.83  )
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

Hi Conor,
Thanks for your review.

On 28/04/2025 17:52, Conor Dooley wrote:
> On Mon, Apr 28, 2025 at 08:39:44PM +0800, Junhui Liu wrote:
>> From: Yuntao Dai <d1581209858@live.com>
>> 
>> Introduce the mailbox module for CV18XX series SoC, which is responsible
>> for interchanging messages between asymmetric processors.
>> 
>> Signed-off-by: Yuntao Dai <d1581209858@live.com>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  .../bindings/mailbox/sophgo,cv1800b-mailbox.yaml   | 57 ++++++++++++++++++++++
>>  1 file changed, 57 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5815dc02189c973d681f5b4ff22a9fb7536802b9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
>> @@ -0,0 +1,57 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mailbox/sophgo,cv1800b-mailbox.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Sophgo CV1800/SG2000 mailbox controller
>> +
>> +maintainers:
>> +  - Yuntao Dai <d1581209858@live.com>
>> +  - Junhui Liu <junhui.liu@pigmoral.tech>
>> +
>> +description: |
>> +  Mailboxes integrated in Sophgo CV1800/SG2000 SoCs have 8 channels, each
>> +  shipping an 8-byte FIFO. Any processor can write to an arbitrary channel
>> +  and raise interrupts to receivers. Sending messages to itself is also
>> +  supported.
> 
>> +  Sophgo CV1800/SG2000 SoCs include the following processors, numbered as:
>> +  <0> Cortex-A53 (Only available on CV181X/SG200X)
>> +  <1> C906B
>> +  <2> C906L
>> +  <3> 8051
> 
> I think this section should be moved to the mbox-cells property, since it
> is describing how to use the mboxes property.

You're right. I will move it to the mbox-cells property.

> 
>> +
>> +properties:
>> +  compatible:
>> +    const: sophgo,cv1800b-mailbox
> 
> Remind me, why only a cv1800b compatible when you also mention sg2000?
> Rebranding of the same SoC, or something like that?

Yes, this is some kind of rebranding behavior, as discussed previously
in [1].

And since the behavior of mailbox is consistent between CV18XX/SG200X
when using C906B RISC-V core (Arm-A53 and C906B can't run at the same
time), I only added sophgo,cv1800b-mailbox as a common compatible.

Things will be slightly different when using Arm-A53 core, the receiver
id in the driver will be different. I think a compatible like
sophgo,sg2000-mailbox-a53 can be added to handle it when the A53 core is
ready [2].

link: https://lore.kernel.org/linux-riscv/20240116-music-luckiness-3220a9efdbbf@spud/ [1]
link: https://lore.kernel.org/all/20250316185640.3750873-1-alexander.sverdlin@gmail.com/ [2]

> 
> Cheers,
> Conor.
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  "#mbox-cells":
>> +    const: 2
>> +    description:
>> +      The first cell indicates the channel index (0-7), the second cell
>> +      indicates the target processor ID (0-3) to which messages are sent.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - "#mbox-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    mailbox@1900000 {
>> +        compatible = "sophgo,cv1800b-mailbox";
>> +        reg = <0x01900000 0x1000>;
>> +        interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
>> +        #mbox-cells = <2>;
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
