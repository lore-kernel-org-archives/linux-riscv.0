Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D679D41173
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 11:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9T7B7/Q6gl8K4lEeZRLWkiDkXyFH/bfY6pdmKfQIzM=; b=RC3evyPSadQl5E
	f/Tt6QHNkm10SZB7Z7eIrU2n4S4eBxyOQeo5kfImcCU1lccEw/Tge4lOtm9FjfFBuw06tEp0hH4kZ
	JV/wV5letxdiJfwtrFjHfzWMT/TTHyNn89QPWkwzv96iM77Hpz8S3L/XhpTIokAMW8cF+hYeiMnhM
	EqSRQKdcnXjbJD8XSbdBcO7NpzaA/5VYKjQfOWrOEpQiAZCoEYQCjbNvpSvVjjA+sGL7fCprp4UrO
	tIYau7rAoFnAoL4HtFMmClO9antSfi7HZkeeWupiSZ2IHdI6jrV3P2na+e7O0ywSE1tv56aAsEpuS
	qF6xsmfZhPPWN6oMlEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLTc-0000000CDhv-1dxk;
	Thu, 15 Jan 2026 11:25:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLTb-0000000CDhn-3Ecv
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 11:25:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D295D601B9;
	Thu, 15 Jan 2026 11:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7565AC16AAE;
	Thu, 15 Jan 2026 11:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768476318;
	bh=B7PuUbXLWy7tl2Fur0m21K5Rid4K0ANkn6cmSohDoGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IfVg6P0plvu0QThEcQfXdt0D50Ofu64z4L2RBMAAv9Wv6AmF+p8KbaqmqiVTCuts9
	 M5INO265jFD8nMLXeEIp5xA+PerY3+Rjqdl2pkIVhe8z3KGPPcuLRFk1TLqJwQfbiW
	 lJKcFJ7+kqdTuzsBffFhWdIbfdTbJAlZHRRhPepR0+x5dKYJNRbR54oxHRm6C3otvK
	 gLmoVvU1QmC0eJAINslSSK/ZWRUmrezlOrcKd06OjJaa7vyA+r2cXhMtYQU9kPlQ7n
	 KNJi1JmYG9cJ/7EGhRcUO8j4pQx4qI+KPyMB2XHPGjGRnCrsnVPTa9Rx8NejK3u2lt
	 LmXH+VUkOud7A==
From: Yixun Lan <dlan@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong@riscstar.com>
Cc: Yixun Lan <dlan@kernel.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing devicetrees
Date: Thu, 15 Jan 2026 19:24:51 +0800
Message-ID: <176847501553.23847.653353060495870563.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
MIME-Version: 1.0
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


On Thu, 15 Jan 2026 07:18:56 +0800, Guodong Xu wrote:
> The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
> much later than its component extensions zba/zbb/zbs (June 2021). Recent
> updates to the device tree bindings [2] enforce that when all three
> component extensions are present, "b" must also be specified. Related
> discussion can also be found in [1].
> 
> Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
> It is a trivial update, but can help readers reference the correct
> document version. Acked-by Paul Walmsley in v1.
> 
> [...]

Applied, thanks!

[4/4] riscv: dts: spacemit: k1: Add "b" ISA extension
      https://github.com/spacemit-com/linux/commit/eb241eb29bad28cd17c5a4b9c355645e96094713

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
