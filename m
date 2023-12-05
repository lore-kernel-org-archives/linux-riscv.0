Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F454C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 18:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7c7uB79YdUGJMtMK12DujHGm7sN5qSb2DyLmJUGSCkM=; b=rjLXRjE0K9wgs7
	0j1+ajLdpvsDwmh9vOS/LOOG9fVF3cMTUTMwLJxr3qNZxAqHj/wHjiu1SgPXq7YvmIrAIq2RvzySf
	jrV7Mx05qDnkjVvjKK53f8PRGESJTZDk6kquYdUNvoCLnAGFKoTleyrrI6HxUoXDG+RhOpdyNj5fs
	dRJIQNrbigKPo01towXC89gHXCz8V8FWtAOzxg+pV7ThCv19tmtSwBaFRPZxpRpLT5XBfTIFE2fmB
	ViYFNKQn2/vIZED3r4zLKVBWE1QQ1xpI5OocTaj5yl7J8WB0SzHmjB+oNKNnML10n0R7WAYjSisWu
	skoLVh5n3aEyBmYR8q4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZti-0087DX-0Y;
	Tue, 05 Dec 2023 18:11:54 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtU-0086rh-3D
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 18:11:45 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9fa2714e828so786648666b.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701799897; x=1702404697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpfMMaVnqzUKTZ+jKcmqIbb/qIkXcAgoT0iTzjOxQ48=;
        b=mYDJwT9eKySK+d2n8vEiyq7pzCDX+ElUKqA/34qDRSVUlpO1Jt2SwpbX593x2hTPZn
         zn8kjAcBj9NllkghxlpE534SI9Y7YIAHbB+XEtAFKXmbss2tZHllMH83ZBRkFGaWxKOh
         h0ge1VsmwALOAF35ZtX/rufaBUFBVggGQKOyJesRWeQZqcSXiPPrVaD3Aa52B+tD1/x7
         HWDcJnhtt8nzSkq7+YoxzfZSJFoElxt0jfizVYJ/bl1fiAwE8/Ux3vqBhGkUrbb+5JCQ
         ocjrKAgHl4sc6YbFaaRBzrG6NJiLLuknO4mFDRM4QulO6MRJgs9AUFTxe4Wg1bMI4tiW
         +iPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799897; x=1702404697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpfMMaVnqzUKTZ+jKcmqIbb/qIkXcAgoT0iTzjOxQ48=;
        b=lkXEfSpv8IjBATURIVPolJ+qIhnw78udXcDmqbQMvxBzWWV68zG63vRsHK4ty/VPv/
         h0cwGFiKUIks9qijJelzYe0+UCRY/aiR1QWPa5SHaoOVzc4ep4zGlpZWZE2bJWMPVnVp
         yQS2ZBL+PjgKAApkCY+PITxMyIJU7y/V/vZtpSZCdQXGzpmMqGoCV1GAbX9yhfl+fqQT
         xEkmNC4oGRsa3kdDvBAbU/oTBCxTXmei5vasYdaFo1r/XmbaBE1eeDpNf7Q+ziQ25a/3
         gCtS/Z6Gg5vslc7NqdTxjUwDAu+9m2lHAZOFBxc+nV+X9zXOGoTLIyzvCiqLk5tWi/Fy
         CarQ==
X-Gm-Message-State: AOJu0YwgUs4agZtk+IW87ssA3IHKWoz/efTcDd9//SNm/SzLljGjP9as
	Rnm4M6SmYqHmdWtDBgS0EiX93g==
X-Google-Smtp-Source: AGHT+IG7j4tkgG9BdEAYgsWiHNE6RETMyX70kzIJ6SCnVEsMXr6DcaKxFt+JsiwBECSXjUhwyamLrg==
X-Received: by 2002:a17:907:7ea4:b0:a19:a19b:55f0 with SMTP id qb36-20020a1709077ea400b00a19a19b55f0mr871121ejc.128.1701799897601;
        Tue, 05 Dec 2023 10:11:37 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ef3-20020a17090697c300b00a1b75e0e061sm2840625ejb.130.2023.12.05.10.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:11:37 -0800 (PST)
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
	guoren@kernel.org
Subject: [PATCH v1 12/14] RISC-V: KVM: selftests: Add guest_sbi_probe_extension
Date: Tue,  5 Dec 2023 19:11:32 +0100
Message-ID: <20231205181119.207204-28-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205181119.207204-16-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_101141_092091_62CCB4F1 
X-CRM114-Status: UNSURE (   9.18  )
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
