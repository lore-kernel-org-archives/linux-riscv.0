Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B14C46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 18:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4xmetIPTdsCUMNTvAQPWluQNZp2y38V3oSRJ8bGug0=; b=uXH9Ofy4op8ET3
	f6wkYohP5xHLJPjwIts8hcxQhUCJboQ4bo8KDkdMR3akN+K3FO6V91CUo9ZQRGUv6t95jK6Vkvi2i
	9UyfQd7p2JGi6AQ/QX36lV7v1YC0dSgi2UFO6p2mecfWNjmF4lmdn2NVa5obtob1T/pQAuiXxzC6N
	7+y4QrpLwedK3rV4VzQW56bWIYpBEwmDbP9GCqZt6iRmucP/vaB8qXRIFtexYzy/5RiaV3rIyIT/l
	Smg87M4701cw7R9vvtB+okPMbDNKCI9L8eH+zCRc8f8CzeBtTRHPtte9S3aN9w1/k7O4WcL/APiG1
	6K9R1+Ib2q0R8GZ5pWxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiIeV-00G2c3-1q;
	Mon, 18 Sep 2023 18:07:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiIeT-00G2Zg-1L
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 18:07:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c3cbfa40d6so43231955ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 11:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695060436; x=1695665236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpLoyMijHBoqQ//iQuuQg2kQqMONVlRrgQK7tTPKQvg=;
        b=kMerOnjWOb3WZuckgqXAsyKP7dmask4gC9jDh+tdfQo5Ic9DsvQudmKBcwQfMW6JrB
         pTxB1kV+posnMmyHzIQCSCl2fDYIe3uvdEzB243ySbDTP1joI3GVmtvK7QCoOkCzVRck
         pOwNKQwfPhos1RgWLq1+Omn2zvUukua6284r9uB8W2Ba49PtHESk8wQkNQ2oDfHragYL
         0SsxqpZyZ/IaznXfq6XzLSRLeqP1nTUo8lX+DZYITIfjBEKchz1KJq22Aiu3uKN3h+UR
         vjsMDYe9Nl1uFs6T5pSWX5FOgpBIRjXwHKRkTe5mP8CZW+6j+5IT6NGGXO0RrAE55Gxb
         Xfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695060436; x=1695665236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpLoyMijHBoqQ//iQuuQg2kQqMONVlRrgQK7tTPKQvg=;
        b=B9FXOF0naImdPnPOElI4+qgdxKZlKnhvs1nBCg9CMK2XJOEBQXxdJmDPNGNTI/r75Z
         jFMzSLZ93Ts1snQLxMXZYtFLU2tXTiQJQ840NCVrw6tTqBJyZBGYEAnLAwevHEb0Mvpn
         DYCZ8tNM+ifwNOzTFAuDDXCDUys5V7+UeO5td8BBiPiaU3M6cF6KYz3BQuC8K0s/0PBC
         /QXJRd367ab2H6Y9HZy6VQzWISabUHyrQOzVz0DoxdXxY1Jz0DqeNJwatkORGXhxRh80
         l2VL+CMGbLrJoU55e3V1TH1aiYjGg1TdsUPFQHYys5GAh4UtpJxMlQxT/XLEwDxDJB13
         ndDA==
X-Gm-Message-State: AOJu0Yz7zSOFD0J+KT8oRZvSsFzz8hCnyGJFwzRcPoYUhVNNl1ctLIZl
	Zal9px7x2k+vJEPZr7o4+jj2sQ==
X-Google-Smtp-Source: AGHT+IG7/yjGEY6FtMJ+Y1Dl4iuR/zuJXn3aFtsAD+Wt3c7P+oz0dDSdwrMz0aB8dDmosI1me7MJ+Q==
X-Received: by 2002:a17:902:728a:b0:1bb:d048:3173 with SMTP id d10-20020a170902728a00b001bbd0483173mr10004616pll.61.1695060435836;
        Mon, 18 Sep 2023 11:07:15 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902704700b001aaf2e8b1eesm8556720plt.248.2023.09.18.11.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 11:07:15 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 4/4] KVM: riscv: selftests: Selectively filter-out AIA registers
Date: Mon, 18 Sep 2023 23:36:46 +0530
Message-Id: <20230918180646.1398384-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918180646.1398384-1-apatel@ventanamicro.com>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_110717_481812_CD0A7D9F 
X-CRM114-Status: GOOD (  13.34  )
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

Currently the AIA ONE_REG registers are reported by get-reg-list
as new registers for various vcpu_reg_list configs whenever Ssaia
is available on the host because Ssaia extension can only be
disabled by Smstateen extension which is not always available.

To tackle this, we should filter-out AIA ONE_REG registers only
when Ssaia can't be disabled for a VCPU.

Fixes: 477069398ed6 ("KVM: riscv: selftests: Add get-reg-list test")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 76c0ad11e423..85907c86b835 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -12,6 +12,8 @@
 
 #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK)
 
+static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
+
 bool filter_reg(__u64 reg)
 {
 	switch (reg & ~REG_MASK) {
@@ -48,6 +50,15 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
 		return true;
+	/* AIA registers are always available when Ssaia can't be disabled */
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(sieh):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siph):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1h):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2h):
+		return isa_ext_cant_disable[KVM_RISCV_ISA_EXT_SSAIA] ? true : false;
 	default:
 		break;
 	}
@@ -71,14 +82,22 @@ static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
 
 void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 {
+	int rc;
 	struct vcpu_reg_sublist *s;
+	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
+
+	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
+		__vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(i), &isa_ext_state[i]);
 
 	/*
 	 * Disable all extensions which were enabled by default
 	 * if they were available in the risc-v host.
 	 */
-	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
-		__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
+	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++) {
+		rc = __vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
+		if (rc && isa_ext_state[i])
+			isa_ext_cant_disable[i] = true;
+	}
 
 	for_each_sublist(c, s) {
 		if (!s->feature)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
