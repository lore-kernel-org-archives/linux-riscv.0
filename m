Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0D6C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 00:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A74G0nOK1nmmvp9yb8jVyruQSjeke02Yo4l7fKnQi8s=; b=fX6BV+lgFytiJX
	DjS99DIqoogzjO6IRWSaJsoXJRtAeLDrwbKTRJazX4sj6Fs2rQOrF/hqVKfNGn6njXapi7JPAymzF
	Sex69m+9XW3AvT1GwmduXWuIbiGr75i+gWKCh45E6L9U4VaLelzIG2IoNyarCntF2gGHDGw55O6dK
	7QRWy1pqFfncGipdF9AYIo8utvj+IRKHNy245sGrt7K+/QyHh2LsIN8xaCEcFuphUXgS7iKCPeH++
	+VN4JO9SCg+PoRfSAT/szmdm7S/ZiphtWtaeoblvAQiMv8rvVkiuPW3owubD3df9xUpt9z+JXrbqM
	P63nVQsiPVo7c1xz6jDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4szF-0089II-JA; Tue, 13 Dec 2022 00:17:33 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4syx-00895I-Ue
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 00:17:19 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 203-20020a2502d4000000b006f94ab02400so14733241ybc.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 16:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=M8gKXPtvSnujkFWzKh+1TE/D8A+unHwbuyURFcPqV7g=;
        b=oikR4k/YvNkMbE/UC5Bzf96qpIJXJtiLGFf80pbar3MbSe9xkR02tPegsy1MzPNRR1
         P/fMWRdmCHGRG+4PJC/RAb6f/NEYb7PQ365rsPpPKl8pDpDF9JnKgjnxoUL5hnPz5Xb6
         yoMSKg+Y0gISjOVsP4kt5i2sv2hP5zRNYjcFA15TS+vJvIu+ap5a/9+DImee/7HjS/Yb
         gs0wlNl86pWuU4fl75bzelkmpLN94j1fUy2W233vaON/4saTKkmge9ChxVbDRExK9IYF
         j5TnBzD4rBnxTOTGDNEtCTlBtPdi3Ztq5EGDj1efhIP6Gb2LPLoX+8LsYHJWr3TQSoEI
         LNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8gKXPtvSnujkFWzKh+1TE/D8A+unHwbuyURFcPqV7g=;
        b=jkf1PbgCMTlYFNarO2oh4ElNHGVc0bl2+gjZFXPALx3vqwLSp/Ys8wbkqo4jq7eVy9
         xMINmcV17iFuMoD4xIoqNSHEcW8UEntaKLcbIouSX5Yhys4niGiKbuLGAkHSdXEYcO7I
         rX5XK9pb1Om883P1AQp4x/0mI5k1u11gWNRF0MkRLpa/nqwxeQPtHsgEZi7jkjzOqQ0d
         PFRkagVyRiht1ft10p8fLXVWs3Y3B2RpRcBLUwjsggrVw15c/kpG62NitmwDlPvX9YP4
         qTVtmitkGwCKpXd16ZZBPN8R75kaRUc5zBeUu796jwtcgjElBHgbAF792IZCNRQJ49g5
         cIDg==
X-Gm-Message-State: ANoB5pmcJjSD+R8AOahbMWsgvz5KIlAyidlRu5aEnv/u2UVzsDnOREX2
	a1IrXUlhgt6orJ2VpE+qqdn/gL3UCs4=
X-Google-Smtp-Source: AA0mqf7Q9qI1wDH/dcWjWFM94U57KTqb7jtGhaAh76MhvnBCcz2/FuDXsNQTZH108HtSEVOKNLQckow7PUc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:50cd:0:b0:707:18f:7226 with SMTP id
 e196-20020a2550cd000000b00707018f7226mr10335955ybb.505.1670890625378; Mon, 12
 Dec 2022 16:17:05 -0800 (PST)
Date: Tue, 13 Dec 2022 00:16:44 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-6-seanjc@google.com>
Subject: [PATCH 05/14] KVM: selftests: Fix a typo in x86-64's kvm_get_cpu_address_width()
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
X-CRM114-CacheID: sfid-20221212_161716_060771_621BE793 
X-CRM114-Status: UNSURE (   9.36  )
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

Fix a == vs. = typo in kvm_get_cpu_address_width() that results in
@pa_bits being left unset if the CPU doesn't support enumerating its
MAX_PHY_ADDR.  Flagged by clang's unusued-value warning.

lib/x86_64/processor.c:1034:51: warning: expression result unused [-Wunused-value]
                *pa_bits == kvm_cpu_has(X86_FEATURE_PAE) ? 36 : 32;

Fixes: 3bd396353d18 ("KVM: selftests: Add X86_FEATURE_PAE and use it calc "fallback" MAXPHYADDR")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86_64/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index c4d368d56cfe..acfa1d01e7df 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -1031,7 +1031,7 @@ bool is_amd_cpu(void)
 void kvm_get_cpu_address_width(unsigned int *pa_bits, unsigned int *va_bits)
 {
 	if (!kvm_cpu_has_p(X86_PROPERTY_MAX_PHY_ADDR)) {
-		*pa_bits == kvm_cpu_has(X86_FEATURE_PAE) ? 36 : 32;
+		*pa_bits = kvm_cpu_has(X86_FEATURE_PAE) ? 36 : 32;
 		*va_bits = 32;
 	} else {
 		*pa_bits = kvm_cpu_property(X86_PROPERTY_MAX_PHY_ADDR);
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
