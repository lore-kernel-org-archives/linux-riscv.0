Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76150C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZklIoBE+g1DOzmpDd4VP+5VmBEsfbMY7o8lPh7gYoUU=; b=GpVJjAi/KrCh+k
	jBMvVTC2ZXr4EOmqmoPKs2L5QBz/LAgHfRF9aZOsKX1VpbIRYIt5fBpeoyNMP4qImvjp13/GoDCD2
	6z6lg4/cEzwb3iPQpTCRCYU6yhUilqjfoXpNGZztDHuyayjdXzOvETVrdwbF3kSf1QadNU07BtIFP
	9++n3OYbBKzjJsQt2N+6OGI/dgXAMTIK1WvvuEW8Vsn7hGn0Z+dc/H3g7zIj8tY+z7Sy8Jkyi+clw
	PDEIvG7ABydqFRu/AwFSLVmpT+FG49YkkAO7RxHCZHpr4lhYTw/K26a2EbX/n6E8y6Fg5KZEVw9Ur
	h7ls1AqDMx7M+XywSlQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGrh-006bp2-1C;
	Wed, 19 Apr 2023 23:05:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGrg-006boS-0P
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 23:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iv3jO/UplLaGK+gTx4v9j9xexh60oYjru3uhX3LfGtA=; b=dIdaC7GG/0BZjgqx7ZDjq1teF0
	TnAvA8zD57TnoDj0deXjCbJUhCFPO//2HIZ7DQ+Wl4VbBI7P9UiUQMpQrNlytI++2d9gxZv8DlJqb
	hhvYxMrBuarNvK9knSPRlFOhiCVe35MJRuc3H3OwgVd5L+GIKIoJPACPSRnlQOndPddGWA0bBB7hv
	51KvkbkDh06mXas3siZvifQcJMbB0ZR8glMRfRn7ct9vlkS1tSauM4saAXgYpTak6ikmyXijMkxFU
	UxVuWxcMUEgUMfoy7+qNU7yQxP1woanqyFEl+93mspiVR0gCk9W/cUuaTp9OAZLXKymbOrqBzVIM5
	LS7ekTxQ==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDr-0021gN-1L
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:26:30 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1a920d4842bso4275955ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943057; x=1684535057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iv3jO/UplLaGK+gTx4v9j9xexh60oYjru3uhX3LfGtA=;
        b=KlF0beSBSA6VLstvFDlAYMs9lpg8gvRR8zucHEopsyriEw6o1h2sLsqbVwcFiW8cZ2
         ykz4DGeTyhjIF7TUhCvkjoQIqDlNYfhLHbuIW6A6Nze2qZg8Mjs4XhacrR2YEsP5YvVC
         RlKM3D/qrtizTZ3hrz+4hH+4HBcHwt4wDVgzIrtDMMjRIhDdPS70B4ffIp/QcNwVpgLh
         l3tvN+FDLmm6WxBLSXFEB5UUmHWn5q2p7Y1BPq6qQBjKBoxl/p2sw2H5TvKzZwP4jWXj
         /BG7zkngU3fOCCHkdBXlJJfXlhrBn1uWDICB+9I2KRJvOa60PVK4lOGzawO9HJcdv8/2
         2Ciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943057; x=1684535057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iv3jO/UplLaGK+gTx4v9j9xexh60oYjru3uhX3LfGtA=;
        b=HnG69vtJJaxG204uQJ34qy1xxYKgzWQfTwEgrC4dyjqGPULd13WvvxmWeWnuXVOx/s
         nSNdXAh530pPlVkqRG/dLsz+kSfsfJplht+nKSI3mpejpI7yHCRN49tW7A+51EprROU7
         rRDpDkOxYKo7VqLZ/To2PGHIn22ydjoifgqLK0vs0jAkBrs866amDmRL4oA/LMkPJ0Ny
         vhINHLvA5JUO9/6ya8JAtxGGkUA/4SM12sFXcPO459hpO7AMX0Wn8yp8gNld+L8nCIRD
         /6gq4I/DnuN9V+OQ2ZmdGjpJ4Kw8asPIpTn4IPfMp0rJB+Akc2dz8q/WooAazJdMyGKy
         fzKg==
X-Gm-Message-State: AAQBX9djzJKtN6hNzoY0+U9KpGwCEnOV8A2NEpBFLovGtNG7YWNfuzbM
	ZbWCBvWmfZ8GjMBRViGCiJIBRQ==
X-Google-Smtp-Source: AKy350YmjLuFNHpdbGKVUxtLnNGDTOqZujizSNNxdVNVjL7P36ZiZ6Z6Phv1PaiPaoxLg0i7OBeTQw==
X-Received: by 2002:a17:902:d505:b0:19d:778:ff5 with SMTP id b5-20020a170902d50500b0019d07780ff5mr7467330plg.15.1681943057246;
        Wed, 19 Apr 2023 15:24:17 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:17 -0700 (PDT)
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
Subject: [RFC kvmtool 08/10] riscv: virtio: Enforce VIRTIO_F_ACCESS_PLATFORM feature flag.
Date: Wed, 19 Apr 2023 15:23:48 -0700
Message-Id: <20230419222350.3604274-9-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_232622_234917_B8E700BC 
X-CRM114-Status: GOOD (  14.57  )
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

VIRTIO_F_ACCESS_PLATFORM feature tells the guest that device will
be using DMA for transfers. This forces the guest to use DMA API
to allow the host to successfully access guest memory as needed.

This is needed for CoVE VMs.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 riscv/kvm.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/riscv/kvm.c b/riscv/kvm.c
index e728790..aebb6bd 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -7,6 +7,7 @@
 #include <linux/kernel.h>
 #include <linux/kvm.h>
 #include <linux/sizes.h>
+#include <linux/virtio_config.h>
 
 struct kvm_ext kvm_req_ext[] = {
 	{ DEFINE_KVM_EXT(KVM_CAP_ONE_REG) },
@@ -224,5 +225,14 @@ int kvm__arch_setup_firmware(struct kvm *kvm)
 
 u64 kvm__arch_get_virtio_host_features(struct kvm *kvm)
 {
-	return 0;
+	u64 features = 0;
+
+	/* CoVE VMs mandate VIRTIO_F_ACCESS_PLATFORM feature to force use of
+	 * SWIOTLB bounce buffers through DMA API. Without this device probe
+	 * will fail for CoVE VMs.
+	 */
+	if (kvm->cfg.arch.cove_vm)
+		features |= (1ULL << VIRTIO_F_ACCESS_PLATFORM);
+
+	return features;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
