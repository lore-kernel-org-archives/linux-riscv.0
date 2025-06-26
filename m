Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95D9C7EE30
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 13:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gaz6xBNZ2z+YS8ILyK0yVxjxu7tXQ4MeGqtdoCyZ78M=; b=Pd2YQHLbxIRLFS
	rjOz1XiN88PBfVcCc4Wwu2vY5x8J1tbkA7oIkOCuWRmOqG/Mud2jikhqkaa0LRtdmjk8R4Wh/PavN
	8lJoh6+WqGfig/ycYU2HllS+lUa4Bv4oqjVnDF4SsnG0TZhldWd5122cYdB3XsoPE1QoG1Xshdy4Y
	iUG6fjIOOLbrDRjTUVVSJ/gCWmp9qPwsbjbx+sFVSYZ0Pg8PyB2DFduCiEts+Kh5Wk/7ue/vLC+AO
	cMRR5GoctkmutAqZfkn4TENxQ7fQdcrYHmP8Ok68fncX5S42llrkAA5Hls19j9+XdWFRKBvUgPN+c
	n49Jj+IbYRckbO3Wi5pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmy2-0000000BivZ-3N5B;
	Thu, 26 Jun 2025 13:48:42 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmy0-0000000BiuO-19ov
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 13:48:41 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750945716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oGFsGaDc7A/iv6amXFrZJ2p4lD8QHxWg/O8VbpAqBE8=;
	b=GaawndPCLcbH0vtikGwu74OYD/tQD4YKZsCGIoqeoWPnEq7Skn031WCaFXU8q2Wa3SwM3t
	SZmiiF1NfVSGLeUG7CvTHrUVRD4ncF1EIcpm2oMlFXpOh2iWZM4WpvfDUOBlAvF/jAT3Qf
	nBHKDs32ggwzFkcNu+JSMRhHVSkCZG5z4x6EWVk4yeaIlsL3I5zANGmKZJIeQ0/e73ODes
	at0PJLQMRZt4ZAt7J8IBKEm6G0/XJAmUK50nnMPkPCq9pLzVfBkxNj2IGHCzIPdTcifrzf
	S1E+ZiIPUTB4BBHrakeUTFNggghHpTd8FOx22pK1NxKy9x0rK7UimP3B71n7HA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750945716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oGFsGaDc7A/iv6amXFrZJ2p4lD8QHxWg/O8VbpAqBE8=;
	b=l5/j29XUJJcTB0Wfh3QngXEc/2MEVzwBbRdlBUIk8igVqy/SPjHUfc8QvksCYULQlQVl27
	WZbNSf8spvlZ5IBg==
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Chen Wang
 <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, Sunil V L
 <sunilvl@ventanamicro.com>, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, Vladimir
 Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v3 0/7] MIPS P8700 variant of the ACLINT IPI controller
In-Reply-To: <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
Date: Thu, 26 Jun 2025 15:48:35 +0200
Message-ID: <874iw2r4uk.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_064840_449369_62DEB1F0 
X-CRM114-Status: UNSURE (   7.33  )
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

On Thu, Jun 12 2025 at 17:39, Vladimir Kondratiev wrote:
> Patches 1 and 2 refactor "hart index" support, replacing
> APLIC specific implementation with generic helper
>
> Patch 3 adds dt-bindings
>
> Patch 4 refactors Thead-specific SSWI, adding MIPS variant
>
> Patch 5 adds "riscv,hart-indexes" support
>
> Patches 6 and 7 do some minor improvements for the SSWI

It seems I'm the only one who cares about this series aside of Conor
looking at the DT part and of course Vladimir himself.

This whole thing looks reasonable to me and I'm not longer waiting for
those who keep me busy with their own patches and fail to look at stuff
which affects the architecture/drivers they depend on. I don't want to
hear complaints about any fallout of this further down the road.

Oh well.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
