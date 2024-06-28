Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271A8C2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 14:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezcYYivSv1KX38SfxVF/XlCJPnFR2etSVoJAWYviPPE=; b=OC8Da9C4x5zSUm
	MLk6qsIq3Z9NjHo6jkl4RfwJKOd0ZwXEuN3nZ/gjmrE0JIVJQcY7JcKCSEMfiW2fxXaJ1qhKm5g02
	qwDczhOsdDbeuxYF9N4LFymBp38sLjVu0bZXeBiDHxTRxxWYtdhxtOXkUCyW95x8NLbD7gBXDkCUr
	Vysr4jyyfO7owXqZrl9U6OfJ02q8BaD+1fReNP1XO2IuGquEM4oHG+GJT+9ttqWv195FEY8+AeE7+
	6JULLXHcUtlO1d9pP4Izr4u7SxcyYyoFbt9OeKFdRhbe9vE3Jh1DiM7/eH41CZWlF8clQw/LmsemV
	qil5aJuoSqqbWvVTkGgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCbq-0000000E16y-4AoT;
	Fri, 28 Jun 2024 14:29:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCbf-0000000E121-2Qlc;
	Fri, 28 Jun 2024 14:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C4FB6219F;
	Fri, 28 Jun 2024 14:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB426C116B1;
	Fri, 28 Jun 2024 14:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719584981;
	bh=kL2tETLKqVwjJYlaNcjDteqOWD5Jwtaof/gDNuH6kGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2QxQOJQyiXjljP25DKWOu9KP3a0BdNyi92/nJyUyCRfueo0an168oQTibnWq74EJ
	 EABYn40fg1u0GnZ9Z7I7m7bRuxFhQGNhX9alAZesPa0UCBglnQU5bXtBgcHrtjniCP
	 qGxFYZ7lfkh6BQO74YXihP6Aa0PQaxMN83Mu6LoI=
Date: Fri, 28 Jun 2024 10:29:37 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Conor Dooley <conor@kernel.org>
Cc: Atish Kumar Patra <atishp@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drivers/perf: riscv: Reset the counter to
 hpmevent mapping while starting cpus
Message-ID: <20240628-quantum-sophisticated-ferret-5eaec4@lemur>
References: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
 <20240626-misc_perf_fixes-v3-2-de3f8ed88dab@rivosinc.com>
 <96ff4dd2-db66-4653-80e9-97d4f1381581@sifive.com>
 <CAHBxVyHx9hTRPosizV_yn6DUZi-MTNTrAbJdkV3049D-qsDHcw@mail.gmail.com>
 <20240626-eraser-unselect-99e68a1f5a3e@spud>
 <20240626-spyglass-clutter-4ff4d7b26dd4@spud>
 <CAHBxVyEg2uKKdikXib77JDmCKs8qDGJHvj3stsFgCgO0U9omRg@mail.gmail.com>
 <20240626-pedigree-retype-dd7f1e54ac2b@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626-pedigree-retype-dd7f1e54ac2b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_072943_730868_3340383C 
X-CRM114-Status: UNSURE (   8.24  )
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

On Wed, Jun 26, 2024 at 11:11:54PM GMT, Conor Dooley wrote:
> > Strange. I modified and sent the patch using b4 as well. It's missing
> > my sign off too.
> 
> `b4 shazam` should pick up trailers provided on the list, signoffs
> included. `b4 shazam -s` will add yours. TBH, I am not sure why that is
> not the default behaviour.

Some projects don't use the DCO model, so they don't require Signed-off-by
trailers.

-K

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
