Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0459FC07CA9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RM+09YhULf75DUVG0lmcAr7902dZ+6Gs3A8B8xgcME=; b=FdVOUoxS6ZJVCd
	2Vp2NEmd1Cay5xuR4pgfJE/kc8eNUGEc7vKb/rix3dnN7uKa/tCam5AjhTkK7/65lnWhx6fBtnVd7
	k255w7vFqKLGU7RJX5Qd9tLNukkJTeHicKuQ342eMVJWPJiIUODIF91QW0zUa8uN3Xmr1yQH6bxjY
	De7ra/5neFD4Bw87JkJwhnpeUSCKsFPvgsRrp0Qb7cqDx76caAN6B4+GjpuwKfejskAHvODlCp2DO
	hrlrapf26z1a6cTfAIGNgX+AXEcA0EcW1z9u8n99tT0cklWTA5UbxzEXPmd+lqChht+Pg77/SsuKm
	Sp3QomnXVN0ceTDmtePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zTi-005ZFC-2S;
	Tue, 28 Nov 2023 14:54:22 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zTf-005ZBs-1K
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:54:21 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6cb55001124so4623147b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183258; x=1701788058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWjJzXo4ydUM1qBdZFj/A/LBdPnzjXBTEeDQn9bxklc=;
        b=eKWGG344ep2yCphIlD0OuYqL7Y4e10iQZnH5jWs1zO+AeCM1hyqBAFRAPYyrlLsoY2
         KNNRnUR1S5JTOzd/frX+vWWqI/mYKpuIQ2iw76RsVzaNaPU3EOOINe/KswbxCKkRb4r0
         vqMpWKnhPlskASBbsKa6vTPqHffDlHGgndTIHTW8fuEKPd1De04xHN3HCxOtAmdcwZJB
         vg5Z63Voj3wxgFVk3aKZqBOpC6tUIXOvzYbVNoaYeaHhrO0FNKpI6YtMjkYRB8CV4WdY
         hzk2ks3W8iqyemw9RwKsX6La5uzLXldH7V5aBv4DSbw1dujjREml42RjgQjz5+iRotw7
         jdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183258; x=1701788058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWjJzXo4ydUM1qBdZFj/A/LBdPnzjXBTEeDQn9bxklc=;
        b=EBvmJoLVEpPATRlex51qN2LpxE2FD993jvWp9DP4UwtnTWFjC8vBjNZOD8088s4fIt
         ryf2ibE5QlRFlKNSi1tq0sOiDm0RWURTWpk86K4MRlfYY6goX7zF/MVzi+yGBc+IeoOD
         Q+UzkqbgjSIWZHw63Q8ofJ2qaevAc+RDxZTRzUWbk/Bup9ynY04ZeINlG4Ztw0wqVCNr
         uiOLPVnj7oGqzyiogk3o7P6y4p35l7pnCvmzRIHfhiJM7PJFKnBegFCkqWk0tJOacCtn
         PVXGLe/B1kUNH1CLecHbYz9hF2AagRz7Arf4coVIHPX1uTEr2GHqsfxfZmZdIQVbxOGP
         fHkg==
X-Gm-Message-State: AOJu0YzZuuRbryr66RLs0e+3OsK4TDSJ58tTTBZRz39IF4JhZ6US/r7S
	vKj/N9AUp0dnUtkvA1XfCrdbyg==
X-Google-Smtp-Source: AGHT+IGxW136Vwz0iG0z8Bd+73y8peGGLL8YdmZ8vllqxs8AnDN8I+cKti2HazA7AW6wj4+a/QmmRQ==
X-Received: by 2002:a17:90b:4b0e:b0:285:b687:b831 with SMTP id lx14-20020a17090b4b0e00b00285b687b831mr14391825pjb.10.1701183257699;
        Tue, 28 Nov 2023 06:54:17 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:54:17 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 02/15] RISC-V: KVM: Allow Zbc extension for Guest/VM
Date: Tue, 28 Nov 2023 20:23:44 +0530
Message-Id: <20231128145357.413321-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065419_448131_73519246 
X-CRM114-Status: UNSURE (   8.50  )
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
user space to detect and enable Zbc extension for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 60d3b21dead7..518b368b41e5 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -139,6 +139,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZIHPM,
 	KVM_RISCV_ISA_EXT_SMSTATEEN,
 	KVM_RISCV_ISA_EXT_ZICOND,
+	KVM_RISCV_ISA_EXT_ZBC,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index f8c9fa0c03c5..f789517c9fae 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -42,6 +42,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVPBMT),
 	KVM_ISA_EXT_ARR(ZBA),
 	KVM_ISA_EXT_ARR(ZBB),
+	KVM_ISA_EXT_ARR(ZBC),
 	KVM_ISA_EXT_ARR(ZBS),
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOZ),
@@ -92,6 +93,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_RISCV_ISA_EXT_ZBB:
+	case KVM_RISCV_ISA_EXT_ZBC:
 	case KVM_RISCV_ISA_EXT_ZBS:
 	case KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_RISCV_ISA_EXT_ZICOND:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
