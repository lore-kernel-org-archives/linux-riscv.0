Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECD8CAC5B0
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 20:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zy8ZH4+X8KNpzj1NTw8HT0FUc+oAIumzjkVfIBxIBDY=; b=Qc4bT2ZiwRCj3T
	gtGUYFpW5bqOcaRtbKBwR69t2nI3FfsP712U6r8R8H3XMkM4PT5QN7EQrMQS+ToGmuy/45CeQF7zp
	+r8uRSNWck3UpXLZsTKpcjfiD/6zv0xfIftPvx6iuY7oCw8yjgxm1OPbd5UmpdEZfszxsAtsJ6FL/
	R5vFW6qqBGvgYwPqW/KAIe8XvUy27se6I0EETjtpCMf6jj8X0xuGLf14U3Q3QR3OFrJcq+RbAlzIo
	1cK3iLYc4tR/Kp9KlYrQmdOnsbeaucdA31NnH9yjJyyKygC9Qd95qFxI818lqJTPiwwhqhjipU1Vl
	vOFqLjUj2b/FnYH/WeKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1sK2-0000000CcY4-3mtX;
	Thu, 25 Sep 2025 20:12:10 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1sJz-0000000CcQE-3QgI
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 20:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=ORkT1a+9XuyN/XSBDila+ea6DXmpE9sH45Swm+wsPeM=; b=sFD9E9MPW0oWpYAj82rWjeTeOZ
	j4iGgDrOm8OtQS/UHGVeHbt7e0VArYve8K/G3XFrjL2VRNzk1e59myuwiWNyGPt6AWBPN6oTUgCdt
	eOkG82vzvneyIJYU2gl6vWV02z8GyFVHmD7DbEK74RF/EhO7464gGU34+EuENSVuDVI1avnemy4Vo
	r1XeOF18d0yefscjgoD9pCdYYoG7NGJJoXFfa/7fAIyHUJ6ytyQoOBHbWe3K8Y/4XJgJwNe9CNPib
	cOHYAvvi3Ijv8wQPnbjtnfOCaCebuNjxOFMqyW+yTQMGBdVmF2E/l9qedJ0ETJf4QvadQhLAGzcIT
	VAu4OYRQ==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v1sJZ-00F7Tf-3B;
	Thu, 25 Sep 2025 22:11:42 +0200
Date: Thu, 25 Sep 2025 22:11:41 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/6] i2c: spacemit: remove stop function to avoid bus
 error
Message-ID: <aNWh_dfyfCsqZ8av@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-2-46dc13311cda@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250925-k1-i2c-atomic-v2-2-46dc13311cda@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_131208_277257_960D2074 
X-CRM114-Status: GOOD (  12.30  )
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

On 2025-09-25 10:02, Troy Mitchell wrote:
> Previously, STOP handling was split into two separate steps:
>   1) clear TB/STOP/START/ACK bits
>   2) issue STOP by calling spacemit_i2c_stop()
> 
> This left a small window where the control register was updated
> twice, which can confuse the controller. While this race has not
> been observed with interrupt-driven transfers, it reliably causes
> bus errors in PIO mode.
> 
> Inline the STOP sequence into the IRQ handler and ensure that
> control register bits are updated atomically in a single writel().
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
