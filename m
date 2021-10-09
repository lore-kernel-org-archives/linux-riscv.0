Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB62C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:44:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E809D60C51
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E809D60C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6r5tKsbL4TQkUQiEHyuBms4xwRrjeSt3soEBzze0d4=; b=ZXpbiFZZGrwwXE
	QDoiSiq7I/3LIlFbJH7re62ILluFoHeyxsNelsQduUWAzud7nx9HEmggGVp2mqB4v/HoEXEypQ/4r
	70toBNCWGQMsvtMbSEkxxrxvhabfviDhzrUr1jA+q1ctKvN/nGD2nClQhz+BSOmD2UOtt9ERxHkQ5
	n3zCXYsyk6YGRmdOhiBUu7M68JPu9BZvv+T6SEPtYdo1vyV3g+7xyBWUlk16wNsAEOFEpHgv17yNP
	TtX8akqYmGsQ2TTuupmnjbcSGPt5iXxfc0782h7bqpfED9KVUSMfK0LYaDr6K8yOm4ASe0Sl7AmBU
	RGfmwo56rhPUzdrfz+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2Kz-004giD-6T; Sat, 09 Oct 2021 02:43:49 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1s5-004UVk-G5
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:59 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 s6-20020a254506000000b005b6b6434cd6so14972090yba.9
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=BSxRZmRXQvTOhREE9VGZ+Ow0Eb/sKeyruI9O693O544=;
 b=Nq6mAzMn8lDyB3Y76plThgBUM5+lzQFzvcnH6nf4492bBrVyn9ck7GKbYqiO0fPX1k
 RtO6Tbh+fVA8kKKB5dfSn40puADaw1AZTWHfUhXRqDCPxkpaLN/jW7P8wDCNf5O+ZN2W
 o20t3D7+BvjahIP2EWoNGDpuq75LRMnoeyo+2e07rHfheQBVKmrV3GR1iNU5W+dWkxdx
 q3sbYxMcvibv82b/Gn150GZhBkJ6/ximka4nAWWizGZ/RcYQl+xqLlKkBDXDFmHazy20
 mn7+XEIvuuwdQeI+uMO7ytk/Gxh9aFkTHmGL9NUGs5Tnak8RvnSPI5FeOcxYuto9C6rq
 7/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=BSxRZmRXQvTOhREE9VGZ+Ow0Eb/sKeyruI9O693O544=;
 b=mUdLb5VieuewSupCwEz93piCjUfbcKMoHFy7MO5wG46W/xPNj9WmDFwn49VDkLCi0K
 j1jet/Y7mwGQz8SCrkQXwKwRm9xFr4axs3ELI8Q1mIDwVRLLQm62MqzKqfOLq70ZaHc6
 J6swGx3bBtE39EYSzzoOcOHnPz516Q40FmX9ZTe9D0LLaXoTCDCdA4a2ehCttkY9SYvD
 hnAXcgKW1UHSu3LouWB8wPRkzD5RG0rYj8VIQ9UEspndc+QtONZ/ay0GfoGStH8wPi09
 D5MvKRcZai2ilR2+NPhwQkOYo2WZp1Yytw9VT29rb3izHVCx3524Y2VpGpA9bO1PdPpB
 D38A==
X-Gm-Message-State: AOAM530ZIO9FSGlnoHncFrdzyB4Pftk70FuURGXt+oLszej7y0cV17f8
 9K5Xs9Bxw8gJ64mF7kYbpB2YbVBKOUw=
X-Google-Smtp-Source: ABdhPJwWmIgGATZaEFLCpRZX3pSkHkB9RK0xc5KzmBhnfa/imJ82wP/Pf1l0pMZYT2dHdA6zyBMoRuy25Io=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:5402:: with SMTP id
 i2mr7429080ybb.312.1633745635912; 
 Fri, 08 Oct 2021 19:13:55 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:23 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-31-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 30/43] KVM: Drop unused kvm_vcpu.pre_pcpu field
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
 Oliver Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_191357_577693_3EAE0A38 
X-CRM114-Status: UNSURE (   8.49  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Remove kvm_vcpu.pre_pcpu as it no longer has any users.  No functional
change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 1 -
 virt/kvm/kvm_main.c      | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 1fa38dc00b87..87996b22e681 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -304,7 +304,6 @@ struct kvm_vcpu {
 	u64 requests;
 	unsigned long guest_debug;
 
-	int pre_pcpu;
 	struct list_head blocked_vcpu_list;
 
 	struct mutex mutex;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index c870cae7e776..2bbf5c9d410f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -426,7 +426,6 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 #endif
 	kvm_async_pf_vcpu_init(vcpu);
 
-	vcpu->pre_pcpu = -1;
 	INIT_LIST_HEAD(&vcpu->blocked_vcpu_list);
 
 	kvm_vcpu_set_in_spin_loop(vcpu, false);
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
