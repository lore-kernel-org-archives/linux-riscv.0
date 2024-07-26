Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9749CC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aa6KC2LNi/Jpgh2z8FHwocSXhBuJzuMa8mevFPzJkOY=; b=vRC9eDUS0Pshg+
	vjrhaU2FOF3WQ+/DUsIt/KNyLuJxjHK++9VvYvq6WBYYyL2zPdBRB7/5dKUFFg8iI/+4m6uM0mkIM
	9qWdpNttXCv8V80/QeAGkjxEsQuOLfd9LCD8n/MyXAQC0SwXrb67BhCyFqnWtpsrGvWjyEv8bs81v
	t6WukJs8Bg5uQz8o8miEdZm1zUCzTVivnt2UE+kCqWbkplGejnxnn1ruSG9KhmQKJ1BdtEt3TPF3j
	J/GZ1iiTAg7R9wxO6hqNZXn1lS3D5i04vUSDSbc+usaZQppxIaPbDc+53r/1aEk4n7NVG76xWMARS
	qHcBpl/2A2W89UP/awyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUtj-00000005VNJ-1wer;
	Sat, 27 Jul 2024 00:02:55 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUka-00000005PmS-2sYz
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:30 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc5acc1b96so12420515ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038008; x=1722642808; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Cx2uwWro3wQxHPvpUbBfNMOIaJj2wri0zL/P/0Je2BI=;
        b=2bhxiL5BzFvTkvLsIt7pjb9YnEj55l6mB5Zd/auzgNj6QSNWI9GtXQn3U2moj8kJMT
         jDVxOTjGoL+sd35pvj7UGxrO0yHNQmwN7iahbbXZAnkJN+Vd6jbHx2Am0ohqPw50f3Ix
         QP2PHybsjCqePHF/HLm+Ba2zzSn3eDdlo5UNJBjZG7/E75bSgwxNc1P6V9QxHJQxUjsC
         dy4wi56jADVjKgL4yFsKDJZPhJHjOrBPX3DXYUd06+3B3rAftvKLp4iuIhu+skxcB+Gp
         xtgOjQme+JHjQUc22m6b9F/6UzDBg3yJjV2If3RJr21+vAZ9X2XmKwlBtmEtePh7DVUN
         KTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038008; x=1722642808;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx2uwWro3wQxHPvpUbBfNMOIaJj2wri0zL/P/0Je2BI=;
        b=jZeodB7QQQ8SMRqIyS1ZxSWXS+XddWvmBRZ1kjAZGtPSNiDzGffSLX/RG/8vZINvcU
         9RWpDAjaPj/Q0aHcjG2zKb+4TxwV2lPm+JBbPG65eGoTQR8d4wY2tPNq2jHAg5kK63uK
         fnGU6rByBFEkb9dCg1qb8LTz05tQbwt3gmJcslh0jNHkX1tEoF0uOTlFKh18vy9HmPjC
         yZ5Z73xJJ8gNPlMsuKvrA3gp7YWOYTwYZRYwajTg2GE05tY/0JJCFTFPCGVXj/+Cnjur
         srKk4PHTh46/BdshH02HFtl4Ebx1Xrp08Ycr2VpTmDOl+L2Hsgjqvz4nHcF9GN9sW4jM
         TkYA==
X-Forwarded-Encrypted: i=1; AJvYcCXFxOOqotzloY9CvK63GAdDTWzyqKppfnp1Gf7hxl6KUzMq6ioYtlvb/cRS0iSBwUTP32VlckVuNRmahOZseBzGk3SehtJK7oqJByFZSzcY
X-Gm-Message-State: AOJu0Yw8IJCg7xd6+FLzxBuyq2qz6nuYXD6HAORVwLT/02+hGTklPSBB
	QvR+cpNd8MpcSk20ZFXi7LZP0z7l2KWLvgOPRI95kravWqxRBgYJ1X6RvISOV6b1WhupolmdQ4Q
	fww==
X-Google-Smtp-Source: AGHT+IFyTmAdCKGjl4Efd/ur3Lgpr5WGUo8BVtVPeI74QsMUPNsZhPnU9qRmgrxg08u1lYU5BCnREsvFCzc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41ce:b0:1fa:acf0:72d6 with SMTP id
 d9443c01a7336-1ff0483372emr764645ad.3.1722038007284; Fri, 26 Jul 2024
 16:53:27 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:33 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-25-seanjc@google.com>
Subject: [PATCH v12 24/84] KVM: Use plain "struct page" pointer instead of
 single-entry array
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
X-CRM114-CacheID: sfid-20240726_165328_759737_73697D19 
X-CRM114-Status: GOOD (  11.78  )
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

Use a single pointer instead of a single-entry array for the struct page
pointer in hva_to_pfn_fast().  Using an array makes the code unnecessarily
annoying to read and update.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 3d717a131906..8e83d3f043f1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2763,7 +2763,7 @@ static inline int check_user_page_hwpoison(unsigned long addr)
  */
 static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 {
-	struct page *page[1];
+	struct page *page;
 
 	/*
 	 * Fast pin a writable pfn only if it is a write fault request
@@ -2773,8 +2773,8 @@ static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 	if (!((kfp->flags & FOLL_WRITE) || kfp->map_writable))
 		return false;
 
-	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, page)) {
-		*pfn = page_to_pfn(page[0]);
+	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page)) {
+		*pfn = page_to_pfn(page);
 		if (kfp->map_writable)
 			*kfp->map_writable = true;
 		return true;
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
