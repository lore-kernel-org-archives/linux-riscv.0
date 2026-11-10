Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4DB606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jJB25xdE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ofy7VUOD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=K/RQvpQDDvCuPZwNEWlS7fPqRPAZQoRWsCqeqjhibU0=; b=jJB25xdEgB6eET0jMySOAqy4xe
	y6mtM5WPvsv11hJJI2N15HpHpH4Jba2Qulfmf+UTkLNcnO3JETga5z7l4xhks7n0GxNCGMvIU98sy
	AR+YxhIp3UTraU/TFWCJLi4MGTIUL6wxbuVM9H7W3EMRJOLHBiUd8xFdoSyFm2KJKPgFD1msV5nND
	8ETjOCP5XcMJ1yIJzGuNHQu0+SYRkKuyH9IS2EaNv1youhrVYnfI675WS4tOaQnzP/kKLVWq0A/NH
	FL3LwEFKA1hoItwJGIXznTmq99v6FFBDD7HMSbomTR41s35pYEvRiSpxksRTzIBznr7gKfpMc9qU2
	WYNMZXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknd-00000003nI7-0s48;
	Tue, 10 Nov 2026 12:18:05 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknM-00000003myL-3F4w
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:49 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4afef353dd2so21117635e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 04:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313066; x=1794917866; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWyWnC7FTB1F4LSiq4vWzvhtzfzrYrtPmxSukIMBSxY=;
        b=ofy7VUODI8l+fDO0S4qVHS9VNrtEq4TFa3yvfxypKXmWimHJSp/G1r2QtW1UtgthCy
         3RHV7R/NheBnPkrXnv068n4u44P4xzLcAQ1sjU+h4D//SddCxeVqlT4H9O3PVksQn6fM
         1l156dMrS/hEd+YrZiSusVb9WHFeSDcYGH94wOswFIf09JBCHYGLTH/iQuHw/AvqMMPb
         9k79dOdyurT2vZJuG0EIEyBlGwUiw4rmKHHQKqzkYFsudt2OGpHJ/QVrvupx2cw5q7uf
         hXC5KAm7sSMQtUyGlTRRHhr20VJJOjXB1wjBaNS5uJYVEDHOp+XiXtZEEwQjd4PhfPJ7
         HVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313066; x=1794917866;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWyWnC7FTB1F4LSiq4vWzvhtzfzrYrtPmxSukIMBSxY=;
        b=F6ounO7efQmatEQ6w2iN6egW43KRjpdJSAggpql38QmrMS9ilmxUgUJARRHfXGRaqg
         EJyCraHxWwxzUOTfiFjhrSWEK8vLGvD2BbEf3Sjb8eGT+jfU72B3/OAFyhT0ruqD6eL0
         rvRuUUlQF9TEyJWw49rKBo/AJbIkxNSX80GVv+K371nV+jqJJokY/MPwOzo8O8faWH7F
         J1k/RICz4ah3okgHcXOhXm8hr0qrowim9GQI8bl4+aa2ux2Brrs719Z9lyEPI7VRki3E
         uSjRU6CovhzBg+6aFIRLoSR7LoX4JDGxilCpzpBrBWiI48h492WdFQZlRgCtmGhfJNMf
         i/HQ==
X-Forwarded-Encrypted: i=1; AL+hErGI5f0TFtrQKY15JMF6w+hahDqzv2gXBNn0X9KovR6/zlAOz+XKjhc9GUyV9zOvSHIf4xRqWIYy4mKcAw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/2stMs9Ze0awl7L5E//T4lJCUwf6Y8GXuHJmorpw2cgUUUgkuO
	DaLYVuaUMIxDlVBTuX1Pi/1hdVM86xEoVASvkapE3vcwztWmO6Y+vIEkoKxioiRu8UUVd5UZWg=
	=
X-Received: from wmbh27.prod.google.com ([2002:a05:600c:a11b:b0:4a1:f1e1:c6d6])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6290:b0:4a6:7d6:821f
 with SMTP id 5b1f17b1804b1-4ba02350573mr44083795e9.29.1794313065550; Tue, 10
 Nov 2026 04:17:45 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:38 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-18-ardb+git@google.com>
Subject: [PATCH v2 06/10] efi/libstub: loongarch: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041748_826191_154563CE 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Instead of exposing individual symbols to the EFI stub explicitly via
the linker script, use the generic struct efi_image_info, which accesses
the original symbols via PC-relative references from the stub itself.

This improves code reuse across architectures, and makes it easier to
add new references in a generic manner.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/loongarch/kernel/image-vars.h            | 1 -
 drivers/firmware/efi/libstub/loongarch-stub.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/image-vars.h b/arch/loongarch/kernel/image-vars.h
index e557ebd46c2b..d8676cea754a 100644
--- a/arch/loongarch/kernel/image-vars.h
+++ b/arch/loongarch/kernel/image-vars.h
@@ -8,7 +8,6 @@
 #ifdef CONFIG_EFI_STUB
 
 __efistub_strcmp		= strcmp;
-__efistub_kernel_entry		= kernel_entry;
 __efistub_kernel_asize		= kernel_asize;
 __efistub_kernel_fsize		= kernel_fsize;
 #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
diff --git a/drivers/firmware/efi/libstub/loongarch-stub.c b/drivers/firmware/efi/libstub/loongarch-stub.c
index c87ac7025107..ab7e73e38334 100644
--- a/drivers/firmware/efi/libstub/loongarch-stub.c
+++ b/drivers/firmware/efi/libstub/loongarch-stub.c
@@ -118,7 +118,5 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 unsigned long kernel_entry_address(unsigned long kernel_addr,
 		efi_loaded_image_t *image)
 {
-	unsigned long base = (unsigned long)image->image_base;
-
-	return (unsigned long)&kernel_entry - base + kernel_addr;
+	return kernel_addr + efistub_kernel_entry_offset(efistub_get_image_info());
 }
-- 
2.56.0.542.g3ef89b7020-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
