Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63C2C00145
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 00:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNgvwSOl61wEZ1G6Y59KaxidDOeEaBOlekiybglK054=; b=dtuoiHLOz7jI43
	3HK3FHIcP0ksbsheLgiseXQ9Xa5vGxa1N0KvFtauc3mHqov0loRLhCZ0pMIcCJYMiMZ+vVpd5nNVB
	J/SvaG3ihHqSwUkq75XorD2/TuS9D2LzDpn9IJMGXPrW8CDBDddBFAnN4koWz9l2qbKW51i8dfXUS
	jL/8zU3LUokLuXCJCOqZFUSFHXiPShrFPcbLTEcOpPAEdfOOxuoHmC7cehVMSJAJ4N0iQT3Tz8xce
	2o4PxO7BRKyfSwm2qkjVBzKR5Mk1Su8BlMZsGo73kTlsBlMQMICSxIGEhQmoIKZFatluddZyiRTMW
	6rSzrU4gduJ8zR3KOjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4szh-0089Wb-8t; Tue, 13 Dec 2022 00:18:01 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4syy-00894i-T1
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 00:17:19 +0000
Received: by mail-pl1-x649.google.com with SMTP id u10-20020a17090341ca00b001897a151311so11550257ple.8
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 16:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VfLoNklydv1Rx7BbDoYbdEShyybLFjnrLL1BXeied2s=;
        b=Np8Pq4oyEyyT2NyWGRKhWCpWIKtgc9sp8/et+JS0meGK40iG694E/NYaxXnGXI0TeV
         pAqfSNQC9vcFF79zhXWsirFoGVcn/ax8QgBGxRa1cPYoIDxMNNUz5Jy5AAULOm6SCGAc
         A2EcZLEvvZLS7jcBAxKT7lr/7OJrXxxqMEoWAQweL0OpkQpBF4AL+mTwyhLSigeUVQn6
         9Uvgy3sr74Bmqei662+yAOCZ0l8TL9YTXwynudahz8OX6nc2S0ETlzEpyU5P3RT68+za
         4pvvwlntGLripZEbM1cWf+TCuKTaMguNXMxoTUo9YXqHgb5qZ0Tn/RXjzCP4PZWndVdL
         rjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VfLoNklydv1Rx7BbDoYbdEShyybLFjnrLL1BXeied2s=;
        b=k8dn2Z87Z06lKYkjkREgr3MpDJVT9N+5+sp1Rn8CChxhwbXJbJkRwz3rlVrAXJmibN
         duSpKfJkif9MTCuXaIvpVB6zuOR/OcLGXyp/T5HAsRqNPBobUaBKqpDGWym9oAQ8xBpG
         8tgyIXwXgtsqS6Xy5/HOkzyMatNArgvjpadNEq5Xc1UtZ//7XsP17n/9dTLjxIb74elW
         YfJglkJBuE8h5jT0v4Re5L5yG2XuA4Qo9ossJmZdCe2FYzZwZxi8PfyMsOAZHhsDrT+8
         fGvJXSFj0Wrj9wMn9Y0RE55X4GUINIfRJE7joCIucR8fCMa55AgSH3Qf2laWuRf2jvw+
         FICA==
X-Gm-Message-State: ANoB5pnqz6aT6LQmfJxYkBxUfhyjag8CZsrmaM2jn/GuP+I1Zpn3pr+9
	/KbfGyb9787tLuytihBO0mWResmAMP0=
X-Google-Smtp-Source: AA0mqf7S5eF8bMFJxVX+zccSnQS8wrFbP/BiB/u3t9DV1AwKakqfaO4vcQavHYooXhlu853wx6mxrrDMel4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:1010:b0:219:1d0a:34a6 with SMTP id
 gm16-20020a17090b101000b002191d0a34a6mr4049pjb.1.1670890621685; Mon, 12 Dec
 2022 16:17:01 -0800 (PST)
Date: Tue, 13 Dec 2022 00:16:42 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-4-seanjc@google.com>
Subject: [PATCH 03/14] KVM: selftests: Fix divide-by-zero bug in memslot_perf_test
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
X-CRM114-CacheID: sfid-20221212_161716_959188_1EC73B9C 
X-CRM114-Status: UNSURE (   7.80  )
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

Check that the number of pages per slot is non-zero in get_max_slots()
prior to computing the remaining number of pages.  clang generates code
that uses an actual DIV for calculating the remaining, which causes a #DE
if the total number of pages is less than the number of slots.

  traps: memslot_perf_te[97611] trap divide error ip:4030c4 sp:7ffd18ae58f0
         error:0 in memslot_perf_test[401000+cb000]

Fixes: a69170c65acd ("KVM: selftests: memslot_perf_test: Report optimal memory slots")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/memslot_perf_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index e698306bf49d..e6587e193490 100644
--- a/tools/testing/selftests/kvm/memslot_perf_test.c
+++ b/tools/testing/selftests/kvm/memslot_perf_test.c
@@ -265,6 +265,9 @@ static uint64_t get_max_slots(struct vm_data *data, uint32_t host_page_size)
 	slots = data->nslots;
 	while (--slots > 1) {
 		pages_per_slot = mempages / slots;
+		if (!pages_per_slot)
+			continue;
+
 		rempages = mempages % pages_per_slot;
 		if (check_slot_pages(host_page_size, guest_page_size,
 				     pages_per_slot, rempages))
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
