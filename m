Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CD5D2445D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 23:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bq2nCUdNUenhn+0qwMkfOevNMnhTN1K8S3VFw3uS1p8=; b=vLSzu6BgAKW88k
	PD02gLbiUen5L8xfD96sJ5brepd7MF9JealPEc/iJFZ1opTBwDZA66vA9R8HJmaUNaPmpmr43FJ9s
	JfAcpqIw/9wzuGyFvJkjKbgjlUpjrLkQ7REH8ti2MnIHUdyoHPs+0xLsHzcC9NMCwap+MNnkdvD1s
	LKbFKE88xdAGB9ZZUrjz4ceNTwM8OZr7TPzaaAg7Qo6yjLOk0LRYk9HCYWdqkhPH/32taXowBUixO
	62iiagjuZ2aN5OZs2EBaZ/0UAvSv8UBuCnZ046bpRZ2lRbFNtbGCmPLxtUzjDuFcVoNB7QaPUtpp1
	gMktmMAqQJ5RzY/9j4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz29w-0000000Ec6I-2S8k;
	Thu, 10 Oct 2024 23:01:28 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsn-0000000Dren-2Rj6
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:31 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7ea0bf14523so1033825a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584848; x=1729189648; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=t4DEWxyHdS8FH8bmPlxV35CavnLWtw4MDWneo+GIfaw=;
        b=3qI8Gw0xZEjRCMSlShvB9CxPYVE+sQUqWY+2lQ3x/hsrogq9AlmlMY0W+xIiiyB2+G
         ivumflW0xs/76E0l8I7fd7bbDdyPLteemqZYYQ+ZKK/YPblG/xVoZuzgyJoRX97tQfwU
         YIGnX9P9pbtCRUkjnKrNiuDGenR/Sjm4DPbwNWZAbMadx+iMNdYcHOHirra/2+DNgg7J
         SV89gZ2MqD3S2NzVbA5KhNlU7zbQKrI9AUvsp4uNOzuM55xfH+GZz5OMQp029NBhBRbT
         1kBG/UEPxC0x7ucQl28rHGPkGDnEsOsIC7omLOZgZouSoX8ld20Qe3dCRqoJaXRUVo6j
         ZO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584848; x=1729189648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4DEWxyHdS8FH8bmPlxV35CavnLWtw4MDWneo+GIfaw=;
        b=WaFBbUo6rmP4OVo6P8ffFTv3oFmhi3u0brDlquvHr8pS8e28BG5hfn82m8vB3AM4os
         XYPXv51NauUbhaBjzM6hj+Gtc6lFpnueMP10UcxKh6xl1fe0qZ/VrDHj75+3aNBEr/Sc
         1rSsX4dGLwdlK2kMAfn6gbrlLKsImtR0HrQ/CcP4pMcvZ+9qVBmwYmJ1U3JxW8XzFDEr
         Da/V4gwHWlaTC1kTpLi9MV1/crJPR+W0NWvE0lUeAn+R4KDaHzDKwv8pE83uAcxXMUtZ
         lf6AIS/ypxnQ28E0Dq8zB2aFd6t5kyJ1FgsEJ6lPfHG5bXKqpcAjwJCWOZZItBTLcV3t
         lYMg==
X-Forwarded-Encrypted: i=1; AJvYcCUegWK3cZViVLaLWwIxIrRF81vdlAEEqCaxFv4SC0zl9aNjl/uT/Lrw/gT8YuZ5yGGmp/yeC0+YFthHsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKM5wFOn3roG4zovA48qi7bO0OQPuhHGVcEFoMGo1Hed2sGqHa
	HAU92pWlYEDtJ2+sxr3N4K7+3TK+OVueo9o0Pe1YeFMy5sjqv4lQ6UuLt2MHotO4Rj0sZhjgw2L
	RTQ==
X-Google-Smtp-Source: AGHT+IHU1NaHt28BJAfE9+Eihx21gIRaHWD3wJUzNDiwOfeaS4l1n7K6hdxyKTp49hAFCJqVbhS/fDDFwRQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:2545:0:b0:7e6:b4dd:fc0d with SMTP id
 41be03b00d2f7-7ea535b0baemr20a12.7.1728584846518; Thu, 10 Oct 2024 11:27:26
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:15 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-74-seanjc@google.com>
Subject: [PATCH v13 73/85] KVM: PPC: Remove extra get_page() to fix page
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112729_704341_5A8C6D23 
X-CRM114-Status: UNSURE (   8.71  )
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
index d7721297b9b6..cd7ab6d85090 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -652,7 +652,6 @@ static void kvmppc_patch_dcbz(struct kvm_vcpu *vcpu, struct kvmppc_pte *pte)
 	hpage_offset &= ~0xFFFULL;
 	hpage_offset /= 4;
 
-	get_page(hpage);
 	page = kmap_atomic(hpage);
 
 	/* patch dcbz into reserved instruction, so we trap */
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
