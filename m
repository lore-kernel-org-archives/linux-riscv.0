Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAAFC7EE20
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRfTCshYF1QnxYh8pwVT712wM1N7DvOuCmFBsnKWh1k=; b=sW9E9PKV65pplM
	DvEb/6AVnDExlEC9bQYom3O3pf9BjZL+4PGrjmH3ws4Uy89nPkb5zpH+wlbGmKsx0I+mc3rM8Pm3c
	aNjGIYlP1Oy5A6fMtjplYgAZ6H9rWgNmxld/uarIDe9wAoN3P4YSDeEo1ga/Inl7r9fUHRoW3zLaX
	h1x+QKkJvgBjK2L+gv+n5qzR983XYFQE7IwMH7xzCc5uVT6X5IcvmPqVaBJqR92lStzx2DauVIL4p
	BBBsuMxqlaEs4idJh9PqYXQp5Mo3j2AxJcBY7kAzl7V61u2hvqNZ7xJ16PNNDY1MZCyk15kH0DaxW
	M0dCaihC5bdN4UhnVIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHGG-006ejN-1x;
	Wed, 19 Apr 2023 23:30:52 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDi-006Ufw-2C
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:24:12 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-63b64a32fd2so482785b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943050; x=1684535050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqxJzuQg4YHoKMLWmjQ5z9IqDd25T8M3gtHVASWlMsA=;
        b=CdFLGUbJVpNnlbN6H0RysN3QwK8Q22dGILzUyKn1eed3BCAW6+MEMsBRDq2/F3MfEN
         8F/42PROs9h1k2Q7VrH4EPO6wp5xxtsziRkW162nuTlbeuaKnWv/CAiPccnTCWWIYPQk
         oJLjTPMoTHn4eG+8ibMKGv7GyStv5zxs81LmeyyaemazO9r8w0RuVqYmdLVQ/35zsHF4
         Epuj0d4WbFCdWHPxERyyC/wFKBbzXDxx2K1QzNu3em+Y/D7eT+3ZwnJpBriORGuqa1bG
         mG11CSzZymcMK9J81Dm4lnZ1qJfC6fNYaISOIHAhx4fE/+Qh3aPrGDxSYFrQFc63TMHE
         cEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943050; x=1684535050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqxJzuQg4YHoKMLWmjQ5z9IqDd25T8M3gtHVASWlMsA=;
        b=CKAkC+v35jT9NJG/EuxU0yWcc46wUpTHOV8sOXX19SL1aX3PHTRbeRR5W2oFNWEZpn
         6OzbpBcqt4XAsFYmOymx9rujQeUxS/MmrwWwddKrZjpPdTCBWVCsIhVh6+qNtybXOBOg
         IU4Mo6/OZYiQQvhgt0hntlvhBcCenWXyD4EX/3OnE5vzCa4+l0lYVwiHSHxMe0RSOC1p
         AR23WmLg7qwssULX7XapAc2u+ftgk52W0lgk6+XVAMLSbAxkM9v3XYHz/kEJL2RR1Tkd
         lvw7vQE2/UbOJdbuubnWKphxL4QQ1xBGJslvcp+KcF2qBEM99BkNirXmpFF4xdbrHRUg
         /a6A==
X-Gm-Message-State: AAQBX9f3xmJ741RJu376InbaAB1SoUpg//KI13LiQ8bxEzQThJ+GpkNi
	8xccIGsai3iXDOP0rxORhH+1RQ==
X-Google-Smtp-Source: AKy350Y1oJzpFyEWrofUoiBPrqInLwUP0IdbCjWNBlR0+a+fpEuwpi5wATQkdQOE2P7s+B2OF642XA==
X-Received: by 2002:a17:902:db08:b0:1a6:8405:f709 with SMTP id m8-20020a170902db0800b001a68405f709mr8145477plx.20.1681943049834;
        Wed, 19 Apr 2023 15:24:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:09 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC kvmtool 04/10] riscv: Invoke measure region for VM images
Date: Wed, 19 Apr 2023 15:23:44 -0700
Message-Id: <20230419222350.3604274-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_152410_722072_558F8F05 
X-CRM114-Status: GOOD (  10.89  )
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

The DT, initrd and kernel images needs to be measured before a CoVE VM
can be started to validate its authenticity.

Hookup the measure region API for these three components.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/fdt.c | 3 +++
 riscv/kvm.c | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 61a28bb..07ec336 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -254,6 +254,9 @@ static int setup_fdt(struct kvm *kvm)
 
 	if (kvm->cfg.arch.dump_dtb_filename)
 		dump_fdt(kvm->cfg.arch.dump_dtb_filename, fdt_dest);
+
+	kvm_cove_measure_region(kvm, (unsigned long)fdt_dest,
+				kvm->arch.dtb_guest_start, FDT_MAX_SIZE);
 	return 0;
 }
 late_init(setup_fdt);
diff --git a/riscv/kvm.c b/riscv/kvm.c
index 99b253e..d59e8bc 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -148,6 +148,8 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 	pr_debug("Loaded kernel to 0x%llx (%zd bytes)",
 		 kvm->arch.kern_guest_start, file_size);
 
+	kvm_cove_measure_region(kvm, (unsigned long)pos, kvm->arch.kern_guest_start,
+			       file_size);
 	/* Place FDT just after kernel at FDT_ALIGN address */
 	pos = kernel_end + FDT_ALIGN;
 	guest_addr = ALIGN(host_to_guest_flat(kvm, pos), FDT_ALIGN);
@@ -188,6 +190,8 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 		pr_debug("Loaded initrd to 0x%llx (%llu bytes)",
 			 kvm->arch.initrd_guest_start,
 			 kvm->arch.initrd_size);
+		kvm_cove_measure_region(kvm, (unsigned long)pos, initrd_start,
+				       file_size);
 	} else {
 		kvm->arch.initrd_size = 0;
 	}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
