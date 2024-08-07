Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DC0C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KMYcczahZfziXn1Ks0zos8zbPH3OnKs2HA/on0eUCb0=; b=rm6005Ko6T7imE
	ay1VlEaj4grmC7gLXUQAiAjuS6rPejlGhYOIDHYNBlBdY21P81pm+X1DqfeZCVBW3t9MNN6cWOn7L
	TgvpSYHOTlfiKBReWlkHZ1w2mFWQgynhBkj85OtoagLtJDL6Tb2RNKcziinjq1hzb1HjikemgADOc
	3697fl0xjZfVzdJiqO6MNnpOYVF2F4JYl7HD0k1SP20TQYdxqIX3nTTnRd1MTclMC6v5dt91b8pfs
	QniUTMpVD72ypNoM+bGZdRthpwtuCbQ+aj0CprUn3dY3CsGI5XMEXTva2SMXusLcqlAtfg3vZDXIk
	YQBTqCfrV4dFDdMYqFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbivA-00000005ZrS-2P1p;
	Wed, 07 Aug 2024 15:49:52 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbiv7-00000005Zpk-0PKU
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 15:49:50 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52efbb55d24so3738177e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 08:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723045786; x=1723650586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RYvpj69+AWcct2kjGgzqVMRUV32rPbq2i4gj3uwAY8M=;
        b=oewG2wlvcsNeJztZAMkHHkWWdAH5cKN74cmWCX/KXEEt1xJhVzBnCFtt2sEU5Gfh7G
         VvLmZ37GfO+YaUnDmGJsZYkHN6iKgR1IReH7iuyIIqgzZjCoU/d2MolOFU7RgTFAmcmc
         FbYfQR0xO4w74U44GvqPWLXicZ8ldf29MLWP3v/eqJVblpNkV6kFbpPiN95Vtkrl+9Fc
         1+ndSlCABrAa8YF+NLt2OeATgcRiXQTA3JyDQ/qJwPmIugWqiQeDKtkExGBgbNPCMmLZ
         OvfUyhySsLsBMqh1XwH2630UA14FREG6kstsvCTosuQuiwusN6k9nwzGS0rMjhOAGt/b
         OFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723045786; x=1723650586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYvpj69+AWcct2kjGgzqVMRUV32rPbq2i4gj3uwAY8M=;
        b=inHMqF1H5QBXDMByisyEki1PfQKVvRHwwMCyS22UKk6g78+qKAv+ATDEH55EcffO82
         IUNNk02LRjo2hBqM5Bwg57kI94GDB1LIz+ycYeCIZB5V4eqo87Tf2h9XcDdvv1i07UMc
         qF7qcBhGY+2dpEXjpgDkez2V/vg6adz/HU0PobK6dZ3AqS1cjPdEd8S5lgUZIXoANSd8
         05l0ZyPH7UWE916JUsaINNZwZG5y9TaV1zIQjdf/CNP9uPP/xb3tGcwPM3lbg70OQO0V
         xxENQRDo8K85ZkXqFTee1NwJMB60vgcHpoV0V7FBcEb2/UEQyvWvAGgQwzyG23uqiYDK
         kb+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEcnFJQiEi9THbDTkUBm5ShWKPMWM2+ow6ItYeWjCNgT4bBOBgUXPaN+cG04rLAdNPniegPBIkAJ4Y0Wl1mKJ+5Ped9cXqC/CIEzuqfq6C
X-Gm-Message-State: AOJu0YxXVutkwopvvPJgJTSUJ9fXS9meGN3/seSmsVSezDZyS82Y5CqY
	kUlQrsxLrtR+bqPtv5h5IgczyxAKiMHsBzvi/ej30Wy9QmSpkWU3yMiPNLucHZA=
X-Google-Smtp-Source: AGHT+IG/0qTiu3D4l4sc2pZF393ojWtcrWrltEaCHTsPfg6qHZ7oxPP+gwhZxN/GnQhjbENhLsFuKw==
X-Received: by 2002:a05:6512:398a:b0:52c:df83:a740 with SMTP id 2adb3069b0e04-530bb38cfc7mr15457604e87.30.1723045785551;
        Wed, 07 Aug 2024 08:49:45 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3c9asm649751966b.37.2024.08.07.08.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:49:44 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	cade.richard@berkeley.edu,
	jamestiotio@gmail.com
Subject: [PATCH] RISC-V: KVM: Fix sbiret init before forwarding to userspace
Date: Wed,  7 Aug 2024 17:49:44 +0200
Message-ID: <20240807154943.150540-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_084949_156772_81464DE7 
X-CRM114-Status: GOOD (  12.28  )
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

When forwarding SBI calls to userspace ensure sbiret.error is
initialized to SBI_ERR_NOT_SUPPORTED first, in case userspace
neglects to set it to anything. If userspace neglects it then we
can't be sure it did anything else either, so we just report it
didn't do or try anything. Just init sbiret.value to zero, which is
the preferred value to return when nothing special is specified.

KVM was already initializing both sbiret.error and sbiret.value, but
the values used appear to come from a copy+paste of the __sbi_ecall()
implementation, i.e. a0 and a1, which don't apply prior to the call
being executed, nor at all when forwarding to userspace.

Fixes: dea8ee31a039 ("RISC-V: KVM: Add SBI v0.1 support")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 62f409d4176e..7de128be8db9 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -127,8 +127,8 @@ void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	run->riscv_sbi.args[3] = cp->a3;
 	run->riscv_sbi.args[4] = cp->a4;
 	run->riscv_sbi.args[5] = cp->a5;
-	run->riscv_sbi.ret[0] = cp->a0;
-	run->riscv_sbi.ret[1] = cp->a1;
+	run->riscv_sbi.ret[0] = SBI_ERR_NOT_SUPPORTED;
+	run->riscv_sbi.ret[1] = 0;
 }
 
 void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
