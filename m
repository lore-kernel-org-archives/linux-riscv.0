Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DA7CA6007
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OLphHnp4rB+vD+n5qO5Pm35qLi1nXo4ecmb5JrWGLc=; b=SdqpuRfwL3H0XF
	GZI51qzEVeiyiKXUO8s3axFN1p6U9h4YPWZiZ8sik72HKZDg0d6+RIBWA5cfdZvhZMA5Ofuff1tn4
	SfPTncItMW9QGz8SfD/VPRbw0RdjMpMWkNoc6lqAnW9PEGHvD8aZCBJdhbKBqIyF65V4P1/7W/E0R
	IenVYREnSn8xYDd2ynAr+cKqBlaL6C8cSSCjsTHhe36xCEBI9x8lKbzF7XJ+rAQLvqDSO8CO5LoaI
	pEa2grXr2ZrmYC1jYJqcgjq6AbrkWVfiWcjqdwIEWncnScu+g1x2eTf1yDeKaPSOtDX6WE1TvZhTp
	ZtnJQKeGH1xpA2coex2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETCV-00000002gL5-356B;
	Wed, 07 Oct 2026 15:04:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETCU-00000002gKz-0RqO
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 15:04:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 976A4432B6;
	Wed,  7 Oct 2026 15:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321C31F000FF;
	Wed,  7 Oct 2026 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791385497;
	bh=5KKgn2UqrLga3ru2hCfdwq01pxA7KWr598Qy7ODuIOw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Vg8QQXo/j1cJA+7lAIWl3ieC7bbAK8CmOakSBQEx1DU3vTOaZwvEsY7z9/9+Vfxpf
	 9rJB1J52vIe8HZTeZlaifB+0Ge2/4ZOkTdXja7wheCuDq3l0g3d8Th1DVxE4fbvebX
	 ZAZ9mp8+WExsm3VNq7yT3nbpxQ/I40GPb32od1xYcBwRh+lD1k5BeE9+iz+z4y0T8W
	 +wS8EerxsldbR4lCHcHuSju760dQ9OJAaxRsrLetzKYp5VN5w4kBnOBKfbsaLpda5y
	 k+C02Xq9gcpMvs9tSzWPgQq7JGAVPbaIVGj61dGFXV6fSksk3kpUg4MI2Rv5koWqxx
	 /carN3dHoLQpw==
Date: Wed, 7 Oct 2026 09:04:51 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zongmin Zhou <min_halo@163.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] riscv: errata: select RISCV_ALTERNATIVE_EARLY for THEAD
 GHOSTWRITE
In-Reply-To: <20260917074843.52716-1-min_halo@163.com>
Message-ID: <1cfb2bbd-206b-4a5b-e136-7afbcde21e63@kernel.org>
References: <20260917074843.52716-1-min_halo@163.com>
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

On Thu, 17 Sep 2026, Zongmin Zhou wrote:

> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> errata_probe_ghostwrite() only marks the CPU as vulnerable when it is
> called at the RISCV_ALTERNATIVES_EARLY_BOOT stage, and the mitigation
> in ghostwrite_enable_mitigation() only takes effect if the vulnerable
> state was recorded before the boot alternatives are patched.
> 
> The early boot stage is only executed when CONFIG_RISCV_ALTERNATIVE_EARLY
> is enabled, which currently is only selected by ERRATA_THEAD_MAE. In a
> kernel built with ERRATA_THEAD_GHOSTWRITE=y but ERRATA_THEAD_MAE=n, the
> early alternatives never run, so ghostwrite_state is never set to
> VULNERABLE: ghostwrite_enable_mitigation() returns false, xtheadvector
> remains enabled, and sysfs reports "Not affected" on a vulnerable
> T-Head C9xx CPU.
> 
> Select RISCV_ALTERNATIVE_EARLY from ERRATA_THEAD_GHOSTWRITE so that the
> vulnerability is detected in the early boot stage and the default
> mitigation is applied.
> 
> Fixes: 4bf97069239b ("riscv: Add ghostwrite vulnerability")
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>

Thanks, queued for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
