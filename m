Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E80F5A8C8
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 21:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhI2RoJr93IuSpq7mzt81R68/arri3xCVWpBUktmJq4=; b=W1VM5ATjxF7Nlu
	DvMfuysj50hVuBnA2fw/qciXRkWohr27qQQhwoP5abf9thBzWFeciCHEm7IBIb2L0eRdY0nlh8jIu
	tULiH9IbAswgI80r4f4SBJ9Spw1WRyct8Vok9W+6qchoBE3A23KWHMUQOkTI2ace7BiYASV/9YZXL
	w6tRRtH/x1eWSKypsDMEQ8ci+87SNdu71b1FUHrJSV9wzNgt74XhIlNZOLBFlQX+aiDhawOGvRSBE
	Z20MRW739RqVjTRLP+gkCmlOR6Ivh5Aimai0F3ZvnCSOdZu+WnaOyWtpLFjYZSd97CowSljmXJt/t
	DIXgX2YbSwY5UF8PDb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw3P-00000007gjy-3zVj;
	Mon, 20 Apr 2026 21:21:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2t-00000007g3I-3U3H
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Apr 2026 21:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SJ5CEXYUlDO7gWqtPrHpSvURrk9AOobHS7RyhGBvd6g=; b=bwZZXAcjH4ER4kFH14qEp2j6YS
	+K+Mm451I2+ntgspTwFJR/2kxwgQB32PDBrSU4w/B4McYAu67gl6bplp/pT0Mj8fsippR9n4biool
	rLsIPqv1lYr8Okl3Cz6qRKpOL2xxOQitMgxOSREvuRYpC4KHzsjgi4Qq0mUtGYe7VtdIFer93uuda
	QCcfklh8ue9nKT8h9tAjSniSIcE2hTmBmx80CCrDWlxFIDTpkgS9/26XEVIJFbq5xnd5+52/c1JkT
	wiZKtYRfzRA0EdTDMynVwPtuqj7UL9YeeWKoN9bz0TRy2LykSqlpkXWSreMlUSfauc39rX75AMlUg
	TC5i2C/g==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2q-000000093Oy-0waB
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 21:20:42 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-35fc22424d9so6837636a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Apr 2026 14:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720037; x=1777324837; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SJ5CEXYUlDO7gWqtPrHpSvURrk9AOobHS7RyhGBvd6g=;
        b=FQg0KyKQc0Xqi0rPzZRSunvEVw5RAQfOs3UlNsmG4eIHVQ0PZSz33Tt2i3Ayi6OwN0
         dW1tENAVtuX3pCyOClu93UM9J4sLYT3lY0uFKYf8F/OtJQtJkC00v3jOCFvA34tu85DB
         9uVhIQztrCy7eBJO9t8c7j+17foctm/CLLsCwvShPMthL8q1QYN+TeNI6RSisiPqWYaI
         5DrwDA2ZyTLhr6De+7CKFJKK1vjoL5OctPLBUT9s6vwyn3r1MrQ6xPGhHcrpowC7BehH
         tLW2TBAc+4DNJT8++nuUXfHuATlI6iJo+foq10PBkgEpQoujujXu0GxIHqOpkZfy5P7s
         M6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720037; x=1777324837;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJ5CEXYUlDO7gWqtPrHpSvURrk9AOobHS7RyhGBvd6g=;
        b=VobdcGN16+P8ReivNqr+9AwM9EmX84HnVBfsKeN838UtGdyMaAFxV7/YBPjwgUfE7M
         4m3yXnhhiEcYj0GilOJJj8t5es2j7o4GIKRCzM+Pvs7RRBk84uV57vhp1wDXRdPFPYT1
         CKl8zA++9lJkZTRA7plHiIIXVHISx/vkeRSptcEt/y5Eym+Zc0QYdeWTeWanbnBZy9jp
         RXKAyzgMXD0SfpJLCwNRMqGA50hE4NoUFRv3kvrAvKJVmDSkKUX1XT52KD/hvrTWg04a
         FOTsxXyzlPnUXtGPrXKjksPvcgb21fxBKx+3ic48pYhdoo78BvLChmTKyt0KGsZT2qF3
         /xUg==
X-Forwarded-Encrypted: i=1; AFNElJ8/yF1qelKLdb9JNgoJiavMfv+tBIJ8uWo0i0UWmXZMEKQA3CTh1g37b8iaVi8hmqQq30kuXgdowH0N2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0bCDMC8og7XBdk4gzil0+Ucod9vtwulgYd9pKwqfC2Sl3keO3
	kdw698abuLokQTphKXytZaZNH0eCl2s5iQGVsymw3CR0V7MNjtwyxdDyIYK8nY9+38Vwje7P2Iv
	EqejJ6A==
X-Received: from pllm7.prod.google.com ([2002:a17:902:7687:b0:2ae:c8e0:1f12])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5865:b0:35e:27ec:dea
 with SMTP id 98e67ed59e1d1-36140493410mr16500380a91.23.1776720036561; Mon, 20
 Apr 2026 14:20:36 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:20:00 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-16-seanjc@google.com>
Subject: [PATCH v3 15/19] KVM: selftests: Clarify that arm64's inject_uer()
 takes a host PA, not a guest PA
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_222040_279721_FFCF3F5E 
X-CRM114-Status: UNSURE (   9.51  )
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

Rename inject_uer()'s @paddr to @hpa to make it more obvious that it
injects an error using a host PA, not a guest PA.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/sea_to_user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c b/tools/testing/selftests/kvm/arm64/sea_to_user.c
index fb06b9dcb3d9..e16034852470 100644
--- a/tools/testing/selftests/kvm/arm64/sea_to_user.c
+++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
@@ -93,7 +93,7 @@ static void write_einj_entry(const char *einj_path, u64 val)
 		ksft_exit_fail_perror("Failed to write EINJ entry");
 }
 
-static void inject_uer(u64 paddr)
+static void inject_uer(u64 hpa)
 {
 	if (access("/sys/firmware/acpi/tables/EINJ", R_OK) == -1)
 		ksft_test_result_skip("EINJ table no available in firmware");
@@ -103,7 +103,7 @@ static void inject_uer(u64 paddr)
 
 	write_einj_entry(EINJ_ETYPE, ERROR_TYPE_MEMORY_UER);
 	write_einj_entry(EINJ_FLAGS, MASK_MEMORY_UER);
-	write_einj_entry(EINJ_ADDR, paddr);
+	write_einj_entry(EINJ_ADDR, hpa);
 	write_einj_entry(EINJ_MASK, ~0x0UL);
 	write_einj_entry(EINJ_NOTRIGGER, 1);
 	write_einj_entry(EINJ_DOIT, 1);
-- 
2.54.0.rc1.555.g9c883467ad-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
