Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54ECC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3aylV1K2/vL8HYZ8hY6s8QO+D01zF0OZ0txWjRA9OFc=; b=d/LY6h0fSsKlZu
	woBxzmb4DHY+5lYXWBSt3+P40i/ATOWO0dVaz/jSIlP6nEM0scxUBOTawhuDzxncfQIGxuex3rkYm
	g2iKiZKX+4TawvMo8dlxclqFO+AgeP18E8EDEDUkdIqycUQo90RQD/Gav2lmxxik3JWkX5ktEb5Mg
	cb/60fL7ZtA/YR89s1L59r5Rl0dgEeFoD+UFmFOIY3TWAyMK3LijNXex4MdCRmhxM+oxQX47miEwL
	kbcpf8fX1FIpZN31OWZRSvW69tEk21aqLVdqzyYDAYTmVtLsroFUXMDycOY6iGf7YHMNG2HsmOPVf
	7DOEhrvB8QrKDyrA1GCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u6w-008vaa-L0; Tue, 13 Dec 2022 01:29:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u5S-008umi-Q5
	for linux-riscv@bombadil.infradead.org; Tue, 13 Dec 2022 01:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BpGd55nvKBNj0D/PIzME9gJqn/VBcBhffWATlQcE3Ss=; b=EE4TH3nGrBuw1ABgIpGt0paSfB
	flrDZbvJv6jfzSSlEblfTM4eVJpyVTGvdtUGw3PhD/2KEsVKLaiYnTXUOPFZS+axbvZXPsJlJbtJ4
	Z+P2b5FfHGsSr/aFHM9+mylJFickBgz9psWdlZooU56oTxQxwsy8JY5RVENsFcULjOUIiKKBH7j5x
	B6UWjamNlsem4XVdETPt65NDCdmpeg6gLIRXyuvqdrR02dt+2UNE6UAxaFMMWhSBzT7j2hPOK3dS6
	0FVy1TAX9vt3c0/Z3io6WLLZ6nX1fXvwxGINmN+lbTEIE/UGIxzOqfHtwWD8noz4kmcQsymSnv5Gr
	ufx73eEQ==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4syw-009w6P-DD
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 00:17:17 +0000
Received: by mail-pg1-x549.google.com with SMTP id f132-20020a636a8a000000b00473d0b600ebso8610701pgc.14
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 16:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=BpGd55nvKBNj0D/PIzME9gJqn/VBcBhffWATlQcE3Ss=;
        b=MGEbvBziCbhDXrzsRWJnhVDajcYBqH32IEoBgzIYBxRLKK4UKIXh6EcKFK5drrmpEA
         8MEpB2G2jJTC+KB8i8pUeFzabhMjuQrp51rHwAi9WxEkwVgMHq+hx6z1qCeb15tkk+/A
         xfO5l3wFXdCOVXkW9mIm6QIGoiMAxwFy5PqTjEG0lrociwfpJRcZuZCVQ4i6Dbk8e5Nz
         RN09Y8fL8D8Z9FfEVzlTciMOkDUqLCiIJjIPFMWWORLTDCS/wKvw2Usdvvi8wmeo9k3u
         WO7xbVQMKylVOulYnz+qg960NwHouXr7kHgcgEzUSk6QbZe3TdXOp/0yG8ARDmW0T2N0
         gIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpGd55nvKBNj0D/PIzME9gJqn/VBcBhffWATlQcE3Ss=;
        b=qxWTawtLEy9JkALqh0QIVrhwYbbfLciLso1msEsOIX8s2tQYzWlimRK2ia0CMv1j05
         oOX6PplRJaRx1xQ5i6RO4eBAyYmGK3c9earxA9KgVbwRM8cCtbTKyj81LqAmdKMWuRqF
         QcXgIv3pjFMZFnjvVtU/dhRd+GYARibUq9FHQOziXMdC2hcxgG4Fo2XaFa1Rm0Sh4E3s
         KaUfrnoIGJWQz7BZ5mVoFcXxiumsSNRV1qTWIsyPyo43ssBDm2otMvpkPCMo3TYWzbjA
         jSRQ5RLdi8xCAhayj+eZ0yiTM1rgfim9aRdRHfPPevf7Io5PwLuARMfCSH/7axYUoqSv
         YY2A==
X-Gm-Message-State: ANoB5pmBo9rsYfC11Q80lZhpk9rthbjfnaYjyvkLH/3XCxVJdb3mvQA/
	bmxJjKrUFYuscc2L7WlFgOs5lSfm3wI=
X-Google-Smtp-Source: AA0mqf7+dfd4rJNWoSbVdf58/T9pAFs7MpojsQi0gxbLVrmPbLQZm00Z8l7OQhKT1zAZsx9O/p+kfPEMGQc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:1010:b0:219:1d0a:34a6 with SMTP id
 gm16-20020a17090b101000b002191d0a34a6mr4054pjb.1.1670890630136; Mon, 12 Dec
 2022 16:17:10 -0800 (PST)
Date: Tue, 13 Dec 2022 00:16:47 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-9-seanjc@google.com>
Subject: [PATCH 08/14] KVM: selftests: Probe -no-pie with actual CFLAGS used
 to compile
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
X-CRM114-CacheID: sfid-20221213_001714_745181_384D5E00 
X-CRM114-Status: UNSURE (   9.24  )
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

Probe -no-pie with the actual set of CFLAGS used to compile the tests,
clang whines about -no-pie being unused if the tests are compiled with
-static.

  clang: warning: argument unused during compilation: '-no-pie'
  [-Wunused-command-line-argument]

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index c22c3002492d..a6050dcc381a 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -197,7 +197,7 @@ CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
 	$(KHDR_INCLUDES)
 
 no-pie-option := $(call try-run, echo 'int main(void) { return 0; }' | \
-        $(CC) -Werror -no-pie -x c - -o "$$TMP", -no-pie)
+        $(CC) -Werror $(CFLAGS) -no-pie -x c - -o "$$TMP", -no-pie)
 
 # On s390, build the testcases KVM-enabled
 pgste-option = $(call try-run, echo 'int main(void) { return 0; }' | \
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
