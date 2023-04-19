Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DB5C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8KEAdP8j+OHYJXz7wp4HiSz8Pib/2Q4IQispVDCbpA=; b=rcoGUAu2jXRgsq
	c0U0M4ctKfztB5mhcImnomK3PP4PmOG6FMKDzDOd9cd1z7e9h5sV1ZoI86KCRvexY6E192u0KbYEU
	kXrfOms4XNRjhiEzHugrPS55Nw+KSY4cASciYnnfDR0BYzmCY8zXpIf4Mb2hySui/Nwb+uMZmFMNJ
	1FV7vrOitTiBcw49boYMLNHSaXSnB9teqRsP2w6gwucwM8hkSNY0FZaRG5oVj5uloX9vX32bO50BT
	XAsiIpjrDonoABJuyQaUJOu6u8wUb5ywB2tvU0AUxswF4c0li8zSSA8NlyG72Xqw7gy3dhPCiURcR
	ETp7ZovxxdysRBRw3f0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGw9-006cLP-1G;
	Wed, 19 Apr 2023 23:10:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGw7-006cKh-2A
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 23:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=92JmYNvjI4h3x1v84zDdO04a6NNcBv03E/psDBTJE8A=; b=oLN9j+16qeTREB8Ezpv9iZDTKe
	y1IiIWpPtl4uOk0wJ0pSMPCGFB2fNIcfmalpHS3ZrpvMTjFg+BOf9iOvSwedJ8qSVBSpe9zfSBzOQ
	NMLqwNewm9F21iogFaUFXRkPMGbnRs5uPLmaifsDgZ1SPriFTKPJE56EIYOfIsjup1Gxv8TeqLg/g
	9nB5wIduSfruLuYP4EPh+mVxhoWGSzY9zs3HHh2X737xQYWlhsDBPNlKu/LmQNcoBX3rykxNFh34s
	NUBp1Ss7xUVo29XhHI+Z9Ca6oW4Pfd3scbJAcuNqdD0FOs6pZqvUldBPtrWHq8z8o+nO7Uz4spa1h
	KVu5haEQ==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDt-0021gO-0U
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:26:28 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-517bb01bac9so218156a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943059; x=1684535059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92JmYNvjI4h3x1v84zDdO04a6NNcBv03E/psDBTJE8A=;
        b=nUPF7sXfdzfSW6QquvIfaq4GAfSYyZeAk0mT1xklq8pqmC8JoWNIvCjy+zgsODVUHq
         O1IjPJuK8sxnkfCXOFdrW+u9RpzMDpy7y7UdhAG0oCuYW3dH8GSGsOh9ODDRIxw2eaFz
         bkM34qwDSq7IzfX047RwYqZPP8OQknDg9R1karBknWrofSn/KUs6wUf/rHdpra1bOATf
         rzsEvtKv0XMZjsFArXphtLo3X7lGUkjGEGkW6yljl786vgCvygViLOvHooAc3u8hDTWy
         WbwJ4EH+yr+KTGNMLcFTkEfYKE8eHBN2A40w7EVpD08O7tCunWfP2Fwi90JATCfWffYG
         bUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943059; x=1684535059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92JmYNvjI4h3x1v84zDdO04a6NNcBv03E/psDBTJE8A=;
        b=CXTVLi/LYFaS3mfIrpwcFyah7YgAWjUc5duR7mteYDiu0wkZXpW4HYLEhExNBfNtos
         vT1by08/IKA/uwfsNy+rDzNdrNJzanUswMdJ0gDl8uGdNYEvy2w+CpaWwbJivAOGE5pP
         ROSTFxvXAbYiJKYqUqgs6NzWaiHuaIYUUTIE2/7iJvLP9H6yhlQnSvLzL0ds613jZgxe
         Zj8WnftQj5dq8J8ZBomfZUvXCPHWrfyiWn6rVJKx7eVYzeXTWh3AfsgMvUAjrMESloO5
         P3GJxhRt6Sr82Z9OaSpIgXHSs+Mzu0crg5ob66CErnNfEeV/yAdIwXKxoCvgiDd0hS9l
         SNxg==
X-Gm-Message-State: AAQBX9euHGc3YB3vM351Sllp32WnzHstrZv1vstgheATfzhFh5pFANMU
	YgVRbo6wguNiGERkgDtQF7sDqo8pVIZMYGhNRho=
X-Google-Smtp-Source: AKy350Z85naSstLXZzvY5D57utZL9LkLhfRNOpeuO+9VtZ6rJWlxmJ/TTxgn/rQUXeeW25YB/WTEcw==
X-Received: by 2002:a17:90a:cf81:b0:247:1f35:3314 with SMTP id i1-20020a17090acf8100b002471f353314mr3406729pju.48.1681943059019;
        Wed, 19 Apr 2023 15:24:19 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:18 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
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
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC kvmtool 09/10] riscv: Don't emit MMIO devices for CoVE VM.
Date: Wed, 19 Apr 2023 15:23:49 -0700
Message-Id: <20230419222350.3604274-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_232622_050554_B8F05A34 
X-CRM114-Status: GOOD (  10.57  )
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

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

The CoVE VMs do not support MMIO devices yet. Do not emit
MMIO device nodes for CoVE VMs.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 riscv/fdt.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 07ec336..a7d32b3 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -210,22 +210,25 @@ static int setup_fdt(struct kvm *kvm)
 			       riscv_irqchip_phandle));
 	_FDT(fdt_property(fdt, "ranges", NULL, 0));
 
-	/* Virtio MMIO devices */
-	dev_hdr = device__first_dev(DEVICE_BUS_MMIO);
-	while (dev_hdr) {
-		generate_mmio_fdt_nodes = dev_hdr->data;
-		generate_mmio_fdt_nodes(fdt, dev_hdr,
-					riscv__generate_irq_prop);
-		dev_hdr = device__next_dev(dev_hdr);
-	}
+	/* CoVE VMs do not support MMIO devices yet */
+	if (!kvm->cfg.arch.cove_vm) {
+		/* Virtio MMIO devices */
+		dev_hdr = device__first_dev(DEVICE_BUS_MMIO);
+		while (dev_hdr) {
+			generate_mmio_fdt_nodes = dev_hdr->data;
+			generate_mmio_fdt_nodes(fdt, dev_hdr,
+						riscv__generate_irq_prop);
+			dev_hdr = device__next_dev(dev_hdr);
+		}
 
-	/* IOPORT devices */
-	dev_hdr = device__first_dev(DEVICE_BUS_IOPORT);
-	while (dev_hdr) {
-		generate_mmio_fdt_nodes = dev_hdr->data;
-		generate_mmio_fdt_nodes(fdt, dev_hdr,
-					riscv__generate_irq_prop);
-		dev_hdr = device__next_dev(dev_hdr);
+		/* IOPORT devices */
+		dev_hdr = device__first_dev(DEVICE_BUS_IOPORT);
+		while (dev_hdr) {
+			generate_mmio_fdt_nodes = dev_hdr->data;
+			generate_mmio_fdt_nodes(fdt, dev_hdr,
+						riscv__generate_irq_prop);
+			dev_hdr = device__next_dev(dev_hdr);
+		}
 	}
 
 	/* PCI host controller */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
