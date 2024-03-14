Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3950AC54E69
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 23:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=miCg6b6fjWA8zsQHvqIIm7Xu5JpoXf093Lc9q91UReY=; b=O8XcIG2d58DXSz
	Aa1M3pgUV1CjdEmDXXKq5vO2RiIUa/RXgLNl39OptCAFrAko+9cppa/88/WHtFXAuCEYgLNS04/wb
	uU2jerdz2FaJapRqo/sPF3VC8qXw0W65XVOuw2Y11whvXrGfjTWluGmv/733eE31zlkhuJeR0XNSp
	tKBfUgVbk/cbWuro3wKeykeQ+T1iy8S6s5KwP57peTXZLrAIxrLn28ZDfhaaDYzPYCtJNkOiVXQSq
	b2u8NWVfptXsRDZALaA5LnSAwGwzHeTbaCwJMDWTgo7Pyd2mNdOZtIPueV7DqBuZRDmQCODvEjfP/
	ToDO+bPR81xScmjSgniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuUa-0000000G0nD-06om;
	Thu, 14 Mar 2024 23:28:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTO-0000000G01C-1vQr
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Mar 2024 23:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f7mdClvgIXUuf9+yuKM3CelLdMACw57Fq4PBdMk33ZU=; b=PefZrOeD6r1jix8TdiyupVd2GM
	jOlLn0nq3RPnYt+IxdcUf0kGYxxWwK7UijZzPTa9THjf5eIoNHCF/Do9V4E7c0YdfN87/V71tYJAL
	d/u+afcgjAbUGTX+82qNNwNKGMNVXX7iBh/eHcBS2yl9qDk+X63oVSCM6lkDyUcuPh+Thp4NZiNTG
	/nkeLc3mjJxZ6CYSNG46Xm+qT9HuyVTQKoTJ2aHcxIAZ9lxKjmQlPL9iRZLdGBFCPMh3kkax4yezw
	rQ+kttW/Rv/+XkKEWE4bU5o5bm1TXX6zGV4Mymk6C0rzZWGZapRJxUQHZnfSq+TL+yWB8BtINW3DQ
	mQ4sm4rQ==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTJ-0000000Aiqn-3ttA
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:26:52 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6e6edde53cfso625835b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458807; x=1711063607; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=f7mdClvgIXUuf9+yuKM3CelLdMACw57Fq4PBdMk33ZU=;
        b=FKr/UEJz9/6of5OgPHXRYgthS0GtWiFBGb5E7uPyEmZkVyN8sbyYOOxJzGqvhSVvhx
         reG0SitYdSG/pN/szrJbvpQ1NF9mxb+rlNGDsWKYlkVIGPWbi3RHuAOxasYnZuuew46G
         TPvodtRGGR+qSDj6nW/4TzjOWFtY/eUJdCxFoRId1FFfZ42Ahlgt/0WjWyMHyPCYQV1s
         hIqLWFob1TOy0L+UBcVFyzoMJtaI32RVYalizq34znEZeglR47TsGBFUwES1UnU++KEu
         o3NVDBT5pcgHsFGoatZdBI6o9J3wp9NSexXEKwGw4OzBgBXcKn9Osc+m/wGcVuhbndPx
         tgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458807; x=1711063607;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7mdClvgIXUuf9+yuKM3CelLdMACw57Fq4PBdMk33ZU=;
        b=lSu/+Q9JBmOfaQRgXI0+RNmQ5n1vm3Jn4TTzozsV3Iq9irfA7dxel5R7bBnItUurjQ
         WNjdwQgXbx+EVNtqx6A2AN7f9+kbo+IpR28o4lubDHMAh+SKoFZDrCeAWH+m2PMsTTy7
         QQfn/+OoBtLEF3KIm3vv1ZJGh50f0d16Ftzb+0ufo86An87/jBkCNGOsxxygq2nMMYNh
         RNMdQw1nP78SZY46gACbgu5sl/kC2QRkJoGOdODg/dp3/LEE4LfLWClNLug6UN96fk+w
         d5tD4NE83c0vrwWyAlTmOVLj89V4gshN91RCsFvbziFHbzoMAc0Fyvkc7I3y0sFG0I2R
         FpmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaeueLjJv+gbcpychFrePS9505uZ20fV6RQe+KKcj3OEmg4tSsaL1IQIv4A9PYXo+bXrQdxt0xp40QVUxzsT6/24rHhLvFjRF83cipsZSj
X-Gm-Message-State: AOJu0YyfBEDQHSvc/jaKux1gHBalHYVCIT6jiGvcTGBrqDtuZxchQkRD
	dU2QLbKNVF1uNMDvlWU4n/Q4xSmpGSjOXL9OzItp5HjUvLU5LIC/PmeNMVCx+is8AV07e9DTBPK
	dNw==
X-Google-Smtp-Source: AGHT+IHP+9uB+bS3/lKcsyk7/8c0Ce59jwpM+G35vfnwrWKSRS2+iNaQrX8dqel6o4dt3H0Nsgf9UIQa3fs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1a:b0:6e6:eefe:945d with SMTP id
 h26-20020a056a00001a00b006e6eefe945dmr9863pfk.0.1710458807233; Thu, 14 Mar
 2024 16:26:47 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:23 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-5-seanjc@google.com>
Subject: [PATCH 04/18] KVM: selftests: Fix off-by-one initialization of GDT limit
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_232650_648101_B7804D6B 
X-CRM114-Status: GOOD (  10.90  )
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

From: Ackerley Tng <ackerleytng@google.com>

Fix an off-by-one bug in the initialization of the GDT limit, which as
defined in the SDM is inclusive, not exclusive.

Note, vcpu_init_descriptor_tables() gets the limit correct, it's only
vcpu_setup() that is broken, i.e. only tests that _don't_ invoke
vcpu_init_descriptor_tables() can have problems.  And the fact that KVM
effectively initializes the GDT twice will be cleaned up in the near
future.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
[sean: rewrite changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86_64/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 45f965c052a1..eaeba907bb53 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -522,7 +522,7 @@ static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
 		vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 
 	dt->base = vm->arch.gdt;
-	dt->limit = getpagesize();
+	dt->limit = getpagesize() - 1;
 }
 
 static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
