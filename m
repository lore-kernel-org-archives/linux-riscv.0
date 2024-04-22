Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD405C10F16
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 22:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6E5YqTCldMl5OOnJ3kDdFHW08YZliPET+/wU5m48v0=; b=U/ewjE+y1e7vd5
	XjHvUxvNTMY9pXmdeyujsqKMP/y6xWOvI/cAJXE0/78PtWe4YvSySY7HlZHN1KS3Vo4y8klcJFx52
	fhpc+kwsysd164xzSYqgblMfL51jXqeSIzVJ6jYbo5ABBnxv2/XBBhINDLMx0NuwNv/dLYYzz0iJG
	JtBht3guQrFvyXPC6M3hMSNBROqKWX5DpMrhYJOB7DwyKFncTZ/y6Ts305XKlWwqHPvOhH2jU3eii
	XEKgREoHx1leSFafkVEb6SeszVElClOhxBzfbsVRwUp/88s9st9zxMf5yEl8UPw6Xo37f6Symv7S9
	zIJC9Ac2nfP/vKbp1ZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz2HV-0000000FDsZ-3GML;
	Mon, 22 Apr 2024 22:37:01 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz2HR-0000000FDqP-001H
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 22:36:58 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-618944792c3so54683107b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Apr 2024 15:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713825407; x=1714430207; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Vrhmpa3ShfhKy426e9PesLiq9Wc9QUOO6IUnrj6mzg=;
        b=JS5cbEUocGS3zo1CyJXuVH/yfdVllpKjnitCFmnp84g8FM/lMuNZv49qKuuNm1IvJm
         apajShAGt/4TDPvLMi9czNPbfpyvhQtb8R21+dPh6hUSFTvC7BP6lSQN+8TFIrQQQ+Cq
         Fa6ChKPgqexD4Lgf1lHOzD/n7Ha1Iuy242y+WLhPUJwGsHathCWC+WDNprETww7uWJBs
         VY6ulPaM4ZnV6NVII1H57w/NKR7nz0/eAJklV3gF65Vy0bqht1gJvyPUxo9OJ8wk5hsC
         Hh6cTZ78SOTEFPOM8Og/alfA3Z69P0eszun/gdlhw3lhIbdNhP1h/tyYOzOQ+ffrIPBO
         +1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713825407; x=1714430207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Vrhmpa3ShfhKy426e9PesLiq9Wc9QUOO6IUnrj6mzg=;
        b=qZ+MJfRCObXRpv+gaQJlfPyfjZ8aKrrkq3CsfRnvQZmK9SZ/YsHac25oreS2DIFjTM
         tUiFW4RZPtiAtIncuxk8IysvFAY3F/AnipAUja4p15TFhWsgKOcQHDPzdy3pHzgRodOf
         uecfYgDniFlUVuYjm1TCDWJJqJQAr+gEbSQhDEUk+7ebLvhLselmDhKkwiEt+Cdc7iyW
         MBrFlFl1xqFm3QkRRF3Ek3gyCd0m3YryQnw3qTE/X1zd+gr3KJ7hkakGjYTWozDvttat
         aAtQ39KA4oJ1LsM2gFyaJI9Ei2C+r9NprvSug8FSxbp+TZzbsYhJMGjj+9/jpy+tltxL
         WHsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtJ6WiniDL39e79H7rH+mNney/5RrktIe75gamyDX8xvJ3rwyE+W5kDpZ05ZolVZ9eDGMg3hvWq8cenjU7+sR9TrGW7a1k8PlvU4jIcb8M
X-Gm-Message-State: AOJu0YzLpOI6EMWj6qlk79SEX5pL7UsqQrQow5K5Gt1A7TQnvV8GgVgK
	brTYi0SmehB6NelvQKjOq5hpxQfG8JWAgKY1kmxUPleC4Mc1hyRefSMxsK3Clt8=
X-Google-Smtp-Source: AGHT+IEljTe/eBlC9QwS8pBDCtNLjp86UAkLxUI6GRLcDWeT5wxU7x94hj9rac1gQjdir+fuZ+ou3Q==
X-Received: by 2002:a05:690c:c1e:b0:61a:e4ae:82b5 with SMTP id cl30-20020a05690c0c1e00b0061ae4ae82b5mr12842588ywb.6.1713825407579;
        Mon, 22 Apr 2024 15:36:47 -0700 (PDT)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id w2-20020a814902000000b0061ac30230bfsm2187629ywa.49.2024.04.22.15.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 15:36:46 -0700 (PDT)
Date: Mon, 22 Apr 2024 18:36:45 -0400
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
Message-ID: <ZibmfbLnGCb9gmow@ghost>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-10-ajones@ventanamicro.com>
 <20240419-chafe-leotard-e5daee19b1c8@spud>
 <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
 <20240419-disdain-litmus-82874cc4872e@spud>
 <ZiKeYRnXxtLUtkkW@ghost>
 <20240421-f63f90c2146deb0695b84441@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240421-f63f90c2146deb0695b84441@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_153657_088411_43CD0F5F 
X-CRM114-Status: GOOD (  60.25  )
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

On Sun, Apr 21, 2024 at 12:20:03PM +0200, Andrew Jones wrote:
> On Fri, Apr 19, 2024 at 12:40:01PM -0400, Charlie Jenkins wrote:
> > On Fri, Apr 19, 2024 at 04:19:52PM +0100, Conor Dooley wrote:
> > > On Fri, Apr 19, 2024 at 05:16:05PM +0200, Andrew Jones wrote:
> > > > On Fri, Apr 19, 2024 at 03:45:46PM +0100, Conor Dooley wrote:
> > > > > On Fri, Apr 19, 2024 at 03:53:24PM +0200, Andrew Jones wrote:
> > > > > > Add description for the Zawrs (Wait-on-Reservation-Set) ISA extension
> > > > > > which was ratified in commit 98918c844281 of riscv-isa-manual.
> > > > > > 
> > > > > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
> > > > > >  1 file changed, 12 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > index 468c646247aa..584da2f539e5 100644
> > > > > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > @@ -177,6 +177,18 @@ properties:
> > > > > >              is supported as ratified at commit 5059e0ca641c ("update to
> > > > > >              ratified") of the riscv-zacas.
> > > > > >  
> > > > > > +        - const: zawrs
> > > > > > +          description: |
> > > > > > +            The Zawrs extension for entering a low-power state or for trapping
> > > > > > +            to a hypervisor while waiting on a store to a memory location, as
> > > > > > +            ratified in commit 98918c844281 ("Merge pull request #1217 from
> > > > > > +            riscv/zawrs") of riscv-isa-manual.
> > > > > 
> > > > > This part is fine...
> > > > > 
> > > > > 
> > > > > > Linux assumes that WRS.NTO will
> > > > > > +            either always eventually terminate the stall due to the reservation
> > > > > > +            set becoming invalid, implementation-specific other reasons, or
> > > > > > +            because a higher privilege level has configured it to cause an
> > > > > > +            illegal instruction exception after an implementation-specific
> > > > > > +            bounded time limit.
> > > > > 
> > > > > ...but I don't like this bit. The binding should just describe what the
> > > > > property means for the hardware, not discuss specifics about a
> > > > > particular OS.
> > > > > 
> > > > > And with my dt-bindings hat off and my kernel hat on, I think that if we
> > > > > want to have more specific requirements than the extension provides we
> > > > > either need to a) document that zawrs means that it will always
> > > > > terminate or b) additionally document a "zawrs-always-terminates" that
> > > > > has that meaning and look for it to enable the behaviour.
> > > > 
> > > > IIUC, the text above mostly just needs to remove 'Linux assumes' in order
> > > > to provide what we want for (a)? I'm not sure about (b). If Zawrs is
> > > > unusable as is, then we should probably just go back to the specs and get
> > > > a new standard extension name for a new version which includes the changes
> > > > we need.
> > > 
> > > An (official) new name for the behaviour that you actually want, especially
> > > if the patchset sent the other day does not have the more stringent
> > > requirement (I won't even pretend to understand Zawrs well enough to know
> > > whether it does or not), sounds like the ideal outcome. That way you're
> > > also sorted on the ACPI side.
> > 
> > What would be the purpose of a vendor implementing WRS.NTO (and putting
> > it in the DT) that never terminates? The spec says "Then a subsequent
> > WRS.NTO instruction would cause the hart to temporarily stall execution
> > in a low- power state until a store occurs to the reservation set or an
> > interrupt is observed." Why is this wording for WRS.NTO not sufficient
> > to assume that an implementation of this instruction would eventually
> > terminate?
> >
> 
> We can invoke smp_cond_load_relaxed(addr, VAL || anything_we_want()). This
> means we may not expect VAL ever to be written, which rules out "until a
> store occurs". As for "an interrupt is observed", we don't know which one
> to expect to arrive within a "reasonable" amount of time. We need to know
> which one(s), since, while wrs.nto will terminate even when interrupts are
> globally disabled, we still need to have the interrupt(s) we expect to be
> locally enabled. And, the interrupts should arrive in a "reasonable"
> amount of time since we want to poll anything_we_want() at a "reasonable"
> frequency.
> 
> So, we need firmware to promise to enable exceptions if there aren't any
> such interrupts. Or, we could require hardware descriptions to identify
> which interrupt(s) would be good to have enabled before calling wrs.nto.
> Maybe there's already some way to describe something like that?
> 
> Thanks,
> drew

Ahh okay I am caught up now. So the wording we are looking at in the
spec is:

"When executing in VS or VU mode, if the VTW bit is set in hstatus, the
TW bit in mstatus is clear, and the WRS.NTO does not complete within an
implementation-specific bounded time limit, the WRS.NTO instruction will
cause a virtual instruction exception."

With the concern being that it is possible for "implementation-specific
bounded time limit" to be infinite/never times out, and the kernel
enters a WRS where the reservation set is not required to be invalidated
for the condition we are waiting on to become true.

An option here would be to enforce in the spec that this time limit is
finite. If the original intention of the spec was to have it be finite,
then this would not be an issue. If the intention was to allow no time
limit, then this would probably have to be a new extension.

We are also able to change the kernel to not allow these conditions that
would break this interpretation of WRS. I found three instances in the
kernel that contain a condition that is not dependent on the wrs
reservation.

1.
# queued_spin_lock_slowpath() in kernel/locking/qspinlock.c
val = atomic_cond_read_relaxed(&lock->val,
			       (VAL != _Q_PENDING_VAL) || !cnt--);

The first condition will only become true if lock->val changes which
should invalidate the reservation. !cnt-- on the otherhand is a counter
of the number of loops that happen under-the-hood in
atomic_cond_read_relaxed. This seems like an abuse of the function and
could be factored out into a new bounded-iteration cond_read macro.

2.
# osq_lock() in kernel/locking/osq_lock.c
if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
			  vcpu_is_preempted(node_cpu(node->prev))))

VAL is the first condition and won't be a problem here since changes to
it will cause the reservation to become invalid. arm64 has hard-coded
vcpu_is_preempted to be false for the same exact reason that riscv would
want to (the wait wouldn't be woken up). There is a comment that
points this out in arch/arm64/include/asm/spinlock.h. riscv currently
uses the default implementation which returns false.

need_resched() should not be a problem since this condition only changes
when the hart recieves an IPI, so as long as the hart is able to receive
an IPI while in WRS it will be fine.

3.
# __arm_smmu_cmdq_poll_until_msi() in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
smp_cond_load_relaxed(cmd, !VAL || (ret = queue_poll(&qp)));

arm driver, not relevant.



The only case that would cause a problem in the current implementation
of the kernel would be queued_spin_lock_slowpath() with the cnt check.
We are able to either change this definition, change the spec, or leave
it up to the vendor who would be hit by this issue to change it.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
