Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA5EEE0217
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgPwUhJQQyg982qB5Fb6z9CiimJg3R6blKFkP7EGUS4=; b=nIpGkyGNbzWlfo
	yMfrY2BHuiXEc2T4dljPZaRYs4xA1xnS9oM2ieyhNipQaoBiI3yqTazGrdbfxwP9E05SGcMpUqSXW
	MYLq+AjabpBds4Anu2W+QeH6Ea0psJ49+k6/2h1yORlgeA6ujb5axIx6BolNzdI/nIUxZ7lR3YH2T
	OY8lzHbeXwdQ95Ufsum1mceP5bHmTUZcEbhDlZMJ0d0SHG7sB4GEAdXAylMb4qSxszCxlKdSNtEDy
	hMKy9xPrzjTz+kd82c0EEOy3yNvJxLZ9KVAeIqTYWt6UK0FPJ2/EUYauBJIL+S2Se0pFSgDGYahFX
	16ygrAHnyvueDNHs8RyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbba-0074OY-16;
	Thu, 14 Sep 2023 01:57:18 +0000
Received: from mail-yb1-f202.google.com ([209.85.219.202])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbaH-0072zS-2Q
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:56:04 +0000
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d8153284d6eso593468276.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656556; x=1695261356; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3EzYMZ/N2FtmFuyogL5CZw7tscjDCoW1YPbolbcS4Zk=;
        b=QbgoettR3jcYO/pBtuf3sN9XFYagzN5xL7Rdw3IYB5NroWo/kvSoLcrRDPlXb3jANI
         18CKV5eoE5+yFD3OzNCyzi90iaNlaGEVF0JLYSo5KyMF8s7jdkt2Le1FsmKjJW2i2b69
         ySJv8fzlaKkaimlswsYz+SVLFIkickIdVrFJ7e8vXomoExZNzUHc27Onjc8Ft00nlLPR
         avxvOofU4gZTLN3uRH+iEF5OVUNjU6j3/5ZuscWSlzlmbSt+Pbn2P4Xa+iCys6wD3DUd
         hjEM9aOYVbJ+GRulMs6mPDbFZ5mTYqNdtEumQtrtzyHjbnBdDXlKW0R0XGeAE23xfC63
         VekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656556; x=1695261356;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EzYMZ/N2FtmFuyogL5CZw7tscjDCoW1YPbolbcS4Zk=;
        b=IxaaPke8ud8Ypqj2OugWmLu2UHO1e4IhHDaHt33XElCZG1YBfENWySLxAQoM7g5g7j
         z9PIrJ2TjG0WHsJCzV2lDZPy6CwYQFHOFpoynoJKBeLKCGTlq/aS4YRgfUGe7XM4hvWH
         1iHoYeW9GPUngD3Hz/kv3hapk+SWGX7JOw0ynxjXkcE/p41USXB7K+dVOkN7XAwlyUhZ
         /D/14Q5qt0nLqZgXaj/5oCrej3VKMbyFRc73e6JmU8Jfn2+rzJVp7hhgIp5VGH92+4xG
         wvpwkC6Y/b4SPSzAXfxNOAZlZW68ZfuPPjTd+//eXYXU3nZ4HxR7pelCnIG0ZEDzn51/
         XrNQ==
X-Gm-Message-State: AOJu0YzG4myKlV1HmCZOIZBiqG3sRnffJ7HiBmQNCdKXSu2ckEl06urc
	hh/tIpPxEdiiiO7eJ1vnpAm7LeC7gyw=
X-Google-Smtp-Source: AGHT+IG4OY/vWo0x9F6MnIXrirdXq2cFaaYhe2gVdWc98bocPGMoKEXe9xVAJF1f8jZjRLg8FYPwelhBszM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ad87:0:b0:d80:eb4:9ca with SMTP id
 z7-20020a25ad87000000b00d800eb409camr101075ybi.0.1694656555915; Wed, 13 Sep
 2023 18:55:55 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:08 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-11-seanjc@google.com>
Subject: [RFC PATCH v12 10/33] KVM: Set the stage for handling only shared
 mappings in mmu_notifier events
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_185557_809941_0BBC2A6D 
X-CRM114-Status: GOOD (  10.65  )
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

Add flags to "struct kvm_gfn_range" to let notifier events target only
shared and only private mappings, and write up the existing mmu_notifier
events to be shared-only (private memory is never associated with a
userspace virtual address, i.e. can't be reached via mmu_notifiers).

Add two flags so that KVM can handle the three possibilities (shared,
private, and shared+private) without needing something like a tri-state
enum.

Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB@google.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 2 ++
 virt/kvm/kvm_main.c      | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d8c6ce6c8211..b5373cee2b08 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -263,6 +263,8 @@ struct kvm_gfn_range {
 	gfn_t start;
 	gfn_t end;
 	union kvm_mmu_notifier_arg arg;
+	bool only_private;
+	bool only_shared;
 	bool may_block;
 };
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 174de2789657..a41f8658dfe0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -635,6 +635,13 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 			 * the second or later invocation of the handler).
 			 */
 			gfn_range.arg = range->arg;
+
+			/*
+			 * HVA-based notifications aren't relevant to private
+			 * mappings as they don't have a userspace mapping.
+			 */
+			gfn_range.only_private = false;
+			gfn_range.only_shared = true;
 			gfn_range.may_block = range->may_block;
 
 			/*
-- 
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
