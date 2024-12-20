Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E4AE77184
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 01:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Vh2hi7SpG2z37s16ZqbfAY0tNR6a3xH8b2tkub3Ezg=; b=VV9i8rekAm5D+y
	+02NFbrQrLaqehHW6vX6ERpAvyworjhySLvFC/p3qQqXKAdEIXmOffEHH5BiKMQ7/okcrYrUuUXij
	uHjRP6MRMDvWSoi9f9ZCMDxMKlyrjnPZ5VSEIEN2aej9zfTsPw+P4mSmkiCmBZCT1gdmoWSjcQE16
	nK/1alyAWd1jSl7ATocyeeI60H+d9SvvhYtgMpwcOttM3iqDVO4xTqi2hlTcWg4PNSTiL5IY8++hZ
	8lVq2wIOGEP+pQrlUwVS12vAEP9Oe/slSvIwuBtvzkeFjLsfO7Lp8u+nIdkKXerU/8J2O+FXhRz72
	tPwvZBeeesMEUUhKxRSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOS2N-00000003e9I-0jas;
	Fri, 20 Dec 2024 01:42:43 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORyz-00000003cwO-2Xs3
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 01:39:15 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2162f80040aso12425605ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Dec 2024 17:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734658752; x=1735263552; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VJst1sRt7o765YHKTsyCLHu+qBA9pewJkWtnndgMLN0=;
        b=EQUSsGcrzBcoPbyjmmYM5Di9G5KIK5aIvTZD88/cuwPC3+PAQ2x+tyZOE80kKxPsdE
         /jWfp8106rWK8pYOARsMmFLWZ9LigG0gjsqFkNC8/eHn60xd8/zpFXPlC8IhTTxc0XA2
         MN1VZevsu+TMWwn3fUDEVfPE2MNeCtCSaFrZ2L4YOo8wMLbPGvBN6+Pgu0MKVAPCGdvo
         tYNKyh3TAMlLlmR7ymoGrgUoLqL+3OrmlODfYa+E+U68MK98CyjZQGVY/tm1QKkbOKiH
         TNjciH7pxOUQzfxyd7Hw9OJlF/hBf3waD2tOGTrniNYw2pie+8fg51tg166eUr4bRyd3
         Pnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658752; x=1735263552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJst1sRt7o765YHKTsyCLHu+qBA9pewJkWtnndgMLN0=;
        b=cW4WfsEQxF7hWfwUEQ1GssPF9mZKTgu4wABn7qxceXJiW1mXT/+JZH1m4EZc6HDPtA
         6deSxOnZLst2BXrNNKJmyICXboff+ZweTPhA0JxxH0bdJfiqM16Xqdmi1tPAB6ChBoWc
         GJMt9KnR+OMqqS2YXuZyt86z8TZyMTLfIAJaqlxGwhp3dtUU1irxx6Y3CM5fVG4KExLZ
         2EX6c4WcYp7ReJqMAaUoXJr/BR9S2A3vMtn9A0ShF5WcBR3vWCGamuk8/PyFI9kYajLe
         mztyER1A321pqJ20s8c94eXYlIJR7CQLtRmuXwBIv3il9sC9slSdlk3/MKBzFNzINNYo
         ZzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw8kMILw7/RXJkpuq4K430IUVqEsFtNCB9Cy3iHYgatbUxn7gHCF0NE8gb2hNNgfaMJBXconroowqpKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJx7wmXB7nB4xdtuTtCVxzeng1fnBixqXBZb82nFDtpWWZ4Cd7
	6NQai0pCG1P5LPAZ3bxzG9ebAS/3mycPqCxiB48ErgV9U1A9Flw9Mh4euF3Qbn8VVBJh8U9ZNQJ
	dQQ==
X-Google-Smtp-Source: AGHT+IGsWQbkvzY4Nq8NW+TxgBWjNbfzrSia5xRKbrBdsJJ8VjsmNkZOW2nxKqNkxRXVufnLriMmB7/RPeQ=
X-Received: from plbkw12.prod.google.com ([2002:a17:902:f90c:b0:216:3e9d:6bc4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c406:b0:215:854c:a71a
 with SMTP id d9443c01a7336-219e6ebb68dmr11030635ad.34.1734658751894; Thu, 19
 Dec 2024 17:39:11 -0800 (PST)
Date: Thu, 19 Dec 2024 17:39:00 -0800
In-Reply-To: <20241220013906.3518334-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241220013906.3518334-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241220013906.3518334-3-seanjc@google.com>
Subject: [PATCH 2/8] KVM: selftests: Close VM's binary stats FD when releasing VM
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_173913_641188_7786D1DD 
X-CRM114-Status: GOOD (  11.93  )
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

Close/free a VM's binary stats cache when the VM is released, not when the
VM is fully freed.  When a VM is re-created, e.g. for state save/restore
tests, the stats FD and descriptor points at the old, defunct VM.  The FD
is still valid, in that the underlying stats file won't be freed until the
FD is closed, but reading stats will always pull information from the old
VM.

Note, this is a benign bug in the current code base as none of the tests
that recreate VMs use binary stats.

Fixes: 83f6e109f562 ("KVM: selftests: Cache binary stats metadata for duration of test")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 91d295ef5d02..9138801ecb60 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -709,6 +709,15 @@ void kvm_vm_release(struct kvm_vm *vmp)
 
 	ret = close(vmp->kvm_fd);
 	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+
+	/* Free cached stats metadata and close FD */
+	if (vmp->stats_desc) {
+		free(vmp->stats_desc);
+		vmp->stats_desc = NULL;
+
+		ret = close(vmp->stats_fd);
+		TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+	}
 }
 
 static void __vm_mem_region_delete(struct kvm_vm *vm,
@@ -748,12 +757,6 @@ void kvm_vm_free(struct kvm_vm *vmp)
 	if (vmp == NULL)
 		return;
 
-	/* Free cached stats metadata and close FD */
-	if (vmp->stats_desc) {
-		free(vmp->stats_desc);
-		close(vmp->stats_fd);
-	}
-
 	/* Free userspace_mem_regions. */
 	hash_for_each_safe(vmp->regions.slot_hash, ctr, node, region, slot_node)
 		__vm_mem_region_delete(vmp, region);
-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
