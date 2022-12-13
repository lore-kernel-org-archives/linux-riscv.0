Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8D8C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unK4Gz+OpA/ReFIWQRsVgzUw6G24KDeUDepMY1q3gtw=; b=kEA8hWYD2p5+eu
	GQ9GZU4ACAnLQMCdeNFktHLWOAgDCZG/Z7Wfs00kYSEnKNny58vMb54B86cqQ6dWzOGchl82PZHE3
	HXacUvLjJsBpiUl0YILkxtyNrvgMKJkVREEQXx3KTVhPJsHXs6Bt8dCl95v8qiObV22USXVtK7a5r
	bgZYA5/Dt/7kDaJhPhYn4cv0QxlSbmZ3fNU1qkTJF95DlnZHryp0obGFqUGlodTJ9ta9OmT3hgbmd
	Qz41AX2lHZzTkvmYRX445ky0Gk1nsJuz0mDm2RuePYZrym16gbBlu5Ix1IR5C1TC0+AGkYEXy+GJo
	xEf19UKx2UuXAf5juXVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u9N-008wm0-GC; Tue, 13 Dec 2022 01:32:05 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4syu-00893l-Jr
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 00:17:14 +0000
Received: by mail-pg1-x54a.google.com with SMTP id k16-20020a635a50000000b0042986056df6so8505460pgm.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 16:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=50NFsGS1gSOqQ2w00aLYWRGBkzdJNxkXiT3Fli6/1cM=;
        b=RntXhatCOZ04vpV0zIzdgaGWEbEYWk8Tq2GqIJpFXE4mrCLaeCAJtuH3Pg5qOsSZzA
         1Gqy/YZa0zBtj07ZFJ3tG6JMU4KCwOCm/T5sRILXI0FlH/D3wvVplQBIPjqei4UiNSPI
         a4CMtR25N2guRMk4/FjZQT66KbdmGZvSmJlduBn3hy8nk92rzsUvPrUX7aO4GCwcug4r
         IISJJpierbdfQO0Tx5DjkAG7XdtEDOe0ET8V9SUwuL6ZIfaqYtasTr4PpcRAdWCxFgWs
         Kkr9KxexYZ3AH7JENAv+5XPPnw2pUX56FhSnDCQabgZG3QL18mqbMFLUmMRLOpQWMQ2/
         O29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50NFsGS1gSOqQ2w00aLYWRGBkzdJNxkXiT3Fli6/1cM=;
        b=A6Wy5CPSbnSbHMRbPNg919KpBMk8oYOxByr07bxSWfhG/4lsa69ow84u62auXHvcwT
         s1nX8OIsTEKYmkciKZ60KTW6QB+fg4VK7JhB6+ZrhSenSfckww9erB2L5xuITSHw+M4D
         A6VWGmaRpStPzQ6GcyaBOc7oaDFJRAvJwzqlS4LNMoeme7QZHBVb0Ijfy+ijjZoqK/Ew
         xF5lt4uU5InN6WJaEv6I+oBoGQK8MGfvePx2m0RqkaBIHXUBOwsxVF8jEQNYcAAYfcpw
         xCSMWC+w5cZNw8dmQYFkPMZWkMEC1nTn0lqQfbu+cYWyK3f+rXmPKfGLG0dos3rFsAzJ
         i33g==
X-Gm-Message-State: ANoB5pluz4zgT5Abtpgp5nGP8k0pwP51LS2kCQiN4tvUN64H+tgr+WZs
	96k3KB0W1k6KdS35nYyXC9BsO5Fgwwc=
X-Google-Smtp-Source: AA0mqf4F87lnfsrUQXXGQjwWJclGxioxHjaqJbg+kPkH4OzPOkmZnoLhZ3jfHM5GA0UKCp57pLd7VyYImGw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:2ecb:b0:219:5b3b:2b9f with SMTP id
 h11-20020a17090a2ecb00b002195b3b2b9fmr4271pjs.2.1670890619791; Mon, 12 Dec
 2022 16:16:59 -0800 (PST)
Date: Tue, 13 Dec 2022 00:16:41 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-3-seanjc@google.com>
Subject: [PATCH 02/14] KVM: selftests: Delete dead code in x86_64/vmx_tsc_adjust_test.c
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>, 
	Sean Christopherson <seanjc@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_161712_694601_41D15D82 
X-CRM114-Status: UNSURE (   6.46  )
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

Delete an unused struct definition in x86_64/vmx_tsc_adjust_test.c.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/x86_64/vmx_tsc_adjust_test.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/vmx_tsc_adjust_test.c b/tools/testing/selftests/kvm/x86_64/vmx_tsc_adjust_test.c
index 5943187e8594..ff8ecdf32ae0 100644
--- a/tools/testing/selftests/kvm/x86_64/vmx_tsc_adjust_test.c
+++ b/tools/testing/selftests/kvm/x86_64/vmx_tsc_adjust_test.c
@@ -49,11 +49,6 @@ enum {
 	NUM_VMX_PAGES,
 };
 
-struct kvm_single_msr {
-	struct kvm_msrs header;
-	struct kvm_msr_entry entry;
-} __attribute__((packed));
-
 /* The virtual machine object. */
 static struct kvm_vm *vm;
 
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
