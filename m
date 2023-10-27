Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D89C25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 18:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTbkL5Jb6ylPkPprtK7MWApiD0t/YH7aaeIEN7rod04=; b=c7l5lVNFPDsG7M
	4mIPaEVUuTYKxoscAeq3duoDYrNUPf9x3kNb4mqhwfndnGahVUCqtYUQJQdn2Ny9BgD+xjB9bbW5N
	9QZFlW0AVBDilAoLoRfu3yFhuN8LFnrnBeTVDAsMz92kPZO+IuBqOH6aTr1UsYorxDgqLKh/M5nWH
	EMJB2XvVVfdWeDx2iAyD0EJEau5gKysibtlQPeJcd7Emu4SaDokgk1Egw6trIVC+9xiWerE8JtC91
	YoShxcnGbm7cLTIakA7a/ptHYE/iGuHpg+E4Wgn0c1Vts0Xw7bq7AwIbtDztpbDn3gh/jRF19fuIC
	vCB2wncm0U8s6NTaPuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUG-00GxSe-0z;
	Fri, 27 Oct 2023 18:23:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRTq-00Gwxz-1F
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=srqr8yeDZlFrvxNrVECKE5xxuDvV2cb3J0BOKhehVs4=; b=CA7EV1tHvm13/OZNRGRq7bgcpR
	soY48t4VUssi59I9kaVyGI8/hrwHFVzy0pxe3PXtuypho+HOLlcdnwjBZUy330BPzD7nWaOCR2IqA
	WkOXDAVE5XALz8y0+xSSeq36/ymveYh/agWP68esYu4z8f2ekCl6nc7aPe74c6hEjqnWYpqLD36bD
	JfArpoXOPmey+s1aceTrFpNM7hR9IIzYoDpGBLuxALtxAEYXrlNpAbMWP7oIHOGNidEqe1qCP/Hxi
	jIsVKvqj+s9FCiRFO1jTiEu23GfAe358qCJb4zcn0U1hMZhK1g85cd54NB3QVNIyEZEWqUiHGgplw
	7/T93ETQ==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRTn-000uUb-07
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:22:45 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c9d140fcddso23365215ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430957; x=1699035757; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=srqr8yeDZlFrvxNrVECKE5xxuDvV2cb3J0BOKhehVs4=;
        b=HJ14ew5tXh6aeqFmuoVamtDmuFaIV35dKbVSrCnfVy248IZeq9fSqdYfCvDYsWjR8B
         h555O3UNruSujj/GdCuwZNo1kGNmQf5Vud++ESHw3hLMfd53F14shW0fWaX+bg7AabE7
         YF8fxS4+YWlfd6Izhzav822B7T6QMoV45+OsFELbIrefIx8J2T3HziWT56VeVf9QZdS0
         I6/LMaPcM9lo7EsSj4vyKuPc+hvxS74qkLGB1iTuEbeK4/5vl4mZY7cFOlICJvFP8zRw
         fCWXx+GmvmuN8L9kxfVbYo4d9jrza83Rq1hZtblm3aYcl+CdfJKD8hS68Hm+IT4W+KUy
         TsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430957; x=1699035757;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srqr8yeDZlFrvxNrVECKE5xxuDvV2cb3J0BOKhehVs4=;
        b=mrqvposkYz9ZcqnXSLTYoN57noKRtmdosdzVJkiU7lFfmddHmKHIUYqEWzTpjOTIex
         QlYfoPeOPoQUWh4FhbZTarC3gM8+rXr8F7k5GkhffFWQx+8fr6z37+jEFBZYY2vpADgT
         6vLGpAxPui8zfxOf6Hq/JH/76B//I0oGZEidB1Se7x9gk2a1mhE0EHvP3fTQGByH8x3t
         oa0AFmIsvwlaPWZ4pQziPAbpvYHB+9cCbWET+/jS7yis3zG9mxLRvrrFO4KuZeSpIxcp
         a4PuU23rKKptFOps3F3kXYhw1JZ5VjFtHmnkpBQlwM+KeC9k7RiKcrB0cc75d6WOxZ8L
         7Y6w==
X-Gm-Message-State: AOJu0YyIr8OUIUZZSobAGlihko4z8g+9EAokL04WMeZRDSx6CIDRcWMg
	3RztD6nqOfCpeX0ES6amvoHpTqc/TaA=
X-Google-Smtp-Source: AGHT+IEgJpE7SXSukSyCmrL3MrLSyvY8980C5XITIQh/pYBdmOorR/VvmfyRxJnTS7i/xC9oBoneiM7iOr4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:446:b0:1ca:2620:78ad with SMTP id
 iw6-20020a170903044600b001ca262078admr60815plb.8.1698430957451; Fri, 27 Oct
 2023 11:22:37 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:21:48 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-7-seanjc@google.com>
Subject: [PATCH v13 06/35] KVM: PPC: Return '1' unconditionally for KVM_CAP_SYNC_MMU
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_192243_361189_2DF2806F 
X-CRM114-Status: UNSURE (   8.83  )
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

Advertise that KVM's MMU is synchronized with the primary MMU for all
flavors of PPC KVM support, i.e. advertise that the MMU is synchronized
when CONFIG_KVM_BOOK3S_HV_POSSIBLE=y but the VM is not using hypervisor
mode (a.k.a. PR VMs).  PR VMs, via kvm_unmap_gfn_range_pr(), do the right
thing for mmu_notifier invalidation events, and more tellingly, KVM
returns '1' for KVM_CAP_SYNC_MMU when CONFIG_KVM_BOOK3S_HV_POSSIBLE=n
and CONFIG_KVM_BOOK3S_PR_POSSIBLE=y, i.e. KVM already advertises a
synchronized MMU for PR VMs, just not when CONFIG_KVM_BOOK3S_HV_POSSIBLE=y.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/powerpc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index b0a512ede764..8d3ec483bc2b 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -635,11 +635,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 #if !defined(CONFIG_MMU_NOTIFIER) || !defined(KVM_ARCH_WANT_MMU_NOTIFIER)
 		BUILD_BUG();
 #endif
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-		r = hv_enabled;
-#else
 		r = 1;
-#endif
 		break;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	case KVM_CAP_PPC_HTAB_FD:
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
