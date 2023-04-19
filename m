Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373BDC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1gzQU5rxAKlRJDCOvql9fkzWRlB45PsE9AVwxOd6Lw=; b=S2DNx4A3Nb5c/2
	tck7coU8xmvn1prPckmWkV8Q1acy3rES0Sv9U2qIUX6OfYiXqpXqNFylcMTmgP4CClQz5YXPa6uDX
	gD84HfjRwu37aB5waoUlTngmSC/uR0x8J8HJVmkIbQNE1V/hUx8XByE8FIXY/p5FvDZeUp0tem0v0
	9G6EoKfQYH87w4V9PVD4WaPSXt7vm0fvAk2RXiYja0qQ+P7nn+7wyQZpW+QOYD33Ev2P0lRw8W0uJ
	SoX4pldhV0oFiXbRxGhjwPZ5Nc9tIJtwhZyKsbGKkiMBshACqOrz3Z/kUZe8WymtdYdJNfnpcMr8Z
	pjd/rCDLWhRo9wLwGqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGxo-006cbP-3B;
	Wed, 19 Apr 2023 23:11:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGxo-006cbC-03
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 23:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=E81F/sZHqFlmC4PTTDxmyvFtDAnkdcxCBJVjUmPx/Qw=; b=dg2TufElZVDJDZRFhwcm+mvjE3
	ZjubXSt0F1dOLINhEW2aLAULeeiOA5G3sYZ9qF31AFrKf9j0C8h8uOb5B0ElRZaUwFJWkEYtJ/iE8
	L8wCwBH2//E3mk3Px3beeomtnIIJhX0a75w6v8CPQI3oevNlFBI+LA0vBW95JfQ/kG+SOilefCyB8
	3F8NwWdsk0yBAvbADh2/QT6jBb2yELnuEpWYmn17/6LeFHM8Qq7evmHsvCq2jLOA98ier8FKSBg+m
	bP/ZwirBUijI/mhOhzPCBT6aP+wORUl6zuu6MudxJD6SaHA6/iYPSU5T2b5sI0YdeE2AIgE0J3tod
	ZhznK0xQ==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDn-0021gF-2u
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:26:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1a6f0d8cdfeso4530635ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943052; x=1684535052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E81F/sZHqFlmC4PTTDxmyvFtDAnkdcxCBJVjUmPx/Qw=;
        b=h8qvhmk4lDaY4kQIaAqeKrnT156suhglOdhOFhlubu1kF8monJSVNUgUE+j1dG31u3
         2u4SpVYqZ4tfegebKpsL38KKycJWXvEDDTgK8UNr6JRmWeQLZM10VY51+CKxQiNgddvl
         jVlFZj35wrKDUORGT0J+qOCCKpjlGHzbKe/sGfoeSgQinTk47q9jptfvuPOOM2rG+CYr
         zwGu3oFCrdRFjF7E7+wb2JbG1bH3s5tlAZXNHsT/M1j9N2DMFEV+pbXVFPMwgsNs8Fq+
         +9F3bZPSaGt+4fI+77DT77iqb04ZT/uOhlexxfDhgZPl/024tDlCe5TFxeig37XFSsp8
         WtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943052; x=1684535052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E81F/sZHqFlmC4PTTDxmyvFtDAnkdcxCBJVjUmPx/Qw=;
        b=h7aM4T6RQNZT9+/JxnciPNoXOLA5aMiHwDuqcPIlPjwjTxNBU92drWRzI53S5QuSYf
         9YaaUUJ7McfWvdkG9PxN39xw6vShTHrDUUm0qWDuhoNpehDAA20YdCH0INCZFZhrEAEM
         vSOvjj0OdNrGi3MGGzOBZiqVvy4lF+7v3yUGEG2QYjDMPUtq5s5iHrRmI9LhgYPXyhNj
         1eLDqjntFtEmMVo8Bn/jqyF74mN0x0UqtMAG/ehKNh4EnPsJGqghjYTS4P3XZfgb1rr6
         +wJsz6Pb1jxUVXk5w+4TpybZFb91Bz5mRmcoWcB8407WOAb5bv90dAohPBT3YcvMjDqd
         IHhA==
X-Gm-Message-State: AAQBX9fhkyWL9RaYaDwJf7wkF3xaP1upusUjyWa4nr+iPM07LnypxvJo
	6BM5lVF0wTNeeQfwgJjB4wdXLg==
X-Google-Smtp-Source: AKy350ZDizFV7lhpli0WrCYYrT6iDsFp55kYpsDPb3wO0+TsDTvsM5wAJ/jQ030A1Tz0V9swMbp+9w==
X-Received: by 2002:a17:902:da8a:b0:1a6:97fd:29e7 with SMTP id j10-20020a170902da8a00b001a697fd29e7mr8449012plx.27.1681943051998;
        Wed, 19 Apr 2023 15:24:11 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:11 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
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
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC kvmtool 05/10] riscv: Do not create APLIC for TVMs
Date: Wed, 19 Apr 2023 15:23:45 -0700
Message-Id: <20230419222350.3604274-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_232618_942331_C99F6C34 
X-CRM114-Status: GOOD (  12.20  )
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

The CoVE VMs do not support wired interrupts. Thus no need of APLIC at
this point.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/aia.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/riscv/aia.c b/riscv/aia.c
index 8c85b3f..a3b8618 100644
--- a/riscv/aia.c
+++ b/riscv/aia.c
@@ -143,6 +143,11 @@ static int aia__init(struct kvm *kvm)
 		.attr	= KVM_DEV_RISCV_AIA_CTRL_INIT,
 	};
 
+
+	/* CoVE VM only supports hardware with physical guest interrupt file */
+	if (kvm->cfg.arch.cove_vm)
+		aia_mode = KVM_DEV_RISCV_AIA_MODE_HWACCEL;
+
 	/* Setup global device attribute variables */
 	aia_mode_attr.addr = (u64)(unsigned long)&aia_mode;
 	aia_nr_ids_attr.addr = (u64)(unsigned long)&aia_nr_ids;
@@ -160,10 +165,7 @@ static int aia__init(struct kvm *kvm)
 	ret = ioctl(aia_fd, KVM_GET_DEVICE_ATTR, &aia_nr_ids_attr);
 	if (ret)
 		return ret;
-	aia_nr_sources = irq__get_nr_allocated_lines();
-	ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_nr_sources_attr);
-	if (ret)
-		return ret;
+
 	aia_hart_bits = fls_long(kvm->nrcpus);
 	ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_hart_bits_attr);
 	if (ret)
@@ -172,12 +174,21 @@ static int aia__init(struct kvm *kvm)
 	/* Save number of HARTs for FDT generation */
 	aia_nr_harts = kvm->nrcpus;
 
-	/* Set AIA device addresses */
-	aia_addr = AIA_APLIC_ADDR(aia_nr_harts);
-	aia_addr_attr.attr = KVM_DEV_RISCV_AIA_ADDR_APLIC;
-	ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_addr_attr);
-	if (ret)
-		return ret;
+	/* CoVE VMs do not support APLIC yet */
+	if (!kvm->cfg.arch.cove_vm) {
+		aia_nr_sources = irq__get_nr_allocated_lines();
+		ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_nr_sources_attr);
+		if (ret)
+			return ret;
+
+		/* Set AIA device addresses */
+		aia_addr = AIA_APLIC_ADDR(aia_nr_harts);
+		aia_addr_attr.attr = KVM_DEV_RISCV_AIA_ADDR_APLIC;
+		ret = ioctl(aia_fd, KVM_SET_DEVICE_ATTR, &aia_addr_attr);
+		if (ret)
+			return ret;
+	}
+
 	for (i = 0; i < kvm->nrcpus; i++) {
 		aia_addr = AIA_IMSIC_ADDR(i);
 		aia_addr_attr.attr = KVM_DEV_RISCV_AIA_ADDR_IMSIC(i);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
