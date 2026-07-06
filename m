Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4BBC43602
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8WkCRhggjFPjA8XzzEtDOIlLKABZuoRMvGF+zXjAB6U=; b=F42vzsvrqNUN4N
	qWZoq/3G0iiJ0JgHm7wmdsZe7zQ11x63hr/Sb6GWuucTw+upZ6HHzy2yqll9mr4oMXjtn3tCUDBRc
	pnQtlU2Wm2tBI9VJBMesv/2uLNivQUifEd3klfxkKqnRGbtVcmYtu2phqeOw5a5LBjhu6Z1Jg8eQT
	7ZfG+Gir//vpxkkCCJ1ODs7JxUyEyQu7Jkl036g4g4qpQpDQbVRPPKTakLIWL5W7E5eyzNMoZAdqS
	SNL64+2Y94BtPipVASTIB2mRk106BGyEjSPu3V5/RidH6UqflSBgMV46gFzcp06wVh7je4rnSVK8S
	EPEdeHIzDDuzMqK6UmdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYp9-0000000BMdQ-36et;
	Mon, 06 Jul 2026 02:12:43 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYp7-0000000BMb1-1247
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:12:42 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-847968ca62fso2493151b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783303960; x=1783908760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVL4Q3g2uFBrFhtqEHVihrv/zmgdiC+pHWdUndlTmlw=;
        b=cMuq8iCOoSwurl8dcn0zC+XabPmgPD7a2Uw3OITAVnHnQ1DxRlRveYHyc5+7pqAwPJ
         5pzc4gbqw9AJh4pDrTmEiDX2Md8o9oDf/WUWeiZOxS2BmHXGh3tLqFJekNye+RmlVsKw
         LvEw8ICHw1JNbwzxgh2eAdNRPk7UXpgVR8ER7AxVSsUVCiaHtG8+Jot3phoOFvjZFlAT
         E/o2vkodsRM92erHzQ/47/IFp4XiwVIILhiO5h9sevUBlzJ86+Q85nzWMQOSQQhFfBEB
         CfqpN9ZRHMWwuHLMQyrS91R2dBo6CqjEHZw2pMRXKW2uz4McICkNHkHE4DMey7Xk01qN
         c3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783303960; x=1783908760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVL4Q3g2uFBrFhtqEHVihrv/zmgdiC+pHWdUndlTmlw=;
        b=oH1IXZDpmpsthIVO0Ufjp/R9pWBvLnCnpdXUs03MKadaHsTC5R+2kHyZ9Jh3E7VRa8
         x+3RvkRTgv2/kE8UOeGWEQ7qUpBPsph5ceOYWm9ESxoxH4CS/asMCmAtZYcE/YZUDth0
         OiXLBJovfjcbU4A7EPb+nn6gkbk/WrVJQWiARLYAsidAuiIMmeloOvlZw7b4mizaEuWQ
         OhGVb8/qRLnLnYUAFYM8Zn/RDdOkeEImHhfeokbvkBNxMB5W1HGYMEqjXO4L0xqfusUy
         XwygC6pIEYzA4pb70uvkeiegLgsXhb4e/VkQUwy5rzz41oxTK4QHBG32Jg0Uu7A95MNK
         xyfw==
X-Forwarded-Encrypted: i=1; AHgh+RqIoIf/RZR8f0csIcjb05mI0wcwUT8J8qA5h2n3bHfmbAkb9wUK49r2jHQGTDabr1/q5bMIdIEruummcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEkiEIUMtIn5sZMkjGD5Y8OlywCxrChOVc2LpjRI3d9MTHP8W6
	kxqdwyVOz/iCj68zshIe88uyyGHpShUHmceRTReevVZUdwgxZMEdQTZw
X-Gm-Gg: AfdE7cn3U2jKWiT+jrDkdP4b2NLMIqUnLWS3RwHVoeISKEXZsHoN2AMYc7bC1S+3vLb
	RepAGcBOWlzRYl3jwI6cq78avD9QdTR7QdjqESu4qSfehZww05QNu+VRuOy7smDdZWFoXdKU2dR
	76Pm1GjvlNQzKRkmAijjJTJACQ2Fx0y1q8kTRZzIUHZbsOT82Xr/XnSQnAU5l/93+HH6+wqViNs
	GtMIRScdT1JrXTKycmVuCWV3tAOr8Avab8StOjSy/EnhfVj8XCxJmUXxWnPqKONj3QttyGBMTa9
	dIahV/20HqD+pXqZunbcLp174OgD5LSVT/aS13twAQUxMMFaRoqzwSjNWEQC6ZxPr+0BglcsagQ
	UJO0uIuLZBXWzwLXei+EFkTFFx5mNvFaAQonI+uTNld2VpiK8gefXSH08HiTu7eZq
X-Received: by 2002:a05:6a00:2d99:b0:847:871a:94ca with SMTP id d2e1a72fcca58-847f6f3d63cmr7231493b3a.41.1783303960374;
        Sun, 05 Jul 2026 19:12:40 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm2835970b3a.31.2026.07.05.19.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:12:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/3] RISC-V: KVM: Reset the SBI extension when disable it
Date: Mon,  6 Jul 2026 10:11:52 +0800
Message-ID: <20260706021154.210289-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706021154.210289-1-inochiama@gmail.com>
References: <20260706021154.210289-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_191241_302938_39308CC7 
X-CRM114-Status: GOOD (  12.42  )
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

The SBI extension validation callback can only fix the parameter if
the extension is enabled. However, if the extension is disabled after
modifty some parameters, the state of the extension is still broken.

Reset the extension when the extenion is disabled so it can have
a clear context.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index b737e9a7a12a..3eb7b7c57059 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -221,6 +221,7 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 {
 	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
 	const struct kvm_riscv_sbi_extension_entry *sext;
+	const struct kvm_vcpu_sbi_extension *ext;
 
 	if (reg_val != 1 && reg_val != 0)
 		return -EINVAL;
@@ -229,6 +230,15 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext || scontext->ext_status[sext->ext_idx] == KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE)
 		return -ENOENT;
 
+	ext = sext->ext_ptr;
+
+	if (!reg_val && scontext->ext_status[sext->ext_idx] == KVM_RISCV_SBI_EXT_STATUS_ENABLED) {
+		if (ext->reset) {
+			ext->reset(vcpu);
+			vcpu->arch.csr_dirty = true;
+		}
+	}
+
 	scontext->ext_status[sext->ext_idx] = (reg_val) ?
 			KVM_RISCV_SBI_EXT_STATUS_ENABLED :
 			KVM_RISCV_SBI_EXT_STATUS_DISABLED;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
