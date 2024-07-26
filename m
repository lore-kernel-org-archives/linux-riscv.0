Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B8BC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2A71YWlXmXN8hNfWfhuxykJSBttCsOD/vTFf6uyWzk=; b=F7xc06SRG7lOHl
	MBv1rAEW/zHw+SxG8GyJfPTseoQoua32IEhCkzD9NVHPgf3BIdE47DmzgdAHn8+orV60brGgLmTom
	62LFNnkB8QKGh2fGh9J0nDo787K4Lcr6IIbVLRRO7/wGclP8oMrjiWddJPXJ6ckULim1Jo8xTVdWX
	IIGramdAet2wUMhNztJ4o6xrPNI78Hf6qw00p1mD/MiN2GEkGhvFLmp++rQDBXEP3QceZX5ec4Ofv
	PZaJ+plraeuB1GA9QmZnhzeN0y0f3RsZ2ZfzvUS0mXWvHlY/w0krZdxjqdoHZmx/Sv9WrKXQgmhq+
	UUuasTFHNrRoKTBvwCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVLQ-00000005jOY-3Rih;
	Sat, 27 Jul 2024 00:31:32 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmH-00000005RGj-44Yd
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:19 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e02b5792baaso429112276.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038112; x=1722642912; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hy7goaarUlwaWZyx1m4yCokRE7UoQ8eGBMKWJ4Hgr8=;
        b=cLUA9EbG95Oxs7i79dWaFSc7DX1k10O3OLzs5TiVpQ2clmyEphzz0i4Un6YYdsPfQd
         UsWHj8pIg23z1hcBtV0RtscLF3qkIqaN9/MixGtoCe23uybTf6vZeFdKNOwkHART1UkK
         wGt49cJMSG5q6u9/CkE/COhpgGvSG/RtG/6o48TspBawhLGgkNKBFDXXPMPU0tmgfFug
         pfsej6XjkHes5ngKSzQMR9H7UR9dPL4yontZ3G4bwsDCDPWhGXTazHk4BFxQ2DP8skGS
         dzRcdQzl4c4ZYqApKHEIZjmFUqpYC392XYddcRtXpSxFW9DD0YND1u6kt0VELgfh9uWV
         4h4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038112; x=1722642912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Hy7goaarUlwaWZyx1m4yCokRE7UoQ8eGBMKWJ4Hgr8=;
        b=M2zSRRRLNq2tLw7XWJK3YY9DVQNUwHo4v31Q6nmccoKqHXlsjWNJrUbq7eQXe6DRaS
         4Ajp0Z6xg+ZAVWkbyelDgOyj40pZw1qbkmR26wg7G1ev7HokcrKTtRfAfyPmCZRtkXmB
         CMSeuu1vBBSG3ZQCMaDRQm6he7Xj1/mfGo1NKkyEqPCIhtU0zO21kIJmHTLcc4dS/H5r
         3qQyEN4BLjLY+NZ83PNQ4CMDZIf3ZlY1HlUWJERchvfD/w3V1mJGk6MphV7xPdxcS2Xq
         U8nSZ0WvfZTWIL1OUTR+kY+J4mMykApT0N9d8tY++sXoif1YFYKC5P4hoCP2zxhiVrFY
         Snxw==
X-Forwarded-Encrypted: i=1; AJvYcCUCeqirhEal+D6r1GOXubBeHmbgT8XkKsV3+cZ6fPVIHvXX1I6Hk1RRyh72NkNsZ5r4DdxVSdz8Es+DEjqhjhqaxjO/KyMzuBMmW/hTBxhC
X-Gm-Message-State: AOJu0YyB/7dS1VbgCxLb0z32mUZLwlzVHVpExHNX7sDmKdyVp8ZcpSDy
	BG8wOs4/bHRSzvPmcn6LGDIObH1Q3UINLZOWmHvVSmU1GLL6amHATxAZ5MXF8w+ZSyzc9b2X+8l
	WkQ==
X-Google-Smtp-Source: AGHT+IH925MpsiY9ahug77TjXa70fcvLwqDVLsDqA/3N0vd70sZBQGqqpgNL91Lx+sGl/PSva06bFRo6+6A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:2b8c:b0:e03:b0b4:9456 with SMTP id
 3f1490d57ef6-e0b5454ca99mr43273276.7.1722038111873; Fri, 26 Jul 2024 16:55:11
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:23 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-75-seanjc@google.com>
Subject: [PATCH v12 74/84] KVM: Convert gfn_to_page() to use kvm_follow_pfn()
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
X-CRM114-CacheID: sfid-20240726_165514_689672_029E52A0 
X-CRM114-Status: UNSURE (   9.38  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Convert gfn_to_page() to the new kvm_follow_pfn() internal API, which will
eventually allow removing gfn_to_pfn() and kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6dc448602751..d0f55a6ecb31 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3181,14 +3181,16 @@ EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
  */
 struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
 {
-	kvm_pfn_t pfn;
+	struct page *refcounted_page = NULL;
+	struct kvm_follow_pfn kfp = {
+		.slot = gfn_to_memslot(kvm, gfn),
+		.gfn = gfn,
+		.flags = FOLL_WRITE,
+		.refcounted_page = &refcounted_page,
+	};
 
-	pfn = gfn_to_pfn(kvm, gfn);
-
-	if (is_error_noslot_pfn(pfn))
-		return NULL;
-
-	return kvm_pfn_to_refcounted_page(pfn);
+	(void)kvm_follow_pfn(&kfp);
+	return refcounted_page;
 }
 EXPORT_SYMBOL_GPL(gfn_to_page);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
