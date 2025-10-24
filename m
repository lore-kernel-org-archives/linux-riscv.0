Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D740CCCD1AB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tJQ2RgTN0CWRsm34T6wWTOURzLPTv+KkbMAvF82ZVCI=; b=LM8wSb7Lh5N/a/
	NKh74mUaGAm0fPD3VSEkOXBqpaOgn19ngzUrxBL84hspSCcEKd7DSI6v85jK7mQU4tqCouq9I7c1K
	fzAZN6kIK8sKJ+mGDJWyNheBQ672UWuXgwesUdNjZcMLeNNQNgOD+C4bRdgBaP520YFtz5QdO9359
	kIV63SzTiV6+82yOJesJJ/urruywTQZB8zwv0des35w5675ameeTLtAKJmNrnczRfFPnwX9yDQb5G
	knzjRlD7qYe2EC+KU7LTzGxk+aGFIQEMUIsQjGmRFv87l7jycx6j7m9zA6eAvte141KhwyEZCdkEo
	HvsDTtciOoZEe2QS3s3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFfk-000000098Jm-48nc;
	Fri, 24 Oct 2025 11:09:28 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFfg-000000098I8-2hVq
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 11:09:27 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-430cd27de3eso8698835ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 04:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761304163; x=1761908963; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LcPf1xe975KkTwQym1prsVH0fr9QNq0CHIXhk6XtEBw=;
        b=oDVDlR6AR/gVGc6CaLfma9/up+DbuBNqtkS8BIxVeTKhhhK7O0/mn/hjmU+1SEuLgR
         gmxrAI9FfXo62OnPLm4pGUiZxTacMn6o1mpZEZRdx7i+BlvSdZC6g0GVCbppZe+o1Ase
         wGUdwFecn2gHucXvbSWmmTi7Aykz8kqZXIfm56PBIPdJtpr/W2bESEs8lFyJDv+imI90
         KGwtdU8jetecwvPgrIlO7OH9NDOY3Me1xgtAkjudLKLUKcykwjrjV59f8N2FPZySbqtH
         o0Zw28X5wEIqOxiQCoBT0QFWoaR2KOgXm+NPwGmcPVR6G5T6NoPeZUsNW+TU5cXTK9+q
         XhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761304163; x=1761908963;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LcPf1xe975KkTwQym1prsVH0fr9QNq0CHIXhk6XtEBw=;
        b=dVuJa7mQ1WPqv/cxXOIha95aPlFm+52xdRecrHAhiZYhCWfa5eNbrYNJ7aojri1O1D
         NqKgoI1pjTquedMAhwxTBBUC2r93jCDviFtTfKOl68L/cNrgyy3vpu3JfNCtNSOz9I3v
         4fp87P2u511ZQTQY8jiq4a/eI+gJliqebw+8RkrNH337qyPe65wO7KA4moi4qc9/EJfl
         8ce3T56PeCnP18muEyGc7hMumcIfSGobNlhOg642WY3Sd/BNhEhhNQ2aiY0i4Pyb4S44
         DxmZFMqFfQ3USCsZC21EWPpDpfizaZYdZyoCLdtZPMTox2+u/uhYYSxGumLswZhe4hKu
         eQnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Z2egg+FemDvPY85uXfoDuzBoTiZOUtg4GY1Qm9y1PTcNapUIE2k4yetqur2ym29LeCYoaoFkyFD6Iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSwa36lUspClLpzBeYNp0vifTv1bz7AGFUN5Ywvr03yesUw0DV
	JeIOFILNY6w2D58YrnNxfVEd1eFMnJKQMRE4P8Y2ByhiKf+MWF0PGVKQeczTwRdr7jQrsbs4BpN
	6uWTLr2D/wKqvbSaPSiQdo84jFI7jUB8GI/Vnj+W2zQ==
X-Gm-Gg: ASbGncvNiAt23qmF5JdgNIulxuOLjtcAIQHYpIcWF4NajuJVBAA1pVxPeWlHapI3Kxr
	fG96aO2DKD0hqXcunVLMdtdU81waJd2mKHlybbyn2E53D12Kk5R2ZT6s0OS3nh8OIi1JNvO0U8G
	iupI4i+R1SWaP4Ih+eMYxmCNdl3HdChF5/0cbyMFtVIj2tYdLfVh+b8ejlFWYk/VOFc0v8KEBCK
	2W3/Lh5LUn6y45Y9JnMd9LXAP4x4q7IX4kgOJi0aLDY5qJBXtqkxtN7v0yTdzkfbNc0eV3mSeDP
	5ev+Y8lQ3RQzBsmwhA==
X-Google-Smtp-Source: AGHT+IE9S5s0UiJpjlUqegYQjQVn8lw/UsvwYK6Cd4wO8TsufKol08Z/vDHJsXqyR1XkLmvB6hHPaBeL1CFs/wB1LTg=
X-Received: by 2002:a05:6e02:1fc6:b0:42e:2c30:285f with SMTP id
 e9e14a558f8ab-430c527dc63mr338209275ab.19.1761304163600; Fri, 24 Oct 2025
 04:09:23 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Oct 2025 16:39:12 +0530
X-Gm-Features: AWmQ_bkOUC__8vbi7NySkF06VvUJXJfrGXIX8BYfIo-fPKn0s_ko2eOoKSV5lY4
Message-ID: <CAAhSdy0h=PuKTG=aWou_8y8qb7kSHS46TLXoXrjrTXN1xv-uQg@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.18 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_040924_765245_1EBD4BF4 
X-CRM114-Status: UNSURE (   6.28  )
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

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.18-1

for you to fetch changes up to be01d4d5c30114e9df37fca9efbb2c5cb0ad36f6:

  RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP (2025-10-24
11:00:48 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.18, take #1

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
 arch/riscv/kvm/mmu.c       | 20 +-------------------
 arch/riscv/kvm/vcpu.c      |  2 +-
 3 files changed, 16 insertions(+), 22 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
