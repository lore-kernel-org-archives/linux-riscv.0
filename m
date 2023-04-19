Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695EDC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGkJAXY+5f7sf3taYd1/tUxQFQTC42a9UWz2d1X3MKY=; b=OEp6Ey4bH0W4ye
	DIXhZ/sU9D30EkpX0P2JWELKAlMUfz0qbBHhAOFn8Hjstx2iFIX+t2xrXqKkFMKWkGNihPMvx9Fpf
	1Zuk6qkaXf/L0ltghcgewY4QdsVxvZRgeAqLhbDGoYfXZxzFbm1Sw9CenWS2l+r2wvrPO0FlbIu3C
	OuMOg3yffgUXosMIv1Ejrx34lSu6tOFW6nqo+biWnqGv0ny1CrOfn+LWrOu9pgeM4ec/Iw9UJgcMd
	TRsyiGGuL+2Z7CvG1bOjzsaIJAN6Qp83XuOGxnhMef1eHmm5zJe37xa1Jiz3AB0rzKvjJQ1FQqmQ/
	LkEUHlg3bRRVnnQLfwGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHG5-006eUW-30;
	Wed, 19 Apr 2023 23:30:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG7X-006Svq-32
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:17:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a526aa3dd5so5173815ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942667; x=1684534667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xru1T6bsi1+3ZKp8XjmLeeEUO6sc9QurHQCwhhM84HA=;
        b=fB9b4YMtcQOYrcKj9/GWzeONjcxKP2oeywQTvv9jgtHPhKMG6piGSirEiNQPiRUSw/
         TNDD98EsCQRHJb8o4KR/40iwkDz2iCL9O1Q5D4OApUqfzyyueF2pWWXu9oUBTr1sBd7r
         qN8+st+530NNWaQglZ+vx32ZFpdd6jtoI22iSuSF0a+tcpVy60XJq7vb5hms8XM51miU
         EUekIXnr0Cbflr87WbR+EkVxvu0imyYB9o1bwvrkRw5vQJ9T+Gvh04UNMDx3e/rdtmef
         Rhm+A3oBDjRklFUpsePBjaVMWeVQWCFlRT5JvPLYOIPW/X1HEUctXf38yhKlTJ/Aw1FH
         TvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942667; x=1684534667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xru1T6bsi1+3ZKp8XjmLeeEUO6sc9QurHQCwhhM84HA=;
        b=T/h0Wl4ULgTrEQkMp2i0eTQk3uk1NR0G658JHbf8Lt746cwPxytu3u55nZoyTGPMKB
         U4OpVZtJVsPpDYXsWm3RZ2Vr0VCM3ztvn7fbtqte4eudb6cnQY9IuNfzTIsYgE7dy4uB
         UTdytJ9xcDeLJMUWB7Y8wieSK6nv6CKqWQNosCHg4n78deixi5OqJ+/avhw6hC+lm88t
         l9oZS7Rede13JtNNDRKJJC4BSDIiFtc/fmocN7jklX8oB0Gw1tGfZN0ycEzvuNVuoLMs
         CocDuEjc829mK+EIZdJR8Wo8H3bu0t8pYuk6FgHDn9g3PePCJvpGMoPwBbratDQsrJX5
         hiIw==
X-Gm-Message-State: AAQBX9coBgH9sIwdQna3POhSB9R7At4vXh9VhxirEXwG8CRQg3oLF11u
	gMzk1b0rMsp93JPYIeb2IBc+Ww==
X-Google-Smtp-Source: AKy350Ze6w+VITNJKc37wiOWND61z06Oiijk/jlDr4gywczSxyZvsezIoz1E2Y/uHqG7LrTSWYdlBg==
X-Received: by 2002:a17:902:f682:b0:1a1:f5dd:2dce with SMTP id l2-20020a170902f68200b001a1f5dd2dcemr8068605plg.6.1681942667389;
        Wed, 19 Apr 2023 15:17:47 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:47 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 08/48] RISC-V: KVM: Add UABI to support static memory region attestation
Date: Wed, 19 Apr 2023 15:16:36 -0700
Message-Id: <20230419221716.3603068-9-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151747_979928_9242FD7B 
X-CRM114-Status: GOOD (  15.48  )
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

To initialize a TVM, a TSM must ensure that all the static memory regions
that contain the device tree, the kernel image or initrd for the TVM
attested. Some of these information is not usually present with the host
and only VMM is aware of these.

Introduce an new ioctl which is part of the uABI to support this.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 12 ++++++++++++
 include/uapi/linux/kvm.h          |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 11440df..ac3def0 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -98,6 +98,18 @@ struct kvm_riscv_timer {
 	__u64 state;
 };
 
+/* Memory region details of a CoVE guest that is measured at boot time */
+struct kvm_riscv_cove_measure_region {
+	/* Address of the user space where the VM code/data resides */
+	unsigned long userspace_addr;
+
+	/* The guest physical address where VM code/data should be mapped */
+	unsigned long gpa;
+
+	/* Size of the region */
+	unsigned long size;
+};
+
 /*
  * ISA extension IDs specific to KVM. This is not the same as the host ISA
  * extension IDs as that is internal to the host and should not be exposed
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index a55a6a5..84a73b5 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1552,6 +1552,8 @@ struct kvm_s390_ucas_mapping {
 #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
 #define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
 
+#define KVM_RISCV_COVE_MEASURE_REGION  _IOR(KVMIO, 0xb5, struct kvm_riscv_cove_measure_region)
+
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
