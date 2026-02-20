Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD32AC5AC80
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 15:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uw7hRIfVZ5IH5u/oZ231F92LYzS0iDC+fWgEwrwdxEY=; b=i16A5v05v1I3Zw
	1O34wURDEaP37jXhdQMuBOxGZeFTlZnfbm4dNMkPajuEYLMtFHWD7MkGELLU5TF8o1vP1DaXVP22+
	qV+tn6YeoUg0gQ9A6K72Kyoidm7QPKsY0206zjGcp6YYeJ6pbc41+88TTqGKZDMAo2UO2oDHtECQB
	ZdySCST3k7xyl00wyn4WcDNT/DWYyk8BIKbf8uVWl6FfU1/QROrfIGWgAwkgONW46YuDAekUsIDZy
	XeewR01n4LjXMRelldv89E0oZE9kEr5Zq2w6wdl95Tk8J4sNgFk90aFItmrhMd7sqqoCheiCnxcdP
	FzZf1qKBpkYV8BcXL9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSrv-0000000F84P-1x9I;
	Fri, 20 Feb 2026 15:56:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSru-0000000F83s-2wtZ
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 15:56:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 298F160134;
	Fri, 20 Feb 2026 15:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F59FC116C6;
	Fri, 20 Feb 2026 15:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771602997;
	bh=lsJRWKysIL8aeyzSTgTOUKlJ13kiiXwHbXQJZUVl7co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YN8fXPbbEFT+duqDNZltyflLcS5sX07jZD9MDDbhP256mhydzUF+UL2Vzun+TPVSO
	 gyvqrA+EH+Oshf3MA6XV3JBLi3rEcPYg6anCj93/F/dlbi7XmQE5VRFaMy5I9v64Uo
	 yAO8V29EBdtjCzd9nSX1L81VMw+UDB4Xypp6LaUgow1vlE5W9joXNXBsusk/ElJGpE
	 5GrzvOvCWWAV1zXaM83j/jJK3AEGv6Tb4SUcl4I/fSMXAGx9jyrk5yiRX68ydH24Qg
	 TBCogSBYXFLkSQH2aNoQyPh0TsPP/2R26vIiNs8zWxA7FYhyI3wkKzf0dJr80ukQ5q
	 PcEiLY7uYDzIg==
Date: Fri, 20 Feb 2026 23:38:03 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>, Zong Li <zong.li@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Zhouyi Zhou <zhouzhouyi@gmail.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] riscv: fix minor typos and style issues in
 XIP code
Message-ID: <aZh_25dtac8wDFNe@xhacker>
References: <20260214023804.677127-1-kunwu.chan@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260214023804.677127-1-kunwu.chan@linux.dev>
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

On Sat, Feb 14, 2026 at 10:38:02AM +0800, Kunwu Chan wrote:
> Fix a few minor issues found in riscv XIP-related code:

'RESEND' isn't expected to be used as you did in this series.
You sent the v1 series on Feb 14, only 4 days ago, the series doesn't
miss any dev window.
https://lore.kernel.org/linux-riscv/8ee1b065-b021-411b-b5ee-22c4a108cbce@linux.dev/T/#t

> 
> - xip_fixup.h: comment typo (_start vs _sdata) and spaces-vs-tab
> - head.S: spelling typo and wrong #endif comment

I'm sorry, but how important is fixing comment/spelling typo or #endif
comment among maintainship? The riscv XIP code doesn't stand on itself,
but heavily affects and is affected by other riscv arch common code.

> 
> Kunwu Chan (2):
>   riscv: xip_fixup.h: fix comment typo and whitespace issue
>   riscv: head.S: fix typo and wrong #endif comment
> 
>  arch/riscv/include/asm/xip_fixup.h | 4 ++--
>  arch/riscv/kernel/head.S           | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
