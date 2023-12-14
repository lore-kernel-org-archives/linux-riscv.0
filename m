Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A966C4167D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7c7uB79YdUGJMtMK12DujHGm7sN5qSb2DyLmJUGSCkM=; b=VH+R2uSq7vMhOH
	RB/keLtOILUwHuXhZc58sQdZuHFAWoZVlCn0ARsp5Xu2tGtThM/Vs/WWh+s6JjGaGz5vQLVGVj2P4
	BKPBi0pFLuXIxbT9Op+Qi09yQty9RvGtWkvptTALKdXEwy0z2CNhTz+KgRP+72v2aU0B/52sBQbTX
	rL5OxjlinR2G0l5SGx43UW7O6E0gCkeNXOhnN2X98e77NLhLzf4Lpgvu1MIZQ4ZebTy/vGESTJXEW
	zKJesZ9qgYigOKJmoVGYzd9yvTOtlVLBzLBDgMak2K/bm+YxTMSqXebx7hHcpGvqlt0nrk17CTx+G
	a/f54mT3sGHRxvBZNidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDilZ-00HRoH-1f;
	Thu, 14 Dec 2023 10:16:29 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDilG-00HRSg-3B
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 10:16:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3333074512bso225292f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 02:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702548969; x=1703153769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpfMMaVnqzUKTZ+jKcmqIbb/qIkXcAgoT0iTzjOxQ48=;
        b=VNt2mgHiw3hDWArPu5PiPXpdzuExNna1Cay4bpsgGZxE5/o1Nt/pQqx21jktcrU60d
         U7tTBQ5gG4SVXNlcEjUWaXWNp41a7r7U2c2GtsWky9FoCkLKmVt0u0PhVOagIHeiTS5R
         Jtz7u75KduRhx5syhf/PcT8XwC7FgKZyKOKoEzOOJe6SDJWqxU8u8P58tj8J1SbLFaqt
         FX9qnh+xkMJljvABUoPehf0IUQXX5OwhsXHfuN43o03jqEf71P0fHk0+N/8ryZJGfgRq
         eCVtvrSGs1CyTCZO9gH41TU7WuUckcdrut4r4ARSBb91Do83XSP0C0zQlvfy3qkhpD75
         aFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548969; x=1703153769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpfMMaVnqzUKTZ+jKcmqIbb/qIkXcAgoT0iTzjOxQ48=;
        b=N5CndTy/E4aQIBRK8s1SWfxZwdHeIU5bkqjKK+TEQ3Lmy/1x6KkNI3m9Kfvk292Vkz
         uFXT5oxQenRWcmpxBHcxkbN1lNnQSqc8aAISJG1aJnqOHbgaXelBTTJJ6wEvhf1QLNl2
         VqrF41wrdX0lU0yJ1BEZ27TvSC41okt1B6WBOLZ39yudnC4GT+fSL1Azg8CExkge0ZTX
         IXOG9EL+xck5KyBcYZSlbNoF0XsEaDmeyjOdtxp/syDc8/k3L9S1JMQTUPA6XiA9tdJd
         I0LteXrIghGNd1Z3gcpkI6UVso3Vw8Uam9uhV45r7GU43tWtP/gYLole5QG3MlUrouWf
         31OA==
X-Gm-Message-State: AOJu0YxmrvEbJrOJ7uVB046ceqBnRBXMylIa/+A84LaNoOLKml0qoMYG
	prx0FY+A47Y9qy8JrcTuQavvEA==
X-Google-Smtp-Source: AGHT+IH8xl+ijX8dy/fYqdeXj3sDdM1Fx/56Gx0qIx0bsNCFGogCneF0tpSFuyBW40lufrw2yTA12w==
X-Received: by 2002:a05:600c:4511:b0:40c:2d0c:a3ca with SMTP id t17-20020a05600c451100b0040c2d0ca3camr4996515wmo.89.1702548969712;
        Thu, 14 Dec 2023 02:16:09 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b0040c4acaa4bfsm13075586wmo.19.2023.12.14.02.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:16:09 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	conor.dooley@microchip.com
Subject: [PATCH v2 11/13] RISC-V: KVM: selftests: Add guest_sbi_probe_extension
Date: Thu, 14 Dec 2023 11:16:03 +0100
Message-ID: <20231214101552.100721-26-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214101552.100721-15-ajones@ventanamicro.com>
References: <20231214101552.100721-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_021611_136413_07CBE6B0 
X-CRM114-Status: UNSURE (   9.10  )
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

Add guest_sbi_probe_extension(), allowing guest code to probe for
SBI extensions. As guest_sbi_probe_extension() needs
SBI_ERR_NOT_SUPPORTED, take the opportunity to bring in all SBI
error codes. We don't bring in all current extension IDs or base
extension function IDs though, even though we need one of each,
because we'd prefer to bring those in as necessary.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/include/riscv/processor.h   | 21 +++++++++++++++++++
 .../selftests/kvm/lib/riscv/processor.c       | 19 +++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index e70ccda2011b..dc50ad62e150 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -108,6 +108,17 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
 #define SATP_ASID_SHIFT				44
 #define SATP_ASID_MASK				_AC(0xFFFF, UL)
 
+/* SBI return error codes */
+#define SBI_SUCCESS				0
+#define SBI_ERR_FAILURE				-1
+#define SBI_ERR_NOT_SUPPORTED			-2
+#define SBI_ERR_INVALID_PARAM			-3
+#define SBI_ERR_DENIED				-4
+#define SBI_ERR_INVALID_ADDRESS			-5
+#define SBI_ERR_ALREADY_AVAILABLE		-6
+#define SBI_ERR_ALREADY_STARTED			-7
+#define SBI_ERR_ALREADY_STOPPED			-8
+
 #define SBI_EXT_EXPERIMENTAL_START		0x08000000
 #define SBI_EXT_EXPERIMENTAL_END		0x08FFFFFF
 
@@ -115,6 +126,14 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
 #define KVM_RISCV_SELFTESTS_SBI_UCALL		0
 #define KVM_RISCV_SELFTESTS_SBI_UNEXP		1
 
+enum sbi_ext_id {
+	SBI_EXT_BASE = 0x10,
+};
+
+enum sbi_ext_base_fid {
+	SBI_EXT_BASE_PROBE_EXT = 3,
+};
+
 struct sbiret {
 	long error;
 	long value;
@@ -125,4 +144,6 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg3, unsigned long arg4,
 			unsigned long arg5);
 
+bool guest_sbi_probe_extension(int extid, long *out_val);
+
 #endif /* SELFTEST_KVM_PROCESSOR_H */
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 6905a4348380..7ca736fb4194 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -393,3 +393,22 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 
 	return ret;
 }
+
+bool guest_sbi_probe_extension(int extid, long *out_val)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, extid,
+			0, 0, 0, 0, 0);
+
+	__GUEST_ASSERT(!ret.error || ret.error == SBI_ERR_NOT_SUPPORTED,
+		       "ret.error=%ld, ret.value=%ld\n", ret.error, ret.value);
+
+	if (ret.error == SBI_ERR_NOT_SUPPORTED)
+		return false;
+
+	if (out_val)
+		*out_val = ret.value;
+
+	return true;
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
