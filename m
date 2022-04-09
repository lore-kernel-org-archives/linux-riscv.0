Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7257C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Apr 2022 04:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O3v5dB/JBdDWtJC/8YaxvXHpJxDpUL2VQhoBKgS2eiM=; b=4NPuSKx8j+Ot1M
	b1vvMHoVI3EDjOW6G+dzKrVaM8+0YTfk14GE9Kj6wPZrT4+2dmmTZpn2qye14YqH3WnS2QjCnKpKx
	/XdJslAil7nHIoJ29XmMXlQug98QqPNacZeLGnh1GOoLhBuOeMRpzYg4+LoykPSBGlite1Cmlc1Fv
	VLSdP6HXR2sOO9vhH992yEjzLZ5UXBbTZJe2FWr4V0x4TwHQDMtAicgRSDG15cJx9CDjxiH/CVicD
	U7WVdNj6Nr8yh4MYl6e4vGzGOjpqBNBsYW0TqtG8iSNYFWyY6iZBkX0wmjDLb7PjbhAwlMcUlsTYM
	UU973kLdblSA1c5ibCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd2l7-001yVf-9V; Sat, 09 Apr 2022 04:31:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd2l4-001yUv-K4
 for linux-riscv@lists.infradead.org; Sat, 09 Apr 2022 04:31:36 +0000
Received: by mail-wr1-x430.google.com with SMTP id d3so15634323wrb.7
 for <linux-riscv@lists.infradead.org>; Fri, 08 Apr 2022 21:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=QpzV2uFM/aAveTReD80iQJbGn4VzHmCnclShwZNR5UI=;
 b=b2tM4CVFktZ20J5uk+EB6fEbXSrB7MeT6dPRKSb1VgM1sfEH+AB/q9MLRd9uMoz8H8
 6dRSPFadK7kaIV+5dDTi9Nck3H+O4dtIeWcDhnJ+rfKevput+dso5tPsxFSktW0X+wh3
 Qh6uGlgH5CeVj4kIcW23Ta8EM/VCzvnPLxCiyXkJ28ZmbV7PqZEIJDxi8VogCUdGRIVg
 fTbzaBjgh2+SIr82BPV9hVfAjxcseUm82KwRs6EMQmLsdiKewwx73YLhzqsh4aNlFIBP
 i+0DWibRfEsz+Y+yMvcclQJwlXU41YAcxJbH1sGdiQeZFWF6mAZ/MzIO3jlzmBrY7s/K
 GNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=QpzV2uFM/aAveTReD80iQJbGn4VzHmCnclShwZNR5UI=;
 b=VqNRlM2SmUzYblJ76VtZk2bJ86vYdTludHF+5+DEZUmPbhATqtYnC/TMt4tBvyZUeQ
 6vOQIclS2sd6JQOojTQLZixSaj0YJymwEqydFKC+oj2zfS3URqLt4WeTLipR2Q3Y05gs
 FLKKM95TAmnlJwP3T1OpdTJ9UIwV4NY1vd4S/3dXTdtPjBDpidl1NYZ1rGo5w//V+rUY
 vQkIxesRsbLvXFa1oE/pD99XD4j300kfnX6B/yaDKd8uGotn6P+PrxAV1/xfhpMqm1NK
 nHwV3Mk5iKwY7ybAlZ/COREzdZBjUb1YuOYY34bj5BPVWzH483TFgS4TywAa08Nwvtmu
 2RmQ==
X-Gm-Message-State: AOAM5302NETnShuTaa7TXC5Mko5TAoecpHLHms6ce31j4LS+aDLPKrZr
 4by0qPtHWh5pwnH3eHL41N53AiZgvv9Bp6WA8YFHEw==
X-Google-Smtp-Source: ABdhPJx3oQ9/V2ogNWTQKjsKih6Mh7GzCI3OOxiepTNjP/2ClgjHAiJbqrc6dC6wzcb8k3/1qzA2ypR3LhVmRMURzas=
X-Received: by 2002:a5d:6e84:0:b0:206:147b:1f59 with SMTP id
 k4-20020a5d6e84000000b00206147b1f59mr16768877wrz.86.1649478692200; Fri, 08
 Apr 2022 21:31:32 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sat, 9 Apr 2022 10:00:29 +0530
Message-ID: <CAAhSdy3RJpcYNS9NN=hNw=14O9e6=hqoF10fi1vT=No2cT0jWQ@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 5.18, take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_213134_715182_3FCBF999 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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

Hi Paolo,

This is the first set of fixes for 5.18. There are four fixes:
a) One fix related to hgatp in kvm_arch_vcpu_put()
b) Two KVM selftests fixes
c) Missing #include in vcpu_fp.c

Please pull.

Regards,
Anup

The following changes since commit a44e2c207c30a5780c4ad0cc3579b8715cebf52e:

  Merge tag 'kvmarm-fixes-5.18-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD
(2022-04-08 12:30:04 -0400)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-5.18-1

for you to fetch changes up to 4054eee9290248bf66c5eacb58879c9aaad37f71:

  RISC-V: KVM: include missing hwcap.h into vcpu_fp (2022-04-09 09:16:00 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 5.18, take #1

- Remove hgatp zeroing in kvm_arch_vcpu_put()

- Fix alignment of the guest_hang() in KVM selftest

- Fix PTE A and D bits in KVM selftest

- Missing #include in vcpu_fp.c

----------------------------------------------------------------
Anup Patel (3):
      RISC-V: KVM: Don't clear hgatp CSR in kvm_arch_vcpu_put()
      KVM: selftests: riscv: Set PTE A and D bits in VS-stage page table
      KVM: selftests: riscv: Fix alignment of the guest_hang() function

Heiko Stuebner (1):
      RISC-V: KVM: include missing hwcap.h into vcpu_fp

 arch/riscv/kvm/vcpu.c                                 | 2 --
 arch/riscv/kvm/vcpu_fp.c                              | 1 +
 tools/testing/selftests/kvm/include/riscv/processor.h | 4 +++-
 tools/testing/selftests/kvm/lib/riscv/processor.c     | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
