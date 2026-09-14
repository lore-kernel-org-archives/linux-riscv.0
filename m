Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18CFC88E72
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 15:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Vj/tz/gljXX7w81waKe7uTVcDldMuWkFASJy9HDRhU=; b=lRdfeUjoFO405z
	JUsqJ2oItbcHNMDvTSH5urrJnH+XRhDKxXcLoUNSetP/TTV8zJALaJXN3sDM8mdmyhPtl9fyRCEG7
	AIvbC8RCt2wEBOYSawtNEJdUnEUrKqkYJAH4ebtl4EDzf6yMur/tEZwDzPJ/SVi9xnTpxdDAULcD8
	PEsP43VfiVhf3fZ9J0Z+zQLvYGqNVFcvFpqKyBj4Wx9gHEyI44az08M6Mdmsh8vRD9H010QEyWbfC
	3vWWkj7odwMbDdfTevUi8LUV62TtAVxBkVYVsP1/fE8lcsNjyecnUqSYuFQdPFR6heM554pc1mmUr
	2RTQRBncGrbLt7vqxm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68OF-0000000485p-46IQ;
	Mon, 14 Sep 2026 15:14:39 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68OD-0000000484V-0ZPG
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 15:14:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789398855; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Irqx1V1AthWJNQBn/S/ODjf+0ExifuYZ8G2sz8z6BTyysw2MaHMYUKgxKRu2DgwCYzMCqKl/xGqhJzOYD0l3gP5xWaARcrRWu0O0HT523IOo5QlyDr4ofFdPWyrO/0OKwTSZUon04K3r0dQLf/7buMuFsm94JHyWcJ5njk9mXW8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789398855; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oRJUYEcqncIkzz6dZZOHcKExune/t93QAkusNCDdmps=; 
	b=fEsrz2QgIOwOlaxu2DOqx0n52Myzrh42iLdVtCAHO0Ak0kVj36796yFLtaSKUc0P4zF3XELOu4uDIKxKWFqVALAD06hIE5VYUvJNdAfEsfvk5MCt4fLcGRsuLvWKl+35fO38YglNvYBJNVxd8ZunqiPpDIZhbEnDmg7OSfgVgn0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789398855;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Reply-To;
	bh=oRJUYEcqncIkzz6dZZOHcKExune/t93QAkusNCDdmps=;
	b=oT3SAa7XsMa0TWFR/bjHksG/1MepRFwrQ4CPzBWQw32HeDlEQBrzytn28+HsXEV1
	sOEyljOcCan5FI/lGw2ur6FooEvtoWmwLz51FUiI6c9gwuyuJ2tzGSpuFJQXGag5F0s
	XsTe0FgS6E7QdXTmAxJ28gmbo/Zy+MUNqlkM9Qao=
Received: by mx.zohomail.com with SMTPS id 1789398853058146.74593238812224;
	Mon, 14 Sep 2026 08:14:13 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 14 Sep 2026 23:14:05 +0800
Message-Id: <DLF4Y9FCAUGU.2INMPZ254T13Z@pigmoral.tech>
Subject: Re: [PATCH v2 0/6] spacemit: k3: Replace bad CLINT node with ACLINT
 nodes
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Bo Gan" <ganboing@gmail.com>, "Junhui Liu" <junhui.liu@pigmoral.tech>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner"
 <tglx@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Inochi Amaoto" <inochiama@outlook.com>, "Radu Rendec"
 <radu@rendec.net>, "Paul Walmsley" <pjw@kernel.org>, "Samuel Holland"
 <samuel.holland@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Anup
 Patel" <anup@brainfault.org>, "Guodong Xu" <docular.xu@gmail.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, "Conor
 Dooley" <conor.dooley@microchip.com>
X-Mailer: aerc 0.22.0
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
 <0f82c603-0ddd-4d01-bf48-56d0ffcd29b0@gmail.com>
In-Reply-To: <0f82c603-0ddd-4d01-bf48-56d0ffcd29b0@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_081437_621632_E467FE74 
X-CRM114-Status: GOOD (  18.35  )
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

Hi Bo,

On Fri Sep 11, 2026 at 4:43 PM CST, Bo Gan wrote:
> Hi Junhui,
>
> Thanks for your patch. This would give me more clarity while reviewing
> the OpenSBI patchset from Troy, and I was wondering why Troy sent this
> https://lore.kernel.org/opensbi/20260908-ipi-clear-all-v1-1-b1bd5d016eb6@linux.dev/T/#u
>
> Now it's much clearer -- K3 has two ways to do IPI, ACLINT and IMSIC.
>
> One thing that may help us further: Can you clarify on the exact meaning
> of "M-mode only"? OpenSBI would use PMP to protect those MSWI/MTIMER
> regions, so I wonder if you meant that it's enforced by the PMP settings,
> or it's *actually* enforced by the device itself (or fabric)? AFAIK, to
> achieve this, the device must have a way to distinguish the privilege-
> level of the CPU at the time it initiated the MMIO request. Hence, the
> core must be putting the privilege level as some kind of attribute in the
> MMIO request. Is that the case in k3? Can you confirm with SpacemiT?

Thanks for pointing this out. I have double-checked and found that my
earlier "M-mode only" description was incorrect. The restriction depends
on the eFuse configuration rather than CPU privilege modes. Under the
relevant eFuse configuration, the non-secure address window becomes
inaccessible, while the secure window remains available. PMP handles
access restrictions based on privilege mode.

I also verified that S-mode can read MSIP and MTIME through the secure
window once PMP allows those reads.

I will correct the explanation and use the secure address window
consistently for all ACLINT components in the next version.

>
> On 9/8/26 09:28, Junhui Liu wrote:
>> When testing OpenSBI with the upstream Device Tree, the CLINT controller
>> failed to function properly with the irqchip.riscv_imsic_noipi boot
>> parameter:
>> 
>>    Platform IPI Device         : aclint-mswi
>>    Platform Timer Device       : aclint-mtimer @ 24000000Hz
>>    
>>    Domain0 Region03            : 0x00000000e081c000-0x00000000e081ffff M: (I,R,W) S/U: ()
>>    
>>    [    0.091014] smp: Bringing up secondary CPUs ...
>>    [   10.104917] CPU1 failed to report alive state
>>    [   20.118689] CPU2 failed to report alive state
>>    [   30.132288] CPU3 failed to report alive state
>>    [   40.145953] CPU4 failed to report alive state
>>    [   50.159604] CPU5 failed to report alive state
>>    [   60.173212] CPU6 failed to report alive state
>>    [   70.186981] CPU7 failed to report alive state
>>    [   70.191411] smp: Brought up 1 node, 1 CPU
>> 
>> Through exploring and testing, I discovered that the K3 actually
>> provides all three complete ACLINT components, and subsequent
>> confirmation with the vendor yielded the following information:
>> 
>> The ACLINT controllers are mapped to two physical memory regions:
>> secure (0xf1810000-0xf1820000) and non-secure (0xe0810000-0xe0820000),
>> with varying accessibility per controller and execution mode:
>> 
>> +---------+--------+------------------------+-----------------------+
>> | Offset  | Module | Secure Region          | Non-Secure Region     |
>> +---------+--------+------------------------+-----------------------+
>> | +0x0000 | MSWI   | 0xf1810000-0xf1813fff  | 0xe0810000-0xe0813fff |
>> |         |        | (M-mode only)          | (Inaccessible)        |
>> +---------+--------+------------------------+-----------------------+
>> | +0x4000 | MTIMER | 0xf1814000-0xf181bfff  | 0xe0814000-0xe081bfff |
>> |         |        | (M-mode only)          | (Inaccessible)        |
>> +---------+--------+------------------------+-----------------------+
>> | +0xc000 | SSWI   | 0xf181c000-0xf181ffff  | 0xe081c000-0xe081ffff |
>> |         |        | (M-mode only if efused)| (M/S-mode Accessible) |
>> +---------+--------+------------------------+-----------------------+
>> 
>> Taking these constraints into account, we choose the secure region
>> (0xf1810000-0xf181bfff) for the M-mode ACLINT components (MSWI and
>> MTIMER), and the non-secure region (0xe081c000-0xe081ffff) for the
>> S-mode SSWI component.
>> 
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>> Changes in v2:
>> - Drop the generic riscv,aclint-* fallback compatibles and use only
>>    SpacemiT K3-specific compatibles.
>> - Match spacemit,k3-aclint-sswi directly in the SSWI driver.
>> - Squash the ACLINT MSWI and MTIMER DT additions into the patch that
>>    replaces the incorrect CLINT node.
>> - Link to v1: https://patch.msgid.link/20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech
>> 
>> ---
>> Junhui Liu (6):
>>        dt-bindings: timer: thead,c900-aclint-mtimer: Add SpacemiT K3
>>        dt-bindings: interrupt-controller: thead,c900-aclint-mswi: Add SpacemiT K3
>>        dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add SpacemiT K3
>>        dt-bindings: timer: sifive,clint: Deprecate spacemit,k3-clint
>>        irqchip/aclint-sswi: Add support for SpacemiT K3
>>        riscv: dts: spacemit: k3: Replace incorrect CLINT node with ACLINT nodes
>> 
>>   .../thead,c900-aclint-mswi.yaml                    |  1 +
>>   .../thead,c900-aclint-sswi.yaml                    |  5 +--
>>   .../devicetree/bindings/timer/sifive,clint.yaml    |  5 ++-
>>   .../bindings/timer/thead,c900-aclint-mtimer.yaml   |  1 +
>>   arch/riscv/boot/dts/spacemit/k3.dtsi               | 37 ++++++++++++++++------
>>   drivers/irqchip/irq-aclint-sswi.c                  |  1 +
>>   6 files changed, 37 insertions(+), 13 deletions(-)
>> ---
>> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
>> change-id: 20260729-k3-aclint-94ca9d3f818f
>> 
>> Best regards,
>> --
>> Junhui Liu <junhui.liu@pigmoral.tech>
>> 
>> 
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> Bo

-- 
Best regards,
Junhui Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
