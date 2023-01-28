Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ED7C61DB3
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TYLSvWJ406MMBamJaGWZGo3pjSSYGuSx9UcqV2ER6w=; b=T/qYby/zeXnZ9Q
	vXscCbnNDBTke9vi4k4fhtye/+QBcL1lAtdBvvM9pCFGg34tkuEdQSHNbhU3hYX983/0y2/jCr/m5
	ojm3m2GJByLeUNb8EZ24AI+N02lMDF8RDX9M21OnoPO3TQ4O8t+eR2bNePPtem8qjPGrWYREOvPhe
	VRkhHGoPFyGfcrNV3ywHVtXQLakTUya9LoeachSZPiomlqGwmA3oPNBMIZk/jZHLD9KyBNeD5lZR6
	WJ+upnbE11QpZ3623r9hDxkA1LS2Nt39xsHay66vWp5D+GzkxUmD318ORA04innVXdd3UqrSyFvbZ
	AQqZ7ktYLRFXPiB+MAQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLgaB-00HTLC-8g; Sat, 28 Jan 2023 08:29:07 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLga8-00HTJI-68
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 08:29:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id r8so280238pls.2
        for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 00:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FljnRzw2zIs2SaTw4PAfD3E9tIV3gHkmBf8hApNO6fw=;
        b=OQizLRENPAg09ciAbZoN5itK16Pz2bFe45sopfZppnH0Ud5XsJVtEotBWwPAg2/UWT
         P/udJB7pRNtPQqdy3cdj0M+2GNCv5rS5XLbQrM11WQ2U1/Hb2+U99G2rsJHywjGkF8hp
         lNNYYta2mdtUotMek4oyyiqqICB9JexQFicaRCgMT4X1r1cLj5EiEnIh/b65TLt76ui4
         f3n9nqSwQ0kz0qHhn542mTas5YO2S+dA6/LraWs+hCe/8PQANnV7VWEtktCRUVU9EJTI
         v4xZ/s0AevZHVyQ8Y4CcEBtoMRTEWOtEDLTPfTddIzBCl9CbwsMO74mP/0c2bEb2L32j
         1OPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FljnRzw2zIs2SaTw4PAfD3E9tIV3gHkmBf8hApNO6fw=;
        b=U7XavX3Yh73irwhquYqatVNS/xXJ2fNmwQsycWhDa/FvKyzfM803U4W/C6gabWDTBY
         xBYUr+BSHA4y2X4Td5ETwiKC6F12wVGJMFr8Ft82jiZp2q7zqrzV2ysAQfVB7o4VEgWo
         cviN3NFNq5k+6WQVFWhTfR4mA210CHTzNaDQLT50IB2qTGUBRnYG0IE1tkBLN8dpTOyH
         Ez6ttxPFGLjv/A7UDIbJYMeaIUZESe82lWh+TuxJj5CcWz6ZRZkVggtoocC6s2mzsJUr
         mqrGnXeeyLOAgMy6Q/R4D8TAgVGxaYkveXyhakDlDxWHX1p+Qf5uMsSYDfo93+Mk6j6H
         AlTA==
X-Gm-Message-State: AFqh2ko8qWmSACFzKy5hnJvskoiLDGLPF6AMLd8BrLcb73veUhxGi9/P
	2+RnsLYFN5dvpVBYpMHk9pToFg==
X-Google-Smtp-Source: AMrXdXvje0+V7Y5a71q6YW6SkRvl2pnS+6PeoYGrwzhIYPvr6ISBcOZNGtYQPAoOGCEHtg10GXi4Tw==
X-Received: by 2002:a05:6a20:4c16:b0:b8:6371:9abf with SMTP id fm22-20020a056a204c1600b000b863719abfmr41015379pzb.27.1674894542483;
        Sat, 28 Jan 2023 00:29:02 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id i67-20020a639d46000000b004cc95c9bd97sm3477807pgd.35.2023.01.28.00.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 00:29:01 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 2/2] RISC-V: KVM: Redirect illegal instruction traps to guest
Date: Sat, 28 Jan 2023 13:58:47 +0530
Message-Id: <20230128082847.3055316-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128082847.3055316-1-apatel@ventanamicro.com>
References: <20230128082847.3055316-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_002904_256980_2BD115E7 
X-CRM114-Status: UNSURE (   9.44  )
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

From: Andy Chiu <andy.chiu@sifive.com>

The M-mode redirects an unhandled illegal instruction trap back
to S-mode. However, KVM running in HS-mode terminates the VS-mode
software when it receives illegal instruction trap. Instead, KVM
should redirect the illegal instruction trap back to VS-mode, and
let VS-mode trap handler decide the next step. This futher allows
guest kernel to implement on-demand enabling of vector extension
for a guest user space process upon first-use.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_exit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index af7c4bc07929..4ea101a73d8b 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -182,6 +182,12 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	ret = -EFAULT;
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	switch (trap->scause) {
+	case EXC_INST_ILLEGAL:
+		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
+			kvm_riscv_vcpu_trap_redirect(vcpu, trap);
+			ret = 1;
+		}
+		break;
 	case EXC_VIRTUAL_INST_FAULT:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
 			ret = kvm_riscv_vcpu_virtual_insn(vcpu, run, trap);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
