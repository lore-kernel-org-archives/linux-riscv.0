Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D9BC46CD3
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=392YmjqICp0vrhFUdmVj0EMe3zIq/53GL/zyFfL+87o=; b=SNr+BTU9/CZ7bb
	YxM5TYbHx4nSzoLb0Y0NoER08l9GbrlfsjeL0fKE1KtK00mxezQePvoIZlcVonQHhCkBBumg2HKXr
	xtUtFtcUdyNdkNM3/8VafoTiot4ddCGQA21Af8LGrsvanG8dYxP8oKKrCBqSFkjO/CkafCtT7LGEo
	XIAmgBMGn4h5O8oeGR5UMzBbO4Am1xY2/R9FbQXhXaN94vnM71fEjSxLfa7I86/t9IYhzzN4zV/eu
	MlvGtY2wGaTat86xfpRyHKApSDl6TMsNlkOBmLGK6YiRxcW5lpZ3u3ufou3tqMr/Ru7mbgl+Pb/dh
	xlQxRMhkDwESggfk9ehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwZ-008QMY-1a;
	Sun, 17 Dec 2023 20:40:59 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwU-008QGq-31
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 20:40:56 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-54c70c70952so2809792a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 12:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702845653; x=1703450453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7vwoe3CX/elDbSVVxBrCH+gKLsjFQobx8w+cxadJhQ=;
        b=hNPyugiVDixtt7FBaCyGE3FDggtgx0Pn00+FJEy6T0M9+NvOH7L3BPuVdD/ANngvbY
         kSm9lUM7bARAzUqw1vFC0/PS85jdMEw2nHDLIFOqsHFeEAWzJkkNE9FmL0QSeA4n3Hr6
         h/iEALWavlB5zN/7mNAo37QKVviYh6r27ahLk3wbyUyzjAbac5HX6AWOEa8ulQ4fgKTJ
         HKaNxfQJ6HZySZ7k4jrdI5V9Yx2Ggo/drzeVonnDbqWr/cO5Gi6mtTEoRKOgH8dmlEyj
         u5/AZ3dlbIg3VukKa4rkZaaVK3B3xiaXrRvKctKX4zwuJrAs0hk21baWTyPHUVAh7ZE0
         FAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702845653; x=1703450453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7vwoe3CX/elDbSVVxBrCH+gKLsjFQobx8w+cxadJhQ=;
        b=HpUjcZxipsg3NMRxpXeNHtCKrg+QuN4N1XaS4Sf3I0aZKoKi+i4PCvvamOR8o+dfu9
         zOqI4lstkJvvqWUoOYf0bbHX3V1xYMcu54YG5sYgdRMByILrnEdoLOBGpOY7qRrnpW0S
         8AXxE0vorhGRXF95asqOeGg0drSBAqcXNP6Hd0y9bj4qP0gePszKsgeVyScanYOViiJc
         4eXf74f4Y+PeMfkakUAYbTVHxLY5Q5IT4B8OQACYMIqJTqZSIa3CWHkevT8Uup9ohOAK
         IZrdI9PYD0S832ORgdGdsp1HCxTAXnrNbycwbPSrdbiAfq2tVZI0a6rrpSpNiiC4esvi
         ruzQ==
X-Gm-Message-State: AOJu0YzIeXSOJSnZgWOg4gCjcVql3YIgGJ/dHwUbiomRZP5bxJUsz/DE
	2HuDsUOBxlpd9Fn0j1+qArIjHA==
X-Google-Smtp-Source: AGHT+IHm0ZOnGz+LVNIDHqOQJjqLNvNLueuDiQKDMBt1714V/QR1XUkwgUSLwCRwL7GcimCNaPKWfA==
X-Received: by 2002:a17:907:7e8c:b0:a10:f087:ba43 with SMTP id qb12-20020a1709077e8c00b00a10f087ba43mr5497857ejc.43.1702845653800;
        Sun, 17 Dec 2023 12:40:53 -0800 (PST)
Received: from localhost (cst-prg-88-42.cust.vodafone.cz. [46.135.88.42])
        by smtp.gmail.com with ESMTPSA id ld4-20020a1709079c0400b00a1df88cc7c0sm13219257ejc.182.2023.12.17.12.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 12:40:53 -0800 (PST)
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
Subject: [PATCH v3 11/13] RISC-V: KVM: selftests: Add guest_sbi_probe_extension
Date: Sun, 17 Dec 2023 21:40:31 +0100
Message-ID: <20231217204019.36492-26-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231217204019.36492-15-ajones@ventanamicro.com>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_124054_996101_F57ECE51 
X-CRM114-Status: UNSURE (   8.95  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
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
