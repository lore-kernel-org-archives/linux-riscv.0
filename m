Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75B5C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 08:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKBu1EoXmpXaTzM0Drl+/A1XAYXjScBFqdvWpzUfInM=; b=aZITF3zguRL6uj
	R0z2QIAijJtyzPY4vMM4tCW+vee8rPh7zL+z0TuC0Q/JF8rUw0Wbb9sr4/fe7PasSJi04FIHVbMdE
	Aq69lKPe4FanA4nzqJH0+KzV95B3wlHNf4OUgWNKWeCjk+V3PuM3TCbTVkZLTL/0lT3B0p4bzXe9B
	fpyXGI8K8pIGUxL9iBg16TVZkMpNJCKhX5QHiT03mYmoqYxEIEAohCUInXIMYn9kebvRnnndaoQT1
	lLVo4MixOgai7axpaE9+ZEfJ6ZHxQqqi8F8YaJyH4B9Q/wLWE9gHv2Uyb1P3HO5JQFXrOj9464JFB
	dvb9DOo9gU30zniybdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEoS8-00BW2E-Vv; Tue, 01 Feb 2022 08:23:53 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEoS5-00BVzL-B7
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 08:23:50 +0000
Received: by mail-ed1-x52b.google.com with SMTP id b13so32695440edn.0
 for <linux-riscv@lists.infradead.org>; Tue, 01 Feb 2022 00:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sWXOnh6V8JfeAKPCTBsP63fO+aHlS1gzo9x3i/6GE6E=;
 b=ALK239EPhhbKnBQAarVre2qSAgyqxLhsur30HkoKRHTo2K0etUwzSjub/fA46wqZ3v
 sffzujqr51nXRa0RVA/w900IKQe/5K2nW2xeUvbM3z5HVB5Mww8SVdM9ksqaIsHamZ4F
 DxgZjgkJQCPX8kyilf7tT711OgwoPLhiSVk70Dcjegj9YfCfMh5+JLK84AHcj/z+mk94
 Q0Hg4lUV4uGHlNIDmfMxJXAFgtaX3aHORO9Ip6O6ajm47HWzYDDWL2+FO8poRRpKctLj
 zc3YsSLYUvtQSpoVIGfsG/Au+zCgQDvl5B09DcBGKkJVMPlAooidYwHY9OA4Affd9kMD
 TlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sWXOnh6V8JfeAKPCTBsP63fO+aHlS1gzo9x3i/6GE6E=;
 b=8NBR7xwQ/Pu8GYVJ4PoLZwRcImww4OTmwgYogHOs+p/OWwvbW6Cn+/8kOMSTyepXZw
 glG/eBhOiJAXEu7kZUA3H8l27AgLEeOHS6r3f4XCAsUUWtrzTq4PTQOVmZf5i8Mf4zfn
 00uGgCpEaPQpUjSB0dp7OzjCb8z345VlgOq5inLpVdQmn3PJhCBWMsDKYVweyjdwZKgv
 OX+wbzTfG4zI8fJCO+FvO/YqBy9O2shC88F17JtMbiAR9MliWW4+Y4etiDkarnQ7JIJA
 e23TerBhqcJQUR6/UPKZAsBKqTr3xUSPk9O/o4r+paavZD9jBwz83ozy0tJJVxDEueRP
 flZg==
X-Gm-Message-State: AOAM532t1p2J4yKvEuP/wqjJv0snZ/54UkffzUTSucg30wA+7zOYxoCk
 eoh2ZoAOrvT/06XiPMSjuc+nadAOF2N1VQ==
X-Google-Smtp-Source: ABdhPJzTHSniruOqGDVxhjoRjtvl1bsig8Zp56bbyZf9II8QjmoSPgsxbdftBMPgMX53XpxqtcWBeQ==
X-Received: by 2002:aa7:d553:: with SMTP id u19mr24595529edr.298.1643703827873; 
 Tue, 01 Feb 2022 00:23:47 -0800 (PST)
Received: from localhost.localdomain ([122.179.76.38])
 by smtp.gmail.com with ESMTPSA id w8sm14312133ejq.220.2022.02.01.00.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 00:23:47 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/6] RISC-V: KVM: Add common kvm_riscv_vcpu_sbi_system_reset()
 function
Date: Tue,  1 Feb 2022 13:52:23 +0530
Message-Id: <20220201082227.361967-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201082227.361967-1-apatel@ventanamicro.com>
References: <20220201082227.361967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_002349_463165_7AEA5710 
X-CRM114-Status: GOOD (  12.35  )
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

We rename kvm_sbi_system_shutdown() to kvm_riscv_vcpu_sbi_system_reset()
and move it to vcpu_sbi.c so that it can be shared by SBI v0.1 shutdown
and SBI v0.3 SRST extension.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
 arch/riscv/kvm/vcpu_sbi.c             | 17 +++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_v01.c         | 18 ++----------------
 3 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 04cd81f2ab5b..83d6d4d2b1df 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -28,6 +28,9 @@ struct kvm_vcpu_sbi_extension {
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
+void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
+				     struct kvm_run *run,
+				     u32 type, u64 flags);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
 
 #endif /* __RISCV_KVM_VCPU_SBI_H__ */
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 78aa3db76225..11ae4f621f0d 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -79,6 +79,23 @@ void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	run->riscv_sbi.ret[1] = cp->a1;
 }
 
+void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
+				     struct kvm_run *run,
+				     u32 type, u64 flags)
+{
+	unsigned long i;
+	struct kvm_vcpu *tmp;
+
+	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
+		tmp->arch.power_off = true;
+	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
+
+	memset(&run->system_event, 0, sizeof(run->system_event));
+	run->system_event.type = type;
+	run->system_event.flags = flags;
+	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
+}
+
 int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
index 2ab52b6d9ed3..da4d6c99c2cf 100644
--- a/arch/riscv/kvm/vcpu_sbi_v01.c
+++ b/arch/riscv/kvm/vcpu_sbi_v01.c
@@ -14,21 +14,6 @@
 #include <asm/kvm_vcpu_timer.h>
 #include <asm/kvm_vcpu_sbi.h>
 
-static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
-				    struct kvm_run *run, u32 type)
-{
-	unsigned long i;
-	struct kvm_vcpu *tmp;
-
-	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
-		tmp->arch.power_off = true;
-	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
-
-	memset(&run->system_event, 0, sizeof(run->system_event));
-	run->system_event.type = type;
-	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
-}
-
 static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 				      unsigned long *out_val,
 				      struct kvm_cpu_trap *utrap,
@@ -80,7 +65,8 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		}
 		break;
 	case SBI_EXT_0_1_SHUTDOWN:
-		kvm_sbi_system_shutdown(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
+		kvm_riscv_vcpu_sbi_system_reset(vcpu, run,
+						KVM_SYSTEM_EVENT_SHUTDOWN, 0);
 		*exit = true;
 		break;
 	case SBI_EXT_0_1_REMOTE_FENCE_I:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
