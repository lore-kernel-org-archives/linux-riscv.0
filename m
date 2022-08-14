Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD12C25B08
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JTDelQxFWQwZOMZn2dfZT9dd6LNpv6UtXK25NI+Miw=; b=VoYBdn1aSKsw4E
	L6fforupnU7Vib9OuNeLTyjvj8C3df+sADTAzUdjpQaIdlOsxLY2MXsZauSHK77mnXNGcd7487Dja
	Br1ZIy8EC2mODDRwB3l1DmLcJR7he3rPTibRT1+0xAfDnqiy/xPgFDLkcl/almMAYTKxf97VHCyOt
	2Su+OmsZ2Dgfd9RJIqXuDaf+dxc2+dTUU/AlX7c2/tJ0XobCtx2FN8y+Yjg0/Uuw2D3MXkwaoLpyg
	95AddqUPMgwYc9lceD8/D0xhVWEKmEWNmEyK5gSd7VhEWPZFPG5Zr8dmxKS0w/jDkbi5Es3PIlUMl
	FuJrHwpNAADkbAt/58FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNEMP-0070Yx-7q; Sun, 14 Aug 2022 14:13:01 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNEMI-0070Rt-7P
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 14:12:56 +0000
Received: by mail-wr1-x42c.google.com with SMTP id h13so6353572wrf.6
        for <linux-riscv@lists.infradead.org>; Sun, 14 Aug 2022 07:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Xqc3VtPSBOAfpxrTQ3FQnbEScSjzijC2Ge9Qv+3BLFo=;
        b=KSSPXqdDvQ30jRp5ZEhGlfQ/aS0hz2oSUFeTar1lta3J4zdKDfpW/jUYA0/PiDxfDa
         7CaS1dovo6wdlqR6phEaSv5eUlvB0h4SZHh1+4WgiaWr9tMGHL3VrRJsE6ppzN8fow3i
         sRXlxbOajPCerCw1GcDlS2x8dobocGRI1cVsgcqeGnYtM1XDr5z1nMJPIvXFATv4ZA93
         ao69Y8ApqC0YOZL0ByltUGbCWAT1GUOx7eu27fPQFM4nExizuoS54M71vFUPoP8n2iPc
         McBTZn5q2UiGtoC4//f166GNAWF4vGRe7ySnMZp8phvvR0EOCoZZtTw14ts7untZY9li
         hS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Xqc3VtPSBOAfpxrTQ3FQnbEScSjzijC2Ge9Qv+3BLFo=;
        b=QoQPQvwPz3xkzyULfm5Y0PQspSgQWqM6nKaV7VufjVUFFuqJl46fkwzlAGruYYtLqX
         lWUYmfPS/cC8IARwwNpkZPQDc45/OxSp7v1EZkKVL4HAuHK7AJh0imKEy4l398dxXYHt
         fJouWP+roBxS+fUHg+QJ5jvWJcZmRvTv6HyCvN2AvCcN9m82ziMmA1oAJKEXdJKZJXAN
         2gCKR9TIOpknKFlSDBqZpm1P/nrXjMlw/iTQDBNnnOYLwoxZwNqrs/WFTSEDk+mOxQ1/
         ifZ8+CXPxjy6oHVvFBp3yCs2pj/o0xJTPyTXQyrxDF8hdGCSk+KsE80OCqQOTljqOCYx
         Z7+g==
X-Gm-Message-State: ACgBeo3ovqF4M5rf6VgFGnwelR+sKnOPmDhN5DQJkNCGaPsVqA3IANSt
	AApWPI3MHPWadVi7cEQ0zqscqA==
X-Google-Smtp-Source: AA6agR7L6qLIdUlUFVOsEa6ZwXoag/PaFOX3IukupKFIqjjhVOE/vcErNmGNQSSR0BwuzhSCaRA2HQ==
X-Received: by 2002:adf:f708:0:b0:221:6cb7:8d52 with SMTP id r8-20020adff708000000b002216cb78d52mr6272145wrp.186.1660486371758;
        Sun, 14 Aug 2022 07:12:51 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id b8-20020adfde08000000b0021db7b0162esm4625419wrm.105.2022.08.14.07.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 07:12:51 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] riscv: kvm: vcpu_timer: fix unused variable warnings
Date: Sun, 14 Aug 2022 15:12:35 +0100
Message-Id: <20220814141237.493457-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220814141237.493457-1-mail@conchuod.ie>
References: <20220814141237.493457-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_071254_273760_3C4EF2B5 
X-CRM114-Status: UNSURE (   8.94  )
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

From: Conor Dooley <conor.dooley@microchip.com>

In two places, csr is set but never used:

arch/riscv/kvm/vcpu_timer.c:302:23: warning: variable 'csr' set but not used [-Wunused-but-set-variable]
        struct kvm_vcpu_csr *csr;
                             ^
arch/riscv/kvm/vcpu_timer.c:327:23: warning: variable 'csr' set but not used [-Wunused-but-set-variable]
        struct kvm_vcpu_csr *csr;
                             ^

Remove the variable.

Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kvm/vcpu_timer.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 16f50c46ba39..185f2386a747 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -299,7 +299,6 @@ static void kvm_riscv_vcpu_update_timedelta(struct kvm_vcpu *vcpu)
 
 void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 {
-	struct kvm_vcpu_csr *csr;
 	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
 
 	kvm_riscv_vcpu_update_timedelta(vcpu);
@@ -307,7 +306,6 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 	if (!t->sstc_enabled)
 		return;
 
-	csr = &vcpu->arch.guest_csr;
 #if defined(CONFIG_32BIT)
 	csr_write(CSR_VSTIMECMP, (u32)t->next_cycles);
 	csr_write(CSR_VSTIMECMPH, (u32)(t->next_cycles >> 32));
@@ -324,13 +322,11 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 
 void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
 {
-	struct kvm_vcpu_csr *csr;
 	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
 
 	if (!t->sstc_enabled)
 		return;
 
-	csr = &vcpu->arch.guest_csr;
 	t = &vcpu->arch.timer;
 #if defined(CONFIG_32BIT)
 	t->next_cycles = csr_read(CSR_VSTIMECMP);
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
