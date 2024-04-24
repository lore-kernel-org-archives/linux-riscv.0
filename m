Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280EEC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 07:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTJV7PZqhcbKljZODx69EIjz4MW39J815qRRsATMoj4=; b=3z+B61v1rCodpm
	Lp4fGYQ61dmpHLxcWV2LONIh7zb8pXRu7iclXDoSVvNdhUGNMDohfinhbIS9rXImB6z6yLaQQxDgO
	tOWyQqI8T6JXK302t3Ps0Qb8mtZwBKTfNA55gZq797OjR8ZTF4xYRijYm0Cdx4gZaDjBOly0ZXkNB
	hQ9uBSnwMWDrdbKthixEvB915PwoDflhd3zm57G/FD/axWyL7lTgKhmrvARsSY80y+wisxbxWF6cw
	mTgGG75vC4YnHAUf6n1CDkD9wdbNrcZng2V5uqVBlOgtgULGHS7mVTZUrJd2foMDfOcDIcK5sIZOU
	HI0sAtJkoFoPqCBw2mEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzX9e-000000037QA-37WZ;
	Wed, 24 Apr 2024 07:34:58 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzX9a-000000037Ng-31Cp
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 07:34:56 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a557044f2ddso725841366b.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 00:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713944092; x=1714548892; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4LXEJgLHvhHFf/LPY+jkXymit/X1z2rV/5NPnlDmp7s=;
        b=ECt+nMnGirJ2da3QCUKbZEjSffJ6dRZ0ATehsXjJkxeoKPx1tTn7X7WtUVvICbgrBr
         Q7ioTsLQ0DGtWpuuhV/8rFKsln1yif9qOUlNy+Rhbk//EZRJlO9zbrbIdd9iRu06oDoa
         hSD8fp0AUrcjzIlE3qEOnbSknnarZiWeiIs02irpfjd5/iYMEulFna3+rP8JG9ESrK/t
         SwIIXkvqlVcvwqowDto6i5CaBQcZIqMh4DClEuoKLisODwPUur5WQ1z8KHVZogUuZdSL
         v75bDhGXUt7zkyLmf3IFvlP5+JSv0ipM7ia640M2w4ZQr2J0yXt7dMzhbM8xgxLiqXfM
         VMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713944092; x=1714548892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LXEJgLHvhHFf/LPY+jkXymit/X1z2rV/5NPnlDmp7s=;
        b=GGA9TS8CDBn4yjmBWjw2CbSKVVdxcaCg0lblTLWcibKvnnf9F7Nfgwkzeef4nZl0MR
         NMi1c15p2PI0OUF96LXgtl9bVfedlBKKpPuUtefmFhHvuqpyXgrWYvIUM7k/nW0V88AZ
         Mwv37grbacRo+6lSpUmhuKZ7I/LFNponbb54/26p623pNVfWCisWS6YlzMCDwZXR5aqC
         mRg6Tkz9Vl3KbeEr+sXS0Wjie6F3h2zLjN0XjJaX4YJYTK7o1CgoPOfp0XpIHkcZbx82
         wj9pfZMLTcVjFH7z+6YHfe92QwlV8A6uaieZdpT/7Rh3aFTRa1HOVPC84OAWdFKV5YPJ
         yfXA==
X-Forwarded-Encrypted: i=1; AJvYcCXswNs2sWssyFcOkv625APMaXAhb+k3GUeCV8NJc60fa/kkdjkYBm6+FujtRBsa9EGvOwmhzmoGt/k/LPMFGPT1xxEbtGA2kY2SPQR52N18
X-Gm-Message-State: AOJu0YxEN6v9KBaR2bv+b113PZZIeH9oJ/2m8zlI49Qv96kU4ximaY1c
	26+dhJ+FXcjSkIzGi/zFn/OEu2OYIqbFSxDGhkypFu8aWqd/RWCLyxRRDSEQ/u8=
X-Google-Smtp-Source: AGHT+IGQqz4abAXug0TgscjnGx3pComSEUeb+rvZU+uo756JTnYJ8qq+lK6IMXc9NV5paOnTtvA4iw==
X-Received: by 2002:a17:906:d206:b0:a4d:fcc9:905c with SMTP id w6-20020a170906d20600b00a4dfcc9905cmr889054ejz.20.1713944091520;
        Wed, 24 Apr 2024 00:34:51 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id gc24-20020a170906c8d800b00a55ac217235sm4236045ejb.90.2024.04.24.00.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 00:34:51 -0700 (PDT)
Date: Wed, 24 Apr 2024 09:34:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, devicetree@vger.kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	anup@brainfault.org, atishp@atishpatra.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, christoph.muellner@vrull.eu, 
	heiko@sntech.de, David.Laight@aculab.com, parri.andrea@gmail.com, 
	luxu.kernel@bytedance.com
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
Message-ID: <20240424-0e571b29835610c24409762b@orel>
References: <20240419135321.70781-10-ajones@ventanamicro.com>
 <20240419-chafe-leotard-e5daee19b1c8@spud>
 <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
 <20240419-disdain-litmus-82874cc4872e@spud>
 <ZiKeYRnXxtLUtkkW@ghost>
 <20240421-f63f90c2146deb0695b84441@orel>
 <ZibmfbLnGCb9gmow@ghost>
 <20240423-ed9ddb701be1df4a25e29f31@orel>
 <Zif3VZALGtLtl3D3@ghost>
 <ZigPN/iJ/gLT4DOD@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZigPN/iJ/gLT4DOD@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_003454_833324_6A2FEE73 
X-CRM114-Status: GOOD (  42.83  )
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

On Tue, Apr 23, 2024 at 03:42:47PM -0400, Charlie Jenkins wrote:
> On Tue, Apr 23, 2024 at 02:00:53PM -0400, Charlie Jenkins wrote:
> > On Tue, Apr 23, 2024 at 10:46:01AM +0200, Andrew Jones wrote:
> > > On Mon, Apr 22, 2024 at 06:36:45PM -0400, Charlie Jenkins wrote:
> > > > On Sun, Apr 21, 2024 at 12:20:03PM +0200, Andrew Jones wrote:
> > > > > On Fri, Apr 19, 2024 at 12:40:01PM -0400, Charlie Jenkins wrote:
> > > ...
> > > > > > What would be the purpose of a vendor implementing WRS.NTO (and putting
> > > > > > it in the DT) that never terminates? The spec says "Then a subsequent
> > > > > > WRS.NTO instruction would cause the hart to temporarily stall execution
> > > > > > in a low- power state until a store occurs to the reservation set or an
> > > > > > interrupt is observed." Why is this wording for WRS.NTO not sufficient
> > > > > > to assume that an implementation of this instruction would eventually
> > > > > > terminate?
> > > > > >
> > > > > 
> > > > > We can invoke smp_cond_load_relaxed(addr, VAL || anything_we_want()). This
> > > > > means we may not expect VAL ever to be written, which rules out "until a
> > > > > store occurs". As for "an interrupt is observed", we don't know which one
> > > > > to expect to arrive within a "reasonable" amount of time. We need to know
> > > > > which one(s), since, while wrs.nto will terminate even when interrupts are
> > > > > globally disabled, we still need to have the interrupt(s) we expect to be
> > > > > locally enabled. And, the interrupts should arrive in a "reasonable"
> > > > > amount of time since we want to poll anything_we_want() at a "reasonable"
> > > > > frequency.
> > > > > 
> > > > > So, we need firmware to promise to enable exceptions if there aren't any
> > > > > such interrupts. Or, we could require hardware descriptions to identify
> > > > > which interrupt(s) would be good to have enabled before calling wrs.nto.
> > > > > Maybe there's already some way to describe something like that?
> > > > > 
> > > > > Thanks,
> > > > > drew
> > > > 
> > > > Ahh okay I am caught up now. So the wording we are looking at in the
> > > > spec is:
> > > > 
> > > > "When executing in VS or VU mode, if the VTW bit is set in hstatus, the
> > > > TW bit in mstatus is clear, and the WRS.NTO does not complete within an
> > > > implementation-specific bounded time limit, the WRS.NTO instruction will
> > > > cause a virtual instruction exception."
> > > 
> > > That's what the hypervisor should promise to do when there's no other
> > > guarantee of wrs.nto terminating (but the hypervisor likely wants to
> > > anyway since it wants guests to trap on wrs.nto in order to potentially
> > > schedule the lock holding VCPU). The firmware of the host should likewise
> > > promise to set mstatus.TW when there's no guarantee of wrs.nto
> > > terminating, but that's likely _not_ something it normally would want to
> > > do, so hopefully there will always be implementation-specific "other
> > > reasons" which guarantee termination.
> > > 
> > > > 
> > > > With the concern being that it is possible for "implementation-specific
> > > > bounded time limit" to be infinite/never times out,
> > > 
> > > The implementation-defined short timeout cannot be infinite, but it only
> > > applies to wrs.sto. While using wrs.sto would relieve the concern, it
> > > cannot be configured to raise exceptions, which means it's not useful in
> > > guests. If we want to use wrs.sto in hosts and wrs.nto in guests then we
> > > need a paravirt channel which allows an "enlightened" guest to determine
> > > that it is a guest and that the hypervisor has configured wrs.nto to
> > > trap, which then indicates it's a good idea to patch wrs.sto to wrs.nto.
> > > But, adding paravirt stuff should be avoided whenever possible since it
> > > adds complexity we'd rather not maintain.
> > > 
> > 
> > That still wouldn't solve this issue, because the wrs.nto guest may still
> > never wakeup in the implementation-specific way?

The paravirt approach does solve it, because wrs.nto is specified to raise
exceptions after an implementation-specific bounded time limit when the
hypervisor sets hstatus.VTW.

> 
> Thinking about this a bit more, this is a performance penalty and not a
> correctness issue.

It's incorrect to have a design that is likely to result in bad
performance.

> This line is an optimization that allows the lock
> holder to jump the queue if the holder directly in front is a preempted
> vcpu. Eventually the vcpu will be scheduled again and give up the lock.
> So an implementation of WRS.NTO that does not have the
> "implementation-specific bounded time limit" that the spec calls out for
> WRS.NTO to raise a virtual instruction exception, would still function,
> just slower.

The problem isn't specific to virtualization. The problem is using wrs.nto
when it has not been configured to raise exceptions and there are not any
other guaranteed termination events (other than the reservation set
becoming invalid). While the paravirt solution is virtualization specific,
it works, because we would then only use wrs.nto when we know we can, and
otherwise use wrs.sto. But, as I said, I'd rather not have a paravirt
solution.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
