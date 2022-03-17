Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8794C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 03:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UXywgzBJD7oxzTwp0NB6bxfTHBCNIsuCputL4p7IiBg=; b=Z6qFtEkcj2Po+/
	4q6wBUybQb6PIDf64sMpaO71dc0kHK4jQxmJ7XRShdjTHSGX/hrbjh+8Q4iZ9xnLVqMvS+yhwE+wd
	Ohm960bAt+9iJ+QxBAOyErO+vob0y8cUuGD5I1nzBHYEO9f3Pv/DZ+WlXwqFgCwjCVsm99cjzys1R
	i8FK5lWCEfdpEKT2Kp9w4YmRJ4njW9FzDiCybEAh1zT/TCNLGOFMNNxQtl5N5KqYiZ6M5lrJK/dcF
	1idYlr3J3fg3Vobz8ykVgWifmE5DxEh3lpsZ5XCq2bWaQ10b56iJs8HzAILzUaL6CfMBWjqMNdNrO
	lUj+1IRAp2/6ieJZ4v3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUhEp-00ErTv-Ee; Thu, 17 Mar 2022 03:55:47 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUhEl-00ErSq-UQ
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 03:55:46 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 mj15-20020a17090b368f00b001c637aa358eso6495143pjb.0
 for <linux-riscv@lists.infradead.org>; Wed, 16 Mar 2022 20:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VvVRu/eQ4rluWWC4xLbR2tgbkWAUCRDnVAYNhV1Z6xc=;
 b=M8svGS/iYe/6Axq12vi5bRDCEMlzc6Ij8qRz9Jv2zShz/ObYi/K8LvxnXddnqwdlZ5
 Hy8n9AmCKbusB4osSPTnHAVp8vUxmh7SSg9lwbwwufhybms+bvk63V8UIvo3q7mbeWUr
 ms0f7znXjC7cHbVmrOohql/i6f8ctFGbu8I9sNEgFyiZeOLtmREtacl8Yw4snmOA8pXM
 kQilYsz8Wh8v2crCMneeQf+7yJnPEZ2x4vdo/qdi/D/NOFRsSbZ+5MsxXFKvgaMYLpf+
 WUk8rZ4g3h3S5QvnL30UOp/JJuMmWm3L6uvPr4rQBgKs/g6hiojbCciTRUP/h0N9SzjX
 D/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VvVRu/eQ4rluWWC4xLbR2tgbkWAUCRDnVAYNhV1Z6xc=;
 b=x8c8SFHiwfLzYiyFwjCUFgiVtSKEE1dVSMjqZextLQvP9OgEXQuC+41uYPyqf+FA6Z
 NTrXmu1swhhDlRdpiPCUBq0dT6aMA/41887EOsEgk4RaIFn9W0IuQ134kfvDQsHdGzJs
 wCW8br3+93fbyVUpsFPcskwKPCNSlCp9hYVv5CPa6zyn7zMypmfJl+AE0YwIskqRRpqV
 Qbn9Mt27ByMTtM5m/uyhwAFMs3GU2neTkxXwGBiPVGGHD7icwZI13P6AAVNzUE3w8kqy
 FlWvljznq8bLygHktkvfIrTmF/GD/z/fELe7d6Ky2gWdidfFfWcVL8vM4zyfwMonQY2V
 0j7A==
X-Gm-Message-State: AOAM532aJ7mwBWMtSp6kQZdCBrfFrQ+LAZBPHuIWsRReFTk/LvjCIV4d
 TJvOWhmG4yjyQDLNjH4iqGgyxeMVefcfiA==
X-Google-Smtp-Source: ABdhPJyi19/Qz8TowVm2OmKd/W9qF6RFe2vVau6sqR7JL6Hr7iGFozZcp/GI1PSjE0Jf1/f0WMuLow==
X-Received: by 2002:a17:903:234d:b0:153:b63f:8abf with SMTP id
 c13-20020a170903234d00b00153b63f8abfmr3060697plh.51.1647489342392; 
 Wed, 16 Mar 2022 20:55:42 -0700 (PDT)
Received: from localhost.localdomain ([122.171.160.59])
 by smtp.gmail.com with ESMTPSA id
 132-20020a62168a000000b004f40e8b3133sm5074436pfw.188.2022.03.16.20.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 20:55:41 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
 stable@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Don't clear hgatp CSR in kvm_arch_vcpu_put()
Date: Thu, 17 Mar 2022 09:25:21 +0530
Message-Id: <20220317035521.272486-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_205544_023826_F15E371D 
X-CRM114-Status: UNSURE (   6.54  )
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

We might have RISC-V systems (such as QEMU) where VMID is not part
of the TLB entry tag so these systems will have to flush all TLB
enteries upon any change in hgatp.VMID.

Currently, we zero-out hgatp CSR in kvm_arch_vcpu_put() and we
re-program hgatp CSR in kvm_arch_vcpu_load(). For above described
systems, this will flush all TLB enteries whenever VCPU exits to
user-space hence reducing performance.

This patch fixes above described performance issue by not clearing
hgatp CSR in kvm_arch_vcpu_put().

Fixes: 34bde9d8b9e6 ("RISC-V: KVM: Implement VCPU world-switch")
Cc: stable@vger.kernel.org
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 624166004e36..6785aef4cbd4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -653,8 +653,6 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 				     vcpu->arch.isa);
 	kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
 
-	csr_write(CSR_HGATP, 0);
-
 	csr->vsstatus = csr_read(CSR_VSSTATUS);
 	csr->vsie = csr_read(CSR_VSIE);
 	csr->vstvec = csr_read(CSR_VSTVEC);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
