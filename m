Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4491ACD11DD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 09:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=liIHVGC7iRuysljZrZSQmSHpEu5yihpiyLMXPm3Q7NE=; b=gjOLyNlH5ZWrKS
	l1oFTQiIfcJMF2Doz7ZfhAhNcilAibiS/wmRs19ykfRS0wklBJHfOf2s29kaqAy0VtyWc0f4xn/oV
	B/8LuyITUGamLbykeSFprKej5bT3QdPK5srq696nqnUej65NGZ1XycR4t7LpTiiNpiEyLGMdWnjov
	bUTeiGKKJensEaVFcpMFfBb21y5NjgV07HKU6bNaVsQU6A+gsNBe6pHgjzAf7BvmOEpJ95ducS8wJ
	+0n4TdlGa37VpOZBvkldal6M4J0ly6KzTRN9s3FbE6k7utfz0GMOkoSsOwa/+k5J/J45pzdZ6Mf0O
	XUJIV9yh2J2tFn2kjZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8X1-0000000HUgX-2ZVw;
	Fri, 29 Mar 2024 09:28:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Wt-0000000HUaX-2Tqi
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 09:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=W2BJOQ9wxa5k0Z60PWQjy0KWSd8OFBHkeE+vEvJtEEk=; b=oixXuRbwNTaobVjAr3syqQd01J
	B6JLo16PnQmIbE7gvox7/ebkyaaCYhplZqM2+qcpCLudyDVnrfZ5oxwqsmOvjEtimGIX3STL1vp9j
	1hsDOYE9Y2VTL7Y2xSZaCM/F+wInXDKPwqKWXHd76eB65Y+iFFqWdgCYvVLQtw/AZumqrP3AUThKC
	HTaUrc6PVTHnsuUlWB0MFFnOlubGtlKR1uZ9G5uXE90HTVGr1QrnPjpaWGw0dh5heOWi4okQ8EBxa
	UBXldZaa/S7nK79X2a/nJY9bp8Ziwp1Ow7FVtKrD+9N3vCY59M43aniE2ksZrF+lmUF5AJJfblG8Y
	+uzj8FuQ==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Wq-00000001TvL-0oRI
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 09:28:06 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e6a9fafacdso1430402b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711704482; x=1712309282; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2BJOQ9wxa5k0Z60PWQjy0KWSd8OFBHkeE+vEvJtEEk=;
        b=QdUt1VV7FgopXybJ9w+yz5YJRkPFGCnzBBPQG2mf7olJqsgpg4vVexsv3mPalBQWmb
         KJKXTZPBe1KUTj7AQgOu2+NvKJo0Bxh8Hl7bSEKimyqDbxwSj9zfwGg5qlUC6u/OkkNV
         HMEY/MlLYJWIaK6oF+KkowSzebidkulmWX0GtkCVzc3wut3cj58ZFwuYW7Ldso/MCkva
         xSgk2dheOL7G7EWkZK1cJDuyZO/IENri53I6ifrP3NuqNUdYvbkrR6+VWezRavE3vdKM
         sj4KSC4gSCigL0bBRcqnjwm8ggvKvRSzmUErHV3AWQLWPvtNPaN2sK0EgpnBmbimeiQa
         +g7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711704482; x=1712309282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2BJOQ9wxa5k0Z60PWQjy0KWSd8OFBHkeE+vEvJtEEk=;
        b=XWrYFIVhLyoK4VRYSPScxFve3IvHWRQARKhsFqUWy93Cn3ERrkgrPxk2gmztKNu8+B
         KgftQ1TMEjdKgN2FQ0Gemdk2o10xK76Hg7W/HaTbi1V1RDh1iuCCXi+5DNpjE6ULt067
         93awu+zAU6neShuGfwvWgVSN6zzqNODXuXijxVL/d4drLUl1Iky5aHGQ+iTbL5fPjrJV
         HHeBvUHy8Dc/k829OucK62w7t1Y/oV4E0N0Lkg8lSZAia0ISC3p5mptBsAiPPhf4v+Y0
         YWAb0W0HYOiXH6ZH6OFr9yS9uDGx/TMGHb6BCVpgh22k74CdlDpguqZtdBic25fLI/HV
         7yJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvThbeRPN8wQDBXt9/XVFV5PYux7+08y9W7JEIOT7Zw/cKJjpendjWfO0hiQ74U9rqVXYIYJ8WhZNNRfOOJjZkUKQOt6TuZALWnfEez4uN
X-Gm-Message-State: AOJu0YxOmdU7pJaiyxfY7Pc0g9mpuHx2JBXZdtvNpTbEen5HRhw8adFf
	xIQyoqQhhkkaVguv6YsZPTiWIFLINgqgyvauovKJYxliaUflINuUiNOarSqg/WOVjY3NrBmwxNl
	JRJZ77DIQswuOYZJ2j3xx0YNaSrSW5TnoEbfOwbPZqlTsV9j6/bB7TtrS1nRkFq11S/sVtQTKtG
	L76j7R9n3qPPwKtTGlTAYOQN+msFQHBfXU+7ZTHTOwVcotKnwsHQ==
X-Google-Smtp-Source: AGHT+IF+IG00xBHcuGEuM8FjBpouIXGd2i1O2spwYlcOfF/yskdrf4gmePYkFHJj5HCFiJOPwSSmXA==
X-Received: by 2002:a05:6a20:89a4:b0:1a3:ae18:f1e4 with SMTP id h36-20020a056a2089a400b001a3ae18f1e4mr1227195pzg.34.1711704481705;
        Fri, 29 Mar 2024 02:28:01 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id cv17-20020a17090afd1100b002a02f8d350fsm2628830pjb.53.2024.03.29.02.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 02:28:01 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:22 +0800
Subject: [PATCH RFC 06/11] riscv: suspend: add Smstateen CSRs save/restore
MIME-Version: 1.0
Message-Id: <20240329-dev-maxh-lin-452-6-9-v1-6-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Max Hsu <max.hsu@sifive.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_092804_356200_C56C01CB 
X-CRM114-Status: GOOD (  10.15  )
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

From Smstateen extension: the values of the [h/s]stateen CSRs will
be lost when entering a non-retentive idle state.
Therefore, these CSRs values need to be restored to ensure that
the corresponding functionality remains enabled.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/asm/suspend.h |  6 ++++++
 arch/riscv/kernel/suspend.c      | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
index 4718096fa5e3..2ecace073869 100644
--- a/arch/riscv/include/asm/suspend.h
+++ b/arch/riscv/include/asm/suspend.h
@@ -17,6 +17,12 @@ struct suspend_context {
 	unsigned long envcfg;
 	unsigned long tvec;
 	unsigned long ie;
+#if __riscv_xlen < 64
+	unsigned long hstateen0h;
+#endif
+	unsigned long hstateen0;
+	unsigned long sstateen0;
+
 #ifdef CONFIG_MMU
 	unsigned long satp;
 #endif
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 8a327b485b90..a086da222872 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -19,6 +19,15 @@ void suspend_save_csrs(struct suspend_context *context)
 		context->envcfg = csr_read(CSR_ENVCFG);
 	context->tvec = csr_read(CSR_TVEC);
 	context->ie = csr_read(CSR_IE);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_h)) {
+#if __riscv_xlen < 64
+			context->hstateen0h = csr_read(CSR_HSTATEEN0H);
+#endif
+			context->hstateen0 = csr_read(CSR_HSTATEEN0);
+		}
+		context->sstateen0 = csr_read(CSR_SSTATEEN0);
+	}
 
 	/*
 	 * No need to save/restore IP CSR (i.e. MIP or SIP) because:
@@ -42,6 +51,15 @@ void suspend_restore_csrs(struct suspend_context *context)
 		csr_write(CSR_ENVCFG, context->envcfg);
 	csr_write(CSR_TVEC, context->tvec);
 	csr_write(CSR_IE, context->ie);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
+		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_h)) {
+#if __riscv_xlen < 64
+			csr_write(CSR_HSTATEEN0H, context->hstateen0h);
+#endif
+			csr_write(CSR_HSTATEEN0, context->hstateen0);
+		}
+		csr_write(CSR_SSTATEEN0, context->sstateen0);
+	}
 
 #ifdef CONFIG_MMU
 	csr_write(CSR_SATP, context->satp);

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
