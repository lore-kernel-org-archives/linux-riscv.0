Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E147BC5DF87
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 02:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdaCd0peLk6GH+u4ZMWoF+5UwOwpT2SQu6yIZ0Dj1Ow=; b=1I7Fgs3ih/9Rn2
	ple1yXVpF27XBAhhnR/TNf8SRm1r8BOgLQOJ0Me6zvq9xTm90t+ABOJRVLVMc15mTQE2Ge298fUzW
	Z+lre4NfGs3rKop/0eMSaeLNhDSYpnVJII/gJXaFuKJo6fSlPMx1DiVcbcmItOtCcMPP0IJEWLDse
	06Vr9Epx9Li6x4JuMUHo799OYB0vIbNl/kHdXt++n5XImUtj8KWoQU3aYKnbxElfBzCFkM06VhoQ9
	632QFKvfn2t4Atb6qtZcSOzHj6c2AtGtfjL+prwuHvGCIOx47au19zG2WMapZC3nvIc+qCzK+/cA8
	4Hm2I62uYTfZmLpIywow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxEYr-0000000CRC2-3lKI;
	Fri, 21 Aug 2026 02:00:49 +0000
Received: from out-75.mta0.migadu.com ([2001:41d0:1004:224b::4b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxEYo-0000000CRB3-0llj
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 02:00:48 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9ac753xghRJn/27tVS9JoobeWsB8lFA3MSTyYxuV/EI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787277640; v=1; x=1787882440;
 b=FcW9iiIGHzYl31nZDMkmvL/8BBgE4iH2G4x3Hn44KuOl0mZ/S1yAqHnuWBMnqLGvju955qOo
 lqspBEgAmAGpvFmlTWDJLHgegGLyUwPIVIpeS2YQPu/6tK4dU1ZcMUNCAEMvbUrnIZ5VTX99tzf
 lkihv4PBg+asFcGN48d/R6tc=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: from localhost (114.94.8.21)
	by smtp.migadu.com with ESMTPS id d136abca33384d49;
	Fri, 21 Aug 2026 02:00:40 +0000
X-Mizu-Trace-ID: d136abca33384d49
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Date: Fri, 21 Aug 2026 10:00:37 +0800
Message-Id: <DKU91NS0JNRS.SLSXQO6JHRLM@linux.dev>
Subject: Re: [PATCH 0/6] Add SpacemiT K1 USB2.0 controllers support
From: "Ze Huang" <huang.ze@linux.dev>
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>, "Xu Yang" <xu.yang_2@nxp.com>, "Peng Fan"
 <peng.fan@nxp.com>, "Peter Chen" <peter.chen@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_190046_354271_2588A68B 
X-CRM114-Status: GOOD (  12.76  )
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

On Wed Aug 12, 2026 at 5:26 PM CST, Junzhong Pan wrote:
> The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
> support, but the hardware has no internal OTG registers, the other is
> Host only. These controllers are compatible with Chipidea USB2 driver
> with some flags set and reset control support.
>
> This series is based on 7.2-rc1 and has been tested on Banana Pi F3
> development board.
>
> A self-powered USB device/hub is needed to test the host function of the
> dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
> cellular module e.g.) is needed to test the host only controller.
>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Tested on OrangePi RV2.

To use USB2.0 Type-A port as host on this board, usb2_0 needs:
  - dr_mode = "host"
  - a vbus-supply regulator driving gpio126

Tested-by: Ze Huang <huang.ze@linux.dev>

> ---
> Junzhong Pan (6):
>       dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
>       usb: chipidea: usb2: add optional reset support
>       usb: chipidea: usb2: add SpacemiT K1 support
>       riscv: dts: spacemit: add USB2.0 controller nodes for K1
>       riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
>       riscv: defconfig: enable ChipIdea USB controller support
>
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      |  1 +
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 16 +++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi               | 40 ++++++++++++++++++++++
>  arch/riscv/configs/defconfig                       |  4 +++
>  drivers/usb/chipidea/ci_hdrc_usb2.c                | 16 +++++++++
>  5 files changed, 77 insertions(+)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58
>
> Best regards,



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
