Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3346EC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 15:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfHRyQxepdwIzZJceU4IQfEeGl4NnLKEFhAy93g9M4U=; b=WLOvqs4pJB8ygw
	vCI0B+UT2BEtzWexBVerpo/Rsd51kh9wzrA6YIY99Au1PgBMvONOEIFrynR0w6Yp2MvhvZwzM9CzI
	C00gk2zHfTMFP8p82xtYa7TIWyWNTBcx49s5PK8Sll2MF3kKNWu3YnLkgl1Km/QP8tc+IXYsCIcD+
	33nHYhOvlEhfnmuA4znrx5j0fEeGV/Lw57pMn/upIDyM5T/cIKQFy0XPeWY59pVZIEXSBQwLR7FGu
	br2Xzn0oH7DianFsiLuj9lxuDDNjHrXF/sJeV5MgzPCcrok3VEd+Mo4kn8zwxm0F0fhVVjxAZVwgO
	vjQ0exwI35guRvA3lUdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqcO5-000TxC-Bu; Thu, 03 Nov 2022 15:44:13 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqcAR-000Nsy-Sh
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 15:30:09 +0000
Received: by mail-pg1-x532.google.com with SMTP id s196so1972592pgs.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 08:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UyUe+HbRzSrTdJquQCMiaXWC2coZG28I37xguDaJaYg=;
        b=JxP3em5mMEo8M/seyYjwqQClKWueZhrkefM7iopEbtJ9U0ARhXsBBlBaHvB0YZ+mCq
         7I2lDIbzgsTnUJXXFFd+Mf2MRkvMQ3d/mi120+0k+co+feliF2fGnlDGLipP3oo4jHIs
         yhCQnzB0LNdLsoCiyP2ThdGCDug/wevVBzx4ZCIoRVJzM62ULFanZrMyKnrfoLhgGw7L
         LE3NJVvLI80qGdb5QUdNBUYtcEfD6sTxNonp/rLGuh5no7R8ACiBwreWQkoFJnyoE1Nq
         joZ/uzznkWHqO7mwwbSR52gm1kYa+vf+hliw2Y9f1o05+cN6N5swUWJ7vJszMr5BEKoW
         HTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UyUe+HbRzSrTdJquQCMiaXWC2coZG28I37xguDaJaYg=;
        b=OzXihcHC1xl6wBycmRCV9aObJi5G0xoXVnW7prn1OWrv2KTxVqq5vkYXFMCR2Ra76i
         b/ccfLuWj3wbo/CyBgLO/+9T4+sn4Y06SnC0sO14AvIptSZ8miseKtdqjPdetEaSejtC
         q77PzRQ8FRjKsX/11Vvp1Q22ypKQ4rtZxSbBHr9HK7SdV9ijrwr5M8mXrYof6UbFnSg0
         lED9pgDIG181Qsyh9JNTy0r/6e2ADxHSAtpU9M/mXrZZzgEkJXZxzH706IJcH0HLMPg/
         63eHve4u7V3JS5RaC2QxyY24i1y7ecaSeZbmb18OPlCqYHk8owghzbt7lk0IVrfqdJiB
         EXbQ==
X-Gm-Message-State: ACrzQf2hOYDkIiHSH2jxN4vS2wIckMBwhFxv1tow3pnRKXftO0xmNn9D
	VGShRyiWYgGn/rMjoKWdSiANgQ==
X-Google-Smtp-Source: AMsMyM6by5WQXi0G4lBZGaavWsGrxKC8DeWyAUbAtvZsM8BboB9ucyemIyMYLKoI4FadI1MlyxYOPw==
X-Received: by 2002:a05:6a00:1996:b0:56d:a845:5789 with SMTP id d22-20020a056a00199600b0056da8455789mr17697890pfl.59.1667489402026;
        Thu, 03 Nov 2022 08:30:02 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id f3-20020a170902f38300b0017a018221e2sm835452ple.70.2022.11.03.08.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 08:30:01 -0700 (PDT)
Date: Thu, 3 Nov 2022 15:29:58 +0000
From: Sean Christopherson <seanjc@google.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Fabiano Rosas <farosas@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Yuan Yao <yuan.yao@intel.com>
Subject: Re: [PATCH 17/44] KVM: arm64: Do arm/arch initialiation without
 bouncing through kvm_init()
Message-ID: <Y2Pedr1MYt/P1uL0@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-18-seanjc@google.com>
 <dd59d579-4a4e-6db2-eac4-6c5c3ab71fd3@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd59d579-4a4e-6db2-eac4-6c5c3ab71fd3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_083007_981255_7A176D7D 
X-CRM114-Status: GOOD (  21.37  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 03, 2022, Philippe Mathieu-Daud=E9 wrote:
> Hi Sean,
> =

> On 3/11/22 00:18, Sean Christopherson wrote:
> > Move arm/arch specific initialization directly in arm's module_init(),
> > now called kvm_arm_init(), instead of bouncing through kvm_init() to
> > reach kvm_arch_init().  Invoking kvm_arch_init() is the very first acti=
on
> > performed by kvm_init(), i.e. this is a glorified nop.
> > =

> > Making kvm_arch_init() a nop will allow dropping it entirely once all
> > other architectures follow suit.
> > =

> > No functional change intended.
> > =

> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/arm64/kvm/arm.c | 25 ++++++++++++++++---------
> >   1 file changed, 16 insertions(+), 9 deletions(-)
> =

> >   /* NOP: Compiling as a module not supported */
> >   void kvm_arch_exit(void)
> >   {
> > -	kvm_unregister_perf_callbacks();
> =

> Doesn't this belong to the previous patch?

No, but the above changelog is a lie, there is very much a functional chang=
e here.

The goal of the previous patch is to fix the error paths in kvm_arch_init()=
, a.k.a.
kvm_arm_init().  After fixing kvm_arch_init(), there are still bugs in the =
sequence
as a whole because kvm_arch_exit() doesn't unwind other state, e.g. kvm_arc=
h_exit()
should really look something like:

  void kvm_arch_exit(void)
  {
	teardown_subsystems();

	if (!is_kernel_in_hyp_mode())
		teardown_hyp_mode();

	kvm_arm_vmid_alloc_free();

	if (is_protected_kvm_enabled())
		???	=

  }

Becuase although the comment "NOP: Compiling as a module not supported" is =
correct
about KVM ARM always having to be built into the kernel, kvm_arch_exit() ca=
n still
be called if a later stage of kvm_init() fails.

But rather than add a patch to fix kvm_arch_exit(), I chose to fix the bug =
by
moving code out of kvm_arch_init() so that the unwind sequence established =
in the
previous patch could be reused.

Except I managed to forget those details when writing the changelog.  The c=
hangelog
should instead be:

  KVM: arm64: Do arm/arch initialization without bouncing through kvm_init()
  =

  Do arm/arch specific initialization directly in arm's module_init(), now
  called kvm_arm_init(), instead of bouncing through kvm_init() to reach
  kvm_arch_init().  Invoking kvm_arch_init() is the very first action
  performed by kvm_init(), so from a initialization perspective this is a
  glorified nop.
  =

  Avoiding kvm_arch_init() also fixes a mostly benign bug as kvm_arch_exit()
  doesn't properly unwind if a later stage of kvm_init() fails.  While the
  soon-to-be-deleted comment about compiling as a module being unsupported
  is correct, kvm_arch_exit() can still be called by kvm_init() if any step
  after the call to kvm_arch_init() succeeds.

  Add a FIXME to call out that pKVM initialization isn't unwound if
  kvm_init() fails, which is a pre-existing problem inherited from
  kvm_arch_exit().

  Making kvm_arch_init() a nop will also allow dropping kvm_arch_init() and
  kvm_arch_exit() entirely once all other architectures follow suit.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
