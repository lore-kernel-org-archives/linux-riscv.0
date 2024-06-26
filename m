Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864D5C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 15:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SgEqHcaGTuDL1WJyG9ArH6X3wUX2iaCaMvA67a+A3w=; b=rs4zT30/hC4fPd
	QIJ+dWVZpKR1pzDnb5PTq4pmXWvvoAJbX8XST+Zw8fTWDC/WI+I0Z/VXhR/d0Z5QWUkoGU38GPa0W
	DVWPtTwPpiBhQGdeqcHCuJ1QNFmQ+LLTN5rgHdgc3xQklgqAsMu3JA/1zl6AW9ZtSn+OvRb93OoQI
	MegtA7olS/ROkcqNn8WuwxPdSRTaqbgADpMxQPtkF1jPR/Havj1HeR0hsOYoYBPMVSWASPvXRy+Js
	VtLTIY3S7qPohd45PdyaVE8FqwDAsIsaO4CvXR3BsID2uiDvW7W4Ix9pt0iFrpx0owkiYToIs1RRA
	4R5nbCDpy8TfHXllzhhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUR4-00000007MkT-2Y0f;
	Wed, 26 Jun 2024 15:19:50 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUR1-00000007MjR-053E
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 15:19:48 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52cdd03d6aaso4843595e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 08:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1719415185; x=1720019985; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6iEOK15WI1rhgNU2zYHVUeu6QEahV+IbtVceeygeaJM=;
        b=Dk0ktrYsm46mhixEmoK6wLdxCX2y5j8bmxljMcM6VwJeKi0EfnaSk4SMgMRkAc08Gv
         nFSeZnzbh335dM8+XOJwDS8wHY/G5pSavwoUo95Hw6QbItUz7hINmXwSokJlkvY0vg5K
         zfStbkdq/YlXCpeCmRq5GG7BAvauoUbfgurVnjgYsemDrPen3orujzlpcm5xy0PMK+j2
         cH59MHICdmP73+9+PvslS5mhi0kRGDy5Y5Y90JNQxVIMJaY3TP1T5Iifak+eTgRPBFwS
         Rwb7lHx4xxdNacZqpH3oqeaAtpB0Ypo+7oSvYzoL+cVhPDgDsdkGCj02yhiKZL2VFzVe
         Glag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719415185; x=1720019985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iEOK15WI1rhgNU2zYHVUeu6QEahV+IbtVceeygeaJM=;
        b=XUlQlEVFmLIL4/x2BVl0t/xhbHZgJpFScona1AegqvGtES5fs30m4aI/Q12t/LYnKC
         yZUBGAz+x0PHWXYmdbR0e0k7Ck4HE70DGg8gki4Fp7bFxlWd86xY/wVfwHTY4yqmGHtU
         7inWmMeAB+98uo3L4zzh9TSNbP++f0hcJNNg0hbbDKrmD/rla+imF5QHrK9uVLLi1t+r
         MGEfVGCO2Lqdq+h743zmNUTLQdrKBzAFhe6FVXbKFfah1F5Vlua8DyvXuc7oEIk1V5nG
         7Uqn9arIT1pYApqBU+eNZC01pvQSDfUKHwtPftoQCAZDoFuVeonMtEMbELPes/M4yvkr
         AJRQ==
X-Gm-Message-State: AOJu0YzLUAuk+CpkqD4qUl1xeqncm8NBhGwFY0updbISEu9Ddm5WT6Pb
	lpHXNKjc+2tesk1COG3Kt96Dvew5ZKzWFKOdlW7vUrnzX1Caj3b9355xdjWO5wg=
X-Google-Smtp-Source: AGHT+IFXzn4yvytk0IjlfPpV2BBuDZnWbO0mSlcdFMRLi4Z2QsSrcJvzWwqrxGtz8uVDJsrNTkghyQ==
X-Received: by 2002:a19:384d:0:b0:52c:8abe:51fb with SMTP id 2adb3069b0e04-52ce063e56bmr6713305e87.10.1719415183852;
        Wed, 26 Jun 2024 08:19:43 -0700 (PDT)
Received: from localhost ([194.25.246.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c823c1c3sm29694545e9.3.2024.06.26.08.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 08:19:43 -0700 (PDT)
Date: Wed, 26 Jun 2024 17:19:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	Conor Dooley <conor.dooley@microchip.com>, anup@brainfault.org, atishp@atishpatra.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, christoph.muellner@vrull.eu, 
	Heiko Stuebner <heiko@sntech.de>, Charlie Jenkins <charlie@rivosinc.com>, David.Laight@aculab.com, 
	parri.andrea@gmail.com, luxu.kernel@bytedance.com
Subject: Re: [PATCH v3 0/6] riscv: Apply Zawrs when available
Message-ID: <20240626-203887902f79278e20134dea@orel>
References: <20240603-f8650a2cc220b73cf52d77c7@orel>
 <mhng-4fc810f5-fd3a-44f3-bd78-9a6b7bf2ab77@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-4fc810f5-fd3a-44f3-bd78-9a6b7bf2ab77@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_081947_110743_8125B498 
X-CRM114-Status: GOOD (  50.96  )
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

On Wed, Jun 26, 2024 at 07:34:48AM GMT, Palmer Dabbelt wrote:
> On Mon, 03 Jun 2024 05:36:42 PDT (-0700), ajones@ventanamicro.com wrote:
> > Hi Palmer,
> > 
> > I submit our concerns of wrs.nto to RVI ARC for consideration. They
> > discussed it but don't believe there's a need for concern. The
> > expectation is that there will always be enough interrupt activity
> > and that those interrupts with activity will not likely be locally
> > disabled.
> > 
> > Can we consider this series for 6.10?
> 
> Sorry I forgot about this one, Anup just brought it up in the patchwork
> meeting.  He's going to ack the KVM bits, then I'll pick it up.

Thanks Palmer!

drew


> 
> > 
> > Thanks,
> > drew
> > 
> > On Fri, Apr 26, 2024 at 12:08:20PM GMT, Andrew Jones wrote:
> > > Zawrs provides two instructions (wrs.nto and wrs.sto), where both are
> > > meant to allow the hart to enter a low-power state while waiting on a
> > > store to a memory location. The instructions also both wait an
> > > implementation-defined "short" duration (unless the implementation
> > > terminates the stall for another reason). The difference is that while
> > > wrs.sto will terminate when the duration elapses, wrs.nto, depending on
> > > configuration, will either just keep waiting or an ILL exception will be
> > > raised. Linux will use wrs.nto, so if platforms have an implementation
> > > which falls in the "just keep waiting" category (which is not expected),
> > > then it should _not_ advertise Zawrs in the hardware description.
> > > 
> > > Like wfi (and with the same {m,h}status bits to configure it), when
> > > wrs.nto is configured to raise exceptions it's expected that the higher
> > > privilege level will see the instruction was a wait instruction, do
> > > something, and then resume execution following the instruction. For
> > > example, KVM does configure exceptions for wfi (hstatus.VTW=1) and
> > > therefore also for wrs.nto. KVM does this for wfi since it's better to
> > > allow other tasks to be scheduled while a VCPU waits for an interrupt.
> > > For waits such as those where wrs.nto/sto would be used, which are
> > > typically locks, it is also a good idea for KVM to be involved, as it
> > > can attempt to schedule the lock holding VCPU.
> > > 
> > > This series starts with Christoph's addition of the riscv
> > > smp_cond_load_relaxed function which applies wrs.sto when available.
> > > That patch has been reworked to use wrs.nto and to use the same approach
> > > as Arm for the wait loop, since we can't have arbitrary C code between
> > > the load-reserved and the wrs. Then, hwprobe support is added (since the
> > > instructions are also usable from usermode), and finally KVM is
> > > taught about wrs.nto, allowing guests to see and use the Zawrs
> > > extension.
> > > 
> > > We still don't have test results from hardware, and it's not possible to
> > > prove that using Zawrs is a win when testing on QEMU, not even when
> > > oversubscribing VCPUs to guests. However, it is possible to use KVM
> > > selftests to force a scenario where we can prove Zawrs does its job and
> > > does it well. [4] is a test which does this and, on my machine, without
> > > Zawrs it takes 16 seconds to complete and with Zawrs it takes 0.25
> > > seconds.
> > > 
> > > This series is also available here [1]. In order to use QEMU for testing
> > > a build with [2] is needed. In order to enable guests to use Zawrs with
> > > KVM using kvmtool, the branch at [3] may be used.
> > > 
> > > [1] https://github.com/jones-drew/linux/commits/riscv/zawrs-v3/
> > > [2] https://lore.kernel.org/all/20240312152901.512001-2-ajones@ventanamicro.com/
> > > [3] https://github.com/jones-drew/kvmtool/commits/riscv/zawrs/
> > > [4] https://github.com/jones-drew/linux/commit/cb2beccebcece10881db842ed69bdd5715cfab5d
> > > 
> > > Thanks,
> > > drew
> > > 
> > > v3:
> > >  - Moved comment about expected termination from the DT binding text
> > >    to a code comment.
> > > 
> > > v2:
> > >  - Added DT bindings patch with additional Linux specifications due
> > >    to wrs.nto potentially never terminating, as suggested by Palmer
> > >  - Added patch to share pause insn definition
> > >  - Rework main Zawrs support patch to use Arm approach (which is
> > >    also the approach that Andrea Parri suggested)
> > >  - Dropped the riscv implementation of smp_cond_load_acquire().
> > >    afaict, the generic implementation, which will use the riscv
> > >    implementation of smp_cond_load_relaxed() is sufficient for riscv.
> > >  - The rework was large enough (IMO) to drop Heiko's s-o-b and to
> > >    add myself as a co-developer
> > > 
> > > 
> > > Andrew Jones (5):
> > >   riscv: Provide a definition for 'pause'
> > >   dt-bindings: riscv: Add Zawrs ISA extension description
> > >   riscv: hwprobe: export Zawrs ISA extension
> > >   KVM: riscv: Support guest wrs.nto
> > >   KVM: riscv: selftests: Add Zawrs extension to get-reg-list test
> > > 
> > > Christoph M??llner (1):
> > >   riscv: Add Zawrs support for spinlocks
> > > 
> > >  Documentation/arch/riscv/hwprobe.rst          |  4 ++
> > >  .../devicetree/bindings/riscv/extensions.yaml |  7 +++
> > >  arch/riscv/Kconfig                            | 20 ++++---
> > >  arch/riscv/Makefile                           |  3 -
> > >  arch/riscv/include/asm/barrier.h              | 45 +++++++++-----
> > >  arch/riscv/include/asm/cmpxchg.h              | 58 +++++++++++++++++++
> > >  arch/riscv/include/asm/hwcap.h                |  1 +
> > >  arch/riscv/include/asm/insn-def.h             |  4 ++
> > >  arch/riscv/include/asm/kvm_host.h             |  1 +
> > >  arch/riscv/include/asm/vdso/processor.h       |  8 +--
> > >  arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
> > >  arch/riscv/include/uapi/asm/kvm.h             |  1 +
> > >  arch/riscv/kernel/cpufeature.c                |  1 +
> > >  arch/riscv/kernel/sys_hwprobe.c               |  1 +
> > >  arch/riscv/kvm/vcpu.c                         |  1 +
> > >  arch/riscv/kvm/vcpu_insn.c                    | 15 +++++
> > >  arch/riscv/kvm/vcpu_onereg.c                  |  2 +
> > >  .../selftests/kvm/riscv/get-reg-list.c        |  4 ++
> > >  18 files changed, 146 insertions(+), 31 deletions(-)
> > > 
> > > --
> > > 2.44.0
> > > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
