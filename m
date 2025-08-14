Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274C3CA0EE4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 15:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXxkKh4nhSCh+3VhZQlMfUbrrqCWNYXNsEljQTL8tfM=; b=ud0IfYFoqdaEHu
	201Q9gg5kQOvUqqLQa4K9kIz/JbjkmK3Y5tajeuSYFKM77NW6099/49pOpW2t0XZ3dSs5ujy653Wr
	iXLk2hninq+vJw6uu2M0QlO45jP1eWfO8JjTpH/S1ekt6fc8bXZ/maKj19GjL0HPr8b0szieMLcuR
	GlDqdey5De46mzlOzJyygfS02RC8/Vbf2wYuFHFbunK77jbMZ6IafvvePGRu8YefwvlAyURCgsw0z
	NU5U0d8YCm+o+ItCx4gdqPnWw0ReAX2jPU9NjEL1pGuN7zPUlSsI2dc/nvrXo9WdNWFKNTiskO+h0
	JoOmBg2q36L17/ZunPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma0o-0000000HTSO-1nJy;
	Thu, 14 Aug 2025 15:37:06 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVcl-0000000Gg6s-1wXa
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 10:56:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVcZ-0001Vn-1f; Thu, 14 Aug 2025 12:55:47 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVcX-000EyH-2M;
	Thu, 14 Aug 2025 12:55:45 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVcX-000HwQ-25;
	Thu, 14 Aug 2025 12:55:45 +0200
Message-ID: <8d21aeee5bd111aa010c8e6b8a4870298ac72cbf.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] reset: th1520: add VOSYS resets for DPU/HDMI/DSI
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Icenowy Zheng <uwu@icenowy.me>, Drew Fustini <fustini@kernel.org>, Guo
 Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi
 <ziyao@disroot.org>,  Han Gao <rabenda.cn@gmail.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 14 Aug 2025 12:55:45 +0200
In-Reply-To: <20250813081716.2181843-1-uwu@icenowy.me>
References: <20250813081716.2181843-1-uwu@icenowy.me>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_035559_503567_D49FC04F 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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

On Mi, 2025-08-13 at 16:17 +0800, Icenowy Zheng wrote:
> The VOSYS subsystem of T-Head TH1520 SoC contains a set of display
> pipeline in addition to the GPU. The display pipeline contains a DPU
> (display controller), a HDMI controller and 2 DSI controllers.
> 
> This patchset adds reset controls for these devices.
> 
> Icenowy Zheng (2):
>   dt-bindings: reset: thead,th1520-reset: add more VOSYS resets
>   reset: th1520: add resets for display pipeline
[...]

Applied to reset/next, thanks!

[1/2] dt-bindings: reset: thead,th1520-reset: add more VOSYS resets
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=f443d7c9ed46
[2/2] reset: th1520: add resets for display pipeline
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=d342031a5238

regards
Philipp


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
