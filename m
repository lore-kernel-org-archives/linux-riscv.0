Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0DBCD8C8C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 08:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xm4x+GlV8iHf5b7oQKW3HrINxONYkAry972I5OtNXI=; b=GWbrohUki4lNbo
	WKVq0M/Jvo6PeuPSCR/XNnVjBX95k2ClhR5z2rUfU8re9JLcsoQAjnP+Fj8N1CMr8YNlsGM/XIQ0J
	AqUkLrzd2qvv6SAvFrjpaGgSWB2EQ0RJk6yv07Pj6YiwTU1Txiw+jSFFRC86N2GYSRh+jhODp4Nzd
	4+LZkgMFKz1znqEEAJfdN2Mpc6HZJ+K5/SDjutfiOoCZ8q4opjDyxXTKujx8Xwae5wE7qSwrmin3h
	1rxTQJWT3qfoya539CZp9Qf0sFDLFXpfnlXsqYtxSbJLg1FVW+PQVri6y05cHE5Rtstz0NyUfPDfG
	gRu0Oss5lHK0CBo2Y8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bX-000000027RS-2Ovm;
	Sun, 07 Jun 2026 08:11:35 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bU-000000027Mn-271e
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 08:11:33 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c859a374903so1097338a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 07 Jun 2026 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819891; x=1781424691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96KDBvYNlF0dtZ4IL21QKYqtr/QK61EGNPVGSZe4zmA=;
        b=klYFhHgAhity1R3Hv8Eisr8BzN6tJRC9lw4OzccREDKQOer5YI0lEduzl/q0uYjvjg
         HhRMki3eW+UnJvutTv8WLuRskZyZewjLSCA2zPrzIKBJfkwyLU2roxE2oBCJ17zPaI92
         4MoBF3VIs5pPfBO2yy/WsbE/fTHQQGZpfWNnIl9hXWQfesiF87eR0LCyK9ZSase5lopX
         1q/Np5SKk1sX56gf/MpEgQ665r7djs4wOExgLrgguMb7s0JbVVvh+elKKoRQ0+gXdAii
         RJnNvOWJC3qUVYyORt+HnFpqqY0AeesDenCyM9eC23l93mjAzlY0DidrAw3kKCUKUZdH
         Bi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819891; x=1781424691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=96KDBvYNlF0dtZ4IL21QKYqtr/QK61EGNPVGSZe4zmA=;
        b=Rxc7+Xp6tgtoh6lRfNnyKVKzP5VeamzMYIIJsSR4TzFKBWdBoGW3OkXUuqIJqzTqbG
         PErKQdjIMJ9w44RloF1wy79tY+WZ1oyF14jLE2WcERzPhzhiTS695W159Vh1RQ8oaLyV
         IMGxNXtAWlUpGwcD+7J/p1kxBCP0Gmou93FPxoj0R/oVGJZ3SVDDiudpHMZA915iKenA
         Kmz0WyHDlikgANwVBjKlnC4ZJYQNG+VwhaAEk2+9ceMrBOydQTDljZ5ujwqiozF36TBd
         /JS0es7LcmIh2o+d+bfSOfAP4nkKT2bvWaQV/LfYalSEzYipHF9KfFZfo7fRm9sU1KK/
         TvGA==
X-Gm-Message-State: AOJu0YwF8g7ibbDEwKBsvysJd5hoFhUBHAMFZ+jWMwgG5qgN0U6f7XAM
	bwQe1B6/76tqD3PrM5A8jDG6QkYyDzqoYHFxylHigDkGSzX2Xpu2a6Od
X-Gm-Gg: Acq92OFl1SO6tfLH1UqcRRvu/3Glt2mpAU/S4INPHjgrODcgqvyXJy2jZmq/s7vGEMo
	ptfDkeaVvwIxPk//pfrGftCOhFZ0krkKTPB4BXQKhiZ6hfxMAwA5bZ4RfoG0BY5j/SUE+lt+ubA
	PPeQ66s19dyOBWccJKzySt7bMLkEt6rMJlnxrwDTagIMSOaAOT1iNLhtBbyXKLTmpO/4ApGoNlW
	hOALBkXpwBLSwnPDIB3ObsMfMmjyKbXTvMeGiCRdzspN2e7OTJ3wnoO7I30TCJsEpcWvXAouOim
	77qyogEl7Otub+TGaUs+43UdHvTlmy7Z3P1LoDot1xT5WG/6cK5K2NbDW8S4ErrtTmwFGvr45HV
	zG4l+NcmGSf+yYjivS+Skx1avoGi04ZUG4fvHM/PDM0FOooX2t1cNfuePqYMf7WaFepQy3pmGdS
	kCs1lHRLn1HE6V4oEu7o3FIdg67coRaCtjZA==
X-Received: by 2002:a05:6300:6705:b0:3b3:1a00:1f4a with SMTP id adf61e73a8af0-3b4cd091c0amr13541485637.43.1780819891551;
        Sun, 07 Jun 2026 01:11:31 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04311bsm11930677a12.9.2026.06.07.01.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 6/8] RISC-V: KVM: Delegate SPELP bit to VS/VU mode if landing pad is enabled.
Date: Sun,  7 Jun 2026 16:11:02 +0800
Message-ID: <20260607081105.993908-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607081105.993908-1-inochiama@gmail.com>
References: <20260607081105.993908-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_011132_576091_DDF9F686 
X-CRM114-Status: UNSURE (   9.01  )
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

Delegate the newly added SPELP bit from Zicfilp extension to VS/VU mode
if it enables landing pad support.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_exit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 12eebeabdf14..61305da5256d 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -154,6 +154,12 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	/* Clear Guest SSTATUS.SIE bit */
 	vsstatus &= ~SR_SIE;
 
+	/* Change Guest SSTATUS.SPELP bit */
+	if (vcpu->arch.cfg.henvcfg & ENVCFG_LPE) {
+		vsstatus &= ~SR_SPELP;
+		vsstatus |= vcpu->arch.guest_context.sstatus & SR_SPELP;
+	}
+
 	/* Update Guest SSTATUS */
 	ncsr_write(CSR_VSSTATUS, vsstatus);
 
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
