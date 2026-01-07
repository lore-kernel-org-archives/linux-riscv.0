Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D07FD0D16F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 20:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0wdQAhwtwP4ntoLsQkhnKgkNdC3kQfl/0TlQcXh/RQ=; b=R+O/8ayToXQf+v
	loh/FcQLIGjSdTcriybJz/cXA3nQySw+nNeCumVAwlxQIwK0pr6oKJI0VQY+0qa9753mbxVN3+KmB
	wSZj/1urY1Ydv2NkDxIMW9PAmljqrdy0CQnjtdvaMVHV79TYYzPe61bGeoLfGxxSMkJWRqKvbSvN8
	rrXkILqFiP3fwHYMuF5E1i+JD6j4/Wz6i9amBU8ZA8nLDrtbBr84SUzXP5fACv19gcSByo5Nq53C/
	yy4KsHftzwsJj8+FgIQex8OEEu4ZcTHlOklTLZHKYJwCQYJ3xEs0dRhYh+NUF6JjoNuyceEkXNz+K
	pjIQABeHqQlAEZvSpS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZmU-0000000FaeF-0f7j;
	Wed, 07 Jan 2026 20:05:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZmT-0000000Fae8-0YbL
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 20:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CD566000A;
	Wed,  7 Jan 2026 20:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A63C4CEF1;
	Wed,  7 Jan 2026 20:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767816319;
	bh=jEtgHbvNWyLEoPqaBWoLLo5a+HGkQl1MtsX4PhinL2c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LyHM9ASrxDZI7FjA4L7iAmkmf49u0p7PXtyJNdGrzNr22issJo+lcPIxry1T7oRn2
	 szSHSaLR5cgZfd6An6Xh8M6k+juTHfbf7KkQ629NAaQbRW+FHa4X76ZRQnfg9R5JBO
	 x1xaNsnvIkpXIAwnqlTf0nYK9bOdC5rSEL8HkGeg0AMo9PoLckXrdc/ZnW/FeFH/or
	 /XZnxTPcy3AllcjytpVIbCGfZFhfD9djCTkh4Z+8oSFteKCOQSBTBOS/AO5wWWHMzF
	 1wWKWW7RbOUkG2X+78f41+hImFpnDjrl5AEsNrd8rMZ9x16Yka41/6KoAFma/fjb+N
	 bBulu/n6wZ6lw==
Date: Wed, 7 Jan 2026 13:05:16 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    palmer@dabbelt.com, pjw@kernel.org
Subject: Re: [PATCH] riscv: cpu_ops_sbi: smp_processor_id() returns int, not
 unsigned int
In-Reply-To: <20260102145839.657864-1-ben.dooks@codethink.co.uk>
Message-ID: <872d9775-a510-a833-bea0-9cbd53664bb8@kernel.org>
References: <20260102145839.657864-1-ben.dooks@codethink.co.uk>
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

On Fri, 2 Jan 2026, Ben Dooks wrote:

> The print in sbi_cpu_stop() assumes smp_processor_id() returns an
> unsigned int, when it is actually an int. Fix the format string to
> avoid mismatch type warnings in rht pr_crit().
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Thanks, queued for v6.19-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
