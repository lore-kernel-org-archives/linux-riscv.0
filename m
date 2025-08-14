Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB30CA0EE4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 16:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ubjMU0LCp8RtBqSJdAsGIC3miBMXvmIJFUB830h30AE=; b=haGGdMsHNYRJHv
	+U6M50Fkf1AK8R08Iag1xRV4G1kbxGQ0gpafZiEba1AwbId+VnI0y7kCWRjcPIFfO1eDgkjLyJcFI
	PoKAITHqX5z7qEfG3dLfonrYOvN81ygueGiIgQTjyD6MCEcEE/xecc+x7VLjVeOYhyImDjOh0NdjA
	aMxTbKQbrWPNT8sfoyiVExh6jA/y+JMBtGcteqofGOFXVZB1tKuDKtvdXjmbkbOwRPFtJf829ifwZ
	JI1DIOPrusEx+zX4gYdWhj97qWnzhGcpNwrrWI+nTM4RNLdrq4hIolh6phpVG6vW97h/9bzjYx+xB
	nLOTqvcVGsJPSGqvRGKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbH9-000000007wa-2X1F;
	Thu, 14 Aug 2025 16:58:03 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umaJ6-0000000HY45-2cAS
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 15:56:01 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b47174b3429so699167a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755186960; x=1755791760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fbS0SnSfDCYNteBkAugCZAVezW6wYeQqbL6j1Y/9w2o=;
        b=lrkPIcKa48cRDTKMN4ukq29X40b04Rgyv/3VCKlAFEQ6x7EGDrgIcaiFn26uZPCv0F
         jv2ArefF+fImglGinfQOVzTl5VBZ2DSTCTvNIsfitKaEU7I8oM+MhQknnwQSDP7FGW9c
         UjEPZiHocPycom1O//qohLYDW0fP+jxowj5wJEK6o3uwB+x9nDWBa6OrdADlqwSjN7gO
         ie8mytwbvJUsfYkBdr2q+BuGedkaDxbCZOhNq1Hh9VBDTFYDiUOg29YB4p1w3p9dYI+Y
         Xtx7g5fiM6VbiR+pOoi++27T3uEFp67jQjPrwB/kt+b2knr+Z/UXQLxANfsPIs+88wwP
         0Hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186960; x=1755791760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbS0SnSfDCYNteBkAugCZAVezW6wYeQqbL6j1Y/9w2o=;
        b=nLaN6FHFKoByKySqF+rHAOOncL1jOZvGgZeDSUQP2TgfPEbmIE/+20sM93YHee7kES
         bSefbXWETdhdn0Ciiiau6xuRlWxMLGT8zp1MiZoNM1Kg5WbLFh1wrDynrfX+y7asDDfk
         b78WwZtZgxXxTSiTCsKs31j2D/Xj/q3d0K3+XHjVNQHxfyJLz7+X9H6jPi6nA/36A7+J
         Ki/X58/7O0LwJYbn4jYU2Lt9O6Zdsh79zE++lZO+9+bzkheW8pQV3m6HeXWyVXVefiAL
         DFMjVAaUS6/UKMNDYh+oITy3eV6hoYfj3B12raAKZnizN81zKyy4bqF6bCn771favNIX
         YiOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv4MvQ0VoLquUwcvfoWg74fnCWkwzVyDXiToSQSeP3pIuT0HaLwCW3Iwkwj9n5FKWwsEW3w6YEpZ8fBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwAn1EQZVvHXQKVsvRyXjzb7wFYTr/wkL9lXBK5fJUb1DphXhZ
	/fl/3STZhAS5HpFMNMzyzIphgvKjZkP4MavthW0ZpHIIrLaKRcG95p7UjXv2Y0iGrq4=
X-Gm-Gg: ASbGncsu4yZomm9a01cDsISz+Hr06rYo3xE3lDiqI1VPliWgjE4ImJ/s5EW4AyCP0vq
	ONqaM+L/3C5y4qv1ppCuDSqyRaGYboBvpgJjEK6qZajM7tSh/RXWSggf9pgQyIZQuXwv7pJXD26
	f5XblbYqAKpWBerDWOWWv2rj/JTbW88ZklGrV42iO6yYcPB5ahnvdjuB+MzJOqN+VBMtrZKrvXQ
	vlVAw+DMfFW3kX24CXNOhCtiSmkQ7iOTm42Rg26T+0WWW9m6ycQiiyXlgf87zy9gXWb6c+JpxLS
	rAILChpDcJbtzPr/jl2Ku4kuitCVZhfKrxYL+oXRsHm3a1PVzsF/4XVFVFApCu09O2IcCmSTYp1
	2s0fqUn8vWcPv3mhzqQpUxC1JcJ+h9OkHNZfzku49b/HkhAWBipN3CsgGnDa82g==
X-Google-Smtp-Source: AGHT+IHiJ/C+iotNnCA3DhU4+fNK2fePBsmUyymIcxaNYom/9E0Z1/NWwsgFdX4eBUWW/qEOqDpszg==
X-Received: by 2002:a17:903:1a30:b0:242:fc4f:9fe3 with SMTP id d9443c01a7336-244586a18c8mr55450135ad.37.1755186959600;
        Thu, 14 Aug 2025 08:55:59 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3233108e1d9sm2225500a91.29.2025.08.14.08.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 08:55:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/6] ONE_REG interface for SBI FWFT extension
Date: Thu, 14 Aug 2025 21:25:42 +0530
Message-ID: <20250814155548.457172-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_085600_665915_36A87152 
X-CRM114-Status: UNSURE (   7.57  )
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

This series adds ONE_REG interface for SBI FWFT extension implemented
by KVM RISC-V. This was missed out in accepted SBI FWFT patches for
KVM RISC-V.

These patches can also be found in the riscv_kvm_fwft_one_reg_v1 branch
at: https://github.com/avpatel/linux.git

Anup Patel (6):
  RISC-V: KVM: Set initial value of hedeleg in kvm_arch_vcpu_create()
  RISC-V: KVM: Introduce feature specific reset for SBI FWFT
  RISC-V: KVM: Introduce optional ONE_REG callbacks for SBI extensions
  RISC-V: KVM: Move copy_sbi_ext_reg_indices() to SBI implementation
  RISC-V: KVM: Implement ONE_REG interface for SBI FWFT state
  KVM: riscv: selftests: Add SBI FWFT to get-reg-list test

 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  23 +-
 arch/riscv/include/uapi/asm/kvm.h             |  14 ++
 arch/riscv/kvm/vcpu.c                         |   3 +-
 arch/riscv/kvm/vcpu_onereg.c                  |  60 +-----
 arch/riscv/kvm/vcpu_sbi.c                     | 172 ++++++++++++---
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 199 ++++++++++++++++--
 arch/riscv/kvm/vcpu_sbi_sta.c                 |  64 ++++--
 .../selftests/kvm/riscv/get-reg-list.c        |  28 +++
 8 files changed, 436 insertions(+), 127 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
