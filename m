Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2D3C7115B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 19:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dU4CS0LlOX645/xgDd2kgcMzUA3/A6q+PZbYwmIJ2sg=; b=l7IBXjgruoUEat
	XVa6NFz3HZ3lJ53ZSgSBiQmgNE+qbmoqrpTGO8otQSLmlmkM2FsV/+s490f+1OI7t7AiS5maOvmLc
	0MtIRzQzE2to/T051rHhtDgc4pTrBmE4RySEaHzPJCVnPcJrAoC6XZXn4SrqblzYw+2vZR/+WF4F/
	hy2uw3eMYp9p8+JbVvdPNYcJijX2M4tl+T9s9c3FObotegT955LMbpezQvloF8lGdm+sy+Fqn8IXm
	O8nQEAu4ZhGAHClnvqpKfgFWhXSfPv5B1eDqZgoi8d4kksqmQgDQcG5BuQhReJlZHgREh77QDNn2e
	NAqdYCiDDWiNlqhTq8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uShkB-0000000GTYu-2a8D;
	Fri, 20 Jun 2025 19:49:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uShSU-0000000GRq9-3rWJ
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 19:31:32 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750447888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvtcQZDO3suQ8qW+ppaEep+NmtIaA6n6Fu//p+1dkeg=;
	b=b3ml1U1G5s4S65os7qBjooL6xKAyhvSx9aD54KK74ByJbA8vwown3JGrYKr0mWKwI9YSMR
	gtlLkZah1cRh5hJEYKyxpvnN6Hr5laTRGstzK6lg5eHV8TgCx8vebYhc++Mi4MVNfwuhpj
	ixJrcLRHGqZQ+0oo9GIBBA4UEAzBkfD5OoissdlUPC0pgZ2xVptTmXkOa140FRm0QNje3d
	ecfhhdwu59WmdZ75RrAFkB+j1A5b8sQI7raWjONKwQ/F/OpfOXx1Q7LdGXX/0nFQeK1kLu
	B9pQ5+yPnieS9sQa8w+fEslOwNWfdxYbHZAYzHFwoJrLlUjhvElvkHyVMnuj9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750447888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvtcQZDO3suQ8qW+ppaEep+NmtIaA6n6Fu//p+1dkeg=;
	b=boEha1kiO8b7hgJcg6tNW5hjvJWGGVpT3ac4Oi5mGinPFHCDLJUJ5acUngD3TUePO8gTD+
	cYSdfTKh4wjfbWCA==
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
Subject: Re: [PATCH v3 1/7] riscv: helper to parse hart index
In-Reply-To: <20250612143911.3224046-2-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-2-vladimir.kondratiev@mobileye.com>
Date: Fri, 20 Jun 2025 21:31:27 +0200
Message-ID: <87v7oqp5v4.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_123131_096883_96A3C67C 
X-CRM114-Status: UNSURE (   5.40  )
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
> ---
>  arch/riscv/include/asm/irq.h |  2 ++
>  arch/riscv/kernel/irq.c      | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)

Can the RISCV folks please ack/review this one so this pile can go
through the irqchip tree?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
