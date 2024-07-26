Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBC4C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnU5yOX8g+SbIyxD26pVEJu5J3q04hitjdq4QVuLIQQ=; b=U+fInhDoHZBrTb
	xX5+/M1izdlnB/vQaBLxQoKk4XpHUKL2/CzHhROHn/BO6hQxaJ4ZFON3b6gtw9Xf2Gx3ztBzZm/g0
	rNVyuwl81yqJXwF0UEkHpZrH7GD287aYmbqDhHvLROCf1u3khAFtBkLX6+62Jxbr8woAYJ2dtXt9I
	qwoSv35aOrHWHPZXU+NLhuSPpkgQlju1gtNc5uz1WshFjNuY6NbZCVpwDKNgsmKZbRwt6HDqWEciV
	7e16yz103sra4HgTeLYXeEdc1QQ3rrHxAt40oFSAVixDEEg/6dQ9nWUzTqQPUdQKbE0aNDI4qBGjT
	Ka+wJJylPIg1Xt0EMbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVMJ-00000005jt3-1buq;
	Sat, 27 Jul 2024 00:32:27 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmT-00000005RRS-0SlR
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:30 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fb116ff8bfso14444705ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038124; x=1722642924; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4JkhtJX/rWB1cBzt9zuFqY6FqfPwx7EIf6/sG5QRcB4=;
        b=MLKVdw5V+Whed1vnGPvWRKhJPSsV57TBDnpeYP8PC9LQgpLuMBAO8jAtp+vCaptgWw
         FUignf03pGkW06O7PhqKJtlEFW79hLOmj2HvYKwKJX4sxu4eCPZDsSYaZ/E7ErwbIVY4
         G6dO58cvROtEduyZPtTBsVpeLDSR//Xdxg7b8rx7Xfai0EHbS3e9XOLOwdJDQczvwo3z
         W0GCT70N6Be0NCUt91M+x82o7oHiq6YV00WiHAB4uk7B3FpR6+j1diWxfT1k5bQft54T
         MTlDJriqVmv8FxOIKR3c4e6FRnW0dY/+m3Jbk7D45wsh91LGN3D+r7AS4SK31rFajAHt
         yQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038124; x=1722642924;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JkhtJX/rWB1cBzt9zuFqY6FqfPwx7EIf6/sG5QRcB4=;
        b=UIHz2Ocb8o80YX4VNtJUeIGd99JrpaYpOVCnC1PwMLupyCegxwjXZbT8jweiGPRi5A
         sSsI0XRlmI5+q7vJp/luHDtANQnJOSkXmPQFNyGtelm/iVfMfMfEZ1OLThqReC3MG27p
         LdLGT+SMnJpErUdyLy6K+/UHU04hlOcAoCEkKuIKdc385fRYaXecvmzBJ45DIfinofyn
         HpwZ40RNA9oXspGRe+H1ILWBmMTwNaUKPE2TVk4NsZBSgaFIrc9p4sW5ZsLwN62SWHN+
         sOk8OVHoanbeKg/CeX7uV9tblcjtSYc0xXe3u3xSnZN8kacDA6QK2ehBicL+FA3Au2F1
         p71A==
X-Forwarded-Encrypted: i=1; AJvYcCU1OkanRQ11+ua4J2tvYXhpmkO6Di5Luu35Oy9bTkqmfXR5uuT5j3CQO6Wt5qiiZ1vCPZC9PTw+8/LUkoKnqD+Pc6faHONuaJeuQ+RCbT/F
X-Gm-Message-State: AOJu0YyvbBCN6eiVhmAnzUXmkSw7iSggUTqwi2U8hr5fm4TLVcPdGArB
	JX3W951vANNJ4bJX2aquMfidnGdpwESjkPO+8dUAsDsoLITOVSKd/5Y6VI0LdqQv7Ojd3BRVq6G
	WJQ==
X-Google-Smtp-Source: AGHT+IFPQa1UjlYj7+Kv/jUhsXC3P8YtU5HtBxuA0lRTgUmwYvAf/3a7bhqWFsOX8QFlAkrWz2XoripRfzc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ea03:b0:1fb:7f2c:5652 with SMTP id
 d9443c01a7336-1ff04893401mr182655ad.7.1722038123783; Fri, 26 Jul 2024
 16:55:23 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:29 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-81-seanjc@google.com>
Subject: [PATCH v12 80/84] KVM: Make kvm_follow_pfn.refcounted_page a required field
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
X-CRM114-CacheID: sfid-20240726_165525_285961_BFD0F5A8 
X-CRM114-Status: GOOD (  10.03  )
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

Now that the legacy gfn_to_pfn() APIs are gone, and all callers of
hva_to_pfn() pass in a refcounted_page pointer, make it a required field
to ensure all future usage in KVM plays nice.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 5dcf3561b829..030a08d4b21d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2844,8 +2844,7 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
 		pfn = page_to_pfn(page);
 	}
 
-	if (kfp->refcounted_page)
-		*kfp->refcounted_page = page;
+	*kfp->refcounted_page = page;
 
 	return pfn;
 }
@@ -3001,6 +3000,9 @@ kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *kfp)
 
 	might_sleep();
 
+	if (WARN_ON_ONCE(!kfp->refcounted_page))
+		return KVM_PFN_ERR_FAULT;
+
 	if (hva_to_pfn_fast(kfp, &pfn))
 		return pfn;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
