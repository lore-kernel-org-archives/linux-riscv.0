Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2F7C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 21:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JvSPEUPSxHtZ42WYcyeek3rbqtFccqrnLRvkQO+cozA=; b=Pva86y0njb1Ia0
	ZZF2p4h/yhD6Od83z9Kwt+f32jojYBbtPvUwCo62uwNxGcxIN5fBvSbVgcEGRApfavHMjpvpZ4NX+
	Az/z1sDmLs1UKRXuFrbArSA85HK+/i0kzeJl7a7gqXO9ZHgD2MqpUpFR7hmR0rMSF31kztIsvoCuv
	ORCKo8+HN7pvqAJklvZSGuJx4aXjIsOPvX18pBVN/aH6bP0QRZY4DJBqO9WXADKiIbmwbOEJ3XHB8
	FJc0W0nFGMJERiQT4H3WXahzack70+XQJ3phUuLaIPeHo8+v5J+qpmS2ou4eRSDfdgkz7h+aayE97
	0h/H36/giGT2w/Mu/HXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os9xF-000osy-EW; Mon, 07 Nov 2022 21:46:53 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os9x4-000oqA-Mm; Mon, 07 Nov 2022 21:46:44 +0000
Received: by mail-pl1-x632.google.com with SMTP id v17so12369062plo.1;
        Mon, 07 Nov 2022 13:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9On9UDwN9+FMOJXKCMZYipbKJoIjLKP2XZ3U7kBuoB0=;
        b=GL+2Bxv6ry2q2tVdZRODeD97j7WTZ0CqlPqVG3cOZfSQ2lPpNfGbSsDDWxIi7pHIp0
         4gPpC/0UyTeXngfMw/90jVGCYvfydu4VVDIBdRhsclgKtmxCEiA9BP4R87XQG30smBdC
         1/LRsqd/o2s4hFf8dQGeyUXxQVNajfdobkSuQnz0LYFbUg3nN2WjiofwzLBJS7P0QSlq
         3E2aD8E0qfRqk/z6hwmiW9lLNW6MmCIaXMhDFh5+LVoso6k/SENsDAmWDZa1hpQYz//Q
         JF3KaJnULb3SlFFzyr0MclyB75dQs6HtyFHyOI25a5zATM3F+OUwHUTUTEkKDNPpwCyo
         BpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9On9UDwN9+FMOJXKCMZYipbKJoIjLKP2XZ3U7kBuoB0=;
        b=OEVrp3nyt4F/sYXPSB809TbiDIbUsy/3GsiPZBIqFC53NAhXEDUKySaxErMuVDBf04
         YhsdKrA0zOitKVkxjycMk+Jhbito/+e2eXDQTnkLlXuodyo2JusIhdzhTMzRFn4qTy/Y
         EVJ4iP92GSI68+18pmgzYH0PiRo6jg4W9q2pbnT1j1yO3HowDSdfeDbRVovtWbfnU6bI
         gNEbPkDoGtXrZDdhBlDNmwmb0TLaaCmOqbiJ2Cwb6bSe7jnZ0rSvwMkDoCojxHEhN99I
         HDc+ub8V9NWojPapq9s6bMUyRKaTNkQMDEU3W+TQXkgi8IG7GCdrNNUJJ4v1xGwL8ns1
         T0YQ==
X-Gm-Message-State: ACrzQf36cwdb10P0UvUMN2rT6QCju2EY+zkd9hhEqf3FXxBXuNvwSJis
	0IziWoOH5jyKy9adoSLx7pM=
X-Google-Smtp-Source: AMsMyM5nI4bmuY9lD4XinO2gz+Xc6KHSLBRiOXpXoSFa21NNV37M1qdfO6ImmoOBa63VChvhPC/Cjg==
X-Received: by 2002:a17:90b:1d12:b0:20c:8edd:59a3 with SMTP id on18-20020a17090b1d1200b0020c8edd59a3mr52739175pjb.222.1667857596321;
        Mon, 07 Nov 2022 13:46:36 -0800 (PST)
Received: from localhost ([192.55.54.55])
        by smtp.gmail.com with ESMTPSA id i126-20020a626d84000000b0056c0b98617esm4981650pfc.0.2022.11.07.13.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 13:46:35 -0800 (PST)
Date: Mon, 7 Nov 2022 13:46:34 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Isaku Yamahata <isaku.yamahata@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
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
Subject: Re: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
Message-ID: <20221107214634.GE1063309@ls.amr.corp.intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221104071749.GC1063309@ls.amr.corp.intel.com>
 <Y2V1oslbw24/2Opd@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2V1oslbw24/2Opd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_134642_770461_DED4E49B 
X-CRM114-Status: GOOD (  18.49  )
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

On Fri, Nov 04, 2022 at 08:27:14PM +0000,
Sean Christopherson <seanjc@google.com> wrote:

> On Fri, Nov 04, 2022, Isaku Yamahata wrote:
> > Thanks for the patch series. I the rebased TDX KVM patch series and it worked.
> > Since cpu offline needs to be rejected in some cases(To keep at least one cpu
> > on a package), arch hook for cpu offline is needed.
> 
> I hate to bring this up because I doubt there's a real use case for SUSPEND with
> TDX, but the CPU offline path isn't just for true offlining of CPUs.  When the
> system enters SUSPEND, only the initiating CPU goes through kvm_suspend()+kvm_resume(),
> all responding CPUs go through CPU offline+online.  I.e. disallowing all CPUs from
> going "offline" will prevent suspending the system.

The current TDX KVM implementation disallows CPU package from offline only when
TDs are running.  If no TD is running, CPU offline is allowed.  So before
SUSPEND, TDs need to be killed via systemd or something.  After killing TDs, the
system can enter into SUSPEND state.


> I don't see anything in the TDX series or the specs that suggests suspend+resume
> is disallowed when TDX is enabled, so blocking that seems just as wrong as
> preventing software from soft-offlining CPUs.

When it comes to SUSPEND, it means suspend-to-idle, ACPI S1, S3, or S4.
suspend-to-idle doesn't require CPU offline.

Although CPU related spec doesn't mention about S3, the ACPI spec says

  7.4.2.2 System _S1 State (Sleeping with Processor Context Maintained)
  The processor-complex context is maintained.

  7.4.2.4 System _S3 State or 7.4.2.5 System _S4 State
  The processor-complex context is not maintained.

It's safe to say the processor context related to TDX is complex, I think.
Let me summarize the situation. What do you think?

- While no TD running:
  No additional limitation on CPU offline.

- On TD creation:
  If any of whole cpu package is software offlined, TD creation fails.
  Alternative: forcibly online necessary CPUs, create TD, and offline CPUs

- TD running:
  Although it's not required to keep all CPU packages online, keep CPU package
  from offlining for TD destruction.

- TD destruction:
  If any of whole cpu package is software offlined, TD destruction fails.
  The current implementation prevents any cpu package from offlinining during
  TD running.
  Alternative:
  - forcibly online necessary CPUs, destruct TD, and offline CPUs again and
    allow CPU package to offline
  - Stash TDX resources somewhere. When cpu packages are onlined, free those
    release.

- On SUSPEND:
  TODO: Allow CPU offline if S1 is requested.
  - suspend-to-idle: nothing to do because cpu offline isn't required
  - ACPI S1: Need to allow offline CPUs.  This can be implemented by referencing
    suspend_state_t pm_suspend_target_state is PM_SUSPEND_TO_STANBY.
  - ACPI S3/S4: refuse cpu offline.  The system needs to kill all TDs before
    starting SUSPEND process. This is what is implemented.

Thanks,
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
