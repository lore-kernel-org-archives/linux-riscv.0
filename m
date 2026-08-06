Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C581C56205
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 18:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5uGM8zufcjAqIWGqCz2ZyStVC4RycF+Kk6qzHlWYmU=; b=CqzzoC6rbc+j3X
	aZ9RU2zW7hxZWTD/Brkvbb6wjfKF4LR7D1y8drl8K5Fdt2U+E0KhR9byVpnxHeGd1YPJGSEziC0qX
	0uyGz7cMHk7HjRAsyvPd88pDX3Vr0AMFjtOi80Cjsd4/Hptr+jJRi6FvK9xP8rYvDRkhnW9dBPkm1
	7WMhPd5C+IftlrvL93X8+5q2zyiS1PBr2G4VOgAJXCi2Nt+SnY++ixrt5YayeKzPbwc101Zy9CWUI
	/LdS1gPsj1m4DUMdMKJiRY/E7SuCW+Hlex4qqDRvuatYbGhEVvsiSEALiWrX50fr/ozKHZHId1U/S
	jXSePp/+oi3RzIb8ca7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2Yh-00000006REb-2YE8;
	Thu, 06 Aug 2026 18:11:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2Yf-00000006REB-2BWX
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 18:11:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1CF340686;
	Thu,  6 Aug 2026 18:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFFE1F000E9;
	Thu,  6 Aug 2026 18:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786039868;
	bh=0T0nm59oEOzhQ7dZZBbQ7PwPF0an5VEFwwAuzNi0ip4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=enYE6clmiaUpvvaQM+VLpeXDgO8G0Nbintt3yoWk3/YYzIfBnbjwYjT0V0Nn85JS4
	 AnkZcc9Ws+sLYtZSQSSJr4NIWETT5//xBNIVjIERYPPfT65QWAP5L990tzsGNvlibo
	 oB23613SXvZPrw4+zLSwaMrsQ2OZDJI5UBS2D3hRn033D+oUfmO0I3jSF8vB4HGrcK
	 6R2e9iqPEs/JHZMb7Lp2ThXvBokvL3TP2s0/j9fNFK/L3PVL7wrYp3RSvHcPHur580
	 J8FyMtBI5DoR1WqMZnBHm5oQJZaXJd8Ll9nHQzyDRQLlU32lZxBGcJ8O+WpmWWtpHE
	 B/VpV14u4Bm1w==
Date: Thu, 6 Aug 2026 12:11:07 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
    Conor Dooley <conor.dooley@microchip.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
    devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: cpufeature: Clarify ISA spec version for
 canonical order
In-Reply-To: <20260125-supm-ext-id-v2-3-1e3b9714c860@riscstar.com>
Message-ID: <fa0c32d5-292a-d502-bdda-dd876192d1cc@kernel.org>
References: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com> <20260125-supm-ext-id-v2-3-1e3b9714c860@riscstar.com>
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

On Sun, 25 Jan 2026, Guodong Xu wrote:

> Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
> Unprivileged Architecture. The chapter numbering differs across
> specification versions - for example, in version 20250508, the ISA
> Extension Naming Conventions is chapter 36, not chapter 27.
> 
> Historical versions of the RISC-V specification can be found via Link [1].
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Link: https://riscv.org/specifications/ratified/ [1]
> Fixes: 99e2266f2460 ("RISC-V: clarify ISA string ordering rules in cpu.c")
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Thanks, queued for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
