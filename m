Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC43FC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VEOHgyKHLkEVkPHVDIE+HJUvNwSzOMpATjkPyY6Atck=; b=hB0x0DjrOVIOfx
	hzVsmxT7EPUugV9ErKE0ENP78KaqTV6kAgLvKnCZO2c2FSDBxFu5fxIpOy4encNs6TFveX3QCJfTE
	f6jwBuJ69SA+2eSUj2i0xg6zyNDCwTKkFcsvRN3ZonSMFG0Rfse6SiuWyPLF0I6FQ58G6Enb0TbzC
	zywKr+oFXWuFta0vjPbWU96K3Ms9LhCfNFOm4/1+eV2uvQk5xPJXrwiuR6VG5UGEpzgs+Z/jCQMSM
	WzoLYXcl6RtO4Ql/Z9Sqw/UTq9jWtdcmVvp51cfkNy85sQv5Z3xm42x0XPOH5qOiNR9dP1KD91ToH
	rpuNa7JmTLMC8kymiBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUxL-00000005XHG-3maG;
	Sat, 27 Jul 2024 00:06:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkw-00000005Q6C-1ykE
	for linux-riscv@bombadil.infradead.org;
	Fri, 26 Jul 2024 23:53:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bC28fbRseb42Ch2zMqBFWEix5TOk22ZdgToO+ip0K/0=; b=ktPzItXikVvlfhjUjDSfwA3ul5
	78ILdk9RZyhg00a3So5kF/vFP17f4dYVxf3wg7+WsxuSev4pa+EzFPObXShPDvNUu3CL2TyLpaUJx
	nlk4iU5wmfj53Juqh1mRKNeLomoBZMiO6SZUdVLmIqGZCPcGsS2R6NLoE5g1mJiVJA/fsyd2cHDck
	mgVJy2Za5wyTq/y6CqWNKXmbguJytxBu6ja+dXdBDipfjsdV2gwdOMBtxgE4glHzQQX3LFq07KDaW
	JtPoV0XhZSqYvV9ISK7wMV8mfU9WhTr+9ytgpDuAEIqRPp+j3oLu27pdN5N1Suy+kRVG7e3qsURqp
	h+vHGliQ==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkt-00000004JzZ-0vCB
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:49 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0b2ca2952eso395238276.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038024; x=1722642824; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=bC28fbRseb42Ch2zMqBFWEix5TOk22ZdgToO+ip0K/0=;
        b=wlhR9UHWbRCcQsCk7Qyniuas+4OWywK1BeSXLA4zE78tE6GChzNJdviYi1HSoc6ax+
         d5InN80QZ7NVPje2u+/kGiRgzLMjqD1/uw3IT/pVfIDbPxxubwiIuaMwhEzhhZ1gm5ME
         ADd7f7qw747nrFDjEnX4nRrpHj9GwWm6YegJe/3i7siQiydGWbUr1LRCjrix/y5dpmYP
         WcS/UQHpztxSTruAEyOiyrTIxz6BGeITkWO/cPIRYxpTWSdAryT+ZkD81tYpAxlpUnN9
         IxV6UFPt8AYBHzjxmOkSwTHuE2YVus3/UZPegFqoW6Y7Jmw4lERsEdBZXSVQDm5CTnyg
         lkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038024; x=1722642824;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC28fbRseb42Ch2zMqBFWEix5TOk22ZdgToO+ip0K/0=;
        b=Y/YWNleajhs9SUh2oVRHz6KQeQ9THMLZUUFVtVqFQYmewKf9HAq6+heGL8y+nM8k8Z
         9MR1L6i5QMmGUb+eySLjGhiLv5pZJBKdRlwbgyncEkX+XILDLjIo+XD6V/bjz3yufQul
         4X7t3RAB5LXNForzXMZ4v71DwRbXS790mM5llCvVnV0bh/Uk0ba/BcViTJjB+vliZuZc
         sDYA3paFVb6VQ7ynwgckMBbo4OjCptRNp+yq9GsXfPdajBnHRFyy9i3MFj7Oa5osa/cz
         j5STJWDmPLhlQqO3vwqeMOHBOyOfO/Dlc64qy6XRDc8XJ+5zmJap6DbzYAmHkOixLHfg
         DnbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBjm9a4UGoJ8IZPBYD4lzczbF5OKbJJ3TvTACDDfYRqjyfKuCm5PPsuah725zT3vfb42EQg6WhcC9OFgvaGPX/eKduxXv6O/IMTPYcN0Fh
X-Gm-Message-State: AOJu0YzUlWD+sfYhPbiJOk5hA2xER3+vaHsomgb8k5nNp0ZWyJ+bqG3j
	xTC/u+bqLPTU7NErfP4yic3m/g1l0SqoIz90U0YVh0dKxd3Y8QqFC60XpGPD3vMD94r/RGoLDOu
	Uvw==
X-Google-Smtp-Source: AGHT+IFe6CawsiHghHJz6goDA5MI5OiaYSIvtgnV/oY+y/tLOOW/H4O66kyosfEcqs3UQ2nQeG3uHH/jimU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:181d:b0:e03:5144:1d48 with SMTP id
 3f1490d57ef6-e0b5452490amr2050276.11.1722038023813; Fri, 26 Jul 2024 16:53:43
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:41 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-33-seanjc@google.com>
Subject: [PATCH v12 32/84] KVM: Get writable mapping for __kvm_vcpu_map() only
 when necessary
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
X-CRM114-CacheID: sfid-20240727_005347_445319_D4205761 
X-CRM114-Status: GOOD (  10.94  )
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

When creating a memory map for read, don't request a writable pfn from the
primary MMU.  While creating read-only mappings can be theoretically slower,
as they don't play nice with fast GUP due to the need to break CoW before
mapping the underlying PFN, practically speaking, creating a mapping isn't
a super hot path, and getting a writable mapping for reading is weird and
confusing.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a46c7bf1f902..a28479629488 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3142,7 +3142,7 @@ int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map,
 	struct kvm_follow_pfn kfp = {
 		.slot = gfn_to_memslot(vcpu->kvm, gfn),
 		.gfn = gfn,
-		.flags = FOLL_WRITE,
+		.flags = writable ? FOLL_WRITE : 0,
 		.refcounted_page = &map->pinned_page,
 		.pin = true,
 	};
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
