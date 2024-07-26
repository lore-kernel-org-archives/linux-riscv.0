Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13C3C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PErpSbq47QGBwqRw9yb0seF+/P3T9x9XY/h8IFfCmjs=; b=zZ6wWKc1Sj9cyL
	nxbKo0oWzKPUeudyp/GKI+MTgNbQTkA75XAN+kTjT36Pj4YCXtEbIQFxe3+w57v+KL1P9G151jSKG
	PjKnXJGeb3RnpK1p08UV1o63vsSCdzg3+nKq9hBlPS/W2T3NrKJMJ0LdmNgamT/+QKGPJH4MejpOB
	XHL+5m+lz3+Y7i5niFNpU9Ngp+iQjKBGkoowbpjfFnqLYw5zMnVXCqVpWVVnSv3bUJAbyCqeYtRxE
	R7oDtHkpHwJ/CrXsfaf9Bpo6p+bzoYIk3QvUr7kyeFkb9GzhhHTNJ4w4auAEbm0//3kMJlIzJ8Mv9
	PycRnXJvSI2RES/smALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUvu-00000005WZ5-1M1M;
	Sat, 27 Jul 2024 00:05:10 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkn-00000005PxZ-34pO
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:46 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0b365efb6cso398301276.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038020; x=1722642820; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ABkrzr1cGSxzpfOXTkcnfxpngM7W7Byv3yxUL9/Xpog=;
        b=wyE64ImBNbMdo6E0DTERUJzgCvzHeAYGZGutnCKneiUwLYcNVm53aTqAu7fHClgsrS
         GtYbnE6jxLpB+a/yDh6y5oY+X5TSAzRqVlJUTyiNv/lWcm0l7qaxCSXq2X9F+EgLiLlu
         ymJ5mjfnqQHj8ayV1r2PTJfm4bei+VYut6COJDF562CwznPkhFGDqv/ah+CCoMhanb4k
         4nyOP483zqSHkGR4fo5wvw2mCH8w4e5/VKc96KEMIWmZQhmnQ2M3/xRANkQHkyBfnUnH
         38yBsU4Jukdz30a18ZEChMd2XZKmuK2egQvA7AJ/3glgbd8jdBEs5Os9wZk3M2MqTG91
         8S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038020; x=1722642820;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABkrzr1cGSxzpfOXTkcnfxpngM7W7Byv3yxUL9/Xpog=;
        b=Ac8M1ZjmjVqagxfF2JROTpt4NWRWjv5+vke6M/n5msK7hGsQD3v0xUWHuL0aGynSqC
         N9RvVFjZnhy0MZEowTj2sQx7JVV0vvLAzuF/3Kc8Bu/wvvgw9isShJg4mopTTQ6d2uwI
         V0vdF3u9yMp+eP+1+zz5llRKkrtiM1sUdameRggwWjZkdJt16rB3jETc4sdDKc3qeqk/
         hZ7yDtywacdhwFkRFGueYfXg8EUU2xs3NEaJeuSFOC7/SZOGAh+de36jBX0SssUJ/3tO
         GXA7Di+nCEbD4J7VmBsb4oMJQrjIcAfKLSJfTMzckqk9kRVZMDnAAH0n9enwNALn1INo
         61Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXbfE/z+L/OgODcykVNpUfVhjldRL+ULi+DWb0D/UUAZaankG6igsjJ7oDm+sYT4agT0/7T9243XFymmok/0wzeXxEHtlYYGDkKeqN6llX4
X-Gm-Message-State: AOJu0Yy9rcFWGr9bmFECEgtUmNW+yE05Nacslg0mFZNOWmjxeqFmy9bd
	ttfJSd7/dEhf1Tq1tdktSylQm6+cz0BppbYjkHJI/+aZ2s2csJ9E8hfMPjzhcVCWQLkaK+K/Bcm
	bdQ==
X-Google-Smtp-Source: AGHT+IF9e10ucuu5PEDYEm2t1VHH57SvniduNcr3PDVCEbnd2uQ/527xnsEGixiu/Fx7KhH32OKutuDbjT0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:9004:0:b0:e03:b9df:aa13 with SMTP id
 3f1490d57ef6-e0b5455eafcmr36206276.8.1722038019655; Fri, 26 Jul 2024 16:53:39
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:39 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-31-seanjc@google.com>
Subject: [PATCH v12 30/84] KVM: nVMX: Mark vmcs12's APIC access page dirty
 when unmapping
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
X-CRM114-CacheID: sfid-20240726_165341_989311_E8E15FEC 
X-CRM114-Status: GOOD (  11.67  )
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

Mark the APIC access page as dirty when unmapping it from KVM.  The fact
that the page _shouldn't_ be written doesn't guarantee the page _won't_ be
written.  And while the contents are likely irrelevant, the values _are_
visible to the guest, i.e. dropping writes would be visible to the guest
(though obviously highly unlikely to be problematic in practice).

Marking the map dirty will allow specifying the write vs. read-only when
*mapping* the memory, which in turn will allow creating read-only maps.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 8d05d1d9f544..3096f6f5ecdb 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -318,12 +318,7 @@ static void nested_put_vmcs12_pages(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 
-	/*
-	 * Unpin physical memory we referred to in the vmcs02.  The APIC access
-	 * page's backing page (yeah, confusing) shouldn't actually be accessed,
-	 * and if it is written, the contents are irrelevant.
-	 */
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, true);
 	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
 	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
 	vmx->nested.pi_desc = NULL;
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
