Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78906606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 00:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UJqGV99B;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=g3+MPGUM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T/C5kIFjQbb4RvKihU7KEWwF312F1cz1nj901HdQ1x0=; b=UJqGV99Bu8icORnhNyjXuLJ43t
	4ScbhQlhSkH4jfAVmL9+kwyoNPUX7WmL2MSQ9s7P1GLLuUa8pqIF55RhBvVs22Wd142woLHD4LYKf
	7r1ZE6Qa/62cndZ1nBsCpmWwRFwOnWtkXTHh9mtSUEuh3aHxhhN8+957A0eOLwKv9/wJ7jZkuTX1H
	RbwgVxDhRGNi3LmTLuLlItGbmd56C0YxiK6PDtYeVbo4ywdOy0mpcUU6oI8fCdUttvvw2NVy6cHx7
	yEaIfum2kvDid0vUCtX6yHQ4DEpJUDAnQHLHa6dGzEjFEwIn8AakLmztXs5eJKgK452DMOjHawNQU
	CnnnxTwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW1DA-00000008ASV-39Gv;
	Wed, 25 Nov 2026 00:50:12 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW1D6-00000008ARq-1PjB
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 00:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1795567765;
	bh=JuUwzHWhZZaMYBjv7XG6XqaquyoaNPEepSOTGWcwgfM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g3+MPGUMqcE0pyupobLlvRPp5zb6Ms/XBPfIcuRfmmP7LWJTRk+LMu6bIQWCHbbNw
	 0vDeuPs09oionSBocXBZKwXpxzs0Cz9aNw0QeEmqH+5Lhnpb52GhCnlv840DDmbGbM
	 4VIbEFXLtZwsMmKFC7xXW/yVvnDgFYQVfo5dCoOzmrRvvMfcznQECjx9edTvDTvUDr
	 391/O69rjbk8gKGDcUwtjtwFQy917q4QvPZtNiBDvtzj5+8HE9EhjTySEuRAD1fvfw
	 w9JQYe4VEDtQPsVLSAiYCgYp5iDMBGZn9XdsAlf5DnQJF/LIDhl7OP9jlYlvDmhaSl
	 6rYkvr2lkvr4w==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 93A9EB22081B;
	Wed, 25 Nov 2026 01:49:22 +0100 (CET)
Message-ID: <311a1481-0849-4865-88f4-636f13c2c6dc@freeshell.de>
Date: Tue, 24 Nov 2026 16:49:14 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes
 bootph-pre-ram
To: Yixun Lan <dlan@kernel.org>, Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
 <20261124231909-GKB245721@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261124231909-GKB245721@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_165008_911049_3D64D9C7 
X-CRM114-Status: GOOD (  19.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yixun,

On 11/24/26 15:19, Yixun Lan wrote:
> Hi Hung-Chun, 
> 
> On 17:25 Sat 24 Oct     , Hung-Chun Tseng wrote:
>> On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
>> that stage sets up DRAM. This series marks the nodes it needs for that
>> bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
>> in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
>> the PMIC rails and the SPI NOR in the board files.
>>
>> The vendor confirmed that the BootROM itself does not access the
>> EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
>> sets up SDRAM, and DRAM cannot be trained without it.
>>
>> Testing: all K1 DTBs build, and dtbs_check is clean for them with and
>> without this series.
>>
>> I used Claude to help read the U-Boot SPL and the device trees. I
>> checked the changes and ran dtbs_check myself.
>>
>> Changes in v3:
>> - Reword both commit messages to describe the hardware instead of what
>>   an SPL does, and drop the U-Boot paragraph from patch 1 (E)
>> - Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
>> - Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
>> - Drop the Assisted-by tags, see commit 1e035297ffda
>> - Keep E's Reviewed-by on both patches, as the changes are the ones
>>   discussed on v2
>> - Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/
>>
>> Changes in v2:
>> - Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
>> - Rebase onto the spacemit dt-for-next branch
>> - Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/
>>
>> [1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/
>>
>> Hung-Chun Tseng (2):
>>   riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
>>   riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
>>
> I'd not put this series on hold, we generally could address other
> remains of issue/improvement later. so with
> 
> Reviewed-by: Yixun Lan <dlan@kernel.org>

With regard to mainline U-Boot use of devicetree-rebasing there is a
robust method in U-Boot build system for overrides such that we may
adopt these proposed changes there before they are accepted in Linux.

With changes-requested all addressed for v4 I expect the shape of this
will be good and it is not holding back anything in Linux kernel. The
hold is only due having to ask for what the closed-source BootROM is
doing and waiting for this confirmation now instead of having access to
see its code directly. There are intellectual property warnings
published by SpacemiT prohibiting reverse-engineering the BootROM so it
cannot be expected to proceed any more quickly than asking and waiting
for a reply.

If you would like to abandon the approach I suggest of considering the
effects of BootROM peripheral configuration as a hardware environment
needing device tree description and bootph-pre-ram hints for
constrained-memory SPL, then that topic can also be discussed. Please be
clear what your expectations are, thanks!

-E

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
