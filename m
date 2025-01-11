Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA3DE77188
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 00:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdILnSzejAMjJoM2j67cQixQ++aoQC9lahvuRy4NFQo=; b=Z+O++xAlDpl1VL
	YdL4hOdD2Vx3QSCsZDog5+1zVNW00IssgIJFa4QdgEhhRxSc7gGuH5GptyhH0av+IXFeZoUyyjSQy
	YUFKRa+Hp54PA7vSwAbal2+CwobwEjO/rMG4IaibDdQNcZTKYUhOM62BlfhGTpkAgnsMLKiblQ4Sh
	Md+kX0KHpVGqUN5sdR6rU8+FyqZ+RsXlwNTITS9F/ZDkg65L4FF76wC/neVBy1reIN5ZnclRybbj4
	Laad0S5DcRK04YFbHpvH7bwWlNZY8BRlNKfxnkmNaAgPxEMi/8bav61klAdG0cXd+61KXaQm7N80H
	5KKmhWks6+wtlQIFG+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPkj-0000000HQqW-2eK4;
	Sat, 11 Jan 2025 00:53:25 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiL-0000000HQLH-3wYg
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:50:59 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ee5668e09bso4754451a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556657; x=1737161457; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fmZxaHK89gYqxCqQ02UIn+br/dW4oBYWdpIBYGTzQvU=;
        b=1GWrbGjeToC2RYU4gx/iFiDZRRFfQW96ANC4m+0eucYdwOcHhmqlAZBE3yhR6rcD5L
         DAMUjqb9hwUFXqN2Wp1gSC5xZVKeRYq+4o5YiLFnIuzcYvFxk06S8OEiSeSpiYGCc+f0
         IQUil3r4RxZsdrVLo+ui0xanNhvgWdLL9sAUjLn03NuJgfxDA3IXKeBuhww0KHlQE/Aq
         bdl7mGnLb2xJocv8h4NzP8Wts96SIHwNgRp9WtkoCtUtjWnBzy9oIDNWEc9XY+Hu52k1
         RncJcQn0QG/jmiAT+Yc0R2SbOWZPnAQbcIHQRO8hXwi4cw3R4+i6xDpUWipKWw+CPgCN
         lIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556657; x=1737161457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmZxaHK89gYqxCqQ02UIn+br/dW4oBYWdpIBYGTzQvU=;
        b=AscfwK4gP+jviISVPzAxvE03OlyahD58o+5T7yNZE4y+WI7PaHTA2gTQ9pRcdzPClZ
         XqM8HGEH9FELdgfvPzMDwKxT/ZN8H/TFKBx4rCvjB5vr+WwHEft115VuMWfnsvwxubuA
         D6EwLFyRWTTfhZeZHVRYA8HBAChzRSfR+oCgVumviMSTR6NlFjZPojZR93T/Hg0zgEwd
         fjc1sBMlG4Gb2LMERHckoxc3zlyxZxgf9/psOy1pLj8F8FGA/pxYmO0uuUu2heFu19WN
         TjXNm7gwvrstsgw8zuEJC/y45ge47m1KRTU05Y1Hvn9Lfir9p/uf2a2PnEXHd/pDkanB
         ipHw==
X-Forwarded-Encrypted: i=1; AJvYcCVkNvhf/DnLu4WVKmORMU2oANMsA7RxXwXR4BfLQrPJj+C8ocf/N5SzpAiM1xWrZUJ4ooQ9IWMgFqOsRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6gg9oZfp/B/Sj9m2FKnyp0wrk4cUj2vambdykyk8mow0eZZYK
	aWOJbBKMaiDupf2eAUl2X3xEJggnHdlUjlM3HMMAbmpyUvBjp+kWptrbtlhSqOXxzCCkyBFPCvy
	BQQ==
X-Google-Smtp-Source: AGHT+IEiPYhZFrxECLTpeRyhrniySkHxs86k154WoHT+4SPRvFRx2z0MZkxZdNLfF3LCv7K79vdra9fQLrE=
X-Received: from pjz13.prod.google.com ([2002:a17:90b:56cd:b0:2ef:7af4:5e8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2cc5:b0:2ee:c91a:ad05
 with SMTP id 98e67ed59e1d1-2f548e984abmr17519047a91.3.1736556656714; Fri, 10
 Jan 2025 16:50:56 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:43 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-4-seanjc@google.com>
Subject: [PATCH v2 3/9] KVM: selftests: Assert that __vm_get_stat() actually
 finds a stat
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
X-CRM114-CacheID: sfid-20250110_165057_976754_B3DC1EAE 
X-CRM114-Status: UNSURE (   9.90  )
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

Fail the test if it attempts to read a stat that doesn't exist, e.g. due
to a typo (hooray, strings), or because the test tried to get a stat for
the wrong scope.  As is, there's no indiciation of failure and @data is
left untouched, e.g. holds '0' or random stack data in most cases.

Fixes: 8448ec5993be ("KVM: selftests: Add NX huge pages test")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9138801ecb60..21b5a6261106 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2238,9 +2238,10 @@ void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
 
 		read_stat_data(vm->stats_fd, &vm->stats_header, desc,
 			       data, max_elements);
-
-		break;
+		return;
 	}
+
+	TEST_FAIL("Unabled to find stat '%s'", stat_name);
 }
 
 __weak void kvm_arch_vm_post_create(struct kvm_vm *vm)
-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
