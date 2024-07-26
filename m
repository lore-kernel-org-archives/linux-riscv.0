Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5AFC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+nhLZIpgAeDMDyQPzhpd7+VHa/40kAurVgNLAPtft5M=; b=ST00EJS1mpiOg9
	niFSr74WVzbwAuuVO94JCP1sXWJ5XUWORm+FhYK/RE42/5B1qXTuMc2kWOA5owEzgfUOE/iAntyWZ
	djhWgZ/pVDXokGziYuKlQSIOKrxCA6BciTSqL547XLWzNPTboBIgRdF4VI8BtEbPEOkHClneKZY+r
	iZVlP5G33KwgFdJRydWrhtMtsKOrF55aGDPwPfPyviNxp110v+D0jP39qMDHQ5MTZME+IyokC9jHO
	yzszRSJ9y8xC9yjAZOOVWcvopp+xOc2qvHBOy5p2P+SvjiB22phnn4dP9zH1rpuhqui7HiwMAS0Dr
	+jMLKMytKA4INp6gHGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmJ-00000005RJ5-1s52;
	Fri, 26 Jul 2024 23:55:15 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUjx-00000005PDH-2Mt0
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:52:51 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-70d3777de60so1297939b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037968; x=1722642768; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=1PAT6v4tn5ltatT/kjen/UunIT1fRhHnj971W9WBYQU=;
        b=HMSGo54v2C736ldxredd1NWPEBPQFzVNZgdPzH6XIqWfwxtJ8GUx7ZBhWEOXgyjXHn
         TjTbkAUX1+dFtyZjSRH1pzG9XY63Ebf5KLpDur6pBI62UyGjYgn1tUTnHcoytnzwHWLX
         BZ+FuWugPVJ47IS2DUnShAUApuO+3+2OW8XkhlBuXwnghlm8Xg1q1/BCoqWWNoQmyptZ
         QRXBmm9kMpRKl6Dd2X8TTxWC8j4id88kj3X0jgev2MfxMTHD5fGF7m8hhmEYMToSXbtd
         2Itqj6AiObO0CwRy5Au4SO6kmLCiB18w7Ztn6cjOg08qIOVQuRqPAH39FdxM6eMtmZQB
         cAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037968; x=1722642768;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PAT6v4tn5ltatT/kjen/UunIT1fRhHnj971W9WBYQU=;
        b=YzUIzx0AcMFDb1ymbn1dv14rQUlWCa+U2bx9XMEqCVfAuwBN60YbQ48RcodLY0NVw8
         mapygx16uo0UcaprAlzXevMnkCnh1Mz/JEf7VhouukQYPJhkMZJDYXk/8Tivj1LC2BzH
         NewkblGkqwFnCdf9YuJgG6etOTFLmD4CbT4i/C9UPqA+MnpxXPpIuZF5pjl1jTuxJ3wq
         eWARoWm62lLCE89JhUqF3sYgZBAMjEBaFW5a/9CwpCsv7/O3ITMJoaQ7NPGtRGMgpXie
         Tfl8KRPectvCzuN/H7umCLzQGHXYCa1wOyEJIDHtVQp4hkDH/1Xf7CRWs8SSsEF8BHVl
         3qDA==
X-Forwarded-Encrypted: i=1; AJvYcCWqWV7KeHTn3SZdHR2BpL1YpQs1BHrorifgiKEMRpu3SquSObKbXv7f5Mz4i0oEeMEkUc5EGnZbvbmRYpzg09OhCQ6f4GKF3z0POzJcUhnU
X-Gm-Message-State: AOJu0YysPttSKsMsI4CFgmChzhbrUf6XyRAjVLkCrqaVzPxwQ/ramSRc
	LqVePRmQbmUYQ5cA1XOn7MMngPOJwFYKKCINhcOk43l0sboOeBU8NcxIEGSc7UZhfLDIS9pcgBz
	bXg==
X-Google-Smtp-Source: AGHT+IGybwcUaaDWGaRnVlNYMzL2lybkBwi+pdiFBv1toqDzA479d7SifMoC4AbRMiwOqaRTolCzzwjRN5U=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:731c:b0:70d:13c2:1d08 with SMTP id
 d2e1a72fcca58-70ecedb0dfamr2514b3a.3.1722037967857; Fri, 26 Jul 2024 16:52:47
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:14 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-6-seanjc@google.com>
Subject: [PATCH v12 05/84] KVM: Add kvm_release_page_unused() API to put pages
 that KVM never consumes
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
X-CRM114-CacheID: sfid-20240726_165249_660253_5907BCFE 
X-CRM114-Status: UNSURE (   8.88  )
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

Add an API to release an unused page, i.e. to put a page without marking
it accessed or dirty.  The API will be used when KVM faults-in a page but
bails before installing the guest mapping (and other similar flows).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3d9617d1de41..c5d39a337aa3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1201,6 +1201,15 @@ unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t gfn, bool *writable);
 unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
 unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t gfn,
 				      bool *writable);
+
+static inline void kvm_release_page_unused(struct page *page)
+{
+	if (!page)
+		return;
+
+	put_page(page);
+}
+
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
