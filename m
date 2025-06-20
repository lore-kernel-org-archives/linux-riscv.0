Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9776C71155
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 12:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6W25O3v3IqsF4y2goshAK2O4PpfgSTpoJ4t1pflI8CM=; b=ZPl5Tg2dFfUYK7
	A5+LPfjtYDUZOfWdkb0mfUAHs2vfdaLwppoKxCaA1KgwN8UKJPZ74UKrs5JkV6fT84Wdql19BEDJ5
	9A1pnoJ0w5U0pc8aDawxdwkmCCuJg/gOVMVHcrMfVkJfGDCRpgLo2o3zHuLhpqgBZdtVQPPSht+4K
	rWZOUplvb7TaKM7CYDnXQ/rp7ffJBPqnNTpqEJI0FR1bGbEsC+YeMljep8ewr0Z/pYRfe0vqAGgvh
	t6aV69p9eMJnZSY7Jujd4NMf78jcXjWULzIkCsovfaFMjkxNEZi64qIqptKKXnuFqHcTDK31PPZAP
	7ENxwHTrMX3Ls404W9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbJn-0000000FcPm-1ZAS;
	Fri, 20 Jun 2025 12:58:07 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSah9-0000000FZ0n-2ps8
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 12:18:13 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso6912935ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jun 2025 05:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750421890; x=1751026690; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4hugVmrBISDi3akfpzZfvuXIoYg3pJdh83x0txrI/9s=;
        b=V2wDQL7D6NrMYQmkBFVhUrnvvkXOmNQLTpcy4pE4oHzblR+tFgfZ0hEokOg7QVbrWA
         EHzQapVFct+WNvckb6fDgpxLY9gYgHs57JzcpjD2DQnhxuvcMW3FI1kXY53aoHotfyfW
         zT5mXv5Ay7E2pzRIeKuHyOWMaGHty/yhcJAvLOm30FSnwwYlRQMMCq3ojtbonlNVnORX
         lGWe52DVJdg67JdsVPIrbhseDDVGIj3fPVaqTnXqRuTX2jZazWngjRzi3a3wehnNGQRN
         f/jgj5hlWVOgpuYBTxu2jk/B9XonSx7SRJpPciPgx+5rvteYodogANwY20EqxPb0fNPN
         VwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421890; x=1751026690;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hugVmrBISDi3akfpzZfvuXIoYg3pJdh83x0txrI/9s=;
        b=HGrsXvDpG10rgXUKl+r0tUI92mFQ6sd8BBpl1TxU5o0vZEK7Udlxz3lmVAl4lcUzMl
         YWkX6HwKQrW1ezB5Fcdw5f763/fTc7ewZsOWYBLEgajZrJntcKIEuanodgsLvCsWTeud
         JrG2pUUxR1/3o/vsQxusCGJ1mwgHxYVKCWVOYRYQofm41cKh1d+WrDXdzKOC7f6CWDBl
         9wMa3IxzIrhawGISuhj9ec8DzL9LQQB81k5e48XYJgzjG5nuP8xQqiaoolOPEcYi2Gk6
         3rax8Lin7tCBAKG3TsLo8PMJN+mXs2krFIcUbkNfoyIoaBgEIDaMNy76U1KYHcWanavi
         EBlg==
X-Forwarded-Encrypted: i=1; AJvYcCVbcPUyOolS9s/Jn/6UYjua7G5zl9FJ14I+kyB/ZXRsAE4mYQFsAziPPhwiXnxOfrZivQY7M9hckBxtiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBfTGr+I0l5BQqhNTTsH5T52vwuxfwZkL4lM5QYMNbDTZP+2SB
	INPEPPQ+8LVvnulKdW487noaD93JExiEPxLW/PPWl05dZ/35MSRaQKTjzwSMbmBj6qJKatuJN7E
	xKAmQlYUkKEMqE+I6M3HM9HyBWQQ2pOW7uqAC16iTLg==
X-Gm-Gg: ASbGncu5O/+cQJiY7QOx2uYeXOFVXuquykjeRfZI6lhh89TyprNC4C+izjWWMPzzK4J
	KHY5bdfJpfOuv+cKMefG4PQZgsrbL04oygPdLBRYb/lwbTgPsZbOBFuNQBTBap3OB6z+sy7aMGI
	uWYQVCzj0GIaTn/wzRRx7ZRW8DC5sPgkqcoUU0sk3ED70=
X-Google-Smtp-Source: AGHT+IGUKckbOdUcs/PEHFCfX8DaHeChlsAcllC9njuzBBFlcoE/j6rYlhRl0odIphq/zEklEHqkQQcRHcRFp0HVE3A=
X-Received: by 2002:a05:6e02:156e:b0:3dd:d7ea:ae4c with SMTP id
 e9e14a558f8ab-3de38cc75abmr25819005ab.21.1750421890334; Fri, 20 Jun 2025
 05:18:10 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Jun 2025 17:47:59 +0530
X-Gm-Features: AX0GCFv5QmR6EhpuKEA0i5hObjxmRietKMEidwx9nwYmXTwXtzi8ut3dN43QQcg
Message-ID: <CAAhSdy2ZTWpx82buvGmcTp+0bXJCncQ8TCdmW7tCMC_P69GBeA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.16 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_051811_935758_19D6D3F7 
X-CRM114-Status: UNSURE (   5.93  )
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

We have two SBI related fixes for the 6.16 kernel which focus
on aligning the SBI RFENCE implementation with the SBI spec.

Please pull.

Regards,
Anup

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.16-1

for you to fetch changes up to 2e7be162996640bbe3b6da694cc064c511b8a5d9:

  RISC-V: KVM: Don't treat SBI HFENCE calls as NOPs (2025-06-17 10:18:40 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.16, take #1

- Fix the size parameter check in SBI SFENCE calls
- Don't treat SBI HFENCE calls as NOPs

----------------------------------------------------------------
Anup Patel (2):
      RISC-V: KVM: Fix the size parameter check in SBI SFENCE calls
      RISC-V: KVM: Don't treat SBI HFENCE calls as NOPs

 arch/riscv/kvm/vcpu_sbi_replace.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
