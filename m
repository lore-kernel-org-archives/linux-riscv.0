Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D26FB5EA8
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 03:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sfxsnQah9c27d51fQwQ61UyFoqSf0VdgQ9M47ZziUxI=; b=cVst5AvdbrpKTgtLDzJ3EIeBut
	h8KggXeazmTeL/ML4VGy2LJJeZALXxpQF6UEGYB3FzemafZ5XaXRQfYDaBPpG/isuEzJfrYaBczFs
	Ewwipt2KMIZjEtmjOqgZpwdZI9kUADfEfssez1nGUeOP8fsvP2VMSW6lR+ruSCWNgnTRW8052hXkL
	xZZlAc0ROn1YrJ5tkAnnFazaPFeiBzWK503t6FL0ZwFx14MUoswHek9VAOljY6tp1xqOV2eDecxQJ
	t+QcfDu6StXZLLAOUvJuMgtxmFlOiSMX54KsHJn62bZ4Gkb70SzwYC0mVgpHfcsN5GNhycgyxPF1n
	jEms0Bqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LCS-00000005KMk-3qaq;
	Tue, 17 Mar 2026 03:34:32 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LCQ-00000005KME-0L1k;
	Tue, 17 Mar 2026 03:34:31 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fZcyQ4BJtz9tnK;
	Tue, 17 Mar 2026 04:34:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773718462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uvk8oVjzmRANMbF/sHn+D9/IRAR8TIyr9Hly+56noQ8=;
	b=Ov74Wu4/8R4LezoE7zlwKi8qjigSeDb2mUjjW4IzGDcOg3igVrO94EY8x+xJVHaNbiUL+K
	vdiznsbLL/wYRpgQN+VZXeR1kliYPzxeSnN516L5NQMH88N/3Zka0JMyXZdsM6h7+3CfD2
	wbMsmsF0tETBwabnEbDBLD6zjb/oG03MDrYsBHMWuFCTYRvQwJOYOJtUV9R2DMEEmffDUZ
	6dHUBC8gCHoZyVihM6gFGdtHbZWlj8arWi9gbRQybzthKLg+onwUSYqwEYqsdiU1pgIlcv
	DVw+5+eTOj8dM9yJ6Z1/LGK8XBkTWti7peiN+PskUQczMIc/EyqRuvDX/Zx96g==
Date: Mon, 16 Mar 2026 19:34:17 -0800 (PST)
From: vdso@mailbox.org
To: Naman Jain <namjain@linux.microsoft.com>, ssengar@linux.microsoft.com
Cc: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Michael Kelley <mhklinux@outlook.com>, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <1755043210.33472.1773718457301@app.mailbox.org>
In-Reply-To: <20260316121241.910764-1-namjain@linux.microsoft.com>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
Subject: Re: [PATCH 00/11] Drivers: hv: Add ARM64 support in mshv_vtl
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-MBO-RS-ID: 6dc41640b0ac1e9fe30
X-MBO-RS-META: wrn3tzu87eqwbcxxwe6mtaf6tg1g6t31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_203430_329977_0ACE9390 
X-CRM114-Status: GOOD (  16.05  )
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


> On 03/16/2026 5:12 AM  Naman Jain <namjain@linux.microsoft.com> wrote:
> 
>  
> The series intends to add support for ARM64 to mshv_vtl driver.
> For this, common Hyper-V code is refactored, necessary support is added,
> mshv_vtl_main.c is refactored and then finally support is added in
> Kconfig.

Hi Naman, Saurabh,

So awesome to see the ARM64 support for the VSM being upstreamed!!

Few of the patches carry my old Microsoft "Signed-off-by" tag,
and I really appreciate you folks very much kindly adding it
although the code appears to be a far more evolved and crisper
version of what it was back then!

Do feel free to drop my SOB from these few patches so the below SRB
doesn't look weird or as a conflict of interest - that is if you see
adding my below SRB to these few patches as a good option. It's been
2 years, and after 2 years who can really remember their code :D

For the series,
Reviewed-by: Roman Kisel <vdso@mailbox.org>

> 
> Based on commit 1f318b96cc84 ("Linux 7.0-rc3")
> 
> Naman Jain (11):
>   arch: arm64: Export arch_smp_send_reschedule for mshv_vtl module
>   Drivers: hv: Move hv_vp_assist_page to common files
>   Drivers: hv: Add support to setup percpu vmbus handler
>   Drivers: hv: Refactor mshv_vtl for ARM64 support to be added
>   drivers: hv: Export vmbus_interrupt for mshv_vtl module
>   Drivers: hv: Make sint vector architecture neutral in MSHV_VTL
>   arch: arm64: Add support for mshv_vtl_return_call
>   Drivers: hv: mshv_vtl: Move register page config to arch-specific
>     files
>   Drivers: hv: mshv_vtl: Let userspace do VSM configuration
>   Drivers: hv: Add support for arm64 in MSHV_VTL
>   Drivers: hv: Kconfig: Add ARM64 support for MSHV_VTL
> 
>  arch/arm64/hyperv/Makefile        |   1 +
>  arch/arm64/hyperv/hv_vtl.c        | 152 ++++++++++++++++++++++
>  arch/arm64/hyperv/mshyperv.c      |  13 ++
>  arch/arm64/include/asm/mshyperv.h |  28 ++++
>  arch/arm64/kernel/smp.c           |   1 +
>  arch/x86/hyperv/hv_init.c         |  88 +------------
>  arch/x86/hyperv/hv_vtl.c          | 130 +++++++++++++++++++
>  arch/x86/include/asm/mshyperv.h   |   8 +-
>  drivers/hv/Kconfig                |   2 +-
>  drivers/hv/hv_common.c            |  99 +++++++++++++++
>  drivers/hv/mshv.h                 |   8 --
>  drivers/hv/mshv_vtl_main.c        | 205 ++++--------------------------
>  drivers/hv/vmbus_drv.c            |   8 +-
>  include/asm-generic/mshyperv.h    |  49 +++++++
>  include/hyperv/hvgdk_mini.h       |   2 +
>  15 files changed, 505 insertions(+), 289 deletions(-)
>  create mode 100644 arch/arm64/hyperv/hv_vtl.c
> 
> 
> base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
> prerequisite-patch-id: 24022ec1fb63bc20de8114eedf03c81bb1086e0e
> prerequisite-patch-id: 801f2588d5c6db4ceb9a6705a09e4649fab411b1
> prerequisite-patch-id: 581c834aa268f0c54120c6efbc1393fbd9893f49
> prerequisite-patch-id: b0b153807bab40860502c52e4a59297258ade0db
> prerequisite-patch-id: 2bff6accea80e7976c58d80d847cd33f260a3cb9
> prerequisite-patch-id: 296ffbc4f119a5b249bc9c840f84129f5c151139
> prerequisite-patch-id: 3b54d121145e743ac5184518df33a1812280ec96
> prerequisite-patch-id: 06fc5b37b23ee3f91a2c8c9b9c126fde290834f2
> prerequisite-patch-id: 6e8afed988309b03485f5538815ea29c8fa5b0a9
> prerequisite-patch-id: 4f1fb1b7e9cfa8a3b1c02fafecdbb432b74ee367
> prerequisite-patch-id: 49944347e0b2d93e72911a153979c567ebb7e66b
> prerequisite-patch-id: 6dec75498eeae6365d15ac12b5d0a3bd32e9f91c
> -- 
> 2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
