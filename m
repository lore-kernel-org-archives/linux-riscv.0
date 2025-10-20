Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EE4CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tx4iHnc7ksUhDnta/tlWXlWNexYPSURekm5KfBwBBKc=; b=HrxX20reFjrVVN
	9zV9npflrrbjhaYrViIAp9T6Lnrrlu8AVhxlqrUEa/Z8HBqTwFYzRW7i4vZNYWMjKxgH8xVeykueY
	7/Qs3Kz7IYS5bzygvfavswuyzLPXyi+ok+9P6mAEJ2zPEZD2hA3AIsKa/DgI0tSi882A9ZWNxVioV
	UPme6cZ7YxO16WEvPlJFWD7YGkw8/WJ1EFFjVOVlc6wUj41wKnh12hmZn0yeufNQE9Bi2qYMLxw6V
	2lRl9Z+OBrA9hU2YUwpH4xTqtDN7Fmk+c/UDo1NSUP3LdnybQv6LCrTDv6n3N7hTGqA4/OPMS1cNu
	+riv6+8M1dU1lclYwazw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOX-0000000BpdV-3s2v;
	Mon, 20 Oct 2025 04:21:17 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOU-0000000BpcA-3l6E
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:21:16 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-339e71ccf48so5491685a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934070; x=1761538870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=conQFyh0ywHaD293wZYZONSgw/GLLJWk5gnj1mP84r4=;
        b=KhqsmZIJ8Fwfh9zA1wWStK3DEaayYO7gIhW+6dVFniogL2Ig0FThfFfshIeAVVeUNE
         0piEDePLdH9InQEIsPApnrs2Y+48adL9FxKQX/VTjebZL0jgS3v6/CGAZ9+n7xm0Bc2V
         T+ZZiK57LMjVFbqUln0aFQNOELixlLdD+Zd9VRweHCx4FMvgI4NBk75WvLQ2N42DwR3s
         RK3N3ItWWFFYENBjeumBSprQtbWanMthIHtoVx7TMd3zfPBxFhsoJsHzoUi0JE/GTOA0
         8uLRs9X8fhMdtXQ4zOUkSsHahwgwWaDM6W2VAkAc654UgHYMr0qbxWV+tWOabCagVLwg
         D0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934070; x=1761538870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=conQFyh0ywHaD293wZYZONSgw/GLLJWk5gnj1mP84r4=;
        b=IRHR9dxnOzmGspgmPQTcIMlvIxYelpf3ZX1TyVNnbb0wOXlopYlMSKQiZZBrjx7Wsw
         MLRIxCcbZufL0JGYGJY4mayHnjTPIFndKHyq0Gh9wB+Ki+IkoCIqb6Xyo5uc9qr24ldQ
         w2RD63+QPhEMgU3dVGpdmOtb0aNp2WrFhxvyFQSlZIpFISVOalTaQFaqcMhKNyTIt4a3
         fLJ8Yr/GzXQf5q/16lY4mGAD65NqWLLcCHniO0wLnTKz4IWxpT1iTap7gYeyLIqFm5rr
         68MKds7Dv2YkQEbHhcKrPiZk7FmRiNUSwONVWnqt/uBDqLLV7dB+N1rwiN8UBKK7Wmy/
         A6NA==
X-Forwarded-Encrypted: i=1; AJvYcCV1gGRcNdobWRAmlpiy56Vw13s4eAB5JGYasGZSP3hwcmotRBV7zupAZ2AvZB69yv3TCVXOatJmlxscaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNy+8EpcCqoHs2s+LQ8cQwXLVu5bvtqI7sKG8EP6Px1POCo34F
	kvni+BhTOSGFvNcxy1xwbhkcCwbSkN/BIJwQBpsJV/DVwOutx9gNdnLT5tjxKy5sIcc=
X-Gm-Gg: ASbGncv0tuSnZIGxBMYPbB376UjNVYOLf0j7wRZoMlwXZsF84Y4hSg7fJhSfJcll1OK
	ldZMiPISh+8mPAv+e2BioqhlvKvDyGUZY8jG/S2k5KpPi7Jmj7Keu6Ww95hpdCDjIblp1QVt+d6
	Yw2q97y/JDi97Qx3xniD1XQqQv0TMqouO1/uIoDsbe4nWP+xQ7kjd4J+5z6K/R926yyHocUjTWu
	w/ETK4EmjwJTLMl1EaqFSF8X9p35eKwJazYySxYjGEEfxJagpRSOUno6I1LsMddLgV0EC7LLoAB
	0BOjFuSNXS8HOEDHYguvDEAZAIj2kf1IKhfADqxtqR8gP9rBdGEpDfrZUTcpxhytq3CzvxGicAO
	nz0p688B8p5KDmwa1qHXD0z4IMgTfwk0h0vjPP5lsbMfyJyrmHwY7ejDUPMfFC1aCZGNDmGQaqn
	YH2Ras6RGPZRZESIndvOg5viOdvJL3I1Ihz+T4D0Vz1VOe9n/SOzQxYy6x/XlKcn1kknLAQfET+
	Q==
X-Google-Smtp-Source: AGHT+IEdkgCehFcbIRaUApmCfafCEhZVkAa78hZZpBjec5gPS2C5TVHNU0zWNgu3Z2IjgaK3I7rtpw==
X-Received: by 2002:a17:902:f687:b0:26e:49e3:55f1 with SMTP id d9443c01a7336-290c9cbc867mr157233355ad.18.1760934069971;
        Sun, 19 Oct 2025 21:21:09 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec14e9sm68762035ad.9.2025.10.19.21.21.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:21:09 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 00/10] riscv: Add Zalasr ISA extension support
Date: Mon, 20 Oct 2025 12:20:46 +0800
Message-ID: <20251020042056.30283-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_212115_021001_E3DB77AC 
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

This patch adds support for the Zalasr ISA extension, which supplies the
real load acquire/store release instructions.

The specification can be found here:
https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc

This patch seires has been tested with ltp on Qemu with Brensan's zalasr
support patch[1].

Some false positive spacing error happens during patch checking. Thus I
CCed maintainers of checkpatch.pl as well.

[1] https://lore.kernel.org/all/CAGPSXwJEdtqW=nx71oufZp64nK6tK=0rytVEcz4F-gfvCOXk2w@mail.gmail.com/

v4:
 - Apply acquire/release semantics to arch_atomic operations. Thanks
 to Andrea.

v3:
 - Apply acquire/release semantics to arch_xchg/arch_cmpxchg operations
 so as to ensure FENCE.TSO ordering between operations which precede the
 UNLOCK+LOCK sequence and operations which follow the sequence. Thanks
 to Andrea.
 - Support hwprobe of Zalasr.
 - Allow Zalasr extensions for Guest/VM.

v2:
 - Adjust the order of Zalasr and Zalrsc in dt-bindings. Thanks to
 Conor.

Xu Lu (10):
  riscv: Add ISA extension parsing for Zalasr
  dt-bindings: riscv: Add Zalasr ISA extension description
  riscv: hwprobe: Export Zalasr extension
  riscv: Introduce Zalasr instructions
  riscv: Apply Zalasr to smp_load_acquire/smp_store_release
  riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg
    operations
  riscv: Apply acquire/release semantics to arch_atomic operations
  riscv: Remove arch specific __atomic_acquire/release_fence
  RISC-V: KVM: Allow Zalasr extensions for Guest/VM
  RISC-V: KVM: selftests: Add Zalasr extensions to get-reg-list test

 Documentation/arch/riscv/hwprobe.rst          |   5 +-
 .../devicetree/bindings/riscv/extensions.yaml |   5 +
 arch/riscv/include/asm/atomic.h               |  70 ++++++++-
 arch/riscv/include/asm/barrier.h              |  91 +++++++++--
 arch/riscv/include/asm/cmpxchg.h              | 144 +++++++++---------
 arch/riscv/include/asm/fence.h                |   4 -
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/insn-def.h             |  79 ++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |   1 +
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/sys_hwprobe.c               |   1 +
 arch/riscv/kvm/vcpu_onereg.c                  |   2 +
 .../selftests/kvm/riscv/get-reg-list.c        |   4 +
 14 files changed, 314 insertions(+), 95 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
