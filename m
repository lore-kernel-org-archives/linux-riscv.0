Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E250C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 08:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24Qq25LdlA9oCt1h1j+2xHtOQFol/zfT36OcRB92KrU=; b=QKrkXbOTYnnXBj
	BK1OCla4b41No3Y512e36Su6zIwmeyhFPpfGT3AStGH17ybEpNOARfckl+wFTMWM0jC6uFzAEdxCK
	7N2U5DZGMXYGqGKI579EQSU6b68HB1CHUfNZUzC6+6d1qR05SFK+8TEJW9TiiXp9S+ae2oguL5Kl/
	gq0tROTeGUd/mD0+doPkiXwxG7G7OBrEQn39VZPl+4/JeCT64O4OQov8BF5+DFNRHymCAyDRcJrV0
	2s/QgMTL1AVPhRSyNmcoU28M9fci/sKlhyALXdtb8lOiH2mYG60YG6YpkCq2R70VbFELadmca6yuX
	3mkEsbWaxoHG7d1ZfWzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZplN-001BQE-Bo; Thu, 31 Mar 2022 08:02:37 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZplJ-001BNh-Iu; Thu, 31 Mar 2022 08:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=Ljnr2vFjApNZSheu0hoKLS+M8qY09rSnnSAIPptuv0M=;
 b=XqN4mdACTB5MdkY2tRJq+CrwjbZA+JBupYSABR7A3eEl/zNKi2mmm/6E
 tvga1VdLH/HlpvvPHq4JBXGiIfQjn4hVZAAEbgptW3U2FOQ1u20N7pyjt
 kDGT6urtfwgSA3xEr9HsEFlBBFd9P/aLIDHDzrJA0weASAQPZH53G9Qy6 M=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,224,1643670000"; d="scan'208";a="10134955"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2022 10:02:27 +0200
Date: Thu, 31 Mar 2022 10:02:25 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Anup Patel <apatel@ventanamicro.com>
cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Anup Patel <anup@brainfault.org>
Subject: Re: question about arch/riscv/kvm/mmu.c
In-Reply-To: <CAK9=C2XYp5a2diGNLf8=a05uPP-gAmUodtMbDWrByiW9skjjmA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2203311001000.3195@hadrien>
References: <alpine.DEB.2.22.394.2203162205550.3177@hadrien>
 <CAK9=C2XYp5a2diGNLf8=a05uPP-gAmUodtMbDWrByiW9skjjmA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_010234_376995_941DC0F4 
X-CRM114-Status: GOOD (  18.22  )
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



On Thu, 31 Mar 2022, Anup Patel wrote:

> On Thu, Mar 17, 2022 at 2:40 AM Julia Lawall <julia.lawall@inria.fr> wrote:
> >
> > Hello,
> >
> > The function kvm_riscv_stage2_map contains the code:
> >
> > mmu_seq = kvm->mmu_notifier_seq;
> >
> > I noticed that in every other place in the kernel where the
> > mmu_notifier_seq field is read, there is a read barrier after it.  Is
> > there some reason why it is not necessary here?
>
> When I did the initial porting of KVM RISC-V (2 years back), I did
> not see such a barrier being used along with mmu_notifier_seq
> field hence the current code.
>
> I am certainly okay adding it to be consistent with other architectures.
>
> Can you send a patch for this ?

Sure, will do.

julia

>
> Thanks,
> Anup
>
> >
> > thanks,
> > julia
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
