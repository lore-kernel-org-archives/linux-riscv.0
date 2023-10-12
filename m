Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F898CDB483
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 05:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSCQ/D5YA1ty9SYEtif78IzdBX0BPfXMxwmzrWiyk4k=; b=H8fgdyFxEiDNZz
	qsoahVaSzEtGszjX9tVzCrW2gPFaYIbBYofEk88gmc6gJ3WQpDQu5uVJxEtUK5RAdBlAd3BgH4QJr
	uxpvl1RBUFpKQbyW0Xifvs4xvrmS2xxNbg1FR0Gdbsxvq29yoK7zN1qXoy+jdQnqVVEamR2Ph9nSM
	hWM4xOtxWsMaYeUPWKkqPSgnbk/xT39VDIQopVUGifRZRgJF590xFihNDRlFDyhRjr/Yvxe6cqsKk
	4/Ytwxo8KbYMAnROcxLi9A7573fWQ/d6NCgg424BAEGXzGKZV2Yot+uHQJcU3EehSjwS0d6m6oORd
	B12701eYNtXkRM90pn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo2s-00HRD1-2H;
	Thu, 12 Oct 2023 05:15:38 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo2p-00HR9N-2k
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 05:15:37 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-27d23f1e3b8so42650a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 22:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697087732; x=1697692532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnnUYFylMM7osLHu6Gv9hbGwiUDTuyMbxo3uWzdsMQU=;
        b=SNzYgVqRXQ1o231/KzUwUgpUiKf3z4GecLSdkN+0ocorVmYFHr2n1gb3nyzwdhjQlt
         7JZrHjtQdS1l7iA90KB9RWVmH5zC2LedJxt7a0Clgs8p6cr9KuZ/ZeN1D1soKmWih6EV
         lXFFWXsYCkT2PtWG/Ps8dG61QW/2vyTH/cVaXv6mkmfLqKtgQh3qdSDUNJ5aoPKyxpCY
         ZNOjITPYBR+3+nAu9qedLHg3wJSA7KVqbKT4z5qkzYrxzTEYGBwchBp6TgIv+EbpcIRM
         K7qpwRgVmjpMwPnpxi9+iREPmyFSGY2xslIwBEUhUwwDQVXXvyVg4aopx2voMxOqK/Dy
         Go9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697087732; x=1697692532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnnUYFylMM7osLHu6Gv9hbGwiUDTuyMbxo3uWzdsMQU=;
        b=DWOizG1Ilk6q26RY9OyMw0yyswLtlOKssfazmRU835b58VNKRvqLcUarAxJbITV1ng
         wA3GrIMTwxqEDmXg/MvQtJTDMgCXZQPN45uL+tH1U7jxAeHv5ecpmvTTNz2cha2pZrpP
         443NJplK2u//Gob+4SpcNCANANQEjpVUCKSpr8qwHyOGeBEL+98HlfYgjFGBqHOGZu2R
         ZyfP6CTfoTqnc3TOQ9rUR4aBapMpLGxs0BJzmzsWjtB2pHqoj1xMRBt6aGkjQ2KizvNg
         EBJRWmb4Id/B475AEyZaGCI0tMPdUepmYXBUObwKmFSwDQ1BsMVli8JJcn7RDrjVUxLn
         BjXw==
X-Gm-Message-State: AOJu0Yx8Q7QXNkiiLfquZTbfXup94I1dVGKfFCRer2pQ44o7CXuwiVG9
	DXaOcTKGKHAD90HiPd0d4r1VLQ==
X-Google-Smtp-Source: AGHT+IFfVbiUmgMwoeGwA3ZIdiIUuzVdm9gRZ3aJR2yt7ibzGaKFZJms3sDVibgDvTppejsGgzuaOA==
X-Received: by 2002:a17:90a:c254:b0:27d:1f9f:a57f with SMTP id d20-20020a17090ac25400b0027d1f9fa57fmr918230pjx.32.1697087732343;
        Wed, 11 Oct 2023 22:15:32 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001b9d95945afsm851309plc.155.2023.10.11.22.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:15:31 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 3/8] RISC-V: KVM: Allow some SBI extensions to be disabled by default
Date: Thu, 12 Oct 2023 10:45:04 +0530
Message-Id: <20231012051509.738750-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012051509.738750-1-apatel@ventanamicro.com>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_221535_888951_EAAC8EBB 
X-CRM114-Status: GOOD (  19.12  )
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

Currently, all SBI extensions are enabled by default which is
problematic for SBI extensions (such as DBCN) which are forwarded
to the KVM user-space because we might have an older KVM user-space
which is not aware/ready to handle newer SBI extensions. Ideally,
the SBI extensions forwarded to the KVM user-space must be
disabled by default.

To address above, we allow certain SBI extensions to be disabled
by default so that KVM user-space must explicitly enable such
SBI extensions to receive forwarded calls from Guest VCPU.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 +++
 arch/riscv/kvm/vcpu.c                 |  6 ++++
 arch/riscv/kvm/vcpu_sbi.c             | 45 ++++++++++++++++-----------
 3 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 8d6d4dce8a5e..c02bda5559d7 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -35,6 +35,9 @@ struct kvm_vcpu_sbi_return {
 struct kvm_vcpu_sbi_extension {
 	unsigned long extid_start;
 	unsigned long extid_end;
+
+	bool default_unavail;
+
 	/**
 	 * SBI extension handler. It can be defined for a given extension or group of
 	 * extension. But it should always return linux error codes rather than SBI
@@ -59,6 +62,7 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 				struct kvm_vcpu *vcpu, unsigned long extid);
 int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
+void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 
 #ifdef CONFIG_RISCV_SBI_V01
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index c061a1c5fe98..e087c809073c 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -141,6 +141,12 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (rc)
 		return rc;
 
+	/*
+	 * Setup SBI extensions
+	 * NOTE: This must be the last thing to be initialized.
+	 */
+	kvm_riscv_vcpu_sbi_init(vcpu);
+
 	/* Reset VCPU */
 	kvm_riscv_reset_vcpu(vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 9cd97091c723..1b1cee86efda 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -155,14 +155,8 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	/*
-	 * We can't set the extension status to available here, since it may
-	 * have a probe() function which needs to confirm availability first,
-	 * but it may be too early to call that here. We can set the status to
-	 * unavailable, though.
-	 */
-	if (!reg_val)
-		scontext->ext_status[sext->ext_idx] =
+	scontext->ext_status[sext->ext_idx] = (reg_val) ?
+			KVM_RISCV_SBI_EXT_AVAILABLE :
 			KVM_RISCV_SBI_EXT_UNAVAILABLE;
 
 	return 0;
@@ -337,18 +331,8 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 			    scontext->ext_status[entry->ext_idx] ==
 						KVM_RISCV_SBI_EXT_AVAILABLE)
 				return ext;
-			if (scontext->ext_status[entry->ext_idx] ==
-						KVM_RISCV_SBI_EXT_UNAVAILABLE)
-				return NULL;
-			if (ext->probe && !ext->probe(vcpu)) {
-				scontext->ext_status[entry->ext_idx] =
-					KVM_RISCV_SBI_EXT_UNAVAILABLE;
-				return NULL;
-			}
 
-			scontext->ext_status[entry->ext_idx] =
-				KVM_RISCV_SBI_EXT_AVAILABLE;
-			return ext;
+			return NULL;
 		}
 	}
 
@@ -419,3 +403,26 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 
 	return ret;
 }
+
+void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+
+		if (ext->probe && !ext->probe(vcpu)) {
+			scontext->ext_status[entry->ext_idx] =
+				KVM_RISCV_SBI_EXT_UNAVAILABLE;
+			continue;
+		}
+
+		scontext->ext_status[entry->ext_idx] = ext->default_unavail ?
+					KVM_RISCV_SBI_EXT_UNAVAILABLE :
+					KVM_RISCV_SBI_EXT_AVAILABLE;
+	}
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
