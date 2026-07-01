Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3000C43602
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 04:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25JTTcnTuU6CKiSphmVL5WIfUB7P3gXHOozxyBjvX/0=; b=BtTMuoXrNhiwTK
	rhmh6l8Z1t64Od27cAuURaDLXC28qgmsohwx4V2cJxQ8KCqvrn9JRSXoBqwYFiTwXygi5mo3Gor17
	Qj+pGEyV+/jFU+sT521T4gMgy89IYPPXExiGPXPwNdPc4rIVn4sbCTD4N2X0VJy7U0GwuDIwTaPSx
	i4C34rsiaCysNKBnuwaxahqMBZky9kRw2z9NMp8mEqgXgFHcFc49uvy5WKqAfMdfk1x+TOzZKwtrB
	k/t2W9eJxzhRfwlYyVXOzxhEsLpzHZqy0kTIO7RIi9pBKX0xBpNkPnR+09/s6cmKHFtcVJJCVgGny
	cRJCVlOCOXiWkhmKTLcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wem8R-00000000brF-1hH5;
	Wed, 01 Jul 2026 04:01:15 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wem8O-00000000bq1-1tdx
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 04:01:13 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-30c944aacbaso378706eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 21:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782878472; x=1783483272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWN7NBari0i1/8aoHDWNlUmTk2Z27L997IJ1yNwTiBc=;
        b=lBhdz5qH1gRddyp0js/A4UCN57NL9JTkT40H8YualG3VR9OpkprNHx/+L28GtTgPjJ
         h2BjTegRovBQcqqKAgwebykNN8j4TeYtUkCe3yCKtWFxmxAEtcTaolKu4ED+W3heXua0
         RkeIlrEZaqZrHiliwtzfi0bDk3udlry3QnFCeWdYAhNyTmPjlrgdDWadUe8bQMaUXSmT
         dBIo4axRoF3Tjw2zt8HmgDxdX2jM9B4tRV7vWICr/wt/36Kkf9CWXb8aoq/XdZ5Gv0CT
         XpT7xeBz1FHIUVWRy6eEIhcnEF69lAwA2wAEhTnZTeJDEwwbvEFRg5Rlqzl0RWoWsSCA
         NG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782878472; x=1783483272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HWN7NBari0i1/8aoHDWNlUmTk2Z27L997IJ1yNwTiBc=;
        b=eV8mW2uXIAdfzy3g4u/Xst13fPl8fVh0vDOoV7R9B5Z7zI+5pbhuwNRWmlgiTf3TlM
         gTPaGZE6kmaHhMjkkPL5TfPXjEND2/U1iDJ1CExuzi5jc//2teSqd5oTWY/exJiy58zi
         DcxPVug6l6naeY1g8Msrmd9TyqPVFYv6x3IEI3ehF9i0Ox7xD6xOnNoDPEeyGnAIFTeQ
         fac0ft3W/3J55ZgMsU69bQt0/KrXBP802fGalOIgtzS8LOpU1f22F/7V4yK+pVfP45YO
         n3ZC60DlNYoi2nGEKL4hZaxtHTTPf9uY3hW7kKSaexvALeKHF37xjxuJ4qhetrdXqsOY
         itNA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/NhPh2NKeKxV1Ij9saG90VMCJhdCvfc03Vzwg2Hs+z3KOKJvK9DfghsBw8bhvf6J4vruie5WBPqteCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2TWt3CsihwbeiUOv/NKQPQo0CMJEIjDOqTbbcE4j8nEQWQ8EG
	Vs71jRl7rHbJqDyk/Ophf2CCWn4xvvhQdMsz5TO6yHn+qsFOnYQa8arIt2mIdttbHos=
X-Gm-Gg: AfdE7cnWzZrXv064k6sbzyE06Ju5xLg1Nk3QfI7G77R1HhfisCk+jQ7jM7b0HM9IFe+
	6qnSzfLCkFjTTcFicOm2ahV893A0Ws6qkDWQd6kwdHGgaypVVen+N1EuEmL2T8J/Xx8d3W7fLl0
	Zsun9cm+mm58lUCKuN3dylc8jJaZ2sdhxR+Nba3u4ipTnoTjQuISxEu2AUfaVlX5Lqdb23PlwFH
	nABi6MqZKxx8J4327PTChoNeowxXMVpPEdUqFuBHIXwS+aK1v04OS4BPYIRwuW8iOJKA6FNaTGr
	JcsbkLKlKR1tlekDPuCiwJaxHHJ7yS83lFn46fO7yn53s0vzBd68CTG11cA3X+hpipuFLd55ZqX
	JFL1RdHqpyJ/JQS27ALXxMvgIoZvajM7tIkTW3lwbxzQE3MSnQ6N8EcVbJbeXV+Sr3XRKCAHDwW
	b3md8yOw8ejHbC+SUp5BLSl8BnFxYudpNgWfK85NIGe8XPgsUT+9lf4sJx8KBwKL2bEkOWhsyIk
	ss=
X-Received: by 2002:a05:7301:2a04:b0:30c:52c5:6e3f with SMTP id 5a478bee46e88-30eff0b4e80mr8435eec.18.1782878471619;
        Tue, 30 Jun 2026 21:01:11 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee32519aesm14024287eec.27.2026.06.30.21.01.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 30 Jun 2026 21:01:11 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [RFC PATCH 2/3] KVM: Move irqfd arch data into route snapshots
Date: Wed,  1 Jul 2026 12:00:15 +0800
Message-ID: <20260701040017.42707-3-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260701040017.42707-1-zhangzhanpeng.jasper@bytedance.com>
References: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
 <20260701040017.42707-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_210112_788921_8A321022 
X-CRM114-Status: GOOD (  16.49  )
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

irqfd wakeup takes a seqcount-protected copy of irqfd->irq_entry before
injecting an interrupt.  Architectures that need to classify an injection
by its irqfd producer need any derived arch state to be part of that same
snapshot.

The irqfd object had per-irqfd arch side state, but that state describes
the current producer, not the specific route snapshot used for an
in-flight injection.  Keeping the metadata there can race with route
updates and teardown: the inatomic injection path may observe a new route
with old arch metadata, or old arch metadata after the route has already
been invalidated.

Add optional arch-owned irqfd metadata to struct
kvm_kernel_irq_routing_entry and initialize it whenever KVM refreshes or
clears an irqfd route.  Remove the old per-irqfd arch side-state fields
so the route snapshot is the only place carrying this producer
provenance.  Userspace MSI injection uses a zero-initialized temporary
route, so it is never reported as irqfd-originated.

This provides the sequencing needed by RISC-V AIA to distinguish MRIF
notice MSI delivery from normal MSI injection without consulting mutable
irqfd state outside irq_entry_sc.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 include/linux/kvm_host.h  | 7 +++++++
 include/linux/kvm_irqfd.h | 4 ----
 virt/kvm/eventfd.c        | 5 +++++
 virt/kvm/irqchip.c        | 4 +++-
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5bd76cf394fa..254f8fd132cc 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -685,6 +685,13 @@ struct kvm_kernel_irq_routing_entry {
 		struct kvm_hv_sint hv_sint;
 		struct kvm_xen_evtchn xen_evtchn;
 	};
+	/*
+	 * Optional arch-owned irqfd metadata.  It is updated under
+	 * irq_entry_sc together with the route so irqfd_wakeup() observes a
+	 * single consistent snapshot.
+	 */
+	struct kvm_vcpu *irqfd_arch_vcpu;
+	void *irqfd_arch_data;
 	struct hlist_node link;
 };
 
diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
index ef8c134ded8a..44fd2a20b09e 100644
--- a/include/linux/kvm_irqfd.h
+++ b/include/linux/kvm_irqfd.h
@@ -58,10 +58,6 @@ struct kvm_kernel_irqfd {
 	struct work_struct shutdown;
 	struct irq_bypass_consumer consumer;
 	struct irq_bypass_producer *producer;
-
-	struct kvm_vcpu *irq_bypass_vcpu;
-	struct list_head vcpu_list;
-	void *irq_bypass_data;
 };
 
 #endif /* __LINUX_KVM_IRQFD_H */
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index a7794ffdb976..399ef2bdce5d 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -273,6 +273,9 @@ static void irqfd_update(struct kvm *kvm, struct kvm_kernel_irqfd *irqfd)
 	else
 		irqfd->irq_entry.type = 0;
 
+	irqfd->irq_entry.irqfd_arch_vcpu = NULL;
+	irqfd->irq_entry.irqfd_arch_data = NULL;
+
 	write_seqcount_end(&irqfd->irq_entry_sc);
 }
 
@@ -594,6 +597,8 @@ kvm_irqfd_deassign(struct kvm *kvm, struct kvm_irqfd *args)
 			 */
 			write_seqcount_begin(&irqfd->irq_entry_sc);
 			irqfd->irq_entry.type = 0;
+			irqfd->irq_entry.irqfd_arch_vcpu = NULL;
+			irqfd->irq_entry.irqfd_arch_data = NULL;
 			write_seqcount_end(&irqfd->irq_entry_sc);
 			irqfd_deactivate(irqfd);
 		}
diff --git a/virt/kvm/irqchip.c b/virt/kvm/irqchip.c
index 6ccabfd32287..b163f7ed3c1e 100644
--- a/virt/kvm/irqchip.c
+++ b/virt/kvm/irqchip.c
@@ -47,7 +47,7 @@ int kvm_irq_map_chip_pin(struct kvm *kvm, unsigned irqchip, unsigned pin)
 
 int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi)
 {
-	struct kvm_kernel_irq_routing_entry route;
+	struct kvm_kernel_irq_routing_entry route = {};
 
 	if (!kvm_arch_irqchip_in_kernel(kvm) || (msi->flags & ~KVM_MSI_VALID_DEVID))
 		return -EINVAL;
@@ -145,6 +145,8 @@ static int setup_routing_entry(struct kvm *kvm,
 
 	e->gsi = gsi;
 	e->type = ue->type;
+	e->irqfd_arch_vcpu = NULL;
+	e->irqfd_arch_data = NULL;
 	r = kvm_set_routing_entry(kvm, e, ue);
 	if (r)
 		return r;
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
