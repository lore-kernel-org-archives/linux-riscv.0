Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E28C98312
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 04:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEtWCfiKDyPYZlHMsdzZHp/ZLjg8U51yM7TCSvBHNxY=; b=look78ypZHdiub
	TJuuyEuEhyb7n8PB2+Ujl1r5TiO3w6jeI3O8T5GCVfzO+JHhiavmuU4LI5X+jddWJieL6PSVjnnwm
	9jRB4CnOIugcycrvap6eGN7y1tC+BDCzgJt6EtMEiheeRiVJGQthfk925HvbRQMyCCJesDO8b2Ilj
	aSaTNdlDNyLZwi7ohcuYmpd91rb+D+o1a2r9U46cSIjoTpGYeB5WOtCoOllp16W6ZEhQb2w5+jMdr
	lu/qyIbPnGvQE5BSupqW7im6kAfNtvdj2F77dpvQZCaMkEODRaoiEVrP617nBvj0BjKozSYhF/iDY
	SkuMs0Es+Vl32rVlOmnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9bPO-0000000A1fK-3WwR;
	Thu, 24 Sep 2026 04:50:10 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9bPM-0000000A1do-0WgF
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 04:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=7o0OeEyMuwSonCidmJ3wlDdB6qY0WHDZQ4VolkPeX4E=; b=HW6v0TE+aoqNEFIGS/fP3nfD/y
	OhfVaBXfhvKDOX9KtVMKfTXpOunv080Uzy6ZnNanY19lZ7XUOCng11UyVPRqkqdtxjwtAFXHDoE11
	BnIXUeR3Qv4J2YwQvNNgHM32AC0gXhh841U3WMfOF/L1jlz91dvUKLWDBouvOJ5bqHcp8VxOL3Z7t
	80S1UmGfMzkYGjgg6O+OjbDVAgINVrw6Nxv96213vskoEYgOlXU1JNkzFjMtU/wf3jug4gJi2mZ0X
	CwxHq1ofIors2hCePaUZAWjNc0QIb8Fv0ajM34vcGElMczPjICMbJ9l5IjN6sogUbfTJ8npXGz9HL
	+KZuQEHw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x9bP6-00000008Jsc-3Usx;
	Thu, 24 Sep 2026 06:49:52 +0200
Date: Thu, 24 Sep 2026 06:49:52 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: gao.rui@zte.com.cn
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jiangfeng@kylinos.cn,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	jmontleo@redhat.com
Subject: Re: [PATCH v2] riscv: fix =?utf-8?Q?strnle?=
 =?utf-8?Q?n=28=29_overflow_in_Zbb=C2=A0implementation?=
Message-ID: <arSr8E0CYQRi8wMs@aurel32.net>
Mail-Followup-To: gao.rui@zte.com.cn, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jiangfeng@kylinos.cn,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	jmontleo@redhat.com
References: <20260924105708488K1vV5J_xi9COWY7TvJawc@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924105708488K1vV5J_xi9COWY7TvJawc@zte.com.cn>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_215008_180040_3EDC29D5 
X-CRM114-Status: GOOD (  15.85  )
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

On 2026-09-24 10:57, gao.rui@zte.com.cn wrote:
> The RISC-V Zbb optimized strnlen() implementation can return incorrect
> results when very large count values are supplied.
> 
> The previous implementation calculates an end address based on the
> input pointer and count. When count is close to SIZE_MAX, the address
> calculation may overflow, resulting in incorrect termination checks and
> wrong return values.
> 
> This issue was observed while running device-mapper tests:
> 
> dmsetup create testname9 --table "0 8 zero"
> cat /sys/block/dm-*/dm/name
> dmsetup remove testname9
> 
> Rework the Zbb implementation to use a decrementing word counter. 
> This removes the dependency on end-address calculations,
> avoids overflow entirely, and simplifies the word scanning loop.
> 
> Performance was evaluated with string_bench_strnlen:
> 
> New Implementation Previous Implementation
> 
> len=0 : 70 ns/call 70 ns/call
> len=1 : 81 ns/call 81 ns/call
> len=7 : 81 ns/call 81 ns/call
> len=8 : 81 ns/call 81 ns/call
> len=16 : 97 ns/call 90 ns/call
> len=31 : 119 ns/call 113 ns/call
> len=64 : 174 ns/call 162 ns/call
> len=127 : 264 ns/call 258 ns/call
> len=512 : 801 ns/call 824 ns/call
> len=1024 : 1578 ns/call 1550 ns/call
> len=3173 : 4541 ns/call 4703 ns/call
> len=4096 : 5984 ns/call 5982 ns/call
> 
> Results show comparable performance to the previous implementation
> while fixing the overflow issue.
> 
> Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
> Signed-off-by: Gao Rui <gao.rui@zte.com.cn>
> 
> ---
> v2:
> - Rework the Zbb implementation to eliminate end-address overflow
> instead of falling back to the generic path.
> - Use a decrementing word counter for word scanning.
> - Replace numeric labels with descriptive local labels.
> - Add comments describing the loop structure.
> - Run KUnit string tests successfully.
> - Add string_bench_strnlen benchmark results.
> ---
>  arch/riscv/lib/strnlen.S | 111 +++++++++++++++++----------------------
>  1 file changed, 48 insertions(+), 63 deletions(-)

Note that the following patch was also posted, to what I believe is the 
same issue:

https://lore.kernel.org/linux-riscv/DLLJDLKPZ4S3.1KQ5O4OQBBTEW@linux.dev

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
