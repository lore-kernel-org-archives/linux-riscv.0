Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0520C3DA7F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJjwb3aMS+Xu13aTf0hwvMkx62hJLeIN8qzLeMQuFdQ=; b=DPA9KvUvT+4sUC
	z14ihrgzA+kRutzHRWcFordM9f/hpONnaAm6oq79AkfL7zFC/eRBacav7Jz4hvp6pGyHmkL+9YWtB
	YDR5vPmLjPDf9bhxB6/KphgHioCBtcHKdptg+UtU8+7WYQhVZozZR/rH2MftQPiuphSZ/PWFP3Xrj
	ctJiSNRwgYL04x8TXSMFyRjpZ0ReDSkFTZGVpQ6bRYLsvQt5CLt25Yi4q/DTTpWB8jvne29LbBxtF
	0H6GO6EB0EEtoEeruSPzuXGP1v/pBiWiBYqs71nThYElq+YlSUSIqe5IKmL9/2gqj5aL1VIFDra70
	7qM34BcbKHz8GnR5ddWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVJe-00000005iXl-3OYA;
	Sat, 27 Jul 2024 00:29:42 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmD-00000005RBW-0ha7
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:13 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc4b03fe76so9985245ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038107; x=1722642907; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Agw1NDopTbJHSwXqEMTAoK1oQKqohLcT4CyuwhV7hPY=;
        b=e5nexWDcr74v5Ti+MHQB4qjptT5ei7vIlrzAr/Qats5fQWJ6muj6YMibrXTH1JuHLA
         CilAF1jvFFBK601Uj17+v4Hop5RaH3v+5fezi1IDydkh6M40E6jAp9W7XW/37ify7Ku/
         4vfnxbHPWWQcWE6gDXYEm8C/qAxl5N7AvN0JPkrjlDtT8LzFXm8uFQVXMYbR04g13rpB
         QgHju7F254xreGdDdluFS2IotbeSJj2+usRAviI+RsPVGgBNQFgqxyolgp2blecAdpMO
         qn7diiJtaqtUaUvskluWkfj9Cjzc4TBeas8RtEQ9OY/gXS1qPYFZ/mz404XrtnrLoB1r
         DqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038107; x=1722642907;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Agw1NDopTbJHSwXqEMTAoK1oQKqohLcT4CyuwhV7hPY=;
        b=SJJxmkW89GhAwrX0n+HEsw6iLUpYNRnG1mKWbnBYL0iy73Fj1R89NcH9TAMgtluezO
         5XWLZ81fewJlTkHrz0hoK+3XpeMJ/Zq4t0gwot/vGjm9XLyZ93brFYfVfEkk6NWUMm5L
         iTlL9LV9hMUytjY8uZlvxgtzV4k38U4rjDfZD6SZA5BQRwBMXVhk/WeK0eOI/xHAHNLw
         9nwUr1Np4XMSqO2YtLrVdAuRi6EDY7V/uuZZ3blnWyMgIN5fJbFAid36Rm9kdJrFkbSi
         K8A8UaZ97Xr7mEFaP8gIPBkm3v8ArQtONDjsUu43tPqxY78YCXs0HTvGpVH4qSMHp7SY
         cvbA==
X-Forwarded-Encrypted: i=1; AJvYcCUzFMBgLqpG8o8sPZUwm+JNOjbUGggBmGvPiJjGbW2fseiECdfotGAW99wxkY73+Co0cabeL8tXwrQyX2nhqlRYb+gjJqmznCaWF0AIvDhU
X-Gm-Message-State: AOJu0YzKhy/fCCrsn5hk3X7iuAPfmJQUm5V3b/6uxgWTAMim7mp0rCFn
	WhWt7hV5wAj9Eh7ezCC5tEsI8FcBkMXVOjShX7cB/H3N3NMpbI94pTErvslWs2+TH5+9c/ucjB3
	a+Q==
X-Google-Smtp-Source: AGHT+IHxZ9LAKt5vIHU7V05HDfJ12gC6skwH/WeW9XOXHpR7B1c0ubRWlOUtq2UiALskA4rClXraM4lFVDE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:b18d:b0:1fd:8ebf:672c with SMTP id
 d9443c01a7336-1ff047d8f61mr25415ad.3.1722038107293; Fri, 26 Jul 2024 16:55:07
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:21 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-73-seanjc@google.com>
Subject: [PATCH v12 72/84] KVM: PPC: Remove extra get_page() to fix page
 refcount leak
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
X-CRM114-CacheID: sfid-20240726_165509_426701_73849B54 
X-CRM114-Status: UNSURE (   8.89  )
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

Don't manually do get_page() when patching dcbz, as gfn_to_page() gifts
the caller a reference.  I.e. doing get_page() will leak the page due to
not putting all references.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_pr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 1bdcd4ee4813..ae4757ac0848 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -652,7 +652,6 @@ static void kvmppc_patch_dcbz(struct kvm_vcpu *vcpu, struct kvmppc_pte *pte)
 	hpage_offset &= ~0xFFFULL;
 	hpage_offset /= 4;
 
-	get_page(hpage);
 	page = kmap_atomic(hpage);
 
 	/* patch dcbz into reserved instruction, so we trap */
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
