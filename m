Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C7CCD13D2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 18:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MdC0RJwNZZEEv+U8Y/+ykKQ8moaQ7Y2LJtIlgTYioyI=; b=zq0zm2hcI3q96S
	kbGe50ZB9wtg9Kt6+n+ZDRrdUsEbnHHAyXbKWWes3cMg6VG24thpADKcqC9tUcn15bBdIteWl96va
	291gd6ThfJfbD/8ktkc0KtIAWQUdxFaduvHA1ALA4k9ZsrmN18EAJUBIcQddsk2186PvfpBhsLYHr
	T+rrqk2YRsjVdzeyKz1AdwAOtkD7/7cQLZFWxNUWzoxK69JcoK6fyTbuZGe9ZlzGtpkGkaOaZoC5r
	hj3MYOFvyUgAwPpwBqZoSdC+y8qOzi8zKBQpLgUu5PMBVSN0Ra65dbpBbJWlGP2uvqyoZUyFF9gnL
	7UYxvs+lFN8Ihq1zM6Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiIeR-00G2Z0-1R;
	Mon, 18 Sep 2023 18:07:15 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiIeP-00G2XW-1b
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 18:07:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c465d59719so13040045ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 11:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695060431; x=1695665231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q85pLC4CWOSNTpoPb1PgDLYa3KXzAnUZu4/HImowDuQ=;
        b=J4K4ydYLCRzVchKq6d1n2Ddk0fTUQLnYJvoBMSkRVxAA20xUfXxkJ+Qy9f5AOECwCa
         hSI1Cc+u4iq8SLm1EBFczng8MCdV2YF1BaysjT5/BX2qtPFsUhRpHTD5YHZOaRLw8D+Z
         JcwDHAiihOsIt2hXTREcx64Ulv8BYG5OuU7S+9KahwBg753EJRUEZGRGzoCS2ZCY7m8S
         FVP3rq9QxQWbG+3qp4KcQ+YSSicvm0I7DPlqeypfhofTL0SmWwNsLrtnJMgc4z0LeTca
         rYUM+RuSAzoNOnO9tiiqTMUOwmYrQ2XIv0cy1uCifKWegTj5qYB+yzGX+KkVyDrD9cyE
         WZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695060431; x=1695665231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q85pLC4CWOSNTpoPb1PgDLYa3KXzAnUZu4/HImowDuQ=;
        b=lcvAZjiqsb6gSlYJIDXhUFbt+41UivoqRoeUWU1a2TGYS7RnEhHG1rFbkIhiunjhNY
         ATra96MbTBVwMYf7QpZAMOy80R/evKCIR+vE28Z3r5K+v+D6YNtG+imMIgEnd1YJea8F
         Tas6v9nMzh048DysAZ0v9xGnq5xMKvLzu94lVRLKW+aVjeTSchZ3Eyskli7N3yHilGXb
         HDWnl747Lr3OuCvdX3gP4JQjoURBRfoGITS7tJU4IYzt4SQuAKI6tprz7BYTAL9uJtTy
         q+i2ogqEK49cGd3ONG9GRPyxcQ2aMB5oFXeIAnmdp1SZHrtQBxDoTbwmGDsHYNocqVh/
         7gxA==
X-Gm-Message-State: AOJu0Yy1F5cWOiTamSXcAIJpai1wE7q7HlJvw+mGH1S1W5FBOdhddoba
	9dkwAp9bqvnEP1TcB1m9+gxe1g==
X-Google-Smtp-Source: AGHT+IEbTMHUWCZuGNdKxBd5I66qIPiIr0OhjMBF5c9waakK0d252e8ysU5y9WDuV2qqSoMPyzw6gA==
X-Received: by 2002:a17:902:74cc:b0:1bf:78d:5cde with SMTP id f12-20020a17090274cc00b001bf078d5cdemr8797952plt.59.1695060430928;
        Mon, 18 Sep 2023 11:07:10 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902704700b001aaf2e8b1eesm8556720plt.248.2023.09.18.11.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 11:07:10 -0700 (PDT)
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
Subject: [PATCH 3/4] KVM: riscv: selftests: Fix ISA_EXT register handling in get-reg-list
Date: Mon, 18 Sep 2023 23:36:45 +0530
Message-Id: <20230918180646.1398384-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918180646.1398384-1-apatel@ventanamicro.com>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_110713_535567_4B502183 
X-CRM114-Status: GOOD (  12.52  )
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

Same set of ISA_EXT registers are not present on all host because
ISA_EXT registers are visible to the KVM user space based on the
ISA extensions available on the host. Also, disabling an ISA
extension using corresponding ISA_EXT register does not affect
the visibility of the ISA_EXT register itself.

Based on the above, we should filter-out all ISA_EXT registers.

Fixes: 477069398ed6 ("KVM: riscv: selftests: Add get-reg-list test")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 35 +++++++++++--------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index d8ecacd03ecf..76c0ad11e423 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -14,17 +14,33 @@
 
 bool filter_reg(__u64 reg)
 {
+	switch (reg & ~REG_MASK) {
 	/*
-	 * Some ISA extensions are optional and not present on all host,
-	 * but they can't be disabled through ISA_EXT registers when present.
-	 * So, to make life easy, just filtering out these kind of registers.
+	 * Same set of ISA_EXT registers are not present on all host because
+	 * ISA_EXT registers are visible to the KVM user space based on the
+	 * ISA extensions available on the host. Also, disabling an ISA
+	 * extension using corresponding ISA_EXT register does not affect
+	 * the visibility of the ISA_EXT register itself.
+	 *
+	 * Based on above, we should filter-out all ISA_EXT registers.
 	 */
-	switch (reg & ~REG_MASK) {
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_A:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_C:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_D:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_F:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_H:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_I:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_M:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVPBMT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_V:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICNTR:
@@ -50,12 +66,7 @@ static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
 	unsigned long value;
 
 	ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
-	if (ret) {
-		printf("Failed to get ext %d", ext);
-		return false;
-	}
-
-	return !!value;
+	return (ret) ? false : !!value;
 }
 
 void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
@@ -506,10 +517,6 @@ static __u64 base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(time),
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(compare),
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(state),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_A,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_C,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_I,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_M,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_V01,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_TIME,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_IPI,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
