Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8B510F3DE2
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 10:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUd7YsprAEBU4TDajbI8jjnqzU51me2ykv6KxUikduI=; b=3dwZHxxzFk60Du
	vzgxJtKLFjlIzWUi2EHz/k4QxkStluswBWX5x7+ATRHKcqTMiU6G3we8Tbr+9DAyp3/LvTdgyUR9f
	xs6vWs5vNDJ2NAd44juIba/dJMSg9VW+xpvPHKxaNfWz+9ng/r3gseDJuwSk6xxcB0ikW67aK4BX+
	j38XjOdxI+qxgQTzoPWGcYBylmUscM8yZLnQq90IiK5fWDBplG/KA+Du18f28m+hwaFVUOY5mTn6+
	K54Z7HVLoyN6TvOadkP5Rr+zKkWwyddsWjf9fHsxC0XxaQnLLOc/fiKHnRv4nfs2Lu0rshOxMip5a
	H1M55FAzhM6Kv1XyNTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QZh-00000008oAe-3ids;
	Sat, 28 Mar 2026 10:07:25 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6QZf-00000008oA5-1Lmi
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 10:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1774692426;
	bh=0cKj4w/RJV1m1gcNIGNio+JSd8YlUtnzI9F2nKGcT7M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hw0DqWWhur0gexv3gtWUongGMUClFHEkv2c0X51pRwzqgXk8slMSFDIk/Ne/b78LJ
	 kWoT0chyignLYAJ/DaeP+pj+F97AIiiZMiYKNit8PFB+qrjipuEx//+YGAPGAa1e1N
	 oPzva9MS0FUzQMdhCBMfs2C0DnT2vwMjLRpzarfRxra4rYhJc48ISePjCPum5qf5pP
	 29gM8/YFhZGRwNVuydF5pKoK2D9xYN6BW7jsuCMpCyS8LBsO1AybXw+D5PrN+SCovn
	 VkYuMfxELSEtDiBLqQg6USwk36L/08ehbxbxQXqXC/dt3K7/cwUxRlfexbXZcvdRkt
	 DACxNIKOqvMTA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id D35C4B22177E;
	Sat, 28 Mar 2026 11:07:04 +0100 (CET)
Message-ID: <a77f7c9c-4357-47df-95e1-f6e0f5a7c02f@freeshell.de>
Date: Sat, 28 Mar 2026 03:07:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
To: Ilya Sorochan <k0tran@altlinux.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Conor Dooley <conor@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
 <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
 <DHCYMK8FEH10.1Y1YWLL3J1HSK@altlinux.org>
 <ff792101-61e3-4470-9c5c-eea375edc9fa@freeshell.de>
 <DHDFR4K758TP.291K17J2J5VL7@altlinux.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <DHDFR4K758TP.291K17J2J5VL7@altlinux.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_030723_825436_0CEE583A 
X-CRM114-Status: GOOD (  23.51  )
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

Hi Ilya,

On 3/27/26 01:52, Ilya Sorochan wrote:
>> On 3/26/26 12:27, Ilya Sorochan wrote:
>>> On Thu, Mar 26, 2026 at 07:36:07AM -0700, E Shattow wrote:
>> ...
> 
> Sorry, I'm not trying to be disrespectful. Yes, it's my first time. Kernel docs
> bewarn of spamming therefore I trimmed CC based on the assumption that those who
> interested in devicetrees are present in devicetree lists. I guess it is not
> true which seems strange to me, but okay.

$ scripts/get_maintainer.pl arch/riscv/boot/dts/starfive/jh7110-common.dtsi
...Conor... (maintainer:STARFIVE DEVICETREES)
...linux-riscv... (open list:STARFIVE DEVICETREES)
...devicetree... (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
BINDINGS)
...linux-kernel... (open list)
RISC-V ARCHITECTURE status: Supported

Not all maintainers are subscribed to all lists or even any lists. Some
just occasionally search lore mailing list archives

https://lore.kernel.org/linux-riscv
https://lore.kernel.org/linux-devicetree
https://lore.kernel.org/lkml/

if there's not CC directly to them.

Additionally to making sure your patch reaches its audience for review,
there are automated testing "Patchwork" which for LKML RISC-V

https://patchwork.kernel.org/project/linux-riscv/list/

breaks if you are not CC at least linux-riscv mail list. Threading
breaks in multi-patch series or series with cover letter if any of the
messages have different recipient ordering. Broken threading and missing
automated testing equals confused reviewers.

Note that special for StarFive SoC is Conor has responsibility for this
whereas the more recent usual delegation of responsibility to SoC or
vendor specific mail lists and git trees. SpacemiT development as a
recent example following the new pattern of delegation has its own
spacemit mailing list and git repo whereas starfive development sits on
linux-devicetree mailing list and co-habitation of Conor's devicetree
git repo because Conor is both a devicetree maintainer and adopted this
responsibility years ago when the StarFive SoC's were new.

Congratulations on your first patch to Linux Kernel :)

> 
> I'm not asking to support this feature properly. It would be nice to have but
> it is hard and StarFive is not making it any easier. However I'm asking to keep
> it working while you can if you can. It worked for me and other people and we
> would appreciate if you can delay breaking it as long as possible.
> 
>>> I traced this property a little in the U-Boot repo:
>>> - 503fc8548197 Hal added it to VisionFive v1.3b (with mmc pins)
>>> - 6bbe95ef7208 Hal moved it (and other common things) into
>>>   jh7110-common-u-boot.dtsi
>>> - 27f617019dd0 E removed it with jh7110-common-u-boot.dtsi
>>> - 762f85bb2e36 Tom squash-updated upstream dts
>>>
>>> New device trees did not contain this property. This is how they were introduced
>>> into the Linux: b127dbf9e1ebbfbcded4 ("riscv: dts: starfive: Add mmc nodes on
>>> VisionFive 2 board")
>>>
>>> I do not know if this miss is intentional or not. However it would be nice to
>>> be able to boot from SD-card again.
>>
>> There is already nothing to prevent you from booting Linux from SD-card,
>> with U-Boot SPL and U-Boot Main located in SPI Flash as is recommended
>> by StarFive officially.
> 
> Yes. However I'm implying the deprecated SDIO3.0 way. I agree that this would be
> nice to have in the commit message - if this what are you talking about.
> 
>> I'm glad you sent a patch, but I still object for the other reasons
>> mentioned.
> 
> I'm glad to talk to competent people in this space, however I still hope that
> the kernel will refrain from breaking this feature until it is really necessary.

I hope you'll continue on to review the BootROM r.e. effort and cite its
code snippets in patches so adding bootph-pre-ram hints covering the
eMMC SPL boot method from StarFive Loader, retrospectively describing
the SD Card SPL boot method from StarFive Loader, and/or secure boot
crypto accelerator functionality in the starfive crypto driver (what
does command=8 and command=9 do exactly?) The exact nature of the bug in
StarFive Loader UART XMODEM incompatibility could use a proper
description, and SPI Flash configuration parameter analysis, too.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
