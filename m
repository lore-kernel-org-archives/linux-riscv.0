Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4F6C04AA7
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 15:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Fidm5tKUtVYzBQmQ1DKwcXctuci9xtkWEmmhvPKapc=; b=Jz9KU9pg6QFpEA
	CKVxq9+35iERSG8TI5TkKN6s4X85sYHG8W/YBm0EWEVF/yytuXdy+J4RcBT2kwG/VtZm2VxCeYv1f
	cfozNN/GKChSYJPpZlROewLOmwCbH/ZX/6KeeF1CS+v4FyUhO25zC0Ex+P8aDR1C4mcgk3uKR92sW
	IXU+BYsrSCN+8mBHBkIjO4hGbEq3cRV7ntJsVvzul26jgc9yrSJfnaTKfAl+9Goz6HvUK1y7LhI8z
	meyMAb/rmK+KPN8ZXysHVcwqCDoBzSX0/xJyxRXWvBRjoGXuM/oyTaIdgSWp3MHHsG6gUFOjmfgGd
	AhY60IZVFm3tTjzh1kDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qizPO-003Xng-2c;
	Wed, 20 Sep 2023 15:46:34 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qizPL-003XkR-2j
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 15:46:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-690f7d73a3aso534712b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695224788; x=1695829588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAr/f3EP2NDO5TcbIFTZtzzZHLVf3n++r+Cj6Pd3+Fs=;
        b=NQaD0FuRVCkmTwAqTtzAq639whJyhglEf9vPjy8+heTDk8vQiSajqHDnokyzMqPTKF
         oMS9xv2rybgtmNhnvaj77C7kxAUyu2eD3CVTDUpEKmRXwQLMbjxXBfnzsF3OQg/3FmNM
         r6QfTqAlmWM64sEM/A56OQAob1+Iz0Ao9txtdyTgZ/hKhZZ0bTmSr2OPZXx6qkFFIS5u
         33ZZVD6J36a1S7oi6xYAsKB3U64mU5JnN6IZUnEqvUFB9Z/6ZF0PsTr4jaJlky/6PP88
         xZB3ftj/2VjXzxvkQE6RGrEDUtEIVIWsRMvpaQZhm5w7RdoGdwN7LxX+bNqVmpr1C0Eq
         ++NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695224788; x=1695829588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAr/f3EP2NDO5TcbIFTZtzzZHLVf3n++r+Cj6Pd3+Fs=;
        b=HdMD6JSZ8HVi0fzFpl6YfGHgsBu0wwFtZJRUrWAyj1GFVqff/ym6kguPD31nijvYe0
         2husxRW2LqibToe1bpEAkgk/rc+b4zfDDNaWVFr4+imXGfL3QJIdU0xPUXCBv2J5IVfm
         IdSBSl8Zd9N+cO+kxX5TsgNoSXrwCoPN+ylaVU16/p2Sqf3whKggfk+rHjRh/fUhJ+2W
         YKOIpZrZ6WvA6m25a57krOm04/Mxe9QDeendooRJUXZqazia6TpcgtWjsEWCmVZlZ7A1
         u5hJy8zTJrynjCi2vKGW07ougpMjZWyPR0U9sEqDAsjJTLzncTM6S4ciBJh2i6Mpal7f
         UPtg==
X-Gm-Message-State: AOJu0YxFb9ft8b6ZGfx3UGqm9f7BSZQlNmA+Xw1TgC+fFuVX3yFhOlPl
	If0yi7ScD4vzQSplka0HEOv9Bg==
X-Google-Smtp-Source: AGHT+IGnfiCYXMUmmIwvFThBwyKCEOTkAK3sfnR/6AJriLPtWNmFBovg3gxnmLqki1f202xQpXq59A==
X-Received: by 2002:a05:6a20:8410:b0:12e:5f07:7ede with SMTP id c16-20020a056a20841000b0012e5f077edemr3874367pzd.41.1695224787947;
        Wed, 20 Sep 2023 08:46:27 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.109])
        by smtp.gmail.com with ESMTPSA id m7-20020a170902db0700b001c0de73564dsm11995153plx.205.2023.09.20.08.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:46:27 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 1/4] RISC-V: KVM: Fix KVM_GET_REG_LIST API for ISA_EXT registers
Date: Wed, 20 Sep 2023 21:16:05 +0530
Message-Id: <20230920154608.1447057-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920154608.1447057-1-apatel@ventanamicro.com>
References: <20230920154608.1447057-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_084631_890849_629D4118 
X-CRM114-Status: GOOD (  11.72  )
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

The ISA_EXT registers to enabled/disable ISA extensions for VCPU
are always available when underlying host has the corresponding
ISA extension. The copy_isa_ext_reg_indices() called by the
KVM_GET_REG_LIST API does not align with this expectation so
let's fix it.

Fixes: 031f9efafc08 ("KVM: riscv: Add KVM_GET_REG_LIST API support")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 1b7e9fa265cb..e7e833ced91b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -842,7 +842,7 @@ static int copy_isa_ext_reg_indices(const struct kvm_vcpu *vcpu,
 		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_ISA_EXT | i;
 
 		isa_ext = kvm_isa_ext_arr[i];
-		if (!__riscv_isa_extension_available(vcpu->arch.isa, isa_ext))
+		if (!__riscv_isa_extension_available(NULL, isa_ext))
 			continue;
 
 		if (uindices) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
