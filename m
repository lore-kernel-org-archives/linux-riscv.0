Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD29C369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 13:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZ3yiM2VVF+xnD8eeayxG7Tf38eTUJrZ98y5kbJwjN4=; b=ySZoYKbMquLdTX
	MPSubKuXKFx1lRFFzWdEOByHpVbdA4S1Qbb0U/wuTxvT8BOZhlYBJEFGLfopZNSnOMhRUw4ILwFay
	dhbRnbZ1oBsl50tisC8LWKz3SDSlelQANWpZVMm6H5tetW8HSUCq4ZJhb1lIR0Zh8LeQ+NKMAQ4hm
	UHodmr1dNkXbqDwMV99i1rjgYMcZ0uVVIODdkS6x2HkwtNIH/vmw2Wyr+ZoS2j2X20rkrVTVIq/Ot
	9V6P6N6UF1v5I76X0r3zrFK9vzQITKImNuX/sjICdAyDDJpyhIp7AqIO38n+QfzJYed1FcAf44uII
	F2YaiiigDxuff0M3lC6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6rXX-00000004Ng0-3rn8;
	Mon, 21 Apr 2025 13:50:27 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6rRx-00000004MbI-0hoW
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 13:44:42 +0000
Received: from localhost (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1CCB6342FB1;
	Mon, 21 Apr 2025 13:42:35 +0000 (UTC)
Date: Mon, 21 Apr 2025 13:42:18 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/7] clk: spacemit: add K1 reset support
Message-ID: <20250421134218-GYA42923@gentoo>
References: <20250418145401.2603648-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_064441_232422_1EBB013C 
X-CRM114-Status: GOOD (  28.64  )
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

Hi Alex,
  I'm good with this version, but would wait a few more days for
people to comment before taking them..

Hi Philipp,
  Since these reset patches [3, 4, 6] are sitting on top of clk driver,
I'd assume you're ok with taking them through clk tree? I'd plan to queue
them for 6.16.. if yes, would you be able to give an ACK? I'd appreciate!



for the patch series, I'll give my rb
Reviewed-by: Yixun Lan <dlan@gentoo.org>

On 09:53 Fri 18 Apr     , Alex Elder wrote:
> This series adds reset controller support for the SpacemiT K1 SoC.
> 
> Most of the the clock controller driver that Haylen Chu had out for
> review has been accepted (at v8).  So this time this series is
> based on the "for-next" branch in the SpacemiT repository:
>   https://github.com/spacemit-com/linux/tree/for-next
> 
> All of these patches are available here:
>   https://github.com/riscstar/linux/tree/outgoing/reset-v5
> 
> Between version 4 and version 5:
>   - Added Haylen's Reviewed-by on the second patch.
>   - Added Philipp's Reviewed-by on the third patch.
>   - In patch 4, added a const qualifier to some structures, and removed
>     parentheses surrounding integer constants, as suggested by Philipp
>   - Now based on the SpacemiT for-next branch
> 
> Here is version 4 of this series.
>   https://lore.kernel.org/lkml/20250414191715.2264758-1-elder@riscstar.com/
> 
> Between version 3 and version 4:
>   - Now based on Haylen Chu's v7 clock code, built on v6.15-rc2.
>   - Added Krzysztof's Reviewed-by on the first patch.
> 
> Here is version 3 of this series.
>   https://lore.kernel.org/lkml/20250409211741.1171584-1-elder@riscstar.com/
> 
> Between version 2 and version 3 there was no feedback, however:
>   - Haylen posted v6 of the clock series, and it included some changes
>     that affected the logic in this reset code.
>   - I was informed that defining CCU nodes without any clocks led to
>     warnings about "clocks" being a required property when running
>     "make dtbs_check".  For that reason, I made clock properties
>     optional for reset-only CCU nodes.
>   - This code is now based on v6.15-rc1, which includes a few commits
>     that were listed as dependencies previously.
> 
> Here is version 2 of this series.
>   https://lore.kernel.org/lkml/20250328210233.1077035-1-elder@riscstar.com/
> 
> Between version 1 and version 2:
>   - Added Rob's Reviewed-by tag on the first patch
>   - Renamed the of_match_data data type (and one or two other symbols) to
>     use "spacemit" rather than "k1".
>   - Replaced the abbreviated "rst" or "RST" in names of newly-defined
>     sympols with "reset" or "RESET" respectively.
>   - Eliminated rcdev_to_controller(), which was only used once.
>   - Changed a function that unsafely did a read/modify/write of a register
>     to use regmap_update_bits() instead as suggested by Haylen.
>   - Eliminated a null check for a pointer known to be non-null.
>   - Reordered the assignment of reset controller device fields.
>   - Added a "sentinel" comment as requested by Yixun.
>   - Updated to be based on Linux v6.14 final.
> 
> Here is the first version of this series.
>   https://lore.kernel.org/lkml/20250321151831.623575-1-elder@riscstar.com/
> *** BLURB HERE ***
> 
> Alex Elder (7):
>   dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
>   clk: spacemit: rename spacemit_ccu_data fields
>   clk: spacemit: add reset controller support
>   clk: spacemit: define existing syscon resets
>   clk: spacemit: make clocks optional
>   clk: spacemit: define new syscons with only resets
>   riscv: dts: spacemit: add reset support for the K1 SoC
> 
>  .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
>  arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
>  drivers/clk/spacemit/ccu-k1.c                 | 330 +++++++++++++++++-
>  .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 +++++++
>  4 files changed, 482 insertions(+), 23 deletions(-)
> 
> 
> base-commit: 279d51ad9f6dc0c667f6f141a669b2c921277d1a
> -- 
> 2.45.2
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
