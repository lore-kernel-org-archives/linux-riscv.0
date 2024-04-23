Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67EAC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 19:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQjKL3YbtxuBuZ0rnC6apT2QVtkNCh67Md/heGGdYTo=; b=Vnw1fyWD1d5T27
	80sKt2BYbe2Z2Y1Ypqs/PJf0d03F0G09+usn8T98YTsMXeL79HRsk8yAIq2ZPogd8Yye0PhMO2Pfq
	3V2ebqjxnc1QKEbWIjIPSt6S3Y4RNCSmMFYz0N7yUo3BFQWcTU0Owz4OHRS57tNoHy/0/aRWWjxXm
	5eJ7CiELijJZ+I7G0mNdCQx5VAnYYxWkIfNtjWQWP0TnETj/BzdejFRGYAIDF8XNz4z/5GVe7Anpt
	QWSmQvgsSgbHdy2LxgNTkKIG5N1NoONvGQ51JPPGTgbldFh6YcgfW1i3WZnrQqbmmGsmmJGi0ukUW
	hjStO+u2xbVnNmCj7BLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzM2a-00000001Jf4-3YWr;
	Tue, 23 Apr 2024 19:42:56 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzM2X-00000001Je5-1McL
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 19:42:55 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dde0b30ebe2so5645180276.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 12:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713901370; x=1714506170; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XaYZhMiM4MntjcM5EX8X8Nr2sEG/Ld443mGOWMzp3xA=;
        b=FqJOyKY1WcHw5k4IZc37XpypgdmMsyE8/efIE/ZV1Ddd70IlSWaoCWLwYFVdouwCPZ
         dvLw/AgU9dYhcbRJntLZ7q1ql8gQq0deE0KVnrwWK7Hqx9PM7hSn6SyOXmxAGRfo97lr
         4BFkwgzjWu7ZcbJmyqLhXVcDdANygnG0dUwpoyjbMNBOYXehbGYQUZ2TcAFN4M/d3QYq
         V2q3RJRpnroEBfYr+tUNeaDfU43XvFG+tgmrhOjhTMTlLHrBw/uoJxuEjp/X7nAsxJBj
         RA5exM5gYGNe2y/WHOarUFXOY+BoR9akhSHevfNy8pOup4/MddsHoVLzJHTaX+vP+NRp
         WVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713901370; x=1714506170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaYZhMiM4MntjcM5EX8X8Nr2sEG/Ld443mGOWMzp3xA=;
        b=Xpmy1fGgXMdK8GdBuj3Je3NYDJYtXyqI//trm3rCcr8bh3Wx0oRceTk6Qke7Y+N3Vs
         oyaX4fYvxAFVZ+hVEa1lrjTneNuVH1utcT0qC56iZeITaYPwBZwHVY8Lrd+bsDDYYLjR
         M+Xm/9fVztJz2gHkiuSciwozM97ug9yv0Q2aHNts2EbdONOFX7nubic6tchha7uxqt0r
         5EjiRLQjiirYM8WPP5JP1ByY2t6bK8d86eoi3bGt95plpU3P8s/DL9GRU+JzyY7dh8ap
         XQiV/UTUU0lLjpYSBO66FA7+xERSvv+jUH0C338yPCqAZhSAUnhzTSGFXbI3dh8EtBk+
         0iWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpJ301Vo0DMpHU7J+fuRLEgLjaasChSXxv4dZX1KD+YTSpAvVRqNhyeO+Ehkh9FWxfzZvHGcFwy2Q7rBp9NIdlIU/1KUZodqUjog+pBbcD
X-Gm-Message-State: AOJu0Ywfmr15Y15sZLZjZ12/MTVbkF76ON46qiXrm7pCpmSKw1S+pRVI
	DsLhRmRAKZS/mzOyF3zzuwfiVeez0qzfh44x362qIpU+sT4ytwoTRVyrNEneA2Y=
X-Google-Smtp-Source: AGHT+IGASH0GLPuJ31mzppzwDBiIjS/1WAk85jfXgfijU/ui3qzj6Pg1T1LQ1Gx7eMFMqxoJpuWr8Q==
X-Received: by 2002:a25:dc0e:0:b0:de5:53ed:bce9 with SMTP id y14-20020a25dc0e000000b00de553edbce9mr669506ybe.46.1713901370397;
        Tue, 23 Apr 2024 12:42:50 -0700 (PDT)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id y9-20020a2586c9000000b00dc9c5991ecdsm2591063ybm.50.2024.04.23.12.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 12:42:49 -0700 (PDT)
Date: Tue, 23 Apr 2024 15:42:47 -0400
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
Message-ID: <ZigPN/iJ/gLT4DOD@ghost>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-10-ajones@ventanamicro.com>
 <20240419-chafe-leotard-e5daee19b1c8@spud>
 <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
 <20240419-disdain-litmus-82874cc4872e@spud>
 <ZiKeYRnXxtLUtkkW@ghost>
 <20240421-f63f90c2146deb0695b84441@orel>
 <ZibmfbLnGCb9gmow@ghost>
 <20240423-ed9ddb701be1df4a25e29f31@orel>
 <Zif3VZALGtLtl3D3@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zif3VZALGtLtl3D3@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_124253_545949_8AD96F8D 
X-CRM114-Status: GOOD (  68.09  )
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

On Tue, Apr 23, 2024 at 02:00:53PM -0400, Charlie Jenkins wrote:
> On Tue, Apr 23, 2024 at 10:46:01AM +0200, Andrew Jones wrote:
> > On Mon, Apr 22, 2024 at 06:36:45PM -0400, Charlie Jenkins wrote:
> > > On Sun, Apr 21, 2024 at 12:20:03PM +0200, Andrew Jones wrote:
> > > > On Fri, Apr 19, 2024 at 12:40:01PM -0400, Charlie Jenkins wrote:
> > ...
> > > > > What would be the purpose of a vendor implementing WRS.NTO (and putting
> > > > > it in the DT) that never terminates? The spec says "Then a subsequent
> > > > > WRS.NTO instruction would cause the hart to temporarily stall execution
> > > > > in a low- power state until a store occurs to the reservation set or an
> > > > > interrupt is observed." Why is this wording for WRS.NTO not sufficient
> > > > > to assume that an implementation of this instruction would eventually
> > > > > terminate?
> > > > >
> > > > 
> > > > We can invoke smp_cond_load_relaxed(addr, VAL || anything_we_want()). This
> > > > means we may not expect VAL ever to be written, which rules out "until a
> > > > store occurs". As for "an interrupt is observed", we don't know which one
> > > > to expect to arrive within a "reasonable" amount of time. We need to know
> > > > which one(s), since, while wrs.nto will terminate even when interrupts are
> > > > globally disabled, we still need to have the interrupt(s) we expect to be
> > > > locally enabled. And, the interrupts should arrive in a "reasonable"
> > > > amount of time since we want to poll anything_we_want() at a "reasonable"
> > > > frequency.
> > > > 
> > > > So, we need firmware to promise to enable exceptions if there aren't any
> > > > such interrupts. Or, we could require hardware descriptions to identify
> > > > which interrupt(s) would be good to have enabled before calling wrs.nto.
> > > > Maybe there's already some way to describe something like that?
> > > > 
> > > > Thanks,
> > > > drew
> > > 
> > > Ahh okay I am caught up now. So the wording we are looking at in the
> > > spec is:
> > > 
> > > "When executing in VS or VU mode, if the VTW bit is set in hstatus, the
> > > TW bit in mstatus is clear, and the WRS.NTO does not complete within an
> > > implementation-specific bounded time limit, the WRS.NTO instruction will
> > > cause a virtual instruction exception."
> > 
> > That's what the hypervisor should promise to do when there's no other
> > guarantee of wrs.nto terminating (but the hypervisor likely wants to
> > anyway since it wants guests to trap on wrs.nto in order to potentially
> > schedule the lock holding VCPU). The firmware of the host should likewise
> > promise to set mstatus.TW when there's no guarantee of wrs.nto
> > terminating, but that's likely _not_ something it normally would want to
> > do, so hopefully there will always be implementation-specific "other
> > reasons" which guarantee termination.
> > 
> > > 
> > > With the concern being that it is possible for "implementation-specific
> > > bounded time limit" to be infinite/never times out,
> > 
> > The implementation-defined short timeout cannot be infinite, but it only
> > applies to wrs.sto. While using wrs.sto would relieve the concern, it
> > cannot be configured to raise exceptions, which means it's not useful in
> > guests. If we want to use wrs.sto in hosts and wrs.nto in guests then we
> > need a paravirt channel which allows an "enlightened" guest to determine
> > that it is a guest and that the hypervisor has configured wrs.nto to
> > trap, which then indicates it's a good idea to patch wrs.sto to wrs.nto.
> > But, adding paravirt stuff should be avoided whenever possible since it
> > adds complexity we'd rather not maintain.
> > 
> 
> That still wouldn't solve this issue, because the wrs.nto guest may still
> never wakeup in the implementation-specific way?
> 
> > > and the kernel
> > > enters a WRS where the reservation set is not required to be invalidated
> > > for the condition we are waiting on to become true.
> > > 
> > > An option here would be to enforce in the spec that this time limit is
> > > finite. If the original intention of the spec was to have it be finite,
> > > then this would not be an issue. If the intention was to allow no time
> > > limit, then this would probably have to be a new extension.
> > 
> > wrs.nto has been specified to never timeout.
> > wrs.sto has been specified to never raise exceptions.
> > 
> > If we had an instruction which would timeout when mstatus.TW/hstatus.VTW
> > is clear and raise exceptions when set, then that's the one we'd choose.
> > 
> 
> Yes, this does seem like the ideal situtation.
> 
> > > 
> > > We are also able to change the kernel to not allow these conditions that
> > > would break this interpretation of WRS. I found three instances in the
> > > kernel that contain a condition that is not dependent on the wrs
> > > reservation.
> > > 
> > > 1.
> > > # queued_spin_lock_slowpath() in kernel/locking/qspinlock.c
> > > val = atomic_cond_read_relaxed(&lock->val,
> > > 			       (VAL != _Q_PENDING_VAL) || !cnt--);
> > > 
> > > The first condition will only become true if lock->val changes which
> > > should invalidate the reservation. !cnt-- on the otherhand is a counter
> > > of the number of loops that happen under-the-hood in
> > > atomic_cond_read_relaxed. This seems like an abuse of the function and
> > > could be factored out into a new bounded-iteration cond_read macro.
> > > 
> > > 2.
> > > # osq_lock() in kernel/locking/osq_lock.c
> > > if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
> > > 			  vcpu_is_preempted(node_cpu(node->prev))))
> > > 
> > > VAL is the first condition and won't be a problem here since changes to
> > > it will cause the reservation to become invalid. arm64 has hard-coded
> > > vcpu_is_preempted to be false for the same exact reason that riscv would
> > > want to (the wait wouldn't be woken up). There is a comment that
> > > points this out in arch/arm64/include/asm/spinlock.h. riscv currently
> > > uses the default implementation which returns false.
> > 
> > The operative word is 'currently'. I plan to eventually get riscv's
> > vcpu_is_preempted() working since we already laid the groundwork by
> > adding a preempted flag to the SBI STA struct.
> > 
> > > 
> > > need_resched() should not be a problem since this condition only changes
> > > when the hart recieves an IPI, so as long as the hart is able to receive
> > > an IPI while in WRS it will be fine.
> > > 
> > > 3.
> > > # __arm_smmu_cmdq_poll_until_msi() in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > smp_cond_load_relaxed(cmd, !VAL || (ret = queue_poll(&qp)));
> > > 
> > > arm driver, not relevant.
> > > 
> > > 
> > > 
> > > The only case that would cause a problem in the current implementation
> > > of the kernel would be queued_spin_lock_slowpath() with the cnt check.
> > > We are able to either change this definition, change the spec, or leave
> > > it up to the vendor who would be hit by this issue to change it.
> > 
> > We could attempt to document restrictions on the condition given to
> > smp_cond_load_relaxed() and then change the callers to honor those
> > restrictions, but that doesn't sound too easy. How will we remove
> > vcpu_is_preempted() on x86?
> 
> The solution here seems like it would be to not use wrs for riscv in
> this case.  We really would need an alternate extension that allows wrs
> in a guest to be guaranteed to trap into the host at some point. 

Thinking about this a bit more, this is a performance penalty and not a
correctness issue. This line is an optimization that allows the lock
holder to jump the queue if the holder directly in front is a preempted
vcpu. Eventually the vcpu will be scheduled again and give up the lock.
So an implementation of WRS.NTO that does not have the
"implementation-specific bounded time limit" that the spec calls out for
WRS.NTO to raise a virtual instruction exception, would still function,
just slower.

I am not sure where the line we would draw here. Using WRS here would be
very beneficial for most implementations, but will not be optimally
efficient on some implementations of WRS in virtualization. We could
make a note that for optimal efficiency Linux recommends that a virtual
instruction exception is eventually thrown.

We also wouldn't need to mess with the cnt variable since that can only
increase during a loop by the thread that is doing the loop. It is an
optimization to break out early. Again this is purely performance. If
the implementation never breaks out without the lock variable being
changed, it will just wait until the variable is changed rather than
breaking out early.

- Charlie

> 
> > 
> > We should probably start the process of a new extension which has the
> > hybrid wrs.sto/nto instruction, but I'm reluctant to, since, in practice,
> > the current wrs.nto is probably fine. I don't really expect there to be
> > implementations that never terminate, even though I'd rather we document
> > that it's _required_ wrs.nto terminates, or that exceptions be raised.
> > Maybe I'm attempting to document it in the wrong place though. Maybe this
> > is more of a Documentation/arch/riscv/boot.rst type of thing.
> > 
> 
> wrs.nto is most likely sufficient. A new extension will take a long
> time. We could go ahead with wrs.nto, propose the extension, and when
> the extension is ready switch over to it. In the meantime have this
> behavior documented.
> 
> > Thanks,
> > drew
> 
> - Charlie
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
