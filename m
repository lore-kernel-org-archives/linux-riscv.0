Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90F0C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 01:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGuYKGGIXZsilcio9TEmsOYk6pdhUtj54mxgjEO1DT0=; b=0xlGFvUO/gBbhl
	esMKM3EV4hqryrCW/hoBfn+LvGmRE8HYAqH2Is/9e3W6kzvjCRKdnFPvwBA4HZsIjCMZ21LUP7AS7
	T5ikR9aIUhG7wm1O7ImpSvGS477UOGUUFJJQu45qpt4Q6ePVKYEuzaOnGHToAAZ96U+wol+MMtCwV
	ZpyQ42pgWhPH1y6V449Y9bPGdgaZofjNwQHk6Ok1TpWhDIoBOunoJZ3IRBo/0rbwtV0KsQc20k4iM
	7h88/qt6rD2NUL75ZdcooOCIDkZBcz4R4ktKPhPg/rj0NVrDXWn5uIr1/kchozWP1BXY90lMmhrep
	zSbOy4/I+rFigrZsOt2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVnv-00000005nO3-24Vs;
	Sat, 27 Jul 2024 01:00:59 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUjv-00000005PBt-0ZYL
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:52:48 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-70d235e630dso1210008b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037966; x=1722642766; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xiBZUTde5/yOu+VhqaXt4CYe/LeOwSdHW5ydN5gOuKQ=;
        b=C/UvVZLkZ4F6Rt5/HCv5SHiklzFOUg5x++bUB4Zx/yNmtMxOWXgkZ5pdeRwFJrmMS1
         tfksl1URwEirZcfc2oR6J7aEnhWuXJr8O7Us9uVLZppwoJ2gAQ1OvEyg8UEJ+DVZ0b4w
         lUsup/LIqazSvP+Q7T8bWuABqPCGcxNIAN8QEgvk8iJmOdZW1CshL8zWsXUz7SZdXxRn
         XaaKkuO0yvCZjpGCc/7pgb30A8fF6Z4EhXLcabcYekP5E7s8FmSevht1N4v/LcPKWhij
         0D7BkfCMt7YMNcJ4h1KJhG1ZGoUh2E4GbivtRiCZl7SFH3Fv9e4KmCXkKaEtqAzXYRTa
         7e7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037966; x=1722642766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiBZUTde5/yOu+VhqaXt4CYe/LeOwSdHW5ydN5gOuKQ=;
        b=KVFPdOKBg2c3AUzaVCdohn+5Yxc7+bSftS0necKzqnJgxgcxasQmTc9PEwVgUNhLTq
         zIFatgO04vSrUWD9RMMH3i851TdQGsJh3tpLimAJL5gFM7DMpsIcrWUktBPOB9l2bKzu
         mz1wS+GfhfRwCLeStYlCuiyM1G/1HQjHfWoyKBgZgWQrRbgnrJdC2FdaXI9z876UNBlv
         iy9jFMpF0zxQXEv7tdgP+GYfA1kAoAlDcjjyrVeoOpVDwaJxtAHWzB8Ko+2Rz8zbYpfR
         JTfXkiCvi5+KnWa5QG9UXfxoI/QGiK71z6KZ6N9NYAIrRt2tJDTGVm8q6KI1HUHVtYTS
         4L0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7+Jp5vtXEc0TU87e0Nu7ig2eJ+hOa1BZx8GjEGNVkk+0mELvMNA51NSByEM2lLz9f6Rw1DltVCeXRD3iMFaJ7tE+hoeChUgdqP8m9/5Oi
X-Gm-Message-State: AOJu0Yzo9jeDyl1WKhAjTJAI0dAp1+5A1lT6na2NfPbVnwzXQigcy7k6
	BCCArOmKG/JamsJMZnvuVAXi1lWhcdTJY0MbCG8WPeCfz/hDrmLg2nObqAF0TH6yvGFXSSw09D3
	iVA==
X-Google-Smtp-Source: AGHT+IFeDzTSYc0yloJqv412y/9OHddQLGngXAZq8SjSSTQr+cl72qk3J3BVbl3XjHWFKDqTN/CvEh64V1I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8703:b0:70d:1285:bbcf with SMTP id
 d2e1a72fcca58-70ece93a09amr3050b3a.0.1722037965825; Fri, 26 Jul 2024 16:52:45
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:13 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-5-seanjc@google.com>
Subject: [PATCH v12 04/84] KVM: Allow calling kvm_release_page_{clean,dirty}()
 on a NULL page pointer
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165247_271242_DDC6B34D 
X-CRM114-Status: GOOD (  10.57  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Allow passing a NULL @page to kvm_release_page_{clean,dirty}(), there's no
tangible benefit to forcing the callers to pre-check @page, and it ends up
generating a lot of duplicate boilerplate code.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fd8c212b8de7..656e931ac39e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3186,7 +3186,7 @@ static void kvm_set_page_accessed(struct page *page)
 
 void kvm_release_page_clean(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
 
 	kvm_set_page_accessed(page);
@@ -3211,7 +3211,7 @@ EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
 
 void kvm_release_page_dirty(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
 
 	kvm_set_page_dirty(page);
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
