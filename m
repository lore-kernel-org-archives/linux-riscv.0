Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746F4C021B5
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4MzqeYe4uDeQ4vOWDuDuQoeeS7r6UfrIKP6Fo3HFz7o=; b=hBCDNCt1+QJCW8
	cC5w6cvrQDCzwtbJSIp5Iw4io3vOw3vrfOrlGNbC8Z30vVK8I2F+uGSw++bZ6nAULr10XTrEuNvj4
	2xUB4foPKiY3tsHkHkTD3+mfFif+c+asi1t1h1HXrn8yxrbbWjxSX0Ji5R0ZqIcni7Rm6jVBFjTrA
	JQX+/g9bDxAgiZSsRC9sujvofxP3KDvo0ThG14yPwYjEfKi0GWdFklz/2/NROWnInxpeiXfruUMhA
	MRgOKAsPCiHVs4LdqgbvO/xh7Bh9lLoSRuah9H8DMfZZ0sWblfWRuF1tY4XohEKtiJSOEet+feELB
	L7MmrK8O9AyQYJ39l+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWY2-00000006KE6-0MmB;
	Fri, 21 Feb 2025 17:10:46 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWVG-00000006JQ0-2oct
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 17:07:55 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d03d2bd7d2so21449145ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 09:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1740157673; x=1740762473; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CBn06bjrraG0RKUpLcfzoygq710m6p9nGy5k5/eorm8=;
        b=I+xgvbdP4YP/D+RnYcq+ettxj98SVmNzn0jp0nqHPVjEFWSb3f448nZ+VBV5Gi9NV7
         9ggqMZnLpPQdHh08LfNvHVLMQeSWhuMWmbb5iS+R6h9Gnjn5LTo2X8P4pKPZXZ/kpC/U
         010JJcWuASdQYn4hcL+ZGQn3AvQPX+CVGxM6mUp6j7BzcTx7WvMOIOlSboSjc9OZHDbk
         I4r0+l/1qjDm9pLk6dSRtxSoawNmsZQBBsOiraSjFgv1phxATHKhaBkrDLweSJ44095T
         sF41iIylHC0D5KHd+ACYp0tC9DGcqm7AlqnWep0I0Qcdu2rGBMiNJXDzyZH+KiDIHYjS
         1JVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740157673; x=1740762473;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CBn06bjrraG0RKUpLcfzoygq710m6p9nGy5k5/eorm8=;
        b=QLqg1yR1LwkS80tV10ML4QfRYr/Ca2aI7cEwpNcvEIotHFassZIiHnYjKy+rSCCaqW
         ytWYPzaBhl9ZzXKNz4m/T9dWxJ5tKoNZzuZ36oLtzMYH0RQWldnjsEEzuwFcmjLg3D61
         8X+vf3yxeQwbhZ55/s43Ihsod27V/NGdKLgIgRQ5cJEPViHJmw3rYhowhPUPznoaXJMp
         tfku6kfA8TjXW0I0n85VMvHQ322aKbc5nfNTh0uGIwjQuDqWIERL/5Bvz3LJ+NO2+kz7
         YuYoc29EBpZjE9D+UA7PKx2dpMBdPpxjzdT8lBev7eMzGn6Y+DBaq7lpu/E5U7BJaY5l
         /sag==
X-Forwarded-Encrypted: i=1; AJvYcCUG4eGsy92wMthAZhxzq83Z7+Gr2EIyCtbFK09ocylqDVJw8iKzBUlJW/Tdzzpxorl3HHWa4d9C6w+8Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyD91H23syh3gwEZ6Q/tabi8gm8QtfoO/289re8J2y44Lpg4hJq
	f39bL6gxkYQfWRNxgJl2sKrbgBx1hzDTERUK4tgel++JiTxirFbJXOztN/cKO1YNnro5E0VafY9
	vPZVpUFKlvD1yPjcL+mPRadxqFW/CWdCbiX2zyQ==
X-Gm-Gg: ASbGncuX4zh3yTj1nsMHVBj/Lk0LCoq5j4pJD2LHI0RguUHMPOq7TpvX2tgxLuC2vBf
	mVsDzMTXcCKyhp0lN/ySrVcft9Mg8Ud0H14oiBvTelV7mTkzPCdP8HOWatLacxSo3EarPEN4ZIC
	iTrG6SFoAh
X-Google-Smtp-Source: AGHT+IGRxDMuamLyFFZPWt36k9Xy7MsZrVjV0LfEUgQJUkul59kYRBL0tFtgmbSG0/iAJTc+eQ8iAXGUsji68pO/JiE=
X-Received: by 2002:a05:6e02:1a67:b0:3d0:3851:c3cc with SMTP id
 e9e14a558f8ab-3d2caf19e17mr41489945ab.16.1740157673541; Fri, 21 Feb 2025
 09:07:53 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 21 Feb 2025 22:37:42 +0530
X-Gm-Features: AWEUYZlRnrCyat69poKdznrr9iSVNpvCW9gvd_ViAEmY7eEE9K8GiF7Y3M7YyjA
Message-ID: <CAAhSdy0Wo4hQ=gnhpJGU-khA4g-0VkfkMECDjnAsq4Fg6xfWjw@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.14 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_090754_711051_76BC7267 
X-CRM114-Status: UNSURE (   5.37  )
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

We have a bunch of SBI related fixes and one fix to remove
a redundant vcpu kick for the 6.14 kernel.

Please pull.

Regards,
Anup

The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.14-1

for you to fetch changes up to d252435aca44d647d57b84de5108556f9c97614a:

  riscv: KVM: Remove unnecessary vcpu kick (2025-02-21 17:27:32 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.14, take #1

- Fix hart status check in SBI HSM extension
- Fix hart suspend_type usage in SBI HSM extension
- Fix error returned by SBI IPI and TIME extensions for
  unsupported function IDs
- Fix suspend_type usage in SBI SUSP extension
- Remove unnecessary vcpu kick after injecting interrupt
  via IMSIC guest file

----------------------------------------------------------------
Andrew Jones (5):
      riscv: KVM: Fix hart suspend status check
      riscv: KVM: Fix hart suspend_type use
      riscv: KVM: Fix SBI IPI error generation
      riscv: KVM: Fix SBI TIME error generation
      riscv: KVM: Fix SBI sleep_type use

BillXiang (1):
      riscv: KVM: Remove unnecessary vcpu kick

 arch/riscv/kvm/aia_imsic.c        |  1 -
 arch/riscv/kvm/vcpu_sbi_hsm.c     | 11 ++++++-----
 arch/riscv/kvm/vcpu_sbi_replace.c | 15 ++++++++++++---
 arch/riscv/kvm/vcpu_sbi_system.c  |  3 ++-
 4 files changed, 20 insertions(+), 10 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
