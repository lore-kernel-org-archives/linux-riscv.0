Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C3EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yeiJKJGEGyqlpHwvdOsueBcBLN0dr6V6ICGA/dKZKMQ=; b=ASREmbQZ78srKT
	rFaclp56aR64iKtaY0XUnFG2LVbYXybIqd5bWDM/a0JMqc9i76h/TUUQiDG7bxBr5oz5VC1CnWtm/
	eux+5si4HXu3E80kgo5T+AS53xCMx34pqe5fipUNxhSnxi5R5GwanKMeceXJrGSLe3BaRdhvirdJE
	G6rBxJQHiy9AlrZfBf1U4TATLRem842VItE5b54iHAcAN9gGpSGyDqYI4VKDOKITZxj79tZxchOTL
	yNSKizkcgMbmQThsApFfFE4RG/zEXF0YBZac0OgpmsKtAPgIuZtHiULBZalw2NssmikJ1FtlEqXW0
	GlCvs+6eaYYA5++i87cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy85W-006nMT-6i; Thu, 24 Nov 2022 09:00:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy85S-006nGP-DY
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 09:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669280402; x=1700816402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SYMn1xjyNPJRlpfzzjpdSX05OnXmyIiSsLWKetV8rHk=;
  b=ITWsyFUnl5lcSOrQfwuRV17rHf/P0qF9DjbCOKXF/HkmOyWng3x9GsYX
   CrkYh638jkeB+iXwI/FuACpb1dS0JR+YlxcQAwZMWSnqIJRMWmbZ6IzIw
   CJwanYPrsoBOOZ5Xv6kGMLlG9REjAenDrV+FAkR9V8c9KUSn9VM1JwyBM
   yigYbFhRqAO0UIgZZo+XNwe+bhj0i9izBl2dClmZDPZ3JHi5pPvmlof3O
   ztrQXt8ne5ntMdR002qflSLxr/DaF4zkWaqpaL1ThJfa1z164jK+VozgX
   eAG80bYV3myRgHHhCPCojRTbKGSHxxTesgzx2z7emI0xQydtvuA8NcBmG
   g==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="124918613"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Nov 2022 01:59:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 24 Nov 2022 01:59:51 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 24 Nov 2022 01:59:50 -0700
Date: Thu, 24 Nov 2022 08:59:32 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Deepak Gupta <debug@rivosinc.com>
CC: Guo Ren <guoren@kernel.org>, <palmer@dabbelt.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH] riscv: VMAP_STACK overflow detection thread-safe
Message-ID: <Y38ydMoqmqOPfBs0@wendy>
References: <20221124005006.1788315-1-debug@rivosinc.com>
 <CAJF2gTQ=Vr6neABtz9JSCei6oPEsyWTpb-Y=Rxt5jy6n1VEtGA@mail.gmail.com>
 <CAKC1njRfxNx8r5SP7qsbouCFfb1L4w63paQibb=cFCBhWDXNXA@mail.gmail.com>
 <CAJF2gTRC-qm76=aaLh75amO0JJLO2P4eZaJXH-TBSV0c7iqUBA@mail.gmail.com>
 <20221124071022.GA1149630@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221124071022.GA1149630@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_010002_619249_79DBF00E 
X-CRM114-Status: GOOD (  19.19  )
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

On Wed, Nov 23, 2022 at 11:10:22PM -0800, Deepak Gupta wrote:
> On Thu, Nov 24, 2022 at 02:31:25PM +0800, Guo Ren wrote:
> > On Thu, Nov 24, 2022 at 1:57 PM Deepak Gupta <debug@rivosinc.com> wrote:

> > > On Wed, Nov 23, 2022 at 5:28 PM Guo Ren <guoren@kernel.org> wrote:

> > > > On Thu, Nov 24, 2022 at 8:50 AM Deepak Gupta <debug@rivosinc.com> wrote:

> > > >> Fixes: 31da94c25aea835ceac00575a9fd206c5a833fed
> > > >
> > > > The patch gives more significant change than the Fixes, and Fixes would expand to the previous stable versions. Please don't set it as a Fixes, but an improved OVERSTACK dead path performance feature.
> > > >
> > > 
> > > Not a performance feature but more like correctness.
> > > If kernel died and two CPUs raced to kernel stack overflow,
> > > death post-mortem should be straightforward.
> > We already have had a fixup, and your patch likes a feature with a
> > significant change.
> > https://lore.kernel.org/linux-riscv/20221030124517.2370-1-jszhang@kernel.org/
> > If it is for correctness, the simple lock is enough.
> 
> Sure lock is enough. It's different way to solve the problem. But I don't
> think it qualifies as significant change.

Something to bear in mind is where in the cycle we are - there's likely
just over a week left before v6.1.
Since the lock is sufficient to fix the problem for v6.1, it's easy to
view this patch as an optimisation or improvement that should go on top
of that, smaller, patch.
Especially when you have some questions yourself about the correctness
for 32 bit!
I've got no technical comment to make about the discussion here, but
looking in from the "outside", that's the easy conclusion to jump to.


>	REG_S x31, TASK_TI_SPILL_REG(tp)
>	asm_per_cpu sp, overflow_stack, x31
>	li x31, OVERFLOW_STACK_SIZE
>	add sp, sp, x31
>	REG_L x31, TASK_TI_SPILL_REG(tp)

btw, for this sort of thing, could you please use some whitespace to
align the operands? Makes things significantly more readable.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
