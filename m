Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC9DC7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 10:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MjG4HCkBtu1dzUEcip5OeYtfgJj3hf3dpfJr7hvkaoo=; b=0z3Wj4/v2o+zP3
	WREuPrR/A8geC0w7mZMr9ycZYPnFf0Ivj4/xxjuxaCpIzI/iIG4yZD00nEiyqn9gzb1qGSoIjWMiP
	Xs5gm3BPRl1xgJ5VqIpnv58OKjn6W4ndY6cSW1pL5eNgS/mv7xOhiTpKp60Vpu+CjpghqueIbKfsB
	dM/SuqfESsrx4aA3RcWNfdVRwNcNYWolEKQSMI3VVY/YpiWgIM2LSrGz+Ok/eBmSZt/9HOP33LKLA
	lEEnmy14X6FQjs1cPPGUS1MtB4CSnmqIEcKCkkHzoBT8/6HtW+/RaR6nxuTEi52MXrc/ZSuF9sTm6
	fKNWcOO5O4h9QZW3i5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Udw-0020yU-2R;
	Fri, 26 May 2023 10:25:56 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Udu-0020wH-1F
	for linux-riscv@bombadil.infradead.org;
	Fri, 26 May 2023 10:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Tes1dicctUQuu2g9xwebJQg55pZ3KMj2kCsjEOfsXuY=; b=GHwzMdYTiAL15bbhvZco+7tkoC
	FsVV2Kf6B+4RjdLWImoklo4ffOFLVEiqzNUOR0/GZyu9GKw73w7cSUOFN7O9F+Lo06b73h+ycg6p9
	tzCFPggwAuXWOMbIdEqBe6Mss2O0QPVtjAEN3PejfbRmKxaOS9QEhrJagsESxBDnEEOhjes/7XjZF
	wi7S7BLagDiyGDu5loGWV+MFRXoQy4ilmvUpRzIOAqUpEBSlO8kJjWogOI/iOgjZIuYbOpnInjqXY
	DXHBUqgceqSo1buzbjGM2kkJfVZq7x7LWzA6Xv+0txo4FUayrgLJ+9kWOjdUpHpGuAKLaEjmbm8ad
	H2rlCtwg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Udq-007Tpd-0z
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 10:25:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f6da07feb2so6696415e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 May 2023 03:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685096746; x=1687688746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tes1dicctUQuu2g9xwebJQg55pZ3KMj2kCsjEOfsXuY=;
        b=MfUPfwaLkf0yMhcNwaT7YCsZZ2CtS6rnfWbZTPOjZZSLkR+gKbNjIixeHrzwV7rMUb
         jhzGIuEewRlCB+juJsSP4EgJehwrV1QaEhVocsWVYuZTas8Yjbr9y7uDW0lHWxU1sZhv
         v8xOVD4LxJcSeSNKV4uuf4nNaBHB0lX5N9I7j8cLzKP2rAzpetGXmtWGFqDhWirEbc0y
         nNGRWjmNSN2eV/f4OVMqr7iZ9vfLyXABiQu68WwkJyZ9pk4nLuGvKLxh7wiPSxQIZlhQ
         VQHLEkCvfMTBdpeVeXntaVYKAI0dmhIVvSHGNjX/liim1lW/Ah9+b3ptAk3IgrNOZe3e
         zurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685096746; x=1687688746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tes1dicctUQuu2g9xwebJQg55pZ3KMj2kCsjEOfsXuY=;
        b=c3Rf5pHQif0ulwQCipaWPxo8ng/EjdV9/4/Wijxo9HxZ2Ni7rkMsBO8yEW8fsWgkKa
         2/UFDkRZfaG0By9EGY/gtbDDudbvYProycXVkMXYac4VpQiIJzWmLV57cX5ogr7x81b7
         uMPuXUaruKJuRxjZ4AMQU3cZz5KVdVCvYUq5RhC5C0VMckWEyOJCULehiinHiXB7cMEc
         bu4FXbalC3fEYnhz/2m/LU1d4FeCpr59WgwoW3zCiCGMjzxBGwUuNEkaa1ZE/0EbZWak
         yidOpuFhm5qIZJzyuLaZuolMPnnjiZW2ZaiigIu0XhUN/ERtwGn9FkAccOL5MZTUoKrS
         tdRg==
X-Gm-Message-State: AC+VfDwthkuNFuDZXyri3OwSEbJOWgQjhANLs8lrAGgu16PWkM8984KZ
	IlyYH4v2KOwluOvH79YtBJEq2TxXIgjoaepj6PY=
X-Google-Smtp-Source: ACHHUZ4baRI/vwwSut+joTmMC7lpvZIf6/kjw4OW8mmfJxUXwfeBiZHexSgPDAgW2RfBNar8u5y39w==
X-Received: by 2002:a1c:7211:0:b0:3f6:cfc7:8bd0 with SMTP id n17-20020a1c7211000000b003f6cfc78bd0mr1096411wmc.36.1685096745688;
        Fri, 26 May 2023 03:25:45 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c210f00b003f42d8dd7d1sm8433030wml.7.2023.05.26.03.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 03:25:45 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Anup Patel ' <anup@brainfault.org>
Subject: [PATCH v2 3/3] RISC-V: KVM: Probe for SBI extension status
Date: Fri, 26 May 2023 12:25:40 +0200
Message-Id: <20230526102540.105013-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526102540.105013-1-ajones@ventanamicro.com>
References: <20230526102540.105013-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_112550_484847_8DC8E991 
X-CRM114-Status: GOOD (  22.20  )
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

Rather than defaulting the status to available and allowing the user
to set availability, default to uninitialized and only allow the user
to set the status to unavailable. Then, when an extension is first
used, ensure it is available by invoking its probe function, if it
has one (an extension is assumed available if it doesn't have a probe
function). Checking the status in kvm_vcpu_sbi_find_ext() ensures
extension functions cannot be invoked when they're unavailable.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
 arch/riscv/kvm/vcpu_sbi.c             | 51 ++++++++++++++++++++-------
 2 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index cda99fc3d897..a55b6225aa55 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -15,6 +15,7 @@
 #define KVM_SBI_VERSION_MINOR 0
 
 enum KVM_RISCV_SBI_EXT_STATUS {
+	KVM_RISCV_SBI_EXT_UNINITIALIZED,
 	KVM_RISCV_SBI_EXT_AVAILABLE,
 	KVM_RISCV_SBI_EXT_UNAVAILABLE,
 };
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 28e55ba023dc..b3e92c11e54f 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -155,8 +155,15 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	scontext->ext_status[sext->ext_idx] = reg_val ?
-		KVM_RISCV_SBI_EXT_AVAILABLE : KVM_RISCV_SBI_EXT_UNAVAILABLE;
+	/*
+	 * We can't set the extension status to available here, since it may
+	 * have a probe() function which needs to confirm availability first,
+	 * but it may be too early to call that here. We can set the status to
+	 * unavailable, though.
+	 */
+	if (!reg_val)
+		scontext->ext_status[sext->ext_idx] =
+			KVM_RISCV_SBI_EXT_UNAVAILABLE;
 
 	return 0;
 }
@@ -181,8 +188,15 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	*reg_val = scontext->ext_status[sext->ext_idx] ==
-				KVM_RISCV_SBI_EXT_AVAILABLE;
+	/*
+	 * If the extension status is still uninitialized, then we should probe
+	 * to determine if it's available, but it may be too early to do that
+	 * here. The best we can do is report that the extension has not been
+	 * disabled, i.e. we return 1 when the extension is available and also
+	 * when it only may be available.
+	 */
+	*reg_val = scontext->ext_status[sext->ext_idx] !=
+				KVM_RISCV_SBI_EXT_UNAVAILABLE;
 
 	return 0;
 }
@@ -309,19 +323,32 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 				struct kvm_vcpu *vcpu, unsigned long extid)
 {
-	int i;
-	const struct kvm_riscv_sbi_extension_entry *sext;
 	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
-		sext = &sbi_ext[i];
-		if (sext->ext_ptr->extid_start <= extid &&
-		    sext->ext_ptr->extid_end >= extid) {
-			if (sext->ext_idx < KVM_RISCV_SBI_EXT_MAX &&
-			    scontext->ext_status[sext->ext_idx] ==
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+
+		if (ext->extid_start <= extid && ext->extid_end >= extid) {
+			if (entry->ext_idx >= KVM_RISCV_SBI_EXT_MAX ||
+			    scontext->ext_status[entry->ext_idx] ==
+						KVM_RISCV_SBI_EXT_AVAILABLE)
+				return ext;
+			if (scontext->ext_status[entry->ext_idx] ==
 						KVM_RISCV_SBI_EXT_UNAVAILABLE)
 				return NULL;
-			return sbi_ext[i].ext_ptr;
+			if (ext->probe && !ext->probe(vcpu)) {
+				scontext->ext_status[entry->ext_idx] =
+					KVM_RISCV_SBI_EXT_UNAVAILABLE;
+				return NULL;
+			}
+
+			scontext->ext_status[entry->ext_idx] =
+				KVM_RISCV_SBI_EXT_AVAILABLE;
+			return ext;
 		}
 	}
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
