Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED6AC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vYmpoEzObstFNZBx4vWKtWimNtrgSYq9CjVQiUW7PA=; b=nkSowq2TI8YqhX
	RHiQ1qkQ++OldrQElMVtzS4+oLrhlXTr/6vGvIelKVVZKJ+nBQvvdPRsIz9NpSMgf2zuKLpspS609
	9ryUWAwlzwC8n7vU/cG0lqejP8JWygj4/9xCtuy19z3deoB0Msv6zBhxWEM6tvcW0dLJuCuPAG+1N
	gNdiSzYXY0TLbLlsIqjsurMhpR/2P3/feOnO3uAMDVnz9dEgwUhf8wDSnFRGfSWCmO3XNew/VeAB+
	1pEWvlvGWhIBbvDF3uNK0/8F4Hd6kz4hZQ9rFAlF3j+pHC41/uXcEo4EyeTs7ThYkBhJLBYmxyTwx
	mtSdYmiVcmuMahVoW/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHG7-006eVx-0p;
	Wed, 19 Apr 2023 23:30:43 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG7e-006SnP-12
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:17:55 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a69f686345so4525435ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942674; x=1684534674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwIdkHCarryXV50I6knz0ZklcYwS0nTZYHahvAAioGA=;
        b=JAfyJwlLZTLpeO+0a9mP+Qz17gHyrei/u3hvU+Y1oEWg9aDIafnfffPw2WLQocmCE5
         thEwftksAEQCxymE79XbmXlY3CV86W6kKDPWDlsoieUM1U98liDXsdwKh0TtzMRMco/6
         2qgFOkWb8NmcTouc/FLGToAZLWlsyjEWM3W1S9eitYQ6PZtGjRV1E0Bh4dYyak7MqlLF
         NqImRVNGkomVidir55QeblFMKk81mgA2duY/+3llfMenErvbAqjZMXeQVvmExrFa536W
         fZATF/TIP+lPFweeamhhj205CiSSkghmiFgf4j0xA47+WlMqYFC57GJCbBbKkv5f7DR4
         f0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942674; x=1684534674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwIdkHCarryXV50I6knz0ZklcYwS0nTZYHahvAAioGA=;
        b=fGzpNa0MfLe62LY2L3Gn3cSi8KU8UTZE3KGWfOF/sqLnmj9P6r4TGpdP3cri8lXGaL
         X9IOGMrJlB3SFVl4juNXM+5STOTots/Pmb6TFTJVvHcA0GjurUhZOZEygYhgqgvvBWxI
         40WkImZC7R55uk3iEO/hpiNQOq5s/GdOM6XBuJ190wCBeMJI/+7+JPAbj/857mxeg3d/
         RuncZQNlKu6qCnTWZmouD6JtsJvpkJ23HL4TEyEhBCnds5GjlLXV6m7FUMEOAC0hj5fQ
         haS7pRHjOs/VGzISsnydihI0DhI4bmfCuemZ3SCBVvTIeqSyZ8fQe/cV/e4Xtpgm+Chm
         FGEQ==
X-Gm-Message-State: AAQBX9ecS0Sfx60e5zfBEqwZiI06QTKD6OesQZNA/rSmapC5e5XhLNAb
	TN1kWp7Oh5CyzAkgdLoMlVU3cw==
X-Google-Smtp-Source: AKy350aOeQnqsiOOnUYsijZU0I/0P7RvEF6TJy/X0/H7ROAFo8Dof2s5JoE26B/8+FVZEZPKo3gc/w==
X-Received: by 2002:a17:902:ce88:b0:1a1:f5dd:2dd5 with SMTP id f8-20020a170902ce8800b001a1f5dd2dd5mr8081414plg.13.1681942674035;
        Wed, 19 Apr 2023 15:17:54 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:53 -0700 (PDT)
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
Subject: [RFC 11/48] RISC-V: KVM: Use the new VM IOCTL for measuring pages
Date: Wed, 19 Apr 2023 15:16:39 -0700
Message-Id: <20230419221716.3603068-12-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151754_358798_8AF52F4E 
X-CRM114-Status: GOOD (  13.90  )
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

The newly introduced VM IOCTL allow the VMM to measure the pages used
to load the blobs. Hookup the VM ioctl.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vm.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 29d3221..1b59a8f 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/uaccess.h>
 #include <linux/kvm_host.h>
+#include <asm/kvm_cove.h>
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS()
@@ -209,5 +210,20 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 long kvm_arch_vm_ioctl(struct file *filp,
 		       unsigned int ioctl, unsigned long arg)
 {
-	return -EINVAL;
+	struct kvm *kvm = filp->private_data;
+	void __user *argp = (void __user *)arg;
+	struct kvm_riscv_cove_measure_region mr;
+
+	switch (ioctl) {
+	case KVM_RISCV_COVE_MEASURE_REGION:
+		if (!is_cove_vm(kvm))
+			return -EINVAL;
+		if (copy_from_user(&mr, argp, sizeof(mr)))
+			return -EFAULT;
+
+		return kvm_riscv_cove_vm_measure_pages(kvm, &mr);
+	default:
+		return -EINVAL;
+	}
+
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
