Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46321C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 18:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tG9As0DeaB2aHZKiqZuswH8PC8qf5Jm0IGpPNvldNsg=; b=KLASHBu/fZrX0A
	TAAL6qHFMgtwTGNZPPFx0neeb0OL76HvyE5sPJMNfQoSCnP5f8mmV9PZnDb6E12OC3lLaEeBXd2zA
	i+3U8fctt3y5Yti1XRTH8UJS8tmUPT8LTR/V3/spUutLKwl9jG9eK7DQDMhTcPoGO6axBvmdZcBH1
	26d6HozLQp39O1pYmWSAXJ2ZI3guZjWJaQcCJ/Sg+0AUwwES+GWj4f4WR2cvbNtInuEBAUQKRdIpp
	mnhDvCL621A0KTzebRRWRpdYu6xNJxgt/34jC9EF/sg/QrppMPkGwKKgvWMgcQhJWxA60kSsMwD1N
	udVWvKo6K+AsJSkWQXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzKS9-000000013fB-0nkr;
	Tue, 23 Apr 2024 18:01:13 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzKRv-000000013aH-46wO
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 18:01:02 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-de55708c616so817542276.1
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 11:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713895257; x=1714500057; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ruXmLN/UvQwTr3oZGWnl8Qpluv6+VMewHhW300M9b8o=;
        b=WT7O2p+yzpF/DGsUeR9CTVIIcSvE8sctbH7naFciTYY+l5c2P4erGXk9lWoYSdgwOn
         wFWh9WEFW9QQvojZBn5GO82V4mE5PycC/QBYsFSi79MDLvn8k9FaE1zMOLGaVcTjSEoU
         e0oMWTxoqt413r12VXO4mbMxSBM6aHJSmDy72vMA4GjApTyrLpRHCStihaBxpneCEOi7
         jJS/JzCb31MobSrhfovliSqpXuaw9y2ae5sbIvt+5IcV7DmnzS+cg0etvcWwav5sJGkN
         5XoW0OLLwqNmYO/rnk+ghhCz28Z5kmHi178IYwFhfXS5M15C4YiibOfG4aMHxHJ5rZic
         Aw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713895257; x=1714500057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruXmLN/UvQwTr3oZGWnl8Qpluv6+VMewHhW300M9b8o=;
        b=cNE01XDxwrcoDOGLAZdnFEfIoXDz72AD12MDHMY4VJ6xudBvvFTVOM0L3hk2YLcodr
         knt9p7zkcuvlnOHS1Ekh477JlrBalXiseMxx817jPBD521acGJwKWJf8KxflYq08N01A
         26vmA6nn65EUNAW5fEDPO9Ugd0nRE1hdQL3U8BgAgNd7iKTorYmnrrhN29bsALbpTk7y
         sFpnTvKPOuxtFX8d9iOXY4ax0O5Yww9ltbkPReVhsEUpilrRvo0tZmYEYQQ4eQIGMVt6
         kYMkdQDH0Y6C0YnlbZwJnG7C8nJ1wF2JrkepX9TQZa0Sio54M6dxW/+07w+1go/7tzQA
         18JA==
X-Forwarded-Encrypted: i=1; AJvYcCX/PfL7QXAMWI86qmukeawqIUZrNCwUPjKg6Q1Z8ndSL2J7Fxg+1LFyNg/bwC5RZP6NDJh6egmMH2HdwEajh9oVKD40rVoxes4EqAd3CBHH
X-Gm-Message-State: AOJu0YwPE0xwcuxcsJMZzOXz/fdNOWqgWz6jPNcoFb3hbKX+Yv5IIGhO
	VM9ZkneMlqi8vICZkpr4n3CWPAoE8ObGjEkTPANsM7q7Ydm2fdLuWaNYgWeMe0E=
X-Google-Smtp-Source: AGHT+IFeSayoJdfNCiZBWXKiMtSmsaH8Ne38oZHRgd3aBw8ywcYnlBz0y8Ts1iIsJ0n8+CYNFP1T3Q==
X-Received: by 2002:a25:2b05:0:b0:de5:6a82:49dd with SMTP id r5-20020a252b05000000b00de56a8249ddmr69482ybr.13.1713895257306;
        Tue, 23 Apr 2024 11:00:57 -0700 (PDT)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id e196-20020a25d3cd000000b00dcda3959006sm2659558ybf.33.2024.04.23.11.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 11:00:56 -0700 (PDT)
Date: Tue, 23 Apr 2024 14:00:53 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, anup@brainfault.org,
	atishp@atishpatra.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	christoph.muellner@vrull.eu, heiko@sntech.de,
	David.Laight@aculab.com, parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
Message-ID: <Zif3VZALGtLtl3D3@ghost>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-10-ajones@ventanamicro.com>
 <20240419-chafe-leotard-e5daee19b1c8@spud>
 <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
 <20240419-disdain-litmus-82874cc4872e@spud>
 <ZiKeYRnXxtLUtkkW@ghost>
 <20240421-f63f90c2146deb0695b84441@orel>
 <ZibmfbLnGCb9gmow@ghost>
 <20240423-ed9ddb701be1df4a25e29f31@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240423-ed9ddb701be1df4a25e29f31@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_110100_139157_D93E34DF 
X-CRM114-Status: GOOD (  61.64  )
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

On Tue, Apr 23, 2024 at 10:46:01AM +0200, Andrew Jones wrote:
> On Mon, Apr 22, 2024 at 06:36:45PM -0400, Charlie Jenkins wrote:
> > On Sun, Apr 21, 2024 at 12:20:03PM +0200, Andrew Jones wrote:
> > > On Fri, Apr 19, 2024 at 12:40:01PM -0400, Charlie Jenkins wrote:
> ...
> > > > What would be the purpose of a vendor implementing WRS.NTO (and putting
> > > > it in the DT) that never terminates? The spec says "Then a subsequent
> > > > WRS.NTO instruction would cause the hart to temporarily stall execution
> > > > in a low- power state until a store occurs to the reservation set or an
> > > > interrupt is observed." Why is this wording for WRS.NTO not sufficient
> > > > to assume that an implementation of this instruction would eventually
> > > > terminate?
> > > >
> > > 
> > > We can invoke smp_cond_load_relaxed(addr, VAL || anything_we_want()). This
> > > means we may not expect VAL ever to be written, which rules out "until a
> > > store occurs". As for "an interrupt is observed", we don't know which one
> > > to expect to arrive within a "reasonable" amount of time. We need to know
> > > which one(s), since, while wrs.nto will terminate even when interrupts are
> > > globally disabled, we still need to have the interrupt(s) we expect to be
> > > locally enabled. And, the interrupts should arrive in a "reasonable"
> > > amount of time since we want to poll anything_we_want() at a "reasonable"
> > > frequency.
> > > 
> > > So, we need firmware to promise to enable exceptions if there aren't any
> > > such interrupts. Or, we could require hardware descriptions to identify
> > > which interrupt(s) would be good to have enabled before calling wrs.nto.
> > > Maybe there's already some way to describe something like that?
> > > 
> > > Thanks,
> > > drew
> > 
> > Ahh okay I am caught up now. So the wording we are looking at in the
> > spec is:
> > 
> > "When executing in VS or VU mode, if the VTW bit is set in hstatus, the
> > TW bit in mstatus is clear, and the WRS.NTO does not complete within an
> > implementation-specific bounded time limit, the WRS.NTO instruction will
> > cause a virtual instruction exception."
> 
> That's what the hypervisor should promise to do when there's no other
> guarantee of wrs.nto terminating (but the hypervisor likely wants to
> anyway since it wants guests to trap on wrs.nto in order to potentially
> schedule the lock holding VCPU). The firmware of the host should likewise
> promise to set mstatus.TW when there's no guarantee of wrs.nto
> terminating, but that's likely _not_ something it normally would want to
> do, so hopefully there will always be implementation-specific "other
> reasons" which guarantee termination.
> 
> > 
> > With the concern being that it is possible for "implementation-specific
> > bounded time limit" to be infinite/never times out,
> 
> The implementation-defined short timeout cannot be infinite, but it only
> applies to wrs.sto. While using wrs.sto would relieve the concern, it
> cannot be configured to raise exceptions, which means it's not useful in
> guests. If we want to use wrs.sto in hosts and wrs.nto in guests then we
> need a paravirt channel which allows an "enlightened" guest to determine
> that it is a guest and that the hypervisor has configured wrs.nto to
> trap, which then indicates it's a good idea to patch wrs.sto to wrs.nto.
> But, adding paravirt stuff should be avoided whenever possible since it
> adds complexity we'd rather not maintain.
> 

That still wouldn't solve this issue, because the wrs.nto guest may still
never wakeup in the implementation-specific way?

> > and the kernel
> > enters a WRS where the reservation set is not required to be invalidated
> > for the condition we are waiting on to become true.
> > 
> > An option here would be to enforce in the spec that this time limit is
> > finite. If the original intention of the spec was to have it be finite,
> > then this would not be an issue. If the intention was to allow no time
> > limit, then this would probably have to be a new extension.
> 
> wrs.nto has been specified to never timeout.
> wrs.sto has been specified to never raise exceptions.
> 
> If we had an instruction which would timeout when mstatus.TW/hstatus.VTW
> is clear and raise exceptions when set, then that's the one we'd choose.
> 

Yes, this does seem like the ideal situtation.

> > 
> > We are also able to change the kernel to not allow these conditions that
> > would break this interpretation of WRS. I found three instances in the
> > kernel that contain a condition that is not dependent on the wrs
> > reservation.
> > 
> > 1.
> > # queued_spin_lock_slowpath() in kernel/locking/qspinlock.c
> > val = atomic_cond_read_relaxed(&lock->val,
> > 			       (VAL != _Q_PENDING_VAL) || !cnt--);
> > 
> > The first condition will only become true if lock->val changes which
> > should invalidate the reservation. !cnt-- on the otherhand is a counter
> > of the number of loops that happen under-the-hood in
> > atomic_cond_read_relaxed. This seems like an abuse of the function and
> > could be factored out into a new bounded-iteration cond_read macro.
> > 
> > 2.
> > # osq_lock() in kernel/locking/osq_lock.c
> > if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
> > 			  vcpu_is_preempted(node_cpu(node->prev))))
> > 
> > VAL is the first condition and won't be a problem here since changes to
> > it will cause the reservation to become invalid. arm64 has hard-coded
> > vcpu_is_preempted to be false for the same exact reason that riscv would
> > want to (the wait wouldn't be woken up). There is a comment that
> > points this out in arch/arm64/include/asm/spinlock.h. riscv currently
> > uses the default implementation which returns false.
> 
> The operative word is 'currently'. I plan to eventually get riscv's
> vcpu_is_preempted() working since we already laid the groundwork by
> adding a preempted flag to the SBI STA struct.
> 
> > 
> > need_resched() should not be a problem since this condition only changes
> > when the hart recieves an IPI, so as long as the hart is able to receive
> > an IPI while in WRS it will be fine.
> > 
> > 3.
> > # __arm_smmu_cmdq_poll_until_msi() in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > smp_cond_load_relaxed(cmd, !VAL || (ret = queue_poll(&qp)));
> > 
> > arm driver, not relevant.
> > 
> > 
> > 
> > The only case that would cause a problem in the current implementation
> > of the kernel would be queued_spin_lock_slowpath() with the cnt check.
> > We are able to either change this definition, change the spec, or leave
> > it up to the vendor who would be hit by this issue to change it.
> 
> We could attempt to document restrictions on the condition given to
> smp_cond_load_relaxed() and then change the callers to honor those
> restrictions, but that doesn't sound too easy. How will we remove
> vcpu_is_preempted() on x86?

The solution here seems like it would be to not use wrs for riscv in
this case.  We really would need an alternate extension that allows wrs
in a guest to be guaranteed to trap into the host at some point. 

> 
> We should probably start the process of a new extension which has the
> hybrid wrs.sto/nto instruction, but I'm reluctant to, since, in practice,
> the current wrs.nto is probably fine. I don't really expect there to be
> implementations that never terminate, even though I'd rather we document
> that it's _required_ wrs.nto terminates, or that exceptions be raised.
> Maybe I'm attempting to document it in the wrong place though. Maybe this
> is more of a Documentation/arch/riscv/boot.rst type of thing.
> 

wrs.nto is most likely sufficient. A new extension will take a long
time. We could go ahead with wrs.nto, propose the extension, and when
the extension is ready switch over to it. In the meantime have this
behavior documented.

> Thanks,
> drew

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
