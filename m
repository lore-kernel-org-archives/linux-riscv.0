Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75629CCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oW5MD9TnOTdI2xkgTWqed//6jAAZvGq4Mj+HZ5go8Q0=; b=hwuw+d6izsS3BF
	Erg2DSS6sjPjAzImqRK+CeoS1J8MA/RUaAaKZAiCSt//TPIl3kv2iGfMbxbI7+wlvZT5e6Wvm2yRC
	TbRUrI3Z3aJsEZNPX4OYScYpDt1u7WG5lHNNezjUY+LYN+v3ImNp5oxR2dAhSASNPg6N6cKhfNMSJ
	FCgSZDENOOn+iKURy9J9EwALMW77duH+xR0/YCJUAGfu4CJhH20HQ1pQnen2fGRB9HiKAP5xnMRNZ
	Yj4wnVt0v3Gb6kDXQ8KDHlrwMo0jLhLl452GUodc1nMLGujvy51ymRQcunzohrU0nbYdPplE0Z1Vu
	Q4stxk78OKdnwZQawivQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mro-00000008Lgc-0oxc;
	Fri, 17 Oct 2025 15:59:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mrm-00000008Ler-1pTT
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 15:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=C3sebnt8lI1uLFunjh62A3i8Z6IjtTbQpyFes/e/NfQ=; b=l7v6KGJaXNsKVBV/5n6gOf8YR0
	7RmMP/0JPPo1JpclheW8zovBV7Cr6hYsw19YYczDM+HMB/qLY1mX5IcySsmQV4/agYas4ygpoMB7g
	vS+CKkLbfuSzFnsbZpEGfMtukHjwXLIcrECEB3dT1rS7JzjlB8ZzLB/3OG2NS2Ccb4m/thZoHq+jK
	bqVQWcNp/jupBx/Zrsd+7s4fq1axGOeGjSMOsAJKmHJXAnV4D7qVguQUCSLd6fjPchHVu1yUfA3ET
	AFsXxH38HctnyoUKTLXH5VEwcu3izgOf/f+blsJd2vPGRqD7//bFXgGqN+4T6jR3473FlKMQYS+io
	9QTxkmxA==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mri-00000007iQL-3csg
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 15:59:41 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-781997d195aso1679916b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760716776; x=1761321576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C3sebnt8lI1uLFunjh62A3i8Z6IjtTbQpyFes/e/NfQ=;
        b=aKTK34o/6jVCvsXzjnbanupCWUvozISgmU5pXO+O3daj6KkcW1o2RX+scJhiU0OoYq
         LWejjDiPd9INCCadn0U969NOz+I1CqoDS2AztQLtGna8lQmlB4roa3R36EtkHy1tCR2j
         o+KW7jI939Jprc6FQGChrT89+gXWbE52eLSSuXhCUsWieSKPQ+/eS1D/bwS4P9ObLaby
         jpiB+43EbUqv54CvZS2YX1kADfGCvPazvXKLHwWVi6YZ/1XEx7GzOO0gE0cYIbS7ZXae
         HxSdXfT+oVhZKww74WuBbAtTEc3/UGBHWdBY7Xjg9P4zE0v9vYjfowGiFVB9NSa9JLx0
         Fpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760716776; x=1761321576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3sebnt8lI1uLFunjh62A3i8Z6IjtTbQpyFes/e/NfQ=;
        b=BH2AsKJSp14c5uFp8aeunYioGDAgwaG3hlzwfC922M6OEDRamNdihpAjfSnaKqXTeD
         F7Z6wJPYDR1kTtBaSq6TnRtMkdnr+dm5LGYsdcRkRMpAHdV8s2koJQj8rnACYGj0EriA
         5D3XMNA+iuTB0UPhmgl9eVy+ruqnSwSoc0gYlH3DPDu4yLhQo3bHj9xCpuC6IMKTOby+
         D4ZtFi6SEIvdPvjar1XXVVCBWYz2VoDb8wT+oDn3J1KLeKeDFAA/Mv/o4VLQwdjG8QDU
         oRBqHSqav3Qs3wKB5BcbYdz+BAcvPa0cJM7BTFiX7/g39Oda4AwNw1BA7ypzAZn/keXS
         Nklg==
X-Forwarded-Encrypted: i=1; AJvYcCWwmHdZmNv5dA/jHM3odMvcT6VEfNrAxTLxwjkanApm1O5p3OEaYsJ7QFvFwu5q2hxkoDxB5bQBL4DEtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3YXp2e6hYiANUpBILHCR+c9gsju2OwUrNAPr+HlQSdZA91tuy
	8i+LTjZGQXHrysXqYeYVFYO6Xlw3XQ611uB0fy0UAq/E2zhEBxT4EECkqmBGYhcTKKU=
X-Gm-Gg: ASbGncvJXaFN1eEKutjbgXDB2lOGdgGIY6pvYhDtS3rmPcKo4xG5vb7Rz4vKp0jt9sH
	7/7kySAx0sdTFxEDnrVGjbF0LG6+aXgZCtWgznqcvepiKddW6FliZ7gzV1JuUxqt9IaYjiv2oqL
	W61gb7nmsRzzzv+odftWWzO4E/VUvXcf2xoCZOTmpkI8J2KOhNwdgEBqngzf0vlIFJ/OFEV9Joo
	5TH8uENcDzKygvu59AbklUFY+GVHp58gqkFlbOD1TjNlAM8FkMwbaRBQbzcIIbhQtJRz9yG1crF
	vaEmjYu3EdZgeAUnlGq7k3Ht4i1pxNxPIfZaKcK87ij4vbc0+BIDZkDGnurKK+S68huPlrfnMqm
	HYRw6wRJtGRYNviwydmHXfSi1YURswcBZfNN1McGimMfkWuSwB9ef3gYD+4jdSgLjmJuBTzrZXG
	O8hDXDf9nPnR7h1jqTHQRihtMlOi8XlcNMq361ZMZ2gJc=
X-Google-Smtp-Source: AGHT+IGXVOTATy+D04tW0ZdHIUpLbiat0j1Zpq3tC7lF/XTd5JaW53iu75rTOxxNbuFmzr3SM4KXPg==
X-Received: by 2002:a05:6a21:6d99:b0:334:9861:ba67 with SMTP id adf61e73a8af0-334a85fd82amr5481874637.34.1760716776216;
        Fri, 17 Oct 2025 08:59:36 -0700 (PDT)
Received: from localhost.localdomain ([122.171.18.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a7669392csm151067a12.18.2025.10.17.08.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:59:35 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/4] SBI MPXY support for KVM Guest
Date: Fri, 17 Oct 2025 21:29:21 +0530
Message-ID: <20251017155925.361560-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_165939_217399_1F83C956 
X-CRM114-Status: UNSURE (   9.54  )
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

This series adds SBI MPXY support for KVM Guest/VM which will
enable QEMU-KVM or KVMTOOL to emulate RPMI MPXY channels for the
Guest/VM.

These patches can also be found in riscv_kvm_sbi_mpxy_v1 branch
at: https://github.com/avpatel/linux.git

Anup Patel (4):
  RISC-V: KVM: Convert kvm_riscv_vcpu_sbi_forward() into extension
    handler
  RISC-V: KVM: Add separate source for forwarded SBI extensions
  RISC-V: KVM: Add SBI MPXY extension support for Guest
  KVM: riscv: selftests: Add SBI MPXY extension to get-reg-list

 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  5 ++-
 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kvm/Makefile                       |  1 +
 arch/riscv/kvm/vcpu_sbi.c                     | 10 +++++-
 arch/riscv/kvm/vcpu_sbi_base.c                | 28 +--------------
 arch/riscv/kvm/vcpu_sbi_forward.c             | 34 +++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_replace.c             | 32 -----------------
 arch/riscv/kvm/vcpu_sbi_system.c              |  4 +--
 arch/riscv/kvm/vcpu_sbi_v01.c                 |  3 +-
 .../selftests/kvm/riscv/get-reg-list.c        |  4 +++
 10 files changed, 56 insertions(+), 66 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_forward.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
