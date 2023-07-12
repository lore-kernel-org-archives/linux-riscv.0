Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA9BEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vH/0Vg/0SUnw1ORv85Nh2JZHPlpH2EWrP6bKlm0hUxw=; b=AOExbRcWVtInme
	BLZkYqPNEnzcjqaVcejU/Sh5vZuCwCrmDLqZOk3S8z4APwr2QuARY/DlCGtEuvv2xxCPiII1y2699
	DSBs2ZXokrqpfw7c6dzQL1bSN9+JFOFV3MQfqmfQqzkDyID5n+RMnFvacwjCcA/TLzb8zOT81kFhV
	KBJWdLObwJC7/6ddRXQeIbsPk1O4CVtfIrdvvKISMMnl0cGYl0kyg5jqSXpgDFaJXtZYwfZZmpays
	DOtZFzi+qyPISyY2RB17PYu0iGkI30g3VahVHemjzBGffUmSUIpys8JkC9rjTZBiAx09f9n3kvJ76
	Xt66ec1l/+fvFxU/SHmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcR6-000Tm4-1E;
	Wed, 12 Jul 2023 16:11:28 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcR1-000TfM-2c
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 16:11:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b9cd6a0051so27067085ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 09:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689178281; x=1691770281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HMl+3di3ifPPR0J8mu4JHNAW6MjLms68ot2tGPXSQQ=;
        b=mZf39NpCdkgfQ/VivpPnvKcCof7f9EuIMC3YmRIn7VvXPbx6t4mqg2OdlM1YkWbiC5
         6aTjSDJ0F1de9/3WCK+SXI3V+qDv2B36AXkMhXx7IsjlDz51ovmmY4rXNypOa3u1t9IM
         cvY2A9Gw5EXHdzW+4z7A2hA4rv0zDqKXPNYI7SmGvK8Mdb0lQtXy9orN1x3llS/ZWzjo
         LxYMmUTZuxi54QVMYkHhfEHNmY6i7kkaca5BgXos237GojE/z+/MxyXnJjG0VNOSZVV/
         L7Nm298rNlxHYVMpGS8HtqF0YxEpQnLP2YdurJORH4u8xAxU5chHPn4Eevz14VLdknmD
         nVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689178281; x=1691770281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HMl+3di3ifPPR0J8mu4JHNAW6MjLms68ot2tGPXSQQ=;
        b=JqXISeF8A1OhI+e85zmxyYT8jvS/WghnaHpg28xnWSMJsGJVj+NtITzyRadSU8+5CV
         cmlP/wsJRn+SEZCJ7/Ze7Z4SXzH9gfI2sDpTENHajOPETLiA2giwS4R+dE6+Yw1gGMBS
         MzQID4H4lPjIx75ypsi8F/AwyFZz+wYwzMlzt8PxfzoAKrba/UE5kODcqPo6if/r3JGU
         x2ghLOLySDpa+RyNN1noTiy8D8m86VjQElMKawQmcFL+bDwp5ZmQ1YGAZbioEvykKDyS
         DPQRnZMBBYuUJQRwVl78WuFsOEuJ99bJl7jejIIsY2eTekKduhay8EJXUv4ld6Nolhw5
         meYw==
X-Gm-Message-State: ABy/qLbEq0EPFIQfLJqSpqgFMytNdEtKLpC/ssKH4HYqoaxpQe/9DXic
	BoxjJtnZ/RkXzhOUfuLwMcZYgA==
X-Google-Smtp-Source: APBJJlFCstxiycuz4EWqUbsVDEZNs3hK944q9YYyrlNHK/0+r5ZzGzlMBmb4rMnPm0gSHom+jTfe3w==
X-Received: by 2002:a17:902:b083:b0:1b9:e091:8b08 with SMTP id p3-20020a170902b08300b001b9e0918b08mr6966398plr.58.1689178280775;
        Wed, 12 Jul 2023 09:11:20 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.82.173])
        by smtp.gmail.com with ESMTPSA id bc2-20020a170902930200b001b9f032bb3dsm3811650plb.3.2023.07.12.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 09:11:20 -0700 (PDT)
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
Subject: [PATCH 5/7] RISC-V: KVM: Sort ISA extensions alphabetically in ONE_REG interface
Date: Wed, 12 Jul 2023 21:40:45 +0530
Message-Id: <20230712161047.1764756-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712161047.1764756-1-apatel@ventanamicro.com>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_091123_848984_DD1CF35B 
X-CRM114-Status: GOOD (  10.05  )
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

Let us sort isa extensions alphabetically in kvm_isa_ext_arr[] and
kvm_riscv_vcpu_isa_disable_allowed() so that future insertions are
more predictable.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index e73f9b105a02..36871a417e69 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -23,6 +23,7 @@
 
 /* Mapping between KVM ISA Extension ID & Host ISA extension ID */
 static const unsigned long kvm_isa_ext_arr[] = {
+	/* Single letter extensions (alphabetically sorted) */
 	[KVM_RISCV_ISA_EXT_A] = RISCV_ISA_EXT_a,
 	[KVM_RISCV_ISA_EXT_C] = RISCV_ISA_EXT_c,
 	[KVM_RISCV_ISA_EXT_D] = RISCV_ISA_EXT_d,
@@ -31,7 +32,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
 	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
 	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
-
+	/* Multi letter extensions (alphabetically sorted) */
 	KVM_ISA_EXT_ARR(SSAIA),
 	KVM_ISA_EXT_ARR(SSTC),
 	KVM_ISA_EXT_ARR(SVINVAL),
@@ -40,13 +41,13 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZBA),
 	KVM_ISA_EXT_ARR(ZBB),
 	KVM_ISA_EXT_ARR(ZBS),
+	KVM_ISA_EXT_ARR(ZICBOM),
+	KVM_ISA_EXT_ARR(ZICBOZ),
 	KVM_ISA_EXT_ARR(ZICNTR),
 	KVM_ISA_EXT_ARR(ZICSR),
 	KVM_ISA_EXT_ARR(ZIFENCEI),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZIHPM),
-	KVM_ISA_EXT_ARR(ZICBOM),
-	KVM_ISA_EXT_ARR(ZICBOZ),
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -86,14 +87,14 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
+	case KVM_RISCV_ISA_EXT_ZBA:
+	case KVM_RISCV_ISA_EXT_ZBB:
+	case KVM_RISCV_ISA_EXT_ZBS:
 	case KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_RISCV_ISA_EXT_ZICSR:
 	case KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_RISCV_ISA_EXT_ZIHPM:
-	case KVM_RISCV_ISA_EXT_ZBA:
-	case KVM_RISCV_ISA_EXT_ZBB:
-	case KVM_RISCV_ISA_EXT_ZBS:
 		return false;
 	default:
 		break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
