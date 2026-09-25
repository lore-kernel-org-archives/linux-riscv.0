Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A031C9830E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 20:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2ew4aBxgURv7UPJTdCy7kDd/Ba4ykPpC3ED8AwEMA4=; b=rcyX4D8I1AGzaJ
	ZO6g5d2oFweU/jmnLRcMGkUxV1YT2CHgFb7Keqt8UzCiZXh1cUoCM1kaNBIUUvjck2cwHfBdSe9bB
	QSUZVrU8udLZkLqSj2IScLXopmJ5mQ/9b6Ancvqe7racBSyT/60YV8lUZTT/6cTAJq5o2jnNI7OUd
	EU5EjBm7uBh4II8MDyRIm4rfz0gy1KLmgPxovM0yoRK1FqvM51HgqHcQCeqEPZJF9xs81hM47bU2k
	mb4yLD32jyG/35l6i5sXVUiEbeuq54Bf45EFYWKf0rH7LdpS0hu4929Yg21wVZrkRhgyFUOyWrB7x
	MgVIf4A9gFlNAf7TOxJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xACwI-0000000ERGi-09ZP;
	Fri, 25 Sep 2026 20:54:38 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xACwF-0000000ERFX-2hrY
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 20:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=tdnR0hQoks1raul8LJNCZKc3Dj++dhTUAanHv/0PU4c=; b=Av1CNv7IACArSn3DGiaeJ3WK3f
	YcC2faFWdSr0Ti5EmseHpaYxdnh2txUUOdYhkQXDj2ikzVbm2Ykg+r32UcOsj5HgIMCywnRpYLATC
	2DjXSzjSBjhP4lkqlXthnxjF3g75rj7j+iaFIeuc4X1a94zP5iWI8Ruy1CcQTA8rbQBtbSapPsMOP
	5dNodJz57NXsJmzo504CNqMQPbP/xqn0sSKN6cXNzUZIXlPPiWl2/8vUwds0mWG0eJTZQeaVKzWLy
	RnyVVTR5RYFmHK7vdx3a63Htb2vKXPOIxF+n2gOblBer3QadHmsP2LR4fOMGHbp2X9to+xPA3s3xP
	Q3f56uUg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xACw0-0000000Ac8p-1mNt;
	Fri, 25 Sep 2026 22:54:20 +0200
Date: Fri, 25 Sep 2026 22:54:19 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: shao.mingyin@zte.com.cn
Cc: pjw@kernel.org, mikey@neuling.org, jiangfeng@kylinos.cn,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	zhang.yue5@zte.com.cn, david.laight.linux@gmail.com,
	qingfang.deng@linux.dev
Subject: Re: [PATCH v4] riscv: lib: Fix =?utf-8?Q?Z?=
 =?utf-8?Q?BB_strnlen_wrap-around_regression_on=C2=A0huge?= counts
Message-ID: <arbfe8ZROfJshMJ_@aurel32.net>
Mail-Followup-To: shao.mingyin@zte.com.cn, pjw@kernel.org,
	mikey@neuling.org, jiangfeng@kylinos.cn, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	zhang.yue5@zte.com.cn, david.laight.linux@gmail.com,
	qingfang.deng@linux.dev
References: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_135435_691384_2AFD4FBD 
X-CRM114-Status: GOOD (  19.47  )
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

On 2026-09-15 15:26, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> The aligned scan boundary is derived from the last valid byte,
> (s + count - 1).  When count is huge (e.g. SIZE_MAX, which FORTIFY
> strcat/strlcat pass when the destination size is not known at compile
> time), s + count wraps around and the boundary lands before s, so the
> ZBB path returns a bogus length.  The original implementation
> (5ba15d419fab) had the same wrap-around in its (s + count) & ~7
> boundary computation; after 5d588c684833 the wrapped boundary is caught
> by the pre-loop guard "bgeu t0, t4, 2f", which then always exits for
> aligned strings of 8 or more characters and strnlen() returns 8
> instead of the real length.
> 
> This silently truncates strings built by fortified strcat: the dm
> sysfs name attribute shows "live-bas" instead of "live-base", the
> truncated name pollutes the udev database, and blivet/anaconda (as
> well as LVM/dm-crypt/multipath userspace) break on RISC-V systems.
> 
> Detect the wrap-around and saturate the boundary to the top of the
> address space, making the scan equivalent to strlen().  The saturation
> clamps the increment to ~s, so it stays branchless and wrap-free:
> 
> 	s + min(count - 1, ~s) == saturating_add(s, count - 1)
> 
> Normal counts are unaffected.
> 
> Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
> Cc: stable@vger.kernel.org
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Suggested-by: Qingfang Deng <qingfang.deng@linux.dev>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> Acked-by: Michael Neuling <mikey@neuling.org>
> ---
> Changes in v4:
> - Use Zbb minu to clamp the increment (addi/not/minu/add): one
>   instruction less than the sltu/mask/or sequence and no extra
>   register (Qingfang Deng).  Clobbers stays t0-t4.
> 
> Changes in v3:
> - Replace the taken branch in the saturation with a branchless
>   sltu/mask/or sequence (David Laight).
> - Update the Clobbers list for the additional t5 register.
> - Michael's Acked-by is kept: the patch semantics are unchanged, only
>   the saturation sequence is branchless now.
> 
> Changes in v2:
> - Point Fixes: at the original implementation (5ba15d419fab) and reword
>   the commit message accordingly: the wrap-around exists since the
>   original implementation, 5d588c684833 only changed how it surfaces
>   (Michael Neuling).
> - Add Acked-by from Michael Neuling.
> 
> v3: https://lore.kernel.org/all/20260914162123230u1y1M4UHrO8E-cU-opJ_7@zte.com.cn/
> v2: https://lore.kernel.org/all/20260914145205778-sZJbZc1D-XBfWRXO2f-o@zte.com.cn/
> v1: https://lore.kernel.org/all/20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn/
> 
>  arch/riscv/lib/strnlen.S | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
