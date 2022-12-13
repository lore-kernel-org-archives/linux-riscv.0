Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F722C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4U74/fj3jeWguVZ9KoA8zCJDWa9ZbfYXTb5K137pCmc=; b=OSKouoGahOGHJ5
	TR8SPovSgirzOoDUInwdJabmxl/O60nPl8thM6DNXK60i97csUPIpgplpqPKw8AIiKRjP5YnTfcEH
	FcEZtuyt+pgCWdEeTVXs9EbdE8VDjC+lzb6AjyzNOEvi4dv/wgVem1RqbuE2Y+B5NdkCzt43ILKVw
	wYmZ8Jzc9S83IALaS4O72i0qanpCscQ7mUM0ONl03sjf5Drf099I9ocWZQZ7qExR+noiPYSEalQd3
	Wi1Hcp4vyk4HVFcxK96EyYZ4dqr12evDt28vtrUI8Lkr4HzMZZobe/e6jNYCv8cOiIuks5WMQCXU3
	C6UudiIUfgxkbwC0IBCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u8A-008wHN-EU; Tue, 13 Dec 2022 01:30:50 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4syi-00892i-UP
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 00:17:02 +0000
Received: by mail-pf1-x44a.google.com with SMTP id z8-20020aa79588000000b00576e8050ec9so914153pfj.5
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 16:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=DOvY7w0rRl2MxDLB0k3o2yUeh+erpcmsWDFuA702T6s=;
        b=l9bHJR0oKKynBT27/jXjQ30QimwweOaqtl3QWSLCU6FiFSKCA3rrt+E957wr1zpBhD
         p4waCGA7XG6QFQxmIYOYBakT8OP8vBme+ryoiFdvRCbt7Q2ZtXp4RLmkXlcugdy8NM6J
         MYhNQigzo87mMoFsVV3kq1X4lwNDqM8YgTEc4/zV1HBrccTtlep12cAiKHftvJ9PO0k2
         dGucFeV2hflrJde6Dcxo9dBUuMVUPRQOUE5HkYqU6f8H7eZCPwsf2UIaBzMv3IzDH+uX
         QKFy0hRnovAJqXB4b5KB6Lo+KRVs0lKzNC9qMNzoduiGQCZghvBOB/ql+Wco/Cgp8R+b
         el5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOvY7w0rRl2MxDLB0k3o2yUeh+erpcmsWDFuA702T6s=;
        b=4A6bhnp4xs+52BmP27OXJvRWACThZpoXfMIL/tKsGxTMOUH89mZPtpID2195z9NFEu
         TvZCLJ8lgOJhST46/3RdTdjPrPRi4+8a/Y9CS8ElEamxPQ6qCw19ZjzyCE2gBN7rkGoU
         udwt7fyRauEtKfFb5vE9yBhlmlcj0Mlwjptf4IEdZr0qA08DypE9pAVxL+MkwpYBWxBk
         6Ukyu+PdU4tQCuzM46SdtcxICzkbmIJtA6ET97offstafUcIIquiOkn51Nwozena3hrK
         227tym90CtV0gt8DTY/C72/dekxfJ3wKrP59MkSyZF6m+r5jon5Ml20HtNRSzlHxAjWb
         KRbw==
X-Gm-Message-State: ANoB5plCIF0kQRITWjAm1+TVUjZI7tJzdjcnS+zfRg6z6PuXX1D1nX4w
	qlTo4VHIrqR8TQxeU93W5C/bvdx5V7k=
X-Google-Smtp-Source: AA0mqf4hBxtcZbd9UejO8wqEoLXBgUBqlQprFxOUH1fTAJDZ9Y1ut6pSZnFL0fRAkhQQsou2JfJD4SuBkEo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:9629:0:b0:576:8cdd:3f26 with SMTP id
 r9-20020aa79629000000b005768cdd3f26mr26606972pfg.59.1670890618334; Mon, 12
 Dec 2022 16:16:58 -0800 (PST)
Date: Tue, 13 Dec 2022 00:16:40 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-2-seanjc@google.com>
Subject: [PATCH 01/14] KVM: selftests: Define literal to asm constraint in
 aarch64 as unsigned long
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
X-CRM114-CacheID: sfid-20221212_161701_006765_FD89DC1C 
X-CRM114-Status: UNSURE (   8.93  )
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

Define a literal '0' asm input constraint to aarch64/page_fault_test's
guest_cas() as an unsigned long to make clang happy.

  tools/testing/selftests/kvm/aarch64/page_fault_test.c:120:16: error:
    value size does not match register size specified by the constraint
    and modifier [-Werror,-Wasm-operand-widths]
                       :: "r" (0), "r" (TEST_DATA), "r" (guest_test_memory));
                               ^
  tools/testing/selftests/kvm/aarch64/page_fault_test.c:119:15: note:
    use constraint modifier "w"
                       "casal %0, %1, [%2]\n"
                              ^~
                              %w0

Fixes: 35c581015712 ("KVM: selftests: aarch64: Add aarch64/page_fault_test")
Cc: Ricardo Koller <ricarkol@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/aarch64/page_fault_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/aarch64/page_fault_test.c b/tools/testing/selftests/kvm/aarch64/page_fault_test.c
index 95d22cfb7b41..beb944fa6fd4 100644
--- a/tools/testing/selftests/kvm/aarch64/page_fault_test.c
+++ b/tools/testing/selftests/kvm/aarch64/page_fault_test.c
@@ -117,7 +117,7 @@ static void guest_cas(void)
 	GUEST_ASSERT(guest_check_lse());
 	asm volatile(".arch_extension lse\n"
 		     "casal %0, %1, [%2]\n"
-		     :: "r" (0), "r" (TEST_DATA), "r" (guest_test_memory));
+		     :: "r" (0ul), "r" (TEST_DATA), "r" (guest_test_memory));
 	val = READ_ONCE(*guest_test_memory);
 	GUEST_ASSERT_EQ(val, TEST_DATA);
 }
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
