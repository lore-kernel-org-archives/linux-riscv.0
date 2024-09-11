Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3091EEE57CF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 20:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=heBk2FNhqkwZX5epKAaRdZY9OyDKnkE7l9TP6MJwDsM=; b=YKLp0UhEO4OgIG
	ASDZA0//YE3BQFXOUrX/v34hetck/KcFxRoZ2AbvkJ8ghZKf/qWaIO3ff6tTUAaVR2dgHVGZmNppZ
	W8iUHHr3E0ao3Ef3IVzdeb1zjJaZISnusyu5KFVmvISH4hkQ169IxigoAaIhcrwgaojeAg0ygRukK
	I82t+8MUAmqGChl+TN3Kwgq3021OGIqYSmF9OIKktse1puzVhEeOpwOourkWCmPVPP7HO43G8Ais5
	ltUL+9l5MxtiJXk3mbdQTxX9vY+m9JVds0NBnX/MFbiYxr1t0s/vqjzdguAs/zfOVZYstUAosF7t5
	bZyhNgYyA7oGiglD3M1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUMK-0000000B0F2-3OHO;
	Wed, 11 Sep 2024 20:54:40 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUAl-0000000Ax7A-2X8t
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 20:42:45 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2d878377fc2so1453697a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 13:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726087361; x=1726692161; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5I/tJcOHFIa65Wz9gc3TwU6W0/w2a3V6j4MGXxqQ3K8=;
        b=RNHWyLGn+//AwFVbSasBWWgl4sMJzlpBreVZKPgwyuCiJlWOabAAVF5idNU+nMbdlz
         ffKwCCX3YQQWkO3WNxGSC2glyEvS8YZ60Mo0lpHtAKPCjJmu1dKOu77acAIdEgN9XGNd
         zRGlqEAkW2VAjHCSkuiXgUDdf0dZ9tRtI922d89qxzoiYfiUxXgiijN66KY6YTFm3ykO
         ndRu+qtQ1PKEuoaesfa+HqSuodwTmXMfIHUSzPQr/ZMW1iwOo6FihT4K1L99zHZTEk9o
         m9Zf85AzIXEf4fdUHWrY1QwCVge2761b+Zv6dpvC9aJxF5zPllaShMNyHw2ibrh16Qh/
         MroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726087361; x=1726692161;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5I/tJcOHFIa65Wz9gc3TwU6W0/w2a3V6j4MGXxqQ3K8=;
        b=AR/10piBLF2LflCntcjzDiybWAaRgJB4iUaG72hFoXmhCu20hrY5DPYklasQlph656
         m/ngG9pif2QJx/OULRRKA+J9+2kLn91GqG9lK1sUYa0LMgct9VApyTsLVwi8Kfa9VbQI
         lzk50DgVqw0SQ3TLayU3HZ8iwqMyfEMXvpRPQ50n0X6VZOiLvggFZ3ggxgTX6GJd2eC7
         UP+piD8EQ10RMIbM/90bTTMzl5DgOrvp6KWfBCEHiRBOz516molwUMbnaiMz5SztlJA+
         EVOtGvjDpNDNFfGDYwbs2RIToKDGOsSRFhRZlbg6nncDnSYNbKXp3QhX1pEgLyklnuvn
         PGQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbRjqC+fVUgWJ4K/tq5LBhBscRd5PL8uVuBlRkbjFHhpnrf/T3Yi+Ewwzbi/5xEB6lPKO37XEWj21w7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlYmRJb5M/VFnf/u97o/c0Bu8UsCp0vdQpRoi7NdKN6+c7i2yT
	MrS63q7gzDnvHFXqbnZPJrFReLTdG8+Whcx3/d0Ag3wLo7rb4bBq+zKAkwwD2XdyZZn3VNPMlQc
	pAw==
X-Google-Smtp-Source: AGHT+IFOw2zNAqVhdCkeZdNi5IKOGHn5wgnynX/KErJqxVULBd4txDltmiT4cacd3crmvx8FKohy/M+nAhA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:6fa6:b0:2d3:b1af:ae48 with SMTP id
 98e67ed59e1d1-2db9fcb47f3mr17342a91.2.1726087361313; Wed, 11 Sep 2024
 13:42:41 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:41:55 -0700
In-Reply-To: <20240911204158.2034295-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911204158.2034295-11-seanjc@google.com>
Subject: [PATCH v2 10/13] KVM: selftests: Use vcpu_arch_put_guest() in mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_134243_669966_76BFBF42 
X-CRM114-Status: UNSURE (   9.75  )
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

Use vcpu_arch_put_guest() to write memory from the guest in
mmu_stress_test as an easy way to provide a bit of extra coverage.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 5467b12f5903..80863e8290db 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -22,7 +22,7 @@ static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 
 	for (;;) {
 		for (gpa = start_gpa; gpa < end_gpa; gpa += stride)
-			*((volatile uint64_t *)gpa) = gpa;
+			vcpu_arch_put_guest(*((volatile uint64_t *)gpa), gpa);
 		GUEST_SYNC(0);
 	}
 }
-- 
2.46.0.598.g6f2099f65c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
