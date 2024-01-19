Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F677C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 05:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IsQqpjZ6CYmLDt966X3MzPbhjEigAz2oS+sFyPDYyKM=; b=SNyo+VWeCWLwVs
	GQzopiOXuQyHD7MRTvGrYLhmYCKnUxHlDKJR2Wt4O/PSfoL3eKdMePZJKN2TcvB3sBEX04RXZ6LEW
	EE+nWR0EzEgkcyES3EwRSqiKanEVOIY45GFoAChQX8XmwdU9GI4fihoBe7DADlo9rRgMJVrLPbilB
	GlKQj6IvVC+SRklLSDxrZUV+yGQgVAS/kycVtGapjCMLZ8+vGlq+WM7PQsRKOMIVGVY8l70c2bCQN
	nvsBfkBOTB3p9yBqvRrbALc8rxrVselkjOTkPaFdsxsF+s5UTaZ+Q+rxJrWr3kaOAluHPxE0ecNrr
	KbAE01m8GzvtwmWtfW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQhVq-004WER-1l;
	Fri, 19 Jan 2024 05:33:54 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQhVm-004WDu-0u
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 05:33:53 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-36082f3cb06so1897945ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 21:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1705642428; x=1706247228; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iwQRqZOaq1LSIxFB3WC83FyMSbHTqrDJ+8okySowm+o=;
        b=JxkTih814ATLvXhjUWlCeljrbdDlGmgH4Q2r+7RFP1rQQ4JskxrxgCob8k6E9MNgYs
         RmPTZW688YimpForlQS79VkovUR7wF9Htnj2cCKbVE7ahjqKtOxLyNuzyWgjTPGCgEI0
         HjgWZjitD/j4bY5NrN3p8r+c1wrYlArsnPeaJjJt4t76+Pd/hCpeyu6RKHjo20kab34J
         6e/J53ny3WEbgn++hGT1xG7nOHH+CO+OikG1vIehXYuiLnf6TVDda1ooFZ9tRC9wKo5x
         2w/6Hx+zBP86UZwEH0DDY1ovpLACIyvbKBp342Bn5F8MqtZg3f0OyTW3WqVy+lo3oRZR
         fHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705642428; x=1706247228;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iwQRqZOaq1LSIxFB3WC83FyMSbHTqrDJ+8okySowm+o=;
        b=dENTaWIZHKHKX1JcOvfE+Gtk8I57Rt8jF2XJfaWyVuf3zjszZF7eYiI/N0gGJ7soWg
         qH3dmVddgEdFYg7PEo6eJgj4uFyLY7XpGHpF1YHE0A5YGWO3UPAFt+WjZzaeXtwaMhhu
         q9otUyI0vuR4DgezQde4IhU+o4gqzPe3BozoSs70jeNIVmgVqjrFN0bn2SoNJ6VPbSim
         +y+OJc6VyI5bYvSF4bzykGPX7ZHhu9TE0GCySvWb8ZtVeYdEukmuInzfAV2WgrgKcQMz
         uc/aKSupxXlHu6wun0vi4Cf+g9sU9Qh262O/pki6JAQh8fpggNQURBZEfYMd4hZr//uE
         Hs9A==
X-Gm-Message-State: AOJu0YysMYjhUrVCZXY/vCh7BSQQ/cT2ALWjhGC2VD+Olwu3mBVNrh1u
	vKSOmX77HfQGPQCkZnItVvjc56KJn/l2GQvxIZf3QGF+buqKYIcOS07RjZrP1IeDyDOXKE4PTt1
	wwLTC6UduQeCY2yooOlY3suma2mlZKBUj2T4jXA==
X-Google-Smtp-Source: AGHT+IEvnRlDhPOzeLXmOCMBHdLrnzLx6ryB2yAGoQtAM0g42obVawHmkFIN+ZFGqrlV5leB0437UZ10vuv3r9lLQ3A=
X-Received: by 2002:a05:6e02:dd3:b0:361:a7b8:80f8 with SMTP id
 l19-20020a056e020dd300b00361a7b880f8mr1179688ilj.25.1705642428441; Thu, 18
 Jan 2024 21:33:48 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 19 Jan 2024 11:03:37 +0530
Message-ID: <CAAhSdy2rbMeTwwHU_dHwUQi3AQB1qGNf=ByvzG11D99ZOJ3djA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.8 part #2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_213351_326254_E6DA953E 
X-CRM114-Status: UNSURE (   4.45  )
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

We have the following additional KVM RISC-V changes for 6.8:
1) Zbc extension support for Guest/VM
2) Scalar crypto extensions support for Guest/VM
3) Vector crypto extensions support for Guest/VM
4) Zfh[min] extensions support for Guest/VM
5) Zihintntl extension support for Guest/VM
6) Zvfh[min] extensions support for Guest/VM
7) Zfa extension support for Guest/VM

Please pull.

Regards,
Anup

The following changes since commit 9d1694dc91ce7b80bc96d6d8eaf1a1eca668d847:

  Merge tag 'for-6.8/block-2024-01-18' of git://git.kernel.dk/linux
(2024-01-18 18:22:40 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.8-2

for you to fetch changes up to 4d0e8f9a361b3a1f7b67418c536b258323de734f:

  KVM: riscv: selftests: Add Zfa extension to get-reg-list test
(2024-01-19 09:20:19 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.8 part #2

- Zbc extension support for Guest/VM
- Scalar crypto extensions support for Guest/VM
- Vector crypto extensions support for Guest/VM
- Zfh[min] extensions support for Guest/VM
- Zihintntl extension support for Guest/VM
- Zvfh[min] extensions support for Guest/VM
- Zfa extension support for Guest/VM

----------------------------------------------------------------
Anup Patel (14):
      RISC-V: KVM: Allow Zbc extension for Guest/VM
      KVM: riscv: selftests: Add Zbc extension to get-reg-list test
      RISC-V: KVM: Allow scalar crypto extensions for Guest/VM
      KVM: riscv: selftests: Add scaler crypto extensions to get-reg-list test
      RISC-V: KVM: Allow vector crypto extensions for Guest/VM
      KVM: riscv: selftests: Add vector crypto extensions to get-reg-list test
      RISC-V: KVM: Allow Zfh[min] extensions for Guest/VM
      KVM: riscv: selftests: Add Zfh[min] extensions to get-reg-list test
      RISC-V: KVM: Allow Zihintntl extension for Guest/VM
      KVM: riscv: selftests: Add Zihintntl extension to get-reg-list test
      RISC-V: KVM: Allow Zvfh[min] extensions for Guest/VM
      KVM: riscv: selftests: Add Zvfh[min] extensions to get-reg-list test
      RISC-V: KVM: Allow Zfa extension for Guest/VM
      KVM: riscv: selftests: Add Zfa extension to get-reg-list test

 arch/riscv/include/uapi/asm/kvm.h                |  27 ++++++
 arch/riscv/kvm/vcpu_onereg.c                     |  54 ++++++++++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 108 +++++++++++++++++++++++
 3 files changed, 189 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
