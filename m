Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB3CC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfkHExsxxgcYxbr7Hq5/NfLrQHmBJViVRqUjSFwOP0o=; b=pf6gU1/LAXM4Sm
	KD3v8DygaSKNxGPEFoqNTRlGZ2seLi5LgzN1FA9EChbEGDBlaJ3Kzqz1xEjB2dkdraCqPF0SIeER/
	ymF5V144Ew1948x/xXQEdKs/VViHQ/ynHXY/7zSXLJp04D+IAeCbfxfEPw9eVk6mZDX7Y+CZ+XNJb
	5RbshYr7cP0axWcwR7xfcuuCVY2hS9RJTvA1KrCm0AkYNIJbrzrNRnITz9+cirQkoZoK9IeyOVqro
	AH3HUCagkC/OXEezjYHP2px+djL1wBgWNHHt47rUh1cL9d2qpLhjn/TI6fAAQe0vx42OMYme81e2J
	sYkGMdllTth6UhhgrX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVMH-00000005jrj-2Ml5;
	Sat, 27 Jul 2024 00:32:25 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmR-00000005RPv-2NOj
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:28 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-650ab31aabdso5353397b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038122; x=1722642922; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dTOlfH+mhloY9mYg+/p0IQai80b+6RXS/WhBEV7av3U=;
        b=dlz2WeJdMDVSn0QF2JM5EqHFTTi3/lVh8XhLstjFhRRg6JglfIlf2kMFLDQ3AM9ewI
         L8n3w4EA57DkccusDFhkxvp8TUOcV78Pw1oTScwprBhyluesmBvULgAhYXmS0mhd36Sg
         pmJPVAta9EmSFUcaLAaRwvpPJPHuLkQCKpCQtFqnSux5gUyFQuiNdOfupZ4OAjDVlCoa
         8WNK/eotizs3VYgMuNZEvubQiCB9+Eqa2zFZJ8euD0DHf189k2p3VPLTlGVIZnKdlhq5
         XmG2zIRE3reeo5AcObRl/+eH61qd44wFO9H0k4letPuzhqqxrfy/ffO69JEddMWjZOYd
         S0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038122; x=1722642922;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTOlfH+mhloY9mYg+/p0IQai80b+6RXS/WhBEV7av3U=;
        b=ALdxZh1WP25xUEJ0V2T5kVI8TJ0/ohPo0DNIW6C8yZ9tilx62VsAdJM0lyD2uenMRX
         xpHtr9raqC3FVjOH9MoKCKf1LCtsyaMB3RnrqgOuBAd/UJIaHdLwR7JYDc2VhAPM0EsG
         msmYMqjgMUjQ2i05zzktxNaEkB8js3vSYMcBD3RJ5yjLhKIVMvB3GHaBXVnffi0JcCDF
         0DvMvjTlEloFnzvpCkMAQ0lmzPMCavmpYc+7tAxtZ9WRch0s+55ULGiI4AOXo44almeM
         8splIWmAO8iEAtkzdVTonH2YpS9JpjA0ph5gxyt8oqJbEsQUwBPDChKJ2xWZk6ZkNe0t
         4iEA==
X-Forwarded-Encrypted: i=1; AJvYcCXEkZu2VEO2XwfwE9nWOjfv7YxQ3K2GwHtKNz4zafWe6ZeJwNeg50qRclAi4IgNnsn0Z2Z+H+BZS2VA/y34m+Up1xfJ5Q0aPGW24uHqOg/2
X-Gm-Message-State: AOJu0YxRZHJobiYkQ4gM5XGqC5epfAT3oN0cll0+FJTqN2yq2kkoxCBu
	KHc6bK7wWAUq74LJvP2nLVtahxqjvpqOuRc6+ECo8sIAxWLzMvdGKMPFoAQM41NluFR+qCiUb64
	mDw==
X-Google-Smtp-Source: AGHT+IGgifSFTGz9fVU5jdzVocA5wMp2MITnk/v5MkueXs++Udesz0kCsEkHm8VEDJpbtR+Hv7uv12YKgg8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:f0a:b0:62f:1f63:ae4f with SMTP id
 00721157ae682-67a052e5dccmr429907b3.1.1722038121721; Fri, 26 Jul 2024
 16:55:21 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:28 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-80-seanjc@google.com>
Subject: [PATCH v12 79/84] KVM: s390: Use kvm_release_page_dirty() to unpin
 "struct page" memory
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
X-CRM114-CacheID: sfid-20240726_165523_776933_E2757650 
X-CRM114-Status: GOOD (  11.50  )
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

Use kvm_release_page_dirty() when unpinning guest pages, as the pfn was
retrieved via pin_guest_page(), i.e. is guaranteed to be backed by struct
page memory.  This will allow dropping kvm_release_pfn_dirty() and
friends.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/vsie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kvm/vsie.c b/arch/s390/kvm/vsie.c
index 566697ee37eb..f6f1569be1cc 100644
--- a/arch/s390/kvm/vsie.c
+++ b/arch/s390/kvm/vsie.c
@@ -670,7 +670,7 @@ static int pin_guest_page(struct kvm *kvm, gpa_t gpa, hpa_t *hpa)
 /* Unpins a page previously pinned via pin_guest_page, marking it as dirty. */
 static void unpin_guest_page(struct kvm *kvm, gpa_t gpa, hpa_t hpa)
 {
-	kvm_release_pfn_dirty(hpa >> PAGE_SHIFT);
+	kvm_release_page_dirty(pfn_to_page(hpa >> PAGE_SHIFT));
 	/* mark the page always as dirty for migration */
 	mark_page_dirty(kvm, gpa_to_gfn(gpa));
 }
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
