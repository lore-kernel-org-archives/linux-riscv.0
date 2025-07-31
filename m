Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F55C87FD3
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 14:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tER0A8/DWIoASZ22HA4X1q5S89airy+wzWdA1H5+Rxs=; b=j0gWoJzbDwloNR
	NpCBbXJDoEtpkIZSHNreHEwaXv3WSD941Yu+p7bqduYixrrW1gyTKT6frg6VZjgY1G7qBVDiEm3VP
	dGoBJtt9EAYmmeeBGjO7xUHt9E3tR7qDB1ZAddKAkIfDSMXMaG2SG7Mg4wYvM6AA1a8RAF5pi/9L1
	Z/i6xuRpQ4qcWgbjpEYW+3Dy9SxUthlBn4HL6dCurNFWLGlQ+CyousAG0fF4NBCQ0T4f4SoF5GQTo
	rADsIFqCsS7AlXdzxYYgy2VsUr1OH5nVmgKQM6Bt/cBlrW5YzqV9GujLKzO5a7y6vP37rphHEM7b1
	f6BdBofEMlui7SdoU0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhU8l-00000003oPc-3rHv;
	Thu, 31 Jul 2025 14:20:15 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTSo-00000003iTm-1Dzb
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 13:36:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73E3542D7F;
	Thu, 31 Jul 2025 13:36:48 +0000 (UTC)
Message-ID: <cf49b59f-d39c-4757-a453-6d3c8a09d1ce@ghiti.fr>
Date: Thu, 31 Jul 2025 15:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] riscv: Add support for xmipsexectl
To: aleksa.paunovic@htecgroup.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Raj Vishwanathan4 <rvishwanathan@mips.com>
References: <20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddtleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtgeemtggvtgdtmedutdejfeemsgelsgegmeejvggtkeemheehugdtmeegfhdvvdemieegvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtdegmegtvggttdemuddtjeefmegslegsgeemjegvtgekmeehhegutdemgehfvddvmeeigedvkedphhgvlhhopeglkffrggeimedvrgdtgeemtggvtgdtmedutdejfeemsgelsgegmeejvggtkeemheehugdtmeegfhdvvdemieegvdekngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduledprhgtphhtthhopegrlhgvkhhsrgdrphgruhhnohhvihgtsehhthgvtghgrhhouhhprdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvth
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_063654_487751_A1E6E91C 
X-CRM114-Status: GOOD (  19.64  )
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

Hi Aleksa,

On 7/24/25 17:23, Aleksa Paunovic via B4 Relay wrote:
> This patch series adds support for the xmipsexectl vendor extension.
> A new hardware probe key has also been added to allow userspace to probe for MIPS vendor extensions.
>
> Additionally, since the standard Zihintpause PAUSE instruction encoding is not supported on some MIPS CPUs,
> an errata was implemented for replacing this instruction with the xmipsexectl MIPS.PAUSE alternative encoding.
>
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
> Changes in v5:
> - Add MIPS.IHB and MIPS.EHB instructions
> - Rebase on alex-for-next
> - Address other smaller comments pointed out by Alexandre
> - Link to v4: https://lore.kernel.org/r/20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com
>
> This is a continuation of a previous series, which did not implement the full
> xmipsexectl vendor extension. The title was updated accordingly.
>
> Changes in v4:
> - Add support for the xmipsexectl vendor extension
> - Remove the ifdef/else from errata_list.h
> - Replace the ifdef/else with a hwprobe call in the userspace code.
>
> Link to v3:
> https://lore.kernel.org/linux-riscv/20250129131703.733098-1-arikalo@gmail.com/
>
> ---
> Aleksa Paunovic (6):
>        dt-bindings: riscv: Add xmipsexectl ISA extension description
>        riscv: Add xmipsexectl as a vendor extension
>        riscv: Add xmipsexectl instructions
>        riscv: hwprobe: Add MIPS vendor extension probing
>        riscv: hwprobe: Document MIPS xmipsexectl vendor extension
>        riscv: Add tools support for xmipsexectl
>
> Djordje Todorovic (1):
>        riscv: errata: Fix the PAUSE Opcode for MIPS P8700
>
>   Documentation/arch/riscv/hwprobe.rst               |  9 +++
>   .../devicetree/bindings/riscv/extensions.yaml      |  6 ++
>   arch/riscv/Kconfig.errata                          | 23 ++++++++
>   arch/riscv/Kconfig.vendor                          | 13 +++++
>   arch/riscv/errata/Makefile                         |  1 +
>   arch/riscv/errata/mips/Makefile                    |  5 ++
>   arch/riscv/errata/mips/errata.c                    | 67 ++++++++++++++++++++++
>   arch/riscv/include/asm/alternative.h               |  3 +
>   arch/riscv/include/asm/cmpxchg.h                   |  3 +-
>   arch/riscv/include/asm/errata_list.h               | 13 ++++-
>   arch/riscv/include/asm/errata_list_vendors.h       |  5 ++
>   arch/riscv/include/asm/hwprobe.h                   |  3 +-
>   arch/riscv/include/asm/vdso/processor.h            |  3 +-
>   arch/riscv/include/asm/vendor_extensions/mips.h    | 37 ++++++++++++
>   .../include/asm/vendor_extensions/mips_hwprobe.h   | 22 +++++++
>   arch/riscv/include/asm/vendorid_list.h             |  1 +
>   arch/riscv/include/uapi/asm/hwprobe.h              |  1 +
>   arch/riscv/include/uapi/asm/vendor/mips.h          |  3 +
>   arch/riscv/kernel/alternative.c                    |  5 ++
>   arch/riscv/kernel/sys_hwprobe.c                    |  4 ++
>   arch/riscv/kernel/vendor_extensions.c              | 10 ++++
>   arch/riscv/kernel/vendor_extensions/Makefile       |  2 +
>   arch/riscv/kernel/vendor_extensions/mips.c         | 22 +++++++
>   arch/riscv/kernel/vendor_extensions/mips_hwprobe.c | 23 ++++++++
>   arch/riscv/mm/init.c                               |  1 +
>   tools/arch/riscv/include/asm/vdso/processor.h      | 27 +++++----
>   26 files changed, 298 insertions(+), 14 deletions(-)
> ---
> base-commit: b6a4bae2f16162876842127d7507dad84e404f8f
> change-id: 20250424-p8700-pause-dcb649968e24
>
> Best regards,


Thanks for the v5, I'll take that for 6.17.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
