Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB093C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=lRtHBzZnaN8j4iIjPreMGwYvcNvQ0SP+lJVNlwDcxMc=; b=q8mCET4gW0GEzaQ5Idb5McqFEk
	+fOSFjeyPx/QgpWlYU6d8mmIUPEnEA2GPC8XkoCHfchIZJN6waAMCnDAgMkqBfTMS2/Z9vMbKyr8h
	lKbVbWb+HcrjzHaOcRzDFokK6iZA6q0XVQ5lcYpDCACDKfTm4C+V76wlyt+jhbuBS5FSMnFN/YQRG
	aC0RxZ4G5Crwf1bGvydUtlw1TvPT61tndWNH88KFq9AD+6LLdFI5TNTGpNsi3weCwG5NH7X6euIEQ
	lH1tNgrdZvFwEQQ8S7a9OHfj+Qkw1B8oIL9SRoN9Y9NhMGZH9wJCJe53L2OIu8GEFBAC1pWpOkOlo
	HX1TjXFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTjc-00000007D5U-0FWh;
	Wed, 26 Jun 2024 14:34:56 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTjX-00000007D3H-2bey
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 14:34:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f6a837e9a3so41886775ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 07:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1719412490; x=1720017290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5VNvcdr+GOMqd3AUz4LJM0Lc5c5hxDnc0M3F7lKhOo=;
        b=E5i+RqqHVwVmHPrZIEof17hQ5dCw6NIs0/IfaUSH2BSdXYPIwK4v7qho002pn4gyvc
         QNF1i7Q8/A1az9zCQ3sWlWXCVlJHuV2ZR1J/7PPyNpne/VpUdOxAMxzEkVNAcIUgTFIY
         AhvhLu3iqfeePUJ7knb6IPxspYxH4DhQpjuR5UMgjlTJS9Wm+T0qHMyf+KiKIjY2eTmB
         koJqaDN6bRiJFld7OmIVdDoNyJF57wegNHwzJZE35NRzwExst18FT6YWm9s+/nyWNB4G
         2kSgrP9ZU8m8JjQD94f2SHBHqRxC6IdTWI3xe4KdmV9Wlgr9pVCsDDOf5jYc1XR8TiCO
         su0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719412490; x=1720017290;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5VNvcdr+GOMqd3AUz4LJM0Lc5c5hxDnc0M3F7lKhOo=;
        b=UUlIMn+6QMOq39T81klFwVelTTCpU5VVH7SBiigkB0DtS6KfR2i0HMcxnzNki67AGb
         HRYSzbsmPxlVWbH6TUSOVYKqKYWeVBVPXImRnlQww2tnbgmpoEso+/FmxHYGiAnkOOn0
         YOfjRygsPPZNfZ3xAJdj6WOyLu5GwXQcJXdIOEVUI8b73qZG52xlGk2mMYxfFm2M3GfO
         EYwUmSoINMjfkP8Idjlh5tHkBIz7iIlDB91sgrEQsBNJjMW3cmbeCN4Ltu+pjfd282YL
         zsd7tvEVFaRI4C52rQejL5EqEMR/t6pP/CF8F1BCi77Sj1xqK9Ap13k8mPdsKaRoYq79
         1CUw==
X-Gm-Message-State: AOJu0YzhI0Vmgz/Ei5WnbfhBAEG4C1Mbt5Q6GbO3ciTlI7tU9sq9/HX/
	KBi4lDbEwQVBrC1NkCuJbR3ZjRjVnGFlmuyziHouG6OidC2IBGMK2OX8x+2WCO9irqPM9PCDViL
	o
X-Google-Smtp-Source: AGHT+IEp/4UB5co/CZdqC2G70NzN1gU2hqU786Xmr2xKPp4w7OHaZTx7EuHkmiLRgxOsSNiTBde+WA==
X-Received: by 2002:a17:902:ccce:b0:1fa:12b4:587c with SMTP id d9443c01a7336-1fa240c50c4mr121485065ad.56.1719412489584;
        Wed, 26 Jun 2024 07:34:49 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fa7f7c8ee1sm23004635ad.219.2024.06.26.07.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:34:48 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:34:48 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Jun 2024 07:34:47 PDT (-0700)
Subject: Re: [PATCH v3 0/6] riscv: Apply Zawrs when available
In-Reply-To: <20240603-f8650a2cc220b73cf52d77c7@orel>
CC: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
  devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Conor Dooley <conor.dooley@microchip.com>, anup@brainfault.org, atishp@atishpatra.org, robh@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, christoph.muellner@vrull.eu,
  Heiko Stuebner <heiko@sntech.de>, Charlie Jenkins <charlie@rivosinc.com>, David.Laight@aculab.com,
  parri.andrea@gmail.com, luxu.kernel@bytedance.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-4fc810f5-fd3a-44f3-bd78-9a6b7bf2ab77@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_073451_738334_283E0775 
X-CRM114-Status: GOOD (  34.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 03 Jun 2024 05:36:42 PDT (-0700), ajones@ventanamicro.com wrote:
> Hi Palmer,
>
> I submit our concerns of wrs.nto to RVI ARC for consideration. They
> discussed it but don't believe there's a need for concern. The
> expectation is that there will always be enough interrupt activity
> and that those interrupts with activity will not likely be locally
> disabled.
>
> Can we consider this series for 6.10?

Sorry I forgot about this one, Anup just brought it up in the patchwork 
meeting.  He's going to ack the KVM bits, then I'll pick it up.

>
> Thanks,
> drew
>
> On Fri, Apr 26, 2024 at 12:08:20PM GMT, Andrew Jones wrote:
>> Zawrs provides two instructions (wrs.nto and wrs.sto), where both are
>> meant to allow the hart to enter a low-power state while waiting on a
>> store to a memory location. The instructions also both wait an
>> implementation-defined "short" duration (unless the implementation
>> terminates the stall for another reason). The difference is that while
>> wrs.sto will terminate when the duration elapses, wrs.nto, depending on
>> configuration, will either just keep waiting or an ILL exception will be
>> raised. Linux will use wrs.nto, so if platforms have an implementation
>> which falls in the "just keep waiting" category (which is not expected),
>> then it should _not_ advertise Zawrs in the hardware description.
>>
>> Like wfi (and with the same {m,h}status bits to configure it), when
>> wrs.nto is configured to raise exceptions it's expected that the higher
>> privilege level will see the instruction was a wait instruction, do
>> something, and then resume execution following the instruction. For
>> example, KVM does configure exceptions for wfi (hstatus.VTW=1) and
>> therefore also for wrs.nto. KVM does this for wfi since it's better to
>> allow other tasks to be scheduled while a VCPU waits for an interrupt.
>> For waits such as those where wrs.nto/sto would be used, which are
>> typically locks, it is also a good idea for KVM to be involved, as it
>> can attempt to schedule the lock holding VCPU.
>>
>> This series starts with Christoph's addition of the riscv
>> smp_cond_load_relaxed function which applies wrs.sto when available.
>> That patch has been reworked to use wrs.nto and to use the same approach
>> as Arm for the wait loop, since we can't have arbitrary C code between
>> the load-reserved and the wrs. Then, hwprobe support is added (since the
>> instructions are also usable from usermode), and finally KVM is
>> taught about wrs.nto, allowing guests to see and use the Zawrs
>> extension.
>>
>> We still don't have test results from hardware, and it's not possible to
>> prove that using Zawrs is a win when testing on QEMU, not even when
>> oversubscribing VCPUs to guests. However, it is possible to use KVM
>> selftests to force a scenario where we can prove Zawrs does its job and
>> does it well. [4] is a test which does this and, on my machine, without
>> Zawrs it takes 16 seconds to complete and with Zawrs it takes 0.25
>> seconds.
>>
>> This series is also available here [1]. In order to use QEMU for testing
>> a build with [2] is needed. In order to enable guests to use Zawrs with
>> KVM using kvmtool, the branch at [3] may be used.
>>
>> [1] https://github.com/jones-drew/linux/commits/riscv/zawrs-v3/
>> [2] https://lore.kernel.org/all/20240312152901.512001-2-ajones@ventanamicro.com/
>> [3] https://github.com/jones-drew/kvmtool/commits/riscv/zawrs/
>> [4] https://github.com/jones-drew/linux/commit/cb2beccebcece10881db842ed69bdd5715cfab5d
>>
>> Thanks,
>> drew
>>
>> v3:
>>  - Moved comment about expected termination from the DT binding text
>>    to a code comment.
>>
>> v2:
>>  - Added DT bindings patch with additional Linux specifications due
>>    to wrs.nto potentially never terminating, as suggested by Palmer
>>  - Added patch to share pause insn definition
>>  - Rework main Zawrs support patch to use Arm approach (which is
>>    also the approach that Andrea Parri suggested)
>>  - Dropped the riscv implementation of smp_cond_load_acquire().
>>    afaict, the generic implementation, which will use the riscv
>>    implementation of smp_cond_load_relaxed() is sufficient for riscv.
>>  - The rework was large enough (IMO) to drop Heiko's s-o-b and to
>>    add myself as a co-developer
>>
>>
>> Andrew Jones (5):
>>   riscv: Provide a definition for 'pause'
>>   dt-bindings: riscv: Add Zawrs ISA extension description
>>   riscv: hwprobe: export Zawrs ISA extension
>>   KVM: riscv: Support guest wrs.nto
>>   KVM: riscv: selftests: Add Zawrs extension to get-reg-list test
>>
>> Christoph M??llner (1):
>>   riscv: Add Zawrs support for spinlocks
>>
>>  Documentation/arch/riscv/hwprobe.rst          |  4 ++
>>  .../devicetree/bindings/riscv/extensions.yaml |  7 +++
>>  arch/riscv/Kconfig                            | 20 ++++---
>>  arch/riscv/Makefile                           |  3 -
>>  arch/riscv/include/asm/barrier.h              | 45 +++++++++-----
>>  arch/riscv/include/asm/cmpxchg.h              | 58 +++++++++++++++++++
>>  arch/riscv/include/asm/hwcap.h                |  1 +
>>  arch/riscv/include/asm/insn-def.h             |  4 ++
>>  arch/riscv/include/asm/kvm_host.h             |  1 +
>>  arch/riscv/include/asm/vdso/processor.h       |  8 +--
>>  arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
>>  arch/riscv/include/uapi/asm/kvm.h             |  1 +
>>  arch/riscv/kernel/cpufeature.c                |  1 +
>>  arch/riscv/kernel/sys_hwprobe.c               |  1 +
>>  arch/riscv/kvm/vcpu.c                         |  1 +
>>  arch/riscv/kvm/vcpu_insn.c                    | 15 +++++
>>  arch/riscv/kvm/vcpu_onereg.c                  |  2 +
>>  .../selftests/kvm/riscv/get-reg-list.c        |  4 ++
>>  18 files changed, 146 insertions(+), 31 deletions(-)
>>
>> --
>> 2.44.0
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
