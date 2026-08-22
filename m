Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9F8C5B572
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 09:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MtF3kbMW7NlXN2HotBwHVizSVj369Xgamz06rOiTxH8=; b=aK5poV5cKJZHkf
	QQLKt6EX5CqsX6fuZueWLdwopkfbfWwGiGJu9kC6QcOgbRfvcoXMmmJxF7NSwd2eRA0j/I8FJPGRQ
	O1dImJHxpUKlPSDz1ew1TUyM1RGHGYfXA0TYAKgOWAtgiga+GtVPYCkme6iRbbqHX48TVzmMVlVpH
	NCKUxXGgAejPtzGJWzbIhemHohM8s5blynEfV1fNVImvHSB2vP48uRMjZaNTGPUuGNydh1/qdQ2k1
	VmEuxbPvK1AGf7co8GIhCQqpqzy7UtB6bhrlPghJNuS2GEP1P54xlpZzmI3zUENLOpSIKwqebz3mQ
	Z7RZkkME1FAEsvWjgIkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiPk-0000000ERHZ-29Z2;
	Sat, 22 Aug 2026 09:53:24 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiPh-0000000ERHB-1oTy
	for linux-riscv@lists.infradead.org;
	Sat, 22 Aug 2026 09:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=jg9y4mI5v5W79aBW5EPfVqWvy0/7GhcpTvwiYa0ffF0=; b=WID03Aemp+e0J9keA6q1A7lTRY
	4hyWskXvElzC4uLsCLCZ89BBMX5pzjzSPRBZ976sAwbcw6QhITIW5DAse64b/CXvbQZaZLrTmU84A
	9yo9M0Gqcd37+C88yIAWmpIhRSrwiLQON1pG4vAOWtL3LZU3Qu8VfNFhfdDQQIXzENOTd6tnNFs6D
	iKIJA116hbcoCeeRTlY432rR0zIxu4Hnx9Jruoi5ozA4VMxp65mG9PFCjZgq0jtCAFzwgJR4BNQIl
	NxnWIUiD8Ky2siZ29a3NM4A89dXoH+uGAW1qJbv19Old6lEjQ3Z536ojQicjJAkbenxY/1YXadki5
	DS8kQ9YA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wxiPb-0000000GiHh-3ff0;
	Sat, 22 Aug 2026 11:53:15 +0200
Date: Sat, 22 Aug 2026 11:53:15 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: gao.rui@zte.com.cn
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jiangfeng@kylinos.cn,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: lib: Fix address overflow due to large count
 values in strnlen ZBB path
Message-ID: <aolxiwRzSDlJt2t5@aurel32.net>
Mail-Followup-To: gao.rui@zte.com.cn, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jiangfeng@kylinos.cn,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260819161821053fNUWuvdGIo4HUBmxlcNfG@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260819161821053fNUWuvdGIo4HUBmxlcNfG@zte.com.cn>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_025321_474076_CA638120 
X-CRM114-Status: GOOD (  11.91  )
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

Hi,

On 2026-08-19 16:18, gao.rui@zte.com.cn wrote:
> Hi all,
> 
> This patch fixes an issue in the RISC-V ZBB optimized strnlen implementation.
> 
> Problem description: When using the ZBB optimized strnlen implementation, passing very large count values (such as SIZE_MAX) can cause address overflow and return incorrect results.
> 
> This issue was observed in device-mapper tests:
> 
> sh-5.2# dmsetup create testname9 --table "0 8 zero"
> sh-5.2# cat /sys/block/dm-*/dm/name
> testname
> sh-5.2# dmsetup remove testname9
> 
> The overflow in strnlen caused failures in string handling during device-mapper operations.
> 
> Patch summary:
> - Explicitly introduce the strnlen_generic label.
> - Simplify the generic implementation loop.

This part should be in a separate patch, separated from the bug fix, and 
if possible with some benchmark.

> - Add fallback logic in strnlen_zbb to redirect to the generic path when a0 + a1 overflows.
> This ensures correct behavior for large count values and SIZE_MAX cases.

Is there a way to instead to fix the strnlen_zbb to avoid the fallback?

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
