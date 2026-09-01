Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A345C61DFD
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 01:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWjzA9NMClnPDEzn5sCodPNcEfEO9+0vrokHsos3bIg=; b=ARVvazQ43Wwyie
	t4Kfk5DxvnAVAOLEaBmSfyQzTOUiSB0nPVLr460NIVqL837jp6zBx4zKvei6RMwBdAqYi7QDkkB+c
	Ine5j7PqwL0ySRHFB4ldSAwXjaERA4URrDBiKmVw3WoQzjx0mi+FH345V3V4LmK2R+jm0k6M87/nJ
	M0JF65HR3qkAR7vD0tkMIu6wj4PrbI3P2nPnXqZcswWa6D05qp00BkpdYQk2bNrchQ82NRM46/xA3
	gGkSv5iueNY1FjkSBvu8uAWGqJPCuqrsdHYqNiTRIzQX9LiLUtMUQdOQ4UUFzGHVqehWMUttv6tHR
	2OIvtLq7+NJ+ryBqMIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DBW-0000000AmxK-3BJa;
	Tue, 01 Sep 2026 01:21:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DBU-0000000Amwo-3359;
	Tue, 01 Sep 2026 01:21:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 853C3602C4;
	Tue,  1 Sep 2026 01:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A87B1F000E9;
	Tue,  1 Sep 2026 01:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788225666;
	bh=8orNIjIzUT4JrVxYvCjtONO0FJhQ3qvHew8AnoJI+R8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HVudNs4EneZDpRt4nbHAt/jkOVjS9ezphRcYSiPhrqHFYYnxKJs7SOV3Epz0fnlDD
	 P5NgWH1ffh9t/jJySqSjNkAc/wGfAWJc36SQELSy6XU/6nHM2zeIWgIV6m9rxBTG7D
	 aSWW0KVO4/LKx+MJizs0cx8XFHuaqkazvywwAfcbFzjQSTH5GqR+vB7pLkJKsEroJ6
	 ZLg3/OpK+XoW1zoFVwCzcwOYUgYx2Xc+x0wylhPXJSQZpee+x77g4eQ3gyFGbls5Da
	 Y88hpMuJT/YeeK6zDzrc/3ochgyYu1KA1JsLnZO4TlUa8XA/Qg+z+Iy+m/vsHK5cVC
	 wMBLPZz2m2T/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568783924A45;
	Tue,  1 Sep 2026 01:20:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] perf: RISC-V: store available counter mask as
 bitmap
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178822560914.869454.14196508746211130249.git-patchwork-notify@kernel.org>
Date: Tue, 01 Sep 2026 01:20:09 +0000
References: <prpmask02cmap.v2.1786434000.git.liuxixin@kylinos.cn>
In-Reply-To: <prpmask02cmap.v2.1786434000.git.liuxixin@kylinos.cn>
To: Xixin Liu <liuxixin@kylinos.cn>
Cc: linux-riscv@lists.infradead.org, atish.patra@linux.dev,
 anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Tue, 18 Aug 2026 17:10:00 +0800 you wrote:
> The available-counter mask was a single unsigned long, but iteration
> uses RISCV_MAX_COUNTERS, which is 64. On RV32 that reads past the object.
> Filling with an unsigned-long bit at index 32 and above is also wrong.
> 
> Use DECLARE_BITMAP and set_bit/bitmap helpers. Walk each bitmap word
> into CFG_MATCH when checking events, when allocating an index, and when
> stopping all counters. Set the counter base to i times BITS_PER_LONG.
> Share the CFG_MATCH ecall through a small helper so the 32-bit argument
> split is not duplicated. On qemu-system-riscv32 the probe bitmap has bits
> above XLEN set, so the first word alone is not enough.
> 
> [...]

Here is the summary with links:
  - [v2,2/2] perf: RISC-V: store available counter mask as bitmap
    https://git.kernel.org/riscv/c/e7bdbf5131ff
  - [v2,1/2] perf: RISC-V: use BIT_ULL for u64 overflow masks
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
