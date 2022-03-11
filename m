Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD551C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 17:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KHnHuKCMWCMG8gaEJXD4LUa454132q0pXzBGDd+jarM=; b=ik/V+8jrsL56/L
	Z8chveJJz8yjAs9BBk4Ff9/pvLT6vHpwJas25Bo5a8GnhlmWzo9Hqbj92Xw5sBDzHMJHvtjIu8JkQ
	jm/fM6gCmVIRczpuyyAzb4/9LRDMaihQz/c+Asr/tZbSYjB1TQumnRqVjpHCdXgkZ0KE/TNtpM7Pn
	TYhbEB7GuPDxIsQ9Zb4uODOAL5QIEfBrb6I5mFMaIsaFHg9x04jnR323vTRvVgtHsc+vz9MWPM/9o
	H1B+jJ4nhU8+6lEMyJwVAYew1OvVDWsJ8L7lokZW7RqW0om4wnKeGCoiL2zrYWZ/t+l6ddWS4LE7I
	XC/iSiQ2LlLsPvX/U6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSifp-00HR52-Bp; Fri, 11 Mar 2022 17:03:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSifl-00HR2y-5h
 for linux-riscv@lists.infradead.org; Fri, 11 Mar 2022 17:03:27 +0000
Received: by mail-wr1-x42c.google.com with SMTP id i8so13885728wrr.8
 for <linux-riscv@lists.infradead.org>; Fri, 11 Mar 2022 09:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Z2RgviTYIZSAoeoSoZxGUfnoAr9FmSUYXi9nHDkZWgY=;
 b=cLEKknK0f96mkMugQvjuNQuHilpDZVA8Slm6pVfk7JDYDMWePNqvPJ+e1x/2yYbw/5
 RBHUmhWhoZW/bT1gfKrDZ3haGmfU27uJU9TqXumQOmWQqijGLt/3lMSkTDQtMJg9ujXt
 +sqHBx9RJRkMfeTM5Z5OSlr6d3qTVKK23gqaofyLBeKAJtuv6ABWFoZ76zkvWWg4tUSa
 YjSPW2uF0BQSe+JT45LeGHnmsx+HFilOI7/pJLD3TpXPxre7Wz+UGJvuN5vds/tNWx4V
 ADDt1psGp3xHmVInjgHjQ+HjOAgCF9YHA7RFnzNG7i2brw6xKJ940uLI3+d6Zr0eBR1z
 1WUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Z2RgviTYIZSAoeoSoZxGUfnoAr9FmSUYXi9nHDkZWgY=;
 b=bTl5MHuL7TkiY9l5e5wyZrCLF4RdsJlLhA8dk+BFcTDm74NGKAnVaCWSEhLnYKV/4R
 0+GEoSc6Cv6lsVX+v3HFZ1UK+dc3S7RG3n19N6bAd0V5oc0RHp4GNfM5L77s8UqAMv2f
 5O03KHgIOvtj7qilpabVYDrzm4R+yJf9gz27PFalpWjifxK99LwfZry5cXySwuv2v4Ze
 iQ7ZYBSQq5sJMR7J0Jv2oVQne2M5tJ3MyCU76/vkReXZ1o1QzRqDVIrvjDbjWEQhd5Aq
 NRm+4XQllPWRbsfqDSAoPGJ5TboK84Faf9CkapAFlQ9VVeDhP5alBk4+4Z8hKdnYMMsB
 ZGIQ==
X-Gm-Message-State: AOAM532wT5dKcSRfCwgmV1+PEUIsGsPqP0HBR0PFeFZorMZEvmq20Kge
 r0oju/M75hFUCgh90dXWavtrHE7m9S62AqPYKnCS9g==
X-Google-Smtp-Source: ABdhPJwtBuBh9botUSDk+ZE9VzKRYN5PSQSI4Uqz0ueKBFDKzsQYk/VB0JaBXk8o6O1rpw8RWftQkv2ggH30b8GcS50=
X-Received: by 2002:adf:b60c:0:b0:1f0:227d:bce with SMTP id
 f12-20020adfb60c000000b001f0227d0bcemr7933148wre.313.1647018202363; Fri, 11
 Mar 2022 09:03:22 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Mar 2022 22:32:25 +0530
Message-ID: <CAAhSdy1cBkGqBLN7iZY-FUx2BFGoXmxd4WZJemPSRKz6my8cZQ@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 5.18
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_090325_317253_8A9F5DDD 
X-CRM114-Status: UNSURE (   5.06  )
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

We have three KVM RISC-V changes for 5.18 which are:
1) Prevent KVM_COMPAT from being selected
2) Refine __kvm_riscv_switch_to() implementation
3) RISC-V SBI v0.3 support

I don't expect any other KVM RISC-V changes for 5.18.

Please pull.

Regards,
Anup

The following changes since commit 4a204f7895878363ca8211f50ec610408c8c70aa:

  KVM: SVM: Allow AVIC support on system w/ physical APIC ID > 255
(2022-03-08 10:59:12 -0500)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.18-1

for you to fetch changes up to 763c8bed8c05ffcce8cba882e69cd6b03df07019:

  RISC-V: KVM: Implement SBI HSM suspend call (2022-03-11 19:02:39 +0530)

----------------------------------------------------------------
KVM/riscv changes for 5.18

- Prevent KVM_COMPAT from being selected
- Refine __kvm_riscv_switch_to() implementation
- RISC-V SBI v0.3 support

----------------------------------------------------------------
Anup Patel (6):
      RISC-V: KVM: Upgrade SBI spec version to v0.3
      RISC-V: KVM: Add common kvm_riscv_vcpu_sbi_system_reset() function
      RISC-V: KVM: Implement SBI v0.3 SRST extension
      RISC-V: Add SBI HSM suspend related defines
      RISC-V: KVM: Add common kvm_riscv_vcpu_wfi() function
      RISC-V: KVM: Implement SBI HSM suspend call

Guo Ren (1):
      KVM: compat: riscv: Prevent KVM_COMPAT from being selected

Vincent Chen (1):
      RISC-V: KVM: Refine __kvm_riscv_switch_to() implementation

Yang Li (1):
      RISC-V: KVM: remove unneeded semicolon

 arch/riscv/include/asm/kvm_host.h     |  1 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  5 ++-
 arch/riscv/include/asm/sbi.h          | 27 +++++++++++++---
 arch/riscv/kernel/cpu_ops_sbi.c       |  2 +-
 arch/riscv/kvm/vcpu_exit.c            | 22 +++++++++----
 arch/riscv/kvm/vcpu_sbi.c             | 19 +++++++++++
 arch/riscv/kvm/vcpu_sbi_hsm.c         | 18 +++++++++--
 arch/riscv/kvm/vcpu_sbi_replace.c     | 44 +++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_v01.c         | 20 ++----------
 arch/riscv/kvm/vcpu_switch.S          | 60 ++++++++++++++++++++---------------
 virt/kvm/Kconfig                      |  2 +-
 11 files changed, 161 insertions(+), 59 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
