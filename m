Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1C0C83F24
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 06:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLNk/5cDea69zQ6JMWilh8VNM5HHnJQCP01ZGm3eA2A=; b=Mv1KNEa1oODc+Q
	n3JBHSYn7eVVny5V8qddIK8bPDFwCmcoAJ6X7YzcRDI7MV5MmCf4p657mAvjcKJaBs3hUZg7p/mtb
	XK35HGlDBbYlQNUM2uMQ+wTbtGK7KK0Grmt07LtReuTgSJKDBx+SNHlWDYpJxT0h28kAqxBkNM9Au
	SI+tzL/llWtwlA0TP1tNWunLH/X6Lt4wQurDp9dlShYQ+ZQ/uSVq1AmedBI2DyN3iAV00VtMknfpL
	E37z5w/5xShioRh0VXfc6p3MRRO1cydsmlzBpXkJX2TXJtSK1IdevtScRVnWmp2/fu9JMdduuxUwc
	UjdvenGxrAz9Uh9icHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCnR-00000001NAs-0KpI;
	Mon, 14 Jul 2025 06:36:17 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCP2-00000001IN0-4B2m
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 06:11:06 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a6d1394b07so2731890f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 13 Jul 2025 23:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752473463; x=1753078263; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U+Y2ODvkU1M3Yop4Vbyu4J7zT/gX9/QfE7MMpELx/ao=;
        b=umm1Bt+pNoJZAKIbyqv1ariB+rzOz8Cz3ropJpzweKYFjO1WLMlauwQI+Y3a+hWpId
         MXzJxJevhMZDqgC83/KS7XZ0DvstYeXc4IiMcZwfqLuizelyHTgyTgTRcNX7Kn650w7X
         c2RtIhjU1/yWa77JRwI83rms2Jmym84kUTvCP2OpVeSS8plNTLdNh8q6eE1X3eMjh5h9
         Xyq+palBdZshMSdbyvhzwggRhqtV1DsKcfCVkJ0OnxZd+OrbffOnDY+X8rcVUm9Hop62
         W21tq5UflKzXR226HIOPYKXE8fTb5lpfAoJco/2RQnlJ48pBriNcXqyvClsHBDL2E2sk
         AJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752473463; x=1753078263;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+Y2ODvkU1M3Yop4Vbyu4J7zT/gX9/QfE7MMpELx/ao=;
        b=TWWXkIS1jP4IIvPOhsVl1/I+kncrFJtmwLN5h8sxXrIzJ3HdWomLdAIBS+6sHolZ1K
         wIeeDpIVpRfOq8uHQonkXwbsT3Ows2xolyqzBk8NTdny1s3gzsV7aIezOZGXyIt4XFbT
         FNlKnymRJVhe22dETzTUwa08r03xfVV7b+/TXkZgInd7kVXq4sS6FvLQzHvwxd50Eqc1
         +zMO9uokgvLi4fZ37JqIXJZ8r5R2gQTSGDhuSq8KWYdBMWz93RXwHLBFRC51m2jasRxw
         CDsYfbJ/qnaDTEylMAa1qhoMbuFVfvvppDRRnSckeHNFN+8HBwTHllVXTCnyZ67WFtZb
         TZZw==
X-Forwarded-Encrypted: i=1; AJvYcCU0IjgXUJqusTlWUVPCblUwTjiA44xJ4GaxSl4ipPkl93fZ7fa7681vGaRlma5JR/siao9OZsI+d9CNAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoQQ7qw6IXSJFb3JcSw8gGfNuXxDBgD3NSdhb9Xjzf9E2uf1ZS
	C6mporaBxFsx/aZR1w/w64gJmJ9DH02mmZ+qBgoeVrZ2WFl8eMHDMZJwiK0Mi9h1CnIJiIwzRw=
	=
X-Google-Smtp-Source: AGHT+IGX28n5QiyMHbS8lBZuZk7ytkYxLROV5L6i8XeWU2qCGkPvK5JXtsuwoSWms4DVodcgWH84OylK
X-Received: from wrpd13.prod.google.com ([2002:adf:f2cd:0:b0:3a5:7de1:2a54])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2d03:b0:3b1:9259:3ead
 with SMTP id ffacd0b85a97d-3b5f188ea57mr7903902f8f.28.1752473463212; Sun, 13
 Jul 2025 23:11:03 -0700 (PDT)
Date: Mon, 14 Jul 2025 08:08:47 +0200
In-Reply-To: <20250714060843.4029171-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=10631; i=ardb@kernel.org;
 h=from:subject; bh=AM0I+cBVbRNRbkYjQz/D1G435xAIpZLDBEjL19MJg2w=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIaNk3r/ty443O28umjfLomTz8/SAuPdT3B3Omps26nft3
 bZh76H7HaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiK6oZGboeRfLG+Ldu+j6J
 WUg46/ZEw41PP6Yf5ZxVHXwxuP9BnyUjw6wCn6md1VrPOid8avq4xaWe957uwZsiURsf/WZuDzM QZwIA
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714060843.4029171-8-ardb+git@google.com>
Subject: [RFC PATCH 3/3] efi: Remove support for pointless, unused EFI services
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_231105_058340_A2AD584B 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: Juergen Gross <jgross@suse.com>, linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-efi@vger.kernel.org, x86@kernel.org, Bibo Mao <maobibo@loongson.cn>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, xen-devel@lists.xenproject.org, Feng Tang <feng.tang@linux.alibaba.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Ard Biesheuvel <ardb@kernel.org>

The get/set wakeup time EFI runtime services are often broken, and
rarely if ever used in practice. But the GetNextHighMonoCount() EFI
runtime services really takes the cake for most pointless API in the
history of computing.

So let's stop exposing them in Linux, hopefully removing the urge some
folks seem to feel to test these APIs, and send emails around when they
don't work.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/efi/efi_64.c          | 22 -------
 drivers/firmware/efi/runtime-wrappers.c | 68 --------------------
 drivers/xen/efi.c                       | 56 ----------------
 include/linux/efi.h                     |  6 --
 4 files changed, 152 deletions(-)

diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
index e7e8f77f77f8..0207937ab39d 100644
--- a/arch/x86/platform/efi/efi_64.c
+++ b/arch/x86/platform/efi/efi_64.c
@@ -540,19 +540,6 @@ static efi_status_t efi_thunk_set_time(efi_time_t *tm)
 	return EFI_UNSUPPORTED;
 }
 
-static efi_status_t
-efi_thunk_get_wakeup_time(efi_bool_t *enabled, efi_bool_t *pending,
-			  efi_time_t *tm)
-{
-	return EFI_UNSUPPORTED;
-}
-
-static efi_status_t
-efi_thunk_set_wakeup_time(efi_bool_t enabled, efi_time_t *tm)
-{
-	return EFI_UNSUPPORTED;
-}
-
 static unsigned long efi_name_size(efi_char16_t *name)
 {
 	return ucs2_strsize(name, EFI_VAR_NAME_LEN) + 1;
@@ -681,12 +668,6 @@ efi_thunk_get_next_variable(unsigned long *name_size,
 	return status;
 }
 
-static efi_status_t
-efi_thunk_get_next_high_mono_count(u32 *count)
-{
-	return EFI_UNSUPPORTED;
-}
-
 static void
 efi_thunk_reset_system(int reset_type, efi_status_t status,
 		       unsigned long data_size, efi_char16_t *data)
@@ -788,13 +769,10 @@ void __init efi_thunk_runtime_setup(void)
 
 	efi.get_time = efi_thunk_get_time;
 	efi.set_time = efi_thunk_set_time;
-	efi.get_wakeup_time = efi_thunk_get_wakeup_time;
-	efi.set_wakeup_time = efi_thunk_set_wakeup_time;
 	efi.get_variable = efi_thunk_get_variable;
 	efi.get_next_variable = efi_thunk_get_next_variable;
 	efi.set_variable = efi_thunk_set_variable;
 	efi.set_variable_nonblocking = efi_thunk_set_variable_nonblocking;
-	efi.get_next_high_mono_count = efi_thunk_get_next_high_mono_count;
 	efi.reset_system = efi_thunk_reset_system;
 	efi.query_variable_info = efi_thunk_query_variable_info;
 	efi.query_variable_info_nonblocking = efi_thunk_query_variable_info_nonblocking;
diff --git a/drivers/firmware/efi/runtime-wrappers.c b/drivers/firmware/efi/runtime-wrappers.c
index 708b777857d3..2b66efb5ffef 100644
--- a/drivers/firmware/efi/runtime-wrappers.c
+++ b/drivers/firmware/efi/runtime-wrappers.c
@@ -52,17 +52,6 @@ union efi_rts_args {
 		efi_time_t	*time;
 	} SET_TIME;
 
-	struct {
-		efi_bool_t	*enabled;
-		efi_bool_t	*pending;
-		efi_time_t	*time;
-	} GET_WAKEUP_TIME;
-
-	struct {
-		efi_bool_t	enable;
-		efi_time_t	*time;
-	} SET_WAKEUP_TIME;
-
 	struct {
 		efi_char16_t	*name;
 		efi_guid_t	*vendor;
@@ -92,10 +81,6 @@ union efi_rts_args {
 		u64		*max_variable_size;
 	} QUERY_VARIABLE_INFO;
 
-	struct {
-		u32		*high_count;
-	} GET_NEXT_HIGH_MONO_COUNT;
-
 	struct {
 		efi_capsule_header_t **capsules;
 		unsigned long	count;
@@ -232,17 +217,6 @@ static void __nocfi efi_call_rts(struct work_struct *work)
 		status = efi_call_virt(set_time,
 				       args->SET_TIME.time);
 		break;
-	case EFI_GET_WAKEUP_TIME:
-		status = efi_call_virt(get_wakeup_time,
-				       args->GET_WAKEUP_TIME.enabled,
-				       args->GET_WAKEUP_TIME.pending,
-				       args->GET_WAKEUP_TIME.time);
-		break;
-	case EFI_SET_WAKEUP_TIME:
-		status = efi_call_virt(set_wakeup_time,
-				       args->SET_WAKEUP_TIME.enable,
-				       args->SET_WAKEUP_TIME.time);
-		break;
 	case EFI_GET_VARIABLE:
 		status = efi_call_virt(get_variable,
 				       args->GET_VARIABLE.name,
@@ -272,10 +246,6 @@ static void __nocfi efi_call_rts(struct work_struct *work)
 				       args->QUERY_VARIABLE_INFO.remaining_space,
 				       args->QUERY_VARIABLE_INFO.max_variable_size);
 		break;
-	case EFI_GET_NEXT_HIGH_MONO_COUNT:
-		status = efi_call_virt(get_next_high_mono_count,
-				       args->GET_NEXT_HIGH_MONO_COUNT.high_count);
-		break;
 	case EFI_UPDATE_CAPSULE:
 		status = efi_call_virt(update_capsule,
 				       args->UPDATE_CAPSULE.capsules,
@@ -366,30 +336,6 @@ static efi_status_t virt_efi_set_time(efi_time_t *tm)
 	return status;
 }
 
-static efi_status_t virt_efi_get_wakeup_time(efi_bool_t *enabled,
-					     efi_bool_t *pending,
-					     efi_time_t *tm)
-{
-	efi_status_t status;
-
-	if (down_interruptible(&efi_runtime_lock))
-		return EFI_ABORTED;
-	status = efi_queue_work(GET_WAKEUP_TIME, enabled, pending, tm);
-	up(&efi_runtime_lock);
-	return status;
-}
-
-static efi_status_t virt_efi_set_wakeup_time(efi_bool_t enabled, efi_time_t *tm)
-{
-	efi_status_t status;
-
-	if (down_interruptible(&efi_runtime_lock))
-		return EFI_ABORTED;
-	status = efi_queue_work(SET_WAKEUP_TIME, enabled, tm);
-	up(&efi_runtime_lock);
-	return status;
-}
-
 static efi_status_t virt_efi_get_variable(efi_char16_t *name,
 					  efi_guid_t *vendor,
 					  u32 *attr,
@@ -488,17 +434,6 @@ virt_efi_query_variable_info_nb(u32 attr, u64 *storage_space,
 	return status;
 }
 
-static efi_status_t virt_efi_get_next_high_mono_count(u32 *count)
-{
-	efi_status_t status;
-
-	if (down_interruptible(&efi_runtime_lock))
-		return EFI_ABORTED;
-	status = efi_queue_work(GET_NEXT_HIGH_MONO_COUNT, count);
-	up(&efi_runtime_lock);
-	return status;
-}
-
 static void __nocfi
 virt_efi_reset_system(int reset_type, efi_status_t status,
 		      unsigned long data_size, efi_char16_t *data)
@@ -556,13 +491,10 @@ void __init efi_native_runtime_setup(void)
 {
 	efi.get_time			    = virt_efi_get_time;
 	efi.set_time			    = virt_efi_set_time;
-	efi.get_wakeup_time		    = virt_efi_get_wakeup_time;
-	efi.set_wakeup_time		    = virt_efi_set_wakeup_time;
 	efi.get_variable		    = virt_efi_get_variable;
 	efi.get_next_variable		    = virt_efi_get_next_variable;
 	efi.set_variable		    = virt_efi_set_variable;
 	efi.set_variable_nonblocking	    = virt_efi_set_variable_nb;
-	efi.get_next_high_mono_count	    = virt_efi_get_next_high_mono_count;
 	efi.reset_system 		    = virt_efi_reset_system;
 	efi.query_variable_info		    = virt_efi_query_variable_info;
 	efi.query_variable_info_nonblocking = virt_efi_query_variable_info_nb;
diff --git a/drivers/xen/efi.c b/drivers/xen/efi.c
index fb321cd6415a..baccf2d90af0 100644
--- a/drivers/xen/efi.c
+++ b/drivers/xen/efi.c
@@ -76,47 +76,6 @@ static efi_status_t xen_efi_set_time(efi_time_t *tm)
 	return efi_data(op).status;
 }
 
-static efi_status_t xen_efi_get_wakeup_time(efi_bool_t *enabled,
-					    efi_bool_t *pending,
-					    efi_time_t *tm)
-{
-	struct xen_platform_op op = INIT_EFI_OP(get_wakeup_time);
-
-	if (HYPERVISOR_platform_op(&op) < 0)
-		return EFI_UNSUPPORTED;
-
-	if (tm) {
-		BUILD_BUG_ON(sizeof(*tm) != sizeof(efi_data(op).u.get_wakeup_time));
-		memcpy(tm, &efi_data(op).u.get_wakeup_time, sizeof(*tm));
-	}
-
-	if (enabled)
-		*enabled = !!(efi_data(op).misc & XEN_EFI_GET_WAKEUP_TIME_ENABLED);
-
-	if (pending)
-		*pending = !!(efi_data(op).misc & XEN_EFI_GET_WAKEUP_TIME_PENDING);
-
-	return efi_data(op).status;
-}
-
-static efi_status_t xen_efi_set_wakeup_time(efi_bool_t enabled, efi_time_t *tm)
-{
-	struct xen_platform_op op = INIT_EFI_OP(set_wakeup_time);
-
-	BUILD_BUG_ON(sizeof(*tm) != sizeof(efi_data(op).u.set_wakeup_time));
-	if (enabled)
-		efi_data(op).misc = XEN_EFI_SET_WAKEUP_TIME_ENABLE;
-	if (tm)
-		memcpy(&efi_data(op).u.set_wakeup_time, tm, sizeof(*tm));
-	else
-		efi_data(op).misc |= XEN_EFI_SET_WAKEUP_TIME_ENABLE_ONLY;
-
-	if (HYPERVISOR_platform_op(&op) < 0)
-		return EFI_UNSUPPORTED;
-
-	return efi_data(op).status;
-}
-
 static efi_status_t xen_efi_get_variable(efi_char16_t *name, efi_guid_t *vendor,
 					 u32 *attr, unsigned long *data_size,
 					 void *data)
@@ -204,18 +163,6 @@ static efi_status_t xen_efi_query_variable_info(u32 attr, u64 *storage_space,
 	return efi_data(op).status;
 }
 
-static efi_status_t xen_efi_get_next_high_mono_count(u32 *count)
-{
-	struct xen_platform_op op = INIT_EFI_OP(get_next_high_monotonic_count);
-
-	if (HYPERVISOR_platform_op(&op) < 0)
-		return EFI_UNSUPPORTED;
-
-	*count = efi_data(op).misc;
-
-	return efi_data(op).status;
-}
-
 static efi_status_t xen_efi_update_capsule(efi_capsule_header_t **capsules,
 				unsigned long count, unsigned long sg_list)
 {
@@ -280,8 +227,6 @@ void __init xen_efi_runtime_setup(void)
 {
 	efi.get_time			= xen_efi_get_time;
 	efi.set_time			= xen_efi_set_time;
-	efi.get_wakeup_time		= xen_efi_get_wakeup_time;
-	efi.set_wakeup_time		= xen_efi_set_wakeup_time;
 	efi.get_variable		= xen_efi_get_variable;
 	efi.get_next_variable		= xen_efi_get_next_variable;
 	efi.set_variable		= xen_efi_set_variable;
@@ -290,7 +235,6 @@ void __init xen_efi_runtime_setup(void)
 	efi.query_variable_info_nonblocking = xen_efi_query_variable_info;
 	efi.update_capsule		= xen_efi_update_capsule;
 	efi.query_capsule_caps		= xen_efi_query_capsule_caps;
-	efi.get_next_high_mono_count	= xen_efi_get_next_high_mono_count;
 	efi.reset_system		= xen_efi_reset_system;
 }
 
diff --git a/include/linux/efi.h b/include/linux/efi.h
index 50db7df0efab..516afdc8a49d 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -650,8 +650,6 @@ extern struct efi {
 
 	efi_get_time_t			*get_time;
 	efi_set_time_t			*set_time;
-	efi_get_wakeup_time_t		*get_wakeup_time;
-	efi_set_wakeup_time_t		*set_wakeup_time;
 	efi_get_variable_t		*get_variable;
 	efi_get_next_variable_t		*get_next_variable;
 	efi_set_variable_t		*set_variable;
@@ -660,7 +658,6 @@ extern struct efi {
 	efi_query_variable_info_t	*query_variable_info_nonblocking;
 	efi_update_capsule_t		*update_capsule;
 	efi_query_capsule_caps_t	*query_capsule_caps;
-	efi_get_next_high_mono_count_t	*get_next_high_mono_count;
 	efi_reset_system_t		*reset_system;
 
 	struct efi_memory_map		memmap;
@@ -1235,13 +1232,10 @@ enum efi_rts_ids {
 	EFI_NONE,
 	EFI_GET_TIME,
 	EFI_SET_TIME,
-	EFI_GET_WAKEUP_TIME,
-	EFI_SET_WAKEUP_TIME,
 	EFI_GET_VARIABLE,
 	EFI_GET_NEXT_VARIABLE,
 	EFI_SET_VARIABLE,
 	EFI_QUERY_VARIABLE_INFO,
-	EFI_GET_NEXT_HIGH_MONO_COUNT,
 	EFI_RESET_SYSTEM,
 	EFI_UPDATE_CAPSULE,
 	EFI_QUERY_CAPSULE_CAPS,
-- 
2.50.0.727.gbf7dc18ff4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
