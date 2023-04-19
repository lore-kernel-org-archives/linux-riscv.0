Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D6CC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3S5twefMnVrL4r7U+J2/SyTAiQ8t5fMcA791sPqMZzU=; b=DSr0+OAzdyFU03
	gIehHSxkpc7hPjsx/ltB2Cj0ogBzYNHmZDMhe4UKmcoP2EY6Xqry32ncDvBBr8YSggGAlMzfKyfuP
	98dajG2KuSkJOe+uyKUwXwJmoVwiAcY0YCDLrTxmnk7Lwi9IvPBSUhQBOMLHJisrtdBnz8BCftAwi
	/XFU45TyeGSdodJU92Jeho8f2x3HlSH+mG9hypu9BOgKvmtXdRX7pUztl+tR+5KZT4oGdqE+xmHZz
	zRkWgZ9g1Wc8ZbMrJCYv8do3ARjYWjy+qoJedbgVJ9tgVKWdVi5EByKvEtne+YXJO6H3X424/MgL8
	JpGMNQzh+2VHV+eF5gWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQi-006Wjs-0i;
	Wed, 19 Apr 2023 22:37:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQc-006WXV-0q
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PF8Qn0Z7zg/7RPDtBuNuOPN3zeJXhr/Jx4YP7Fj6yI4=; b=BN9ZOKvUXlBHpHYxGBzvEyGBnT
	HrHfiwYSYeQbAD57tatRJwYCojYS7DVwgYytdRQ7k8MNqtdzmtDj3jnoEi2ISgIHmf/K0AIp7O3kT
	LntGsJUTZl38EOg7fzVG96i5rl7pMurtx1qtImGRO5Z2wVfqYF+WPZGDOIn/qMA/jzdLZZE3DZZb+
	dnFQeHUC8i4PKIjU+PRqDBXsfjnw1L7Cu3MdJ9jchy4ZAnGqsUslbuO5+1pdhDB7mrijjiZEaTzyS
	pnFUEwMhVVY5hj2c/QuZ2X+dcQKdxQHs+kSES3Pd0iGHrAREh/FEIoUumdqqDBCl5Wh8A9hboIaPD
	CQxWiFjw==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ppG8V-00DeGj-W0
	for linux-riscv@lists.infradead.org; Wed, 19 Apr 2023 22:18:49 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b73203e0aso2786774b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942727; x=1684534727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PF8Qn0Z7zg/7RPDtBuNuOPN3zeJXhr/Jx4YP7Fj6yI4=;
        b=G/Fug0YDh/vT2gLC0JnMu9cK8/lm7JaHRK8wavACXkcusYj2LIYmBRBKMqHOqlZK+w
         4X0VmEj6BTotc/ZSwQ/hqCf5XFjDLPfMNoRWYQ9eoQMvSpOlejZpx2S6qdCGkDr0mV1j
         tz/t8nrgfTSM3p2DcPJ6IP/ULX8p9u8n4bLZ8UppcJfyijITcktTN9QxUA/PYL/GUGR2
         g1Dwy3qOR6S1EA5f1HDfH1/Z8AcgmbMd6OoD3Rpin7C3Tw7AepN0itfwNNwkxK4BS08T
         wI5vk6637oOkFsektud4GizoiS09rEJkFLg8xFSYn4+9QqroF/v5cNomyMNwCRJWPRAY
         /ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942727; x=1684534727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PF8Qn0Z7zg/7RPDtBuNuOPN3zeJXhr/Jx4YP7Fj6yI4=;
        b=mD1TvfC9/qjwBcG9y0eoS4hMctr1mph3PKuMyjQt07i2L0lxOl3xZDeYGuIuw1Obvu
         tiwHz65xpvgaJr1vjhj+VOGQdcPsU2EPTXAc7YkdbYbTIU5GAjMBCPWf8+bYXZDniX+P
         Y+IlCxSrQzPjPECom3nOdtvp+C9uCZT9TV7VFlzGHtH1IS+oRX1W0mfgWrmxApwPOqde
         pPtPtEnZfDJOOHaqsKOXxNecw2Ms1gkva870ywZcAUXqQrdJDv7jSyUYZ8Tv16GJulf/
         LGuwIfmgXK27395A+GbTOll3JIKtE3h30TUP4Btm2eoNZPm+TpyhzaP3P+OtDni0vT9X
         R+JQ==
X-Gm-Message-State: AAQBX9fS26l+IykJUzQFdNAZqLif9FjNIisfjhe/ks6S6bV2eMLTMqGc
	poOElUV5n/yiNJPkSsBJLtdZpQ==
X-Google-Smtp-Source: AKy350Zh1JoIu/w89g7BU4hvCJLzB5n1X2PHzMgJ8jQn7nK1FJDYYuKYpLhfuRupPsetmV7URaqafw==
X-Received: by 2002:a17:902:ea03:b0:19b:64bb:d546 with SMTP id s3-20020a170902ea0300b0019b64bbd546mr4360345plg.18.1681942727339;
        Wed, 19 Apr 2023 15:18:47 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:47 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 35/48] RISC-V: KVM: Add TVM init/destroy calls
Date: Wed, 19 Apr 2023 15:17:03 -0700
Message-Id: <20230419221716.3603068-36-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231848_052597_C94E46C2 
X-CRM114-Status: GOOD (  10.45  )
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

A TVM can only be created upon explicit request from the VMM via
the vm type if CoVE SBI extensions must supported by the TSM.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 1b59a8f..8a1460d 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -42,6 +42,19 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		return r;
 	}
 
+	if (unlikely(type == KVM_VM_TYPE_RISCV_COVE)) {
+		if (!kvm_riscv_cove_enabled()) {
+			kvm_err("Unable to init CoVE VM because cove is not enabled\n");
+			return -EPERM;
+		}
+
+		r = kvm_riscv_cove_vm_init(kvm);
+		if (r)
+			return r;
+		kvm->arch.vm_type = type;
+		kvm_info("Trusted VM instance init successful\n");
+	}
+
 	kvm_riscv_aia_init_vm(kvm);
 
 	kvm_riscv_guest_timer_init(kvm);
@@ -54,6 +67,9 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	kvm_destroy_vcpus(kvm);
 
 	kvm_riscv_aia_destroy_vm(kvm);
+
+	if (unlikely(is_cove_vm(kvm)))
+		kvm_riscv_cove_vm_destroy(kvm);
 }
 
 int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irql,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
