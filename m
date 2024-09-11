Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2EBEE57D7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 20:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MG7CndS7RmdMqCBukW7qEfrltAJ2RYBFa4gnWOKmx8=; b=isqyuUzYm21mf/
	QV/9hRKSP/XsV8EiLTszMJ8p9niD14aGu6fUY6rF/esnwQ0gZm0ws3558S5M9HKHLqQ7RUTCGm7PY
	fjphwwFWSV30zpmQg638z5nO7qvIh8JnrBGd3MdwatqXouvUcny9GRW9BuVMlzhFVoX9V117AQb9l
	bV7qXXy/qL85AoDyLsueOOGI46wNwZkNi9ePwhuNy9R5NtWR7Yr0wW8MuXA47UaXskxKmRxmJ54sO
	vDzDWUEAnZsnWOEtxH+DlZGDaE6YL5eVoeiSgX84nHE5Ovuygc+XV0RzD68DVI+pMB8Jpo1kRM3K2
	gCdbNtL2KSgJJu7r4OVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soULH-0000000Azyz-3WP8;
	Wed, 11 Sep 2024 20:53:35 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUAi-0000000Ax5V-3YKd
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 20:42:43 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7d4f9974c64so537496a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 13:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726087359; x=1726692159; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4Mm6F1KdfaC470dFwf81yhaZh6FdF3AX9IDG0p0k3Sc=;
        b=RXsGASBt5mH/4PjMruBhEd160LNNi9QQ/6fFRD1V/6R0/jTMvGXG6cEhj8X7PyO+a7
         BLlCQTWryeOJqa+mTyKBu7MpBOK1e6ZsrcHP5TSLy9wu1n8YZEaCnKLGTP0pVhMRmD0r
         5TvXKE4zA2a0uoPK/iqraHCq1NOyLGYWYPUS9vSKP1DSOni13jbF4SNczjIEk2bRUgcS
         GE8aoub+i/9Of3nz3O+yHM+TYV0la9wI4fXwCJTZH5SQyCj68cUN8YmIBmrGX/oJyYoK
         h0QeUsRJCa9j/7jr2Hr6NnH3RuIp/p2XXwSmOOcKeYmQrZDttfNwXcvpi3Kv4jsmahTH
         rHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726087359; x=1726692159;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Mm6F1KdfaC470dFwf81yhaZh6FdF3AX9IDG0p0k3Sc=;
        b=tmV3FzL608cMHo3wRjv5+VLM3gPx+XcEDGTHy/MKigPvZkzF3qOXdQ4fIOZDs7KtUv
         CpktxUla19e0IiH7hlahaxHgzEEzNKG/8KSZ5tQeiGUWm1ENTOj/1Ndedb32OHWq3Ox5
         de0sT6tTcBHtseD2oP8LM2GESHEiUZqvMOEOWLKjcK1vSgqI9jZ2uVP0VJX02YHmegVX
         RJKuXmck699LfTnaKpDXN+Xr4cmMBSTlIZIpumlfKHpMIZmg/dEpbRx+cm1JeI+pY2eR
         T1nWf05esjcEetXZnftYqQJT6312igJARX7d0zCsUKTnL0zvqVqk8VuG4obWESu821jO
         Wrdg==
X-Forwarded-Encrypted: i=1; AJvYcCX+BdI7DYCowFidNSkcHd/MOmMVoW7wihlxKd966K2dK6ml2d6s1YVhiJW1RCwgxF+9bsTQvdXAs1DYVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwirxxAoA9l/f5eBuX+xGr27rlWmvFY7UNFmOIHLISYm4/LpunB
	0r49e9NRfikXFpot7codK26LP7LEU0JSbO6mck8lTiaber2ZauwaEFRvUX8DbtUnmg42Rt4MMSy
	k6w==
X-Google-Smtp-Source: AGHT+IH2JHcNsNqRshbivfFJlAxw7IQtkbHmI9wZd8VBGGSLJ0WTJqdKfu0VETV264VsvIEa8GzsVh026XU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:4a5:b0:7db:18fc:3068 with SMTP id
 41be03b00d2f7-7db205d627emr1361a12.5.1726087359304; Wed, 11 Sep 2024 13:42:39
 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:41:54 -0700
In-Reply-To: <20240911204158.2034295-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911204158.2034295-10-seanjc@google.com>
Subject: [PATCH v2 09/13] KVM: selftests: Enable mmu_stress_test on arm64
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
X-CRM114-CacheID: sfid-20240911_134240_934387_C371D4E4 
X-CRM114-Status: UNSURE (   7.94  )
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

Enable the mmu_stress_test on arm64.  The intent was to enable the test
across all architectures when it was first added, but a few goofs made it
unrunnable on !x86.  Now that those goofs are fixed, at least for arm64,
enable the test.

Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 93d6e2596b3e..5150fad7a8c0 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -174,6 +174,7 @@ TEST_GEN_PROGS_aarch64 += kvm_create_max_vcpus
 TEST_GEN_PROGS_aarch64 += kvm_page_table_test
 TEST_GEN_PROGS_aarch64 += memslot_modification_stress_test
 TEST_GEN_PROGS_aarch64 += memslot_perf_test
+TEST_GEN_PROGS_aarch64 += mmu_stress_test
 TEST_GEN_PROGS_aarch64 += rseq_test
 TEST_GEN_PROGS_aarch64 += set_memory_region_test
 TEST_GEN_PROGS_aarch64 += steal_time
-- 
2.46.0.598.g6f2099f65c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
