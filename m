Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D86AC88E4D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 18:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bT0yjGPxtSWjIrIMcY6rG4VygKroL+ecwI8kfGgwiyg=; b=x73FchGMlXCpmH
	Vxw8zc4H13Os0AyVABWo7j/i96pEEh32X+NlDPSQfa4ToAxcE2iUOiQ0fbpgT4AtS8Mrmdi4aIHpO
	C5fkfMXCTQu/7poLybiYnMZc6pNPcYERhrOZDtn1q5VyOrW4vV+ik7T6tx9gWWmug34HZysN6Cvc3
	O44cOyPhSd//fQXBLo27if6tyGb2Q9I/cniy1J3vcInqH/fzhNqTjS0v1vbk/pl31J4t7lCXTL5rg
	7OScO3JJkVSeKkkjQCE1Da1k8joXR5PG+L3gr1YnJmfUqKJzpYzgh2l2SARCn28ZYwxBTeHlynPmy
	upW/abR1T/Y8HKNDGs/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55uQ-0000000HQn7-3ILL;
	Fri, 11 Sep 2026 18:23:34 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55uN-0000000HQmX-1vx6
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 18:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=ueyLB1JyHUtq2Y/UkowBo5RWbVMBnY8/2qD1vYiYyb0=; b=x6BgLxWCAVOhLayUQpfUdehKK8
	igmAP7meW+MULZQ9vMTnm/IJEdjahlZhJgPcke1AgsxYFvmDD4e1dJaCaKCpH6wsyAgrfT0eg2wft
	+L3ietLL8CSH/dWgBXKDjZbk4Z45dGMi58UhRIemConj6x8zs5uTQakXcVUU2HmISDMt70S2Bfk/R
	2B248fyJGICjcnquI43qkLYChvTRJpEcmWovtUN29LwVIqVVLjcQHEu1Pfp/f9UsQnfdD/pOwzoEY
	6fWyTkITU1WMJZ5KrPyKB6olE5iPq/6cHgQ9VEmFdMJmZ9gg0dKab+6uecXdM2u5GswL3tR1JeFx5
	ljtYLPCw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x55u9-000000091y5-3ODX;
	Fri, 11 Sep 2026 20:23:17 +0200
Date: Fri, 11 Sep 2026 20:23:17 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH] riscv: vector: Fix data pointer constraints in context
 save/restore
Message-ID: <aqRHFfR-v8yQP4My@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_112331_505093_0FD52CA3 
X-CRM114-Status: UNSURE (   9.51  )
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

On 2026-09-08 21:03, Troy Mitchell wrote:
> The standard vector save/restore asm advances datap but declares it as
> input-only. An inlined caller reusing the original pointer may therefore
> use the advanced address instead.
> 
> Declare datap as read-write so the compiler can preserve the original
> pointer when needed.
> 
> Fixes: 03c3fcd9941a ("riscv: Introduce struct/helpers to save/restore per-task Vector state")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  arch/riscv/include/asm/vector.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
