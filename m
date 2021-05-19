Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8194FC433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 04:58:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDFB3611AE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 04:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDFB3611AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5TiD1t1gnmDCbtC9aXigu9IUjEp49SePC1H0gmfyoG0=; b=hGBo2e5tmPEF1kCBjCQNQ5Dry
	6qUD7faYa5foyNHzXAuc5gTyaN/84JMHUZZXq7Y3xyzoLhTtHSuEpUe/vn5TxGFJvVoOMCzv9OupI
	JoSAmprc0rH8vkGMN0Ub7XRKXatGazhmBTJ9OqMIbDnU4tr0eTPQUljTLGLUT7Mut3zm1c0CttNsL
	3s0qXIqIKT3cNNYgYrPvwMnvw1QpE1wJPxntgcQHvp0+HttGSTwqf5+Hek3OjgHba0ryK8pgFJThc
	35abNw7U/XLl013CUyBpGpqzn2ZzvaRBSZDv7OdIhX/VlRBvDwqM507K9rj5yJRfJDSJ2o5saUqQ0
	5xmTTGxdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljEHk-002n6B-Lu; Wed, 19 May 2021 04:58:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljEHi-002n5c-0t; Wed, 19 May 2021 04:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=csdUSvqAIZHztgcaoOz7V99/GT/WtC4a20iIKny5ugU=; b=pRMdTDfuHiUqoA1ZUAL5UN+CBV
 9ZnnYkXNLD8FpldVzyRCx+MSLaQOOnx7ZcjNOTGEn5ExgudGY8Sb8B9r/a+mJdFp2AdvbGW27TUv8
 gzcvy89QwV/TRLAr+DY5A2Y0QkcW+gAdHod5nTuuSUrm4xoFfYikTHn//iILCmxYjpRSj4WY09UDT
 g8S8Eh9hmjXFHLonMLokOF4J++hPHzS+DMiaIe2I0ApfR+0s72HQfQvD3/lufD4F/cDlUUWbG14V0
 5/fpZBRy5hG1TaAqsyZIxRCUwO5Eb43aBSOLcFBCJGhbs3q8YY+gttNAvPaG4D+GFJ/Q1xjBGsNyS
 SkYw1ShQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljEHf-00F8J8-6G; Wed, 19 May 2021 04:58:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6560561355;
 Wed, 19 May 2021 04:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621400294;
 bh=sBPi7doTjepZo5AoeX6D/DqrfoxCCmiTbbDfO6A7+1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tg2fxanYYVeqmsedHZTVahMC53Je13j2qQo6irCgVnD9l6R8hP1VifEKRUxwM2YPf
 WFdvYQcpyQF7Ff73XO1FgRGZR0+AftflNxfwNilci58q/w6E1SwydNRY6uwOxzMEyF
 6t74rsmccXGRBh0DVv57nMWSBPWKBOO0ZMymaVQc=
Date: Wed, 19 May 2021 06:58:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alexander Graf <graf@amazon.com>,
 Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <YKSa48cejI1Lax+/@kroah.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519033553.1110536-1-anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_215815_281541_1BCB4EDC 
X-CRM114-Status: GOOD (  15.85  )
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

On Wed, May 19, 2021 at 09:05:35AM +0530, Anup Patel wrote:
> From: Anup Patel <anup@brainfault.org>
> 
> This series adds initial KVM RISC-V support. Currently, we are able to boot
> Linux on RV64/RV32 Guest with multiple VCPUs.
> 
> Key aspects of KVM RISC-V added by this series are:
> 1. No RISC-V specific KVM IOCTL
> 2. Minimal possible KVM world-switch which touches only GPRs and few CSRs
> 3. Both RV64 and RV32 host supported
> 4. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
> 5. KVM ONE_REG interface for VCPU register access from user-space
> 6. PLIC emulation is done in user-space
> 7. Timer and IPI emuation is done in-kernel
> 8. Both Sv39x4 and Sv48x4 supported for RV64 host
> 9. MMU notifiers supported
> 10. Generic dirtylog supported
> 11. FP lazy save/restore supported
> 12. SBI v0.1 emulation for KVM Guest available
> 13. Forward unhandled SBI calls to KVM userspace
> 14. Hugepage support for Guest/VM
> 15. IOEVENTFD support for Vhost
> 
> Here's a brief TODO list which we will work upon after this series:
> 1. SBI v0.2 emulation in-kernel
> 2. SBI v0.2 hart state management emulation in-kernel
> 3. In-kernel PLIC emulation
> 4. ..... and more .....
> 
> This series can be found in riscv_kvm_v18 branch at:
> https//github.com/avpatel/linux.git
> 
> Our work-in-progress KVMTOOL RISC-V port can be found in riscv_v7 branch
> at: https//github.com/avpatel/kvmtool.git
> 
> The QEMU RISC-V hypervisor emulation is done by Alistair and is available
> in master branch at: https://git.qemu.org/git/qemu.git
> 
> To play around with KVM RISC-V, refer KVM RISC-V wiki at:
> https://github.com/kvm-riscv/howto/wiki
> https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-QEMU
> https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-Spike
> 
> Changes since v17:
>  - Rebased on Linux-5.13-rc2
>  - Moved to new KVM MMU notifier APIs
>  - Removed redundant kvm_arch_vcpu_uninit()
>  - Moved KVM RISC-V sources to drivers/staging for compliance with
>    Linux RISC-V patch acceptance policy

What is this new "patch acceptance policy" and what does it have to do
with drivers/staging?

What does drivers/staging/ have to do with this at all?  Did anyone ask
the staging maintainer about this?

Not cool, and not something I'm about to take without some very good
reasons...

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
