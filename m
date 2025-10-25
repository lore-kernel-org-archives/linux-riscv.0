Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65803CCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 10:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5dnAVRd0qOw2Tfo+rRdtGiU6rQgYpfs08DpmIs5l4nk=; b=kNCq+JWZDodV7v
	kwVDX8n2dZOTueQaD/JNVF1jFLa1JSQAaZh4/PvWptJiExmGFC04/iI64clxHFaDP9OTdP0q90gle
	VCtZRQ1+1wpYEGEAbROSeZKhV2vH9D1OYdRmq/7P7zIIWWNempwzDbZ4tvBwlrWKcRenJ0pZKCW8W
	KAsdbmXa6+6wFSfanxncwiN2T5By0YooSQoTGEb246xMsS46XOxKBcmy1gPMbv/xCkMoXSvnqj4xQ
	l5GGPPe/zPwnfiaMQK5eFTZy4M/b4pgd5TqO/dRIb5C+y4fNrxDyRYAgAVV+24q/5OuK48x3IhdVj
	4qibV900x8XQqeUIkoyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCbHr-0000000BCko-0xL7;
	Sat, 25 Oct 2025 10:14:15 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCbHn-0000000BCiu-3KWU
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 10:14:13 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-430da72d67bso20237925ab.1
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 03:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761387250; x=1761992050; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wN5MsaqKfRbeYqcIv/KVHd41EL8Y3jzy/bgpR/o5GyI=;
        b=vpELyfhq9uTRuB7/1X4tgwvIwTVSpW6lDLOG33z10hQB8BBog+iP/de0TUvLI1KaTw
         lrLQ7CUfn9wiAWzmXg/SZHPxuO5DVd/5sih1lqNr0ekTjFLFcB3pK4OhKli4m3dhRlBZ
         MsoHctCATd59+UPKkkX1BvSeC6YeaSLI6DrpyAyOyRgLsHJ6YQmnOeplqFIxFpn3fHdl
         KhjgXC3wvokNMwSfOfVUst8+kKZw7JWM2qKDtI8lqpO8PKSIkTtjWgJMBv5rIraxMGtH
         hUOSu811oR+FsNw+RNphlQFPaEyCSf4iDN9w6IIXL93YNuRrTDrX8PsDKJxrqueFBWyf
         HKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761387250; x=1761992050;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wN5MsaqKfRbeYqcIv/KVHd41EL8Y3jzy/bgpR/o5GyI=;
        b=kP8/ueSBHgR+L7MVQT+VQhGtvXWL3FYYkcrgCYAhOKKv5b0sMDc+7BEfqVvNM6jRsS
         KODdyjQucv66wqdhYL31oJJALWtmfccQstCxMptQqOCwyDYYxxuIkNwLPf8PxAiJAeDE
         HBc68kih30UoqoNBWpm5CWZgQaC4NTBDNsQd4iobxt5Bqt8S5vztCxva6Gv+pDYj1z3r
         IQSiQpWwLUB2Pj181CiYgv1h32z7LkIddC95kQpTZhEvALxQQCKJeGGfIAgmOFs8rhB6
         L4Hc41xiJeytNm55goSLyTCeFtRQjWEyjggH0h+OPfuhWzOaTbpmnyiXyHHPQ3NknmbN
         s+RA==
X-Forwarded-Encrypted: i=1; AJvYcCVLAy3ketJMOMWQezW4+I/E8I0f+wWVdf7RCE75nt6/g5/hZD0OfFh2T7mZnKdFc3dTEQHwtWulN7bnrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgrynvDX5pc7NZRdBfCaser1N/V/v1k6QHUz2RXxV24I0Sy9l7
	7BDmEHMbL28AOcapAeIVMBJ16UezWM5TgKe8mN4/caQNPuoc45qiX4shart6h+yM5BCej2KYVVy
	53xRUsS5L1H4YUNyp+oRYRQJBQgTo8J29X1TP+B7Tmg==
X-Gm-Gg: ASbGncsCzVBrsm6+ChTKLGDsovxIwpMgTnvc37uYzyFrG2WWH0vSLhc9jF9+ywqJCbr
	BHJlJfGVC0IC7sO+xj6Rl8F6k9/l5ZvHdxUN1rGn34CZK6bK1LDbfrmj1T7AM5Ng7pgggItHjpZ
	hv2hUoSiVw8RPNSGJiuT8c+PtMfMW+BFW0jMR62uSVfiUWnvH6AFOmD+00LzcAQxwJ+yzx/7KC8
	gFPoyyFINIpJaxJP7UbJVkPe/I2CnccimPRj7i/9OZWfAcpiVsvHmubq8HXowFPG6I2dTX0p+D1
	7Be1xGqH3uNIhQZlEh41cA+B94kI
X-Google-Smtp-Source: AGHT+IFpWZVjRCuwhb4DtOufiG7BXJsKl5vIHXR0e6zokP9kahb0yrltoaSSXtmlHhJhQihxphgaQ1Awrp0N48kr/R0=
X-Received: by 2002:a05:6e02:1786:b0:430:bf84:e94c with SMTP id
 e9e14a558f8ab-431eb67c444mr59866215ab.13.1761387250503; Sat, 25 Oct 2025
 03:14:10 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sat, 25 Oct 2025 15:43:58 +0530
X-Gm-Features: AWmQ_bmwq2oGHjBSLEnWv7bNvD-fJRrO3lgDsBq83C5kNERHDGX9jLhLgFP3WlI
Message-ID: <CAAhSdy1jcXypH3yCUBaci2EbOy2cbr2qNtdYriKa-vcyFFeCzg@mail.gmail.com>
Subject: [GIT PULL v2] KVM/riscv fixes for 6.18 take #2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_031412_018124_C739D5FD 
X-CRM114-Status: UNSURE (   6.64  )
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

We have three fixes for the 6.18 kernel. Two of these
are related to checking pending interrupts whereas
the third one removes automatic I/O mapping from
kvm_arch_prepare_memory_region().

Please pull.

Regards,
Anup

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.18-2

for you to fetch changes up to 8c5fa3764facaad6d38336e90f406c2c11d69733:

  RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP (2025-10-24
21:24:36 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.18, take #2

- Fix check for local interrupts on riscv32
- Read HGEIP CSR on the correct cpu when checking for IMSIC interrupts
- Remove automatic I/O mapping from kvm_arch_prepare_memory_region()

----------------------------------------------------------------
Fangyu Yu (2):
      RISC-V: KVM: Read HGEIP CSR on the correct cpu
      RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP

Samuel Holland (1):
      RISC-V: KVM: Fix check for local interrupts on riscv32

 arch/riscv/kvm/aia_imsic.c | 16 ++++++++++++++--
 arch/riscv/kvm/mmu.c       | 25 ++-----------------------
 arch/riscv/kvm/vcpu.c      |  2 +-
 3 files changed, 17 insertions(+), 26 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
