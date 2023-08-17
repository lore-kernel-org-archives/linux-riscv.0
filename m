Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAE3C3DA4D
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 16:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCNaBCinNXMcucN1pKKhVYJQ2Vk29dMnWTDPZl0Bnmw=; b=p0UFdTu/YhQSUY
	nbuSM9gMJIsXkcr6BJRPW9XLWfo+8F8fOpGsezLzx8yoHUMosWLGSvLEJItinLjyXclYOm2fHkFkr
	JPsussgaCmhryQipCt6iHXPXqObyR2Fu6pREy6huN6hpXe1fDj/r778D1xxqiHWiH5wRadpra34Ec
	rP8EozzLHJ7HOG9Rv3JGrf3SKTCZF1lCb9Ur8KAUapEhCVbj6Kv3AklWtHSfCruaWx3rNhxSQxpYG
	uYuXjU+h0JCHHoUz9ogbb4ZQFD/xjz65A8SJwbqY07QBhX430YAO4chpk3v2XG090Tvr80isrWlNM
	kP7ZJ9mlPSrex+PEM9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWfmw-006mTv-2W;
	Thu, 17 Aug 2023 16:23:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWfmp-006mRW-2H
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 16:23:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fe8242fc4dso407815e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 09:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1692289428; x=1692894228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifdM5Tql1E0T0QqUL/c4QcQ4pq9icIjHI8olZZD687k=;
        b=Ix0OowMGbjXjccNFeUw9X61wmfyYv9lCNy0gRNBOSX/6gpYGOtQkWodvK4RNGbe2Ug
         nXQEPj6GZk+1CF/3+1bP59Z6dSFyQ5pGU6V/dBssn22CBtVMDDh/pWIL9PNl7Un4C2ga
         e+pfi94/2kk0ExRTCk6BfpwhGpzUoUO7LY1KNSZhs69A0y5mUsn/JXWfmCDYtg2Ciecq
         6F006Ke9DRb6VHnGX70fMR9X4/Afugj6ZJz9v5ubwKkx8SRMAsVI/sbFeVbUGbMIQQsO
         t2IUZXv3XutRUPloxSlADZnK3PRiOcQRU52Ag0+ZQaFOlfc64VD0FTcwzVjO+pxjA7U8
         /imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692289428; x=1692894228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifdM5Tql1E0T0QqUL/c4QcQ4pq9icIjHI8olZZD687k=;
        b=cKDB8ninT5A4gj7eYRqYiMJBy6IlSQCvh24IopC7MZAXeSh+vRGg3ifQI6PUGo6+gs
         vnh8TabjTEg3vBkVK8baNunuGeZUQ6gQdi7h0jE0ebq4ON3G0496gFNX6iv95Y86HOTS
         nkjABZjOzNlSv3PvgNBGAy4+cgowwXwW0YM1/mQPAK9dgpsDYJ3Y7Yo2+2vmxCuzHQNB
         Y7b0UYCyo85LMKM2WD3tc3BLfhKmxz7Z++5U2HtbqjEbdRYqe0e1/AyzpFA7Bykr9Tfx
         +PSKspyYitxNX99y2fO8YbSsUcwKS/9DS0aKb17pB+Lg2KAl/B4I2yIPr7i7Jh6cCuYh
         Ujag==
X-Gm-Message-State: AOJu0YwekmHDeoZp5P5oH1T6rWBvEo/I+X5dlABlYwW6dKZYkToJpLjU
	CqD2hlJ5tKHLdb4nc2vMY0LJKQ==
X-Google-Smtp-Source: AGHT+IHDLC+225F9P53MxDI4EglsLumcnPuXco50Q5crZmmR6T7dwS7I6A8lJI5GDd3nnRbMdIjWLw==
X-Received: by 2002:a7b:cd94:0:b0:3fb:e573:4172 with SMTP id y20-20020a7bcd94000000b003fbe5734172mr178911wmj.31.1692289427714;
        Thu, 17 Aug 2023 09:23:47 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id x22-20020a05600c21d600b003fe1cb874afsm22797wmj.18.2023.08.17.09.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 09:23:47 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	haibo1.xu@intel.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH 2/2] KVM: selftests: Add array order helpers to riscv get-reg-list
Date: Thu, 17 Aug 2023 18:23:46 +0200
Message-ID: <20230817162344.17076-6-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817162344.17076-4-ajones@ventanamicro.com>
References: <20230817162344.17076-4-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_092351_752676_0C848CB5 
X-CRM114-Status: UNSURE (   9.04  )
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

Add a couple macros to use when filling arrays in order to ensure
the elements are placed in the right order, regardless of the
order we prefer to read them. And immediately apply the new
macro to resorting the ISA extension lists alphabetically.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 76 ++++++++++---------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index d8ecacd03ecf..0ea17a5ffbed 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -20,16 +20,16 @@ bool filter_reg(__u64 reg)
 	 * So, to make life easy, just filtering out these kind of registers.
 	 */
 	switch (reg & ~REG_MASK) {
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVINVAL:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICSR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
 		return true;
 	default:
@@ -281,35 +281,38 @@ static const char *fp_d_id_to_str(const char *prefix, __u64 id)
 	return NULL;
 }
 
+#define KVM_ISA_EXT_ARR(ext)		\
+[KVM_RISCV_ISA_EXT_##ext] = "KVM_RISCV_ISA_EXT_" #ext
+
 static const char *isa_ext_id_to_str(__u64 id)
 {
 	/* reg_off is the offset into unsigned long kvm_isa_ext_arr[] */
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_ISA_EXT);
 
 	static const char * const kvm_isa_ext_reg_name[] = {
-		"KVM_RISCV_ISA_EXT_A",
-		"KVM_RISCV_ISA_EXT_C",
-		"KVM_RISCV_ISA_EXT_D",
-		"KVM_RISCV_ISA_EXT_F",
-		"KVM_RISCV_ISA_EXT_H",
-		"KVM_RISCV_ISA_EXT_I",
-		"KVM_RISCV_ISA_EXT_M",
-		"KVM_RISCV_ISA_EXT_SVPBMT",
-		"KVM_RISCV_ISA_EXT_SSTC",
-		"KVM_RISCV_ISA_EXT_SVINVAL",
-		"KVM_RISCV_ISA_EXT_ZIHINTPAUSE",
-		"KVM_RISCV_ISA_EXT_ZICBOM",
-		"KVM_RISCV_ISA_EXT_ZICBOZ",
-		"KVM_RISCV_ISA_EXT_ZBB",
-		"KVM_RISCV_ISA_EXT_SSAIA",
-		"KVM_RISCV_ISA_EXT_V",
-		"KVM_RISCV_ISA_EXT_SVNAPOT",
-		"KVM_RISCV_ISA_EXT_ZBA",
-		"KVM_RISCV_ISA_EXT_ZBS",
-		"KVM_RISCV_ISA_EXT_ZICNTR",
-		"KVM_RISCV_ISA_EXT_ZICSR",
-		"KVM_RISCV_ISA_EXT_ZIFENCEI",
-		"KVM_RISCV_ISA_EXT_ZIHPM",
+		KVM_ISA_EXT_ARR(A),
+		KVM_ISA_EXT_ARR(C),
+		KVM_ISA_EXT_ARR(D),
+		KVM_ISA_EXT_ARR(F),
+		KVM_ISA_EXT_ARR(H),
+		KVM_ISA_EXT_ARR(I),
+		KVM_ISA_EXT_ARR(M),
+		KVM_ISA_EXT_ARR(V),
+		KVM_ISA_EXT_ARR(SSAIA),
+		KVM_ISA_EXT_ARR(SSTC),
+		KVM_ISA_EXT_ARR(SVINVAL),
+		KVM_ISA_EXT_ARR(SVNAPOT),
+		KVM_ISA_EXT_ARR(SVPBMT),
+		KVM_ISA_EXT_ARR(ZBA),
+		KVM_ISA_EXT_ARR(ZBB),
+		KVM_ISA_EXT_ARR(ZBS),
+		KVM_ISA_EXT_ARR(ZICBOM),
+		KVM_ISA_EXT_ARR(ZICBOZ),
+		KVM_ISA_EXT_ARR(ZICNTR),
+		KVM_ISA_EXT_ARR(ZICSR),
+		KVM_ISA_EXT_ARR(ZIFENCEI),
+		KVM_ISA_EXT_ARR(ZIHINTPAUSE),
+		KVM_ISA_EXT_ARR(ZIHPM),
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name)) {
@@ -323,19 +326,22 @@ static const char *isa_ext_id_to_str(__u64 id)
 	return kvm_isa_ext_reg_name[reg_off];
 }
 
+#define KVM_SBI_EXT_ARR(ext)		\
+[ext] = "KVM_REG_RISCV_SBI_SINGLE | " #ext
+
 static const char *sbi_ext_single_id_to_str(__u64 reg_off)
 {
 	/* reg_off is KVM_RISCV_SBI_EXT_ID */
 	static const char * const kvm_sbi_ext_reg_name[] = {
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_V01",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_TIME",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_IPI",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_RFENCE",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SRST",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_HSM",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL",
-		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR",
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_V01),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_TIME),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_IPI),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_RFENCE),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_SRST),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_HSM),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_PMU),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_sbi_ext_reg_name)) {
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
