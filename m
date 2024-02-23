Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC43AC54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 00:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0mrAWHxRDX8/ipa2q9vAUolM+oeMKSSQRBOkplR+f8=; b=CNW8rHF/5zzPX8
	5ZN/rM5duFX/CZPcbjvmA8aam9Ku3beb55WYkl1JYA7MFmvUv6vUzb6axUCZu1MjmeVG8OWt92AH9
	vDzqsPxbT3SSZdEq7mLSqZ1xy4KssbVFBAi47GHzpMMfqvj/LWteDIy4Q6ADBYWigMcbj7emeqUKl
	EU3zXN97b00muTadPz837fNT/Tdt0FZv89MCU9uJAF4oKMDRYEKy4ALHCPHtsToBVTuM9Bg7enHBt
	+dKyRpR7+IHACiXZkJ0gArIZlQi+mdF/6SVMrL3SSxHoSt9FiHuqi8GAXe1HHqwLfJgU+UqR6NcrW
	mBPLun5MietXw6GmGUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJen-00000007Dw0-3Xu3;
	Fri, 23 Feb 2024 00:43:17 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJeg-00000007Do7-3fV4
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 00:43:13 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1dc30bbb7b6so2411345ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 16:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708648984; x=1709253784; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=S8c8bYa8F6WSgYnQg5Ml3mIasYavsfmgJ65i8xz9FOg=;
        b=2KKovGKSSV2EppcugG5u8eUo7aar8SJStVl6HAQtxx9umFuq9zn9VblZWsrxmhB0Tu
         QHyLSZqrQbLcKm95mo9lsa4JtAq8dXaCEv7rWi2WSZMcQsj46JyyUD0NeTnvFiosX/xt
         fQ864tRQ5tbEfh0FcImyxrg6L1vjZCsBviKcpbxt3+Boam9iBRUzt6d2Wy6I0HRcDhhu
         W4IXdUE6f3rdMzJnpDGyA8dyPMDT0J44x3Sd4cT1zNLZgg+eVUQ5IK17VA8+9RWScEL/
         G3dnjajdEYb8Rv0tbQQFbQbh/IAw+Bm4TQdNyKE03ogXXmygcbpGRlCyJW7uIre0eCz3
         qHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708648984; x=1709253784;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8c8bYa8F6WSgYnQg5Ml3mIasYavsfmgJ65i8xz9FOg=;
        b=WPemVjU6+Tl5YDuJDUjFUGzMRpVbu+jwPscT0pqNPRTpguDeujxE07jOqNSnOZXEAT
         gWzczOMsHQ57V+TUDOI9Ynxr/y46zo0Mmc1xVAWTWKdVnTpjIFgOuiK1FjATKHKoEPKv
         cDhPtrZdcMTbCq+VyFR415cWSVMz5kiX2FyFx8iJjNvJDXlU3NYg4EZjUwNgwzK6j6K0
         wEFqt0Hh5h1edRkQHgJWPOxkR3D8KRDzeVEv5q7/rkQ8pV7sVbfz24a7Xbi81bzSLeBm
         wBdJWvDcZwbIu78KuPMlfeIgfxc1NmoAF1goq+Xwtt9/Dyoa757e+NVtFJeJQlvqWozV
         /AXw==
X-Forwarded-Encrypted: i=1; AJvYcCXCH6sQO5983g3HcNaefFEUvg/Sh119AfGd8/camQoNVzjfyuC8f5JxsKi9nJeChI/y7Qo1ui5RbzYq92KOV9BJ/vgaAU/iVDZbhCAYOIEs
X-Gm-Message-State: AOJu0YwbXg1kTIQVG5ZvWVOGupxQzgRyoEkqFQXD4pIFdIzbTAOQ060q
	lB4ZKD26Z7+zjc2x5FG8CvOlFFaGWuD/t0yGsMsI7QORftm0wiua8B2E8i70ebppV5KhmvXxj7j
	ekQ==
X-Google-Smtp-Source: AGHT+IEpcCEeeYEZT1g6/yIIR7SqlJXRiXUY/d+cOATbynjlJc6ZG004EnWI8Es0Ckg1caDaoicixhIztHg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d2d2:b0:1db:d810:89a5 with SMTP id
 n18-20020a170902d2d200b001dbd81089a5mr26791plc.0.1708648983559; Thu, 22 Feb
 2024 16:43:03 -0800 (PST)
Date: Thu, 22 Feb 2024 16:42:48 -0800
In-Reply-To: <20240223004258.3104051-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240223004258.3104051-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240223004258.3104051-2-seanjc@google.com>
Subject: [PATCH v9 01/11] KVM: selftests: Extend VM creation's @shape to allow
 control of VM subtype
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Carlos Bilbao <carlos.bilbao@amd.com>, 
	Peter Gonda <pgonda@google.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_164311_005656_68A9ED67 
X-CRM114-Status: GOOD (  10.68  )
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

Carve out space in the @shape passed to the various VM creation helpers to
allow using the shape to control the subtype of VM, e.g. to identify x86's
SEV VMs (which are "regular" VMs as far as KVM is concerned).

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>
Cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Tested-by: Carlos Bilbao <carlos.bilbao@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util_base.h | 9 +++++++--
 tools/testing/selftests/kvm/lib/kvm_util.c          | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 070f250036fc..d9dc31af2f96 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -90,6 +90,7 @@ enum kvm_mem_region_type {
 struct kvm_vm {
 	int mode;
 	unsigned long type;
+	uint8_t subtype;
 	int kvm_fd;
 	int fd;
 	unsigned int pgtable_levels;
@@ -191,10 +192,14 @@ enum vm_guest_mode {
 };
 
 struct vm_shape {
-	enum vm_guest_mode mode;
-	unsigned int type;
+	uint32_t type;
+	uint8_t  mode;
+	uint8_t  subtype;
+	uint16_t padding;
 };
 
+kvm_static_assert(sizeof(struct vm_shape) == sizeof(uint64_t));
+
 #define VM_TYPE_DEFAULT			0
 
 #define VM_SHAPE(__mode)			\
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 4994afbdab40..a53caf81eb87 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -276,6 +276,7 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 
 	vm->mode = shape.mode;
 	vm->type = shape.type;
+	vm->subtype = shape.subtype;
 
 	vm->pa_bits = vm_guest_mode_params[vm->mode].pa_bits;
 	vm->va_bits = vm_guest_mode_params[vm->mode].va_bits;
-- 
2.44.0.rc0.258.g7320e95886-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
