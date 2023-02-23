Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A627C636D7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 06:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lkZj3BBAD7+YQNzcz5bQDJgUKx0RuLvsS5e7V0PqRrk=; b=Z8DP4xnFejKF1C
	D5+fSzc85bzcVxKsiXuSdndUNOaVlbKIHlJp7RuycpTrmyJpcnkqpKSLeNTYFspX0JEa+N0OxJHni
	AWDUO042myiIQHXsSyIWKmV+RcwrdyOuXWKXYeiuhbdljZU8vaBrQ/LxehOtdlb9mftP4H80vCbx3
	yBisf0RtXvPCQH12X9QKuzqHR17+3Us6CQmqlg7ng4hOHvdhutAthi8f5U3KZRtT6L0ZGYCsAKJg1
	h7hLEDwa1Fs8JDqcNS6QLy87s5T44+P95zg85/KO9rO7/1/4g1bw+c85N+AGLl7uY9YC08ZoX9rXh
	ziIyVdQ1gdNYWzl1h2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV4vh-00FGfm-B3; Thu, 23 Feb 2023 06:18:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV4ve-00FGf9-Mm
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 06:18:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61BA9615E3;
	Thu, 23 Feb 2023 06:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994D4C433EF;
	Thu, 23 Feb 2023 06:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677133085;
	bh=3NvIbz4dAOjcx+FQS/w/2TUmps7YZWRiNJaIltf+Vfk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=RAXasNZoiJwiCBfBzXlnI/4HcA53uVtwYTvAklFL04ZwChA674cn861ckh8YJcYBM
	 66RZGxNTSSybSX0Gb1MVAW3Cxqzy2cqXijJrZ8RjAIDTO8c+AzSa29Q6QNurHWT17Z
	 LSYN6IwGZW1YRcsBMdGkGw3QctPETRzHMvE3JuYzzcvVHbmWaLhpspziS4wKw6u3fF
	 IJ5Z5CeLssf/F0f2d3jsVJQBqLgyXURqWG45lup5fvz3JJwYtUTfTCy0eH97C0t8Oe
	 bSLJROexpjPcqdppD62WOm/gSPWpBFru2BGC6nYkKX0Ntqrh37LgFudvPxYFxLmL2q
	 omI/As/PAJPBQ==
Date: Thu, 23 Feb 2023 06:18:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
CC: Stephen Boyd <sboyd@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_07/11=5D_dt-bindings=3A_clock=3A_Add_S?= =?US-ASCII?Q?tarFive_JH7110_system_clock_and_reset_generator?=
User-Agent: K-9 Mail for Android
In-Reply-To: <63d0e2a9-84b9-6637-6bbf-dedb2527eaa5@starfivetech.com>
References: <20221220005054.34518-1-hal.feng@starfivetech.com> <20221220005054.34518-8-hal.feng@starfivetech.com> <Y6JB37Pd5TZoGMy4@spud> <7a7bccb1-4d47-3d32-36e6-4aab7b5b8dad@starfivetech.com> <Y6tSWB2+98a8k9Qw@spud> <5cf0fe71-fd17-fb28-c01e-28356081ba76@starfivetech.com> <Y+5z8skN2DuvxDEL@spud> <72953dc9371b87da8d03c63633d7d9dd.sboyd@kernel.org> <Y/VWNPfApsfm3/UD@spud> <c0472d7f-56fe-3e91-e0a0-49ee51700b5d@starfivetech.com> <Y/ZCRv3jHwFxN1Fo@spud> <63d0e2a9-84b9-6637-6bbf-dedb2527eaa5@starfivetech.com>
Message-ID: <74F2E9C9-A606-4BCE-BB00-780619F851AE@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_221806_844759_DB180784 
X-CRM114-Status: GOOD (  23.49  )
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



On 23 February 2023 03:03:04 GMT, Hal Feng <hal.feng@starfivetech.com> wrote:
>On Wed, 22 Feb 2023 16:26:46 +0000, Conor Dooley wrote:
>> On Wed, Feb 22, 2023 at 09:27:37PM +0800, Hal Feng wrote:
>>> On Tue, 21 Feb 2023 23:39:32 +0000, Conor Dooley wrote:
>>> > On Tue, Feb 21, 2023 at 02:17:17PM -0800, Stephen Boyd wrote:
>>> >> Quoting Conor Dooley (2023-02-16 10:20:34)
>>> >> > On Thu, Feb 16, 2023 at 10:42:20PM +0800, Hal Feng wrote:
>>> >> > > On Tue, 27 Dec 2022 20:15:20 +0000, Conor Dooley wrote:
>>> >> > > > On Mon, Dec 26, 2022 at 12:26:32AM +0800, Hal Feng wrote:
>>> >> > > Please see the picture of these external clocks in clock tree.
>>> >> > > 
>>> >> > > # mount -t debugfs none /mnt
>>> >> > > # cat /mnt/clk/clk_summary
>>> >> > >                                  enable  prepare  protect                                duty  hardware
>>> >> > >    clock                          count    count    count        rate   accuracy phase  cycle    enable
>>> >> > > -------------------------------------------------------------------------------------------------------
>>> >> > >  *mclk_ext*                             0        0        0    12288000          0     0  50000         Y
>>> >> > >  *tdm_ext*                              0        0        0    49152000          0     0  50000         Y
>>> >> > >  *i2srx_lrck_ext*                       0        0        0      192000          0     0  50000         Y
>>> >> > >  *i2srx_bclk_ext*                       0        0        0    12288000          0     0  50000         Y
>>> >> > >  *i2stx_lrck_ext*                       0        0        0      192000          0     0  50000         Y
>>> >> > >  *i2stx_bclk_ext*                       0        0        0    12288000          0     0  50000         Y
>>> >> > >  *gmac1_rgmii_rxin*                     0        0        0   125000000          0     0  50000         Y
>>> >> > >     gmac1_rx                          0        0        0   125000000          0     0  50000         Y
>>> >> > >        gmac1_rx_inv                   0        0        0   125000000          0   180  50000         Y
>>> >> > >  *gmac1_rmii_refin*                     0        0        0    50000000          0     0  50000         Y
>>> >> > >     gmac1_rmii_rtx                    0        0        0    50000000          0     0  50000         Y
>>> >> > >        gmac1_tx                       0        0        0    50000000          0     0  50000         N
>>> >> > >           gmac1_tx_inv                0        0        0    50000000          0   180  50000         Y
>>> >> > >  *osc*                                  4        4        0    24000000          0     0  50000         Y
>>> >> > >     apb_func                          0        0        0    24000000          0     0  50000         Y
>>> >> > >  ...
>>> >> > > 
>>> >> > > The clock "gmac1_rgmii_rxin" and the clock "gmac1_rmii_refin" are
>>> >> > > actually used as the parent of other clocks.
>>> >> > 
>>> >> > > The "dummy" clocks
>>> >> > > you said are all internal clocks.
>>> >> > 
>>> >> > No, what I meant by "dummy" clocks is that if you make clocks "required"
>>> >> > in the binding that are not needed by the hardware for operation a
>>> >> > customer of yours might have to add "dummy" clocks to their devicetree
>>> >> > to pass dtbs_check.
>>> >> 
>>> >> They can set the phandle specifier to '<0>' to fill in the required
>>> >> property when there isn't anything there. If this is inside an SoC, it
>>> >> is always connected because silicon can't change after it is made
>>> >> (unless this is an FPGA). Therefore, any and all input clocks should be
>>> >> listed as required.
>>> > 
>>> >> If the clk controller has inputs that are
>>> >> pads/balls/pins on the SoC then they can be optional if a valid design
>>> >> can leave those pins not connected.
>>> > 
>>> > From the discussion on the dts patches, where the clocks have been put
>>> > (intentionally) into board.dts, I've been under the impression that we
>>> > are in this situation.
>>> 
>>> For the system (sys) clock controller, we are in this situation.
>>> For the always-on (aon) clock controller, we are not, because some input
>>> clocks are inside the SoC.
>>> 
>>> > Up to Hal to tell us if the hardware is capable of having those inputs
>>> > left unfilled!
>>> 
>>> The situation is different for v1.2A and v1.3B boards.
>>> 
>>> For the v1.2A board,
>>> gmac1 only requires "gmac1_rmii_refin", which support 100MHz
>>> gmac0 only requires "gmac0_rgmii_rxin", which support 1000MHz
>>> 
>>> For the v1.3B board,
>>> gmac1 only requires "gmac1_rgmii_rxin", which support 1000MHz
>>> gmac0 only requires "gmac0_rgmii_rxin", which support 1000MHz
>>> 
>>> So we should set the "required" property depending on different
>>> boards.
>> 
>> These were Krzk's suggestions:
>> oneOf:
>>  - clock-names:
>>      minItems: 3
>>      items:
>>        - a
>>        - b
>>        - c
>>        - d
>>  - clock-names:
>>      items:
>>        - a
>>        - b
>>        - d
>> 
>> or maybe:
>>  - clock-names:
>>      minItems: 3
>>      items:
>>        - a
>>        - b
>>        - enum: [c, d]
>>        - d
>> 
>> Might be making a mess here, but I think that becomes:
>>   clock-names:
>>     oneOf:
>>       - items:
>>           - const: osc
>>           - enum:
>>               - gmac1_rmii_refin
>>               - gmac1_rgmii_rxin
>>           - const: i2stx_bclk_ext
>>           - const: i2stx_lrck_ext
>>           - const: i2srx_bclk_ext
>>           - const: i2srx_lrck_ext
>>           - const: tdm_ext
>>           - const: mclk_ext
>> 
>>       - items:
>>           - const: osc
>>           - const: gmac1_rmii_refin
>>           - const: gmac1_rgmii_rxin
>>           - const: i2stx_bclk_ext
>>           - const: i2stx_lrck_ext
>>           - const: i2srx_bclk_ext
>>           - const: i2srx_lrck_ext
>>           - const: tdm_ext
>>           - const: mclk_ext
>
>Will modify it and improve the description of clock items for
>pointing out which clock is required on different boards.

I don't think you need to mention the boards in it.

>Thank you all for your helpful suggestions.
>
>Best regards,
>Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
