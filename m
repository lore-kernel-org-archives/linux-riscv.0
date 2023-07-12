Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A00CC001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPxVXtVdjfF+AUj2r++cr5vB02YBdVKMjWtSgGtSQKA=; b=xoRLKqcE0S/2Xh
	X7fV96Hg/aPqPbzIoXrBh4+v/wmvT2cGu1GthxlIy4zokh93VhzSOpdLXXE9UehcmBGN1lGATMJgY
	aFZ972Foe/V9MxPYhR5TAEnQybZz20Gn7QRE/LZprQLGcLB0MglHXPy578zCA1I4f/s3HeeabSYW8
	uVQ0gv5GXeIAfcWblgMG2GoXbP0lQMl9KoV5UyFFQJzYvQSdbUBwwosN7ZtUwL6+1daDATJ+OBQIK
	6WljmobLr8acgLiM1tfjw2LHeYLe0tqM7xOfWd39tWQiJBepf7BxDO3r86xWhPgGEjoF/YD/Z7zIK
	MHMOLDSu/F3dgB2x6t+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcRB-000TqH-12;
	Wed, 12 Jul 2023 16:11:33 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcR6-000TmA-28
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 16:11:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b9c368f4b5so6668285ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689178288; x=1691770288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmAdt18zp6t4Zhgiqm8zC0JEDWTldiIyDdHXaTHo/h0=;
        b=kQkQUlSShEQrgDlX6aIxC7vQH9LcEtlGV0uGQCn6b057ZS+SXc6XNnSW8/ZN3WobJE
         pGekJOd/AaW89tvlhFIywJf2d99HhqH1Am/O0aszingM1caqHb/btaE+IFccIYRbSmag
         5EFUc9uhQoisGTOVWtt2iJBhQWVoPZx7If0IS7eUanEi6trVA8tRHdFXsZdhRV5KK6Bk
         RyxNOlGCOU8Eg5VUdYs/xJEYLb6t9eNA4swZ5LwJcBtwp3lSfY895jeJu21rzNVly5jk
         oXW3QoE475K/klVUJXHXxZfjugv4/qMeWeRc2l6PJgF+6BBQWZP308x8O7cZyD5TUxTs
         QNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689178288; x=1691770288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmAdt18zp6t4Zhgiqm8zC0JEDWTldiIyDdHXaTHo/h0=;
        b=J4IbbGjdLZWtKqR2iZ3XZPW9fYNS+bZ3p6BfupbZGvJkKk2gQuons3nHu4/GUGVniE
         0KmZRMKJzbdgz+E8VhIrCYzK7qYapVA2c2cCaipuovYHfazhKfvXQBj4fldBDVQHPOpl
         xrEca+0Ff+apn59iFBlExzc/L+34IXMEzFqEBdBd1DITNHwGaulP2w1p/1nKgIw1KW6Q
         5xLSZ1EJrNfCbAvoifm4lNS9FwfVwrqDPT0wRs3+UhnDXckEvPITFb4ZYFLKbxXlFOon
         jw2fRM2jlc+mnILtIlBHmj1B5f68Qc0KqemIfLeFR6YbE/5VZ9H9F/clUbM95XKEUAAQ
         bBrg==
X-Gm-Message-State: ABy/qLanmhPLgxN0GkDgY/VRB/zmLnWxq/ZLZsqeXYsD0nxLgaBy3CAS
	m0Ig8/Njcxou280gmwxXCvX87Q==
X-Google-Smtp-Source: APBJJlHAwaBqYGiIZmjm5nXgjudHpZLu+aIM3EZuURNmVtDG80/PswBUaHV1/MXHja9nt8wuObYMWQ==
X-Received: by 2002:a17:902:ea02:b0:1b9:d335:1b7d with SMTP id s2-20020a170902ea0200b001b9d3351b7dmr3023742plg.6.1689178288003;
        Wed, 12 Jul 2023 09:11:28 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.82.173])
        by smtp.gmail.com with ESMTPSA id bc2-20020a170902930200b001b9f032bb3dsm3811650plb.3.2023.07.12.09.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 09:11:27 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Samuel Ortiz <sameo@rivosinc.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 7/7] RISC-V: KVM: Allow Zvb* and Zvk* extensions for Guest/VM
Date: Wed, 12 Jul 2023 21:40:47 +0530
Message-Id: <20230712161047.1764756-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712161047.1764756-1-apatel@ventanamicro.com>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_091128_714797_7559BADC 
X-CRM114-Status: UNSURE (   8.43  )
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

We extend the KVM ISA extension ONE_REG interface to allow KVM
user space to detect and enable Zvb* and Zvk* extensions for
Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  9 +++++++++
 arch/riscv/kvm/vcpu_onereg.c      | 18 ++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 182e7bdfc842..3929d3a7bd24 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -141,6 +141,15 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZKSED,
 	KVM_RISCV_ISA_EXT_ZKSH,
 	KVM_RISCV_ISA_EXT_ZKT,
+	KVM_RISCV_ISA_EXT_ZVBB,
+	KVM_RISCV_ISA_EXT_ZVBC,
+	KVM_RISCV_ISA_EXT_ZVKG,
+	KVM_RISCV_ISA_EXT_ZVKNED,
+	KVM_RISCV_ISA_EXT_ZVKNHA,
+	KVM_RISCV_ISA_EXT_ZVKNHB,
+	KVM_RISCV_ISA_EXT_ZVKSED,
+	KVM_RISCV_ISA_EXT_ZVKSH,
+	KVM_RISCV_ISA_EXT_ZVKT,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 08e077260214..89efa5e3e3f1 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -59,6 +59,15 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZKSED),
 	KVM_ISA_EXT_ARR(ZKSH),
 	KVM_ISA_EXT_ARR(ZKT),
+	KVM_ISA_EXT_ARR(ZVBB),
+	KVM_ISA_EXT_ARR(ZVBC),
+	KVM_ISA_EXT_ARR(ZVKG),
+	KVM_ISA_EXT_ARR(ZVKNED),
+	KVM_ISA_EXT_ARR(ZVKNHA),
+	KVM_ISA_EXT_ARR(ZVKNHB),
+	KVM_ISA_EXT_ARR(ZVKSED),
+	KVM_ISA_EXT_ARR(ZVKSH),
+	KVM_ISA_EXT_ARR(ZVKT),
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -117,6 +126,15 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZKSED:
 	case KVM_RISCV_ISA_EXT_ZKSH:
 	case KVM_RISCV_ISA_EXT_ZKT:
+	case KVM_RISCV_ISA_EXT_ZVBB:
+	case KVM_RISCV_ISA_EXT_ZVBC:
+	case KVM_RISCV_ISA_EXT_ZVKG:
+	case KVM_RISCV_ISA_EXT_ZVKNED:
+	case KVM_RISCV_ISA_EXT_ZVKNHA:
+	case KVM_RISCV_ISA_EXT_ZVKNHB:
+	case KVM_RISCV_ISA_EXT_ZVKSED:
+	case KVM_RISCV_ISA_EXT_ZVKSH:
+	case KVM_RISCV_ISA_EXT_ZVKT:
 		return false;
 	default:
 		break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
