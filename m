Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C601CC83F20
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jul 2025 10:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v3PxGZqThR+pv4gW4lPg6vUKfr+jA+sOWyDYYah44L8=; b=PHBpDkIYd81wMT
	5lzNOjGxIzPmuyGegRWZyQfSPKdFVEea2YEK599+4MwXp7amDPl95XXSwlcMTw69x6X6U/DPhxrpk
	X5o/GGRUa3ygtYEbI5nzAKIAmzML7somPdIb1lWLJNfhAxYUoANXHQ/LJOalq5tbk3gLunQHtKJiN
	AwPOhWWeMVoLwty8Y2MLdygwA6tebkhw6j2Rs7KaS+AV+G2Fb2PPT15qlZ100FEXkCMKxyJM/Q7tt
	bapbUTCyK35kU50+6TAk3Uts7ptlbpSOScuqW5GBfrJ1xB31ga7DJ3EXHuDX5NgYnbQUAKautBIaZ
	FvUE9ZOW4q9lOzSanPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaXPg-0000000GX4h-1jl5;
	Sat, 12 Jul 2025 10:25:00 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaXPd-0000000GX40-0Gnl
	for linux-riscv@lists.infradead.org;
	Sat, 12 Jul 2025 10:24:58 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-86d013c5e79so236654739f.0
        for <linux-riscv@lists.infradead.org>; Sat, 12 Jul 2025 03:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752315896; x=1752920696; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dCU4bgUbnXvZ82jiG94+o4ASlTjyH7jDB0NCEushSNM=;
        b=dFcBulG3ThFKljkpbN+JPd65yvPA3Z9silQzP6X/Wmpayq8789J1jkdTetETuZ7/mT
         JwhpuqGqkVK5gRrseL3b1Nni0mDC+nqGz2RCiqUqq9bnLTz6q9qwypfR8oBJgYIfH2ZN
         +uFkryqL+G7f0iHRIJWlz8x6CIf851eseEagkBcFrRO+rFg7WIdotMqrfgqNdooRUn6O
         Tl7SOFG8goIPFiVopPFqwQDdYlSOnP3j4MRYr0FcCGfwAomfi22602Q/hVKccNdJn/7O
         JZAVVeLqizhNNmkRiuE9IOWHdgFZAi/UnlPr7NeTdvvRmr47E7SaCUml3Jj02jw2F10c
         j4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752315896; x=1752920696;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCU4bgUbnXvZ82jiG94+o4ASlTjyH7jDB0NCEushSNM=;
        b=VsL4zWKqIiC2MjbPcP63IRQGgHTR7OUaufeD2UH6yc0cRAszepU3ouqt77iSkb4g9U
         NLX1T66kUAYyuOMecoBzZAnaqwYrcnefd5ORBiHo/PIOKQlavGTmGm/7m5qbTIykr1C1
         3qKBFYhCBFdfKp94jR8zQ3DyDMIKVPUxGg3rg9jtYB1RpQ/DmAiq9AQV0ztYoFH0uari
         t905+QcRLbZ+ToJn5eZU+uEqFjySU3bCgHF+1fApk3XN0pwH5BiL3DvhGdEjshMbG6Tm
         MddtmY9Duu5nr3r4Rid/VZQ+U1iQcSmVQfFIDaXw/TjHJ/m6CUv2Yo/4dbzfLldte3Hx
         F9yw==
X-Forwarded-Encrypted: i=1; AJvYcCWBikC/gbnGHvip1VX2wf13Gnvq2vUuLkJiLAjUDh6qBGHzBvnH4HHtHJE21V0VvIHfhvbesj8LhCE//w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOn9B1A8j+1JACVQgk1UCpc0wp8uoZhFvRqNKg3oLEhkTHxwGq
	/gzS6YE7el47k9YAL0h0j406/ERmjCAyGCna7y0i6RzYSyoAcKdsBEENLHPf8kFkEh38z/Pj36K
	IU1H5ItCIXqC13vIoi8eDl+G9HdI/+JnZ8uwNalljXw==
X-Gm-Gg: ASbGncs8rqi+KBiJlnRxcoWHnAceYhS08dxJdVvUAV3KysmOnT4M9CxcQQG0YAMf9xF
	kcS3x0tuXY3N4X7ggYmvs+0xj7b5Q85d6caPfB95/1HL6+oz1865qCsP9ChYwvhsamszOxyx2WC
	LusRT4h5utmWQ/HA+rO0Jcw8dvu4avB6Dpm+joGJqSlUGrCMSJ9TvnznoUu3MpXlkZ+B6BPH5xG
	EkX/6uG
X-Google-Smtp-Source: AGHT+IEUvwOlNaKX67zF7XBXGRrrgd/vBWFzhk/JvZxSzB4yGZ48rpHvRk54/YtVPkl0kw3AwxxL6yqbQX3MQBck82w=
X-Received: by 2002:a05:6602:7181:b0:85c:96a5:dc2c with SMTP id
 ca18e2360f4ac-87977fddc7emr700617539f.14.1752315895993; Sat, 12 Jul 2025
 03:24:55 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sat, 12 Jul 2025 15:54:45 +0530
X-Gm-Features: Ac12FXyD4VQVIOuVbQptVP1NvX--8ikGpI-rs3w8axR1N5KmYegrjMtYEUm3Pag
Message-ID: <CAAhSdy3_OE=R1jhF5-KBiw4mGOqHUXHdkvyeAAR18Qm8dezavQ@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.16 take #2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_032457_342852_D5A6A2FC 
X-CRM114-Status: UNSURE (   7.45  )
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

We have two more fixes for the 6.16 kernel. The first one
fixes an issue reported by Canonical [1] which turned-out
to be an issue related to timer cleanup when exiting to
user-space. The second fix addresses a race-condition
in updating HGEIE CSR when IMSIC VS-files are in-use.

Please pull.

Regards,
Anup

[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2112578Signed-off-by

The following changes since commit d7b8f8e20813f0179d8ef519541a3527e7661d3a:

  Linux 6.16-rc5 (2025-07-06 14:10:26 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.16-2

for you to fetch changes up to 4cec89db80ba81fa4524c6449c0494b8ae08eeb0:

  RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization
(2025-07-11 18:33:27 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.16, take #2

- Disable vstimecmp before exiting to user-space
- Move HGEI[E|P] CSR access to IMSIC virtualization

----------------------------------------------------------------
Anup Patel (2):
      RISC-V: KVM: Disable vstimecmp before exiting to user-space
      RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization

 arch/riscv/include/asm/kvm_aia.h  |  4 ++-
 arch/riscv/include/asm/kvm_host.h |  3 +++
 arch/riscv/kvm/aia.c              | 51 ++++++---------------------------------
 arch/riscv/kvm/aia_imsic.c        | 45 ++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c             | 10 --------
 arch/riscv/kvm/vcpu_timer.c       | 16 ++++++++++++
 6 files changed, 74 insertions(+), 55 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
